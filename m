Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4D47D744F
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 21:30:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623193.970827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvjZu-0002Sb-Tv; Wed, 25 Oct 2023 19:30:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623193.970827; Wed, 25 Oct 2023 19:30:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvjZu-0002Kv-Nv; Wed, 25 Oct 2023 19:30:06 +0000
Received: by outflank-mailman (input) for mailman id 623193;
 Wed, 25 Oct 2023 19:30:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xaZJ=GH=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1qvjZs-0001Lv-QD
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 19:30:04 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4840e10-736c-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 21:30:02 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-9b95622c620so24431766b.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Oct 2023 12:30:02 -0700 (PDT)
Received: from edvint-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 hv6-20020a17090760c600b00985ed2f1584sm10408710ejc.187.2023.10.25.12.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 12:30:01 -0700 (PDT)
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
X-Inumbo-ID: e4840e10-736c-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1698262202; x=1698867002; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+4Ugom2BHWfSCQHaZ15aBTStdezniWO/0GIfarrnvRY=;
        b=G41IVVsNTjuJuI25uQ+S8ZI+6uaSBM+X0OQUVuFP55E7xqx+bipBRsMuJURzQk8/u3
         SyNLZb2zWPFF7iLO43mrUEwdmRXQPRaFJjQOaRCKyjmr4/vcXJ07yOP1KkU4toczYsUR
         Oc7O7mUbhx9wTi+C4B3kvwN1GS2Wk3NcQYNXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698262202; x=1698867002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+4Ugom2BHWfSCQHaZ15aBTStdezniWO/0GIfarrnvRY=;
        b=ILn+uP2EHgrdFC4Aq2UnVS3HYngjOAS1sr2N1mtHOwopE/cEunLKPmRSeRqxLgyQOj
         mcaCNKNmhBL9spala2WXnJL2JYgg8yIym/iKF2HkdapIqftrd+U1c9HGD+YTncee/J7u
         MMZwQSUtWqlStQONPFksbitZ3LP/rD2d4nUNGAJ/rmzXA6i8ML0ZRzgd4lMvcCbapfKg
         tQBzlUIx5tmFCDhV495s+wJMSnhjbwhdFBwh6xEV4TyBMrmj4y2IpLYRAYoLYlCnOux0
         a3RsPGBqMlRDmGdJdeJXHJ/u48Nbz49VpZWEJJlvsjb6M8cXpMIteZK3rM3FAgqqCQMA
         CbFQ==
X-Gm-Message-State: AOJu0YwnU57yRXJw0xWOVKNd6udXW73t0yQnsJqBz+2ig5pZQ7SOdH4F
	/efIkOMr2HzCJFZpDGMw6BnPUbSRXmIhkRNzOOJyQHwr
X-Google-Smtp-Source: AGHT+IHlyeNic58eWA6AVEhtXnW5b2tNaVHDqvEIfpVl/o8VVXuxMwbs+BxoU7A+kDntpz0Nz79TiA==
X-Received: by 2002:a17:906:c14b:b0:9ad:a59f:331a with SMTP id dp11-20020a170906c14b00b009ada59f331amr13625243ejc.57.1698262201789;
        Wed, 25 Oct 2023 12:30:01 -0700 (PDT)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH 05/22] x86/PMUv1: report correct information in 0xa CPUID
Date: Wed, 25 Oct 2023 20:29:35 +0100
Message-Id: <4a00165999a0cc250f097fc8eaab0649f1c05ac0.1698261255.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698261255.git.edwin.torok@cloud.com>
References: <cover.1698261255.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Edwin Török <edvin.torok@citrix.com>

The 0xa CPUID leaf has to report supported number of:
- fixed performance counters
- general purpose performance counters
- architectural predefined events

And the PMU version (which was already limited to 3).

Type punning is used, which should be safe due to -fno-strict-aliasing.

This limits the number of arch events supported when vpmu=arch on Icelake.

