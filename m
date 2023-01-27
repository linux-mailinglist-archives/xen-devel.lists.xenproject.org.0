Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 891A067E7A9
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 15:00:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485601.753035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLPGs-0004Nv-JR; Fri, 27 Jan 2023 14:00:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485601.753035; Fri, 27 Jan 2023 14:00:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLPGr-00042z-H2; Fri, 27 Jan 2023 14:00:01 +0000
Received: by outflank-mailman (input) for mailman id 485601;
 Fri, 27 Jan 2023 13:59:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhsa=5Y=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pLPGn-0000nM-Ox
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 13:59:57 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1820c02-9e4a-11ed-a5d9-ddcf98b90cbd;
 Fri, 27 Jan 2023 14:59:56 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso3520823wms.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Jan 2023 05:59:56 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 d3-20020adfe2c3000000b002bc7fcf08ddsm3971131wrj.103.2023.01.27.05.59.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 05:59:55 -0800 (PST)
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
X-Inumbo-ID: e1820c02-9e4a-11ed-a5d9-ddcf98b90cbd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RDMQ8RB6nJcd+xIpijr05fcryAe7A9XA8ZLTs2OE2HE=;
        b=PugMAfdOadAlmmcj8qeXA+PcxuDOPjDKT5csS7cPXEkUocMxtv3AZsPa6djzMsBpV5
         UqqHUoFGee7QiEP+Vkl8oSJB6Ilm2Kf00SqS4QDU10v76sAlhHHOhxMdcmKr9iCCSJWt
         Lyfb3lYbr6AJlHMPCvjN/K0dsptHNTRFFCM9paNT9M1g1L2Zwc8V35dsVkl4eYAh0KDN
         1o0QfiDzycxjH6DHhlo7Kq+rhxarzXotgt2viBsS6lHYutrTCW5sEXBBoQnLZb6gI7+J
         wNX5HnhRGKJuA4817glxddGNrzXCLEY06muwYTdBIX06GuVozRM9ykVo7SkdJ63xYjQ9
         LhWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RDMQ8RB6nJcd+xIpijr05fcryAe7A9XA8ZLTs2OE2HE=;
        b=bn/tiaZEkYKqczsWUoTJM+zFEhDOCevSyjfynf2H8D5GPF/x7vTJgSMU7BVMISSZqO
         yjuIRDtfJAkz9FxlaiJy3ZNLJD71Y7cK+knPiAwhgyfLGmDwXmATIGxK0nrYHqXWGHGN
         nqCfiUuMhM/3vfitblZiDLai01bQJm912U/a3fGOgiGQqGIGxPArA/sK1/zQw+p0mW+g
         LAlOvaD9wSVv8k6znHwljDbq9w6EUo3UY6TuHXai6NxYmHXfe7zBCsNQ/9mdUiEqPCx9
         BYjFHGztkQMoHEap7auspCrFc/igwQAtAJ4GO+Yv/eoaAvfIJooLGy6NWxX5gq3OO4SN
         W9HQ==
X-Gm-Message-State: AFqh2kqVuE+jMqZ163F9Ey+i2uLJt3nO9jsiGSSSS/BW+UhSkbv7xQM0
	up3rX/TwYKj0+Pb9KjlHBIl9K1OZjVU=
X-Google-Smtp-Source: AMrXdXv+Sa7lY2kFw50zQcdLDMmYCqQJzqfDGIf5ZH/cKKOFISRt08tj/w3TtSDErq2tpNVgzBclaQ==
X-Received: by 2002:a7b:c5c4:0:b0:3d7:889:7496 with SMTP id n4-20020a7bc5c4000000b003d708897496mr38257070wmk.17.1674827996126;
        Fri, 27 Jan 2023 05:59:56 -0800 (PST)
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
Subject: [PATCH v2 13/14] xen/riscv: test basic handling stuff
Date: Fri, 27 Jan 2023 15:59:18 +0200
Message-Id: <edd820f874e63328203356b3fbd6feacd742e231.1674818705.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1674818705.git.oleksii.kurochko@gmail.com>
References: <cover.1674818705.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
  - Nothing changed
---
 xen/arch/riscv/setup.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index c8513ca4f8..bcff680fb5 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -1,6 +1,7 @@
 #include <xen/compile.h>
 #include <xen/init.h>
 
+#include <asm/bug.h>
 #include <asm/csr.h>
 #include <asm/early_printk.h>
 #include <asm/traps.h>
@@ -9,12 +10,28 @@
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


