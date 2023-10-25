Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 304007D7450
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 21:30:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623202.970902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvja4-0004iF-AH; Wed, 25 Oct 2023 19:30:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623202.970902; Wed, 25 Oct 2023 19:30:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvja3-0004RT-GE; Wed, 25 Oct 2023 19:30:15 +0000
Received: by outflank-mailman (input) for mailman id 623202;
 Wed, 25 Oct 2023 19:30:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xaZJ=GH=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1qvjZz-0001Lv-6u
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 19:30:11 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8c25aad-736c-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 21:30:09 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-9bf0ac97fdeso19100366b.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Oct 2023 12:30:09 -0700 (PDT)
Received: from edvint-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 hv6-20020a17090760c600b00985ed2f1584sm10408710ejc.187.2023.10.25.12.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 12:30:08 -0700 (PDT)
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
X-Inumbo-ID: e8c25aad-736c-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1698262209; x=1698867009; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ObxbptVjFjCZzNKpeaXDAzqTbrvIPZsTbBGt+Dq6anM=;
        b=A8W8rOCo5My5xhsELeZOk1J3TBi5pK2ddpCCCnUW+l/BCwheW3weAQCBXRLr7HYDmB
         JFeA2RUQHoIF/01mD3kl6dE9n4+YRVE06mD83YEVwaYIn6zps3RXSrmt5yF7glVEiIEw
         K48v9bMgGsmjl8pWIWJV0vsIj9SMCfLSyfBxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698262209; x=1698867009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ObxbptVjFjCZzNKpeaXDAzqTbrvIPZsTbBGt+Dq6anM=;
        b=hYPOpavAAe93wKXVAPCk4pzY8jBVglYcRp0xHZvNQVaXJLqaUFC5Ur+GA15dBTVxgD
         y/yXgoEt4MN5gUG/npdOqFV5Wv4bfaCUJZGfZ5Bs8A9JR8F7l/kMKLMwLh3vEvnWWYlJ
         Gzl8TkJ8LHEiur0wwC4FT1jc9KkE2zUbjN8PB/7cMhwNWsBS7KVK9bkcGM1FJm9p82f5
         bqrVCrVvQLxIeq3FiuYdEeOrmROzuRoUU7C/VjzTBaNmbBF2/IOtEjNwicM2Dn5GpD6P
         66b5hvwMiyZQKJbcZKs9DjpSL7N1rMh2JEQVeEy6+woHKqD7kvT6jqVsUVoQ+CFWU6NK
         8evA==
X-Gm-Message-State: AOJu0YyiUU2nYrsyow8b+/v+op9dEEqag3mc7H2CQoy7YQH5l2v7nE9g
	yzzIrMrgr5vJQfy62w5hpDjBn1gJXEqwU7unM6wRxg==
X-Google-Smtp-Source: AGHT+IHwxJOyWh8HPzL13+/SLwBO0U3Pr25AoXriqxxqHT9GvDNBp5XYykfO6ItnsgbolB5QJU60nQ==
X-Received: by 2002:a17:906:dace:b0:9c6:64be:a3ac with SMTP id xi14-20020a170906dace00b009c664bea3acmr13083067ejb.49.1698262208791;
        Wed, 25 Oct 2023 12:30:08 -0700 (PDT)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [RFC PATCH 13/22] x86/vpmu: expose PDCM and IA32_PERF_CAPABILITIES when vpmu is enabled
Date: Wed, 25 Oct 2023 20:29:43 +0100
Message-Id: <208464149217bcda9f774db7b906a597f9bde6db.1698261255.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698261255.git.edwin.torok@cloud.com>
References: <cover.1698261255.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Edwin Török <edvin.torok@citrix.com>

Marked as exposed by default, but then hidden if vpmu is not available.
TODO: the interaction between vpmu and policy might need some changes.

Only expose LBR and the full-width MSR capabilities, and not PEBS.

Backport: 4.15+

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 xen/arch/x86/cpu-policy.c                   | 10 ++++++++--
 xen/arch/x86/hvm/vmx/vmx.c                  |  2 +-
 xen/arch/x86/msr.c                          |  8 ++++++++
 xen/arch/x86/pv/emul-priv-op.c              |  5 -----
 xen/include/public/arch-x86/cpufeatureset.h |  2 +-
 5 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 64c8857a61..e38b648f7d 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -388,8 +388,10 @@ static void __init calculate_host_policy(void)
     recalculate_misc(p);
 
     /* When vPMU is disabled, drop it from the host policy. */
