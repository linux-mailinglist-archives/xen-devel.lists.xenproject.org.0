Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BCC84AB80
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 02:21:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676578.1052753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXA8v-0007dJ-VH; Tue, 06 Feb 2024 01:20:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676578.1052753; Tue, 06 Feb 2024 01:20:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXA8v-0007a8-QB; Tue, 06 Feb 2024 01:20:57 +0000
Received: by outflank-mailman (input) for mailman id 676578;
 Tue, 06 Feb 2024 01:20:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+4KK=JP=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rXA8u-0007Lc-E7
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 01:20:56 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9f6cc8f-c48d-11ee-8a47-1f161083a0e0;
 Tue, 06 Feb 2024 02:20:55 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-51109060d6aso7221716e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 17:20:55 -0800 (PST)
Received: from georged-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 cu9-20020a170906ba8900b00a3726a5e5fdsm486803ejd.95.2024.02.05.17.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 17:20:53 -0800 (PST)
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
X-Inumbo-ID: f9f6cc8f-c48d-11ee-8a47-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1707182455; x=1707787255; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UyL8iRnNOrzO0tXt0n8exVji9pmykaMWjAoTvDaMaqU=;
        b=OWHkK360S0r4Ul1/tP7Q4uxYpaaG9VAlVUaP7/TbyXbh786wlEY2kaTyTRq4BsPlVU
         QmuJPmEcLKgmJVXq1hOTeN2s/sxU/Wk1F96HWzhXJZrIjm448KnLnPhRJgb9zho1d1GX
         N0u4XkO5N8l6QkysRwRaA2cXU/dXrfZAdnXAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707182455; x=1707787255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UyL8iRnNOrzO0tXt0n8exVji9pmykaMWjAoTvDaMaqU=;
        b=Xaxyo93gf30AOsLQf9jh2woG/VDoH5BSkNm01b+omIk5ng8JQdljjs544KWzTmSpgo
         71YyNEMQKQE8A2QMp53F2AQur1RvTg8RUIsQI1URDevmNrlb0lBp6Ff2TL14fpesRjVk
         tpGLKvsv8Aj3Cmdo4EmMZagjVKaQgg+wTRkI0yHBoalFpyIjuKm8qNdUOtwsG9NuIDIz
         xLsKSRLF6nO76qA75w2FY7SnBOCg8UX23HoB6aJDbqp7W0EmTpZqzoKCQgcpwIdvpPDi
         3iujbUwccQJeeaZBol1arpx1kDJDkj1lAqS41O38BpRYfNJ2QtgtFcA+7+yHRL1/bMR2
         fMyA==
X-Gm-Message-State: AOJu0YxLJIIThWEEQsw+mUDHOIrPkANdC1nBU10+v/vHd+yqmoL8x5Vi
	UXYU9IyZjNA/rZvcU62iy0D71XApR6e0BAEBGX4KUEk2Gkfmi962OOtxXdmdT4l29/3vWdsX0J+
	NS00=
