Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A384A6A8374
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 14:24:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504923.777393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXiuB-0000Vn-Pw; Thu, 02 Mar 2023 13:23:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504923.777393; Thu, 02 Mar 2023 13:23:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXiuB-0000U0-MJ; Thu, 02 Mar 2023 13:23:31 +0000
Received: by outflank-mailman (input) for mailman id 504923;
 Thu, 02 Mar 2023 13:23:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5rfr=62=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pXiuA-0008Qd-Dq
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 13:23:30 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b38479c-b8fd-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 14:23:28 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id y14so17583480ljq.4
 for <xen-devel@lists.xenproject.org>; Thu, 02 Mar 2023 05:23:28 -0800 (PST)
Received: from fedora.. (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 s8-20020a05651c048800b00290679ebac1sm2109551ljc.9.2023.03.02.05.23.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 05:23:27 -0800 (PST)
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
X-Inumbo-ID: 6b38479c-b8fd-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677763408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IcGex5in4thV+OlZrwNvKuJkjY8dPXTKwAgZbk5Bkbk=;
        b=EhuIONdNarO4l8MGOsL1rPZ5xLfOd0ik+8zpXehgJjsP4X7Df4xTErTzxcjh4uNyzx
         cKOpX0h6LrwPH88eUbWXvR+TYgZ4RwkxmHJWeDeQeBXs91xRVp0qI1DCdVa7VEXZIp6/
         nPMyaVPk7Nztml/KeJQ6I3Y6VBRxPtahCCC/dZRQTNEIEUIa7mNOIFv5zH5vaGwEswx4
         Tdw2cu00ecBaEZv9m3kjFEiktIQLfNXEBFTQ7zpej3oQLJkvna4j4OaXB8L3xVvMrQDG
         jMV+H75aEK8bxjnahDSF1wLzp08+NacHx+4xZbXPDWuo9FV0/xGLPqBqzMScEA0lO2S1
         19tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677763408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IcGex5in4thV+OlZrwNvKuJkjY8dPXTKwAgZbk5Bkbk=;
        b=SLSRT4ormkqG4J+2B2u9l5Uppk/7C4LCGqnHXe0k7xzNBUvfeLbWy7sRW3XqJOQU5A
         6DVevH15OX22CfHEMoEQgdaQC7HiniebAwblRSpMtUFFQjI3wIb3f8QhaU+anXiE9+Kv
         Tnh/wxI8eg1uh+7kjpNT0YC+tpFyPIgrQS3KtCrf/0bbV8/3C/2+spY6Azfxtw/YUjn3
         w95smUiL0wCQOHjFM7nK9EcqUEpQgWcvq8sGaeLAi7r8Dvf82eYrIhaw/rErrTSSiQaj
         KrWUQnkr31LSMIDtu7TYLxPITQhSK0xy6MFvB1KbXaZERpkLSgZ2ig/gi7ht+abrLwOf
         OJMQ==
X-Gm-Message-State: AO0yUKXJWtuUVmzWBF0oMRuHZWPk8696zE25RfSkF9bRFc2FPqTL3DEc
	N7eyEJXQ2MUCYAjJ1Z00BKNeqmrUAm4=
X-Google-Smtp-Source: AK7set/FrsS26xxLZ/uLPuGuy47aOWDBW+J+JZWvWpCNMiDAmCb0p0n3PqX6Edy2RQanmMbTuHUlMA==
X-Received: by 2002:a2e:8048:0:b0:295:c399:686 with SMTP id p8-20020a2e8048000000b00295c3990686mr2976784ljg.13.1677763407706;
        Thu, 02 Mar 2023 05:23:27 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v2 2/3] xen/riscv: initialize .bss section
Date: Thu,  2 Mar 2023 15:23:19 +0200
Message-Id: <495bd1d7fc2becdd48bd00253c079971e2231e99.1677762812.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1677762812.git.oleksii.kurochko@gmail.com>
References: <cover.1677762812.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes since v1:
 * initialization of .bss was moved to head.S
---
 xen/arch/riscv/include/asm/asm.h | 4 ++++
 xen/arch/riscv/riscv64/head.S    | 9 +++++++++
 2 files changed, 13 insertions(+)

diff --git a/xen/arch/riscv/include/asm/asm.h b/xen/arch/riscv/include/asm/asm.h
index 6d426ecea7..5208529cb4 100644
--- a/xen/arch/riscv/include/asm/asm.h
+++ b/xen/arch/riscv/include/asm/asm.h
@@ -26,14 +26,18 @@
 #if __SIZEOF_POINTER__ == 8
 #ifdef __ASSEMBLY__
 #define RISCV_PTR		.dword
+#define RISCV_SZPTR		8
 #else
 #define RISCV_PTR		".dword"
+#define RISCV_SZPTR		8
 #endif
 #elif __SIZEOF_POINTER__ == 4
 #ifdef __ASSEMBLY__
 #define RISCV_PTR		.word
+#define RISCV_SZPTR		4
 #else
 #define RISCV_PTR		".word"
+#define RISCV_SZPTR		4
 #endif
 #else
 #error "Unexpected __SIZEOF_POINTER__"
diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
index 851b4691a5..b139976b7a 100644
--- a/xen/arch/riscv/riscv64/head.S
+++ b/xen/arch/riscv/riscv64/head.S
@@ -13,6 +13,15 @@ ENTRY(start)
         lla     a6, _dtb_base
         REG_S   a1, (a6)
 
+        la      a3, __bss_start
+        la      a4, __bss_end
+        ble     a4, a3, clear_bss_done
+clear_bss:
+        REG_S   zero, (a3)
+        add     a3, a3, RISCV_SZPTR
+        blt     a3, a4, clear_bss
+clear_bss_done:
+
         la      sp, cpu0_boot_stack
         li      t0, STACK_SIZE
         add     sp, sp, t0
-- 
2.39.0


