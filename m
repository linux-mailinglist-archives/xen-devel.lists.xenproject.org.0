Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 815E86A1DC4
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 15:49:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501081.772659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVZN4-00073K-P5; Fri, 24 Feb 2023 14:48:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501081.772659; Fri, 24 Feb 2023 14:48:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVZN4-00070k-MS; Fri, 24 Feb 2023 14:48:26 +0000
Received: by outflank-mailman (input) for mailman id 501081;
 Fri, 24 Feb 2023 14:48:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AdiI=6U=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pVZN2-00070e-AA
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 14:48:24 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4849c744-b452-11ed-a82a-c9ca1d2f71af;
 Fri, 24 Feb 2023 15:48:21 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id j17so14566922ljq.11
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 06:48:21 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.108.92.nat.umts.dynamic.t-mobile.pl. [46.204.108.92])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a2e3509000000b0029352fc39fbsm1481923ljz.63.2023.02.24.06.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 06:48:20 -0800 (PST)
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
X-Inumbo-ID: 4849c744-b452-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gqs1O6BrGgUjBQwv5/Wo5K7s6aN+rCmfuqoj9RJz1Dk=;
        b=VY3iQtCSyiHWtlJtvrkE+Ni53vTwmU+SlXRpkj53JYYSUiERSOMph4wjCg37+Jva9R
         DNGG9yKB/jzbgoNnpImhgJYP+BWBGEyc3JzH4fw6XtQb6KZTkvk+qO2KBcOWcUTt6TMb
         cvv/oNOkDhS5LampNYg11+qytj1xbIBO9SM+AwcTj0Gxpnm4nqjcx056JSIZRDeMfGUA
         nOT9DgP39zP7DwFLxayembvtdrDMp6+lZuWnrp84r/T41B+hSuqRBk6lmUHiCor6lnaT
         TtOe1APZUkVM6dpmuGyx6TQpN1z88LT1bd3Ggf4rDzdG3V7tgvOuTSkDpy2OIn8nRJIX
         hs4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gqs1O6BrGgUjBQwv5/Wo5K7s6aN+rCmfuqoj9RJz1Dk=;
        b=hkBuMXTyOGUzGTwaoTaSAkU3McORwigQrj4TzlyAxZpSmZnit0rsqsn2qT6CQGFDdv
         ygWeR+pQpU88XO1bV9y+BSqO+KMI8Cmnk6ANCqqAR77qFRHcwo4BVpSz2UmJkqHgUrHV
         LwiUnSyf0I2WpBB0gfV39ujPDW1+9ckYq/N3AojPdNEVQ3FG0P7nY7rUsSrx3nqdodZk
         N9KeYbLl/LejhIecssioDCXfGZinvtoqz1+/l/IEW9dZw7Fwk2jgyUL2zInPU6g9kixk
         OeTh1Hn1htrsov+Y3xcSLuy2p45hyIX96PAig3W7SN17tHmhWfFyacrfuRjs7CFH9n5/
         4Liw==
X-Gm-Message-State: AO0yUKUxzqZwnvauFK63IZUM4XXPBThRwdSc6wE10Gj2z0v2YjH0NyOG
	VDxrdN/2rs7svdavmgFROKiemkrPa54=
X-Google-Smtp-Source: AK7set9qi5LCaooJ9u5U5ZW7+Lui02JjCe57lsfjGowWKdLjWJrzgztFZWxXXxJ55Qd5hnArzVDnDA==
X-Received: by 2002:a2e:9e44:0:b0:295:8c47:dca6 with SMTP id g4-20020a2e9e44000000b002958c47dca6mr4385392ljk.17.1677250100386;
        Fri, 24 Feb 2023 06:48:20 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH] xen/riscv: read hart_id and dtb_base passed by bootloader
Date: Fri, 24 Feb 2023 16:48:14 +0200
Message-Id: <94d722dea114defa2a5efe29e6511829f0c54b41.1677249592.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/setup.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index b3f8b10f71..154bf3a0bc 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -26,6 +26,18 @@ static void test_macros_from_bug_h(void)
 
 void __init noreturn start_xen(void)
 {
+    /*
+     * The following things are passed by bootloader:
+     *   a0 -> hart_id
+     *   a1 -> dtb_base
+    */
+    register unsigned long hart_id  asm("a0");
+    register unsigned long dtb_base asm("a1");
+
+    asm volatile( "mv %0, a0" : "=r" (hart_id) );
+
+    asm volatile( "mv %0, a1" : "=r" (dtb_base) );
+
     early_printk("Hello from C env\n");
 
     trap_init();
-- 
2.39.0


