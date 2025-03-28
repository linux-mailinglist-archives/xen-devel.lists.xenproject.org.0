Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5C9A74EB7
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 17:59:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930970.1333467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyD2W-00014i-WB; Fri, 28 Mar 2025 16:58:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930970.1333467; Fri, 28 Mar 2025 16:58:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyD2W-00011u-TF; Fri, 28 Mar 2025 16:58:40 +0000
Received: by outflank-mailman (input) for mailman id 930970;
 Fri, 28 Mar 2025 16:58:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QVst=WP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tyD2V-00011d-8F
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 16:58:39 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4c75c08-0bf5-11f0-9ea4-5ba50f476ded;
 Fri, 28 Mar 2025 17:58:38 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5e61375c108so3025585a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 28 Mar 2025 09:58:38 -0700 (PDT)
Received: from fedora.. (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5edc16aae90sm1665004a12.15.2025.03.28.09.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 09:58:36 -0700 (PDT)
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
X-Inumbo-ID: e4c75c08-0bf5-11f0-9ea4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743181117; x=1743785917; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tiUogFb1cp17HgcNhiUeO+L5x4EUkNu2i1X7b3eX4TY=;
        b=dFvvCXcm8acIVhozA4YPPM5G+UE9u53k28Jk9Nm+sA47XgzRFPMTY10/CPDeEDaIsG
         ejJ9GeAOIcCPac3LMOHexUE+XAhK/0A1rAI1vCWJSr0FnYI1Hg8vPCuu7Sml08R9KSBA
         iBfFyR7K20yEjARXh5jwlARv6+4qLCYCsFBeNFmMWOETnPZFzMd4s/ojP/lQLF5Pdpjn
         H7FVfFx6em8zb3RXXJICRMOMdl6sVirzSWhb/PwD8JqPsFsx+44NnAWhU0sNBbdVb+V3
         6rVN1+kUXGF/jGcM3fCiWyvUt6+4d+VuJVlq+aKViXF0XKuGiQ3qybu62qiZiaO9mjWi
         kznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743181117; x=1743785917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tiUogFb1cp17HgcNhiUeO+L5x4EUkNu2i1X7b3eX4TY=;
        b=RAJ66KIPKpx4u8ZuLHEtsr4ZN7pzE+oaaoJHJm8iMmNgD3oHh8h4UfrmZLGdnjCCLB
         V3lveljGL1HFqdd2rw/nQkfoxGFhL7SwAgmaptpXxsk2rDVO+8RwI8UZsv7dqamZiZfn
         5RSJZFAU/Kai5P/tuOFRTGSBGj7GdbGpneztUqJHF5KXR1+w7njbqxdT2v52Y2HG6185
         VvN+VOyEk7hu1bXn7t9vGrboUlf4FiVsE3k8jUC4EYJQ6FMVrrz81zHvhb3Z3hJAHu26
         IGI105evb81EMdpAE1r1+LNK0TnGw5fk7MAJVjHT+k0YraX7my9jy9IOGb1LyaCFYJl4
         wtcg==
X-Gm-Message-State: AOJu0YzXnIDpV1lFD1OHgD7JTD9tMGuPnehmw19Adu/QpTAmODUnZyIS
	3jODIH3jXCkmo/ibddGxWNBfKmGh39fCX512lVw41eIAUfMbBKfbBRZmbw==
X-Gm-Gg: ASbGncvmZk6rHqMPZfzTjN4/GL4uFhTCaURUo23lfmqPCyt70GHCOfx3i2UmS6bLyGI
	h4VoH/uhSFBbiuvGQf5MVqrKXOtfyQP8s6nL5kPorzD9W1cop4nuvFH8acUfFyFjUnO3dLYS5LT
	En0TkTPrwc0U1Tul5PELNyIw9f5skmn43A3ZLWGmCdlQZxd/XZkTG4u+q0hNq6k9uKo+5QxkIfC
	ha2vKaLeztjnKm6l6CcGFco88iBsryIiseyUuji6q9Tcg0X1hta3rh0/YVttzT3zFfaO1rwx9n7
	2fGSQLXfz5ETBlkHzrz1cqmnSxi64QYl6UkIz8m0QUG9QzBznVLxFy2JRR80JY9RSo3Z2HWr9Su
	dv2YoQn/h97AjDA==
X-Google-Smtp-Source: AGHT+IG+M3F8lOTruAu154zgsPEVd4EHbXwr/CWhtJW52VJM3zB7+FfxUFAIIGfTg+Bccm/GFUljIg==
X-Received: by 2002:a05:6402:5255:b0:5e7:b081:e0d1 with SMTP id 4fb4d7f45d1cf-5ed8e06155amr7576710a12.3.1743181116720;
        Fri, 28 Mar 2025 09:58:36 -0700 (PDT)
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
Subject: [PATCH v3 1/4] xen/riscv: introduce preinit_xen_time()
Date: Fri, 28 Mar 2025 17:58:29 +0100
Message-ID: <4ddde60347edf6740fbc69b5739d099616f5b5ff.1743165791.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

preinit_xen_time() does two things:
1. Parse timebase-frequency properpy of /cpus node to initialize cpu_khz
   variable.
2. Initialize boot_clock_cycles with the current time counter value to
   have starting point for Xen.

timebase-frequency is read as a uint32_t because it is unlikely that the
timer will run at more than 4 GHz. If timebase-frequency exceeds 4 GHz,
a panic() is triggered, since dt_property_read_u32() will return 0 if
the size of the timebase-frequency property is greater than the size of
the output variable.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - s/xen_start_clock_cycles/boot_clock_cycles
 - Add panic() in preinit_xen_time() for the case when acpi_disabled = false.
 - Change type of boot_clokc_cycles to uint64_t as the counter will be still
   64-bit for RV32. Add inclusion of xen/types.h for uint64_t.
 - Move definition of timer variable to preinit_dt_xen_time() as there is no
   any reason to be a file scope variable.
 - Update the commit message.
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
 xen/arch/riscv/include/asm/time.h |  6 +++++
 xen/arch/riscv/setup.c            |  2 ++
 xen/arch/riscv/stubs.c            |  2 --
 xen/arch/riscv/time.c             | 42 +++++++++++++++++++++++++++++++
 5 files changed, 51 insertions(+), 2 deletions(-)
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
index fc1572e9b4..e8d9ffec57 100644
--- a/xen/arch/riscv/include/asm/time.h
+++ b/xen/arch/riscv/include/asm/time.h
@@ -3,8 +3,12 @@
 #define ASM__RISCV__TIME_H
 
 #include <xen/bug.h>
+#include <xen/types.h>
 #include <asm/csr.h>
 
+/* Clock cycles count at Xen startup */
+extern uint64_t boot_clock_cycles;
+
 struct vcpu;
 
 static inline void force_update_vcpu_system_time(struct vcpu *v)
@@ -19,6 +23,8 @@ static inline cycles_t get_cycles(void)
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
index 0000000000..905bb13eb4
--- /dev/null
+++ b/xen/arch/riscv/time.c
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include <xen/acpi.h>
+#include <xen/device_tree.h>
+#include <xen/init.h>
+#include <xen/lib.h>
+#include <xen/sections.h>
+
+unsigned long __ro_after_init cpu_khz; /* CPU clock frequency in kHz. */
+uint64_t __ro_after_init boot_clock_cycles;
+
+/* Set up the timer on the boot CPU (early init function) */
+static void __init preinit_dt_xen_time(void)
+{
+    static const struct dt_device_match __initconstrel timer_ids[] =
+    {
+        DT_MATCH_PATH("/cpus"),
+        { /* sentinel */ },
+    };
+    struct dt_device_node *timer;
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
+    if ( acpi_disabled )
+        preinit_dt_xen_time();
+    else
+        panic("%s: ACPI isn't supported\n", __func__);
+
+    boot_clock_cycles = get_cycles();
+}
-- 
2.49.0


