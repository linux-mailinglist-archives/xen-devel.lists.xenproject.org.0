Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BC81ED889
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 00:23:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgbmT-0004ZP-TY; Wed, 03 Jun 2020 22:22:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0WRj=7Q=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jgbmS-0004ZK-Da
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 22:22:40 +0000
X-Inumbo-ID: bc40f006-a5e8-11ea-9dbe-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc40f006-a5e8-11ea-9dbe-bc764e2007e4;
 Wed, 03 Jun 2020 22:22:40 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0902F2067B;
 Wed,  3 Jun 2020 22:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591222959;
 bh=FbZizFCbXTo82zhp90elPXeQrp3LeJltCz9UBkieMa0=;
 h=Date:From:To:cc:Subject:From;
 b=UliQ4Xc0s6kZlNyoqhnZToK1IzE2Oj4wUjDuW8fE4ZVtpg23emU+hIIetm/p3gS6X
 I5fikv0SrWzGlcMWVVAA/OXGN5h8aK+xYKoyKk0nyhLQCEVjiGuNTKdL5S/YGdf+Y6
 zofhZFz2KDHQnFwvSm3nSU0DF9MBACdKFzRLyvTM=
Date: Wed, 3 Jun 2020 15:22:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: jgross@suse.com, boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Subject: [PATCH v2 00/11] fix swiotlb-xen for RPi4
Message-ID: <alpine.DEB.2.21.2006031506590.6774@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, tamas@tklengyel.com,
 linux-kernel@vger.kernel.org, roman@zededa.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi all,

This series is a collection of fixes to get Linux running on the RPi4 as
dom0.

Conceptually there are only two significant changes:

- make sure not to call virt_to_page on vmalloc virt addresses (patch
  #1)
- use phys_to_dma and dma_to_phys to translate phys to/from dma
  addresses (all other patches)

In particular in regards to the second part, the RPi4 is the first
board where Xen can run that has the property that dma addresses are
different from physical addresses, and swiotlb-xen was written with the
assumption that phys addr == dma addr.

This series adds the phys_to_dma and dma_to_phys calls to make it work.

Cheers,

Stefano



The following changes since commit b85051e755b0e9d6dd8f17ef1da083851b83287d:

  Merge tag 'fixes-for-5.7-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux (2020-05-20 13:23:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sstabellini/xen.git fix-rpi4-v2 

for you to fetch changes up to 49783ba67f75da3490d2c01ed9b445d8a89bbb0d:

  xen/arm: call dma_to_phys on the dma_addr_t parameter of dma_cache_maint (2020-06-03 15:05:53 -0700)

----------------------------------------------------------------
Boris Ostrovsky (1):
      swiotlb-xen: use vmalloc_to_page on vmalloc virt addresses

Stefano Stabellini (10):
      swiotlb-xen: remove start_dma_addr
      swiotlb-xen: add struct device* parameter to xen_phys_to_bus
      swiotlb-xen: add struct device* parameter to xen_bus_to_phys
      swiotlb-xen: add struct device* parameter to xen_dma_sync_for_cpu
      swiotlb-xen: add struct device* parameter to xen_dma_sync_for_device
      swiotlb-xen: add struct device* parameter to is_xen_swiotlb_buffer
      swiotlb-xen: introduce phys_to_dma/dma_to_phys translations
      swiotlb-xen: rename xen_phys_to_bus to xen_phys_to_dma and xen_bus_to_phys to xen_dma_to_phys
      xen/arm: introduce phys/dma translations in xen_dma_sync_for_*
      xen/arm: call dma_to_phys on the dma_addr_t parameter of dma_cache_maint

 arch/arm/xen/mm.c         | 32 +++++++++++++++++++-------------
 drivers/xen/swiotlb-xen.c | 72 +++++++++++++++++++++++++++++++++++++-----------------------------------
 include/xen/swiotlb-xen.h | 10 ++++++----
 3 files changed, 62 insertions(+), 52 deletions(-)


