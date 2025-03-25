Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DF2A7084B
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 18:37:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926816.1329655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx8D6-0000XT-K1; Tue, 25 Mar 2025 17:37:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926816.1329655; Tue, 25 Mar 2025 17:37:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx8D6-0000TF-Fb; Tue, 25 Mar 2025 17:37:08 +0000
Received: by outflank-mailman (input) for mailman id 926816;
 Tue, 25 Mar 2025 17:37:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ogJ6=WM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tx8D4-0000Qy-Jv
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 17:37:06 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c437c017-099f-11f0-9ffa-bf95429c2676;
 Tue, 25 Mar 2025 18:37:04 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ab78e6edb99so827638466b.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 10:37:04 -0700 (PDT)
Received: from fedora.. (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3efb65871sm897012066b.96.2025.03.25.10.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 10:37:03 -0700 (PDT)
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
X-Inumbo-ID: c437c017-099f-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742924224; x=1743529024; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QR7+GAKTCGt2cIHaB5tu0WA4vzMonRrbNIvlE9oHS8Q=;
        b=Gp6vH+P1idT6uIc2E/6+6PzWW5hRizHcMJ3I2iDUJ7RlonTJ5MINh2qbzkkK13pNDa
         8Y76BJHIc8BRo1mxeun7IOHeTzKj/wMxN0XN7S+ie4qD7tSCh5BAnNuk0/YceWv7Uzit
         8pEwirSyEyV/fdK5daAQ4eKzaSxauojH1NVwZaQVnuUdxwTImN5yY7/t6WrA7T3YctlJ
         haz5RFy6u5QP8spQd3oxWxhwNMWpgX+TtL6sUpOsHuHVkariRGdYwAVydlI/RP+xuXM8
         mjhx7qZMBVOYtMF8svRNMZPvUwDUcrfBN4T2P4qBNT5mmvJFvtSM4M5xO9kCbcR7G3QJ
         G6lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742924224; x=1743529024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QR7+GAKTCGt2cIHaB5tu0WA4vzMonRrbNIvlE9oHS8Q=;
        b=oofa2FOzGZxq/xWSySzQ2aRVL//s9Rw0YN4SZLeIX90YcP/usv3V0W/hNjc41YZuCH
         U0HU3Ke7S8ADI6OLNQnv2JaIUyQNLJh7nIU02GMa085guxKhMKdCOlMBUanaXiHu+n2c
         ABkrtA3T1Agwisvei2RTIqwNiH8mx1ZXwHuS6NYsmrzehkyLkykwsY0ej2sYyndkmAWL
         x9QY5kCYD59Urgx+kgsEnj/ULgoioNtBh+FZpTPIjuifznQTdeySP9Vcsb/TO69QZfp+
         r4Wz7M8pTKWKcKWBpyCdswzsQ3bhuR22vi4B5hNgQeGOG/VBFHk63PeD66vS0LSIUjKe
         MLbw==
X-Gm-Message-State: AOJu0YxKUAG2CL4U4anRQ9v6EH69XUVbIfOkzP8iF49sKfqGHR/BVxKX
	WQJCRSCEuamFBpdR9HN8MZZrVeqtt7lUwxQ5Wsb/Gs861EJ9PoL0kAEYdA==
X-Gm-Gg: ASbGncvWNqt/+O4Z2tWjzJLXWvdszdDLu39C9MQC5BVLtZP313W2/+bJdy4nz9brAyO
	WZGclrQEXhlAUUaGF7LS7RcoN1qHaYSNRCr3aFp8+/aFvVJ7T0UaPAbSdVYM2g5EJHCtc3m22LP
	iFzISWWwGeodsseeuEStawUGNQR636oKGwJz48738QPrtL13XmfyqBeGw9QHCTbzYHOjxtNtn8Q
	2CHBB8b+UYZNfVc19kei+42G6mXPJ0WDIHQKtTRZUrvaCgG4Iot+eQwTtnLASbKcD7CX4bver2s
	M0lfH57dCboHsVOoy+5Nh03MUJ1Lw/kpKJ9Kps2DuhugpYm9r25fNCrpi/64Z0lPu84AxdMDSTz
	jXey5pzYv1a5JpA==
X-Google-Smtp-Source: AGHT+IFrWi2J62SBU4NhjXKaVMyZEbFAZF4IjReGH1PkjB08zPaGIyFznpofCfAziu3+uuf3ln3qgg==
X-Received: by 2002:a17:907:6e87:b0:abf:4708:8644 with SMTP id a640c23a62f3a-ac3f2458dc1mr1637252466b.43.1742924223535;
        Tue, 25 Mar 2025 10:37:03 -0700 (PDT)
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
Subject: [PATCH v2 1/4] xen/riscv: introduce preinit_xen_time()
Date: Tue, 25 Mar 2025 18:36:57 +0100
Message-ID: <1a04711f46a1c0a7cdf709abc37f143747215495.1742918184.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

preinit_xen_time() does two things:
1. Parse timebase-frequency properpy of /cpus node to initialize
   cpu_khz variable.
2. Initialize xen_start_clock_cycles with the current time counter
   value.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - Update SPDX tag for time.c
 - s/read_mostly/__ro_after_init for boot_count variable.
 - Add declaration of boot_count to asm/time.h.
 - Rename boot_count to xen_start_clock_cycles.
 - Stray double blank in the defintion of timer_ids.
 - s/u32/uint32_t.
 - Drop full stop.
 - Update the commit message.
 - s/__initconst/__initconstrel for timer_ids[].
---
 xen/arch/riscv/Makefile           |  1 +
 xen/arch/riscv/include/asm/time.h |  5 ++++
 xen/arch/riscv/setup.c            |  2 ++
 xen/arch/riscv/stubs.c            |  2 --
 xen/arch/riscv/time.c             | 39 +++++++++++++++++++++++++++++++
 5 files changed, 47 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/riscv/time.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index b0c8270a99..82016a957a 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -9,6 +9,7 @@ obj-y += setup.o
 obj-y += shutdown.o
 obj-y += smp.o
 obj-y += stubs.o
+obj-y += time.o
 obj-y += traps.o
 obj-y += vm_event.o
 
diff --git a/xen/arch/riscv/include/asm/time.h b/xen/arch/riscv/include/asm/time.h
index fc1572e9b4..c24745508b 100644
--- a/xen/arch/riscv/include/asm/time.h
+++ b/xen/arch/riscv/include/asm/time.h
@@ -5,6 +5,9 @@
 #include <xen/bug.h>
 #include <asm/csr.h>
 
+/* Clock cycles count at Xen startup */
+extern unsigned long xen_start_clock_cycles;
+
 struct vcpu;
 
 static inline void force_update_vcpu_system_time(struct vcpu *v)
@@ -19,6 +22,8 @@ static inline cycles_t get_cycles(void)
     return csr_read(CSR_TIME);
 }
 
