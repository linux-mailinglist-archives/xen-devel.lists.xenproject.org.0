Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5179CDCEAB
	for <lists+xen-devel@lfdr.de>; Wed, 24 Dec 2025 18:04:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192959.1512069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYSHA-0005up-DW; Wed, 24 Dec 2025 17:03:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192959.1512069; Wed, 24 Dec 2025 17:03:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYSHA-0005pY-2E; Wed, 24 Dec 2025 17:03:52 +0000
Received: by outflank-mailman (input) for mailman id 1192959;
 Wed, 24 Dec 2025 17:03:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jcWU=66=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vYSH7-0003CV-35
 for xen-devel@lists.xenproject.org; Wed, 24 Dec 2025 17:03:49 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 839eed93-e0ea-11f0-b15c-2bf370ae4941;
 Wed, 24 Dec 2025 18:03:48 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b7ffa5d1b80so761541766b.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Dec 2025 09:03:48 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037ab7f7bsm1798927766b.18.2025.12.24.09.03.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 09:03:47 -0800 (PST)
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
X-Inumbo-ID: 839eed93-e0ea-11f0-b15c-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766595828; x=1767200628; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+6n/yOP3bwyBec0cz6YcBSWP9PQeZ3Kxu2XaTVIzNOk=;
        b=RuDeQIWdrf9Wl6S/zUNA8ovCOt08MJiHa4Xe0IfBjlm1xAk3e1U5PPqjplZUQJMidT
         M+ApdGS24i7IDYAEME/EXL2uiHYM7g5ITxjPuf0pEcQsCWMYlT8jI0DEFdWOW8gr188v
         g2cDvOnXzriWRjRCQLH3JZ4r7SiBlZwfz1+kx1r/9aLg+ccYMMX1FJ948CXU7PVG09yP
         DTSvWvRg4gu0KjpocIkq/jDYE2Kju1M/MgQPv6m8N9bYOAUt67dmCTiaed0eJRzenKeB
         IomP8ZYz7w5NRC94IlURo5vCgZiHynePNLcodv2BGiCLyV1v9ZVgLhWwKWpdmpLAmRR7
         IkmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766595828; x=1767200628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+6n/yOP3bwyBec0cz6YcBSWP9PQeZ3Kxu2XaTVIzNOk=;
        b=Xi4mwjrbhRU7QB86rDTiFYygg2uAUal8oR6MBBn7aaQ1IDR8V0pkTkeCcz06UQW9FQ
         02WRQWo5N6pY89KryYU0DxRofG/kOYOB1XYJEfoeNbLBuUVSaarj1cOSeGop8jXlwzEd
         8NLnBkd+nlv8zMneW2f+l0fozvspRp8PPCrHhs3j15nCCVUhM2Yfxv/TqagzRKqpyEhm
         R512dPcPEjhKECNxX2XAMB+ZiWHap3DhyW8BoVlHMWBxZMS5k5nNUAYanq9NLoWdeYRx
         v1tDo48tTXAq7Yku/9Yh/4eBSeg3hh//tayZpjbDaM6WzxqZSmhimRiRoKmPpLkpxCJK
         I6Mg==
X-Gm-Message-State: AOJu0Yxr8U5teyWTQ6O5KFrDdgu7/cuBxwHNy+frWo774J9kDbvsnFBF
	Qeds/W+GpdpuaMY5nEDJSQQAIdRSVwndtw2uvsv1uAaoAfQ9Gzo9MwohRi8aAQ==
X-Gm-Gg: AY/fxX65YyluJbOV6Mr1wzL7g1K4jJz23G+Yyq8llB1pa2SdxIJDlPlQDR530U/6XLq
	Aqtfpga9cx9XwKRARWE53SGdWBFs8rEDCOX4I+3hPNG9w+lgvwMHWSJFE5aKOOTPnwSNVc8fn9c
	8Sgox9ZSDEHsVd+l9DewT36aL2ZR4Lknxd0zzrkglVuNPIKcvCvwzpnvA42ypzfmrsjBPiR5lma
	VKNPjSsEwbBKrmgKcjiAgCXOTbTd4ASv3U/VtmNSbAiYQFg12PpMZOs7eEEBZqokNVhXL3UrkKv
	joycJALXb+ZCcsFR4mwvi2E6Cx9mBN2epdnR9j08BHDsJCkejNB4l6xlpOPW6ekTwjfaBiiD2lg
	TeKB4zrE2n+Xb8nXZOM41vxMFxhGlQJE/EZqy5/ZC9PVtpZB4ZvU8xCPjXWDTQbWINAIu1wCLr1
	cco+9uuActqFACYmste9FXIY8sH2zY3R5uldtUWD0sGQu7x42Eky3tepo=
