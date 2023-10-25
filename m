Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B62D77D7447
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 21:30:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623200.970883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvja1-00047N-Is; Wed, 25 Oct 2023 19:30:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623200.970883; Wed, 25 Oct 2023 19:30:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvja0-00040A-Rp; Wed, 25 Oct 2023 19:30:12 +0000
Received: by outflank-mailman (input) for mailman id 623200;
 Wed, 25 Oct 2023 19:30:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xaZJ=GH=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1qvjZx-0001Lv-Qa
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 19:30:09 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6d013d8-736c-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 21:30:06 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-99de884ad25so19206266b.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Oct 2023 12:30:06 -0700 (PDT)
Received: from edvint-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 hv6-20020a17090760c600b00985ed2f1584sm10408710ejc.187.2023.10.25.12.30.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 12:30:04 -0700 (PDT)
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
X-Inumbo-ID: e6d013d8-736c-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1698262205; x=1698867005; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iP9G7laIqRl2FqyiOfQJAdkCawwQIojH1r5EdOLWSS0=;
        b=eFfWSa28xk0rJEVPYBOYZGaddJgf04K8oJpn3ymYEo1TelzcfZVGTxEq38sr+pqK14
         USLiDeS3U4wlMQwuuPB2dNLcWAvnesoW8Qeg3/RQNIx96DxazKVoSUAgMGm3+YLpWwks
         H+2BwgaAnsUnJ3Mr+4RG7nwohPN8KtljiuiA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698262205; x=1698867005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iP9G7laIqRl2FqyiOfQJAdkCawwQIojH1r5EdOLWSS0=;
        b=s+1uF+rkRs0j80Ffu5eDifhcjwHQkpuPV6moawnjK0KkgWMRkzk7KDSvF978nfIKZ0
         S5ZSImqcjeMuxY64GwXzgRiwR69nd8JSKSo/LiN8PI1+srYvHdoED5JssUAenY41C5ct
         p4+/tsQhx+U/y55rdC1uIa81lgNo4AnYV2VrSytqY8/7GmilYa80mrnJPyqVUHXoFAcU
         rUFlOXwn1wevXdNhtQOPgz5PrJWWOu8eWDQaDY9tBcdK1OhqwAXqexMDko2RqYSrdB0l
         OPlkTP0dRmd207Ykt57W4oEzqBcuqO/qQRFstSq1mOta30gdf2EhC0xzcRa08ULgYh64
         bQRQ==
X-Gm-Message-State: AOJu0YxJtpPPnmGhfchJAud0D6g9VOXgtsGZYKOwVsLt4EDfC/J8sQe2
	KcqDKtH90/3wT3lZliSSXatOVOQzR9K9hwWQn1jCkcZa
X-Google-Smtp-Source: AGHT+IHKT/4+cqjr/SSda+iaHUVZU3nFN8vu40U2Th87N93s7qOLJ2x8v5UhOJ1ekUe+qeZAZ4l++Q==
X-Received: by 2002:a17:907:2cc4:b0:9c3:d356:ad0c with SMTP id hg4-20020a1709072cc400b009c3d356ad0cmr12766172ejc.24.1698262205687;
        Wed, 25 Oct 2023 12:30:05 -0700 (PDT)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH 09/22] x86/PMUv1: consistently use 8 perf counters in Dom0
Date: Wed, 25 Oct 2023 20:29:39 +0100
Message-Id: <bce88ca09f6787c1d0815611189da42a09598657.1698261255.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698261255.git.edwin.torok@cloud.com>
References: <cover.1698261255.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Edwin Török <edvin.torok@citrix.com>

The code is currently inconsistent: supports 4 on read and 8 on write.
Sandy Bridge+ supports 8 of these, and the MSR range is architecturally
reserved, so always support 8.

Make it a macro to ensure we use the same value everywhere.

Although DomUs are now restricted to only 4 PMCs, we may still want to
use all 8 in Dom0 when available, and since the default rdwmsr
restrictions Dom0 would be prevented to read these MSRs as well.

Depends on:
"x86/PMUv1: limit arch PMCs to 4 for non-Dom0"

