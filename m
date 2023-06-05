Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AE3722D54
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 19:09:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543816.849100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6Dgw-0001qM-Hf; Mon, 05 Jun 2023 17:08:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543816.849100; Mon, 05 Jun 2023 17:08:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6Dgw-0001jY-DO; Mon, 05 Jun 2023 17:08:26 +0000
Received: by outflank-mailman (input) for mailman id 543816;
 Mon, 05 Jun 2023 17:08:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dNO+=BZ=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1q6Dgu-0001hL-OX
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 17:08:24 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93f918b1-03c3-11ee-b232-6b7b168915f2;
 Mon, 05 Jun 2023 19:08:23 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-30ad99fa586so5082388f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Jun 2023 10:08:23 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 b3-20020a5d4d83000000b0030c4d8930b1sm10247405wru.91.2023.06.05.10.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 10:08:22 -0700 (PDT)
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
X-Inumbo-ID: 93f918b1-03c3-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1685984902; x=1688576902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7fxp0WbBbMKypEvumAuysCY0BLPaaSmYzs2KisIH00=;
        b=bX0ieJYw9ilCPO+NbFfqK7wmgNzrSz8WqwisW2uzz/F58LwomsoRUNxVU/i/WGqfaQ
         lZDdLqJq6dZF10AgGibJjPShDGdlH5pAKtuVCSzQwzB0WMfobdEzZrNvvqejBeWbzWVN
         aQjOl1ZJpdzNSM+ARk8icJpA5JN6s04TimjUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685984902; x=1688576902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B7fxp0WbBbMKypEvumAuysCY0BLPaaSmYzs2KisIH00=;
        b=HmV6YC1GXWatxpowOlgwWod4++AiJXc58twQGaN3lq37VYV9tHbgcltSODtAPea9Ym
         8wvzPfhFhNmuw05JFrjZ5t2aQmyns1/5FWX4UTxST8PGfpV5cT7LRnBFEBBWCQ5npJ1u
         aIQUNMsN1wAjbBVcp7+qiDtaM57ztw4tzeEPJiXuoEsAdwwS/sECG63coJkeN144TzQf
         v4I1Z7EHlzXkdt63LRARYGaZOiQSm91UwwuW/fmWtW+XSppS8DfSPN/PwYG7iYHm1H+X
         pydjfkz7mMEivqk7SpK8/KbCKa3BWdHINOGxubKGbDMKjkMhm3ZFNaS61L09zngzt/xO
         SpvA==
X-Gm-Message-State: AC+VfDwrB05YE1ubZAHJAAPBzkcfsJ5l9bn2WSW4CbRfQbp6WmYh1QlG
	LxVk2NozCg/on8TNVmsN0dOiSHihA1ru29/36Wo=
X-Google-Smtp-Source: ACHHUZ6yjFhHjZcRl5U8qb7QH1Jqd7Os8ifx204lVxQq/+5cXpNuDf1O+km9wHvsj/hChpQ2U9HCYw==
X-Received: by 2002:a05:6000:44:b0:306:4162:ebbe with SMTP id k4-20020a056000004400b003064162ebbemr6411420wrx.49.1685984902557;
        Mon, 05 Jun 2023 10:08:22 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/4] x86: Read MSR_ARCH_CAPS after early_microcode_init()
Date: Mon,  5 Jun 2023 18:08:15 +0100
Message-Id: <20230605170817.9913-3-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230605170817.9913-1-alejandro.vallejo@cloud.com>
References: <20230605170817.9913-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tsx_init() has some ad-hoc code to read MSR_ARCH_CAPS if present. In order
to suuport DIS_MCU_UPDATE we need access to it earlier, so this patch moves
early read to the tail of early_microcode_init(), after the early microcode
update.

The read of the 7d0 CPUID leaf is left in a helper because it's reused in a
later patch.

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
I suspect there was an oversight in tsx_init() by which
boot_cpu_data.cpuid_level was never read? The first read I can
see is in identify_cpu(), which happens after tsx_init().

v2:
  * New addition
---
 xen/arch/x86/cpu/microcode/core.c | 21 +++++++++++++++++++++
 xen/arch/x86/tsx.c                | 15 +++------------
 2 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 29ff38f35c..892bcec901 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -840,6 +840,15 @@ static int __init early_microcode_update_cpu(void)
     return microcode_update_cpu(patch);
 }
 
+static void __init early_read_cpuid_7d0(void)
+{
+    boot_cpu_data.cpuid_level = cpuid_eax(0);
+
+    if ( boot_cpu_data.cpuid_level >= 7 )
+        boot_cpu_data.x86_capability[FEATURESET_7d0]
+            = cpuid_count_edx(7, 0);
+}
+
 int __init early_microcode_init(unsigned long *module_map,
                                 const struct multiboot_info *mbi)
 {
@@ -878,5 +887,17 @@ int __init early_microcode_init(unsigned long *module_map,
     if ( ucode_mod.mod_end || ucode_blob.size )
         rc = early_microcode_update_cpu();
 
+    early_read_cpuid_7d0();
+
+    /*
+     * tsx_init() needs MSR_ARCH_CAPS, but it runs before identify_cpu()
+     * populates boot_cpu_data, so we read it here to centralize early
+     * CPUID/MSR reads in the same place.
+     */
+    if ( cpu_has_arch_caps )
+        rdmsr(MSR_ARCH_CAPABILITIES,
+              boot_cpu_data.x86_capability[FEATURESET_m10Al],
+              boot_cpu_data.x86_capability[FEATURESET_m10Ah]);
+
     return rc;
 }
diff --git a/xen/arch/x86/tsx.c b/xen/arch/x86/tsx.c
index 80c6f4cedd..0501e181bf 100644
--- a/xen/arch/x86/tsx.c
+++ b/xen/arch/x86/tsx.c
@@ -39,9 +39,9 @@ void tsx_init(void)
     static bool __read_mostly once;
 
     /*
-     * This function is first called between microcode being loaded, and CPUID
-     * being scanned generally.  Read into boot_cpu_data.x86_capability[] for
-     * the cpu_has_* bits we care about using here.
+     * While MSRs/CPUID haven't yet been scanned, MSR_ARCH_CAPABILITIES
+     * and leaf 7d0 have already been read if present after early microcode
+     * loading time. So we can assume _those_ are present.
      */
     if ( unlikely(!once) )
     {
@@ -49,15 +49,6 @@ void tsx_init(void)
 
         once = true;
 
-        if ( boot_cpu_data.cpuid_level >= 7 )
-            boot_cpu_data.x86_capability[FEATURESET_7d0]
-                = cpuid_count_edx(7, 0);
-
-        if ( cpu_has_arch_caps )
-            rdmsr(MSR_ARCH_CAPABILITIES,
-                  boot_cpu_data.x86_capability[FEATURESET_m10Al],
-                  boot_cpu_data.x86_capability[FEATURESET_m10Ah]);
-
         has_rtm_always_abort = cpu_has_rtm_always_abort;
 
         if ( cpu_has_tsx_ctrl && cpu_has_srbds_ctrl )
-- 
2.34.1


