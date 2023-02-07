Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E7F68DC03
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 15:47:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491197.760306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPPFc-0007Xw-Ax; Tue, 07 Feb 2023 14:47:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491197.760306; Tue, 07 Feb 2023 14:47:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPPFb-0007ML-Rj; Tue, 07 Feb 2023 14:47:15 +0000
Received: by outflank-mailman (input) for mailman id 491197;
 Tue, 07 Feb 2023 14:47:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BG9e=6D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pPPFZ-00043Z-Gc
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 14:47:13 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e93df62-a6f6-11ed-933c-83870f6b2ba8;
 Tue, 07 Feb 2023 15:47:12 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id d14so13781503wrr.9
 for <xen-devel@lists.xenproject.org>; Tue, 07 Feb 2023 06:47:13 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.109.85.nat.umts.dynamic.t-mobile.pl. [46.204.109.85])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a5d4fca000000b002c3e94cb757sm5269743wrw.117.2023.02.07.06.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 06:47:12 -0800 (PST)
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
X-Inumbo-ID: 4e93df62-a6f6-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V6IhfQAV5IjeeWZlpGmkr/m4ORJCf6aJbJ24k0Y0RyM=;
        b=A+aRebtaV3WpRPtal0p4naUZFEf2dOOimXcWyxt6+InsIlNAr5FeF8zJ+9Fs8ODYp5
         EGBwta7Dhk/9VyucGPp5PiIKdfj+2+MyTmiT/hNbtuRWODJ9i5yqZDpfQK5DsXFnXXOe
         32OxFHZmbF9l8nH4PU2XO2moIZRwxi91MoykGd7gQfO3wPLam0O2FQyCH79qT9YaJof8
         1ioJWoNHB+LWpf3bUTJFxYZwUQ1NAjAKxhuG2CykOGG/ke3t50EQC6Cl8zC+MivMryuq
         G17Dr4SUdV8WpLbQ5AjWRSq6Tk2qhh81I/1UzUbLM/LnhpP7ezV72RwApGzo6fBnL61N
         19Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V6IhfQAV5IjeeWZlpGmkr/m4ORJCf6aJbJ24k0Y0RyM=;
        b=BdqLgykfiEYQSdyka9o3omXcvgRyjcMaOGk3OuT8+lTGc2abRhmF4JL71MmR6XS451
         9+E0tkS6FrIcClJBf4dyqyTDbOAZjha7beBf3O8zHOJLbETwMjdh27uNE5KjgD2UT3bl
         tunUpP6LVahKaO2+MT2Z5+TrdCTllXzlHKi7NJ7ZjcuT8iGawQRt5ygGedbgZmYk5clP
         G+X6SunsD5rtWiN8mjbzyIQO2wZNIjdUyJ1H8CkLk2KMpS9cp+goYu68+lptPP+NOx6S
         EY9lHRhy81WK9gRIPPmT1x0vGkjaatOQqkdPhqaEsCfW0N/dUPSr/kPOWzRaeGzdEkkO
         VFvw==
X-Gm-Message-State: AO0yUKUv7qjpkccIsVdAqmr368QKK7DKv4Xi+qUpSbpZoSn6/I/En53u
	67QkgnnKTUpTZZIEuL8ieBQSdycsIec=
X-Google-Smtp-Source: AK7set8UcK6JVA5vbQ/17muxBznyE8QIL4jNt9zqnWLiZK7CvcqB0ffFaWrCjTPchxB4Fi1Bf1JdeQ==
X-Received: by 2002:adf:d0c5:0:b0:2c3:e958:6dfc with SMTP id z5-20020adfd0c5000000b002c3e9586dfcmr2985084wrh.13.1675781232669;
        Tue, 07 Feb 2023 06:47:12 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v3 13/14] xen/riscv: test basic handling stuff
Date: Tue,  7 Feb 2023 16:46:48 +0200
Message-Id: <a3073af11e93a68a6c1767974140302ee6f5db42.1675779308.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1675779308.git.oleksii.kurochko@gmail.com>
References: <cover.1675779308.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
  - Nothing changed
---
Changes in V2:
  - Nothing changed
---
 xen/arch/riscv/setup.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index d502cf06b0..8d070244fd 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -9,12 +9,28 @@
 unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
     __aligned(STACK_SIZE);
 
+static void test_run_in_exception(struct cpu_user_regs *regs)
+{
+    early_printk("If you see this message, ");
+    early_printk("run_in_exception_handler is most likely working\n");
+}
+
+static void test_macros_from_bug_h(void)
+{
+    run_in_exception_handler(test_run_in_exception);
+    WARN();
+    early_printk("If you see this message, ");
+    early_printk("WARN is most likely working\n");
+}
+
 void __init noreturn start_xen(void)
 {
     early_printk("Hello from C env\n");
 
     trap_init();
 
+    test_macros_from_bug_h();
+
     for ( ;; )
         asm volatile ("wfi");
 
-- 
2.39.0


