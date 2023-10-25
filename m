Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA4F7D744D
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 21:30:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623191.970809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvjZt-0001q5-6R; Wed, 25 Oct 2023 19:30:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623191.970809; Wed, 25 Oct 2023 19:30:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvjZs-0001mj-UP; Wed, 25 Oct 2023 19:30:04 +0000
Received: by outflank-mailman (input) for mailman id 623191;
 Wed, 25 Oct 2023 19:30:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xaZJ=GH=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1qvjZr-0001Lv-5e
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 19:30:03 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e27fa6c8-736c-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 21:29:59 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-53e3b8f906fso97551a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Oct 2023 12:29:59 -0700 (PDT)
Received: from edvint-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 hv6-20020a17090760c600b00985ed2f1584sm10408710ejc.187.2023.10.25.12.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 12:29:57 -0700 (PDT)
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
X-Inumbo-ID: e27fa6c8-736c-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1698262198; x=1698866998; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/A/ZtRiyebqcEugV20RrAicCfJuzgWaLmL2OdhFzID8=;
        b=iGK4fpP2GLTiW/3k9ajlXfm6NcidMdRUgjNXW4VZKN7sX37tkBbqSujxdpG61O7DKC
         L+Yec4mpB+7S7V0DTeqYC+FD9L13FYZMAq0kd1L++tuF+RrrmjVgmrlRzouDx9DigsrJ
         +nsSSLOlGDUof1c4u33KJ68PYJpyumkl0uSBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698262198; x=1698866998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/A/ZtRiyebqcEugV20RrAicCfJuzgWaLmL2OdhFzID8=;
        b=XdybLkpFsGrUYeU/q7csb7GXdz8DottBhECHjgpXJFCjKxu976GOQar77i1+qMC44B
         g2D0M6gCxBFimHYA/16zQy21qm2+xldOaGlxycekiH7uYS8rdff02/p4CW3AZjLW4yex
         XkDOSKarJgNsIeLFH6rcAHdjXAs1v8jr79Me2JJS0o8g+uQI41/AuYj0SEOkrqEc7U+z
         NP6HB0NURNh74bMpDLjTgl69oZwFOBHKxsE3q/P2I0GOjs05BuTXj9DHxNR/8TrVVPBG
         wxdMXz1d4MGxYCbjSmqUTYdwdpf0pkVVVRn0Fpp+eXuyfUIH7pK9FVFLQDmXgwW+Ti1l
         lZ3w==
X-Gm-Message-State: AOJu0YxOF+1q/HmvCTJxbEcMNJ+D6YU/jlzStzu/NY7vGOr8naYZpkan
	bJvjT71cQLtBNGGbmNdVGZyaG+hg4T2lcuQqP3c6UFSb
X-Google-Smtp-Source: AGHT+IEzv3+OZXF7rpkTdLtgQRfAeXrM3F1CjoGpIFODMCInYL1OGkCIJ/S/jPBsn4pEyCpibdOo+w==
X-Received: by 2002:a17:907:720f:b0:9ae:6a60:81a2 with SMTP id dr15-20020a170907720f00b009ae6a6081a2mr11358501ejc.25.1698262198095;
        Wed, 25 Oct 2023 12:29:58 -0700 (PDT)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH 01/22] x86/msr: MSR_PLATFORM_INFO shouldn't claim that turbo is programmable
Date: Wed, 25 Oct 2023 20:29:31 +0100
Message-Id: <17a99e1da838a2edeeffa5a988e22c6fcb31406b.1698261255.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698261255.git.edwin.torok@cloud.com>
References: <cover.1698261255.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Edwin Török <edvin.torok@citrix.com>

Xen forbids writes to the various turbo control MSRs, however MSR_PLATFORM_INFO claims that these MSRs are writable.
Override MSR_PLATFORM_INFO bits to indicate lack of support.

See Intel SDM Volume 4, 2.17.6 "MSRs Introduced in the Intel Xeon Scaslable Processor Family",
which describes that MSR_PLATFORM_INFO.[28] = 1 implies that MSR_TURBO_RATIO_LIMIT is R/W,
and similarly bit 29 for TDP control, and bit 30 for MSR_TEMPERATURE_TARGET.

These bits were not all present on earlier processors, however where missing the bits were reserved,
and when present they are always present in the same bits.

(Curiously bit 31 that Xen uses is not documented anywhere in this manual but a separate one).

Backport: 4.0+

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 xen/arch/x86/cpu-policy.c            | 8 ++++++++
 xen/include/xen/lib/x86/cpu-policy.h | 5 ++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 81e574390f..64c8857a61 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -407,6 +407,14 @@ static void __init calculate_host_policy(void)
     /* 0x000000ce  MSR_INTEL_PLATFORM_INFO */
     /* probe_cpuid_faulting() sanity checks presence of MISC_FEATURES_ENABLES */
     p->platform_info.cpuid_faulting = cpu_has_cpuid_faulting;
+
+    /* Xen denies write access to turbo control MSRs, however natively the CPU may support them
+       and advertise those MSRs as writable by having bits 28 to 30 set to 1 in MSR_PLATFORM_INFO.
+       Set these bits to 0 to avoid confusing guests on the availability of turbo controls.
+    */
+    p->platform_info.programmable_ratio_turbo = 0;
+    p->platform_info.programmable_tdp_turbo = 0;
+    p->platform_info.programmable_tj_offset = 0;
 }
 
 static void __init guest_common_max_feature_adjustments(uint32_t *fs)
diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index bab3eecda6..70479689f2 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -339,7 +339,10 @@ struct cpu_policy
     union {
         uint32_t raw;
         struct {
-            uint32_t :31;
+            uint32_t :28;
+            bool programmable_ratio_turbo:1;
+            bool programmable_tdp_turbo:1;
+            bool programmable_tj_offset:1;
             bool cpuid_faulting:1;
         };
     } platform_info;
-- 
2.41.0


