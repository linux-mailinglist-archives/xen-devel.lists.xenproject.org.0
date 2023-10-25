Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7ED7D744C
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 21:30:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623199.970878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvja0-000416-O6; Wed, 25 Oct 2023 19:30:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623199.970878; Wed, 25 Oct 2023 19:30:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvja0-0003qY-9S; Wed, 25 Oct 2023 19:30:12 +0000
Received: by outflank-mailman (input) for mailman id 623199;
 Wed, 25 Oct 2023 19:30:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xaZJ=GH=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1qvjZx-0000YO-KK
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 19:30:09 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e847d7af-736c-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 21:30:08 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9be7e3fa1daso21797266b.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Oct 2023 12:30:08 -0700 (PDT)
Received: from edvint-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 hv6-20020a17090760c600b00985ed2f1584sm10408710ejc.187.2023.10.25.12.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 12:30:07 -0700 (PDT)
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
X-Inumbo-ID: e847d7af-736c-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1698262208; x=1698867008; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q6XCC+5rvlk/MEJqhgdqPVpUFs95Cpj7FftubwM6eJQ=;
        b=gqduNI82iUt7h6l5+IN31W2Ykpz1WR9iKC2lAqOW0Y9lp0O+M2ASu6GygFblaF673h
         49jzX5OcdZLq+r0qzDObq+j7+WYqgrq4a0y8epr/LESKGpbVWRHBimmxsp6q6zpkPpmB
         ZE4lA9pnnBvOob8aldR8tLhQbMQvH0MwVx878=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698262208; x=1698867008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q6XCC+5rvlk/MEJqhgdqPVpUFs95Cpj7FftubwM6eJQ=;
        b=DKXxVAsoeNa+FI6yW1UsG7KMt8JQxpDg3rDW6TfXjZeiXZ2J7FFU3y7YHNcZF2lX4M
         +w3MGEscOeWaR4ycCFA1xYZWwrFzLBPeDQ7o/A+ZjLFN2yHxIo9Yi6pYk5Xk+H15n1iM
         GFc8gel1vuB5WkdivC/vG20hRzgV60zPypH7mfGyfUf+KORlQBIW8ogbWl1kfpkws1Lf
         ORo5nIC6yCd+u7ndAF6oz29Wl7qIhqDydnsHo8o2wdt24kWufK64TK7/Jyej1lg43an0
         f24u/gbex+GT4G/4Hpfv0kQ2cgwzeieTj46qFFkNdfFwAwi20yagb6paLLziZoCS4gqS
         bbhw==
X-Gm-Message-State: AOJu0Yxv6FLYaWLuW9J1TBAr8QjZW9pefEZUdFfB01hAolztaWtHXDxt
	nppZOS3E5MQuUA8cyQ/cLWrw8VbQ6jYqHiEvk08jUA==
X-Google-Smtp-Source: AGHT+IHb7FRCvx8nLCvBr4JujyymZWcrmw0JmHuGh7+ApxplFpCJ0oHdrsDqNC4PpvY1/MUtmiks8A==
X-Received: by 2002:a17:907:2d29:b0:9a9:e4ba:2da7 with SMTP id gs41-20020a1709072d2900b009a9e4ba2da7mr14103159ejc.49.1698262208129;
        Wed, 25 Oct 2023 12:30:08 -0700 (PDT)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH 12/22] x86/msr-index: define more architectural MSRs
Date: Wed, 25 Oct 2023 20:29:42 +0100
Message-Id: <4675c236ea5f66bfce36eb98ac5806ee0468b4fe.1698261255.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698261255.git.edwin.torok@cloud.com>
References: <cover.1698261255.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Edwin Török <edvin.torok@citrix.com>

Add most architectural MSRs, except those behind CPUID features that are
not yet implemented, such as TME, SGX.

Based on "2.1 Architectural MSRs" of Intel SDM volume 4

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 xen/arch/x86/include/asm/msr-index.h | 54 +++++++++++++++++++++++++---
 1 file changed, 50 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 0dfb5b499f..061b07c7ae 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -58,6 +58,14 @@
 #define  PRED_CMD_IBPB                      (_AC(1, ULL) <<  0)
 #define  PRED_CMD_SBPB                      (_AC(1, ULL) <<  7)
 