X-Google-Smtp-Source: AGHT+IGr4zgf4fLfUd2DDKV1cqCs5XI4c7sJYGYVApGkKJiqD3dWds42+WeKTJopx3ZyanuXcdWGLw==
X-Received: by 2002:a17:907:7eaa:b0:b73:885b:7554 with SMTP id a640c23a62f3a-b80371d5059mr1936670666b.45.1766595827506;
        Wed, 24 Dec 2025 09:03:47 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 12/15] xen/riscv: introduce sbi_set_timer()
Date: Wed, 24 Dec 2025 18:03:25 +0100
Message-ID: <84cf8fb2331614c6d0cc6e9030571f42bfc6d928.1766595589.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1766595589.git.oleksii.kurochko@gmail.com>
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce pointer to function which points to a specific sbi_set_timer()
implementation. It is done in this way as different OpenSBI version can
have different Extenion ID and/or funcion ID for TIME extension.

sbi_set_time() programs the clock for next event after stime_value
time. This function also clears the pending timer interrupt bit.

Introduce extension ID and SBI function ID for TIME extension.

Implement only sbi_set_timer_v02() as there is not to much sense
to support earlier version and, at the moment, Xen supports only v02.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/sbi.h | 17 +++++++++++++++++
 xen/arch/riscv/sbi.c             | 26 ++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/xen/arch/riscv/include/asm/sbi.h b/xen/arch/riscv/include/asm/sbi.h
index a88d3d57127a..c54dc7642ff1 100644
--- a/xen/arch/riscv/include/asm/sbi.h
+++ b/xen/arch/riscv/include/asm/sbi.h
@@ -33,6 +33,7 @@
 
 #define SBI_EXT_BASE                    0x10
 #define SBI_EXT_RFENCE                  0x52464E43
+#define SBI_EXT_TIME                    0x54494D45
 
 /* SBI function IDs for BASE extension */
 #define SBI_EXT_BASE_GET_SPEC_VERSION   0x0
@@ -65,6 +66,9 @@
 
 #define SBI_SPEC_VERSION_DEFAULT 0x1
 
+/* SBI function IDs for TIME extension */
+#define SBI_EXT_TIME_SET_TIMER  0x0
+
 struct sbiret {
     long error;
     long value;
@@ -138,6 +142,19 @@ int sbi_remote_hfence_gvma(const cpumask_t *cpu_mask, vaddr_t start,
 int sbi_remote_hfence_gvma_vmid(const cpumask_t *cpu_mask, vaddr_t start,
                                 size_t size, unsigned long vmid);
 
+/*
+ * Programs the clock for next event after stime_value time. This function also
+ * clears the pending timer interrupt bit.
+ * If the supervisor wishes to clear the timer interrupt without scheduling the
+ * next timer event, it can either request a timer interrupt infinitely far
+ * into the future (i.e., (uint64_t)-1), or it can instead mask the timer
+ * interrupt by clearing sie.STIE CSR bit.
+ *
+ * This SBI call returns 0 upon success or an implementation specific negative
+ * error code.
+ */
+extern int (*sbi_set_timer)(uint64_t stime_value);
+
 /*
  * Initialize SBI library
  *
diff --git a/xen/arch/riscv/sbi.c b/xen/arch/riscv/sbi.c
index 425dce44c679..206ea3462c50 100644
--- a/xen/arch/riscv/sbi.c
+++ b/xen/arch/riscv/sbi.c
@@ -249,6 +249,26 @@ static int (* __ro_after_init sbi_rfence)(unsigned long fid,
                                           unsigned long arg4,
                                           unsigned long arg5);
 
+static int cf_check sbi_set_timer_v02(uint64_t stime_value)
+{
+    struct sbiret ret;
+
+#ifdef CONFIG_RISCV_64
+    ret = sbi_ecall(SBI_EXT_TIME, SBI_EXT_TIME_SET_TIMER, stime_value, 0,
+                    0, 0, 0, 0);
+#else
+    ret = sbi_ecall(SBI_EXT_TIME, SBI_EXT_TIME_SET_TIMER, stime_value,
+                    stime_value >> 32, 0, 0, 0, 0);
+#endif
+
+    if ( ret.error )
+        return sbi_err_map_xen_errno(ret.error);
+    else
+        return 0;
+}
+
+int (* __ro_after_init sbi_set_timer)(uint64_t stime_value);
+
 int sbi_remote_sfence_vma(const cpumask_t *cpu_mask, vaddr_t start,
                           size_t size)
 {
@@ -326,6 +346,12 @@ int __init sbi_init(void)
             sbi_rfence = sbi_rfence_v02;
             printk("SBI v0.2 RFENCE extension detected\n");
         }
+
+        if ( sbi_probe_extension(SBI_EXT_TIME) > 0 )
+        {
+            sbi_set_timer = sbi_set_timer_v02;
+            printk("SBI v0.2 TIME extension detected\n");
+        }
     }
     else
         panic("Ooops. SBI spec version 0.1 detected. Need to add support");
-- 
2.52.0


