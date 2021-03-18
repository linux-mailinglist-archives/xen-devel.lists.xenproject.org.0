Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7366B3410FF
	for <lists+xen-devel@lfdr.de>; Fri, 19 Mar 2021 00:29:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99099.188254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lN23x-00005F-Mj; Thu, 18 Mar 2021 23:28:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99099.188254; Thu, 18 Mar 2021 23:28:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lN23x-0008WT-J5; Thu, 18 Mar 2021 23:28:21 +0000
Received: by outflank-mailman (input) for mailman id 99099;
 Thu, 18 Mar 2021 23:28:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g2yR=IQ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lN23w-0008WO-Cn
 for xen-devel@lists.xenproject.org; Thu, 18 Mar 2021 23:28:20 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d756e0cf-5c36-49b5-aafc-67b344543687;
 Thu, 18 Mar 2021 23:28:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 512BE64F30;
 Thu, 18 Mar 2021 23:28:18 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: d756e0cf-5c36-49b5-aafc-67b344543687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1616110098;
	bh=exYUfoIUBvnRcJr3UssflJUi1hyTbpqC7KzxYXBGsO0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cLGL4vEKQ5qn1seTIdNogIzFV+v7BYcNxLW74grg7a+VTBV/41lHH1gQGyJNQOFkD
	 8IGJVHbq3YHSdrR2EpgnFrD5V9Cm37sPFNuoy01jHTq3FFV7387DcHJzhV2w4tHF55
	 LfylDw+kb37TvL9ezR7qJ3lRU50ohsQe9uY4YV8TLTjUXLGLvlZNVxG+EWPoZk7P21
	 VuVFIxpJDqrgUwUkCjL858dzXpegRtezJtzyo0yzMqjvTY+gt7DoSfU8wV2ZPQUBdj
	 1BoMH9H6Vpxvw3fVUVZ53N4JjhQm+pFRWPk9ovCfj+c4GlCDRxsOUnVMkAYfDnXfUf
	 F2k0xp3ZJf2Bg==
Date: Thu, 18 Mar 2021 16:28:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, jgross@suse.com, 
    xen-devel@lists.xenproject.org, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH] xen/arm: introduce XENFEAT_direct_mapped and
 XENFEAT_not_direct_mapped
In-Reply-To: <4707b219-eee1-22e8-8dd3-6b7d821de333@oracle.com>
Message-ID: <alpine.DEB.2.21.2103181612260.439@sstabellini-ThinkPad-T480s>
References: <20210225235158.24001-1-sstabellini@kernel.org> <4707b219-eee1-22e8-8dd3-6b7d821de333@oracle.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-776278941-1616110098=:439"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-776278941-1616110098=:439
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 17 Mar 2021, Boris Ostrovsky wrote:
> On 2/25/21 6:51 PM, Stefano Stabellini wrote:
> > Newer Xen versions expose two Xen feature flags to tell us if the domain
> > is directly mapped or not. Only when a domain is directly mapped it
> > makes sense to enable swiotlb-xen on ARM.
> >
> > Introduce a function on ARM to check the new Xen feature flags and also
> > to deal with the legacy case. Call the function xen_swiotlb_detect.
> >
> > Also rename the existing pci_xen_swiotlb_detect on x86 to
> > xen_swiotlb_detect so that we can share a common function declaration.
> >
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > ---
> >
> > This is the corresponding Xen patch under review:
> > https://marc.info/?l=xen-devel&m=161421618217686
> >
> > We don't *have to* make the x86 function and the ARM function exactly
> > the same, but I thought it would be much nicer if we did. However, we
> > can't really call it pci_* on ARM as there is no PCI necessarily.
> 
> 
> I would prefer to keep existing names for consistency on x86 side (but making that inconsistent with ARM, as you point out).  But if you feel strongly about making the change you would have to have x86 maintainers agree to this (arch/x86/kernel/pci-swiotlb.c).

OK. And from an x86 point of view, it makes sense for it to be called
pci_xen_swiotlb_detect given that it is passed to IOMMU_INIT_FINISH in
arch/x86/kernel/pci-swiotlb.c.

So, I'll follow you suggestion, keep the x86 side named as it is today,
and provide a tiny wrapper so that we can still have an arch-neutral
xen_swiotlb_detect function (on x86 just calls pci_xen_swiotlb_detect.)

See below.


From 5f6c91990df1e834c78501799905b04916105836 Mon Sep 17 00:00:00 2001
From: Stefano Stabellini <stefano.stabellini@xilinx.com>
Date: Thu, 18 Mar 2021 16:17:21 -0700
Subject: [PATCH] xen/arm: introduce XENFEAT_direct_mapped and
 XENFEAT_not_direct_mapped

Newer Xen versions expose two Xen feature flags to tell us if the domain
is directly mapped or not. Only when a domain is directly mapped it
makes sense to enable swiotlb-xen on ARM.

Introduce a function on ARM to check the new Xen feature flags and also
to deal with the legacy case. Call the function xen_swiotlb_detect.

Also implement xen_swiotlb_detect on x88 using the existing
pci_xen_swiotlb_detect() so that we can share a common function
declaration.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 arch/arm/xen/mm.c                      | 14 +++++++++++++-
 arch/arm64/mm/dma-mapping.c            |  2 +-
 arch/x86/include/asm/xen/swiotlb-xen.h |  4 ++--
 arch/x86/xen/pci-swiotlb-xen.c         |  7 ++++++-
 include/xen/interface/features.h       | 14 ++++++++++++++
 include/xen/swiotlb-xen.h              |  6 ++++++
 6 files changed, 42 insertions(+), 5 deletions(-)

diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
index 467fa225c3d0..e1b12b242a32 100644
--- a/arch/arm/xen/mm.c
+++ b/arch/arm/xen/mm.c
@@ -135,10 +135,22 @@ void xen_destroy_contiguous_region(phys_addr_t pstart, unsigned int order)
 	return;
 }
 
+int xen_swiotlb_detect(void)
+{
+	if (!xen_domain())
+		return 0;
+	if (xen_feature(XENFEAT_direct_mapped))
+		return 1;
+	/* legacy case */
+	if (!xen_feature(XENFEAT_not_direct_mapped) && xen_initial_domain())
+		return 1;
+	return 0;
+}
+
 static int __init xen_mm_init(void)
 {
 	struct gnttab_cache_flush cflush;
-	if (!xen_initial_domain())
+	if (!xen_swiotlb_detect())
 		return 0;
 	xen_swiotlb_init(1, false);
 
diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
index 93e87b287556..4bf1dd3eb041 100644
--- a/arch/arm64/mm/dma-mapping.c
+++ b/arch/arm64/mm/dma-mapping.c
@@ -53,7 +53,7 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
 		iommu_setup_dma_ops(dev, dma_base, size);
 
 #ifdef CONFIG_XEN
-	if (xen_initial_domain())
+	if (xen_swiotlb_detect())
 		dev->dma_ops = &xen_swiotlb_dma_ops;
 #endif
 }
diff --git a/arch/x86/include/asm/xen/swiotlb-xen.h b/arch/x86/include/asm/xen/swiotlb-xen.h
index 6b56d0d45d15..66d576486509 100644
--- a/arch/x86/include/asm/xen/swiotlb-xen.h
+++ b/arch/x86/include/asm/xen/swiotlb-xen.h
@@ -4,12 +4,12 @@
 
 #ifdef CONFIG_SWIOTLB_XEN
 extern int xen_swiotlb;
-extern int __init pci_xen_swiotlb_detect(void);
+extern int pci_xen_swiotlb_detect(void);
 extern void __init pci_xen_swiotlb_init(void);
 extern int pci_xen_swiotlb_init_late(void);
 #else
 #define xen_swiotlb (0)
-static inline int __init pci_xen_swiotlb_detect(void) { return 0; }
+static inline int pci_xen_swiotlb_detect(void) { return 0; }
 static inline void __init pci_xen_swiotlb_init(void) { }
 static inline int pci_xen_swiotlb_init_late(void) { return -ENXIO; }
 #endif
diff --git a/arch/x86/xen/pci-swiotlb-xen.c b/arch/x86/xen/pci-swiotlb-xen.c
index 19ae3e4fe4e9..0555f68a773f 100644
--- a/arch/x86/xen/pci-swiotlb-xen.c
+++ b/arch/x86/xen/pci-swiotlb-xen.c
@@ -26,7 +26,7 @@ int xen_swiotlb __read_mostly;
  * This returns non-zero if we are forced to use xen_swiotlb (by the boot
  * option).
  */
-int __init pci_xen_swiotlb_detect(void)
+int pci_xen_swiotlb_detect(void)
 {
 
 	if (!xen_pv_domain())
@@ -56,6 +56,11 @@ int __init pci_xen_swiotlb_detect(void)
 	return xen_swiotlb;
 }
 
+int xen_swiotlb_detect(void)
+{
+	return pci_xen_swiotlb_detect();
+}
+
 void __init pci_xen_swiotlb_init(void)
 {
 	if (xen_swiotlb) {
diff --git a/include/xen/interface/features.h b/include/xen/interface/features.h
index 6d1384abfbdf..5a7bdefa06a8 100644
--- a/include/xen/interface/features.h
+++ b/include/xen/interface/features.h
@@ -83,6 +83,20 @@
  */
 #define XENFEAT_linux_rsdp_unrestricted   15
 
+/*
+ * A direct-mapped (or 1:1 mapped) domain is a domain for which its
+ * local pages have gfn == mfn. If a domain is direct-mapped,
+ * XENFEAT_direct_mapped is set; otherwise XENFEAT_not_direct_mapped
+ * is set.
+ *
+ * If neither flag is set (e.g. older Xen releases) the assumptions are:
+ * - not auto_translated domains (x86 only) are always direct-mapped
+ * - on x86, auto_translated domains are not direct-mapped
+ * - on ARM, Dom0 is direct-mapped, DomUs are not
+ */
+#define XENFEAT_not_direct_mapped         16
+#define XENFEAT_direct_mapped             17
+
 #define XENFEAT_NR_SUBMAPS 1
 
 #endif /* __XEN_PUBLIC_FEATURES_H__ */
diff --git a/include/xen/swiotlb-xen.h b/include/xen/swiotlb-xen.h
index d5eaf9d682b8..336356b61738 100644
--- a/include/xen/swiotlb-xen.h
+++ b/include/xen/swiotlb-xen.h
@@ -12,4 +12,10 @@ void xen_dma_sync_for_device(struct device *dev, dma_addr_t handle,
 extern int xen_swiotlb_init(int verbose, bool early);
 extern const struct dma_map_ops xen_swiotlb_dma_ops;
 
+#ifdef CONFIG_SWIOTLB_XEN
+extern int xen_swiotlb_detect(void);
+#else
+static inline int xen_swiotlb_detect(void) { return 0; }
+#endif
+
 #endif /* __LINUX_SWIOTLB_XEN_H */
-- 
2.17.1

--8323329-776278941-1616110098=:439--

