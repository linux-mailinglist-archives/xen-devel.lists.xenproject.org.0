Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FA374299C
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 17:27:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556912.869817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEtY3-0001aW-Ak; Thu, 29 Jun 2023 15:27:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556912.869817; Thu, 29 Jun 2023 15:27:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEtY3-0001S4-30; Thu, 29 Jun 2023 15:27:07 +0000
Received: by outflank-mailman (input) for mailman id 556912;
 Thu, 29 Jun 2023 15:27:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4caF=CR=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qEtY1-0000oy-7c
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 15:27:05 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65180cfa-1691-11ee-8611-37d641c3527e;
 Thu, 29 Jun 2023 17:27:01 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-992b66e5affso74265466b.3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jun 2023 08:27:01 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 v11-20020a170906564b00b00992c4103cb5sm307727ejr.129.2023.06.29.08.27.00
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
X-Inumbo-ID: 65180cfa-1691-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1688052421; x=1690644421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G67gLa/o7/WHSN6dkAdpT425Jo9Uwtlq2X27eVNLdd8=;
        b=CnuuXj8PwDbeJspOFZNReQGrG/5s3fsRN7gJ8gusWs3LgYeWxowuGqE01VqqK5Pomk
         sPDbREl9Ktby9eErAH6DkCaGTcAdNwLLjVXDjMWlwAe7BSXKXC/+BjB/XMhqFHGzRkl/
         //AbV59CxqU+scRdZkcKJdWsinQzgpf/YlXvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688052421; x=1690644421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G67gLa/o7/WHSN6dkAdpT425Jo9Uwtlq2X27eVNLdd8=;
        b=WGxKl0XHULH0/PIa6QRBp8LdZ0UPhCD7maR7mSuJpWDpGOmvCWrBkr1/7kjrsKE1Bf
         h6L7pIlmVnAgFGD5pj4lQmOPMzGgeZZSTg0Gn8j07TFAo3w9DTqZMB7fMfsdKnoi2OfT
         ZP1Ep4ylcJotxUHEfqcJGB0Btt14vmg3Gt3Bx5rMc1ria/wOjFtVhDzpkihhwB5DCeob
         LpdjLjDVsy3W4yxfoUQTnNLy6hLboMZ8Ptv/s5e3pnKHH38QEBlj7L38tBRRjzZYyxYp
         PFP2lhD9wtr1d/x+C9DFRzydJuAKlPqfTJvBwtJ4JjoIJVP72NQoqEmWZR0Gko0/TOba
         1YKQ==
X-Gm-Message-State: AC+VfDxbn4ZMflPsYoOOJTwgh6zFZ7tcIwO4E3USsuGXaUSefWUFQG1b
	KMY7SkUJBURpAn3u4AjsWkXz3wXsxBxUIjaoJkY=
X-Google-Smtp-Source: ACHHUZ4KnEuLzL96joYK2MZR6qliLnOJDmS5URTcsPK4LfoteX6IGLCdTBNlEyaIivECeI2GcUeDzQ==
X-Received: by 2002:a17:906:9381:b0:98e:37fe:691b with SMTP id l1-20020a170906938100b0098e37fe691bmr10225842ejx.34.1688052421260;
        Thu, 29 Jun 2023 08:27:01 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 4/4] x86/microcode: Disable microcode update handler if DIS_MCU_UPDATE is set
