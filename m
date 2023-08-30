Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA6A78D74F
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 17:53:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593119.926062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbNVf-0006he-VM; Wed, 30 Aug 2023 15:53:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593119.926062; Wed, 30 Aug 2023 15:53:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbNVf-0006bO-N5; Wed, 30 Aug 2023 15:53:35 +0000
Received: by outflank-mailman (input) for mailman id 593119;
 Wed, 30 Aug 2023 15:53:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xver=EP=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1qbNVd-00064j-C7
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 15:53:33 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ef05f5f-474d-11ee-8783-cb3800f73035;
 Wed, 30 Aug 2023 17:53:32 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-401b0d97850so56354225e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Aug 2023 08:53:32 -0700 (PDT)
Received: from localhost.localdomain ([66.81.173.62])
 by smtp.gmail.com with ESMTPSA id
 b4-20020adff244000000b0031423a8f4f7sm17000009wrp.56.2023.08.30.08.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Aug 2023 08:53:31 -0700 (PDT)
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
X-Inumbo-ID: 5ef05f5f-474d-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1693410812; x=1694015612; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/+HKYAhX7EC0gTIYVkMy8jE7q46Uhlaj2+DxM/hBSg=;
        b=eFUVV1rE+yek0POMoIYAceLhCtv7OTIJbCSUxOShTOQcn1SjFvKGe9oIxbMQyta1PO
         iFZwEqFenEeHbaaA8Lpko4E/XIeSpbHzyS5vRtcrnoQcQyeFlOp3oPktozYPAkG1jXXC
         T7xUzbINRZd1JqbKSOY6hcuDlS3aKNhy0WN3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693410812; x=1694015612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g/+HKYAhX7EC0gTIYVkMy8jE7q46Uhlaj2+DxM/hBSg=;
        b=XQr6iiziMrC8jumjwTKVRgPNJdHut1Alxq9S/+I/FVuvwRhYwqTx/dKz+rd/e4uXHm
         E0apZHqZedO+vFCkAzKDdgVEBaAQNUFKtPZUmByorbL7RlOXgW2MRVpzxl4flBoUTSg+
         /tTlfMtnwxENNE3E48tM+43umSLJGxiDYqufUDxOBIMF1Vb7ntcEFL0R9TKWHBUXCFjT
         Z9K6aFHQ7lVRQEbJQBzOjQKLuofHz436OIgB2vt4qqRqyyTplvTfzeHNKjITfXi0YAqZ
         8cerzegJZQIRkgXfFbhsqdOxYGmgAQNNMb8kOEwuMlt1gWryFsLo/lEffu+LpqB+7n+7
         rRbw==
X-Gm-Message-State: AOJu0YxfX4Mur8p9W2xeDWIJ4E/7UF9lKHHTfQ2mF61wHfB2NSviyySg
	K5sioUzQtuK/6rILkbS0qgcqpS/GVci0Pz0hI9k=
X-Google-Smtp-Source: AGHT+IF1SdttMLt/Ch8hbVYgE/Ec2G85WpG/mqbpQeA/yTBTBi8Kt9N9c24EpqZu9Q7bYon1FlyHgA==
X-Received: by 2002:a05:600c:2193:b0:401:b705:ebe6 with SMTP id e19-20020a05600c219300b00401b705ebe6mr2110588wme.32.1693410811934;
        Wed, 30 Aug 2023 08:53:31 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v8 4/4] x86/microcode: Disable microcode update handler if DIS_MCU_UPDATE is set
Date: Wed, 30 Aug 2023 16:53:26 +0100
Message-Id: <20230830155326.10199-5-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230830155326.10199-1-alejandro.vallejo@cloud.com>
References: <20230830155326.10199-1-alejandro.vallejo@cloud.com>
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
v8:
 * No change
---
 xen/arch/x86/cpu/microcode/core.c     | 20 ++++++++++++++------
 xen/arch/x86/cpu/microcode/intel.c    | 13 +++++++++++++
 xen/arch/x86/cpu/microcode/private.h  |  7 +++++++
 xen/arch/x86/include/asm/cpufeature.h |  1 +
 xen/arch/x86/include/asm/msr-index.h  |  5 +++++
 5 files changed, 40 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index b3df4d40e6..65ebeb50de 100644
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
         printk(XENLOG_INFO "Microcode loading disabled due to: %s\n",
-               "rev = ~0");
+               can_load ? "rev = ~0" : "HW toggle");
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
index 0825343945..213c184b1c 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -201,6 +201,7 @@ static inline bool boot_cpu_has(unsigned int feat)
 #define cpu_has_if_pschange_mc_no boot_cpu_has(X86_FEATURE_IF_PSCHANGE_MC_NO)
 #define cpu_has_tsx_ctrl        boot_cpu_has(X86_FEATURE_TSX_CTRL)
 #define cpu_has_taa_no          boot_cpu_has(X86_FEATURE_TAA_NO)
+#define cpu_has_mcu_ctrl        boot_cpu_has(X86_FEATURE_MCU_CTRL)
 #define cpu_has_fb_clear        boot_cpu_has(X86_FEATURE_FB_CLEAR)
 #define cpu_has_rrsba           boot_cpu_has(X86_FEATURE_RRSBA)
 #define cpu_has_gds_ctrl        boot_cpu_has(X86_FEATURE_GDS_CTRL)
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 11ffed543a..5865611996 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -183,6 +183,11 @@
 #define MSR_PM_CTL1                         0x00000db1
 #define  PM_CTL1_HDC_ALLOW_BLOCK            BIT(0, ULL)
 
+#define MSR_MCU_CONTROL                     0x00001406
+#define  MCU_CONTROL_LOCK                   (_AC(1, ULL) <<  0)
+#define  MCU_CONTROL_DIS_MCU_LOAD           (_AC(1, ULL) <<  1)
+#define  MCU_CONTROL_EN_SMM_BYPASS          (_AC(1, ULL) <<  2)
+
 #define MSR_UARCH_MISC_CTRL                 0x00001b01
 #define  UARCH_CTRL_DOITM                   (_AC(1, ULL) <<  0)
 
-- 
2.34.1