Backport: 4.15+

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 xen/arch/x86/hvm/vmx/vmx.c           | 8 ++++----
 xen/arch/x86/include/asm/msr-index.h | 3 +++
 xen/arch/x86/pv/emul-priv-op.c       | 8 ++++----
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index f6e5123f66..7d51addf7a 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3360,8 +3360,8 @@ static int cf_check vmx_msr_read_intercept(
                        MSR_IA32_MISC_ENABLE_PEBS_UNAVAIL;
         /* Perhaps vpmu will change some bits. */
         /* FALLTHROUGH */
-    case MSR_P6_PERFCTR(0)...MSR_P6_PERFCTR(7):
-    case MSR_P6_EVNTSEL(0)...MSR_P6_EVNTSEL(3):
+    case MSR_P6_PERFCTR(0)...MSR_P6_PERFCTR_LAST:
+    case MSR_P6_EVNTSEL(0)...MSR_P6_EVNTSEL_LAST:
     case MSR_CORE_PERF_FIXED_CTR0...MSR_CORE_PERF_FIXED_CTR2:
     case MSR_CORE_PERF_FIXED_CTR_CTRL...MSR_CORE_PERF_GLOBAL_OVF_CTRL:
     case MSR_IA32_PEBS_ENABLE:
@@ -3678,8 +3678,8 @@ static int cf_check vmx_msr_write_intercept(
             goto gp_fault;
         break;
 
-    case MSR_P6_PERFCTR(0)...MSR_P6_PERFCTR(7):
-    case MSR_P6_EVNTSEL(0)...MSR_P6_EVNTSEL(7):
+    case MSR_P6_PERFCTR(0)...MSR_P6_PERFCTR_LAST:
+    case MSR_P6_EVNTSEL(0)...MSR_P6_EVNTSEL_LAST:
     case MSR_CORE_PERF_FIXED_CTR0...MSR_CORE_PERF_FIXED_CTR2:
     case MSR_CORE_PERF_FIXED_CTR_CTRL...MSR_CORE_PERF_GLOBAL_OVF_CTRL:
     case MSR_IA32_PEBS_ENABLE:
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 8601f8f426..011a926e0e 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -521,8 +521,11 @@
 #define MSR_IA32_PSR_MBA_MASK(n)	(0x00000d50 + (n))
 
 /* Intel Model 6 */
+#define MSR_P6_PERFCTR_MAX		8
 #define MSR_P6_PERFCTR(n)		(0x000000c1 + (n))
 #define MSR_P6_EVNTSEL(n)		(0x00000186 + (n))
+#define MSR_P6_PERFCTR_LAST		MSR_P6_PERFCTR(MSR_P6_PERFCTR_MAX-1)
+#define MSR_P6_EVNTSEL_LAST		MSR_P6_EVNTSEL(MSR_P6_PERFCTR_MAX-1)
 
 /* P4/Xeon+ specific */
 #define MSR_IA32_MCG_EAX		0x00000180
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 978ae679a2..301a70f5ea 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -965,8 +965,8 @@ static int cf_check read_msr(
         *val = 0;
         return X86EMUL_OKAY;
 
-    case MSR_P6_PERFCTR(0) ... MSR_P6_PERFCTR(7):
-    case MSR_P6_EVNTSEL(0) ... MSR_P6_EVNTSEL(3):
+    case MSR_P6_PERFCTR(0) ... MSR_P6_PERFCTR_LAST:
+    case MSR_P6_EVNTSEL(0) ... MSR_P6_EVNTSEL_LAST:
     case MSR_CORE_PERF_FIXED_CTR0 ... MSR_CORE_PERF_FIXED_CTR2:
     case MSR_CORE_PERF_FIXED_CTR_CTRL ... MSR_CORE_PERF_GLOBAL_OVF_CTRL:
         if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
@@ -1145,8 +1145,8 @@ static int cf_check write_msr(
             return X86EMUL_OKAY;
         break;
 
-    case MSR_P6_PERFCTR(0) ... MSR_P6_PERFCTR(7):
-    case MSR_P6_EVNTSEL(0) ... MSR_P6_EVNTSEL(3):
+    case MSR_P6_PERFCTR(0) ... MSR_P6_PERFCTR_LAST:
+    case MSR_P6_EVNTSEL(0) ... MSR_P6_EVNTSEL_LAST:
     case MSR_CORE_PERF_FIXED_CTR0 ... MSR_CORE_PERF_FIXED_CTR2:
     case MSR_CORE_PERF_FIXED_CTR_CTRL ... MSR_CORE_PERF_GLOBAL_OVF_CTRL:
         if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
-- 
2.41.0


