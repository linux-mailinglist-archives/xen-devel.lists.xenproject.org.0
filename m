Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A4C78D752
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 17:53:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593120.926067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbNVg-0006pz-5m; Wed, 30 Aug 2023 15:53:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593120.926067; Wed, 30 Aug 2023 15:53:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbNVg-0006hR-2R; Wed, 30 Aug 2023 15:53:36 +0000
Received: by outflank-mailman (input) for mailman id 593120;
 Wed, 30 Aug 2023 15:53:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xver=EP=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1qbNVd-00064u-TS
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 15:53:33 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e4d1b19-474d-11ee-9b0d-b553b5be7939;
 Wed, 30 Aug 2023 17:53:31 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3fee5ddc23eso54102605e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Aug 2023 08:53:31 -0700 (PDT)
Received: from localhost.localdomain ([66.81.173.62])
 by smtp.gmail.com with ESMTPSA id
 b4-20020adff244000000b0031423a8f4f7sm17000009wrp.56.2023.08.30.08.53.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Aug 2023 08:53:30 -0700 (PDT)
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
X-Inumbo-ID: 5e4d1b19-474d-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1693410811; x=1694015611; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R8UgQOatn3NPVJHNw6kasdgFNmIqy5Hk8BBIW+w2Wt0=;
        b=VTBensWZxsJ8fiJ7iO8Ia0Drr7Azk5kThLIQYEdw6qNUOSgJI517gmvQgeqjKjBvLn
         L6jo1nRGTh5A17nrjzEHJeoAGYyXtlYqqlMStpLRD5hY55vMOAJj+VVTV+bUnejAj564
         rexXmaXj53oZGpvAgxt5rBNwZzepKO5Tmr2vU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693410811; x=1694015611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R8UgQOatn3NPVJHNw6kasdgFNmIqy5Hk8BBIW+w2Wt0=;
        b=EPiAbarz3Fu6MprSPbQzfaNTI79MK2IcbOj8KiAyOuaey9cuw2RoNwxfgLThO36GcR
         K7KJbseZs9UjVjL6VeVEhDzCxFZ0iYUEkMou0SOMdbhLWJOiUtzi10YZ3N4oHeTRKC2K
         E1lBG4s2pTUCkA62ieVZDRjMDBrRDRK8vd6hYVQpvFnkSKcUROrHeRfLtU8dwUfwUcAB
         BzDnFoCyEUdJWIa3DiQDMSB9AD7+Ve/F4c/wv4dPgHtCoN9SmU1wFi68YiG3bB2WLAuQ
         TMgodX4YCyYpdNfuCv2PbsLSsLiF1DSynBQcj2zN124gWtCt2sDSndYeNyrLKvKuiVEu
         0P7A==
X-Gm-Message-State: AOJu0Yx/Zt1ABgLYhcVg/+KuQAJjA4ZGJCagzcHzZda9wphjf7Cjl/Xa
	6zquL+7hhPbLC/lHtLRN17GypHPlyOgDliHiUU0=
X-Google-Smtp-Source: AGHT+IGYgQhnwEHlhwfzZkwAAdRNrGsano6Huf/C2z6GFWnt+n4nAo64M8BC5Lw9Qc5DMykRw9H+bQ==
X-Received: by 2002:a1c:7c19:0:b0:401:6f48:f3b5 with SMTP id x25-20020a1c7c19000000b004016f48f3b5mr2108170wmc.32.1693410810977;
        Wed, 30 Aug 2023 08:53:30 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v8 3/4] x86: Read MSR_ARCH_CAPS immediately after early_microcode_init()
Date: Wed, 30 Aug 2023 16:53:25 +0100
Message-Id: <20230830155326.10199-4-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230830155326.10199-1-alejandro.vallejo@cloud.com>
References: <20230830155326.10199-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move MSR_ARCH_CAPS read code from tsx_init() to early_cpu_init(). Because
microcode updates might make them that MSR to appear/have different values
we also must reload it after a microcode update in early_microcode_init().

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v8:
 * No change
---
 xen/arch/x86/cpu/common.c         | 20 +++++++++++++++-----
 xen/arch/x86/cpu/microcode/core.c |  9 +++++++++
 xen/arch/x86/include/asm/setup.h  |  2 +-
 xen/arch/x86/setup.c              |  2 +-
 xen/arch/x86/tsx.c                | 16 ++++------------
 5 files changed, 30 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 6fada384a1..3fd4fd0654 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -299,7 +299,7 @@ static inline u32 phys_pkg_id(u32 cpuid_apic, int index_msb)
 
    WARNING: this function is only called on the BP.  Don't add code here
    that is supposed to run on all CPUs. */
-void __init early_cpu_init(void)
+void __init early_cpu_init(bool verbose)
 {
 	struct cpuinfo_x86 *c = &boot_cpu_data;
 	u32 eax, ebx, ecx, edx;
@@ -320,6 +320,8 @@ void __init early_cpu_init(void)
 	case X86_VENDOR_SHANGHAI: this_cpu = &shanghai_cpu_dev; break;
 	case X86_VENDOR_HYGON:    this_cpu = &hygon_cpu_dev;    break;
 	default:
+		if (!verbose)
+			break;
 		printk(XENLOG_ERR
 		       "Unrecognised or unsupported CPU vendor '%.12s'\n",
 		       c->x86_vendor_id);
@@ -336,10 +338,13 @@ void __init early_cpu_init(void)
 	c->x86_capability[FEATURESET_1d] = edx;
 	c->x86_capability[FEATURESET_1c] = ecx;
 
-	printk(XENLOG_INFO
-	       "CPU Vendor: %s, Family %u (%#x), Model %u (%#x), Stepping %u (raw %08x)\n",
-	       x86_cpuid_vendor_to_str(c->x86_vendor), c->x86, c->x86,
-	       c->x86_model, c->x86_model, c->x86_mask, eax);
+	if (verbose)
+		printk(XENLOG_INFO
+		       "CPU Vendor: %s, Family %u (%#x), "
+		       "Model %u (%#x), Stepping %u (raw %08x)\n",
+		       x86_cpuid_vendor_to_str(c->x86_vendor), c->x86,
+		       c->x86, c->x86_model, c->x86_model, c->x86_mask,
+		       eax);
 
 	if (c->cpuid_level >= 7) {
 		uint32_t max_subleaf;
@@ -348,6 +353,11 @@ void __init early_cpu_init(void)
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
index 01f1dd4710..b3df4d40e6 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -887,5 +887,14 @@ int __init early_microcode_init(unsigned long *module_map,
     if ( ucode_mod.mod_end || ucode_blob.size )
         rc = early_microcode_update_cpu();
 
+    /*
+     * Some CPUID leaves and MSRs are only present after microcode updates
+     * on some processors. We take the chance here to make sure what little
+     * state we have already probed is re-probed in order to ensure we do
+     * not use stale values. tsx_init() in particular needs to have up to
+     * date MSR_ARCH_CAPS.
+     */
+    early_cpu_init(false);
+
     return rc;
 }
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index b0e6a39e23..8350167650 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -15,7 +15,7 @@ extern uint64_t boot_tsc_stamp;
 
 extern void *stack_start;
 
-void early_cpu_init(void);
+void early_cpu_init(bool verbose);
 void early_time_init(void);
 
 void set_nr_cpu_ids(unsigned int max_cpus);
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 3358d9a0ff..3641d5fbac 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1213,7 +1213,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
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