+#define MSR_IA32_SMM_MONITOR_CTL            0x0000009b
+#define MSR_IA32_SMBASE                     0x0000009e
+#define MSR_IA32_SMRR_PHYSBASE              0x000001f2
+#define MSR_IA32_SMRR_PHYSMASK              0x000001f3
+#define MSR_IA32_PLATFORM_DCA_CAP           0x000001f8
+#define MSR_IA32_CPU_DCA_CAP                0x000001f9
+#define MSR_IA32_DCA_0_CAP                  0x000001fa
+
 #define MSR_PPIN_CTL                        0x0000004e
 #define  PPIN_LOCKOUT                       (_AC(1, ULL) <<  0)
 #define  PPIN_ENABLE                        (_AC(1, ULL) <<  1)
@@ -267,13 +275,21 @@
 #define MSR_IA32_MCG_CAP		0x00000179
 #define MSR_IA32_MCG_STATUS		0x0000017a
 #define MSR_IA32_MCG_CTL		0x0000017b
-#define MSR_IA32_MCG_EXT_CTL	0x000004d0
+#define MSR_IA32_MCG_EXT_CTL		0x000004d0
 
 #define MSR_IA32_PEBS_ENABLE		0x000003f1
 #define MSR_IA32_DS_AREA		0x00000600
 #define MSR_IA32_PERF_CAPABILITIES	0x00000345
 /* Lower 6 bits define the format of the address in the LBR stack */
-#define MSR_IA32_PERF_CAP_LBR_FORMAT	0x3f
+#define MSR_IA32_PERF_CAP_LBR_FORMAT    	0x3f
+#define MSR_IA32_PERF_CAP_PEBS_TRAP		(_AC(1,ULL) << 6)
+#define MSR_IA32_PERF_CAP_PEBS_SAVE_ARCH_REGS	(_AC(1,ULL) << 7)
+#define MSR_IA32_PERF_CAP_PEBS_RECORD_FORMAT	0xf00
+#define MSR_IA32_PERF_CAP_FREEZE_WHILE_SMM	(_AC(1,ULL) << 12)
+#define MSR_IA32_PERF_CAP_FULLWIDTH_PMC 	(_AC(1,ULL) << 13)
+#define MSR_IA32_PERF_CAP_PEBS_BASELINE		(_AC(1,ULL) << 14)
+#define MSR_IA32_PERF_CAP_PERF_METRICS		(_AC(1,ULL) << 15)
+#define MSR_IA32_PERF_CAP_PEBS_TO_PT		(_AC(1,ULL) << 16)
 
 #define MSR_IA32_BNDCFGS		0x00000d90
 #define IA32_BNDCFGS_ENABLE		0x00000001
@@ -307,6 +323,8 @@
 #define IA32_DEBUGCTLMSR_BTS_OFF_USR	(1<<10) /* BTS off if CPL > 0 */
 #define IA32_DEBUGCTLMSR_FREEZE_LBRS_ON_PMI	(1<<11) /* LBR stack frozen on PMI */
 #define IA32_DEBUGCTLMSR_FREEZE_PERFMON_ON_PMI	(1<<12) /*  Global counter control ENABLE bit frozen on PMI */
+#define IA32_DEBUGCTLMSR_ENABLE_UNCORE_PMI	(1<<13) /* Enable uncore PMI */
+#define IA32_DEBUGCTLMSR_FREEZE_WHILE_SMM	(1<<14) /* Freeze perfmon/trace while in SMM */
 #define IA32_DEBUGCTLMSR_RTM			(1<<15) /* RTM debugging enable */
 
 #define MSR_IA32_LASTBRANCHFROMIP	0x000001db
@@ -469,6 +487,7 @@
 #define MSR_VIA_RNG			0x0000110b
 
 /* Intel defined MSRs. */
+#define MSR_IA32_MONITOR_FILTER_SIZE	0x00000006
 #define MSR_IA32_TSC			0x00000010
 #define MSR_IA32_PLATFORM_ID		0x00000017
 #define MSR_IA32_EBL_CR_POWERON		0x0000002a
@@ -491,6 +510,7 @@
 #define MSR_IA32_PERF_STATUS		0x00000198
 #define MSR_IA32_PERF_CTL		0x00000199
 
