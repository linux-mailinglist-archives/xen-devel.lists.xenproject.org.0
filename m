Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCEA31D3E2
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 03:01:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86096.161230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCC9G-0000cm-A4; Wed, 17 Feb 2021 02:01:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86096.161230; Wed, 17 Feb 2021 02:01:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCC9G-0000cQ-73; Wed, 17 Feb 2021 02:01:02 +0000
Received: by outflank-mailman (input) for mailman id 86096;
 Wed, 17 Feb 2021 02:01:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RvmJ=HT=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lCC9E-0000cL-IS
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 02:01:00 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0c52f67a-e934-4578-ad52-b3876bb01e7c;
 Wed, 17 Feb 2021 02:00:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F185461490;
 Wed, 17 Feb 2021 02:00:58 +0000 (UTC)
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
X-Inumbo-ID: 0c52f67a-e934-4578-ad52-b3876bb01e7c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613527259;
	bh=lCB1K9uBBMXlnp4KoJgH5VnUKB9q33drNtgI1C16sO8=;
	h=Date:From:To:cc:Subject:From;
	b=pGwA5+jmwgoHhBT1B3Yf0mMT6h5uBcYOyl6LTECyO8U0gTOEuaAB088225J7tzg3I
	 8XBggWjyazDMdlf7F8Dho+9K1phbMg6At2bt0cJx4KW1PMJz7rA43AXfYwGANUztuN
	 O8P36zSMAIv4JOxjooiYcQ4PhP46HH5pFTcxTYOlJTu7twdgePf35vWIB+5yWfGOvS
	 TaTmu9TZy3C0U/wKKiwOOPGGTB1ErSczaY30dP17hubPyomvV8KwpsAlfSSY3DoUwh
	 V6SNI0jwHD2uiYHUaVgpMAX+qRYcVe7cOPNbfoTT0n3JV9szFYE1UJC0g8+F8AqmlA
	 I33z8pJMCpe8g==
Date: Tue, 16 Feb 2021 18:00:57 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: julien@xen.org
cc: sstabellini@kernel.org, xen-devel@lists.xenproject.org, 
    Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com, rahul.singh@arm.com
Subject: [RFC] xen/arm: introduce XENFEAT_ARM_dom0_iommu
Message-ID: <alpine.DEB.2.21.2102161333090.3234@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

Today Linux uses the swiotlb-xen driver (drivers/xen/swiotlb-xen.c) to
translate addresses for DMA operations in Dom0. Specifically,
swiotlb-xen is used to translate the address of a foreign page (a page
belonging to a domU) mapped into Dom0 before using it for DMA.

This is important because although Dom0 is 1:1 mapped, DomUs are not. On
systems without an IOMMU swiotlb-xen enables PV drivers to work as long
as the backends are in Dom0. Thanks to swiotlb-xen, the DMA operation
ends up using the MFN, rather than the GFN.


On systems with an IOMMU, this is not necessary: when a foreign page is
mapped in Dom0, it is added to the Dom0 p2m. A new GFN->MFN translation
is enstablished for both MMU and SMMU. Dom0 could safely use the GFN
address (instead of the MFN) for DMA operations and they would work. It
would be more efficient than using swiotlb-xen.

If you recall my presentation from Xen Summit 2020, Xilinx is working on
cache coloring. With cache coloring, no domain is 1:1 mapped, not even
Dom0. In a scenario where Dom0 is not 1:1 mapped, swiotlb-xen does not
work as intended.


The suggested solution for both these issues is to add a new feature
flag "XENFEAT_ARM_dom0_iommu" that tells Dom0 that it is safe not to use
swiotlb-xen because IOMMU translations are available for Dom0. If
XENFEAT_ARM_dom0_iommu is set, Linux should skip the swiotlb-xen
initialization. I have tested this scheme with and without cache
coloring (hence with and without 1:1 mapping of Dom0) on ZCU102 and it
works as expected: DMA operations succeed.


What about systems where an IOMMU is present but not all devices are
protected?

There is no way for Xen to know which devices are protected and which
ones are not: devices that do not have the "iommus" property could or
could not be DMA masters.

