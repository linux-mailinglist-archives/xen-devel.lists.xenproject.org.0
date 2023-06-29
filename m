Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5BB74299B
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 17:27:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556908.869783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEtXz-0000rN-UN; Thu, 29 Jun 2023 15:27:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556908.869783; Thu, 29 Jun 2023 15:27:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEtXz-0000p5-Rk; Thu, 29 Jun 2023 15:27:03 +0000
Received: by outflank-mailman (input) for mailman id 556908;
 Thu, 29 Jun 2023 15:27:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4caF=CR=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qEtXy-0000oz-LF
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 15:27:02 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 649225a4-1691-11ee-b237-6b7b168915f2;
 Thu, 29 Jun 2023 17:27:00 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-98377c5d53eso96441266b.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jun 2023 08:27:00 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 v11-20020a170906564b00b00992c4103cb5sm307727ejr.129.2023.06.29.08.26.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jun 2023 08:27:00 -0700 (PDT)
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
X-Inumbo-ID: 649225a4-1691-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1688052420; x=1690644420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UiGulcFZszXEnWg5k92SUya80elYH7/hcO6zRbn6Dxs=;
        b=GB/HFta4uYcxg4dp/35Q9VmPzYqNQMLFv6wLOhRl1kM9K2zxWO9Pom55IGmswLsXPT
         7ZhVGPStTU7403YJKkaAuwTW/JM5/YMpL/obPT0eFEyBFr4lScIPAqs/eLV795U0Mswy
         9kCfZAkeVV0BQCuDVek2gdDG1C7ezuA9EgMZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688052420; x=1690644420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UiGulcFZszXEnWg5k92SUya80elYH7/hcO6zRbn6Dxs=;
        b=FLRhYqbn11Na8jdd88jGZ9vbvaca/04PMiBBmrVPKX7ljwN5jDpNYqZh7WDZozTnQu
         XoqB7layJMQGkb8f91XUQTYU0HOcMmhRWtU56dHLekmD0mggWJ9AXPi0b+5l2nYi+2qi
         /5IOiiFtdZB0yFQ+pdNemRvuUuH4LoL7qRNM8tUKFV+NbJQMs/PidnB3TSOCTcQVa9ry
         D5QuQDGFqDYO7LsIWRP46Fy7ID8di4vhocDkc3eeUD88B/XQ4QOz6dyypnJt3FatNklO
         mAQhm2sDbUzkxb6avDONk6o2+1OyM0g1ZgF3dApMTekSsikzDstFcdzjwPJBtO6zmMTS
         ykhA==
X-Gm-Message-State: AC+VfDzXQey24hmKsHbtBvFchzS7oFxUTqE1TlHnlYqRqcYUuUxYiahC
	NgM90eR2i5TPv8HazvoOryDkcjwj4b4rsWNkKrs=
X-Google-Smtp-Source: ACHHUZ4dqt9NKSpwm7oWRf4SgxZ2HOnbWbRJTj2ORo+3vH0rGavSnlSwWzNbfIADfgOQUkICg9FoWw==
X-Received: by 2002:a17:907:7603:b0:991:c566:979 with SMTP id jx3-20020a170907760300b00991c5660979mr8425263ejc.36.1688052420417;
        Thu, 29 Jun 2023 08:27:00 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 3/4] x86: Read MSR_ARCH_CAPS immediately after early_microcode_init()
Date: Thu, 29 Jun 2023 16:26:55 +0100
Message-Id: <20230629152656.12655-4-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230629152656.12655-1-alejandro.vallejo@cloud.com>
References: <20230629152656.12655-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move MSR_ARCH_CAPS read code from tsx_init() to early_cpu_init(). Because
microcode updates might make them that MSR to appear/have different values
we also must reload it after a microcode update in early_microcode_init().

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v5:
 * Re-run early_cpu_init() after early_microcode_init() rather than
   reloading specific fields
 * Amended early_cpu_init() so it takes a `verbose` argument in order
   to skip printing the same information before and after early microcode
   updates
