Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E939BE408
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 11:17:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830672.1245746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8d5y-0007No-9p; Wed, 06 Nov 2024 10:17:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830672.1245746; Wed, 06 Nov 2024 10:17:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8d5y-0007LH-79; Wed, 06 Nov 2024 10:17:02 +0000
Received: by outflank-mailman (input) for mailman id 830672;
 Wed, 06 Nov 2024 10:17:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6dQ8=SB=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1t8d5w-0007L5-TB
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 10:17:00 +0000
Received: from fforwardh-a1-smtp.messagingengine.com
 (fforwardh-a1-smtp.messagingengine.com [103.168.172.196])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40612a64-9c28-11ef-99a3-01e77a169b0f;
 Wed, 06 Nov 2024 11:16:57 +0100 (CET)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfforwardh.phl.internal (Postfix) with ESMTP id 49CEF292037B;
 Wed,  6 Nov 2024 05:16:56 -0500 (EST)
Received: from phl-frontend-01 ([10.202.2.160])
 by phl-compute-01.internal (MEProxy); Wed, 06 Nov 2024 05:16:56 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Nov 2024 05:16:55 -0500 (EST)
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
X-Inumbo-ID: 40612a64-9c28-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEwMy4xNjguMTcyLjE5NiIsImhlbG8iOiJmZm9yd2FyZGgtYTEtc210cC5tZXNzYWdpbmdlbmdpbmUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjQwNjEyYTY0LTljMjgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwODg4MjE3LjMzNDA2Mywic2VuZGVyIjoic2FraWJAZGFya3N0YXIuc2l0ZSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pobox.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1730888216;
	 x=1730974616; bh=p2u5ACnZhknNqMHNI6CsAH2zzZ1pewvirnqiawXzLcQ=; b=
	Lxe4JJT3FL7R3h43Gm6KzKdNS4LCKiYfug73eK4RYTfP8a1kAxTYOaXECApQZCvF
	i14a/UCokJftNZGEGTKXB1WGqO9dF/G6ZvITCKixL5hoYYPAlI/80PA8G6m/k3Xt
	KDHW+TNjIqg+n8JeVQa53e5Sa4L988hLsWuW2wv5Y42MdMRm68zIem37km94ip0G
	FTBfm3xMwm/1xa04IaohO2O4W/a1Euo0ObUOqXP+Qdf/kZYOXXUMmfEzLbCH6L/d
	4WUpujbav5yVcWvaHCgsw3KyKkTdmjyqnpyrRthjrqRYAJoDHDnna5Ql/cnwFubC
	1g4HcNcuXT76Wq72v/6L/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1730888216; x=
	1730974616; bh=p2u5ACnZhknNqMHNI6CsAH2zzZ1pewvirnqiawXzLcQ=; b=S
	lILH3+1l8k+WGC94l5C1jbxg6/OwxZb16rvaP9ucY83M1TTFv9XFP0/ZaKF+ANcq
	Y6FAluJDxv/oh9w0l+MHQaz5N2ocxv7IH70AJUdR6+GJVSkt4PM+xoiYfxuVwz3W
	FJbhhRVHYYoTqetK5DGtLuKP1T4haEv+jYMxi+GFggj9E4pcrSYRLHV0C26HNOMV
	vX6V89HhuNTmndaK5GT4Q2k5VDpiPtVNE/TDZr+uEiOlGrcRUZtWmvXOZMvMyWU2
	+DvBj3jI7KfSwmvxWEP7lkR5QskeuSjSW3xhaiWSUE1cgGm1zBSxUX8Q8W65B1xx
	FB3Xjq/yjZFcNU/0baLMw==
X-ME-Sender: <xms:GEIrZ5ff2wcwF5hbd0BJNj7i9YRNZ6nCQ-hjQfVIJJsk3n9vgzqNSg>
    <xme:GEIrZ3P5qTzqEOr7tiECJGA7o7c54N3YRMua1QCBzSYiHbt9SEB_WiqO0OMOzYIM-
    qqJf9LBlPmmh1IZ8BE>
