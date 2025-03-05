Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB73A4FA36
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 10:36:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902085.1310030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tplAU-0006ci-Es; Wed, 05 Mar 2025 09:35:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902085.1310030; Wed, 05 Mar 2025 09:35:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tplAU-0006aM-BE; Wed, 05 Mar 2025 09:35:58 +0000
Received: by outflank-mailman (input) for mailman id 902085;
 Wed, 05 Mar 2025 09:35:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0bc7=VY=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1tpknV-0006ev-T5
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 09:12:13 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec4b6969-f9a1-11ef-9ab4-95dc52dad729;
 Wed, 05 Mar 2025 10:12:12 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-549644ae382so3791337e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 01:12:12 -0800 (PST)
Received: from EPUAKYIW02F7.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5495de028fasm1078264e87.139.2025.03.05.01.12.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 01:12:10 -0800 (PST)
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
X-Inumbo-ID: ec4b6969-f9a1-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741165931; x=1741770731; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OXLlKW5nv40S06WQPFz6hgkP1NsQEMxuauOitke4PHE=;
        b=P3ER3n5Xori1TIRyYOY0eHzg3z5ah1DNS+Kg+6zvqc4CJTsgh1vyKOP+tibBAOyA3K
         lTZKM5q38/iSGOyUqLStl8YA+SHxCC1lujzG0OKbgbAU5iMo6rvYUCJ6nKeBOcC/Zacw
         RRsFFp6ZXF1LdR2yiW+B3Z9BpbsEIA3HflVaTvWy3gmmhuvkttxLGum66n2d93rC/UNL
         jAJmHbM2DpCYazOClxpUkati/ShIC4v8bDBA11VOqpnRg39upSuf9nJWPFpi5YL+tZ1F
         N4tKgWAP0CaU/Q2J2TUU0+Djpmmq0myd1oYDeowLaYTeO5tpgb32HFgpmA2qzFRNEoK2
         XWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741165931; x=1741770731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OXLlKW5nv40S06WQPFz6hgkP1NsQEMxuauOitke4PHE=;
        b=KrkI5463sRgdiAIobGRhuavnRgbtkm/oOXw6vDZx02VjZmEZKwCYct2rR4ZChU8svS
         si9cIP5uEvci3RPiBAbt2S7nHjOSZ6VplEfWUuO3oD7CiEmJ73oZvtMAUIyBUtpnM/zw
         0hDsI2cbhmKD6xR5HD5bsWLOb2H3tzzP1BpOJMTdDUrjE8spagFH19yxlZLXDsdASflR
         AbpZWOuzaUmKPc+9oQ3HyS2gG1JQ9ZkAoh+GZDkqe5zFotseNHJy8U0UcofgFS76ymGP
         Gb4dGbTjQQ4XcOCKZb385dQDhStiOVSr5VKiQBMX2ceB8D5d2qSEflqQhHngFhEbfl05
         Pyyg==
X-Gm-Message-State: AOJu0YyTtunychFjgry0/PzXxVFH49hPtnT9FgJAIk7UDvg8ZeJtK2bW
	IR7xh8/m/++5sI4tTUTFwX568G4KfcA+QfyLPaUGh1LYB2HwWTAwLWusbGMT
X-Gm-Gg: ASbGncsz2LrjBSqOBQWDo/c+1sqomjrUkBCwsdcaIio+iIOUuN95hKEBtOgikAUx5h5
	RiOQMESnbyncqyTMRVql1KW/lk170ox+DS3rlCjGiZ9KdTag+XLvq3csuBXK9z2/Mls6Kd1LdX7
	HxU8GCwlPGAlJSj0OccdcHDQgVjKWtah3UMBVjVdJZfX+Hpc0ZYRki6+Uvi4EFINNnY6kRx8oFk
	1c+hdOwHpwyQaOeN6mKCcAdfgson7aDbpl5YYLMwA5VLLs6xnJz+Jh8T2g7IMfHyjBZaSwcjIyU
	Zvpf6D1+n27tj5/UkIYaNhK2kNMIA1A+qBLjCCr05n6OOPXgoQ==
X-Google-Smtp-Source: AGHT+IED2pTmgmlwYHsZ5O+krX5IHb1uPznDzqX7LlpSapMlugzkbIuCnCD0SHcp4PftUEdRub8uag==
X-Received: by 2002:a05:6512:3d0e:b0:549:6759:3979 with SMTP id 2adb3069b0e04-5497d336a8dmr887121e87.18.1741165931284;
        Wed, 05 Mar 2025 01:12:11 -0800 (PST)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mirela Simonovic <mirela.simonovic@aggios.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
	Mykyta Poturai <mykyta_poturai@epam.com>,
	Mykola Kvach <mykola_kvach@epam.com>