---
 xen/arch/x86/cpu/common.c         | 23 +++++++++++++++--------
 xen/arch/x86/cpu/microcode/core.c |  6 ++++++
 xen/arch/x86/setup.c              |  2 +-
 xen/arch/x86/tsx.c                | 16 ++++------------
 4 files changed, 26 insertions(+), 21 deletions(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index cfcdaace12..a1be0aa4bd 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -303,7 +303,7 @@ static inline u32 phys_pkg_id(u32 cpuid_apic, int index_msb)
 
    WARNING: this function is only called on the BP.  Don't add code here
    that is supposed to run on all CPUs. */
-void __init early_cpu_init(void)
+void __init early_cpu_init(bool verbose)
 {
 	struct cpuinfo_x86 *c = &boot_cpu_data;
 	u32 eax, ebx, ecx, edx;
@@ -324,9 +324,10 @@ void __init early_cpu_init(void)
 	case X86_VENDOR_SHANGHAI: this_cpu = &shanghai_cpu_dev; break;
 	case X86_VENDOR_HYGON:    this_cpu = &hygon_cpu_dev;    break;
 	default:
-		printk(XENLOG_ERR
-		       "Unrecognised or unsupported CPU vendor '%.12s'\n",
-		       c->x86_vendor_id);
+		if (verbose)
+			printk(XENLOG_ERR
+			       "Unrecognised or unsupported CPU vendor '%.12s'\n",
+			       c->x86_vendor_id);
 	}
 
 	cpuid(0x00000001, &eax, &ebx, &ecx, &edx);
@@ -340,10 +341,11 @@ void __init early_cpu_init(void)
 	c->x86_capability[FEATURESET_1d] = edx;
 	c->x86_capability[FEATURESET_1c] = ecx;
 
-	printk(XENLOG_INFO
-	       "CPU Vendor: %s, Family %u (%#x), Model %u (%#x), Stepping %u (raw %08x)\n",
-	       x86_cpuid_vendor_to_str(c->x86_vendor), c->x86, c->x86,
-	       c->x86_model, c->x86_model, c->x86_mask, eax);
+	if (verbose)
+		printk(XENLOG_INFO
+		       "CPU Vendor: %s, Family %u (%#x), Model %u (%#x), Stepping %u (raw %08x)\n",
+		       x86_cpuid_vendor_to_str(boot_cpu_data->x86_vendor), c->x86, c->x86,
+		       c->x86_model, c->x86_model, c->x86_mask, eax);
 
 	if (c->cpuid_level >= 7) {
 		uint32_t max_subleaf;
@@ -352,6 +354,11 @@ void __init early_cpu_init(void)
 			    &c->x86_capability[FEATURESET_7c0],
 			    &c->x86_capability[FEATURESET_7d0]);
 
+		if (test_bit(X86_FEATURE_ARCH_CAPS, c->x86_capability))
+			rdmsr(MSR_ARCH_CAPABILITIES,
+			      c->x86_capability[FEATURESET_m10Al],
+			      c->x86_capability[FEATURESET_m10Ah]);
+
 		if (max_subleaf >= 1)
 			cpuid_count(7, 1, &eax, &ebx, &ecx,
 				    &c->x86_capability[FEATURESET_7d1]);
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index b620e3bfa6..98a5aebfe3 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -886,5 +886,11 @@ int __init early_microcode_init(unsigned long *module_map,
     if ( ucode_mod.mod_end || ucode_blob.size )
         rc = early_microcode_update_cpu();
 
+    /*
+     * MSR_ARCH_CAPS may have appeared after the microcode update. Reload
+     * boot_cpu_data if so because they are needed in tsx_init().
+     */
+    early_cpu_init(false);
+
     return rc;
 }
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 74e3915a4d..bdf66e80ac 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1211,7 +1211,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
         panic("Bootloader provided no memory information\n");
 
     /* This must come before e820 code because it sets paddr_bits. */
-    early_cpu_init();
+    early_cpu_init(true);
 
     /* Choose shadow stack early, to set infrastructure up appropriately. */
     if ( !boot_cpu_has(X86_FEATURE_CET_SS) )
diff --git a/xen/arch/x86/tsx.c b/xen/arch/x86/tsx.c
index 80c6f4cedd..50d8059f23 100644
--- a/xen/arch/x86/tsx.c
+++ b/xen/arch/x86/tsx.c
@@ -39,9 +39,10 @@ void tsx_init(void)
     static bool __read_mostly once;
 
     /*
-     * This function is first called between microcode being loaded, and CPUID
-     * being scanned generally.  Read into boot_cpu_data.x86_capability[] for
-     * the cpu_has_* bits we care about using here.
+     * This function is first called between microcode being loaded, and
+     * CPUID being scanned generally. early_cpu_init() has already prepared
+     * the feature bits needed here. And early_microcode_init() has ensured
+     * they are not stale after the microcode update.
      */
     if ( unlikely(!once) )
     {
@@ -49,15 +50,6 @@ void tsx_init(void)
 
         once = true;
 
-        if ( boot_cpu_data.cpuid_level >= 7 )
-            boot_cpu_data.x86_capability[FEATURESET_7d0]
-                = cpuid_count_edx(7, 0);
-
-        if ( cpu_has_arch_caps )
-            rdmsr(MSR_ARCH_CAPABILITIES,
-                  boot_cpu_data.x86_capability[FEATURESET_m10Al],
-                  boot_cpu_data.x86_capability[FEATURESET_m10Ah]);
-
         has_rtm_always_abort = cpu_has_rtm_always_abort;
 
         if ( cpu_has_tsx_ctrl && cpu_has_srbds_ctrl )
-- 
2.34.1


