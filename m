Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE4475FC93
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 18:53:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569162.889460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNynb-0000yM-Ne; Mon, 24 Jul 2023 16:52:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569162.889460; Mon, 24 Jul 2023 16:52:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNynb-0000w9-KK; Mon, 24 Jul 2023 16:52:43 +0000
Received: by outflank-mailman (input) for mailman id 569162;
 Mon, 24 Jul 2023 16:52:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+YiG=DK=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qNyna-0000gc-8n
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 16:52:42 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8007e9d6-2a42-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 18:52:40 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3144bf65ce9so3489430f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 09:52:40 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a5d60cd000000b0030ada01ca78sm13480777wrt.10.2023.07.24.09.52.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 09:52:38 -0700 (PDT)
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
X-Inumbo-ID: 8007e9d6-2a42-11ee-8612-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1690217559; x=1690822359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A572cM8GKUnw4aLvmx7+QkpR9aur5X3rTBja4ErTb1k=;
        b=bz2LZzqDjLeexZgD0bf/vo+LfkQbMWseYbLDirCYM4JJqBf1TsgdbNCcwJPiOsIezm
         FpnGKKLQmOtmvll5VgRThGnwO7gVvepKYLa4RZ3bPCubuWuuiNO7IKzoqEQGgtEY9MZA
         Ho0fWtZHPrfmcUSLJbqZvddgJ6PXx/prtTm/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690217559; x=1690822359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A572cM8GKUnw4aLvmx7+QkpR9aur5X3rTBja4ErTb1k=;
        b=UQAafBiUiifM3eSTHbPsHCnUGql51ojR2QB1TWPlZK09Y+kEjZOC6sLEFjho5dIzuV
         L2RAbFqdHtmp8bIQco6AQ+2AFC8gqGW45vL8SrC1IeBTGaZF1wkieq92JcE3eniht/hJ
         hMsozxmmBjpfOwhV6hzaIYOkKQ0RVGRzDgUbO1zv0ErmmGE1xfj++ITmfOq0Y1yg+kLY
         DDR7nhv/YZ1yv/JDZk6vFt8dWyp6l6rJ8brNCiUNOEA8fANf3oQOLCA6zfcDZokaUxWo
         6EovdLl6/nitKFwfRY/Ev1JhJ+aFpsnAWpMZ3+YtxowPh/n0/RkCTzW8dkWNOAFDgXmG
         FGFg==
X-Gm-Message-State: ABy/qLbNsOpH4GqOk3J4YznHXUuafRsLKkwM9e77+Jwz6plqO8iEWna0
	6mdPiKNQR3CAF2uP9/fH72C9yReoIqzr98GOfqc=
X-Google-Smtp-Source: APBJJlG9eQSXgi17Zj7NZ2nSBfg6QzHxndz9XtpBvomf6xyXB1RwYTh/aNnHH+ur85VfYYuamzrAvA==
X-Received: by 2002:adf:d4c5:0:b0:317:5ddb:a8bf with SMTP id w5-20020adfd4c5000000b003175ddba8bfmr2655699wrk.29.1690217559216;
        Mon, 24 Jul 2023 09:52:39 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v6 2/3] x86: Read MSR_ARCH_CAPS immediately after early_microcode_init()
Date: Mon, 24 Jul 2023 17:52:34 +0100
Message-Id: <20230724165235.25262-3-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724165235.25262-1-alejandro.vallejo@cloud.com>
References: <20230724165235.25262-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move MSR_ARCH_CAPS read code from tsx_init() to early_cpu_init(). Because
microcode updates might make them that MSR to appear/have different values
we also must reload it after a microcode update in early_microcode_init().

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v6:
 * Invert logic of a verbosity-guard to reduce diff (Jan)
 * Reflow last printk in v5/patch3:early_cpu_init() for line length (Jan)
 * Rewrite comment for the early_cpu_init(false) statement (Jan)
---
 xen/arch/x86/cpu/common.c         | 20 +++++++++++++++-----
 xen/arch/x86/cpu/microcode/core.c |  9 +++++++++
 xen/arch/x86/include/asm/setup.h  |  2 +-
 xen/arch/x86/setup.c              |  2 +-
 xen/arch/x86/tsx.c                | 16 ++++------------
 5 files changed, 30 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index cfcdaace12..2b9cc680ac 100644
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
@@ -324,6 +324,8 @@ void __init early_cpu_init(void)
 	case X86_VENDOR_SHANGHAI: this_cpu = &shanghai_cpu_dev; break;
 	case X86_VENDOR_HYGON:    this_cpu = &hygon_cpu_dev;    break;
 	default:
+		if (!verbose)
+			break;
 		printk(XENLOG_ERR
 		       "Unrecognised or unsupported CPU vendor '%.12s'\n",
 		       c->x86_vendor_id);
@@ -340,10 +342,13 @@ void __init early_cpu_init(void)
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
@@ -352,6 +357,11 @@ void __init early_cpu_init(void)
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
index 71e3944cf2..44bc0fafa3 100644
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
index ae0dd3915a..df59a4cd28 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -15,7 +15,7 @@ extern uint64_t boot_tsc_stamp;
 
 extern void *stack_start;
 
-void early_cpu_init(void);
+void early_cpu_init(bool verbose);
 void early_time_init(void);
 
 void set_nr_cpu_ids(unsigned int max_cpus);
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