Subject: [PATCH 13/16] xen/arm: Implement PSCI SYSTEM_SUSPEND call (physical interface)
Date: Wed,  5 Mar 2025 11:11:21 +0200
Message-ID: <bb700ffbe133a8485320d6845d058ffc72a2f3d6.1741164138.git.xakep.amatop@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741164138.git.xakep.amatop@gmail.com>
References: <cover.1741164138.git.xakep.amatop@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mirela Simonovic <mirela.simonovic@aggios.com>

PSCI system suspend function shall be invoked to finalize Xen suspend
procedure. Resume entry point, which needs to be passed via 1st argument
of PSCI system suspend call to the EL3, is hyp_resume. For now, hyp_resume
is just a placeholder that will be implemented in assembly. Context ID,
which is 2nd argument of system suspend PSCI call, is unused, as in Linux.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes introduced in v3:
- return PSCI_NOT_SUPPORTED instead of 1 for arm32
- add checking of PSCI version for psci suspend call
---
 xen/arch/arm/arm64/head.S          |  8 ++++++++
 xen/arch/arm/include/asm/psci.h    |  1 +
 xen/arch/arm/include/asm/suspend.h |  1 +
 xen/arch/arm/psci.c                | 19 +++++++++++++++++++
 xen/arch/arm/suspend.c             |  4 ++++
 5 files changed, 33 insertions(+)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 72c7b24498..3522c497c5 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -561,6 +561,14 @@ END(efi_xen_start)
 
 #endif /* CONFIG_ARM_EFI */
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+FUNC(hyp_resume)
+        b .
+END(hyp_resume)
+
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 /*
  * Local variables:
  * mode: ASM
diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm/psci.h
index 48a93e6b79..15eb2c6013 100644
--- a/xen/arch/arm/include/asm/psci.h
+++ b/xen/arch/arm/include/asm/psci.h
@@ -20,6 +20,7 @@ extern uint32_t psci_ver;
 
 int psci_init(void);
 int call_psci_cpu_on(int cpu);
+int call_psci_system_suspend(void);
 void call_psci_cpu_off(void);
 void call_psci_system_off(void);
 void call_psci_system_reset(void);
diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/asm/suspend.h
index 745377dbcf..0d2f0da0ad 100644
--- a/xen/arch/arm/include/asm/suspend.h
+++ b/xen/arch/arm/include/asm/suspend.h
@@ -4,6 +4,7 @@
 #define __ASM_ARM_SUSPEND_H__
 
 int32_t domain_suspend(register_t epoint, register_t cid);
+void hyp_resume(void);
 
 #endif
 
diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
index b6860a7760..8e9c571467 100644
--- a/xen/arch/arm/psci.c
+++ b/xen/arch/arm/psci.c
@@ -17,6 +17,7 @@
 #include <asm/cpufeature.h>
 #include <asm/psci.h>
 #include <asm/acpi.h>
+#include <asm/suspend.h>
 
 /*
  * While a 64-bit OS can make calls with SMC32 calling conventions, for
@@ -60,6 +61,24 @@ void call_psci_cpu_off(void)
     }
 }
 
+int call_psci_system_suspend(void)
+{
+#ifdef CONFIG_SYSTEM_SUSPEND
+    struct arm_smccc_res res;
+
+    if ( psci_ver < PSCI_VERSION(1, 0) )
+        return PSCI_NOT_SUPPORTED;
+
+    /* 2nd argument (context ID) is not used */
+    arm_smccc_smc(PSCI_1_0_FN64_SYSTEM_SUSPEND, __pa(hyp_resume), &res);
+
+    return PSCI_RET(res);
+#else
+    /* not supported */
+    return PSCI_NOT_SUPPORTED;
+#endif
+}
+
 void call_psci_system_off(void)
 {
     if ( psci_ver > PSCI_VERSION(0, 1) )
diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
index fa81be5a4f..ac88faee2e 100644
--- a/xen/arch/arm/suspend.c
+++ b/xen/arch/arm/suspend.c
@@ -170,6 +170,10 @@ static long system_suspend(void *data)
      */
     update_boot_mapping(true);
 
+    status = call_psci_system_suspend();
+    if ( status )
+        dprintk(XENLOG_ERR, "PSCI system suspend failed, err=%d\n", status);
+
     system_state = SYS_STATE_resume;
     update_boot_mapping(false);
 
-- 
2.43.0


