Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 631279E6680
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 05:51:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849579.1264247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQJL-0001hS-MC; Fri, 06 Dec 2024 04:51:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849579.1264247; Fri, 06 Dec 2024 04:51:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQJL-0001eL-IM; Fri, 06 Dec 2024 04:51:27 +0000
Received: by outflank-mailman (input) for mailman id 849579;
 Fri, 06 Dec 2024 04:51:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5aHD=S7=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tJQA6-0004Kb-0S
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 04:41:54 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 645bba61-b38c-11ef-99a3-01e77a169b0f;
 Fri, 06 Dec 2024 05:41:43 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D40125C7332;
 Fri,  6 Dec 2024 04:40:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7635CC4CED1;
 Fri,  6 Dec 2024 04:41:39 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE1EE7717B;
 Fri,  6 Dec 2024 04:41:39 +0000 (UTC)
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
X-Inumbo-ID: 645bba61-b38c-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733460099;
	bh=YfYCHh0nVVhyUMXcW2poOpCSgAUn/qfDmEJPr0RM4oY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hLzR8gjhUR9ZFUJQotca4vwtdhYWQR4FQmZw4JZ9FrUQk3G0R+E/fXtA2T4uMxAvX
	 OsCNkp0nm4UcV8js+vw6dyZaYIhRYqsnygSw1jnN7xcFiKOcyIfHyfURenDULiECwS
	 iw62GTjHbFfm20AsCPNiyc+gpyuqC6zwnZ5Zt/C/LLHcapQkpERfhLFdrJM+2uyD6n
	 sLBQFTdNnxReWackH13DdEFWaFllSrF9jBT7mk5HR+49vmESu/256p7BCRow9Laudz
	 IG8GfzlznJNF3H8i0Kqsr8QAeBx0pis+myiRmmsIY2mTGOsgB4vb6NJyUh5yGivzc9
	 ZY5NF2Kkkr5OA==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Thu, 05 Dec 2024 20:42:03 -0800
Subject: [PATCH v2 33/35] x86/domain: implement domain_has_vuart()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-vuart-ns8250-v1-33-e9aa923127eb@ford.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
In-Reply-To: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733460095; l=7401;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=tfiJLSOur1vSXiemSyjr8enIFIEF26fIRGrdEEwbY18=;
 b=VUVl57v6//L3I+BVOtYyFg49j9VIti9hgqIArW35Tvfb1KnFjpdoyqXsMGsyn7IqjVEgKnwMC
 PbyvHwuU4uVDf9Jg3XNoX0yzmMarqvvv+SMIcmGTCTCKalKac3WS555
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

Add new emulation flag for virtual UART on x86 and plumb it through the stack.

This change enables NS8250 emulator initialization.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 tools/libs/light/libxl_x86.c      |  6 +++++-
 tools/ocaml/libs/xc/xenctrl.ml    |  1 +
 tools/ocaml/libs/xc/xenctrl.mli   |  1 +
 tools/python/xen/lowlevel/xc/xc.c |  4 +---
 xen/arch/x86/domain.c             |  8 +++++---
 xen/arch/x86/include/asm/domain.h |  7 ++++---
 xen/include/public/arch-x86/xen.h | 14 +++++++++++++-
 7 files changed, 30 insertions(+), 11 deletions(-)

diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index a3164a3077fec7e1b81a34074894dc646954a49a..de5f05e18cb0671bb031b101b9a7159eb0fe0178 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -8,7 +8,11 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
 {
     switch(d_config->c_info.type) {
     case LIBXL_DOMAIN_TYPE_HVM:
-        config->arch.emulation_flags = (XEN_X86_EMU_ALL & ~XEN_X86_EMU_VPCI);
+        config->arch.emulation_flags = XEN_X86_EMU_ALL;
+        config->arch.emulation_flags &= ~XEN_X86_EMU_VPCI;
+        /* Virtual UART is selected at Xen build time */
+        config->arch.emulation_flags &= ~XEN_X86_EMU_VUART;
+
         if (!libxl_defbool_val(d_config->b_info.u.hvm.pirq))
             config->arch.emulation_flags &= ~XEN_X86_EMU_USE_PIRQ;
         break;
diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index 2690f9a92316b812ad3d3ff0e1c36823070adb4a..647239b3e55e88b00eb8e9773a5267894cbbae54 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -47,6 +47,7 @@ type x86_arch_emulation_flags =
   | X86_EMU_PIT
   | X86_EMU_USE_PIRQ
   | X86_EMU_VPCI
+  | X86_EMU_VUART
 
 type x86_arch_misc_flags =
   | X86_MSR_RELAXED
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index febbe1f6ae3f10c5abe45eaa3c06a8a67d9ba268..4f5f64c786e83e8a0c3dd3cdb0460f7095de4a62 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -41,6 +41,7 @@ type x86_arch_emulation_flags =
   | X86_EMU_PIT
   | X86_EMU_USE_PIRQ
   | X86_EMU_VPCI
+  | X86_EMU_VUART
 
 type x86_arch_misc_flags =
   | X86_MSR_RELAXED
diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowlevel/xc/xc.c
index 9feb12ae2b16e48cb5d0c3c45044ae226f152f2d..e54308956efc7061d58d2166ec9a95bc1dcd1781 100644
--- a/tools/python/xen/lowlevel/xc/xc.c
+++ b/tools/python/xen/lowlevel/xc/xc.c
@@ -159,9 +159,7 @@ static PyObject *pyxc_domain_create(XcObject *self,
 
 #if defined (__i386) || defined(__x86_64__)
     if ( config.flags & XEN_DOMCTL_CDF_hvm )
-        config.arch.emulation_flags = XEN_X86_EMU_ALL &
-                                      ~(XEN_X86_EMU_VPCI |
-                                        XEN_X86_EMU_USE_PIRQ);
+        config.arch.emulation_flags = XEN_X86_EMU_HVM_ALLOWABLE;
 #elif defined (__arm__) || defined(__aarch64__)
     config.arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
 #else
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index c88d422a64544531c1e1058fa484364bb4277d1e..439da7adc92a3a8eb481075bf834da5f9670dd54 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -752,10 +752,10 @@ static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
         if ( is_hardware_domain(d) &&
              emflags != (X86_EMU_VPCI | X86_EMU_LAPIC | X86_EMU_IOAPIC) )
             return false;
+
+        emflags &= ~X86_EMU_VUART;
         if ( !is_hardware_domain(d) &&
-             /* HVM PIRQ feature is user-selectable. */
-             (emflags & ~X86_EMU_USE_PIRQ) !=
-             (X86_EMU_ALL & ~(X86_EMU_VPCI | X86_EMU_USE_PIRQ)) &&
+             xen_emflags_allowable(emflags) != XEN_X86_EMU_HVM_ALLOWABLE &&
              emflags != X86_EMU_LAPIC )
             return false;
     }
@@ -806,6 +806,8 @@ int arch_domain_create(struct domain *d,
 
     emflags = config->arch.emulation_flags;
 
+    if ( IS_ENABLED(CONFIG_HAS_VUART_NS8250) && is_hvm_domain(d) )
+        emflags |= XEN_X86_EMU_VUART;
     if ( is_hardware_domain(d) && is_pv_domain(d) )
         emflags |= XEN_X86_EMU_PIT;
 
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index c1d0d1f47324e8cc678a4c76c43f86820a89e7b3..dacea6e1aad46e9f8710b2202bb81203c5e92807 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -484,7 +484,8 @@ struct arch_domain
 #define X86_EMU_VPCI     0
 #endif
 
-#define X86_EMU_PIT     XEN_X86_EMU_PIT
+#define X86_EMU_PIT      XEN_X86_EMU_PIT
+#define X86_EMU_VUART    XEN_X86_EMU_VUART
 
 /* This must match XEN_X86_EMU_ALL in xen.h */
 #define X86_EMU_ALL             (X86_EMU_LAPIC | X86_EMU_HPET |         \
@@ -492,7 +493,7 @@ struct arch_domain
                                  X86_EMU_IOAPIC | X86_EMU_PIC |         \
                                  X86_EMU_VGA | X86_EMU_IOMMU |          \
                                  X86_EMU_PIT | X86_EMU_USE_PIRQ |       \
-                                 X86_EMU_VPCI)
+                                 X86_EMU_VPCI | X86_EMU_VUART)
 
 #define has_vlapic(d)      (!!((d)->arch.emulation_flags & X86_EMU_LAPIC))
 #define has_vhpet(d)       (!!((d)->arch.emulation_flags & X86_EMU_HPET))
@@ -507,7 +508,7 @@ struct arch_domain
 #define has_vpci(d)        (!!((d)->arch.emulation_flags & X86_EMU_VPCI))
 
 /* NB: same symbol as in Arm port */
-#define domain_has_vuart(d) false
+#define domain_has_vuart(d) (!!((d)->arch.emulation_flags & X86_EMU_VUART))
 
 #define gdt_ldt_pt_idx(v) \
       ((v)->vcpu_id >> (PAGETABLE_ORDER - GDT_LDT_VCPU_SHIFT))
diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-x86/xen.h
index fc2487986642a7694578ab9d2f5f16d09761bff8..e7922e3f9ddc1742a464d228807279839df31e52 100644
--- a/xen/include/public/arch-x86/xen.h
+++ b/xen/include/public/arch-x86/xen.h
@@ -283,13 +283,25 @@ struct xen_arch_domainconfig {
 #define XEN_X86_EMU_USE_PIRQ        (1U<<_XEN_X86_EMU_USE_PIRQ)
 #define _XEN_X86_EMU_VPCI           10
 #define XEN_X86_EMU_VPCI            (1U<<_XEN_X86_EMU_VPCI)
+#define _XEN_X86_EMU_VUART          11
+#define XEN_X86_EMU_VUART           (1U<<_XEN_X86_EMU_VUART)
 
 #define XEN_X86_EMU_ALL             (XEN_X86_EMU_LAPIC | XEN_X86_EMU_HPET |  \
                                      XEN_X86_EMU_PM | XEN_X86_EMU_RTC |      \
                                      XEN_X86_EMU_IOAPIC | XEN_X86_EMU_PIC |  \
                                      XEN_X86_EMU_VGA | XEN_X86_EMU_IOMMU |   \
                                      XEN_X86_EMU_PIT | XEN_X86_EMU_USE_PIRQ |\
-                                     XEN_X86_EMU_VPCI)
+                                     XEN_X86_EMU_VPCI | XEN_X86_EMU_VUART)
+
+/* HVM PIRQ feature is user-selectable (libxl). */
+#define XEN_X86_EMU_HVM_SELECTABLE  (XEN_X86_EMU_VPCI | \
+                                     XEN_X86_EMU_USE_PIRQ | \
+                                     XEN_X86_EMU_VUART)
+
+#define xen_emflags_allowable(x)    ((x) & ~XEN_X86_EMU_HVM_SELECTABLE)
+
+#define XEN_X86_EMU_HVM_ALLOWABLE   xen_emflags_allowable(XEN_X86_EMU_ALL)
+
     uint32_t emulation_flags;
 
 /*

-- 
2.34.1



