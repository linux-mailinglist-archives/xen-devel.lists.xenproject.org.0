Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DF1AACB8E
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 18:52:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977636.1364695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLWi-0000P7-QH; Tue, 06 May 2025 16:52:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977636.1364695; Tue, 06 May 2025 16:52:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLWi-0000Lz-Jm; Tue, 06 May 2025 16:52:16 +0000
Received: by outflank-mailman (input) for mailman id 977636;
 Tue, 06 May 2025 16:52:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/GUx=XW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uCLWg-0005Fd-94
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 16:52:14 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74df34d6-2a9a-11f0-9ffb-bf95429c2676;
 Tue, 06 May 2025 18:52:12 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ac29fd22163so984598966b.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 09:52:12 -0700 (PDT)
Received: from fedora.. (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1891a3cb9sm740295366b.60.2025.05.06.09.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 09:52:11 -0700 (PDT)
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
X-Inumbo-ID: 74df34d6-2a9a-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746550332; x=1747155132; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jcNpMhCfyvA/6mSR/+djGto9U0zKi73zc12A/lkWF+Q=;
        b=lqzKfps9AKcTYZvT507iJOWZrd0H5Q4anncLOxKgcHS/p09QtBSIgwdxxwhGJ9fLfh
         wTlZq0oODHuLCmCTh6taq+4Tesb8GNYsF0qkxDiYwvCl6K/4BBDowAsUj8H/0Rp4ygV0
         LeCKZHEsf/Z7s0gc7IK9eDpXE8sSwzA8xx4urHN3+jjMiw9Gid69nZ8+hg++MBtASJzK
         EEqNVo/qtIPnH/hcfBuO2BWqTRTT5fAt/uBCcQDEPiku34jUOO/RjVXd18uiQGF+l5Tp
         A0M43HUuKbjOzySrqg4NiBLcAFxPug+VyFDc1Buv9lVnNULHXIzJX10DI+Rp7mYRTk7N
         4U0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746550332; x=1747155132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jcNpMhCfyvA/6mSR/+djGto9U0zKi73zc12A/lkWF+Q=;
        b=Yz8Vl5gR/HWHvhl+Wnnd2yQpYiUuj/HDsBQtcmH24R94ykrSG0f+N6fbrLsZzhNY4n
         OxaZ5gZcNjtqfGVAaqXu4eqYq3WBGFRVDFAKscuJI62oOZjpGl1MhvVSs1uqoQmMDeGW
         nLw438V/w8gIkeMeHTt4wK1i5DS7Rg2lAA4kNt/x9oTdsD4z1hdaXT1/S6/PAIUjdF17
         atwd+NTzsR5aVPBdYF7J9cYkNGomoiUlmh9FAlpLsqSV5OPCkuUnLYRJEf5uRYsMTuro
         5KKDI+8h07l5I0MrZaaWwqNvdbnDrftnPSdbdeEej8Vmlp00wr4eGOqLeTnhX7fzSDx6
         ilIw==
X-Gm-Message-State: AOJu0Yway623y1y+FNDAzCJYvR061Eq35HMxfGnLzgXN8c4KLL3eae//
	vFjqv9SWCK1FIE/V+6fAm8w/J38hxchqwqg7p/YAMUnqNOwUtc5WCe+wdw==
X-Gm-Gg: ASbGncuUFpIHcExT4ChNDV7uhE3BAvbA/1CvavhPNv36sC7b+pQb8eCYg5vgvQbLZlF
	negv0JfLLgx7thueIjoDectnmq5jaK2hQj6ryIn3jxcf6GzlwqAeZ0VbXkPrugxStSbp52gqDmK
	7gZJ7x25wiMODs50sMuLBxAQWPP646KEN1f+4gyCS6z6wrEFkPHzujMvzfO/WavEEKEvNs8GLD9
	KiY3saXhE6d+HNdvdPODDxlvHN28OWuDm3cNRx1IBXn2J5+a8eL8U3upNx+IZh7IAuu/Dn1svVA
	viargDEfx/Ys47DY7b9d7ivxu0WiRalKxEzToGLVrXaQi+9rYAEtyiF+mAUVTkg8nq3WbAqTvy0
	wwfhqT+re6g==
X-Google-Smtp-Source: AGHT+IFkxZQBdm9KBB1ZRaoupbLDFikCeyhEmwO7U7RC83JUMy9/iq0OKe0PRmNhijjDxsKR0eAo8w==
X-Received: by 2002:a17:907:7b8d:b0:aca:d6f2:c39e with SMTP id a640c23a62f3a-ad1e8c14806mr16022866b.23.1746550331503;
        Tue, 06 May 2025 09:52:11 -0700 (PDT)
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
Subject: [PATCH v2 16/16] xen/riscv: add basic UART support
Date: Tue,  6 May 2025 18:51:46 +0200
Message-ID: <9fbcd17751fb0b7925d622631acb0030ee110465.1746530883.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746530883.git.oleksii.kurochko@gmail.com>
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/setup.c   | 13 +++++++++++++
 xen/drivers/char/Kconfig |  3 +--
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index 60520dab57..eb44318dda 100644
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
index 4f92266224..5c7cd568f0 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -4,12 +4,16 @@
 #include <xen/bug.h>
 #include <xen/bootfdt.h>
 #include <xen/compile.h>
+#include <xen/console.h>
 #include <xen/device_tree.h>
 #include <xen/init.h>
 #include <xen/irq.h>
 #include <xen/mm.h>
+#include <xen/percpu.h>
+#include <xen/serial.h>
 #include <xen/shutdown.h>
 #include <xen/smp.h>
+#include <xen/timer.h>
 #include <xen/vmap.h>
 #include <xen/xvmalloc.h>
 
@@ -136,8 +140,17 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
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