-    if ( vpmu_mode == XENPMU_MODE_OFF )
+    if ( vpmu_mode == XENPMU_MODE_OFF ) {
         p->basic.raw[0xa] = EMPTY_LEAF;
+        p->basic.pdcm = 0;
+    }
 
     if ( p->extd.svm )
     {
@@ -899,8 +901,12 @@ void recalculate_cpuid_policy(struct domain *d)
     }
 
     if ( vpmu_mode == XENPMU_MODE_OFF ||
-         ((vpmu_mode & XENPMU_MODE_ALL) && !is_hardware_domain(d)) )
+         ((vpmu_mode & XENPMU_MODE_ALL) && !is_hardware_domain(d)) ) {
         p->basic.raw[0xa] = EMPTY_LEAF;
+        p->basic.pdcm = 0;
+    }
+    if ( vpmu_features & (XENPMU_FEATURE_IPC_ONLY | XENPMU_FEATURE_ARCH_ONLY) )
+        p->basic.pdcm = 0;
 
     if ( !p->extd.svm )
         p->extd.raw[0xa] = EMPTY_LEAF;
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index f1f8a9afa2..fefd01be40 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3602,7 +3602,7 @@ static int cf_check vmx_msr_write_intercept(
         }
 
         if (cp->basic.pmu_version >= 2 && cpu_has(&current_cpu_data, X86_FEATURE_PDCM)) {
-            rsvd &= ~(IA32_DEBUGCTLMSR_FREEZE_LBRS_ON_PMI | IA32_DEBUGCTLMSR_FREEZE_PERFMON_ON_PMI);
+            rsvd &= ~(IA32_DEBUGCTLMSR_FREEZE_LBRS_ON_PMI | IA32_DEBUGCTLMSR_FREEZE_PERFMON_ON_PMI | IA32_DEBUGCTLMSR_FREEZE_WHILE_SMM);
         }
 
         if ( cp->feat.rtm )
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 0bf6d263e7..483b5e4f70 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -186,6 +186,14 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
             goto gp_fault;
         goto get_reg;
 
+    case MSR_IA32_PERF_CAPABILITIES:
+        if ( cp->x86_vendor != X86_VENDOR_INTEL )
+            goto gp_fault;
+        if ( !cp->basic.pdcm || rdmsr_safe(msr, *val) )
+            goto gp_fault;
+        *val &= (MSR_IA32_PERF_CAP_LBR_FORMAT | MSR_IA32_PERF_CAP_FREEZE_WHILE_SMM | MSR_IA32_PERF_CAP_FULLWIDTH_PMC);
+        break;
+
     case MSR_X2APIC_FIRST ... MSR_X2APIC_LAST:
         if ( !is_hvm_domain(d) || v != curr )
             goto gp_fault;
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index a8472fc779..e623e57b55 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -960,11 +960,6 @@ static int cf_check read_msr(
         *val = guest_misc_enable(*val);
         return X86EMUL_OKAY;
 
-    case MSR_IA32_PERF_CAPABILITIES:
-        /* No extra capabilities are supported. */
-        *val = 0;
-        return X86EMUL_OKAY;
-
     case MSR_P6_PERFCTR(0) ... MSR_P6_PERFCTR_LAST:
     case MSR_P6_EVNTSEL(0) ... MSR_P6_EVNTSEL_LAST:
     case MSR_CORE_PERF_FIXED_CTR0 ... MSR_CORE_PERF_FIXED_CTRn:
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 6b6ce2745c..0aa3251397 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -118,7 +118,7 @@ XEN_CPUFEATURE(SSSE3,         1*32+ 9) /*A  Supplemental Streaming SIMD Extensio
 XEN_CPUFEATURE(FMA,           1*32+12) /*A  Fused Multiply Add */
 XEN_CPUFEATURE(CX16,          1*32+13) /*A  CMPXCHG16B */
 XEN_CPUFEATURE(XTPR,          1*32+14) /*   Send Task Priority Messages */
-XEN_CPUFEATURE(PDCM,          1*32+15) /*   Perf/Debug Capability MSR */
+XEN_CPUFEATURE(PDCM,          1*32+15) /*A  Perf/Debug Capability MSR */
 XEN_CPUFEATURE(PCID,          1*32+17) /*H  Process Context ID */
 XEN_CPUFEATURE(DCA,           1*32+18) /*   Direct Cache Access */
 XEN_CPUFEATURE(SSE4_1,        1*32+19) /*A  Streaming SIMD Extensions 4.1 */
-- 
2.41.0


