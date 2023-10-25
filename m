Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8D27D7445
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 21:30:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623198.970861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvjZy-0003Za-Q4; Wed, 25 Oct 2023 19:30:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623198.970861; Wed, 25 Oct 2023 19:30:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvjZy-0003UU-JM; Wed, 25 Oct 2023 19:30:10 +0000
Received: by outflank-mailman (input) for mailman id 623198;
 Wed, 25 Oct 2023 19:30:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xaZJ=GH=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1qvjZw-0001Lv-Ss
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 19:30:08 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7481c41-736c-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 21:30:07 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-9ae2cc4d17eso21097666b.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Oct 2023 12:30:07 -0700 (PDT)
Received: from edvint-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 hv6-20020a17090760c600b00985ed2f1584sm10408710ejc.187.2023.10.25.12.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 12:30:05 -0700 (PDT)
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
X-Inumbo-ID: e7481c41-736c-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1698262206; x=1698867006; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D82wmWFWuZgLhPScx6tmxAejKAf/fYGX9l7CCjPm+Oo=;
        b=ULkatCeWK9jQmpyjDgMgKixwzGyuXq2l1yzIOLYs8GwqZyry++ffLxtKAF7z8HdJiQ
         ecQ38gA6EjVYLLGrNUKFkN6T1ByXInlH1+lyoYfMCkWlmTsIppagQZp19Zygdv2O3kPF
         BHwD6wUiULhyewKYJpaStPyUp9rRNl3L+QcoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698262206; x=1698867006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D82wmWFWuZgLhPScx6tmxAejKAf/fYGX9l7CCjPm+Oo=;
        b=n3mr/gtC1T9bJyqpUhlgyRtwNMUMD6MADnieOwD9UuBlv1s5o2YTjjdn2MfITmEwH/
         u+kQMYWKmegJDMiL6rqRVE9pr4PfjISGIXvrDsuo7e1IrWwcDsDE6d38uqlSg2o+Xj8g
         1HeyeOmp/N663JaO46UM7NIF22Z5t4+DZY/ojwEPpqGOOC4oCUnfbLFf7ULZkVkdvJG/
         mOuqUj9bb089sJIPho4KbOiVIFG7y5TT44NmS++kxoaaRLn2L0qM38B4QOzNnBPvJ8/5
         W/sUJlgxdGaRMWiUQnSx6cmi4KH2Zc8PsIZWUKOPQskDzcshMyuLWX9tSV9RPia68ycF
         lpTg==
X-Gm-Message-State: AOJu0YyzVkPUhuhRRZ2eYJQat/jEtxKiR8LIPu9bWb2+RpPK6Kx7ou61
	EUa6ps2TEm7BXaeRrunvCyNVy7Kad0vCb5y0jJiFJPfd
X-Google-Smtp-Source: AGHT+IGxIhlT5o2lKJUs542MRxudBPnqUQuDNUOXjeN1e2xFqN7Z69EXUfiEly59AXLoO4KqwiV4CQ==
X-Received: by 2002:a17:907:762d:b0:9c8:f128:2fdb with SMTP id jy13-20020a170907762d00b009c8f1282fdbmr7527403ejc.13.1698262206404;
        Wed, 25 Oct 2023 12:30:06 -0700 (PDT)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH 10/22] x86/PMUv2: limit number of fixed perf counters to 3
Date: Wed, 25 Oct 2023 20:29:40 +0100
Message-Id: <0355493e5b5771e663381b163efb21d210f56c42.1698261255.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698261255.git.edwin.torok@cloud.com>
References: <cover.1698261255.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Edwin Török <edvin.torok@citrix.com>

There are only 3 architectural fixed function counters defined,
however Icelake introduces a 4th.
So we'll need to report the number of fixed counter implemented in CPUID
correctly for Icelake, define a macro to ensure we are consistent about
which counter is last.

Note: simply adding MSR_CORE_PERF_FIXED_CTR3 is not enough, Icelake also
defines MSR_PERF_METRICS and there are some ordering constraints on
restoring the MSR, and atomicity constraints on IA32_PERF_GLOBAL_CTRL,
so this is not implemented yet.

Backport: 4.13+

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 xen/arch/x86/cpu/vpmu_intel.c        | 6 ++++++
 xen/arch/x86/hvm/vmx/vmx.c           | 4 ++--
 xen/arch/x86/include/asm/msr-index.h | 4 ++--
 xen/arch/x86/pv/emul-priv-op.c       | 4 ++--
 4 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index ef8d69a0d6..4c0776cee7 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -926,6 +926,12 @@ const struct arch_vpmu_ops *__init core2_vpmu_init(void)
     }
 
     fixed_pmc_cnt = core2_get_fixed_pmc_count();
