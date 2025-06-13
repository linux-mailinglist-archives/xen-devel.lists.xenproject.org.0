Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D77AD91DF
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 17:49:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014638.1392818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ6eX-0000sc-8X; Fri, 13 Jun 2025 15:49:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014638.1392818; Fri, 13 Jun 2025 15:49:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ6eW-0000op-SN; Fri, 13 Jun 2025 15:49:12 +0000
Received: by outflank-mailman (input) for mailman id 1014638;
 Fri, 13 Jun 2025 15:49:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=44KY=Y4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uQ6eU-0006cn-Mu
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 15:49:10 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f16b4efe-486d-11f0-b894-0df219b8e170;
 Fri, 13 Jun 2025 17:49:08 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ad56cbc7b07so333047666b.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Jun 2025 08:49:08 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adec8979563sm144821766b.158.2025.06.13.08.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 08:49:07 -0700 (PDT)
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
X-Inumbo-ID: f16b4efe-486d-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749829748; x=1750434548; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c5Lkbfnvd1QCDHpROG9OH/otgdh2NEdBGe+vvJ9B82I=;
        b=RH39gf91ScptKdVXhMs/cSuMdSwsZjaeuaUhGzFbiVftV7BgncT20yBp3BQNsLTV5T
         oRB5FaGf5RM+PstmdZu4X4umrReWdL68TlrkwBb4XdiTu9HibJ/Y+qZdixOu5/CbKmDu
         HGmkBIYugV4OcivTzKZbYMGrikwEKzsO3doKIdgU3g2p1vMRMcWeTIKZRR7Y7j6QQtAj
         rw95i13NQjps+HFV0TFMEgbfhI/FgFzJrPeU+0yFZ/llqixf9zVr4pyig+oMq/w2w1Kn
         Hb4+j/3Efh2D6ITjHNPaFrCq0bGCJhmz+MzYuefs7jURxVL6gFZnwreILaLw+sVZaS9J
         q/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749829748; x=1750434548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c5Lkbfnvd1QCDHpROG9OH/otgdh2NEdBGe+vvJ9B82I=;
        b=H5oFYSMCN9jAyJd+0aefTEOW+YxjbJ7zid6/NoWusHNQm7odcDwJsw2/RQikCnMjA3
         z38RGXKsA3Cy/QHJM9HKXULApT/KXmUeJ5Xs/4LGtorBIsEvdI89OmZV+ad3m5lhFuyV
         K79p9cFa+Q32tX3W+0TdNfuCO1p2MYcY4SoA3oXrmqba5nKb7PQ514eeAS51/a10gVV2
         NSM3xbNrSq31dZYNGuIh/kwOdcJ0PCLjALL5yUy5PLjDvk8xna/8uKCmc4jiBVYfbJlN
         qxpqikfz2qosOGRp5Lu0JTm4VqoXcItLhIwNLYgJeh+ZxkknHeLutswcPaXy/K+Zyr06
         i5lg==
X-Gm-Message-State: AOJu0Yx12Z+FCJIV8H95UXIyliU5o5OEbqYhjdEC2hJTfE23KFYDm/ZU
	Kj0XIg0jcWhOSm01mour1ktjrJyAQOkXrCYLGVb69o56bX7kFj4ARIfSaMkvMg==
X-Gm-Gg: ASbGncs26o/xLEv1pbCE+oBNpOljwMCF5YoLoZtsL87+0Lz38ciqKWimlwkNs+E130k
	hidDJ5jOEjpaJMFrHjZiUCWs5p9pCnNb03v2jbkhiRVbLFadM3W9Kg1Lfba5qvGf6kBA37Q2xPb
	YWCsPRmOxUFaxMChhJ7ZFQg+iY1SOmqvDVMFuuklZVjhNn8NJ4u+5s6zc8uIbHCbwqLosRAbN2O
	pMF4JhXXvatVBm5eizfGXYh613ebsp1A6UohQ2ywNgZogHmV/xDjtnfWQLZNw0Ybflm4Oe+9r1j
	Ga/lNqdZVmQYkbBKVQgtaARhTMli1w56UN5OAOR1+G21IjB+1bHxsRBeuzBruY1e/jXIwW4KvaI
	QoBHCIxeyo6jV3qNELyZLUs/qMnhZ
X-Google-Smtp-Source: AGHT+IF4HdQ4K6/e1c/Kjg77Lf3UA4pI1sMICe8tX4U+SECyg2QF9kkXnhTQ5AC2l5A/KM2+pPXYzg==
X-Received: by 2002:a17:906:c106:b0:add:ee2c:7313 with SMTP id a640c23a62f3a-adec55a7a66mr346620266b.22.1749829747753;
        Fri, 13 Jun 2025 08:49:07 -0700 (PDT)
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
Subject: [PATCH v5 9/9] xen/riscv: add basic UART support
Date: Fri, 13 Jun 2025 17:48:48 +0200
Message-ID: <f35759006bbf1d72bd3c889b50cd064891c83a3f.1749825782.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749825782.git.oleksii.kurochko@gmail.com>
References: <cover.1749825782.git.oleksii.kurochko@gmail.com>
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
Changes in V4-V5:
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
2.49.0