+#define MSR_IA32_UMWAIT_CONTROL		0x000000e1
 #define MSR_IA32_MPERF			0x000000e7
 #define MSR_IA32_APERF			0x000000e8
 
@@ -498,6 +518,7 @@
 #define MSR_IA32_THERM_INTERRUPT	0x0000019b
 #define MSR_IA32_THERM_STATUS		0x0000019c
 #define MSR_IA32_MISC_ENABLE		0x000001a0
+#define MSR_IA32_MISC_ENABLE_FAST_STRINGS (1<<0)
 #define MSR_IA32_MISC_ENABLE_PERF_AVAIL   (1<<7)
 #define MSR_IA32_MISC_ENABLE_BTS_UNAVAIL  (1<<11)
 #define MSR_IA32_MISC_ENABLE_PEBS_UNAVAIL (1<<12)
@@ -508,15 +529,38 @@
 #define MSR_IA32_MISC_ENABLE_TURBO_DISENGAGE (_AC(1, ULL) << 38)
 
 #define MSR_IA32_TSC_DEADLINE		0x000006E0
+
+#define MSR_IA32_PM_ENABLE		0x00000770
+#define MSR_IA32_HWP_CAPABILITIES	0x00000771
+#define MSR_IA32_HWP_REQUEST_PKG	0x00000772
+#define MSR_IA32_HWP_INTERRUPT		0x00000773
+#define MSR_IA32_HWP_REQUEST		0x00000774
+#define MSR_IA32_PECI_HWP_REQUEST_INFO	0x00000775
+#define MSR_IA32_HWP_STATUS		0x00000777
+
+#define MSR_IA32_PKG_HDC_CTL		0x00000db0
+#define MSR_IA32_PM_CTL1		0x00000db1
+#define MSR_IA32_THREAD_STALL		0x00000db2
+#define MSR_IA32_HW_FEEDBACK_PTR	0x000017d0
+#define MSR_IA32_HW_FEEDBACK_CONFIG	0x000017d1
+
+#define MSR_TEMPERATURE_TARGET		0x000001a2
+#define MSR_TURBO_RATIO_LIMIT		0x000001ad
+#define MSR_TURBO_RATIO_LIMIT1		0x000001ae
+#define MSR_TURBO_RATIO_LIMIT2		0x000001af
+
 #define MSR_IA32_ENERGY_PERF_BIAS	0x000001b0
+#define MSR_IA32_PACKAGE_THERM_STATUS	0x000001b1
+#define MSR_IA32_PACKAGE_THERM_INTERRUPT 0x000001b2
 
 /* Platform Shared Resource MSRs */
+#define MSR_IA32_PSR_L3_QOS_CFG		0x00000c81
+#define MSR_IA32_PSR_L2_QOS_CFG		0x00000c82
 #define MSR_IA32_CMT_EVTSEL		0x00000c8d
 #define MSR_IA32_CMT_EVTSEL_UE_MASK	0x0000ffff
 #define MSR_IA32_CMT_CTR		0x00000c8e
 #define MSR_IA32_PSR_ASSOC		0x00000c8f
-#define MSR_IA32_PSR_L3_QOS_CFG	0x00000c81
-#define MSR_IA32_PSR_L3_MASK(n)	(0x00000c90 + (n))
+#define MSR_IA32_PSR_L3_MASK(n)		(0x00000c90 + (n))
 #define MSR_IA32_PSR_L3_MASK_CODE(n)	(0x00000c90 + (n) * 2 + 1)
 #define MSR_IA32_PSR_L3_MASK_DATA(n)	(0x00000c90 + (n) * 2)
 #define MSR_IA32_PSR_L2_MASK(n)		(0x00000d10 + (n))
@@ -682,6 +726,8 @@
 #define MSR_CORE_PERF_GLOBAL_STATUS	0x0000038e
 #define MSR_CORE_PERF_GLOBAL_CTRL	0x0000038f
 #define MSR_CORE_PERF_GLOBAL_OVF_CTRL	0x00000390
+#define MSR_CORE_PERF_GLOBAL_STATUS_SET	0x00000391
+#define MSR_CORE_PERF_GLOBAL_INUSE	0x00000392
 
 /* Intel cpuid spoofing MSRs */
 #define MSR_INTEL_MASK_V1_CPUID1        0x00000478
-- 
2.41.0


