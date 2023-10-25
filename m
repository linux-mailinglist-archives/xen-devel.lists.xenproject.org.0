Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA61D7D7451
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 21:30:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623203.970913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvja6-000538-3W; Wed, 25 Oct 2023 19:30:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623203.970913; Wed, 25 Oct 2023 19:30:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvja5-0004ge-20; Wed, 25 Oct 2023 19:30:17 +0000
Received: by outflank-mailman (input) for mailman id 623203;
 Wed, 25 Oct 2023 19:30:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xaZJ=GH=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1qvjZz-0000YO-KV
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 19:30:11 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e99200bc-736c-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 21:30:10 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-99c3d3c3db9so20953666b.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Oct 2023 12:30:10 -0700 (PDT)
Received: from edvint-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 hv6-20020a17090760c600b00985ed2f1584sm10408710ejc.187.2023.10.25.12.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 12:30:09 -0700 (PDT)
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
X-Inumbo-ID: e99200bc-736c-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1698262210; x=1698867010; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JKhNYdlAE8EwCefQAQkVbnFvAytz3pPS6IXrLO8Y8Kc=;
        b=Zj5TlKrfu78SyOouz/U6bZK7akCc/JA5uk9YTxf/aY26CRq6ywHAvfl8AI5DGK0g5K
         v8udYmuyW8ActQt3/VU8dABPF6djXSnebETFYe9sdybDPSE/VLPRZYeXnEYWRxb7zik1
         7VUsiMqcjvWU+d4dq4c5qqtotAvLyBAfbhUzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698262210; x=1698867010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JKhNYdlAE8EwCefQAQkVbnFvAytz3pPS6IXrLO8Y8Kc=;
        b=q+bL6ZX7srzrFeLoR1tPosAWurZDwuXArvqMuszIFjpBm9AC9XP1iSjJGzgdE8Hh5E
         7GZwvdkxdtkF7liuu9aEEERfxd6RIDAbKUlG4PXi5Ow7f6un8eWY95NLbt3/3ST5PFjr
         NtD6rGpCeg/jFWWJiVClLHq/y8NU2SRosJuGNiEvI0h18hqSAMoR+PypP99+Irqh1ohg
         u5ZJ+brJQHu1dAep1jRgiK5p5euaFu6+AZvDfPEdZZvO4q8DLAaaISqjY5E1AYmfFesb
         +GwWla481kfQD62iDESEEDMj/F7aX6Amr2WWg1JgHSDwvpsqcs4BCh7RV2krwCDoMi4G
         +gLA==
X-Gm-Message-State: AOJu0YxywVeMoeqx5aehlDQwMvTLG+fIo8KgJP45MlMJxxRzLdV1utaE
	u56Zh/hxihRFakFE/vI+rOBQUMkJmgltvk7getIexA==
X-Google-Smtp-Source: AGHT+IFzYgBWUL9afBd9LOeukhnEP1/3SxzWsrc9BUVmSazeXCKhKucA6bNJ0btH7zgnlcBmxZGpDQ==
X-Received: by 2002:a17:906:eec6:b0:9b6:f0e2:3c00 with SMTP id wu6-20020a170906eec600b009b6f0e23c00mr13472824ejb.71.1698262210271;
        Wed, 25 Oct 2023 12:30:10 -0700 (PDT)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH 15/22] x86/VPMU: use macros for max supported VPMU version
Date: Wed, 25 Oct 2023 20:29:45 +0100
Message-Id: <9ed0302bf1cce2dc65d6311c4508bfa4cfe4f8b7.1698261255.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698261255.git.edwin.torok@cloud.com>
References: <cover.1698261255.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Edwin Török <edvin.torok@citrix.com>

This ensures consistency between the 2 pieces of code that check for
VPMU version.

No functional change.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 xen/arch/x86/cpu/vpmu_intel.c   | 20 ++++++--------------
 xen/arch/x86/include/asm/vpmu.h |  1 +
 2 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index 4c0776cee7..82cd2656ea 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -810,7 +810,7 @@ static int cf_check core2_vpmu_initialise(struct vcpu *v)
     static bool_t ds_warned;
 
     if ( v->domain->arch.cpuid->basic.pmu_version <= 1 ||
-         v->domain->arch.cpuid->basic.pmu_version >= 6 )
+         v->domain->arch.cpuid->basic.pmu_version >= VPMU_VERSION_MAX_SUPPORTED )
         return -EINVAL;
 
     if ( (arch_pmc_cnt + fixed_pmc_cnt) == 0 )
@@ -890,22 +890,14 @@ const struct arch_vpmu_ops *__init core2_vpmu_init(void)
     if ( current_cpu_data.cpuid_level >= 0xa )
         version = MASK_EXTR(cpuid_eax(0xa), PMU_VERSION_MASK);
 
-    switch ( version )
-    {
-    case 4:
-    case 5:
-        printk(XENLOG_INFO "VPMU: PMU version %u is not fully supported. "
-               "Emulating version 3\n", version);
-        /* FALLTHROUGH */
-
-    case 2:
-    case 3:
-        break;
-
-    default:
+    if ( version <= 1 ||
+         version > VPMU_VERSION_MAX_SUPPORTED ) {
         printk(XENLOG_WARNING "VPMU: PMU version %u is not supported\n",
                version);
         return ERR_PTR(-EINVAL);
+    } else if ( version > VPMU_VERSION_MAX ) {
+        printk(XENLOG_INFO "VPMU: PMU version %u is not fully supported. "
+               "Emulating version %d\n", version, VPMU_VERSION_MAX);
     }
 
     if ( current_cpu_data.x86 != 6 )
diff --git a/xen/arch/x86/include/asm/vpmu.h b/xen/arch/x86/include/asm/vpmu.h
index 49c3e8c19a..79f7f4a09e 100644
--- a/xen/arch/x86/include/asm/vpmu.h
+++ b/xen/arch/x86/include/asm/vpmu.h
@@ -75,6 +75,7 @@ struct vpmu_struct {
 #define VPMU_CPU_HAS_BTS                    0x2000 /* Has Branch Trace Store */
 
 #define VPMU_VERSION_MAX                    0x3
+#define VPMU_VERSION_MAX_SUPPORTED          0x5
 
 static inline void vpmu_set(struct vpmu_struct *vpmu, const u32 mask)
 {
-- 
2.41.0


