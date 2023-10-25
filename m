Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F527D7462
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 21:33:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623250.970987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvjd4-0004p6-8P; Wed, 25 Oct 2023 19:33:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623250.970987; Wed, 25 Oct 2023 19:33:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvjd4-0004nE-4p; Wed, 25 Oct 2023 19:33:22 +0000
Received: by outflank-mailman (input) for mailman id 623250;
 Wed, 25 Oct 2023 19:33:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xaZJ=GH=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1qvja3-0001Lv-Hr
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 19:30:15 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eaf13bc0-736c-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 21:30:13 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9bf86b77a2aso22697366b.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Oct 2023 12:30:13 -0700 (PDT)
Received: from edvint-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 hv6-20020a17090760c600b00985ed2f1584sm10408710ejc.187.2023.10.25.12.30.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 12:30:12 -0700 (PDT)
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
X-Inumbo-ID: eaf13bc0-736c-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1698262212; x=1698867012; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=szWwPrhRVQ5NEr0HTjBSWKJZPscEP7xbO0kPy1jcKl0=;
        b=BbdPFSkwhGMXJ+3yByYkH2XkVD5zbtBKkFaxJEH31hunMVtG6luBCjF3L0ekOYYkWB
         t0a4lF4O9SKrNQYUyCnKgM9LEVoUHj78Bf9mJaG5o1ZTex6bB4DLL8A2bQVTh1yWAgxS
         5RWZB5TFKpPoJjSye5cW85alZNDXiAXHkodBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698262212; x=1698867012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=szWwPrhRVQ5NEr0HTjBSWKJZPscEP7xbO0kPy1jcKl0=;
        b=TPKjtmzJ6MzY2YkRblR+l0q8v/EA45SN0kv98MIr7oGgRl5nSJUhxLONqXSTA8TXS8
         fU91VVXOabLJehDzqpo6uuUIihWfQ9jHpofOoA92PX5CsDMeqoGv/nhSk3CUh8IaX+Qo
         13y+Ao2BqsfiUWAhhR8rXmlPgBM526caDxsQVFFDgmJs20/SMoetj8yAp0HxCQojuUK3
         dfPT0acQ0THcPOhaEYmtB4kty+Ozs7p36F89sbSZVdIlrVMuIfCydjNU0QIFzr6lzrAL
         /rd5yw0NuWPG2S0ln/ojZRZ8oqTtw+QDsvYeFeEKatyaOJPY8+QQteZSfDKt882R8UKp
         jZ7Q==
X-Gm-Message-State: AOJu0Yx6HcugS2kYbqnSVHAwxRHS+XASi7w1i7z29syoAZR8kyeAy0/e
	fcvYrYAyAeX9DTLyjMjhA7RO0ZiADLDJBCKA5uw8jQ==
X-Google-Smtp-Source: AGHT+IH1Df6VfyiYXZUnnyFiE2b8zlT9ZC3eG4XHBSndaqVZArI6AToPuwzZbTQJS3WoT53YXNXNeQ==
X-Received: by 2002:a17:907:3d92:b0:9b2:b71f:83be with SMTP id he18-20020a1709073d9200b009b2b71f83bemr10365431ejc.1.1698262212590;
        Wed, 25 Oct 2023 12:30:12 -0700 (PDT)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH 18/22] x86/PMUv4: disable intercept for PERF_GLOBAL_STATUS
Date: Wed, 25 Oct 2023 20:29:48 +0100
Message-Id: <37b346bcfc47ed514822fd6565f63df57a8c7c5f.1698261255.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698261255.git.edwin.torok@cloud.com>
References: <cover.1698261255.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Edwin Török <edvin.torok@citrix.com>

Now that we have a way to set PERF_GLOBAL_STATUS by writing to
PERF_GLOBAL_STATUS_RESET (== PERF_GLOBAL_OVF_CTRL) and
PERF_GLOBAL_STATUS_SET we do not need to intercept this MSR anymore.

We can save/restore its state when saving/loading vPMU state, and
otherwise let the guest read it directly.

This is an optimization, perhaps it'd need a flag to disable it for
debugging purposes.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 xen/arch/x86/cpu/vpmu_intel.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index 5e660af395..59d0b2ca36 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -67,6 +67,7 @@ static bool_t __read_mostly full_width_write;
 
 /* Number of general-purpose and fixed performance counters */
 unsigned int __read_mostly arch_pmc_cnt, fixed_pmc_cnt;
+static unsigned int __read_mostly vpmu_version;
 
 /* Masks used for testing whether and MSR is valid */
 #define ARCH_CTRL_MASK  (~((1ull << 32) - 1) | (1ull << 21) | ARCH_CNTR_PIN_CONTROL)
@@ -228,6 +229,9 @@ static void core2_vpmu_set_msr_bitmap(struct vcpu *v)
 
     vmx_clear_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR_CTRL, VMX_MSR_R);
     vmx_clear_msr_intercept(v, MSR_IA32_DS_AREA, VMX_MSR_R);
+
+    if ( vpmu_version >= 4 )
+        vmx_clear_msr_intercept(v, MSR_CORE_PERF_GLOBAL_STATUS, VMX_MSR_R);
 }
 
 static void core2_vpmu_unset_msr_bitmap(struct vcpu *v)
@@ -250,6 +254,9 @@ static void core2_vpmu_unset_msr_bitmap(struct vcpu *v)
 
     vmx_set_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR_CTRL, VMX_MSR_R);
     vmx_set_msr_intercept(v, MSR_IA32_DS_AREA, VMX_MSR_R);
+
+    if ( vpmu_version >= 4 )
+        vmx_set_msr_intercept(v, MSR_CORE_PERF_GLOBAL_STATUS, VMX_MSR_R);
 }
 
 static inline void __core2_vpmu_save(struct vcpu *v)
@@ -268,7 +275,7 @@ static inline void __core2_vpmu_save(struct vcpu *v)
         rdmsrl(MSR_P6_EVNTSEL(i), xen_pmu_cntr_pair[i].control);
     }
 
-    if ( !is_hvm_vcpu(v) )
+    if ( !is_hvm_vcpu(v) || vpmu_version >= 4 )
         rdmsrl(MSR_CORE_PERF_GLOBAL_STATUS, core2_vpmu_cxt->global_status);
     /* Save MSR to private context to make it fork-friendly */
     else if ( mem_sharing_enabled(v->domain) )
@@ -338,6 +345,15 @@ static inline void __core2_vpmu_load(struct vcpu *v)
     else if ( mem_sharing_is_fork(v->domain) )
         vmx_write_guest_msr(v, MSR_CORE_PERF_GLOBAL_CTRL,
                             core2_vpmu_cxt->global_ctrl);
+
+    if ( vpmu_version >= 4 ) {
+        const uint64_t global_status = core2_vpmu_cxt->global_status;
+        const uint64_t reset = (~global_status) & global_ovf_ctrl_mask ;
+        if ( reset )
+            wrmsrl(MSR_CORE_PERF_GLOBAL_OVF_CTRL, reset);
+        if ( global_status )
+            wrmsrl(MSR_CORE_PERF_GLOBAL_STATUS_SET, global_status);
+    }
 }
 
 static int core2_vpmu_verify(struct vcpu *v)
@@ -917,6 +933,7 @@ const struct arch_vpmu_ops *__init core2_vpmu_init(void)
         printk(XENLOG_INFO "VPMU: PMU version %u is not fully supported. "
                "Emulating version %d\n", version, VPMU_VERSION_MAX);
     }
+    vpmu_version = version;
 
     if ( current_cpu_data.x86 != 6 )
     {
-- 
2.41.0


