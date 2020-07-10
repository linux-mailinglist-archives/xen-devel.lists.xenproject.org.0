Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 693E821BFE2
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jul 2020 00:34:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ju1b3-0005vJ-No; Fri, 10 Jul 2020 22:34:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=idFW=AV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ju1b2-0005vE-Hn
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2020 22:34:20 +0000
X-Inumbo-ID: 7e7dd7ca-c2fd-11ea-903c-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7e7dd7ca-c2fd-11ea-903c-12813bfff9fa;
 Fri, 10 Jul 2020 22:34:19 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9CD5C20720;
 Fri, 10 Jul 2020 22:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594420459;
 bh=30tMeSPdpSpzi9JMvJiPg87Z492wFVcJ870fYtV5zZQ=;
 h=Date:From:To:cc:Subject:From;
 b=Pw2KlUzZl4LpIy2xtWqNZk6KKD9pfLyg08tNZvDitK+/OGlAAkx2eGh0w/G6sD1pp
 qR2XHpnwwbJHysHRwhK/G42ZbVPzC3jOPtnW3QqHPQmSyltqJeX0y49vaJ8+J0YM7O
 xNtCHhTP/6SAsY0ESmmxCgCDbFBAdbmoyzak/Mpo=
Date: Fri, 10 Jul 2020 15:34:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: jgross@suse.com, boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Subject: [PATCH v3 00/11] fix swiotlb-xen for RPi4
Message-ID: <alpine.DEB.2.21.2007101521290.4124@sstabellini-ThinkPad-T480s>
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
Cc: sstabellini@kernel.org, roman@zededa.com, linux-kernel@vger.kernel.org,
 hch@infradead.org, tamas@tklengyel.com, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi all,

This series is a collection of fixes to get Linux running on the RPi4 as
dom0. Conceptually there are only two significant changes:

- make sure not to call virt_to_page on vmalloc virt addresses (patch
  #1)
- use phys_to_dma and dma_to_phys to translate phys to/from dma
  addresses (all other patches)


I addressed all comments by Christoph to v2 of the series except from
the one about merging the precursor "add struct device *" patches. I can
always merge them together at any time as needed.


Boris gave his Reviewed-by to the whole series v2. I added his
Reviewed-by to all patches, including the ones with small cosmetic
fixes, except for patch #8 #9 #10 because they are either new or changed
significantly in this version of the series.

I retained Roman and Corey's Tested-by.


Cheers,

Stefano


git://git.kernel.org/pub/scm/linux/kernel/git/sstabellini/xen.git fix-rpi4-v3


Boris Ostrovsky (1):
      swiotlb-xen: use vmalloc_to_page on vmalloc virt addresses

Stefano Stabellini (10):
      swiotlb-xen: remove start_dma_addr
      swiotlb-xen: add struct device * parameter to xen_phys_to_bus
      swiotlb-xen: add struct device * parameter to xen_bus_to_phys
      swiotlb-xen: add struct device * parameter to xen_dma_sync_for_cpu
      swiotlb-xen: add struct device * parameter to xen_dma_sync_for_device
      swiotlb-xen: add struct device * parameter to is_xen_swiotlb_buffer
      swiotlb-xen: remove XEN_PFN_PHYS
      swiotlb-xen: introduce phys_to_dma/dma_to_phys translations
      xen/arm: introduce phys/dma translations in xen_dma_sync_for_*
      xen/arm: call dma_to_phys on the dma_addr_t parameter of dma_cache_maint

 arch/arm/xen/mm.c         |  34 +++++++++++++++----------------
 drivers/xen/swiotlb-xen.c | 119 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------------------------------------------
 include/xen/page.h        |   1 -
 include/xen/swiotlb-xen.h |   8 ++++----
 4 files changed, 93 insertions(+), 69 deletions(-)

