Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7FA9D19B8
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2024 21:39:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839540.1255340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tD8WF-00058p-Cp; Mon, 18 Nov 2024 20:38:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839540.1255340; Mon, 18 Nov 2024 20:38:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tD8WF-00056y-9x; Mon, 18 Nov 2024 20:38:47 +0000
Received: by outflank-mailman (input) for mailman id 839540;
 Mon, 18 Nov 2024 20:38:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N8iN=SN=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1tD8WE-00056o-7o
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2024 20:38:46 +0000
Received: from fforwardh-b3-smtp.messagingengine.com
 (fforwardh-b3-smtp.messagingengine.com [202.12.124.198])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 190bf74c-a5ed-11ef-99a3-01e77a169b0f;
 Mon, 18 Nov 2024 21:38:42 +0100 (CET)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfforwardh.stl.internal (Postfix) with ESMTP id 6621D17404B0;
 Mon, 18 Nov 2024 15:38:41 -0500 (EST)
Received: from phl-frontend-01 ([10.202.2.160])
 by phl-compute-02.internal (MEProxy); Mon, 18 Nov 2024 15:38:41 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 Nov 2024 15:38:40 -0500 (EST)
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
X-Inumbo-ID: 190bf74c-a5ed-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjIwMi4xMi4xMjQuMTk4IiwiaGVsbyI6ImZmb3J3YXJkaC1iMy1zbXRwLm1lc3NhZ2luZ2VuZ2luZS5jb20ifQ==
X-Custom-Transaction: eyJpZCI6IjE5MGJmNzRjLWE1ZWQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxOTYyMzIyLjYzNjI4Miwic2VuZGVyIjoic2FraWJAZGFya3N0YXIuc2l0ZSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1731962321; x=
	1732048721; bh=fTfrGVdXy8YPyPc4er3hijs5yP5z3AbAi5qMVvZHAW8=; b=D
	+6P/ylE1tsXE+hIHP/C5MIbv7ERw6UWnhqBBrm4hvoyxxl61BS6cbCuoJE9ynRBa
	INlvcXnP6xPOIaG2xVPQEGNuhCXClGJ0Cx40tNV2C/u72wamkrk+mSwcZyCADIFE
	3Gzl3hfyuajZrAPVQjlSG3uNoTXdMU5TonAnCXn7EOqHZcQ3FsqUb/PsH+cIYiEp
	rXG2X8jD27MZCLeVvJ5jK9JS6UHmO636BzFh/FakXnnbOyNnAjARcgUn0R4h8GOs
	WWcnVmCCQqIkf8a2eV1dN4CQ5Dz3KVSur6xVYznQMRWEc8jYtkcJNVLkNnCrti9H
	lL8XIdN80lWrlmfU20nIA==
X-ME-Sender: <xms:0aU7Z5VpMDhOk7f0tqea4AdidJo6JfEN03fM9PfeIPejsNhtnkhdxQ>
    <xme:0aU7Z5nuyj4XyCGK55s69aB72HvoqFfnfBE76TYxk4U_N-ifJ0Y5CPV5Bpckyp8D1
    3lKjniNnbZ7wsWASXs>
X-ME-Received: <xmr:0aU7Z1ZlMam3wj6CCYGioQC5JXat9u94FUrf9CheU2YBM41QvtcW5D0vezna0gsmRBRhlctydou6TP1Qk157ue6JxF8suIrJuOpXfb-R4xq3bCVu>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrfedtgddufeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdej
    necuhfhrohhmpefuvghrghhihicumfhisghrihhkuceoufgvrhhgihihpgfmihgsrhhikh
    esvghprghmrdgtohhmqeenucggtffrrghtthgvrhhnpeeigfdvjeduieefveefudegvdel
    gfehjedttdeifffhlefgudetudetheduleevueenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehsrghkihgssegurghrkhhsthgrrhdrshhithgv
    pdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeigvg
    hnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthho
    pehsvghrghhihigpkhhisghrihhksegvphgrmhdrtghomhdprhgtphhtthhopegrnhgurh
    gvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtoheprhhoghgvrhdr
    phgruhestghithhrihigrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomh
X-ME-Proxy: <xmx:0aU7Z8XVPq8d4_GD8raacTMUIbq_-8vgXbXiZVa2OLOW2fRNbv3vXQ>
    <xmx:0aU7ZznHrzUCgBUTpaWyo2UZQWh4FVLUrKOhgvNSsLfItlTA3s-dQg>
    <xmx:0aU7Z5elR2AYpZ535ZBnkWAgOaoFLNAP3XA5RuzUl1Ox31FAGGOYAQ>
    <xmx:0aU7Z9G8GGnKcWaQKXt2uGachAfJf8pfgcWKaGLScIVDOw320LHqqQ>
    <xmx:0aU7Z8C0nFeMfTZPNAMe26q4qpo-hNyUTqR7dNjfDX5po_TytXWIpMHuO6tX>
Feedback-ID: id7975e81:Fastmail
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: [XEN PATCH v3 2/2] x86/hvm: introduce config option for stdvga emulation
Date: Mon, 18 Nov 2024 22:38:38 +0200
Message-Id: <b4163fe8957506d38294ba511c063c706cc1ac85.1731961652.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1731961652.git.Sergiy_Kibrik@epam.com>
References: <cover.1731961652.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce config option X86_HVM_STDVGA and make stdvga emulation driver
configurable so it can be disabled on systems that don't need it.

