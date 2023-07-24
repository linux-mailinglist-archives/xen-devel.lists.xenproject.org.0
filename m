Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B14D75FC92
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 18:53:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569163.889470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNynd-0001FF-0X; Mon, 24 Jul 2023 16:52:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569163.889470; Mon, 24 Jul 2023 16:52:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNync-0001C6-Sr; Mon, 24 Jul 2023 16:52:44 +0000
Received: by outflank-mailman (input) for mailman id 569163;
 Mon, 24 Jul 2023 16:52:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+YiG=DK=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qNyna-0000gc-Ty
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 16:52:42 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8077ee23-2a42-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 18:52:40 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-31758eb5db8so1531798f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 09:52:40 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a5d60cd000000b0030ada01ca78sm13480777wrt.10.2023.07.24.09.52.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 09:52:39 -0700 (PDT)
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
X-Inumbo-ID: 8077ee23-2a42-11ee-8612-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1690217560; x=1690822360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQrfrX/9YiZ+DtYGqTJdty4w9Ag9CCl3bmUTiKKBqx4=;
        b=NleyQ1Kylc04W1xqGCWqUrYVCY060mcMc97m19FGOqMDCkwr5Lal13M+XnJSv3v+0J
         YyDVLE5OSkdWKJxFrRXhoH+fleYHOO+T+OQRbW5C2YP9Z1uQ4U24Br6/r2U8a1ItW2s3
         Nm3QE8qXMPwwspb2sYXZGc8ayB6FPWVgRECQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690217560; x=1690822360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FQrfrX/9YiZ+DtYGqTJdty4w9Ag9CCl3bmUTiKKBqx4=;
        b=aUhgIJ9PhaOD1l/RaBzoeD2XYmxhwAJOb5lGZrCLRtY+xLF2ST2DsswcH946P0rSHU
         It18urNp8CJQXGg72RRbnYLsI6Ee+tTGWeM+zWtHYhqItvZ2fN87/X6RlzQ7dzLzplJB
         djW877Oigd5luDLnhZ+4M5bNtpoz4qkNpKZc5RC8LXB8Ql0b5ccO/VgBjHGNr96fCNdI
         lMTtun229AmlfZfTJoRJZ1DJAd8hEAIEvm7JGHpdF3vIdIzcYKAcvBv00TQk8C/e/vac
         KdxtjY6c+njRDDhTGeAmHy1zIsa8z3RjKxEwr1Bw1GBHDvQQkXbzddBrB+DyumJKzJX6
         KwNw==
X-Gm-Message-State: ABy/qLZ55SeULu+MtsvBx9yRAJAm6v9V8IdWFHnCXwk+F0XiBaI+ub/W
	YlzlmvvXAeG9BXJncNrLt7UDao0ZdT6RiVnWTtY=
X-Google-Smtp-Source: APBJJlFAXSaZiAeePI7MIQoas4MEobXA1tZgPfr4bR2vIkOy4g/E9EDAEk5wNZTEIxctc74TN6fXxQ==
X-Received: by 2002:adf:f5ce:0:b0:314:11f3:ca94 with SMTP id k14-20020adff5ce000000b0031411f3ca94mr8194166wrp.41.1690217560130;
        Mon, 24 Jul 2023 09:52:40 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v6 3/3] x86/microcode: Disable microcode update handler if DIS_MCU_UPDATE is set
Date: Mon, 24 Jul 2023 17:52:35 +0100
Message-Id: <20230724165235.25262-4-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724165235.25262-1-alejandro.vallejo@cloud.com>
References: <20230724165235.25262-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If IA32_MSR_MCU_CONTROL exists then it's possible a CPU may be unable to
perform microcode updates. This is controlled through the DIS_MCU_LOAD bit
and is intended for baremetal clouds where the owner may not trust the
tenant to choose the microcode version in use. If we notice that bit being
set then simply disable the "apply_microcode" handler so we can't even try
to perform update (as it's known to be silently dropped).

While at it, remove the Intel family check, as microcode loading is
supported on every Intel64 CPU.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v6:
  * Amended early exit comment to cover both !can_load and rev=~0 (Jan)
---
 xen/arch/x86/cpu/microcode/core.c     | 20 ++++++++++++++------
 xen/arch/x86/cpu/microcode/intel.c    | 13 +++++++++++++
 xen/arch/x86/cpu/microcode/private.h  |  7 +++++++
 xen/arch/x86/include/asm/cpufeature.h |  1 +
 xen/arch/x86/include/asm/msr-index.h  |  5 +++++
 5 files changed, 40 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 44bc0fafa3..ec921f5b77 100644
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
 
@@ -871,13 +875,17 @@ int __init early_microcode_init(unsigned long *module_map,
 
     /*
      * Some hypervisors deliberately report a microcode revision of -1 to
-     * mean that they will not accept microcode updates. We take the hint
-     * and ignore the microcode interface in that case.
+     * mean that they will not accept microcode updates.
+     *
+     * It's also possible the hardware might have built-in support to disable
+     * updates and someone (e.g: a baremetal cloud provider) disabled them.
+     *
+     * Take the hint in either case and ignore the microcode interface.
      */
-    if ( this_cpu(cpu_sig).rev == ~0 )
+    if ( this_cpu(cpu_sig).rev == ~0 || !can_load )
     {
         printk(XENLOG_INFO "Microcode loading disabled due to: %s",
-                           "HW toggle");
+                           can_load ? "rev = ~0" : "HW toggle");
         ucode_ops.apply_microcode = NULL;
         return -ENODEV;
     }
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
index 64e1dad225..5422baed27 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -193,6 +193,7 @@ static inline bool boot_cpu_has(unsigned int feat)
 #define cpu_has_if_pschange_mc_no boot_cpu_has(X86_FEATURE_IF_PSCHANGE_MC_NO)
 #define cpu_has_tsx_ctrl        boot_cpu_has(X86_FEATURE_TSX_CTRL)
 #define cpu_has_taa_no          boot_cpu_has(X86_FEATURE_TAA_NO)
+#define cpu_has_mcu_ctrl        boot_cpu_has(X86_FEATURE_MCU_CTRL)
 #define cpu_has_fb_clear        boot_cpu_has(X86_FEATURE_FB_CLEAR)
 #define cpu_has_rrsba           boot_cpu_has(X86_FEATURE_RRSBA)
 
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 2382fc8e11..a5f730e9a6 100644
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


