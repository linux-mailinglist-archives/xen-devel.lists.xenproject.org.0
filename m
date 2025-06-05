Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F7CACF393
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 17:59:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007091.1386435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uND04-0000jD-E1; Thu, 05 Jun 2025 15:59:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007091.1386435; Thu, 05 Jun 2025 15:59:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uND04-0000cv-8W; Thu, 05 Jun 2025 15:59:28 +0000
Received: by outflank-mailman (input) for mailman id 1007091;
 Thu, 05 Jun 2025 15:59:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EkoY=YU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uND02-00071f-KL
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 15:59:26 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d686ab8-4226-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 17:59:25 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-60179d8e65fso2083841a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 08:59:25 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60566c2aba9sm10443034a12.2.2025.06.05.08.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 08:59:23 -0700 (PDT)
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
X-Inumbo-ID: 0d686ab8-4226-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749139164; x=1749743964; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wo4QtKZfWoJ+7BBnjSqXsA3jxl9wi6iGfitcuuiEYpg=;
        b=H1nSa0P1o93KiPRp8C0eES6wRkabdquqAs00cVOrP3OM0CZIHtSRkUNLJ5v9eEp1Gy
         NXImbg66ufEAdweSAzsEb3d83JrLDPFMP9iEyvWeu+YBU8rwX0yJySHsp3esYp9ZHQS/
         4kvlcsrzIzgu4f7uJ5OO2fB2HVJ87gpj43Qs7yJJgW6mUawndnox2AV4m/0GdJUVuZNf
         8+cS3fnGsyPdFa0yWoCEH1O1ZwL78fQWexhBtBKWdkJ8ifo32AZZXzyOpq6jwE9oN77P
         uCNhhA/VOugf6lNcIj7/r4abW8KD7V2IjoFIe2Qy+NvBvYo9z4EL8Bt8HgyHag+BJq8c
         lHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749139164; x=1749743964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wo4QtKZfWoJ+7BBnjSqXsA3jxl9wi6iGfitcuuiEYpg=;
        b=gIAIQTJrb95wh6C94aLb6MI5JxfQl9xvy+44xZXMwHGoMz7671kG8TvUa/074jIQEe
         +zKKlxjbNFzJsvj4qAEBfT3wKrNKCBRCQCns/n1iozv2CTDJrW0pUyV4vfhcNx45m9G8
         jKGw0vCnjtU6L8oq7mgzxdq+8IWIg9qozE8CAxKLkrjqu9iNz5GCRTqms81T0kZCQAeX
         ED2WFgvEj9mMKzWMh/EvzvOtNmK5HjJSE3EPfuorRiaHtnfT39HPgYdwQIhYFX7hV+KG
         m/EjM4/poW55GLxBWpr9H55Z7kF9UMSmvPdbVT6c17XLYMw9elz4XTc3eYKBjo5v1nfv
         OVKQ==
X-Gm-Message-State: AOJu0Yw2e0aaZ4RZzo/GWWp8Cv5NN6v15+vTMCGEudCqKEeXNrpDskvp
	5BsAEq32KsvyilXFsk8eDV7t7VtyCIFajZYlUBdn7DxAmwQGtOdgaB8/Nc/o+A==
X-Gm-Gg: ASbGnct/PGOigiB6KaS7JfX+QbMfQGWGQbUB1OVp0W6RLMALD+uo5GfqxD4rENivCMT
	hJCDfL/caIxIAvGvuZOvnhZGUU3OTUwYN+UT3GGy272ECLyrPlfpEFLRZF+aqbNcgOsNQSgsr2p
	uQ+fRodBtzJKEplklsgp9Xgv+h3+l0ctDlEjM3++tAP460vbIMWoUJetF9l/l9QH4qk6rpG30M/
	B2dXZcXRPLCn/Z2BnNE2NsdXLcKMfB3d+w7wy+l4/+ZSLaymwFfLNqG787e4MWD12ahe8TvuCi/
	2OC9OdSB0Y9UbdSK+Qp6crzx4pZQVNvnW2g2mtU1M3X6G724G+uREMtySkp2VHaaVvFm9ZTM1it
	BtuHD/b0+gyLSYisdsQ==
X-Google-Smtp-Source: AGHT+IHbvQkyjn3zbunZCFPyGEGBZEEKvOH0onRaiUVW35EdMdhPS1zgTJRFvAsmyfKFaILhQlB1mg==
X-Received: by 2002:a05:6402:d08:b0:605:a076:b3bc with SMTP id 4fb4d7f45d1cf-606ea182266mr7661429a12.28.1749139164248;
        Thu, 05 Jun 2025 08:59:24 -0700 (PDT)
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
Subject: [PATCH v4 9/9] xen/riscv: add basic UART support
Date: Thu,  5 Jun 2025 17:59:05 +0200
Message-ID: <0b12815140e424fd019d57955073df3e11c5ea92.1749121437.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749121437.git.oleksii.kurochko@gmail.com>
References: <cover.1749121437.git.oleksii.kurochko@gmail.com>
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
Changes in V4:
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


