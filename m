Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A71AECB6F20
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 19:46:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184558.1507067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTlfy-0006MN-CM; Thu, 11 Dec 2025 18:46:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184558.1507067; Thu, 11 Dec 2025 18:46:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTlfy-0006DR-6K; Thu, 11 Dec 2025 18:46:06 +0000
Received: by outflank-mailman (input) for mailman id 1184558;
 Thu, 11 Dec 2025 18:46:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QWGN=6R=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vTlfv-0003I9-KF
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 18:46:03 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3f6eb7e-d6c1-11f0-9cce-f158ae23cfc8;
 Thu, 11 Dec 2025 19:46:01 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b72b495aa81so81991966b.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 10:46:01 -0800 (PST)
Received: from EPUAKYIW02F7.. (pool185-5-253-4.as6723.net. [185.5.253.4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7cfa5d0b0dsm345870466b.67.2025.12.11.10.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 10:46:00 -0800 (PST)
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
X-Inumbo-ID: a3f6eb7e-d6c1-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765478761; x=1766083561; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81pZ/JS38wYFIEh/dUJCFhVaISUWS/A04krI0+LMlhc=;
        b=kxgmo0qK7QjMeAxJbEdE7y0SawvyasAl4w5kAwni+EMdKbGLX/XuePL4LIl8mw7mi2
         7diYC3JXXTIyxf1RM2SfOLSmam6001DDmYeKTeu/ZV6nX7Luna6k/itBfpAXEUh09u4s
         I/AaMjFiHYvOegu1w5SaVRRU/KCAHAI0BIAaX97QEzLgw7IawEdib4FU6WbEw0zPsqTQ
         ebCG5wnWUCITEKWzm6y3sSWaZ3D+qfkX1K9KXDZVC8TmqV24P65o4cD0zTJXNBLxPwbQ
         phMCoaanZW4Z0K9VbOeUwTOnMjgcvfRsDEQt4n5UGHIpdnL3ONEgokE6YaUxBO6GG4Ef
         PfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765478761; x=1766083561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=81pZ/JS38wYFIEh/dUJCFhVaISUWS/A04krI0+LMlhc=;
        b=pivqI+ChjySGcTXJ5bbWuJJjJyJpYyYzirDcARCT4XS5ruU6eysQDLKk/PPk7S9M5f
         PQMK65kdOk7BGcIUysl9A9Nwk0Zwg8LkargOegmYmGvNhrkodiOigPvDWWlOuRI4HPvp
         eBLCuYvWQv6iDCB3DiE9ToA1Of/Jsmhasq6NkwV0XZCnlR/1z8R6k82etX0HFr7SBI2W
         09MVV7gDFA0LZNNYG73d43VZHeb8Ly1PN7ux14AOAcPnYRR1+ZVT8tsqdd4nsRzLroQk
         FFV8tUnxqM22c3k9LeF+FWI1WgfPmrNRigY3D7pnLK7eYMBaY7j5DZqzMi35rgl3o6Vv
         wDHw==
X-Gm-Message-State: AOJu0YyFc3yESkfyzXRRiGw9amjczz2a4UtSBSCMOP3myz5Y26FGt6fd
	49pz0rzlLymHCYNIs0g4fw31fJ1KGn7X9HHEKSJ+yL5tihJhqTpi/uty6oIv0dHn
X-Gm-Gg: AY/fxX6ghitdgONyjfccQfBDqOdfN9RFRuxGDslzp7ZNFgKgekqz+VIbLhL21rb6uJ2
	RYmfeXwidTfSOlUtOEA255ce7GL+SPNUvoHj/73Uj0DPsOHCFBsHZ7fUxFHuEPW8Xr7E64nBOht
	pLZtOLaBEsmlqjeZMahRfvG0p8W5boH7KkMZPyf2iO58kSRxfSH9vI76GMpyAx/E/nSOZzQS7OU
	0riPjCpMuzS5WAwNrpR/s8hAirr660vur+jvlx3ZcumRmYvJgO6xmNp3NtBZ6SXXA+lBmwiVRiO
	8rCj9BNAbuWL3ywwa6OHOFIqE1Pu9/jwYOf/BnjFUqulmKlFwrMhtokv+5JA9OQxI26KZkvO1a/
	U9KwX3LBp+BT7lRFn/SKNBUvz+N/wglRa09iuaC7xVqcNenlaM+LJ7uYWhZDQAvcBOvllnv55ui
	N93DcxJd8AX+OFALU8A3VPzP1g+giz/LAf3eO5mRht
X-Google-Smtp-Source: AGHT+IGCbNd/+PkXSwAoSrqHekaDi2vIULmpYvyFroTTVzA8/HLcn+jzgYkEFCZ7+nnOS/XPw90xzw==
X-Received: by 2002:a17:907:6e9f:b0:b72:c103:88db with SMTP id a640c23a62f3a-b7ce83464c0mr650886566b.9.1765478760742;
        Thu, 11 Dec 2025 10:46:00 -0800 (PST)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
	Mykyta Poturai <mykyta_poturai@epam.com>
Subject: [PATCH v7 11/12] xen/arm: Implement PSCI SYSTEM_SUSPEND call (host interface)
Date: Thu, 11 Dec 2025 20:43:35 +0200
Message-ID: <0808318bbede4bee6f36c08b06e2c0bb22c07fe9.1765472890.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1765472890.git.mykola_kvach@epam.com>
References: <cover.1765472890.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mirela Simonovic <mirela.simonovic@aggios.com>

Invoke PSCI SYSTEM_SUSPEND to finalize Xen's suspend sequence on ARM64 platforms.
Pass the resume entry point (hyp_resume) as the first argument to EL3. The resume
handler is currently a stub and will be implemented later in assembly. Ignore the
context ID argument, as is done in Linux.

Only enable this path when CONFIG_SYSTEM_SUSPEND is set and
PSCI version is >= 1.0.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v7:
- no changes
---
 xen/arch/arm/include/asm/psci.h |  1 +
 xen/arch/arm/psci.c             | 23 ++++++++++++++++++++++-
 2 files changed, 23 insertions(+), 1 deletion(-)

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
index b6860a7760..c9d126b195 100644
--- a/xen/arch/arm/psci.c
+++ b/xen/arch/arm/psci.c
@@ -17,17 +17,20 @@
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
@@ -60,6 +63,24 @@ void call_psci_cpu_off(void)
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
+    arm_smccc_smc(PSCI_1_0_FN_NATIVE(SYSTEM_SUSPEND), __pa(hyp_resume), &res);
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
-- 
2.43.0


