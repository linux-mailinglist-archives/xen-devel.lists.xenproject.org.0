Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C0384AB7D
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 02:21:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676580.1052773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXA8x-00085o-HL; Tue, 06 Feb 2024 01:20:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676580.1052773; Tue, 06 Feb 2024 01:20:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXA8x-00083U-CW; Tue, 06 Feb 2024 01:20:59 +0000
Received: by outflank-mailman (input) for mailman id 676580;
 Tue, 06 Feb 2024 01:20:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+4KK=JP=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rXA8v-0007Zy-R6
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 01:20:57 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9161d00-c48d-11ee-98f5-efadbce2ee36;
 Tue, 06 Feb 2024 02:20:55 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a364b5c5c19so45634966b.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 17:20:54 -0800 (PST)
Received: from georged-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 cu9-20020a170906ba8900b00a3726a5e5fdsm486803ejd.95.2024.02.05.17.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 17:20:52 -0800 (PST)
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
X-Inumbo-ID: f9161d00-c48d-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1707182453; x=1707787253; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Amao/RbYbGVlKRe+4sVFHaBWBTnz/mv5zt9jnAf2gO8=;
        b=LKNiowik0XnHDD0CqYaXV0eLUrXBTSvg1XkU7YuEpWLAXFJ80hcDktP0gShj+pV3AT
         WtG38gll1uEeNGdM1K9IrwQSK+5o5lsVueOpRKIgnujkfJ2hI8SRqLgjDKvPwo6sxclk
         Rm8eANHeT3XU82laFliNWDepOKq4A+A7PFoxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707182453; x=1707787253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Amao/RbYbGVlKRe+4sVFHaBWBTnz/mv5zt9jnAf2gO8=;
        b=D/G1T5MTKT6Qlfs/kirS2onFYTvY/z2fnYKItZSUL8ABOrRpFj6icsXc2NA+xN3Jwh
         Qr3c4VUnjpEeNTWuQ7wB4Jm6k9SKUQ9Hv2sb3R50rHFil1XmkzR5SG7UZZV8S4YoYSfA
         LJrdrr6yfHwQ6+A8xevivITZvVL9saDInx9sS7R1hF5SKbRFCfAEnPTUW4KfysKksO4Z
         OInKfIzWpqIwsa+E3qn/XSbPTXPqg66UeCmKIEn5DpBgqHPwLb7PBhLjatOfJDVxZUdT
         TbG7kAKV3/d9rsgbeok2B3tSRwN75ExTZ1ie3nmzthAzFc0tTUqqAP7XIh1o1zPVzJpm
         CvSg==
X-Gm-Message-State: AOJu0YztnstcGKhQtCmXakjc4lJyiT7kqMsLD+zSeRiLZk2MvAmePNDk
	yY2CzY1RkdviUcoX+YXImYPvW6yJnpW7Lj+Af1gCXT7Vd1A/F+a1iAiZ8r4WJ5Dh1x3Bwckvhx3
	x8mA=
X-Google-Smtp-Source: AGHT+IHafK91jBtYVmLvGZnuwJyOkbsecn2SYHRWDD7tDRE43HnCVB/X8GZ1kkmM7X/wQATl2fHBYA==
X-Received: by 2002:a17:906:4095:b0:a37:2696:b3e with SMTP id u21-20020a170906409500b00a3726960b3emr862442ejj.59.1707182453136;
        Mon, 05 Feb 2024 17:20:53 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUgi6wyoYuGerkTH4fh6jBCjoCFbYJKmhCh45bbre+82qjLmXHDSP4F7NpPugLeTkxNPBKzt8DFEM0/JzDXgKYdYw4Ln4X0kDpJr7xaCv1MEf82JS4Y+Sv1h9R3+GcXonCWSGgasb8BlSk+LBzaNMumFX5tq/AtmA7c0yvwg4YXKBmsEzpHXs9MSC9VSYcWxBvKjT1vfOnDmPw06ItZTcoZuti96CDA7bzu+Brv
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH 1/6] xen/hvm: Convert hap_capabilities into a bitfield
Date: Tue,  6 Feb 2024 01:20:46 +0000
Message-Id: <20240206012051.3564035-2-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240206012051.3564035-1-george.dunlap@cloud.com>
References: <20240206012051.3564035-1-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

hvm_function_table is an internal structure; rather than manually
|-ing and &-ing bits, just make it a boolean bitfield and let the
compiler do all the work.  This makes everything easier to read, and
presumably allows the compiler more flexibility in producing efficient
code.

No functional change intended.

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
Questions:

* Should hap_superpage_2m really be set unconditionally, or should we
  condition it on cpu_has_svm_npt?

* Do we really need to "!!cpu_has_svm_npt"?  If so, wouldn't it be
  better to put the "!!"  in the #define, rather than requiring the
  user to know that it's needed?

