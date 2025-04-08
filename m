Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69215A8112A
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 18:02:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942636.1341764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BOn-0005rb-LX; Tue, 08 Apr 2025 16:02:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942636.1341764; Tue, 08 Apr 2025 16:02:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BOn-0005pb-Is; Tue, 08 Apr 2025 16:02:05 +0000
Received: by outflank-mailman (input) for mailman id 942636;
 Tue, 08 Apr 2025 16:02:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f4Vq=W2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u2BKi-0004Yq-Lx
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 15:57:52 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33750f18-1492-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 17:57:41 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5e5cd420781so10291663a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 08:57:41 -0700 (PDT)
Received: from fedora.. (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac7c018556bsm929934566b.156.2025.04.08.08.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 08:57:39 -0700 (PDT)
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
X-Inumbo-ID: 33750f18-1492-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744127860; x=1744732660; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZAsqksh1fodEX+Vcn8RPi+5F0QUQHpwEMKTK4l1sxc=;
        b=Tls7KmjwAQ7huME5XNnPO1lMLGvFr0ICWe2M7P8DDhFpeVdZLvyTV/9MFTnzAetvnq
         nrjdSPCm+MpoZOn6yROgfy7jptHcNWAIRqgYI/RfzmHz+fGVNqf3yQ4Ac5FeK3rQO0zX
         6RDpwOAa4RLEY2cfG0/V6irUvmWKrbw6uDiWaTZe0jkQM3pA07ZKYgquMcsPX5aWpXvH
         6SOaEdqpJU4KWbXCDbHhI+jZScPxrg6GQttcUFdJsKRa91O0k3jDqgq1qPMuEV75U9Jn
         kVb6PdPnwQ6lLEL9J5XIO2/6VxU/M0C40780yoIpuVS4RuSYRl2wghqSRZouNeWty5sZ
         nH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744127860; x=1744732660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LZAsqksh1fodEX+Vcn8RPi+5F0QUQHpwEMKTK4l1sxc=;
        b=ZRkcYHClcd2/nDkm8i5lkgIOfxU30iMcgBw4QuGju2I9Yz4Whi/gu+gfSzeAZLoVd5
         NHVv4fxhku9cmV6ZBgy3sdvvrZXH77oKfiqa95bxDFES2GsLTchGTt8N8/r2q8QfaNdn
         +vJWNNJb32++zTOjUJsbo8RXIhgfrq3q1my1Rg0+daLoObzvcrP+Mx+CIoMiChNth2uh
         9XPjg3yTu1+mHEntHw0lVtI499n1d3op9UAh+flvayO3fE0sb6qGfVnnyGl5d7EIS8rY
         si+kKaWjFeoYJ4SAdZg7eBKr8GwhsvT1/2JPe6WWV6eH4KXTBtkdonbRTwJIABb8/9mG
         UTLw==
X-Gm-Message-State: AOJu0YwTc7d4sLyFogK9F9g4KzLLhs9QWpkE5YHHs/dOMmuY9z9PwMKw
	W+1Rs8DGX1YqN1FNVo4ZFz32rGIA5tuVkdnnHmrI3BlUCp7h1qx9jNQ7kw==
X-Gm-Gg: ASbGncs5dgw8MdD0JiQaDbBRrR57f6SecRv85itatsV9Y8iZmg4a0tkEayoPAZQCAes
	1WpV6VPJhMlpu6bvOH13AQUQ+5HYvrc1uZtL3s38gGD+k9iJW6NLkZAmCaTc6JEJp8N2SdAyFkJ
	MBNQKUXjCLCpCF3Qo0RQC6SQ4QTh/8g/K/8VficXCz/FrHZShaZI75QZmikWbxmU29XzLVY9C2d
	X4hzSV8QBPn5vUeOvr9rObAeJaH7gqmd4jkAGNQ7niCkByPPWJ0pym3auD3g74IvE8KS9ZMPM0s
	7ksS25f1mtxZasUKKlSAmJw6MjEUzwDtLyIicMuJzAV3yCrFmmqO5eLEuQ30JMZc1W+fHBs7HVU
	IZE18SN6tFVOE4Q==
X-Google-Smtp-Source: AGHT+IHb1nTpvqPPU3/cvk9fqYkrcWTiqLMA7eNx8KkR6zXwmdGxaSLHyc6G+tah5/nGnbkW6oRGfw==
X-Received: by 2002:a17:907:3ea2:b0:ac6:e327:8de7 with SMTP id a640c23a62f3a-ac7e762349amr1044801466b.42.1744127860194;
        Tue, 08 Apr 2025 08:57:40 -0700 (PDT)
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
Subject: [PATCH v1 14/14] xen/riscv: add basic UART support
Date: Tue,  8 Apr 2025 17:57:19 +0200
Message-ID: <3e96851da8751ac17cbf0cb5a649c0d86259460a.1744126720.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744126720.git.oleksii.kurochko@gmail.com>
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update Kconfig to select GENERIC_UART_INIT for basic UART init ( find a dt node
and call device specific device_init() ).

Drop `default n if RISCV` statement for config HAS_NS16550 as now ns16550 is
ready to be compiled and used by RISC-V.

Initialize a minimal amount of stuff to have UART and Xen console:
 - Initialize uart by calling uart_init().
 - Initialize Xen console by calling console_init_{pre,post}irq().
 - Initialize timer and its internal lists which are used by
   init_timer() which is called by ns16550_init_postirq(); otherwise
   "Unhandled exception: Store/AMO Page Fault" occurs.
 - Enable local interrupt to recieve an input from UART

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/Kconfig   |  1 +
 xen/arch/riscv/setup.c   | 16 ++++++++++++++++
 xen/drivers/char/Kconfig |  1 -
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index 27086cca9c..f5ba7a5a78 100644
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
index 9765bcbb08..b5fd660a4b 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -4,11 +4,16 @@
 #include <xen/bug.h>
 #include <xen/bootfdt.h>
 #include <xen/compile.h>
+#include <xen/console.h>
 #include <xen/device_tree.h>
 #include <xen/init.h>
 #include <xen/irq.h>
+#include <xen/keyhandler.h>
 #include <xen/mm.h>
+#include <xen/percpu.h>
+#include <xen/serial.h>
 #include <xen/shutdown.h>
+#include <xen/timer.h>
 #include <xen/vmap.h>
 #include <xen/xvmalloc.h>
 
@@ -73,6 +78,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     remove_identity_mapping();
 
+    percpu_init_areas();
+
     smp_clear_cpu_maps();
 
     set_processor_id(0);
@@ -136,8 +143,17 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
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
index e6e12bb413..01fa31fb2b 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -3,7 +3,6 @@ config GENERIC_UART_INIT
 
 config HAS_NS16550
 	bool "NS16550 UART driver" if ARM
-	default n if RISCV
 	default y
 	help
 	  This selects the 16550-series UART support. For most systems, say Y.
-- 
2.49.0


