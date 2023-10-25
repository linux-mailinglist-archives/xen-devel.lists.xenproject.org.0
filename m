Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC96C7D7465
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 21:34:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623264.970996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvjdx-0006BA-Jk; Wed, 25 Oct 2023 19:34:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623264.970996; Wed, 25 Oct 2023 19:34:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvjdx-00068y-Gm; Wed, 25 Oct 2023 19:34:17 +0000
Received: by outflank-mailman (input) for mailman id 623264;
 Wed, 25 Oct 2023 19:34:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xaZJ=GH=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1qvja5-0001Lv-UO
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 19:30:17 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ecdd8edd-736c-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 21:30:16 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-9becde9ea7bso271631566b.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Oct 2023 12:30:16 -0700 (PDT)
Received: from edvint-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 hv6-20020a17090760c600b00985ed2f1584sm10408710ejc.187.2023.10.25.12.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 12:30:15 -0700 (PDT)
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
X-Inumbo-ID: ecdd8edd-736c-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1698262216; x=1698867016; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6zd+9X3SvJrgztNDFGOA9xCp41IYKJ6RL7GRTOSekc=;
        b=fWv8EQ7gfmEWz3qLqEtoSEo3D8036NuJJ5QMYew0epgOXETkaAX0VYuXeKnKqrmKHY
         /V6DWplNXFtHSv4jwdjXPcXlGkGjJUa54ur0ceCRCd7ImmmUcuFgW4Fstj69+Gas5yIp
         sqG0Owbon6BviNyy/sWWTN2vPZ95cTLwZzf2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698262216; x=1698867016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J6zd+9X3SvJrgztNDFGOA9xCp41IYKJ6RL7GRTOSekc=;
        b=f23N8POuoy2A7aGwrB0/W6ln4uPrprzHNL2xi4bRLuImjpnRKKvl70c9Cn2dwywp/b
         7AxVfVDaIMMsI/bD+USq5KJvOjTqhgmW8BAcU5OEzozspSWOnQJFucdP5KYthOnfIhY7
         hqSMXuGbu/LTAedSl5xUsrvWOX/PJ1VVNmQLyT43AxGVE3ydTgQDqP96KdJhrq3h6fn4
         VqSrWm8KF3ChW8zwYvfRm2AEYb8IpwHP/jhGMeJQyswICfyJQwbgUsHIrRjPcKa5fK3m
         fjrDDNtKKw71fhvMRaTLXOnnKu4IkF6WGuDshcAh+d77CLe6HpqsBsFEqiPtNh3OP9Di
         l0PQ==
X-Gm-Message-State: AOJu0YymSg+yTOfPts4dA7gHB69tfONOb1Lw5mDSYwN2l1h+W9YFB02n
	y/vXFMBVy9oJnZooTXzMTTy/Gjgyk0PhZDlpMiN0nQ==
X-Google-Smtp-Source: AGHT+IG04jYEJpTiyADhr6u1GGQaT3N85oLVt59loHsRCQW4fkF5dyz5tXCImSbU31L/d8xtpNsBRg==
X-Received: by 2002:a17:907:9492:b0:9ad:8a9e:23ee with SMTP id dm18-20020a170907949200b009ad8a9e23eemr565135ejc.13.1698262215834;
        Wed, 25 Oct 2023 12:30:15 -0700 (PDT)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH 22/22] x86/AMD: add IRPerf support
Date: Wed, 25 Oct 2023 20:29:52 +0100
Message-Id: <6cd765e98fa4888b9e94215f3572a94e95fe2a4b.1698261255.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698261255.git.edwin.torok@cloud.com>
References: <cover.1698261255.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Edwin Török <edvin.torok@citrix.com>

Instruction retired perf counter, enabled by writing to a bit in HWCR.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 xen/arch/x86/include/asm/msr-index.h        | 1 +
 xen/arch/x86/msr.c                          | 7 +++++++
 xen/include/public/arch-x86/cpufeatureset.h | 2 +-
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 061b07c7ae..1d94fe3a5b 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -393,6 +393,7 @@
 
 #define MSR_K8_HWCR			0xc0010015
 #define K8_HWCR_TSC_FREQ_SEL		(1ULL << 24)
+#define K8_HWCR_IRPERF_EN		(1ULL << 30)
 #define K8_HWCR_CPUID_USER_DIS		(1ULL << 35)
 
 #define MSR_K7_FID_VID_CTL		0xc0010041
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 483b5e4f70..b3cd851d9d 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -584,6 +584,13 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
         }
         break;
 
+    case MSR_K8_HWCR:
+        if ( !(cp->x86_vendor & X86_VENDOR_AMD) ||
+             (val & ~K8_HWCR_IRPERF_EN) ||
+             wrmsr_safe(msr, val) != 0 )
+            goto gp_fault;
+        break;
+
     case MSR_AMD64_DE_CFG:
         /*
          * OpenBSD 6.7 will panic if writing to DE_CFG triggers a #GP:
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 5faca0bf7a..40f74cd5e8 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -241,7 +241,7 @@ XEN_CPUFEATURE(EFRO,          7*32+10) /*   APERF/MPERF Read Only interface */
 
 /* AMD-defined CPU features, CPUID level 0x80000008.ebx, word 8 */
 XEN_CPUFEATURE(CLZERO,        8*32+ 0) /*A  CLZERO instruction */
-XEN_CPUFEATURE(IRPERF,        8*32+ 1) /* Instruction Retired Performance Counter */
+XEN_CPUFEATURE(IRPERF,        8*32+ 1) /*A! Instruction Retired Performance Counter */
 XEN_CPUFEATURE(RSTR_FP_ERR_PTRS, 8*32+ 2) /*A  (F)X{SAVE,RSTOR} always saves/restores FPU Error pointers */
 XEN_CPUFEATURE(WBNOINVD,      8*32+ 9) /*   WBNOINVD instruction */
 XEN_CPUFEATURE(IBPB,          8*32+12) /*A  IBPB support only (no IBRS, used by AMD) */
-- 
2.41.0


