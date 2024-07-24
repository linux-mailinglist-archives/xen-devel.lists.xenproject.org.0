Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE6893B3B8
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 17:32:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764294.1174752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWdy6-0000DH-VA; Wed, 24 Jul 2024 15:31:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764294.1174752; Wed, 24 Jul 2024 15:31:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWdy6-00006s-QR; Wed, 24 Jul 2024 15:31:54 +0000
Received: by outflank-mailman (input) for mailman id 764294;
 Wed, 24 Jul 2024 15:31:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fJNX=OY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sWdy4-0005Oj-HW
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 15:31:52 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d98969a1-49d1-11ef-bbfe-fd08da9f4363;
 Wed, 24 Jul 2024 17:31:51 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2ef2cce8c08so41848491fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 08:31:52 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ef2b568858sm13237311fa.35.2024.07.24.08.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 08:31:50 -0700 (PDT)
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
X-Inumbo-ID: d98969a1-49d1-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721835111; x=1722439911; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PXOE9CRQc9546f2NMHjGZ/14SaZEN5RgTjEp/XheDio=;
        b=k49/vwWu8fhBmZqpE1IS9yn5z2UFmmfZFhWBw48/M9Hlx2tWiNtLxgrqC8XLt/NW08
         dGNjXrPZUocCpPNSirQeY0o/H7I9eJkn2OjDQcJ4ruZGmrgvzdAWBjHFybITO/ZJfHph
         uUnkU7ipv4mGQMhP8X+86UXxeCp+ecVXPgi7SKUDnbWrFqoWfQjnL2fcMwXnd9HRQdV6
         XmFtC97xrPhlZ5OqJxqF+xp1IbRcn8mu+mw7QaaqSYBhJsp+P4BY2d6oJeNamK2eyVfA
         tRIvqlaDnxWVRAseB2hfSAK0aIKpc1XpgEwg9BgMc321y6U6ujoN13R96TQJHOo3PpmU
         EUPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721835111; x=1722439911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PXOE9CRQc9546f2NMHjGZ/14SaZEN5RgTjEp/XheDio=;
        b=iCrfoVzN0zKTihxKzsEqqMsUgPwnUkgzIsNOYaUIyL6KbMvHRsko6V6GaG7560GL9u
         C1AdML1eCYsfjWmLy2NX/kQVBPhdFoF9OSQa3eD2oCmqvWDg0iIfmOtc2jS+NAGyOLst
         KpfdUYlPYM+Yjhxs2FHnjHr1tKWdtUuK1944TFxhM/DdfWq1gBrLF66BfqT2HyV6WFzQ
         wWqYQ7SSSVVEyKRfvbzeg9iWVleNFgIsLV1nqg1iKXICY4dyyP8sO7+XtdUS33V60QvE
         +X9Hr4iTbUKtEYVRS9nC2QbM4U+BvVApf+Hd3KaV03bZ2ecDwzWilVLTihbH8S4LiDno
         TLBA==
X-Gm-Message-State: AOJu0YxkJF3TqD0b9UIyo0dknHvxMq8yZv08aa6rO7joV6BivtLjduIv
	z5tJ6g0bapZxEUgeh+xBnQ5RS9a22Xr30QBFrlTvU+f7TaRvu7lUZoOz3tc6
X-Google-Smtp-Source: AGHT+IFsU2+Od5rLfvrYUmDoF5dSsSMCuxFKBOlJMYc7fMR+ZRmqqk7JEQO5hNH2cIv6nBgSU6DcFA==
X-Received: by 2002:a2e:9651:0:b0:2ef:1edc:3b6a with SMTP id 38308e7fff4ca-2f039ea7c63mr1224821fa.21.1721835111186;
        Wed, 24 Jul 2024 08:31:51 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 6/9] xen/riscv: introduce functionality to work with cpu info
Date: Wed, 24 Jul 2024 17:31:37 +0200
Message-ID: <4ea9005d4209e24df9b30a7b3c282276084a3cf1.1721834549.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1721834549.git.oleksii.kurochko@gmail.com>
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct pcpu_info is introduced to store pcpu related information.
At the moment, it is only processor_id but in the fututre it will be
guest cpu information and some temporary variables which will be
used during save/restore of vcpu registers.

set_processor_id() and get_processor_id() are introduced to set and
get processor id which is stored in pcpu_info.

__cpuid_to_hartid_map[NR_CPUS] is introduced to store the mapping
between Xen logical CPU and hartid ( physical CPU id ) and auxiliary
macros cpuid_to_hartid_map() for convience access to __cpuid_to_hartid_map[].

smp_processor_id() is defined properly as it is enough to information to
define it now instead of seting it to "dummy" 0.

Also, tp registers is initialized to point to pcpu_info[0];
set_processor_id is set to 0 as Xen is running on logical cpu 0 and
save physical CPU id for current logical CPU id in __cpuid_to_hartid_map[].

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
 - new patch.
