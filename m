Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C232D9BE400
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 11:15:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830667.1245736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8d3x-0006fC-Uh; Wed, 06 Nov 2024 10:14:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830667.1245736; Wed, 06 Nov 2024 10:14:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8d3x-0006cS-Ri; Wed, 06 Nov 2024 10:14:57 +0000
Received: by outflank-mailman (input) for mailman id 830667;
 Wed, 06 Nov 2024 10:14:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6dQ8=SB=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1t8d3w-0006cJ-PD
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 10:14:56 +0000
Received: from fforwardh-a1-smtp.messagingengine.com
 (fforwardh-a1-smtp.messagingengine.com [103.168.172.196])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6fa4a50-9c27-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 11:14:54 +0100 (CET)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfforwardh.phl.internal (Postfix) with ESMTP id 295DA292039A;
 Wed,  6 Nov 2024 05:14:53 -0500 (EST)
Received: from phl-frontend-01 ([10.202.2.160])
 by phl-compute-06.internal (MEProxy); Wed, 06 Nov 2024 05:14:53 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Nov 2024 05:14:52 -0500 (EST)
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
X-Inumbo-ID: f6fa4a50-9c27-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEwMy4xNjguMTcyLjE5NiIsImhlbG8iOiJmZm9yd2FyZGgtYTEtc210cC5tZXNzYWdpbmdlbmdpbmUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImY2ZmE0YTUwLTljMjctMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODg4MDk0LjEyOTUwMSwic2VuZGVyIjoic2FraWJAZGFya3N0YXIuc2l0ZSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pobox.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1730888093;
	 x=1730974493; bh=43u5uEEEtjTdbNJ0LorbS7FyqexOX0eR01rg8PmjltQ=; b=
	JVnNRTjISyDXKmBNUa1A0o4yonYg6V64UGCiZFObdM2LOKYcycEfoOpmo+6/0by/
	/StWM7PS6+xkqHbWliJIcipBpAJ7LHw/a08GzAFa4lYoDw7eX7FNosk4506Wo61y
	Dqy20ZITW1KZYDjfLkQlgqLRHgu4HaYUY8TOdZcKPIkOmKFckpjawHx9E3JdHh0a
	NuhZJImgskNFnZuIVJ0hlL9wsd38xxiObjmAWdhio3zYkrX/4pB4MpdB9SoKeDIa
	eBW6VFB0p9jcicwrkWWswwxAZzewCW9n4CEVW03pTa15FlgPcmTNR+u2m/fNzysM
	qsjwDqGeMIeeW2ak7WNc8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1730888093; x=
	1730974493; bh=43u5uEEEtjTdbNJ0LorbS7FyqexOX0eR01rg8PmjltQ=; b=Y
	1nm6q0xrzx3h+XIKf5wF96tIgLbyMq9/wmv22o0MZ8zKkiNcypNbeHTP77MIEItM
	jPgRagp3Is/y0DgvrAaC0ADMZIdx+EypVvz6vkTYuAOe3Tj5sPdkP3uUFNnopeTw
	Mz3v3xhyIzQG4s7dNNOJFKZ8naODFZ8D7klG+Cat1AMedhc/D2Krw0FXwMPxmETc
	qy2x4V+uOqYfmlWlp/SndIlSjvyEUFe5xF8TevWzMmwTSdX19b55QcYjgdIHlSka
	B8jPTmwKaiHch97btzxDVJ2gq1gDHGR9BIZlWOngfCGpkQ3ayyodVY5FSf3NXzZo
	Cp4Y5+Czu+qaRcYSwbHNw==
X-ME-Sender: <xms:nEErZ4GlkuAUxG0BcMmS5S0WhNHpoQSZJ21x6XXG4viI8zLJ0XpWuQ>
    <xme:nEErZxV6BBj6byz7quu_twFOmEooTTvmSgCzFdJUA_EqursLjctA1eHVlPU-ZQbDa
    aNwQTvRHfPGhWzVI2Q>