Perhaps Xen could populate a whitelist of devices protected by the IOMMU
based on the "iommus" property. It would require some added complexity
in Xen and especially in the swiotlb-xen driver in Linux to use it,
which is not ideal. However, this approach would not work for cache
coloring where dom0 is not 1:1 mapped so the swiotlb-xen should not be
used either way.


For these reasons, I would like to propose a single flag
XENFEAT_ARM_dom0_iommu which says that the IOMMU can be relied upon for
DMA translations. In situations where a DMA master is not SMMU
protected, XENFEAT_ARM_dom0_iommu should not be set. For example, on a
platform where an IOMMU is present and protects most DMA masters but it
is leaving out the MMC controller, then XENFEAT_ARM_dom0_iommu should
not be set (because PV block is not going to work without swiotlb-xen.)
This also means that cache coloring won't be usable on such a system (at
least not usable with the MMC controller so the system integrator should
pay special care to setup the system).

It is worth noting that if we wanted to extend the interface to add a
list of protected devices in the future, it would still be possible. It
would be compatible with XENFEAT_ARM_dom0_iommu.


How to set XENFEAT_ARM_dom0_iommu?

We could set XENFEAT_ARM_dom0_iommu automatically when
is_iommu_enabled(d) for Dom0. We could also have a platform specific
(xen/arch/arm/platforms/) override so that a specific platform can
disable XENFEAT_ARM_dom0_iommu. For debugging purposes and advanced
users, it would also be useful to be able to override it via a Xen
command line parameter.

See appended patch as a reference.


Cheers,

Stefano


diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index 7a345ae45e..4dbef48199 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -16,6 +16,7 @@
 #include <xen/hypfs.h>
 #include <xsm/xsm.h>
 #include <asm/current.h>
+#include <asm/platform.h>
 #include <public/version.h>
 
 #ifndef COMPAT
@@ -549,6 +550,9 @@ DO(xen_version)(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
                 fi.submap |= 1U << XENFEAT_dom0;
 #ifdef CONFIG_ARM
             fi.submap |= (1U << XENFEAT_ARM_SMCCC_supported);
+            if ( !platform_has_quirk(PLATFORM_QUIRK_DOM0_IOMMU) &&
+                 is_hardware_domain(d) && is_iommu_enabled(d) )
+                fi.submap |= (1U << XENFEAT_ARM_dom0_iommu);
 #endif
 #ifdef CONFIG_X86
             if ( is_pv_domain(d) )
diff --git a/xen/include/asm-arm/platform.h b/xen/include/asm-arm/platform.h
index 997eb25216..094a76d677 100644
--- a/xen/include/asm-arm/platform.h
+++ b/xen/include/asm-arm/platform.h
@@ -48,6 +48,11 @@ struct platform_desc {
  * stride.
  */
 #define PLATFORM_QUIRK_GIC_64K_STRIDE (1 << 0)
+/*
+ * Quirk for platforms where the IOMMU is present but doesn't protect
+ * all DMA-capable devices.
+ */
+#define PLATFORM_QUIRK_DOM0_IOMMU (1 << 1)
 
 void platform_init(void);
 int platform_init_time(void);
diff --git a/xen/include/asm-x86/platform.h b/xen/include/asm-x86/platform.h
new file mode 100644
index 0000000000..5427e8b851
--- /dev/null
+++ b/xen/include/asm-x86/platform.h
@@ -0,0 +1,13 @@
+#ifndef __ASM_X86_PLATFORM_H
+#define __ASM_X86_PLATFORM_H
+
+#endif /* __ASM_X86_PLATFORM_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/public/features.h b/xen/include/public/features.h
index 1613b2aab8..adaa2a995d 100644
--- a/xen/include/public/features.h
+++ b/xen/include/public/features.h
@@ -114,6 +114,11 @@
  */
 #define XENFEAT_linux_rsdp_unrestricted   15
 
+/*
+ * arm: dom0 is started with IOMMU protection.
+ */
+#define XENFEAT_ARM_dom0_iommu            16
+
 #define XENFEAT_NR_SUBMAPS 1
 
 #endif /* __XEN_PUBLIC_FEATURES_H__ */

