Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIqnDvleA2qE5QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 19:10:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7AE5257E9
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 19:10:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307288.1579074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMqcJ-0008Ca-F1; Tue, 12 May 2026 17:09:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307288.1579074; Tue, 12 May 2026 17:09:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMqcJ-00085R-4N; Tue, 12 May 2026 17:09:59 +0000
Received: by outflank-mailman (input) for mailman id 1307288;
 Tue, 12 May 2026 17:09:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wMqcH-0007rj-GK
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 17:09:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMqcG-00AZHt-TV
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 19:09:56 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a035eca-e002-0a2a0a5209dd-0a2a45078240-46
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 19:09:56 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a035ee4-229c-0a2a45070019-d1558030e133-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 19:09:56 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-488a8ca4aadso53138125e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 10:09:56 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.26.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fc8cccf90sm10838845e9.0.2026.05.12.10.09.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 10:09:55 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778605796; x=1779210596; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9w5Gr7BSqTZeQ8Yv/eCImtGJXonwn8c1SkX4Mjo9nY=;
        b=szPHLkmU0w+MO57eAG6IE6mDg0vJISqQMTT5hNI90Ct/2KHjOGUMQ6GPRIYml4NkHr
         RQm0evuGWfckv8u/uCFk2ENb7FUfyhOAh/XrDjAHBY31DI7o5ZL2JrAw2wJLKuSxPuGJ
         XT56pt2NYPIR+BIjx+/JPPLjfKQ2SGvBy/3UiUfsSn8CSs+McwAAYB+rGj2aEcwY+Isn
         6OXvo/2aBwHY6TRTx/hGEbiTrkw95bxue79UOFZ0pYPo5lI1zUk/iPkmGPmUe2M1/mo5
         1HO/T9HdaEVKU/yezcKFK8GqVLigLBWLR7WOkIpBWCTzX2iVSjVZn3+BSUxk7gHnHNRO
         AMDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778605796; x=1779210596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d9w5Gr7BSqTZeQ8Yv/eCImtGJXonwn8c1SkX4Mjo9nY=;
        b=DLRtppArV9t1MkYKhkOnw2yeGyLVrV366X/t9e+lpHZ4CYmzRj2y+lEpt+NwNaAE/z
         Xcr/BbQx8QEe3Y2mn81nwkEGrSdIceBimqgjf/FPVsr+YBgvAimjdjwXLhdP7e4XLfVF
         afPCo9qkW6eDowCnda4MZShea6n8+yyUSPiE84ln1ddZNYVDrr548T4A4WlP53xsBL5W
         MwjSPxJ/uH3M0kQNdivkOG7nFtPXU1XxfUakBBkOpnXyHJ4yx5PEk8G+tpy+kyRcMuPa
         YjP6l6fezQbrdvxGVs2KCwNGqgje8H+5r9CshVUue0o0O4HfvRELS9ojbmVKSmxr4q6k
         OqWg==
X-Gm-Message-State: AOJu0YyGYhHP5N7D4S3U5WBDX1DDiD+7XjMOmGiAf3rUcxJIqE49AMzA
	hTBYLuFWY+ezv/yrz88hvQHBQ1hZ8S6QWwlIZvJyv6e7X+IwghsrVP0zsPlGlw==
X-Gm-Gg: Acq92OEuj1mX4bYGJWPg2cpqXK9DSLcfh34G5gIoAV2atYRBoYkiRbtPUYbViC0ckHF
	J1t3ZaDgdLZJMEcVUvsziGSFIYb74kp91INljZarIjyuojyoNC5ccjtgZy1e3KD/X5z+2KFZI6S
	rz7ZHqsjzPrJf3v4OO5qQK04pDT1jhf1COU3tCTGXVckk0ADHLR5BhOzdA4QQclvVtuphCmF7oG
	xEzfUZqU33oAElLIy3BbHZzDMml/8h2W0VeNKPUGnCCfXiGFVM88sSR+U3QstXE5iFk2LCiaij/
	K4A46UGHtV9e6+UgLAep8ZfjM/32RSG0ZDuxZaVbfueb+Gz3bcfvuCzQxokwB2HnO7di2YYbGpM
	SAHN1pzXwVnWJXa+aF4Jwu7nqa21lfrX0OVMkm/w8oT5DXcCt3GHfPJA8GBYL8jJWNaoxsEqn/P
	IQenMAzh4LFGI8lQpstyaogCE8JA==
X-Received: by 2002:a05:600d:849c:20b0:488:a2ac:a34c with SMTP id 5b1f17b1804b1-48e51f220e7mr354003745e9.12.1778605796005;
        Tue, 12 May 2026 10:09:56 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v9 11/13] xen/arm: Implement PSCI SYSTEM_SUSPEND call (host interface)
Date: Tue, 12 May 2026 20:07:18 +0300
Message-ID: <9d76348fdd25f0ac7c449ed302ce24ac93b70e95.1778605274.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1778605274.git.mykola_kvach@epam.com>
References: <cover.1778605274.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1778605796-22D77C48-F1299423/0/0
X-purgate-type: clean
X-purgate-size: 4029
X-Rspamd-Queue-Id: DD7AE5257E9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

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