X-ME-Received: <xmr:GEIrZyjg4DGLIs5JgSdMhRsf6V2bfHAT6DDav4fEsTUC-fHk_MTQ50x8MNT0NYagYaz1oHni2vzlyS5YuhgqyManvQ8ehpPSchPfIGKa8Ri-ZXbb>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrtddvgdduvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeen
    ucfhrhhomhepufgvrhhgihihucfmihgsrhhikhcuoefuvghrghhihigpmfhisghrihhkse
    gvphgrmhdrtghomheqnecuggftrfgrthhtvghrnhepiefgvdejudeifeevfedugedvlefg
    heejtddtieffhfelgfduteduteehudelveeunecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepshgrkhhisgesuggrrhhkshhtrghrrdhsihhtvgdp
    nhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnh
    dquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohep
    shgvrhhgihihpghkihgsrhhikhesvghprghmrdgtohhmpdhrtghpthhtoheprghnughrvg
    ifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopehrohhgvghrrdhp
    rghusegtihhtrhhigidrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehjsggvuhhlihgthhesshhushgvrdgtohhm
X-ME-Proxy: <xmx:GEIrZy_N5t_y00Z7j8qJDx6bYnzX7B-medV28k-WNFiYdTL0uo6ZXA>
    <xmx:GEIrZ1tbNdcaVGwaC5mdsu1YTBNGqjG3em6lyZ9h285NMcI6RIDWhA>
    <xmx:GEIrZxFEljRg2tYpEADCwUotWl8RAiZcvCQpPHC6pM2HU2Gq0ep4Ag>
    <xmx:GEIrZ8PSa1XXX0wqqUKpXKLQgKmq0EGdoaTWfzqMFqrYgb6zoaiOLg>
    <xmx:GEIrZ_LW7eLuO-phOrI3jEx0Vzig8xYWfxB60mTH_6FZLJRY56Vk4kWpZ1bl>
Feedback-ID: i5db7bdcf:Fastmail
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: [XEN PATCH v2 2/2] x86/hvm: introduce config option for stdvga emulation
Date: Wed,  6 Nov 2024 12:16:53 +0200
Message-Id: <53b0d5552c128630e476c77b54b8983fe02e0e1c.1730887415.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1730887415.git.Sergiy_Kibrik@epam.com>
References: <cover.1730887415.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce config option X86_HVM_STDVGA and make stdvga emulation driver
configurable so it can be disabled on systems that don't need it.

Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: Jan Beulich <jbeulich@suse.com>
---
changes in v2:
 - updated description
 - renamed config option X86_STDVGA -> X86_HVM_STDVGA & moved related
   Kconfig changes to this patch
 - reverted changes to has_vvga() macro
 - moved emulation_flags_ok() checks to this patch
---
 xen/arch/x86/Kconfig              | 10 ++++++++++
 xen/arch/x86/domain.c             |  4 ++--
 xen/arch/x86/hvm/Makefile         |  2 +-
 xen/arch/x86/include/asm/domain.h |  8 ++++++--
 xen/arch/x86/include/asm/hvm/io.h |  4 ++++
 5 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index ed0ece85c7..35c8ace8ef 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -155,6 +155,16 @@ config X86_HVM_PMTIMER
 	  Build pmtimer driver that emulates ACPI PM timer for HVM/PVH guests.
 
 	  If unsure, say Y.
+
+config X86_HVM_STDVGA
+	bool "Standard VGA card emulation support"
+	default y
+	help
+	  Build stdvga driver that emulates standard VGA card with VESA BIOS
+	  Extensions for HVM/PVH guests.
+
+	  If unsure, say Y.
+
 endmenu
 
 config XEN_SHSTK
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index b340818ee2..aefa1fc136 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -742,9 +742,9 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
 
 static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
 {
-    const uint32_t disabled_emu_mask = X86_EMU_PM;
+    const uint32_t disabled_emu_mask = X86_EMU_PM | X86_EMU_VGA;
 
-#if defined(CONFIG_X86_HVM_PMTIMER)
+#if defined(CONFIG_X86_HVM_PMTIMER) && defined(CONFIG_X86_HVM_STDVGA)
     /* This doesn't catch !CONFIG_HVM case but it is better than nothing */
     BUILD_BUG_ON(X86_EMU_ALL != XEN_X86_EMU_ALL);
 #endif
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


