Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAx7EoVFD2qNIgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 19:48:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F185AA902
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 19:48:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315660.1585452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ7VV-0003ce-Tl; Thu, 21 May 2026 17:48:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315660.1585452; Thu, 21 May 2026 17:48:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ7VV-0003Xe-Jj; Thu, 21 May 2026 17:48:29 +0000
Received: by outflank-mailman (input) for mailman id 1315660;
 Thu, 21 May 2026 17:48:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wQ7VS-0002wG-R4
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 17:48:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ7VS-00Bm0f-6P
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 19:48:26 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0f4548-bab6-0a2a0a5309dd-0a2a4505c21c-22
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 19:48:26 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0f456a-aaa8-0a2a45050019-d1558035e4d5-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 19:48:26 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-490388fd0dbso9363275e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 10:48:26 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.24.36]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49033d8e24bsm74565925e9.10.2026.05.21.10.48.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 10:48:25 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779385705; x=1779990505; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Q1Fsw7I5VcRKOn6Vwcp1VtMdJtga40n5Ed4Emmc+5c=;
        b=ESrXHDSk2Wp+wtQZjrqs10S9BA6OApnII7mkPPZgSepvnZ5G4ccEsamXkbWXQhyr0R
         PQyYLS6r76Tg8RW9Q2ZCPLYmz3o8ls4GpyuLyGU2wfXrq9usw/uRRWHi15bd09qwEVjV
         HFJRkLSDGA9wMhDaQhp+27sBdjbCCYi04axHOYAdbg9IK6erVOKH45LAvh+1mozQ9e29
         xbW5FVaPy9LE5DYnmsffW63NgYxOEbQj2GyH6U+uDFYys91VozbYSwSQ6k5c/vdANEOM
         S6L1LNh06LPbcSsHnD+jNJ9hLLpHA4gAKm8pJs//T2Fo4ow24/vzruQVZErJdA42brCp
         9vSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779385705; x=1779990505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9Q1Fsw7I5VcRKOn6Vwcp1VtMdJtga40n5Ed4Emmc+5c=;
        b=X45QHlx5lPmD3gjwFDT8DJNYK3/NecWebvZpABWu40wdm1qvyrjHrLSQCZox2+WWHH
         ewJMlzKcnVGYy/ij0ZRFfIAuh1WcK1oSgAhRRAloJPxJPoVUjSzXprAo8uH96qYkxzEs
         mhPsvKbg9qxkBX6uoE6tCzVHxb1lwAliUYdtnARC4lJX5DgFlWPdnPHMo63R92lagi+d
         T2L9sa5xMhGn2hS7GMkSP4vW2Uv/85pAt/Clt8DuAVldl/kA5XmWeFzFophlh+3gUjK2
         Tz+XrES7nMjSBsxZVYw/SN2l8Q7Ap5MwnamV/KQns3qelo/13h5LSYfzNDxOn3xJGpQ7
         YKDQ==
X-Gm-Message-State: AOJu0Yx5YtoSvKF1wsVwrZVcyjQRH7jS6/XW7cpkau/vObF/J1kwIS6w
	2Al9eax0oxkUCaQpiyAZh9PL4DA7YkBXakvO+eB5/midF1bEbWrBYo2EJ4zXtHgG
X-Gm-Gg: Acq92OFIy2lQCalrg58/G+mSrr5eiAnRuHf92PeFCNjAzQzBFClisOcVWF6s5gXyBp6
	IXP6r6HNNXG3kOscqbMPg2P8QHOl6P1fl3O0Lo0n9bc8H6gyS37o87GP5WzgrwRucvqWcm8dBjj
	czXP2hEMCyia/yyhaRT5eMDEf/+XRUQpsDHzfuezgPcje1wDfR+8PO8CMzpIxuuYANo71C+o1Yj
	7CwEbbqDU8gNNQCH5tysa6nA5jojqj9+UCV2TugKvSbc1GCGKjRUOiVGR22PXvQId47zDcAwZvF
	Fkn0+PShXsP8sJxbYrgVJWVrmj/aQqbLwiMoKv1G8KsIQdUsW/yesKDAYNmzdSfIZvjVDALClHG
	dgLphhVTreCdIeyiz/6uzpEqshXw3doOxMaHcLxpW6yHyu1IgVM12P8//aDLmb6AuE8NAiFu+pP
	mz7wSJKmUCLNwEzLWifII3PVpBsXvlPmnwbawh
X-Received: by 2002:a05:600c:8b77:b0:48e:82af:d9 with SMTP id 5b1f17b1804b1-490360bbdf9mr66528855e9.29.1779385705515;
        Thu, 21 May 2026 10:48:25 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Luca Fancellu <luca.fancellu@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v10 11/13] xen/arm: Implement PSCI SYSTEM_SUSPEND call (host interface)
