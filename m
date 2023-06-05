Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C503D722D57
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 19:09:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543819.849134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6Dgy-0002gZ-Dp; Mon, 05 Jun 2023 17:08:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543819.849134; Mon, 05 Jun 2023 17:08:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6Dgy-0002bX-9W; Mon, 05 Jun 2023 17:08:28 +0000
Received: by outflank-mailman (input) for mailman id 543819;
 Mon, 05 Jun 2023 17:08:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dNO+=BZ=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1q6Dgw-0001hK-9t
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 17:08:26 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94d0ae44-03c3-11ee-8611-37d641c3527e;
 Mon, 05 Jun 2023 19:08:24 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f6da07feb2so50761045e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Jun 2023 10:08:24 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 b3-20020a5d4d83000000b0030c4d8930b1sm10247405wru.91.2023.06.05.10.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 10:08:23 -0700 (PDT)
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
X-Inumbo-ID: 94d0ae44-03c3-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1685984904; x=1688576904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OOsivV2azY4WdSK6TBmAXPP6Pm2+kuO/HkiPvSCcP+E=;
        b=CGuBFukDMR/XfNLUieqkaIXmDgSty6jly7wVcQ/I1mVAB0/6WyIl4uOjIt/3ql1tD+
         9Hga37ejgciqASd73lxw0g+pYuvt04QY8mE1Ebv+IiyNvm7WA3z8kuz3jbsb4rTQauLm
         oa2aJS19yzZd3c4Lyv8I4yUOTF3+hyJrwhS9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685984904; x=1688576904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OOsivV2azY4WdSK6TBmAXPP6Pm2+kuO/HkiPvSCcP+E=;
        b=hCqegiZh5tYoA+jUHoqfS++btC83rnC3uxX+1b61kVzBPiggP7tuOiCz+wE0+vTJT7
         S4qDh++wiHJDIyjhcBXajCPXzLiBUjiQQD8i65yxwtUXAx5M0j11jRDt78omNGnFL6y8
         +A0PSMWOfrR3HLgRruepup84qHaNfz2eC0UBOV+zmlF+0zvYXB5tnnOuqeHxrbpxZVL4
         +JRjE5rqOD8LQYS284+enJsEdAtrmiQ54mNa9gNPeTtKuq+mJKTiSKzWPBtsFKh/Tlse
         gTPoR6bz9NCXwGfOMrcVSW6B7eJU/MqNz9nR5HY26Z9IqKPEraLkOWAj0QzM8PL3A4gg
         n+AQ==
X-Gm-Message-State: AC+VfDyvADDCcImpU7SCYMkPL5R3JodWtevgbjdPFrTXveA6SLtZMfKd
	VBZJk57BB+OeT2kTkoNvKaeYkJCTbrySH4N0Wpk=
X-Google-Smtp-Source: ACHHUZ79VHMcIqX7iJPOAGTiRmV38ChV2yl5EgFdR962kzuSVB4cmdJaiSi1W5ytU1STeUQ/NtrG5Q==
X-Received: by 2002:a7b:c7d2:0:b0:3f4:2255:8608 with SMTP id z18-20020a7bc7d2000000b003f422558608mr9181759wmk.31.1685984904107;
        Mon, 05 Jun 2023 10:08:24 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 4/4] x86/microcode: Prevent attempting updates if DIS_MCU_LOAD is set
Date: Mon,  5 Jun 2023 18:08:17 +0100
Message-Id: <20230605170817.9913-5-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230605170817.9913-1-alejandro.vallejo@cloud.com>
References: <20230605170817.9913-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If IA32_MSR_MCU_CONTROL exists then it's possible a CPU may be unable to
perform microcode updates. This is controlled through the DIS_MCU_LOAD bit
and is intended for baremetal clouds where the owner may not trust the
tenant to choose the microcode version in use. This patch makes sure we
only expose the microcode loading interface when it can be actually used,
while also allowing reads of current microcode versions.

Patch summary:
 * Read CPUID leaf 7d0 early so DIS_MCU_LOAD can be checked.
 * Hide microcode loading handlers if DIS_MCU_LOAD is set except for
   collect_cpu_info()
 * Update microcode_update_one() so APs can read their
   microcode version even if DIS_MCU_LOAD is set.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