Suggested-by: Roger Pau Monné <roger.pau@citrix.com> # approach
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
CC: Jan Beulich <jbeulich@suse.com>
---
changes in v3:
 - changed config option's description
 - add build-time checks of X86_EMU_VGA vs XEN_X86_EMU_VGA
 - tags
changes in v2:
 - updated description
 - renamed config option X86_STDVGA -> X86_HVM_STDVGA & moved related
   Kconfig changes to this patch
 - reverted changes to has_vvga() macro
 - moved emulation_flags_ok() checks to this patch
---
 xen/arch/x86/Kconfig              | 10 ++++++++++
 xen/arch/x86/domain.c             |  7 +++++--
 xen/arch/x86/hvm/Makefile         |  2 +-
 xen/arch/x86/include/asm/domain.h |  8 ++++++--
 xen/arch/x86/include/asm/hvm/io.h |  4 ++++
 5 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index d8f108a3ca..e2ba257fb3 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -155,6 +155,16 @@ config X86_HVM_PMTIMER
 	  Build driver that emulates ACPI PM timer for HVM guests.
 
 	  If unsure, say Y.
+
+config X86_HVM_STDVGA
+	bool "Standard VGA card emulation support"
+	default y
+	help
+	  Build driver that emulates standard VGA card with VESA BIOS
+	  Extensions for HVM guests.
+
+	  If unsure, say Y.
+
 endmenu
 
 config XEN_SHSTK
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index d867b4f046..e01759e2e5 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -744,12 +744,15 @@ static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
 {
 #ifdef CONFIG_HVM
     /* This doesn't catch !CONFIG_HVM case but it is better than nothing */
-    BUILD_BUG_ON((X86_EMU_ALL & ~X86_EMU_PM) !=
-                 (XEN_X86_EMU_ALL & ~XEN_X86_EMU_PM));
+    BUILD_BUG_ON((X86_EMU_ALL & ~(X86_EMU_PM | X86_EMU_VGA)) !=
+                 (XEN_X86_EMU_ALL & ~(XEN_X86_EMU_PM | XEN_X86_EMU_VGA)));
 #endif
 #ifdef CONFIG_X86_HVM_PMTIMER
        BUILD_BUG_ON(X86_EMU_PM != XEN_X86_EMU_PM);
 #endif
+#ifdef CONFIG_X86_HVM_STDVGA
+       BUILD_BUG_ON(X86_EMU_VGA != XEN_X86_EMU_VGA);
+#endif
 
     /* emflags contain non-supported bits */
     if ( (emflags & X86_EMU_ALL) != emflags )
diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
index 3af8963218..80ec425aa8 100644
--- a/xen/arch/x86/hvm/Makefile
+++ b/xen/arch/x86/hvm/Makefile
@@ -22,7 +22,7 @@ obj-$(CONFIG_X86_HVM_PMTIMER) += pmtimer.o
 obj-y += quirks.o
 obj-y += rtc.o
 obj-y += save.o
-obj-y += stdvga.o
+obj-$(CONFIG_X86_HVM_STDVGA) += stdvga.o
 obj-y += vioapic.o
 obj-y += vlapic.o
 obj-y += vm_event.o
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 8550473997..106b438779 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -466,7 +466,6 @@ struct arch_domain
 #define X86_EMU_RTC      XEN_X86_EMU_RTC
 #define X86_EMU_IOAPIC   XEN_X86_EMU_IOAPIC
 #define X86_EMU_PIC      XEN_X86_EMU_PIC
-#define X86_EMU_VGA      XEN_X86_EMU_VGA
 #define X86_EMU_IOMMU    XEN_X86_EMU_IOMMU
 #define X86_EMU_USE_PIRQ XEN_X86_EMU_USE_PIRQ
 #define X86_EMU_VPCI     XEN_X86_EMU_VPCI
@@ -476,7 +475,6 @@ struct arch_domain
 #define X86_EMU_RTC      0
 #define X86_EMU_IOAPIC   0
 #define X86_EMU_PIC      0
-#define X86_EMU_VGA      0
 #define X86_EMU_IOMMU    0
 #define X86_EMU_USE_PIRQ 0
 #define X86_EMU_VPCI     0
@@ -488,6 +486,12 @@ struct arch_domain
 #define X86_EMU_PM       0
 #endif
 
+#ifdef CONFIG_X86_HVM_STDVGA
+#define X86_EMU_VGA      XEN_X86_EMU_VGA
+#else
+#define X86_EMU_VGA      0
+#endif
+
 #define X86_EMU_PIT     XEN_X86_EMU_PIT
 
 /* This must match XEN_X86_EMU_ALL in xen.h */
diff --git a/xen/arch/x86/include/asm/hvm/io.h b/xen/arch/x86/include/asm/hvm/io.h
index f2b8431fac..c02fad876c 100644
--- a/xen/arch/x86/include/asm/hvm/io.h
+++ b/xen/arch/x86/include/asm/hvm/io.h
@@ -108,7 +108,11 @@ struct vpci_arch_msix_entry {
     int pirq;
 };
 
+#ifdef CONFIG_X86_HVM_STDVGA
 void stdvga_init(struct domain *d);
+#else
+static inline void stdvga_init(struct domain *d) {}
+#endif
 
 extern void hvm_dpci_msi_eoi(struct domain *d, int vector);
 
-- 
2.25.1