CC: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jun Nakajima <jun.nakajima@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>
---
 xen/arch/x86/hvm/hvm.c             |  8 ++++----
 xen/arch/x86/hvm/svm/svm.c         |  4 ++--
 xen/arch/x86/hvm/vmx/vmcs.c        |  4 ++--
 xen/arch/x86/hvm/vmx/vmx.c         |  8 ++------
 xen/arch/x86/include/asm/hvm/hvm.h | 19 +++++++------------
 5 files changed, 17 insertions(+), 26 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index e8deeb0222..ae9d4c4756 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -174,17 +174,17 @@ static int __init cf_check hvm_enable(void)
     {
         printk("HVM: Hardware Assisted Paging (HAP) detected\n");
         printk("HVM: HAP page sizes: 4kB");
-        if ( fns->hap_capabilities & HVM_HAP_SUPERPAGE_2MB )
+        if ( fns->caps.hap_superpage_2mb )
         {
             printk(", 2MB%s", opt_hap_2mb ? "" : " [disabled]");
             if ( !opt_hap_2mb )
-                hvm_funcs.hap_capabilities &= ~HVM_HAP_SUPERPAGE_2MB;
+                hvm_funcs.caps.hap_superpage_2mb = false;
         }
-        if ( fns->hap_capabilities & HVM_HAP_SUPERPAGE_1GB )
+        if ( fns->caps.hap_superpage_1gb )
         {
             printk(", 1GB%s", opt_hap_1gb ? "" : " [disabled]");
             if ( !opt_hap_1gb )
-                hvm_funcs.hap_capabilities &= ~HVM_HAP_SUPERPAGE_1GB;
+                hvm_funcs.caps.hap_superpage_1gb = false;
         }
         printk("\n");
     }
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 65f437e958..5741287355 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2581,8 +2581,8 @@ const struct hvm_function_table * __init start_svm(void)
         printk(" - none\n");
 
     svm_function_table.hap_supported = !!cpu_has_svm_npt;
-    svm_function_table.hap_capabilities = HVM_HAP_SUPERPAGE_2MB |
-        (cpu_has_page1gb ? HVM_HAP_SUPERPAGE_1GB : 0);
+    svm_function_table.caps.hap_superpage_2mb = true;
+    svm_function_table.caps.hap_superpage_1gb = cpu_has_page1gb;
 
     return &svm_function_table;
 }
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 4fe1213855..53f9d81aa9 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -113,8 +113,8 @@ static int cf_check parse_ept_param_runtime(const char *s)
     int val;
 
     if ( !cpu_has_vmx_ept || !hvm_funcs.hap_supported ||
-         !(hvm_funcs.hap_capabilities &
-           (HVM_HAP_SUPERPAGE_2MB | HVM_HAP_SUPERPAGE_1GB)) )
+         !(hvm_funcs.caps.hap_superpage_2mb ||
+           hvm_funcs.caps.hap_superpage_1gb) )
     {
         printk("VMX: EPT not available, or not in use - ignoring\n");
         return 0;
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 1500dca603..9cfc0140b4 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2989,12 +2989,8 @@ const struct hvm_function_table * __init start_vmx(void)
         vmx_function_table.hap_supported = 1;
         vmx_function_table.altp2m_supported = 1;
 
-        vmx_function_table.hap_capabilities = 0;
-
-        if ( cpu_has_vmx_ept_2mb )
-            vmx_function_table.hap_capabilities |= HVM_HAP_SUPERPAGE_2MB;
-        if ( cpu_has_vmx_ept_1gb )
-            vmx_function_table.hap_capabilities |= HVM_HAP_SUPERPAGE_1GB;
+        vmx_function_table.caps.hap_superpage_2mb = cpu_has_vmx_ept_2mb;
+        vmx_function_table.caps.hap_superpage_1gb = cpu_has_vmx_ept_1gb;
 
         setup_ept_dump();
     }
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 985c1c14c6..f50476f50f 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -61,14 +61,6 @@ enum hvm_intblk {
 #define HVM_INTR_SHADOW_SMI    0x00000004
 #define HVM_INTR_SHADOW_NMI    0x00000008
 
-/*
- * HAP super page capabilities:
- * bit0: if 2MB super page is allowed?
- * bit1: if 1GB super page is allowed?
- */
-#define HVM_HAP_SUPERPAGE_2MB   0x00000001
-#define HVM_HAP_SUPERPAGE_1GB   0x00000002
-
 #define HVM_EVENT_VECTOR_UNSET    (-1)
 #define HVM_EVENT_VECTOR_UPDATING (-2)
 
@@ -104,8 +96,11 @@ struct hvm_function_table {
     /* Hardware virtual interrupt delivery enable? */
     bool virtual_intr_delivery_enabled;
 
-    /* Indicate HAP capabilities. */
-    unsigned int hap_capabilities;
+    struct {
+        /* Indicate HAP capabilities. */
+        bool hap_superpage_1gb:1,
+            hap_superpage_2mb:1;
+    } caps;
 
     /*
      * Initialise/destroy HVM domain/vcpu resources
@@ -402,8 +397,8 @@ int hvm_get_param(struct domain *d, uint32_t index, uint64_t *value);
     (hvm_paging_enabled(v) && ((v)->arch.hvm.guest_cr[4] & X86_CR4_PKS))
 
 /* Can we use superpages in the HAP p2m table? */
-#define hap_has_1gb (!!(hvm_funcs.hap_capabilities & HVM_HAP_SUPERPAGE_1GB))
-#define hap_has_2mb (!!(hvm_funcs.hap_capabilities & HVM_HAP_SUPERPAGE_2MB))
+#define hap_has_1gb hvm_funcs.caps.hap_superpage_1gb
+#define hap_has_2mb hvm_funcs.caps.hap_superpage_2mb
 
 #define hvm_long_mode_active(v) (!!((v)->arch.hvm.guest_efer & EFER_LMA))
 
-- 
2.25.1


