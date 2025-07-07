Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1513DAFAF23
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 11:02:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035348.1407642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYhjl-00040A-7y; Mon, 07 Jul 2025 09:02:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035348.1407642; Mon, 07 Jul 2025 09:02:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYhjk-0003xz-W0; Mon, 07 Jul 2025 09:02:08 +0000
Received: by outflank-mailman (input) for mailman id 1035348;
 Mon, 07 Jul 2025 09:02:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ItPy=ZU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uYhjj-0002Us-4B
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 09:02:07 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e762611-5b11-11f0-a316-13f23c93f187;
 Mon, 07 Jul 2025 11:02:06 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ae401ebcbc4so449759966b.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Jul 2025 02:02:06 -0700 (PDT)
Received: from fedora (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3f6b04d30sm662892766b.133.2025.07.07.02.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 02:02:04 -0700 (PDT)
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
X-Inumbo-ID: 0e762611-5b11-11f0-a316-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751878926; x=1752483726; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KgFU41UimQ/zZbHUJpWhEqNY3tBNxulYXPtHv+ceHlQ=;
        b=KJqj19P9TwbEjKyoEO7rgzcsAnfpVULAjm7/0kmwV5UihEh1UXpI58PltHVycdIQOc
         nvk733oV/Luq0w+g56v0G/YHxfR5ohpzEZ2pTSQnPWl6lRrpWOkjmmcXXIQE0+tMln7u
         c5iH9/S4kmWh8fBm7WZH/Djb3gd5kZ6dGJB2/hcM31y1UgmCz43X9eVmUPGxz/29hszm
         W9yYFlWEqzfg9mmYx5+9lVywlBw4jEpd/ZwTtQ0YR9U3XyMDTKOzjmz+VU0O3BGiHuJx
         Vtq/BTA2tXv6uHREg2RIWvD8w9lnaF5sex1FeQaV3GLD47pWkeml3/BBH8fxCdfaO00i
         Wu1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751878926; x=1752483726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KgFU41UimQ/zZbHUJpWhEqNY3tBNxulYXPtHv+ceHlQ=;
        b=Nvq01sIunKuk9KTITDqDjNRzBv886GjbEjebSqfjklF0bX2VqtKgx358aFbznorqgH
         7RH7771m9ZjubzDS4ISY5ABQfnpcBLoCgjfwLQ691Y34B8TfxzCrBBeVC2wW1mUKTQck
         TxIAqn4c7DcPV/bnfOqIpPhIT6y5Zpjjwp1DIim2GIPtGSZWe8YfJIEc6649WdBWPwJJ
         Zt6YTDP0F/cEzXFy7MeH2m5fAvoWdNg+2czyGvH1K0YCQG5bgtgdt7h2wQ0KGxRXwXsS
         2sEjhnOFQ+zo+zqC85bABjZLrbATN2Tzqss53KEtlE3WR5wG7JeQvJAWP6acmrLdBbCS
         5U2Q==
X-Gm-Message-State: AOJu0YxDkXKVg+GoLLR3VoV2k2aNqqGQHwlAObQj7Qx6wK4kTny2D93G
	h/oEDMtVMTXaEI41bYuQDSowD+JRdOoRt7WLVdwTac/UzRrKnkvqDLkoKNJyuw==
X-Gm-Gg: ASbGnctu8nnszazJpRDfqL3qdb4veSgOEIOgdy7arjVcrNWEdrTlx+Bs1NQC90pc4MZ
	r1k7bTdI0ovHV+lA6pLEOzX2IVObjXMLT9URuXGPvnzoobTYXvfl4DWLxP3Diw15gUFeONCUYrl
	3WPMkL7GXUkYqB/q6vdiTYpVbC24roQZQoMcmTvobcdTxL6BHC1sics4C56SwCrvmtBla6qA6k4
	48tvEd//BYQOcuhybgnz01/e/EzYaBTLeXrYpHSYmOlTQJoJ+3kBVXAwHiwZhWzsAtCcqeXtpWI
	lUrGUY///DQOJp70XuguRheddd1jPwc3yYaFm4aLZ71L6XSruppcp0BDmrkzJrDWMoxvlCXpmC+
	U1oO27LUdP41lYM5JrI4FyiCP8Q==
X-Google-Smtp-Source: AGHT+IHI9D2VTZIG6GSmhmQ6N2OOyfKfRCCQz5e8giCisFysulvITfgZukuH5bZ7YfRAK+xBLwfBkQ==
X-Received: by 2002:a17:906:9fd2:b0:ae3:6ff6:1aad with SMTP id a640c23a62f3a-ae4108e5ee0mr708659466b.14.1751878925298;
        Mon, 07 Jul 2025 02:02:05 -0700 (PDT)
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
Subject: [PATCH v6 7/7] xen/riscv: add basic UART support
Date: Mon,  7 Jul 2025 11:01:43 +0200
Message-ID: <946f390b54c4ac9ce64860236565857d105da54e.1751876912.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <cover.1751876912.git.oleksii.kurochko@gmail.com>
References: <cover.1751876912.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update Kconfig to select GENERIC_UART_INIT for basic UART init ( find a dt node
and call device specific device_init() ).

Drop `default n if RISCV` statement for config HAS_NS16550 as now ns16550 is
ready to be compiled and used by RISC-V. Also, make the config user selectable
for everyone except X86.

Initialize a minimal amount of stuff to have UART and Xen console:
 - Initialize uart by calling uart_init().
 - Initialize Xen console by calling console_init_{pre,post}irq().
 - Initialize timer and its internal lists which are used by
   init_timer() which is called by ns16550_init_postirq(); otherwise
   "Unhandled exception: Store/AMO Page Fault" occurs.
 - Enable local interrupt to recieve an input from UART

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V4-V6:
 - Nothing changed. Only rebase.
---
Changes in v3:
 - Drop inclusion of <xen/percpu.h> as nothing in setup.c requires it.
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v2:
 - Drop #include <xen/keyhandler.h> in setup.c, isn't needed anymore.
 - Drop call of percpu_init_areas() as it was needed when I used polling
   mode for UART,  for this case percpu is used to receive serial port info:
     struct serial_port *port = this_cpu(poll_port);
   So percpu isn't really needed at the current development state.
 - Make HAS_NS16550 user selectable for everyone, except X86.
 - Update the commit message.
---
 xen/arch/riscv/Kconfig   |  1 +
 xen/arch/riscv/setup.c   | 12 ++++++++++++
 xen/drivers/char/Kconfig |  3 +--
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index 62c5b7ba34..96bef90751 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -2,6 +2,7 @@ config RISCV
 	def_bool y
 	select FUNCTION_ALIGNMENT_16B
 	select GENERIC_BUG_FRAME
+	select GENERIC_UART_INIT
 	select HAS_DEVICE_TREE
 	select HAS_PMAP
 	select HAS_UBSAN
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 0e7398159c..a17096bf02 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -4,12 +4,15 @@
 #include <xen/bug.h>
 #include <xen/bootfdt.h>
 #include <xen/compile.h>
+#include <xen/console.h>
 #include <xen/device_tree.h>
 #include <xen/init.h>
 #include <xen/irq.h>
 #include <xen/mm.h>
+#include <xen/serial.h>
 #include <xen/shutdown.h>
 #include <xen/smp.h>
+#include <xen/timer.h>
 #include <xen/vmap.h>
 #include <xen/xvmalloc.h>
 
@@ -134,8 +137,17 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     intc_preinit();
 
+    uart_init();
+    console_init_preirq();
+
     intc_init();
 
+    timer_init();
+
+    local_irq_enable();
+
+    console_init_postirq();
+
     printk("All set up\n");
 
     machine_halt();
diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
index e6e12bb413..8e49a52c73 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -2,8 +2,7 @@ config GENERIC_UART_INIT
 	bool
 
 config HAS_NS16550
-	bool "NS16550 UART driver" if ARM
-	default n if RISCV
+	bool "NS16550 UART driver" if !X86
 	default y
 	help
 	  This selects the 16550-series UART support. For most systems, say Y.
-- 
2.50.0


