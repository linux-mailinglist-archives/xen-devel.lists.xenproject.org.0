Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D04BA73A785
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 19:42:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553878.864729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCOKB-0007t7-UT; Thu, 22 Jun 2023 17:42:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553878.864729; Thu, 22 Jun 2023 17:42:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCOKB-0007pl-Mr; Thu, 22 Jun 2023 17:42:27 +0000
Received: by outflank-mailman (input) for mailman id 553878;
 Thu, 22 Jun 2023 17:42:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VOAB=CK=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qCOKA-00072r-79
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 17:42:26 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25b0c98e-1124-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 19:42:24 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f9b4bf99c2so44588075e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jun 2023 10:42:24 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 j11-20020a5d604b000000b003078681a1e8sm7558457wrt.54.2023.06.22.10.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 10:42:23 -0700 (PDT)
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
X-Inumbo-ID: 25b0c98e-1124-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1687455744; x=1690047744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ijOwIEewQGYf1mJf7n5AJxbCxji2gEFwB1bTgLtLhDs=;
        b=H8qVwRH7wM1fmkv8p0b9WtBfiik/hUnhLr2SsoqB/HRQ5pNls6lt/SPNFpm+MhO/Uy
         0bIhuHiornS4rjSjYZN0loHKafmo9pKjekC8NlHIQ9yrm1Xym8s1VLk/50vqHEUUFxvs
         BzDRQb3BnHA2DhSeDSO3sybBswVbhyi4GhXz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687455744; x=1690047744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ijOwIEewQGYf1mJf7n5AJxbCxji2gEFwB1bTgLtLhDs=;
        b=EOB2UgAYg8AXZMt7Nf2I1Kuz1H6gxvhfUkjWSKrkM93cl6OafZPDfFX/vnfifEzcl9
         I0XcME38tp0R11AcE40Ew3XtITTmGHyKqMBMn80PhNksJvLaJ8+oVpqFZEZxDtbqye/d
         ag9VxyrFX2c3eXrIQHmkTZgH7cEpYtr+ZAhEUAtRvcWDbDLkFzIBSqKq4YG/htY79K2Q
         AJi1CLG5MGLWSXUr846RtSrWI3LHmA910oGL+mucYJKYB6XjNlxcAIG4Qb1oGVOzIFLl
         6bHaJbrVxYSU2zjYwnj5Nj0jWrBHakCtC5GHPImZW0U1sisdArZdHT9pKdNY9ooIoo0N
         iRxQ==
X-Gm-Message-State: AC+VfDzZReKJvFkfTu6rxTYmJX3mmgajks0ztGYx2p6TRkjkRMMOuKDa
	6p7st8xUNq0j/WlzzkWef1t8QL+yQT4c875nsJM=
X-Google-Smtp-Source: ACHHUZ6WdrgeXMlAJnhEHMAzVM0SLtM5vyeO+avhXb/bMA2tSdEVMeqZi0Ve6yDVFo0Hd1g/hriqFw==
X-Received: by 2002:a1c:f603:0:b0:3f8:f80e:7b45 with SMTP id w3-20020a1cf603000000b003f8f80e7b45mr14405599wmc.7.1687455743932;
        Thu, 22 Jun 2023 10:42:23 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 4/4] x86/microcode: Disable microcode update handler if DIS_MCU_UPDATE is set
Date: Thu, 22 Jun 2023 18:42:19 +0100
Message-Id: <20230622174219.8871-5-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230622174219.8871-1-alejandro.vallejo@cloud.com>
References: <20230622174219.8871-1-alejandro.vallejo@cloud.com>
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
v4:
  * Moved the Intel family-check removal here. Previously integrated in
    other patches
  * Moved DIS_MCU_LOAD logic into a vendor-specific
    intel_can_load_microcode() function.
---
 xen/arch/x86/cpu/microcode/core.c     | 10 +++++++---
 xen/arch/x86/cpu/microcode/intel.c    | 13 +++++++++++++
 xen/arch/x86/cpu/microcode/private.h  |  7 +++++++
 xen/arch/x86/include/asm/cpufeature.h |  1 +
 xen/arch/x86/include/asm/msr-index.h  |  5 +++++
 5 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index dda6f03f7d..de0e61d3dd 100644
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
-    if ( this_cpu(cpu_sig).rev == ~0 ) {
+    if ( this_cpu(cpu_sig).rev == ~0 || !can_load ) {
         printk(XENLOG_WARNING "Microcode loading disabled\n");
         ucode_ops.apply_microcode = NULL;
         return -ENODEV;
diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index 8d4d6574aa..c51757da90 100644
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
+    return  !(mcu_ctrl & MCU_CONTROL_DIS_MCU_LOAD);
+}
+
 const struct microcode_ops __initconst_cf_clobber intel_ucode_ops = {
     .cpu_request_microcode            = cpu_request_microcode,
     .collect_cpu_info                 = collect_cpu_info,
diff --git a/xen/arch/x86/cpu/microcode/private.h b/xen/arch/x86/cpu/microcode/private.h
index 626aeb4d08..87fcf84373 100644
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
+bool __init intel_can_load_microcode(void);
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