Date: Thu, 21 May 2026 20:45:29 +0300
Message-ID: <0682352c405b0abfbe2c7f59e4fc1dd51810286c.1779385072.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779385072.git.mykola_kvach@epam.com>
References: <cover.1779385072.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1779385706-DAB68443-529CE09A/0/0
X-purgate-type: clean
X-purgate-size: 4081
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:luca.fancellu@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xilinx.com:email,arm.com:email];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: F3F185AA902
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mirela Simonovic <mirela.simonovic@aggios.com>

Invoke PSCI SYSTEM_SUSPEND to finalize Xen's suspend sequence on ARM64
platforms. Pass the Xen resume entry point (hyp_resume) to EL3 together
with a zero context ID, matching Linux.

This patch wires up only the host-side PSCI SYSTEM_SUSPEND invocation.
The resume trampoline and context restore are provided by earlier patches
in the series.

Only enable this path when CONFIG_SYSTEM_SUSPEND is set and PSCI
advertises SYSTEM_SUSPEND via PSCI_FEATURES.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes in v9:
- cache SYSTEM_SUSPEND support using PSCI_FEATURES and gate the host call
  on the cached capability
- keep the cached SYSTEM_SUSPEND capability read-only after init
- log whether firmware reports SYSTEM_SUSPEND support
- pass an explicit zero context ID in the SYSTEM_SUSPEND call
- drop the stale note claiming hyp_resume is still a stub
---
 xen/arch/arm/include/asm/psci.h |  1 +
 xen/arch/arm/psci.c             | 31 ++++++++++++++++++++++++++++++-
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm/psci.h
index 48a93e6b79..bb3c73496e 100644
--- a/xen/arch/arm/include/asm/psci.h
+++ b/xen/arch/arm/include/asm/psci.h
@@ -23,6 +23,7 @@ int call_psci_cpu_on(int cpu);
 void call_psci_cpu_off(void);
 void call_psci_system_off(void);
 void call_psci_system_reset(void);
+int call_psci_system_suspend(void);
 
 /* Range of allocated PSCI function numbers */
 #define	PSCI_FNUM_MIN_VALUE                 _AC(0,U)
diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
index b6860a7760..e05dae1133 100644
--- a/xen/arch/arm/psci.c
+++ b/xen/arch/arm/psci.c
@@ -17,23 +17,27 @@
 #include <asm/cpufeature.h>
 #include <asm/psci.h>
 #include <asm/acpi.h>
+#include <asm/suspend.h>
 
 /*
  * While a 64-bit OS can make calls with SMC32 calling conventions, for
  * some calls it is necessary to use SMC64 to pass or return 64-bit values.
- * For such calls PSCI_0_2_FN_NATIVE(x) will choose the appropriate
+ * For such calls PSCI_*_FN_NATIVE(x) will choose the appropriate
  * (native-width) function ID.
  */
 #ifdef CONFIG_ARM_64
 #define PSCI_0_2_FN_NATIVE(name)    PSCI_0_2_FN64_##name
+#define PSCI_1_0_FN_NATIVE(name)    PSCI_1_0_FN64_##name
 #else
 #define PSCI_0_2_FN_NATIVE(name)    PSCI_0_2_FN32_##name
+#define PSCI_1_0_FN_NATIVE(name)    PSCI_1_0_FN32_##name
 #endif
 
 uint32_t psci_ver;
 uint32_t smccc_ver;
 
 static uint32_t psci_cpu_on_nr;
+static bool __ro_after_init has_psci_system_suspend;
 
 #define PSCI_RET(res)   ((int32_t)(res).a0)
 
@@ -60,6 +64,25 @@ void call_psci_cpu_off(void)
     }
 }
 
+int call_psci_system_suspend(void)
+{
+#ifdef CONFIG_SYSTEM_SUSPEND
+    struct arm_smccc_res res;
+
+    if ( !has_psci_system_suspend )
+        return PSCI_NOT_SUPPORTED;
+
+    /* Context ID is unused for the Xen resume path. */
+    arm_smccc_smc(PSCI_1_0_FN_NATIVE(SYSTEM_SUSPEND), __pa(hyp_resume), 0,
+                  &res);
+    return PSCI_RET(res);
+#else
+    dprintk(XENLOG_WARNING,
+            "SYSTEM_SUSPEND not supported (CONFIG_SYSTEM_SUSPEND disabled)\n");
+    return PSCI_NOT_SUPPORTED;
+#endif
+}
+
 void call_psci_system_off(void)
 {
     if ( psci_ver > PSCI_VERSION(0, 1) )
@@ -223,9 +246,15 @@ int __init psci_init(void)
 
     psci_init_smccc();
 
+    has_psci_system_suspend =
+        psci_features(PSCI_1_0_FN_NATIVE(SYSTEM_SUSPEND)) == 0;
+
     printk(XENLOG_INFO "Using PSCI v%u.%u\n",
            PSCI_VERSION_MAJOR(psci_ver), PSCI_VERSION_MINOR(psci_ver));
 
+    printk(XENLOG_DEBUG "PSCI SYSTEM_SUSPEND is %ssupported by firmware\n",
+           has_psci_system_suspend ? "" : "not ");
+
     return 0;
 }
 
-- 
2.43.0