X-ME-Received: <xmr:nEErZyIxU_iBn12WX1-r2wG1Dp2aQM7cKw-mrUzE1J6L3fIPpTO_7YhZYqy92JOhPiISQwkGMz74aeOSCz-SeBawePvqCz3AfY8P9Lb_CR0f59as>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrtddvgdduudcutefuodetggdotefrodftvf
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
X-ME-Proxy: <xmx:nEErZ6Hjy4V7pHqyNXjIYLEHOYsD8Gk6VPYyXaVPhuI2pAbKGUFPJQ>
    <xmx:nEErZ-VVAtknI3rhvd7TZfCIhnxcFd1-q5Fm3VKOHZGjlnE5eqc29A>
    <xmx:nEErZ9PsLMXFbUNxE_vKaogv7EBCEQBmnCnle1S4oym1cgRjHy89yQ>
    <xmx:nEErZ135BxDtTnTT4dc2gdLPn-nxWzUZON3mC5YnvupjGhjTAGvKjw>
    <xmx:nUErZ8x2SieYXbw1BOVfE9F9mRsfl4O3DgP5mE2S9wW7aE6jHaFOIhgDibm8>
Feedback-ID: idf7b619e:Fastmail
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: [XEN PATCH v2 1/2] x86/hvm: introduce config option for ACPI PM timer
Date: Wed,  6 Nov 2024 12:14:49 +0200
Message-Id: <da2758bba96e247027106e13129c87ae31193e97.1730887415.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1730887415.git.Sergiy_Kibrik@epam.com>
References: <cover.1730887415.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce config option X86_HVM_PMTIMER and make pmtimer emulation driver
configurable and possible to disable on systems that don't need it.
Option X86_X86_HVM_PMTIMER depends on HVM option, because this driver is part
of HVM support code.

Introduced additional check of domain's emulation flags, to cover the case
when user explicitly states the requirement of emulated devices that are
disabled in the build. HVM always require these devices to be present so domains
of this type can't be created when pmtimer or any other emulated device are
disabled.

Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: Jan Beulich <jbeulich@suse.com>
---
changes in v2:
 - updated description
 - renamed config option X86_PMTIMER -> X86_HVM_PMTIMER & moved related
   Kconfig changes to this patch
 - define X86_EMU_PM to 0 when !X86_HVM_PMTIMER
 - reverted changes to has_vpm() macro
 - moved emulation_flags_ok() checks to this patch
 - guard struct hvm_hw_acpi acpi attribute of struct domain
---
 xen/arch/x86/Kconfig                  | 13 +++++++++++++
 xen/arch/x86/domain.c                 |  7 ++++++-
 xen/arch/x86/hvm/Makefile             |  2 +-
 xen/arch/x86/include/asm/acpi.h       |  5 +++++
 xen/arch/x86/include/asm/domain.h     |  8 ++++++--
 xen/arch/x86/include/asm/hvm/domain.h |  2 ++
 xen/arch/x86/include/asm/hvm/vpt.h    | 10 ++++++++++
 7 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 9cdd04721a..ed0ece85c7 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -144,6 +144,19 @@ config INTEL_VMX
 	  If your system includes a processor with Intel VT-x support, say Y.
 	  If in doubt, say Y.
 
