Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF3F23E6F6
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 07:06:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3uYo-0005AY-8K; Fri, 07 Aug 2020 05:04:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yQGK=BR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k3uYm-0005AT-NJ
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 05:04:52 +0000
X-Inumbo-ID: 13fd974c-96ca-4876-95d4-97010c12b47b
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 13fd974c-96ca-4876-95d4-97010c12b47b;
 Fri, 07 Aug 2020 05:04:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C7F1DAB8B;
 Fri,  7 Aug 2020 05:05:08 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Subject: [GIT PULL] xen: branch for v5.9-rc1
Date: Fri,  7 Aug 2020 07:04:50 +0200
Message-Id: <20200807050450.7517-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 linux-kernel@vger.kernel.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.9-rc1-tag

xen: branch for v5.9-rc1

It contains the following:

- two trivial comment fixes
- A small series for the Xen balloon driver fixing some issues
- A series of the Xen privcmd driver targeting elimination of using
  get_user_pages*() in this driver
- A series for the Xen swiotlb driver cleaning it up and adding support
  for letting the kernel run as dom0 on Rpi4


Thanks.

Juergen

 arch/arm/xen/mm.c                    |  34 +++++-----
 arch/x86/include/asm/xen/hypercall.h |   2 +-
 drivers/xen/balloon.c                |  26 +++-----
 drivers/xen/privcmd.c                |  32 +++++-----
 drivers/xen/swiotlb-xen.c            | 119 +++++++++++++++++++++--------------
 include/uapi/xen/gntdev.h            |   2 +-
 include/xen/page.h                   |   1 -
 include/xen/swiotlb-xen.h            |   8 +--
 8 files changed, 119 insertions(+), 105 deletions(-)

Boris Ostrovsky (1):
      swiotlb-xen: use vmalloc_to_page on vmalloc virt addresses

Randy Dunlap (2):
      xen/gntdev: gntdev.h: drop a duplicated word
      xen: hypercall.h: fix duplicated word

Roger Pau Monne (3):
      xen/balloon: fix accounting in alloc_xenballooned_pages error path
      xen/balloon: make the balloon wait interruptible
      Revert "xen/balloon: Fix crash when ballooning on x86 32 bit PAE"

Souptick Joarder (3):
      xen/privcmd: Corrected error handling path
      xen/privcmd: Mark pages as dirty
      xen/privcmd: Convert get_user_pages*() to pin_user_pages*()

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

