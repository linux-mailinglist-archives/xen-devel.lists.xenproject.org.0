Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7868D773A59
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 15:07:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579822.907978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTMQo-0007zf-KT; Tue, 08 Aug 2023 13:07:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579822.907978; Tue, 08 Aug 2023 13:07:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTMQo-0007wq-Go; Tue, 08 Aug 2023 13:07:26 +0000
Received: by outflank-mailman (input) for mailman id 579822;
 Tue, 08 Aug 2023 13:07:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gjkb=DZ=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qTMND-0003uf-IT
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 13:03:43 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ffa01cc4-35eb-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 15:03:41 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-317e427488aso2043307f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Aug 2023 06:03:41 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 t6-20020adfe446000000b003179b3fd837sm13699587wrm.33.2023.08.08.06.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Aug 2023 06:03:40 -0700 (PDT)
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
X-Inumbo-ID: ffa01cc4-35eb-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1691499821; x=1692104621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kvlCcPtPAQFDMSDymQzg61qOJ0Yqizq1giWyB3+8O1o=;
        b=UhZDUQUqIzVHwHRdOITT+sEaVR91EiAnNxDHC7GkBAUt7ayneL22IhlskttvQoTrVK
         R91w0dOcAe5vT6mLDvIuVcKyffIkGmrZhfZnO2yvkeBvvuBg455OU4CBSM7eqQYwT6ZN
         4b5vhe9218fy2NjXrvdq/iCtHgnWp19jQIZXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691499821; x=1692104621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kvlCcPtPAQFDMSDymQzg61qOJ0Yqizq1giWyB3+8O1o=;
        b=MXIdOWkC3s9GMvPFG9Rs3EvffDwgeD+fKXdaffi95lFfK+Y3gBZibL6/N6pP5MGnCz
         yg8vJy1F7f+CyrvwoaE4ZZQsKrsLJPzfgCRgMHG8dAh/VUNwrwRCBHNRt/Lhy7iV6F/v
         AeppuZkVGhRWe9Ht1rX87+i79Vkg9G9WMIKj0+4PPTFesHSCedC2IbryIZ5oQhaI6dzP
         pJQ1uoduRauRWOKHJFjgpEfAv2YyOwaUb+V5VQmFHxyciFd1Ela35dNvR6CxGQDBcQA9
         8jNybWnwmx6lbeahV4/cQQUx8TdV7eg1h9aKcgbdKcseMTA4It5gYUH5qR5w/cMEFUVX
         gD/A==
X-Gm-Message-State: AOJu0YyVy5LcHVaWLDLc+kGZdzINI/9TaXlhg8jV9aWAIsYif1wX+qPY
	wYupZgA2I/v1GbWLjJBGIjrD+YWgfe1AYYOF0Ds=
X-Google-Smtp-Source: AGHT+IF5l6zl97y667NwMhYRhmd4uw5p8W7y4gDLDxyKSXlHz8gs2OM1dba3xSr7Z4fI5rjxLLfvnQ==
X-Received: by 2002:a05:6000:c8:b0:313:fbd0:9813 with SMTP id q8-20020a05600000c800b00313fbd09813mr9103289wrx.28.1691499821207;
        Tue, 08 Aug 2023 06:03:41 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v7 3/3] x86/microcode: Disable microcode update handler if DIS_MCU_UPDATE is set
Date: Tue,  8 Aug 2023 14:03:31 +0100
Message-Id: <20230808130331.27995-4-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808130331.27995-1-alejandro.vallejo@cloud.com>
References: <20230808130331.27995-1-alejandro.vallejo@cloud.com>
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
v7:
 * No change
---
 xen/arch/x86/cpu/microcode/core.c     | 20 ++++++++++++++------
 xen/arch/x86/cpu/microcode/intel.c    | 13 +++++++++++++
 xen/arch/x86/cpu/microcode/private.h  |  7 +++++++
 xen/arch/x86/include/asm/cpufeature.h |  1 +
 xen/arch/x86/include/asm/msr-index.h  |  5 +++++
 5 files changed, 40 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 273840fbcf..ba9c9a8b1d 100644
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
         printk(XENLOG_WARNING "Microcode loading disabled due to: %s",
-                              "rev = ~0");
+                              can_load ? "rev = ~0" : "HW toggle");
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
index 4d41c171d2..cf8b2fa15c 100644
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