+menu "Emulated HVM devices support"
+       visible if EXPERT
+       depends on HVM
+
+config X86_HVM_PMTIMER
+	bool "ACPI PM timer emulation support"
+	default y
+	help
+	  Build pmtimer driver that emulates ACPI PM timer for HVM/PVH guests.
+
+	  If unsure, say Y.
+endmenu
+
 config XEN_SHSTK
 	bool "Supervisor Shadow Stacks"
 	depends on HAS_AS_CET_SS
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 78a13e6812..b340818ee2 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -742,11 +742,16 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
 
 static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
 {
-#ifdef CONFIG_HVM
+    const uint32_t disabled_emu_mask = X86_EMU_PM;
+
+#if defined(CONFIG_X86_HVM_PMTIMER)
     /* This doesn't catch !CONFIG_HVM case but it is better than nothing */
     BUILD_BUG_ON(X86_EMU_ALL != XEN_X86_EMU_ALL);
 #endif
 
+    if ( emflags & disabled_emu_mask )
+        return false;
+
     if ( is_hvm_domain(d) )
     {
         if ( is_hardware_domain(d) &&
diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
index 4c1fa5c6c2..3af8963218 100644
--- a/xen/arch/x86/hvm/Makefile
+++ b/xen/arch/x86/hvm/Makefile
@@ -18,7 +18,7 @@ obj-y += irq.o
 obj-y += monitor.o
 obj-y += mtrr.o
 obj-y += nestedhvm.o
-obj-y += pmtimer.o
+obj-$(CONFIG_X86_HVM_PMTIMER) += pmtimer.o
 obj-y += quirks.o
 obj-y += rtc.o
 obj-y += save.o
diff --git a/xen/arch/x86/include/asm/acpi.h b/xen/arch/x86/include/asm/acpi.h
index 217819dd61..eb2e4a1ede 100644
--- a/xen/arch/x86/include/asm/acpi.h
+++ b/xen/arch/x86/include/asm/acpi.h
@@ -150,8 +150,13 @@ void acpi_mmcfg_init(void);
 /* Incremented whenever we transition through S3. Value is 1 during boot. */
 extern uint32_t system_reset_counter;
 
+#ifdef CONFIG_X86_HVM_PMTIMER
 void hvm_acpi_power_button(struct domain *d);
 void hvm_acpi_sleep_button(struct domain *d);
+#else
+static inline void hvm_acpi_power_button(struct domain *d) {}
+static inline void hvm_acpi_sleep_button(struct domain *d) {}
+#endif
 
 /* suspend/resume */
 void save_rest_processor_state(void);
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index b79d6badd7..8550473997 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -463,7 +463,6 @@ struct arch_domain
 #ifdef CONFIG_HVM
 #define X86_EMU_LAPIC    XEN_X86_EMU_LAPIC
 #define X86_EMU_HPET     XEN_X86_EMU_HPET
-#define X86_EMU_PM       XEN_X86_EMU_PM
 #define X86_EMU_RTC      XEN_X86_EMU_RTC
 #define X86_EMU_IOAPIC   XEN_X86_EMU_IOAPIC
 #define X86_EMU_PIC      XEN_X86_EMU_PIC
@@ -474,7 +473,6 @@ struct arch_domain
 #else
 #define X86_EMU_LAPIC    0
 #define X86_EMU_HPET     0
-#define X86_EMU_PM       0
 #define X86_EMU_RTC      0
 #define X86_EMU_IOAPIC   0
 #define X86_EMU_PIC      0
@@ -484,6 +482,12 @@ struct arch_domain
 #define X86_EMU_VPCI     0
 #endif
 
+#ifdef CONFIG_X86_HVM_PMTIMER
+#define X86_EMU_PM       XEN_X86_EMU_PM
+#else
+#define X86_EMU_PM       0
+#endif
+
 #define X86_EMU_PIT     XEN_X86_EMU_PIT
 
 /* This must match XEN_X86_EMU_ALL in xen.h */
diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/asm/hvm/domain.h
index 333501d5f2..a4fddf7754 100644
--- a/xen/arch/x86/include/asm/hvm/domain.h
+++ b/xen/arch/x86/include/asm/hvm/domain.h
@@ -80,8 +80,10 @@ struct hvm_domain {
      * in public header files.
      * Internally, however, we will be using hvm_hw_acpi.
      */
+#ifdef CONFIG_X86_HVM_PMTIMER
 #define hvm_hw_acpi hvm_hw_pmtimer
     struct hvm_hw_acpi     acpi;
+#endif
 
     /* VCPU which is current target for 8259 interrupts. */
     struct vcpu           *i8259_target;
diff --git a/xen/arch/x86/include/asm/hvm/vpt.h b/xen/arch/x86/include/asm/hvm/vpt.h
index 0b92b28625..f24ef08925 100644
--- a/xen/arch/x86/include/asm/hvm/vpt.h
+++ b/xen/arch/x86/include/asm/hvm/vpt.h
@@ -187,10 +187,20 @@ void rtc_deinit(struct domain *d);
 void rtc_reset(struct domain *d);
 void rtc_update_clock(struct domain *d);
 
+#ifdef CONFIG_X86_HVM_PMTIMER
 void pmtimer_init(struct vcpu *v);
 void pmtimer_deinit(struct domain *d);
 void pmtimer_reset(struct domain *d);
 int pmtimer_change_ioport(struct domain *d, uint64_t version);
+#else
+static inline void pmtimer_init(struct vcpu *v) {}
+static inline void pmtimer_deinit(struct domain *d) {}
+static inline void pmtimer_reset(struct domain *d) {}
+static inline int pmtimer_change_ioport(struct domain *d, uint64_t version)
+{
+    return -ENODEV;
+}
+#endif
 
 void hpet_init(struct domain *d);
 void hpet_deinit(struct domain *d);
-- 
2.25.1