Backport: 4.0+

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 xen/arch/x86/cpu/vpmu_intel.c   |  2 +-
 xen/arch/x86/cpuid.c            | 39 ++++++++++++++++++++++++++++++---
 xen/arch/x86/include/asm/vpmu.h |  4 ++++
 3 files changed, 41 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index fa5b40c65c..9602728f1b 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -66,7 +66,7 @@ static bool_t __read_mostly full_width_write;
 #define ARCH_CNTR_PIN_CONTROL (1ULL << 19)
 
 /* Number of general-purpose and fixed performance counters */
-static unsigned int __read_mostly arch_pmc_cnt, fixed_pmc_cnt;
+unsigned int __read_mostly arch_pmc_cnt, fixed_pmc_cnt;
 
 /* Masks used for testing whether and MSR is valid */
 #define ARCH_CTRL_MASK  (~((1ull << 32) - 1) | (1ull << 21) | ARCH_CNTR_PIN_CONTROL)
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 455a09b2dd..dfbcd1b3a4 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -304,9 +304,42 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
             *res = EMPTY_LEAF;
         else
         {
-            /* Report at most v3 since that's all we currently emulate. */
-            if ( (res->a & 0xff) > 3 )
-                res->a = (res->a & ~0xff) | 3;
+            union {
+                uint32_t eax;
+                struct {
+                    uint8_t version;
+                    uint8_t general_nr;
+                    uint8_t general_width;
+                    uint8_t arch_nr;
+                };
+            } u;
+            u.eax = res->a;
+
+            /* Report at most VPMU_VERSION_MAX since that's all we currently emulate. */
+            if ( u.version >  VPMU_VERSION_MAX ) {
+                gdprintk(XENLOG_WARNING, "Limiting PMU version to %d (actual %d)", VPMU_VERSION_MAX, u.version);
+                u.version = VPMU_VERSION_MAX;
+            }
+
+            if ( u.general_nr > arch_pmc_cnt ) {
+                gdprintk(XENLOG_WARNING, "Limiting general purpose PMU count to %d (actual %d)", arch_pmc_cnt, u.general_nr);
+                u.general_nr = arch_pmc_cnt;
+            }
+
+            if ( vpmu_features & (XENPMU_FEATURE_IPC_ONLY |
+                                  XENPMU_FEATURE_ARCH_ONLY) ) {
+                unsigned limit = ( vpmu_features & XENPMU_FEATURE_ARCH_ONLY ) ? 7 : 3;
+                if (limit < u.arch_nr) {
+                    gdprintk(XENLOG_WARNING, "Limiting architectural PMU events to %d (actual %d)", limit, u.arch_nr);
+                    u.arch_nr = limit;
+                }
+            }
+
+            res->a = u.eax;
+
+            /* We only implement 3 fixed function counters */
+            if ( (res->d & 0x1f) > fixed_pmc_cnt )
+                res->d = (res->d & ~0x1f) | fixed_pmc_cnt;
         }
         break;
 
diff --git a/xen/arch/x86/include/asm/vpmu.h b/xen/arch/x86/include/asm/vpmu.h
index b165acc6c2..1ef6089ccb 100644
--- a/xen/arch/x86/include/asm/vpmu.h
+++ b/xen/arch/x86/include/asm/vpmu.h
@@ -74,6 +74,8 @@ struct vpmu_struct {
 #define VPMU_CPU_HAS_DS                     0x1000 /* Has Debug Store */
 #define VPMU_CPU_HAS_BTS                    0x2000 /* Has Branch Trace Store */
 
+#define VPMU_VERSION_MAX                    0x3
+
 static inline void vpmu_set(struct vpmu_struct *vpmu, const u32 mask)
 {
     vpmu->flags |= mask;
@@ -118,6 +120,8 @@ static inline int vpmu_do_rdmsr(unsigned int msr, uint64_t *msr_content)
 
 extern unsigned int vpmu_mode;
 extern unsigned int vpmu_features;
+extern unsigned int arch_pmc_cnt;
+extern unsigned int fixed_pmc_cnt;
 
 /* Context switch */
 static inline void vpmu_switch_from(struct vcpu *prev)
-- 
2.41.0