+void preinit_xen_time(void);
+
 #endif /* ASM__RISCV__TIME_H */
 
 /*
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index b0e587678e..836ad16fed 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -126,6 +126,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     riscv_fill_hwcap();
 
+    preinit_xen_time();
+
     printk("All set up\n");
 
     machine_halt();
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index 5951b0ce91..caa133de84 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -27,8 +27,6 @@ nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
 
 /* time.c */
 
-unsigned long __ro_after_init cpu_khz;  /* CPU clock frequency in kHz. */
-
 s_time_t get_s_time(void)
 {
     BUG_ON("unimplemented");
diff --git a/xen/arch/riscv/time.c b/xen/arch/riscv/time.c
new file mode 100644
index 0000000000..ae8efa3c59
--- /dev/null
+++ b/xen/arch/riscv/time.c
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include <xen/device_tree.h>
+#include <xen/init.h>
+#include <xen/lib.h>
+#include <xen/sections.h>
+
+unsigned long __ro_after_init cpu_khz; /* CPU clock frequency in kHz. */
+unsigned long __ro_after_init xen_start_clock_cycles;
+
+static __initdata struct dt_device_node *timer;
+
+/* Set up the timer on the boot CPU (early init function) */
+static void __init preinit_dt_xen_time(void)
+{
+    static const struct dt_device_match __initconstrel timer_ids[] =
+    {
+        DT_MATCH_PATH("/cpus"),
+        { /* sentinel */ },
+    };
+    uint32_t rate;
+
+    timer = dt_find_matching_node(NULL, timer_ids);
+    if ( !timer )
+        panic("Unable to find a compatible timer in the device tree\n");
+
+    dt_device_set_used_by(timer, DOMID_XEN);
+
+    if ( !dt_property_read_u32(timer, "timebase-frequency", &rate) )
+        panic("Unable to find clock frequency\n");
+
+    cpu_khz = rate / 1000;
+}
+
+void __init preinit_xen_time(void)
+{
+    preinit_dt_xen_time();
+
+    xen_start_clock_cycles = get_cycles();
+}
-- 
2.48.1