---
v2:
  * Moved check from apply time to init time.
---
 xen/arch/x86/cpu/microcode/core.c     | 31 +++++++++++++++++++++++++--
 xen/arch/x86/include/asm/cpufeature.h |  1 +
 xen/arch/x86/include/asm/msr-index.h  |  5 +++++
 3 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 4f60d96d98..a4c123118b 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -749,11 +749,12 @@ __initcall(microcode_init);
 /* Load a cached update to current cpu */
 int microcode_update_one(void)
 {
+    if ( ucode_ops.collect_cpu_info )
+        alternative_vcall(ucode_ops.collect_cpu_info);
+
     if ( !ucode_ops.apply_microcode )
         return -EOPNOTSUPP;
 
-    alternative_vcall(ucode_ops.collect_cpu_info);
-
     return microcode_update_cpu(NULL);
 }
 
@@ -849,12 +850,25 @@ static void __init early_read_cpuid_7d0(void)
             = cpuid_count_edx(7, 0);
 }
 
+static bool __init this_cpu_can_install_update(void)
+{
+    uint64_t mcu_ctrl;
+
+    if ( !cpu_has_mcu_ctrl )
+        return true;
+
+    rdmsrl(MSR_MCU_CONTROL, mcu_ctrl);
+    return !(mcu_ctrl & MCU_CONTROL_DIS_MCU_LOAD);
+}
+
 int __init early_microcode_init(unsigned long *module_map,
                                 const struct multiboot_info *mbi)
 {
     const struct cpuinfo_x86 *c = &boot_cpu_data;
     int rc = 0;
 
+    early_read_cpuid_7d0();
+
     switch ( c->x86_vendor )
     {
     case X86_VENDOR_AMD:
@@ -871,6 +885,15 @@ int __init early_microcode_init(unsigned long *module_map,
          * present.
          */
         ucode_ops = intel_ucode_ops;
+
+        /*
+         * In the case where microcode updates are blocked by the
+         * DIS_MCU_LOAD bit we can still read the microcode version even if
+         * we can't change it.
+         */
+        if ( !this_cpu_can_install_update() )
+            ucode_ops = (struct microcode_ops){ .collect_cpu_info =
+                                    intel_ucode_ops.collect_cpu_info };
         break;
     }
 
@@ -900,6 +923,10 @@ int __init early_microcode_init(unsigned long *module_map,
     if ( ucode_mod.mod_end || ucode_blob.size )
         rc = early_microcode_update_cpu();
 
+    /*
+     * We just updated microcode so we must reload the boot_cpu_data bits
+     * we read before because they might be stale after the updata.
+     */
     early_read_cpuid_7d0();
 
     /*
diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index ace31e3b1f..0118171d7e 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -192,6 +192,7 @@ static inline bool boot_cpu_has(unsigned int feat)
 #define cpu_has_if_pschange_mc_no boot_cpu_has(X86_FEATURE_IF_PSCHANGE_MC_NO)
 #define cpu_has_tsx_ctrl        boot_cpu_has(X86_FEATURE_TSX_CTRL)
 #define cpu_has_taa_no          boot_cpu_has(X86_FEATURE_TAA_NO)
+#define cpu_has_mcu_ctrl        boot_cpu_has(X86_FEATURE_MCU_CTRL)
 #define cpu_has_fb_clear        boot_cpu_has(X86_FEATURE_FB_CLEAR)
 
 /* Synthesized. */
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 2749e433d2..5c1350b5f9 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -165,6 +165,11 @@
 #define  PASID_PASID_MASK                   0x000fffff
 #define  PASID_VALID                        (_AC(1, ULL) << 31)
 
+#define MSR_MCU_CONTROL                     0x00001406
+#define  MCU_CONTROL_LOCK                   (_AC(1, ULL) <<  0)
+#define  MCU_CONTROL_DIS_MCU_LOAD           (_AC(1, ULL) <<  1)
+#define  MCU_CONTROL_EN_SMM_BYPASS          (_AC(1, ULL) <<  2)
+
 #define MSR_UARCH_MISC_CTRL                 0x00001b01
 #define  UARCH_CTRL_DOITM                   (_AC(1, ULL) <<  0)
 
-- 
2.34.1


