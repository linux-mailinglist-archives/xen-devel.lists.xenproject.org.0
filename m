Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 785A8A5CAAB
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 17:20:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908728.1315829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts2Kk-0002BI-Jl; Tue, 11 Mar 2025 16:19:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908728.1315829; Tue, 11 Mar 2025 16:19:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts2Kk-00028A-G9; Tue, 11 Mar 2025 16:19:58 +0000
Received: by outflank-mailman (input) for mailman id 908728;
 Tue, 11 Mar 2025 16:19:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JHpu=V6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ts2Kj-000284-BM
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 16:19:57 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab953e31-fe94-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 17:19:56 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5e5b56fc863so8299625a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 09:19:56 -0700 (PDT)
Received: from fedora.. (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e5c74a9303sm8706016a12.42.2025.03.11.09.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 09:19:54 -0700 (PDT)
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
X-Inumbo-ID: ab953e31-fe94-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741709995; x=1742314795; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eutEi8DtefvdnHN/K0N5ySijtm5ejHaJfNHDmk6hb8k=;
        b=TCAWFU9JUMVmz7PyiPjZeaqqNgygIulzy6sRcGNOJYOZ5VJQEPUxpHKj633L9z1waz
         n9/RvQvLP5qr4aNsbdmpMjRDV/bam70nva3zZNPFzFTgAhn3xkIvPNOkZbUQ04LuVgWW
         ABokBLSpWLlMFS/4/afw/iG+/+TzrPvUF8Be0LavXt9gVASwea1xRS/H5WrTJSNYvQEd
         Uts3iFMIJ146b6h56Ul8olxWyDmzMazVjAnGI8bq6KGxqhC6NF3bGJIjCs5k5YCKW7CV
         /OmM4eEDqH3ZpGcT6olHT2Ynurx0MONRdABLVFdJrnK5Apkaco3vSA7/AqvH6YZp3xt4
         nY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741709995; x=1742314795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eutEi8DtefvdnHN/K0N5ySijtm5ejHaJfNHDmk6hb8k=;
        b=b+5yyDoXw+AvVQklsFzJGKbTrctVCjHoKbvtCwMNcWHXk34BUWqY/NzjMmWQJwp8s1
         iC/rCmNuUFrIMUZ3trPS0CNipq/gyPhrc+pZw6WMcVd2sywgVmab7aBRI/VzamCaXaNZ
         +6RTK4u63OzMK8TQ4uNXG9L22x/ggRAplGKYpilj+VY0cFDdwqqWXX2M3RxID5TNFmRw
         KfSxvHhdktz8jOjUekfce+VuAyGIykKFenJeGs/sBc6PxLKg1IwMM3rq6o6wM9AaylOy
         slparx1PSJmv39E7hSWOO/b4xp4d3LiTht/XhD029lstvTJF+6fPD7AyPw4SUGDRzy5T
         sPBA==
X-Gm-Message-State: AOJu0YzeeeaJJH0DOA4mJod9BNjThoc8pW1sZU3zHiVFc25RH/jeVqGw
	bBtUuIxytHla65KDU4A9f6Ucqfko0s/cpwqqcuhtwccY+MfEI6WhAmRgFg==
X-Gm-Gg: ASbGncvbJMUccvVa+Z5oQg/qQhl69oK58E7cUXqirF6pw3DRulTMKXCuPwpaMWxiYPz
	SCIMBC1DA0WaTL5olynziGcZVIivx+bH63OzIU0etAXistu/9I1cPBunnrn6fB1+qyin05NA9DW
	QF1mthV70kWal8EVMJSCHv+7J0Klk5HRnlovzgZ4EN6zgqB+yvSGZ+jk/v/Szf6u+o1+XlOqhCw
	p8n5gZcDg6X7WqnSeWyeFBpQZ1iF8g+cW9oRMwDPmaHdCUdR+o+payyl0lDUBa9qIxJQ6ihbalj
	PvfckCUpyfxyspplMQUh8SYsSXP00OTXuDD7QgbcMxF1FEUom8uyCDdORDpsmtYBi4l9Z1n/M/H
	Az+tVJuKLMUxuzw==
X-Google-Smtp-Source: AGHT+IGy2UcnK2t2Zgs9j4q0VYO97EFeJHHVkvo8W3sRflsOZXxmoM5Ql0X3YH+HTGnpTgJ+WYNuOA==
X-Received: by 2002:a05:6402:1e88:b0:5de:dd6b:a7b0 with SMTP id 4fb4d7f45d1cf-5e75de57dd4mr5191318a12.1.1741709994973;
        Tue, 11 Mar 2025 09:19:54 -0700 (PDT)
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
Subject: [PATCH v1 1/4] xen/riscv: introduce preinit_xen_time()
Date: Tue, 11 Mar 2025 17:19:48 +0100
Message-ID: <3152c755e31367370f3e1d955253a9d4fc095f68.1741709885.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

preinit_xen_time() does two things:
1. Parse timebase-frequency properpy of /cpus node to initialize
   cpu_khz variable.
2. Initialize boot_count with the current time counter value.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/Makefile           |  1 +
 xen/arch/riscv/include/asm/time.h |  2 ++
 xen/arch/riscv/setup.c            |  2 ++
 xen/arch/riscv/stubs.c            |  2 --
 xen/arch/riscv/time.c             | 38 +++++++++++++++++++++++++++++++
 5 files changed, 43 insertions(+), 2 deletions(-)
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
index fc1572e9b4..f288fe1e5c 100644
--- a/xen/arch/riscv/include/asm/time.h
+++ b/xen/arch/riscv/include/asm/time.h
@@ -19,6 +19,8 @@ static inline cycles_t get_cycles(void)
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
index 0000000000..210df6ba28
--- /dev/null
+++ b/xen/arch/riscv/time.c
@@ -0,0 +1,38 @@
+#include <xen/device_tree.h>
+#include <xen/init.h>
+#include <xen/lib.h>
+#include <xen/sections.h>
+
+unsigned long __ro_after_init cpu_khz; /* CPU clock frequency in kHz. */
+unsigned long __read_mostly boot_count;
+
+static __initdata struct dt_device_node *timer;
+
+/* Set up the timer on the boot CPU (early init function) */
+static void __init preinit_dt_xen_time(void)
+{
+    static const struct dt_device_match  __initconst timer_ids[] =
+    {
+        DT_MATCH_PATH("/cpus"),
+        { /* sentinel */ },
+    };
+    u32 rate;
+
+    timer = dt_find_matching_node(NULL, timer_ids);
+    if ( !timer )
+        panic("Unable to find a compatible timer in the device tree\n");
+
+    dt_device_set_used_by(timer, DOMID_XEN);
+
+    if ( !dt_property_read_u32(timer, "timebase-frequency", &rate) )
+        panic("Unable to find clock frequency.\n");
+
+    cpu_khz = rate / 1000;
+}
+
+void __init preinit_xen_time(void)
+{
+    preinit_dt_xen_time();
+
+    boot_count = get_cycles();
+}
-- 
2.48.1