Date: Thu, 29 Jun 2023 16:26:56 +0100
Message-Id: <20230629152656.12655-5-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230629152656.12655-1-alejandro.vallejo@cloud.com>
References: <20230629152656.12655-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If IA32_MSR_MCU_CONTROL exists then it's possible a CPU may be unable to
perform microcode updates. This is controlled through the DIS_MCU_LOAD bit
and is intended for baremetal clouds where the owner may not trust the
tenant to choose the microcode version in use. If we notice that bit being
set then simply disable the "apply_microcode" handler so we can't even try
to perform update (as it's known to be silently dropped).

While at it, remove the Intel family check, as microcode loading is
supported on every Intel 64 CPU.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v5:
  * Removed __init on declaration
  * Minor style fix (2 spaces rather than 1 after "return")
---
 xen/arch/x86/cpu/microcode/core.c     | 10 +++++++---
 xen/arch/x86/cpu/microcode/intel.c    | 13 +++++++++++++
 xen/arch/x86/cpu/microcode/private.h  |  7 +++++++
 xen/arch/x86/include/asm/cpufeature.h |  1 +
 xen/arch/x86/include/asm/msr-index.h  |  5 +++++
 5 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 98a5aebfe3..982b278c9e 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -847,17 +847,21 @@ int __init early_microcode_init(unsigned long *module_map,
 {
     const struct cpuinfo_x86 *c = &boot_cpu_data;
     int rc = 0;
+    bool can_load = false;
 
     switch ( c->x86_vendor )
     {
     case X86_VENDOR_AMD:
         if ( c->x86 >= 0x10 )
+        {
             ucode_ops = amd_ucode_ops;
+            can_load = true;
+        }
         break;
 
     case X86_VENDOR_INTEL:
-        if ( c->x86 >= 6 )
-            ucode_ops = intel_ucode_ops;
+        ucode_ops = intel_ucode_ops;
+        can_load = intel_can_load_microcode();
         break;
     }
 
@@ -874,7 +878,7 @@ int __init early_microcode_init(unsigned long *module_map,
      * mean that they will not accept microcode updates. We take the hint
      * and ignore the microcode interface in that case.
      */
-    if ( this_cpu(cpu_sig).rev == ~0 )
+    if ( this_cpu(cpu_sig).rev == ~0 || !can_load )
     {
         printk(XENLOG_WARNING "Microcode loading disabled\n");
         ucode_ops.apply_microcode = NULL;
diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index 8d4d6574aa..060c529a6e 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -385,6 +385,19 @@ static struct microcode_patch *cf_check cpu_request_microcode(
     return patch;
 }
 
+bool __init intel_can_load_microcode(void)
+{
+    uint64_t mcu_ctrl;
+
+    if ( !cpu_has_mcu_ctrl )
+        return true;
+
+    rdmsrl(MSR_MCU_CONTROL, mcu_ctrl);
+
+    /* If DIS_MCU_LOAD is set applying microcode updates won't work */
+    return !(mcu_ctrl & MCU_CONTROL_DIS_MCU_LOAD);
+}
+
 const struct microcode_ops __initconst_cf_clobber intel_ucode_ops = {
     .cpu_request_microcode            = cpu_request_microcode,
     .collect_cpu_info                 = collect_cpu_info,
diff --git a/xen/arch/x86/cpu/microcode/private.h b/xen/arch/x86/cpu/microcode/private.h
index 626aeb4d08..d80787205a 100644
--- a/xen/arch/x86/cpu/microcode/private.h
+++ b/xen/arch/x86/cpu/microcode/private.h
@@ -60,6 +60,13 @@ struct microcode_ops {
         const struct microcode_patch *new, const struct microcode_patch *old);
 };
 
+/**
+ * Checks whether we can perform microcode updates on this Intel system
+ *
+ * @return True iff the microcode update facilities are enabled
+ */
+bool intel_can_load_microcode(void);
+
 extern const struct microcode_ops amd_ucode_ops, intel_ucode_ops;
 
 #endif /* ASM_X86_MICROCODE_PRIVATE_H */
diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index e2cb8f3cc7..608bc4dce0 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -192,6 +192,7 @@ static inline bool boot_cpu_has(unsigned int feat)
 #define cpu_has_if_pschange_mc_no boot_cpu_has(X86_FEATURE_IF_PSCHANGE_MC_NO)
 #define cpu_has_tsx_ctrl        boot_cpu_has(X86_FEATURE_TSX_CTRL)
 #define cpu_has_taa_no          boot_cpu_has(X86_FEATURE_TAA_NO)
+#define cpu_has_mcu_ctrl        boot_cpu_has(X86_FEATURE_MCU_CTRL)
 #define cpu_has_fb_clear        boot_cpu_has(X86_FEATURE_FB_CLEAR)
 #define cpu_has_rrsba           boot_cpu_has(X86_FEATURE_RRSBA)
 
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


