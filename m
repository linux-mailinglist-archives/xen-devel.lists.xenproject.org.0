Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A991ABFAA8
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 18:04:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992154.1376049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHlvV-000808-U4; Wed, 21 May 2025 16:04:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992154.1376049; Wed, 21 May 2025 16:04:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHlvV-0007uS-IT; Wed, 21 May 2025 16:04:17 +0000
Received: by outflank-mailman (input) for mailman id 992154;
 Wed, 21 May 2025 16:04:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hkAn=YF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uHlvT-0004Wm-Qp
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 16:04:15 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d702837-365d-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 18:04:14 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-601fb2b7884so5505590a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 09:04:14 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6004d502736sm9152513a12.25.2025.05.21.09.04.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 09:04:12 -0700 (PDT)
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
X-Inumbo-ID: 3d702837-365d-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747843453; x=1748448253; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mnu64s57ZUL2GkbK8NSRVCu3wg1knPSgvCDSoN2TG7w=;
        b=c2ulDGUUJYxEIQfBuZbMGM5qTI6rinRZ49vUQOYujNqN9UQ1Yft+Nt0+Fs7C8wLJL7
         d5ojoStVSqj08RS2QDpumvrBhEOcIcYR0CtC6eXfZJmDCipvk3H/dL+MKNfFyUKw6eOg
         u6Hp3VJtWfuokr7wE3K+yM9boAeGbJKTn+i222HiISw0y5TzFZNoNnd3YPOXEX/DYw77
         U6hSLW2EaVxp3QhwYlEWWaWkXhbD3dBx8w2ySkue1sj+4RKbucn0xL4IUUyhzynYAz6d
         YpRA5C6aVWgsI9ABDviWgIeDQ/CYMyppCFXhP0CyiMgGDbG/OTj8wCQ5/esJo9/4QBiL
         dtpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747843453; x=1748448253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mnu64s57ZUL2GkbK8NSRVCu3wg1knPSgvCDSoN2TG7w=;
        b=g2AeBNyWrC6sbz+HN6/KUknMrpPnRAiZRRTi5Q9xOqMhtCro6UsayVBrA7B3QQF6Qv
         0AYwLwqpLMD0+2NEEM0h+zHh83PP4uqBMhkjc2eFLJ0+Nby4FO7bLWMMFYjvIWE6xTdh
         6Zs9SKGz/h988SN10kMbR6KRNkeYctvPT5Lyjex93nSVHN9KteRI1VDlaK3VJvEVbNb9
         zl/2TR0/mS3ANXj1p/A+a+wPZAju7Czm04wwtz5WMqZ6E6lDO41SxBYhX974UR/juFDj
         V0sX7vH8u+oskgd+bE1T83MwO+pfzvjn+kuSY25yCosRGNE2kGVteOrtK7kxzt5fimuo
         m/cQ==
X-Gm-Message-State: AOJu0YxwYViVCW6ar9kGKD42ruqfmURTYPNTixGTG23K68oWAk2tXC4n
	0KNWoJMvEaxL5iLaIWsI3JnRBxHmZMHXNuhq13LMa2QhKWHMmVa0Lv7cTJOYpA==
X-Gm-Gg: ASbGncu2H5JxSG76Zi5ZilX/k3K2FhSzm2pl69VIxbh3a05ys7cjBFpxcTlWqDtHyq7
	JrGq00MXb6Aewp3CtsmFAKUz2MP5qoOQPE7HYdEz8iJ+5EBRPDLcurM4tXOuqx9+3ZBn/FUGWzJ
	YmcZNAWB8VYaTsbNILL6EQX6styYOP8Gq6Rn0F8PiXiFjHDGTq1v5KLPtRj4oCCmWa3Cp8NLzGa
	ZKSBZaoZuAPVXseEIhBBxXsnVpopsRBkwm0Uc3KxHT9Ox1CWsUkgX2Q+VMIS4PoQZ40vr17HFf3
	z+9GF/M0Y6q2/eu/EfX8ZYrqdaYnN49hkaQ2U/azvbv9pl0rQYB/ArN32WotsXqNnL22hbCsSky
	s8NCHedJzye93Zxsdjw==
X-Google-Smtp-Source: AGHT+IGunMgZiri1Ev5kZ3w9ZTII3G+8c7DPfjfcl25jVSc2uIWoNuARjTbhoI0T2M9oflC+5lXPDg==
X-Received: by 2002:a17:907:7da2:b0:ad2:2ef3:cc1b with SMTP id a640c23a62f3a-ad536b7bd28mr1899159666b.7.1747843453074;
        Wed, 21 May 2025 09:04:13 -0700 (PDT)
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
Subject: [PATCH v3 14/14] xen/riscv: add basic UART support
Date: Wed, 21 May 2025 18:03:54 +0200
Message-ID: <f7d28a334bf49abb7eb996516128b46aecf83332.1747843009.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747843009.git.oleksii.kurochko@gmail.com>
References: <cover.1747843009.git.oleksii.kurochko@gmail.com>
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
2.49.0


