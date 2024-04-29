Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B688B5D28
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 17:16:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714188.1115294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1Sk6-0007Jf-7Y; Mon, 29 Apr 2024 15:16:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714188.1115294; Mon, 29 Apr 2024 15:16:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1Sk6-0007H0-1R; Mon, 29 Apr 2024 15:16:34 +0000
Received: by outflank-mailman (input) for mailman id 714188;
 Mon, 29 Apr 2024 15:16:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yZQG=MC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s1Sk4-0006fc-Bd
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 15:16:32 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74fb9fe8-063b-11ef-b4bb-af5377834399;
 Mon, 29 Apr 2024 17:16:30 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-516ef30b16eso5113272e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 08:16:30 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 ah2-20020a1709069ac200b00a4e393b6349sm13898875ejc.5.2024.04.29.08.16.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 08:16:29 -0700 (PDT)
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
X-Inumbo-ID: 74fb9fe8-063b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714403790; x=1715008590; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q95oo9lBt9umv6UIN2GoLMgj9CrXSSoAkZ3vrRjbn0Q=;
        b=ZrbR+r8322d6a/9AcS7erXXS7v9++Ah67eWrtTtPXg88GW9krJFD60gi63DDXRQySc
         zXZGfaidRN7IUWVzo54TI3z44TAPOS4/RR5qM6+NmNsIHOaNnT0XFodlw/xvoN2+ufOn
         1sQps2UTikfau77fUBHzqxKIP2IjftR7mx+iM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403790; x=1715008590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q95oo9lBt9umv6UIN2GoLMgj9CrXSSoAkZ3vrRjbn0Q=;
        b=J0PvOeh/7hVsu/GRtc+t2rUS8Pa9HudNDStokMkhegCaOWoft7FnyaCt352Pt4LcM6
         37U6u4XYLxWcyzb26h0DlOjRb5j+RXpdbWo6PLC8bVHWgwuQu3II0iXkwTCq24QpK1Wz
         95O9MsHNwQgBvn50DGQE5SBiH0HGC9owkdPGXltzVAukQU1NqNNPg16CZTkfxkI4S97G
         KYkPi2YoE19hAG6UmlLK7oAaYGlfXicDGPHWv6HsObJCoZLwVILECVckvm9x7jxQRbFO
         uQ0VNhxi4X/3EszUF73IoeHSzYkCpr3SsH8X+EGJovVZ3MjtZ3OtrxOxg9wjDWG19bHW
         JDcg==
X-Gm-Message-State: AOJu0Yy3GukEZfjxeVRGQbPIFHlxVsGzcYbn4dpwbnhb0NkZT4X/Shn0
	JJ1QxbqiUcgLW1SDXfuoluZXsWS4hYsMY95mmGli0XYlHoDmo2eMLFCYXwkoa10yFUZpHHz28IW
	m
X-Google-Smtp-Source: AGHT+IE8bbG1hHbsIx2V67uagxcMqS9yaZeds9wNUKKmIUDWYfrx93281JtK4elkGLWgJ5M+fZKO1g==
X-Received: by 2002:a05:6512:3102:b0:51d:2c37:6c15 with SMTP id n2-20020a056512310200b0051d2c376c15mr4241227lfb.8.1714403790030;
        Mon, 29 Apr 2024 08:16:30 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Andrei Semenov <andrei.semenov@vates.fr>,
	Vaishali Thakkar <vaishali.thakkar@vates.tech>
Subject: [PATCH 3/5] x86/spec-ctrl: Remove open-coded check of SVM_FEATURE_SPEC_CTRL
Date: Mon, 29 Apr 2024 16:16:23 +0100
Message-Id: <20240429151625.977884-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240429151625.977884-1-andrew.cooper3@citrix.com>
References: <20240429151625.977884-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now that the SVM feature leaf has been included in normal feature handling, it
is available early enough for init_speculation_mitigations() to use.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
CC: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: George Dunlap <george.dunlap@citrix.com>
CC: Andrei Semenov <andrei.semenov@vates.fr>
CC: Vaishali Thakkar <vaishali.thakkar@vates.tech>
---
 xen/arch/x86/include/asm/cpufeature.h | 3 +++
 xen/arch/x86/spec_ctrl.c              | 7 +------
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index 9bc553681f4a..77cfd900cb56 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -217,6 +217,9 @@ static inline bool boot_cpu_has(unsigned int feat)
 #define cpu_has_rfds_no         boot_cpu_has(X86_FEATURE_RFDS_NO)
 #define cpu_has_rfds_clear      boot_cpu_has(X86_FEATURE_RFDS_CLEAR)
 
+/* CPUID level 0x8000000a.edx */
+#define cpu_has_v_spec_ctrl     boot_cpu_has(X86_FEATURE_V_SPEC_CTRL)
+
 /* Synthesized. */
 #define cpu_has_arch_perfmon    boot_cpu_has(X86_FEATURE_ARCH_PERFMON)
 #define cpu_has_cpuid_faulting  boot_cpu_has(X86_FEATURE_CPUID_FAULTING)
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 40f6ae017010..0bda9d01def5 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -11,7 +11,6 @@
 #include <xen/warning.h>
 
 #include <asm/amd.h>
-#include <asm/hvm/svm/svm.h>
 #include <asm/intel-family.h>
 #include <asm/microcode.h>
 #include <asm/msr.h>
@@ -1896,12 +1895,8 @@ void __init init_speculation_mitigations(void)
          *
          * No need for SCF_ist_sc_msr because Xen's value is restored
          * atomically WRT NMIs in the VMExit path.
-         *
-         * TODO: Adjust cpu_has_svm_spec_ctrl to be usable earlier on boot.
          */
-        if ( opt_msr_sc_hvm &&
-             (boot_cpu_data.extended_cpuid_level >= 0x8000000aU) &&
-             (cpuid_edx(0x8000000aU) & (1u << SVM_FEATURE_SPEC_CTRL)) )
+        if ( opt_msr_sc_hvm && cpu_has_v_spec_ctrl )
             setup_force_cpu_cap(X86_FEATURE_SC_MSR_HVM);
     }
 
-- 
2.30.2