X-Google-Smtp-Source: AGHT+IFXWt1zdRs1Qg+qzCQpO7rNI1yCQJ/5UArCsgophMlXMPxm+ZJT0/q9e/bXuOnjUq/kUe4MRw==
X-Received: by 2002:ac2:533c:0:b0:511:525a:a527 with SMTP id f28-20020ac2533c000000b00511525aa527mr491189lfh.49.1707182455217;
        Mon, 05 Feb 2024 17:20:55 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXjUY728lp6AlPZ93eaAYRGO8gG2OWdp8QzNUYPwV1CfEh1Q0r0oPr6krNNWob5guieNOn3eVe3Gu+9KBHYlER6WPdwbRZqLCz7rCHjkEzZgfoCBomlAuH92z+4Ie1ROU1ie4HOtf/2mMMwopr+C9/ZXX5N0Frs0hDw8/lTyYlrrTLMQJO3HDR4N9Djn7JyScRfDWPxQqgMjrjKaakGd8+fDpW6sg4yRFnj321K
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH 3/6] xen/hvm: Move other hvm_function_table booleans into the caps bitfield
Date: Tue,  6 Feb 2024 01:20:48 +0000
Message-Id: <20240206012051.3564035-4-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240206012051.3564035-1-george.dunlap@cloud.com>
References: <20240206012051.3564035-1-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Moving them all together has several advantages:
 * Collects them all in one part of the struct
 * The `caps` field means that we can drop the "_supported" suffix, as it's
   clear what is meant.

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jun Nakajima <jun.nakajima@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>
---
 xen/arch/x86/hvm/hvm.c             |  6 +++---
 xen/arch/x86/hvm/svm/svm.c         |  2 +-
 xen/arch/x86/hvm/vlapic.c          |  4 ++--
 xen/arch/x86/hvm/vmx/vmcs.c        |  2 +-
 xen/arch/x86/hvm/vmx/vmx.c         |  8 ++++----
 xen/arch/x86/include/asm/hvm/hvm.h | 29 ++++++++++++++---------------
 6 files changed, 25 insertions(+), 26 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index ae9d4c4756..aa2f2d054a 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -136,7 +136,7 @@ static struct notifier_block cpu_nfb = {
 
 static bool __init hap_supported(struct hvm_function_table *fns)
 {
-    if ( !fns->hap_supported )
+    if ( !fns->caps.hap )
     {
         printk("HVM: Hardware Assisted Paging (HAP) not detected\n");
         return false;
@@ -144,7 +144,7 @@ static bool __init hap_supported(struct hvm_function_table *fns)
 
     if ( !opt_hap_enabled )
     {
-        fns->hap_supported = 0;
+        fns->caps.hap = 0;
         printk("HVM: Hardware Assisted Paging (HAP) detected but disabled\n");
         return false;
     }
@@ -190,7 +190,7 @@ static int __init cf_check hvm_enable(void)
     }
 
     if ( !opt_altp2m_enabled )
-        hvm_funcs.altp2m_supported = 0;
+        hvm_funcs.caps.altp2m = 0;
 
     if ( opt_hvm_fep )
         warning_add(warning_hvm_fep);
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 40bc1ffbc6..b551eac807 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2580,7 +2580,7 @@ const struct hvm_function_table * __init start_svm(void)
     if ( !printed )
         printk(" - none\n");
 
-    svm_function_table.hap_supported = cpu_has_svm_npt;
+    svm_function_table.caps.hap = cpu_has_svm_npt;
     svm_function_table.caps.hap_superpage_2mb = true;
     svm_function_table.caps.hap_superpage_1gb = cpu_has_page1gb;
 
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 71a4b954b0..dcbcf4a1fe 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1326,7 +1326,7 @@ int vlapic_has_pending_irq(struct vcpu *v)
     if ( irr == -1 )
         return -1;
 
-    if ( hvm_funcs.virtual_intr_delivery_enabled &&
+    if ( hvm_funcs.caps.virtual_intr_delivery &&
          !nestedhvm_vcpu_in_guestmode(v) )
         return irr;
 
@@ -1361,7 +1361,7 @@ int vlapic_ack_pending_irq(struct vcpu *v, int vector, bool force_ack)
     int isr;
 
     if ( !force_ack &&
-         hvm_funcs.virtual_intr_delivery_enabled )
+         hvm_funcs.caps.virtual_intr_delivery )
         return 1;
 
     /* If there's no chance of using APIC assist then bail now. */
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 53f9d81aa9..aff69d5320 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -112,7 +112,7 @@ static int cf_check parse_ept_param_runtime(const char *s)
     struct domain *d;
     int val;
 
-    if ( !cpu_has_vmx_ept || !hvm_funcs.hap_supported ||
+    if ( !cpu_has_vmx_ept || !hvm_funcs.caps.hap ||
          !(hvm_funcs.caps.hap_superpage_2mb ||
            hvm_funcs.caps.hap_superpage_1gb) )
     {
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 9cfc0140b4..4bcf436d2c 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2963,7 +2963,7 @@ const struct hvm_function_table * __init start_vmx(void)
         return NULL;
     }
 
-    vmx_function_table.singlestep_supported = cpu_has_monitor_trap_flag;
+    vmx_function_table.caps.singlestep = cpu_has_monitor_trap_flag;
 
     if ( cpu_has_vmx_dt_exiting )
         vmx_function_table.set_descriptor_access_exiting =
@@ -2986,8 +2986,8 @@ const struct hvm_function_table * __init start_vmx(void)
                 printk("VMX: Disabling executable EPT superpages due to CVE-2018-12207\n");
         }
 
-        vmx_function_table.hap_supported = 1;
-        vmx_function_table.altp2m_supported = 1;
+        vmx_function_table.caps.hap = 1;
+        vmx_function_table.caps.altp2m = 1;
 
         vmx_function_table.caps.hap_superpage_2mb = cpu_has_vmx_ept_2mb;
         vmx_function_table.caps.hap_superpage_1gb = cpu_has_vmx_ept_1gb;
@@ -3000,7 +3000,7 @@ const struct hvm_function_table * __init start_vmx(void)
         vmx_function_table.update_eoi_exit_bitmap = vmx_update_eoi_exit_bitmap;
         vmx_function_table.process_isr = vmx_process_isr;
         vmx_function_table.handle_eoi = vmx_handle_eoi;
-        vmx_function_table.virtual_intr_delivery_enabled = true;
+        vmx_function_table.caps.virtual_intr_delivery = true;
     }
 
     if ( cpu_has_vmx_posted_intr_processing )
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index f50476f50f..bbd83a8275 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -86,20 +86,19 @@ struct hvm_vcpu_nonreg_state {
 struct hvm_function_table {
     const char *name;
 
-    /* Support Hardware-Assisted Paging? */
-    bool hap_supported;
-
-    /* Necessary hardware support for alternate p2m's? */
-    bool altp2m_supported;
-    bool singlestep_supported;
-
-    /* Hardware virtual interrupt delivery enable? */
-    bool virtual_intr_delivery_enabled;
-
     struct {
         /* Indicate HAP capabilities. */
-        bool hap_superpage_1gb:1,
-            hap_superpage_2mb:1;
+        bool hap:1,
+             hap_superpage_1gb:1,
+             hap_superpage_2mb:1,
+
+            /* Altp2m capabilities */
+            altp2m:1,
+            singlestep:1,
+            
+            /* Hardware virtual interrupt delivery enable? */
+            virtual_intr_delivery;
+
     } caps;
 
     /*
@@ -642,18 +641,18 @@ static inline void hvm_enable_msr_interception(struct domain *d, uint32_t msr)
 
 static inline bool hvm_is_singlestep_supported(void)
 {
-    return hvm_funcs.singlestep_supported;
+    return hvm_funcs.caps.singlestep;
 }
 
 static inline bool hvm_hap_supported(void)
 {
-    return hvm_funcs.hap_supported;
+    return hvm_funcs.caps.hap;
 }
 
 /* returns true if hardware supports alternate p2m's */
 static inline bool hvm_altp2m_supported(void)
 {
-    return hvm_funcs.altp2m_supported;
+    return hvm_funcs.caps.altp2m;
 }
 
 /* updates the current hardware p2m */
-- 
2.25.1


