Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB58773A58
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 15:03:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579804.907969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTMND-0006Vf-UT; Tue, 08 Aug 2023 13:03:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579804.907969; Tue, 08 Aug 2023 13:03:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTMND-0006Rh-Oc; Tue, 08 Aug 2023 13:03:43 +0000
Received: by outflank-mailman (input) for mailman id 579804;
 Tue, 08 Aug 2023 13:03:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gjkb=DZ=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qTMNB-0003KL-Nm
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 13:03:41 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fefdcd62-35eb-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 15:03:40 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3178dd81ac4so4679622f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Aug 2023 06:03:40 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 t6-20020adfe446000000b003179b3fd837sm13699587wrm.33.2023.08.08.06.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Aug 2023 06:03:39 -0700 (PDT)
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
X-Inumbo-ID: fefdcd62-35eb-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1691499820; x=1692104620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Drl1WoVQFYKt7SnkepxymBZ1cgaNy4U6Y8pES3y0IG0=;
        b=IgEyeP56E5Q5RHrY3Dw7IREGaBWkLvdLiOUD+NFHoIoIa+XiWKYBuFbNDl4fSo0l5g
         Em0hETb2ZyfPH89U+9muDE6UyGevxcdsjlQmSxWlIeZlHDcNXGbOACq3mUMCJOj+lKkm
         uFfJGFKuRAy2dpzK65UCj9VPkY5Seea9LIH1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691499820; x=1692104620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Drl1WoVQFYKt7SnkepxymBZ1cgaNy4U6Y8pES3y0IG0=;
        b=OQt5+Tk+Tghtj9WmITyQeevg3bQ5r3NAUB9ROU1lfIJjOwyvIhRcpbmSqdNxlJbsOA
         MA3Dj5A1J1L6/5m5Mr4q9Gem8ewJ/XahZRh1+n6rXaf9a7fdVPvAnttGuqGwXm0LViAq
         p3QfR/RgcFP6Tdc+2RHw/BRuXvVK9hjs3l37BDI6GGChU1FOZgdUjQ5fQfmApe45oXx8
         gPA67mh7Y920SX3xBNkCawoDbSBbK4YiMcpVioTj5HyrBbEDPEExgLq6Y+4cgp0688ow
         8E/Uz1TvQp6+51925/4zBYmeUOkvjrHnVwwVPBl0aNq8P3ScUOTwJk4scXkkat9e5F5N
         xvbg==
X-Gm-Message-State: AOJu0YxCevU07DIbH0xcotjRpCL/tqfkM4QLjj9w+oSTbOedu0EFRzki
	VZMCnzKFnsDfDNNu3nfwr0cgi65hUT8Ep2nyZc8=
X-Google-Smtp-Source: AGHT+IFsHmqMp2toFeDTaYonJi4Mxyq93TXJf/Cy5qj5i0N+qKCTpHEpN4U5GZ8C7IBGcFPuXqszKQ==
X-Received: by 2002:adf:fd8b:0:b0:317:cddf:1c71 with SMTP id d11-20020adffd8b000000b00317cddf1c71mr9773543wrr.23.1691499820143;
        Tue, 08 Aug 2023 06:03:40 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v7 2/3] x86: Read MSR_ARCH_CAPS immediately after early_microcode_init()
Date: Tue,  8 Aug 2023 14:03:30 +0100
Message-Id: <20230808130331.27995-3-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808130331.27995-1-alejandro.vallejo@cloud.com>
References: <20230808130331.27995-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move MSR_ARCH_CAPS read code from tsx_init() to early_cpu_init(). Because
microcode updates might make them that MSR to appear/have different values
we also must reload it after a microcode update in early_microcode_init().

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v7:
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
index 205bb52201..273840fbcf 100644
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
index 51fce66607..dad8b3e605 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -15,7 +15,7 @@ extern uint64_t boot_tsc_stamp;
 
 extern void *stack_start;
 
-void early_cpu_init(void);
+void early_cpu_init(bool verbose);
 void early_time_init(void);
 
 void set_nr_cpu_ids(unsigned int max_cpus);
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 2dbe9857aa..12cb28e969 100644
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