+#define PERF_FIXED_CTR_MAX (MSR_CORE_PERF_FIXED_CTRn - MSR_CORE_PERF_FIXED_CTR0 + 1)
+    if ( fixed_pmc_cnt > PERF_FIXED_CTR_MAX )
+    {
+        printk(XENLOG_INFO "VPMU: limiting fixed perf counters to %d\n", PERF_FIXED_CTR_MAX);
+        fixed_pmc_cnt = PERF_FIXED_CTR_MAX;
+    }
 
     if ( cpu_has_pdcm )
     {
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 7d51addf7a..1510e980dd 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3362,7 +3362,7 @@ static int cf_check vmx_msr_read_intercept(
         /* FALLTHROUGH */
     case MSR_P6_PERFCTR(0)...MSR_P6_PERFCTR_LAST:
     case MSR_P6_EVNTSEL(0)...MSR_P6_EVNTSEL_LAST:
-    case MSR_CORE_PERF_FIXED_CTR0...MSR_CORE_PERF_FIXED_CTR2:
+    case MSR_CORE_PERF_FIXED_CTR0...MSR_CORE_PERF_FIXED_CTRn:
     case MSR_CORE_PERF_FIXED_CTR_CTRL...MSR_CORE_PERF_GLOBAL_OVF_CTRL:
     case MSR_IA32_PEBS_ENABLE:
     case MSR_IA32_DS_AREA:
@@ -3680,7 +3680,7 @@ static int cf_check vmx_msr_write_intercept(
 
     case MSR_P6_PERFCTR(0)...MSR_P6_PERFCTR_LAST:
     case MSR_P6_EVNTSEL(0)...MSR_P6_EVNTSEL_LAST:
-    case MSR_CORE_PERF_FIXED_CTR0...MSR_CORE_PERF_FIXED_CTR2:
+    case MSR_CORE_PERF_FIXED_CTR0...MSR_CORE_PERF_FIXED_CTRn:
     case MSR_CORE_PERF_FIXED_CTR_CTRL...MSR_CORE_PERF_GLOBAL_OVF_CTRL:
     case MSR_IA32_PEBS_ENABLE:
     case MSR_IA32_DS_AREA:
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 011a926e0e..8a881a8a6f 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -674,8 +674,8 @@
 
 /* Intel Core-based CPU performance counters */
 #define MSR_CORE_PERF_FIXED_CTR0	0x00000309
-#define MSR_CORE_PERF_FIXED_CTR1	0x0000030a
-#define MSR_CORE_PERF_FIXED_CTR2	0x0000030b
+#define MSR_CORE_PERF_FIXED_CTRn	0x0000030b
+
 #define MSR_CORE_PERF_FIXED_CTR_CTRL	0x0000038d
 #define MSR_CORE_PERF_GLOBAL_STATUS	0x0000038e
 #define MSR_CORE_PERF_GLOBAL_CTRL	0x0000038f
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 301a70f5ea..a8472fc779 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -967,7 +967,7 @@ static int cf_check read_msr(
 
     case MSR_P6_PERFCTR(0) ... MSR_P6_PERFCTR_LAST:
     case MSR_P6_EVNTSEL(0) ... MSR_P6_EVNTSEL_LAST:
-    case MSR_CORE_PERF_FIXED_CTR0 ... MSR_CORE_PERF_FIXED_CTR2:
+    case MSR_CORE_PERF_FIXED_CTR0 ... MSR_CORE_PERF_FIXED_CTRn:
     case MSR_CORE_PERF_FIXED_CTR_CTRL ... MSR_CORE_PERF_GLOBAL_OVF_CTRL:
         if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
         {
@@ -1147,7 +1147,7 @@ static int cf_check write_msr(
 
     case MSR_P6_PERFCTR(0) ... MSR_P6_PERFCTR_LAST:
     case MSR_P6_EVNTSEL(0) ... MSR_P6_EVNTSEL_LAST:
-    case MSR_CORE_PERF_FIXED_CTR0 ... MSR_CORE_PERF_FIXED_CTR2:
+    case MSR_CORE_PERF_FIXED_CTR0 ... MSR_CORE_PERF_FIXED_CTRn:
     case MSR_CORE_PERF_FIXED_CTR_CTRL ... MSR_CORE_PERF_GLOBAL_OVF_CTRL:
         if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
         {
-- 
2.41.0


