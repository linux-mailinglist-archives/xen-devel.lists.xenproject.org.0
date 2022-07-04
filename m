Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9883564E91
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 09:22:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.359871.589130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8GPx-0000dU-SK; Mon, 04 Jul 2022 07:22:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 359871.589130; Mon, 04 Jul 2022 07:22:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8GPx-0000aG-Oq; Mon, 04 Jul 2022 07:22:49 +0000
Received: by outflank-mailman (input) for mailman id 359871;
 Mon, 04 Jul 2022 07:22:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/4n6=XJ=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o8GPv-0000a7-Kb
 for xen-devel@lists.xenproject.org; Mon, 04 Jul 2022 07:22:47 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19c7d9e2-fb6a-11ec-a8e4-439420d8e422;
 Mon, 04 Jul 2022 09:22:46 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id mf9so15228619ejb.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Jul 2022 00:22:46 -0700 (PDT)
Received: from uni.. (adsl-146.37.6.170.tellas.gr. [37.6.170.146])
 by smtp.googlemail.com with ESMTPSA id
 fx24-20020a170906b75800b006fec63e564bsm13683384ejb.30.2022.07.04.00.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 00:22:45 -0700 (PDT)
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
X-Inumbo-ID: 19c7d9e2-fb6a-11ec-a8e4-439420d8e422
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W7YDdS7cjUx0VeNQiCyXscCuJSurWL9ZQnO4IEhpQWM=;
        b=c0V7/j4xE13urslFTKrUYRpl8SvXaK1EbAWXNgPfKKCdn1m3CqrIRNku+IP1yNgx7B
         Cnvcy8VyFNVIs1OwXLmMhouxonJzAIqi4f8p4xILinf3cAC/T6hPcwhYWZ8i21IkGtLK
         /9gSbhJPEF5eDQgkW/4qNt+AvEGsNxXxlcjByq+qZKlHmft6OoCwWd6sfushcGFs2esH
         LxKsPOpqQAIp1W8bNa2yeg8+zJcKfj3m/+/ASlSzz3WnfUXu5S0pagvsrYMydJ25LHyB
         +6/YPrB3cjidR1x2dYI0PlrIpz+eQBUs8IyPTn9yQQneMimVCSJygKMOISIkiXKoU8pm
         D82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W7YDdS7cjUx0VeNQiCyXscCuJSurWL9ZQnO4IEhpQWM=;
        b=dQXDDW5M2ZwOcgBX3mcdiF7lfYk7tIHV8y7kJf0W4ahc93/pKJJClNaX+j6OVDtEpE
         CtdA4yaanOCXjZhlxQPp58nJILG4Y7zo9do8B79Os40yzkE07QpDvCCJrM2FaCG+tPc3
         Slntw39Gbhl/nj9hnLbyc4FVIggh1Ah54O1FNVmeJ1L/HwyfK5FJU6AH2vugZNhX5WJ+
         0sKxxYP455CPKjr/UOyd9TzrnSqxX6vdBo7fxB/vE+OFEUBoNNL9/g2yracORAK9iRbp
         EbXxz6L3K03jAcDDrgvCqE/AHFlWkyhAdJww0b/IgX0fcOTLXplPC1RuFo5LEmCtWd5l
         DSjA==
X-Gm-Message-State: AJIora9OyI4UxuSVmHYs2fviTwPnC1RyavtHSdccYEjXvXS/GcJ0iL4S
	WIdt3vQ0iLThHkwgkVXDadcnRkfWZxg=
X-Google-Smtp-Source: AGRyM1u+xmxnIHVyHN3+BKTKgxlcsrJOr6Br6d0UvVKoxZZWhnT7b4ReL796HzG/D26Hgdi1HwvfJw==
X-Received: by 2002:a17:906:5a69:b0:72a:666d:822d with SMTP id my41-20020a1709065a6900b0072a666d822dmr21068761ejc.290.1656919365460;
        Mon, 04 Jul 2022 00:22:45 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: traps: fix MISRA C 2012 Rule 8.7 violation
Date: Mon,  4 Jul 2022 10:22:32 +0300
Message-Id: <20220704072232.117517-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The functions show_registers() and show_stack() are referenced only in traps.c.
Change their linkage from external to internal by adding the storage-class
specifier static to their definitions and by removing show_registers() from
asm/processor.h header file.

Also, this patch resolves a MISRA C 2012 Rule 8.4 violation warning about the
function show_stack().

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
I am not 100% sure about this patch.
I think show_stack() should be declared the same way as show_registers().
So either both of them will be declared with external linkage or both of them
will be declared with internal linkage.
I decided to declare both of them static because they are referenced only in
traps.c but I could have, also, add the declaration of show_stack() in
asm/processor.h header instead. Rule 8.7 is advisory.

 xen/arch/arm/include/asm/processor.h | 1 -
 xen/arch/arm/traps.c                 | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index 4188ec6bfb..75c680ae9a 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -558,7 +558,6 @@ extern register_t __cpu_logical_map[];
 void panic_PAR(uint64_t par);
 
 void show_execution_state(const struct cpu_user_regs *regs);
-void show_registers(const struct cpu_user_regs *regs);
 //#define dump_execution_state() run_in_exception_handler(show_execution_state)
 #define dump_execution_state() WARN()
 
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 785f2121d1..9398ceeed5 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -931,7 +931,7 @@ static void _show_registers(const struct cpu_user_regs *regs,
     printk("\n");
 }
 
-void show_registers(const struct cpu_user_regs *regs)
+static void show_registers(const struct cpu_user_regs *regs)
 {
     struct reg_ctxt ctxt;
     ctxt.sctlr_el1 = READ_SYSREG(SCTLR_EL1);
@@ -1146,7 +1146,7 @@ static void show_trace(const struct cpu_user_regs *regs)
     printk("\n");
 }
 
-void show_stack(const struct cpu_user_regs *regs)
+static void show_stack(const struct cpu_user_regs *regs)
 {
     register_t *stack = STACK_BEFORE_EXCEPTION(regs), addr;
     int i;
-- 
2.34.1


