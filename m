Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 194D96A1DC2
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 15:49:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501083.772669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVZNO-0007NQ-2g; Fri, 24 Feb 2023 14:48:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501083.772669; Fri, 24 Feb 2023 14:48:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVZNN-0007Jp-V8; Fri, 24 Feb 2023 14:48:45 +0000
Received: by outflank-mailman (input) for mailman id 501083;
 Fri, 24 Feb 2023 14:48:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AdiI=6U=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pVZNM-00070e-Fs
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 14:48:44 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55476ef1-b452-11ed-a82a-c9ca1d2f71af;
 Fri, 24 Feb 2023 15:48:43 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id k14so17220114lfj.7
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 06:48:43 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.108.92.nat.umts.dynamic.t-mobile.pl. [46.204.108.92])
 by smtp.gmail.com with ESMTPSA id
 d17-20020ac244d1000000b004d6f86c52fcsm1479313lfm.193.2023.02.24.06.48.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 06:48:42 -0800 (PST)
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
X-Inumbo-ID: 55476ef1-b452-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zE4IPS4UCnrjNybkfHTwwWZ+bHlMLh1Uu83yRnN418M=;
        b=nfmGl78c01HgnzMp9tMUAxo10ulXYs6n8mGgh3XahUm2rRQeUVWc2fzONkWy/EOfu1
         x2zbY1kLg6+lIxlpsCo3A3+os9bn9agg9CcMDj/mJDgtnEQ6FrS3w5V7l956BwSEg4mW
         rxcuHGn11/QGyCmFd11u1c5NqC2ltTynpaEr8QrObZ3SeGfhM0WIaD4bN3WsbB6XRL4N
         CtL9dBbLPTV4zwhjUfW45kkNq1TtQD2+7KY2aD+v3pguma+ZQ1cmXVURbCA/Dfl6xZQd
         1NtJ4reuR5e356lmEmoVJM5yGuGM7PSDfWbY4dqFNErnZ4TdldRty/gMTQHf91UKS4J9
         /akg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zE4IPS4UCnrjNybkfHTwwWZ+bHlMLh1Uu83yRnN418M=;
        b=aEKEJgHNjMNNeLLMEy0EA1gr0LHnCzE9FSbwNNqheUdTT4hOylS1Fpornw+Xm+DbA2
         blNacPrpopvfmywkJWnRNwbQGETERKKEoPpWT4Skn2K4gIyExRJYaLX/GoKVcTjBLAsT
         JDNHc+/IVwlO4MK5dQQi1Ao5tUFHJpHEqNVs7wpVpSzkIvm0ar68JS/5bTpZw/L8+Y3q
         EYqrgljLUWKUn0wSv7IjRPqMrPHnAt+vzM8Vpqifd68hJUL0304x5Lk4XhIxE2y1X8VQ
         cP6EsORsheaGUVDHT0yiQuOf+rAEQJai589DX5frBLgInEBVaHqusubnIUDofFKS6jBD
         8zHQ==
X-Gm-Message-State: AO0yUKWa8X74SOWESNYJqzgeSW/qBYeX3OkX0IKlAI4/AgX3pbzYFypK
	aFWUdXLXspzQNphtUpnd2zZYYFPyERo=
X-Google-Smtp-Source: AK7set9vJ697IP+nk//T7zYy/ptm8U77xBsVVccpAs6bRffBH5FVq1IgULmOX0l6o0R/9SmLJ/2Ong==
X-Received: by 2002:ac2:52aa:0:b0:4dd:aefc:8777 with SMTP id r10-20020ac252aa000000b004ddaefc8777mr396583lfm.47.1677250122327;
        Fri, 24 Feb 2023 06:48:42 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH] xen/riscv: init bss section
Date: Fri, 24 Feb 2023 16:48:38 +0200
Message-Id: <134bf758ecd93deffc6623605a8c020a17f64be8.1677249688.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/setup.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 154bf3a0bc..593bb471a4 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -24,6 +24,18 @@ static void test_macros_from_bug_h(void)
     early_printk("WARN is most likely working\n");
 }
 
+static void __init init_bss(void)
+{
+    extern char __bss_start;
+    extern char __bss_end;
+    char *bss = &__bss_start;
+
+    while ( bss < &__bss_end ) {
+        *bss = 0;
+        bss++;
+    }
+}
+
 void __init noreturn start_xen(void)
 {
     /*
@@ -38,6 +50,8 @@ void __init noreturn start_xen(void)
 
     asm volatile( "mv %0, a1" : "=r" (dtb_base) );
 
+    init_bss();
+
     early_printk("Hello from C env\n");
 
     trap_init();
-- 
2.39.0