---
 xen/arch/riscv/Makefile                |  2 ++
 xen/arch/riscv/include/asm/processor.h | 35 ++++++++++++++++++++++++--
 xen/arch/riscv/include/asm/smp.h       | 10 ++++++++
 xen/arch/riscv/setup.c                 | 13 ++++++++++
 xen/arch/riscv/smp.c                   |  4 +++
 xen/arch/riscv/smpboot.c               | 12 +++++++++
 6 files changed, 74 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/riscv/smp.c
 create mode 100644 xen/arch/riscv/smpboot.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 81b77b13d6..334fd24547 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -4,6 +4,8 @@ obj-y += mm.o
 obj-$(CONFIG_RISCV_64) += riscv64/
 obj-y += sbi.o
 obj-y += setup.o
+obj-y += smp.o
+obj-y += smpboot.o
 obj-y += stubs.o
 obj-y += traps.o
 obj-y += vm_event.o
diff --git a/xen/arch/riscv/include/asm/processor.h b/xen/arch/riscv/include/asm/processor.h
index 3ae164c265..4c3e45fd17 100644
--- a/xen/arch/riscv/include/asm/processor.h
+++ b/xen/arch/riscv/include/asm/processor.h
@@ -12,8 +12,39 @@
 
 #ifndef __ASSEMBLY__
 
-/* TODO: need to be implemeted */
-#define smp_processor_id() 0
+#include <xen/bug.h>
+#include <xen/types.h>
+
+register struct pcpu_info *tp asm ("tp");
+
+struct pcpu_info {
+    unsigned int processor_id;
+};
+
+/* tp points to one of these */
+extern struct pcpu_info pcpu_info[NR_CPUS];
+
+#define get_processor_id()      (tp->processor_id)
+#define set_processor_id(id)    do { \
+    tp->processor_id = id;           \
+} while(0)
+
+static inline unsigned int smp_processor_id(void)
+{
+    unsigned int id;
+
+    id = get_processor_id();
+
+    /*
+     * Technically the hartid can be greater than what a uint can hold.
+     * If such a system were to exist, we will need to change
+     * the smp_processor_id() API to be unsigned long instead of
+     * unsigned int.
+     */
+    BUG_ON(id > UINT_MAX);
+
+    return id;
+}
 
 /* On stack VCPU state */
 struct cpu_user_regs
diff --git a/xen/arch/riscv/include/asm/smp.h b/xen/arch/riscv/include/asm/smp.h
index b1ea91b1eb..3fff27a8a5 100644
--- a/xen/arch/riscv/include/asm/smp.h
+++ b/xen/arch/riscv/include/asm/smp.h
@@ -5,6 +5,8 @@
 #include <xen/cpumask.h>
 #include <xen/percpu.h>
 
+#define INVALID_HARTID UINT_MAX
+
 DECLARE_PER_CPU(cpumask_var_t, cpu_sibling_mask);
 DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
 
@@ -14,6 +16,14 @@ DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
  */
 #define park_offline_cpus false
 
+void smp_setup_processor_id(unsigned long boot_cpu_hartid);
+
+/*
+ * Mapping between linux logical cpu index and hartid.
+ */
+extern unsigned long __cpuid_to_hartid_map[NR_CPUS];
+#define cpuid_to_hartid_map(cpu) __cpuid_to_hartid_map[cpu]
+
 #endif
 
 /*
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 13f0e8c77d..37b234360c 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -40,6 +40,19 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 {
     remove_identity_mapping();
 
+    /*
+     * tp register contains an address of physical cpu information.
+     * So write physical CPU info of boot cpu to tp register
+     * It will be used later by get_processor_id() to get process_id ( look at
+     * <asm/processor.h> ):
+     *   #define get_processor_id()    (tp->processor_id)
+     */
+    asm volatile ("mv tp, %0" : : "r"((unsigned long)&pcpu_info[0]));
+
+    set_processor_id(0);
+
+    smp_setup_processor_id(bootcpu_id);
+
     trap_init();
 
 #ifdef CONFIG_SELF_TESTS
diff --git a/xen/arch/riscv/smp.c b/xen/arch/riscv/smp.c
new file mode 100644
index 0000000000..006a062ad7
--- /dev/null
+++ b/xen/arch/riscv/smp.c
@@ -0,0 +1,4 @@
+#include <xen/smp.h>
+
+/* tp points to one of these per cpu */
+struct pcpu_info pcpu_info[NR_CPUS];
\ No newline at end of file
diff --git a/xen/arch/riscv/smpboot.c b/xen/arch/riscv/smpboot.c
new file mode 100644
index 0000000000..a90401ffd4
--- /dev/null
+++ b/xen/arch/riscv/smpboot.c
@@ -0,0 +1,12 @@
+#include <xen/init.h>
+#include <xen/sections.h>
+#include <xen/smp.h>
+
+unsigned long __cpuid_to_hartid_map[NR_CPUS] __ro_after_init = {
+    [0 ... NR_CPUS-1] = INVALID_HARTID
+};
+
+void __init smp_setup_processor_id(unsigned long boot_cpu_hartid)
+{
+    cpuid_to_hartid_map(0) = boot_cpu_hartid;
+}
-- 
2.45.2


