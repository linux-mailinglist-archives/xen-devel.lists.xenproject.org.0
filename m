Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B75DDCDCEA3
	for <lists+xen-devel@lfdr.de>; Wed, 24 Dec 2025 18:04:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192949.1511966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYSGz-0003JB-Bc; Wed, 24 Dec 2025 17:03:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192949.1511966; Wed, 24 Dec 2025 17:03:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYSGz-0003Fp-7L; Wed, 24 Dec 2025 17:03:41 +0000
Received: by outflank-mailman (input) for mailman id 1192949;
 Wed, 24 Dec 2025 17:03:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jcWU=66=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vYSGx-0003CV-VW
 for xen-devel@lists.xenproject.org; Wed, 24 Dec 2025 17:03:39 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e170a83-e0ea-11f0-b15c-2bf370ae4941;
 Wed, 24 Dec 2025 18:03:39 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-64baaa754c6so6082053a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Dec 2025 09:03:39 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037ab7f7bsm1798927766b.18.2025.12.24.09.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 09:03:37 -0800 (PST)
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
X-Inumbo-ID: 7e170a83-e0ea-11f0-b15c-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766595818; x=1767200618; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+CX4PM1TSlKhl6ge6jDhJJvdmvI/i39oU9Gt3HuqSc=;
        b=VAtxeBZmCjadwaNlu88IyJOVNNWkT8e3Hg1ZbbDjKwldjoPqMNz79K/BY3Heeiwyvt
         QQz1QfFlDXGIGzO4Z9wp/9yWxFu3LQVdkq8JL5AnEImtaFYiEAUzG/y4FPKcc6u1wCJ+
         n6SFdVc2vsldKVlho1AUyNI2b5YtJIbh/80BtXrFLu3Eu7U3LWt1DCfJL0RQGyeLHUfd
         nSMP93pMUYPvSbJFAk47wjokOFAX+O+EfxiVMEDWv9/F2JQUtb6RjP9pjKANOrSX3biF
         rAc9BsSbaZk+4p+5Uet/3ZzbL2vtVI9nw0arFX01OLw8SUxKj8mzVA5z/7pxXPZWHDeO
         cHUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766595818; x=1767200618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z+CX4PM1TSlKhl6ge6jDhJJvdmvI/i39oU9Gt3HuqSc=;
        b=qyNb0M3e/Rw4ee2kmkocChWB0eaQOwl863/wxhPDPO3A9L02fa/Sqo0ZhOTdZDnnZR
         eqmKhMkYYgjmqLTjzjH9Vhvu1g1oFmxgtPLVLUftdla2ensXvrcbxM50ANucWnYQGsd0
         /5GjtAyz7naPoGBKJ12CVoXFBn3pWukwKp4QndmRRa5f0hNCrGR6Gdqfi4AJI/DcgjDk
         k3fZ/2D6LNJ/Jj5v6M3k87xVjcnIHPQ0zmM8UPEFHhrRMSm9S4QwHldJTAK3zj0WFkPL
         HOu36VFPw9YXltbZAhwOiv+Aw9U5bFpXdMXD+rz3wtMT6CALPo2UH+jKWzbfSUJ4WR0G
         7hPg==
X-Gm-Message-State: AOJu0YxK7yq9ku4qB6+IGMBR/x6Q8xjLh+pb9a/PTNA/dflCUu9Udfr6
	yuwhi94fiK54okVZ8spZaDsp7pSjZifAIJ7nXMAD2eiWF+v4ussT9xvmHSK/FQ==
X-Gm-Gg: AY/fxX5TRVpBJROm5sWpj+trU/WNSShBuASTFtY6C3TXTcP+xMzT851b6L7xuLmYcy4
	vdJacovaGKr5tVVq69Zybauu2C2XNPKika/Cq6vz+3WVwfBvkGAtSAL9IOMin3X+QTFNNsl2Nma
	qjxeddRdMkD/2ZfoqB265W2rqieuicKPj/Z5jm0ZwKG4BEayaA0rJinoDCwGYPXnlT1fTnX6huC
	SbhG10gSd5Sj3K0zpUdmMabav/96DxaxThAFPqWCdLyCcqXM6qtifY3MXwR3L0pgT1qtw5RLKtt
	qo8Nuu++ceAGQhFW0KXKHIRG1Vf0XuS7s5ojvyBNV2g6JHOr/FLUFGH5Cod2FwJQpPQij6FoPeg
	CP5zfI4R2/VrAO/Bncc7kcIzf0KCgPdPAXLRaLZrRA4vbmZt9VZHChuPT3rNhK0yB6o8dejf7S4
	ejcN2zklxUV/BjYyTrYWeUi62w4ZW0JFCOqSPFt0adUsv22pSwyvNWFa0=
X-Google-Smtp-Source: AGHT+IH4u2/iCr5LDRPjPTjUt2EKuw6McarNGkOHJXK+wbRNb2InsTPLqP39yJFiwV7dZr3TMBqKDA==
X-Received: by 2002:a17:906:308a:b0:b83:15cb:d491 with SMTP id a640c23a62f3a-b8315cc015bmr165100066b.53.1766595818113;
        Wed, 24 Dec 2025 09:03:38 -0800 (PST)
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
Subject: [PATCH v1 02/15] xen/riscv: implement arch_vcpu_{create,destroy}()
Date: Wed, 24 Dec 2025 18:03:15 +0100
Message-ID: <be49a360ad584edf5fd9891e5f4534a2c2586048.1766595589.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1766595589.git.oleksii.kurochko@gmail.com>
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce architecture-specific functions to create and destroy VCPUs.
Note that arch_vcpu_create() currently returns -EOPNOTSUPP, as the virtual
timer and interrupt controller are not yet implemented.

As part of this change, add continue_new_vcpu(), which will be used after
the first context_switch() of a new vCPU. Since this functionality is not
yet implemented, continue_new_vcpu() is currently provided as a stub.

Update the STACK_SIZE definition and introduce STACK_ORDER (to align with
other architectures) for allocating the vCPU stack.

Introduce struct cpu_info, which will be allocated in arch_vcpu_create()
and declare cpu_info inside arch_vcpu structure.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/Makefile              |  1 +
 xen/arch/riscv/domain.c              | 56 ++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/config.h  |  3 +-
 xen/arch/riscv/include/asm/current.h |  6 +++
 xen/arch/riscv/include/asm/domain.h  |  3 ++
 xen/arch/riscv/stubs.c               | 10 -----
 6 files changed, 68 insertions(+), 11 deletions(-)
 create mode 100644 xen/arch/riscv/domain.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 87c1148b0010..8863d4b15605 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -1,5 +1,6 @@
 obj-y += aplic.o
 obj-y += cpufeature.o
+obj-y += domain.o
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 obj-y += entry.o
 obj-y += imsic.o
diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
new file mode 100644
index 000000000000..e5fda1af4ee9
--- /dev/null
+++ b/xen/arch/riscv/domain.c
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/mm.h>
+#include <xen/sched.h>
+
+static void continue_new_vcpu(struct vcpu *prev)
+{
+    BUG_ON("unimplemented\n");
+}
+
+int arch_vcpu_create(struct vcpu *v)
+{
+    int rc = 0;
+
+    BUILD_BUG_ON(sizeof(struct cpu_info) > STACK_SIZE);
+
+    v->arch.stack = alloc_xenheap_pages(STACK_ORDER, MEMF_node(vcpu_to_node(v)));
+    if ( !v->arch.stack )
+        return -ENOMEM;
+
+    v->arch.cpu_info = (struct cpu_info *)(v->arch.stack
+                                           + STACK_SIZE
+                                           - sizeof(struct cpu_info));
+    memset(v->arch.cpu_info, 0, sizeof(*v->arch.cpu_info));
+
+    v->arch.xen_saved_context.sp = (register_t)v->arch.cpu_info;
+    v->arch.xen_saved_context.ra = (register_t)continue_new_vcpu;
+
+    printk("Create vCPU with sp=%#lx, pc=%#lx, cpu_info(%#lx)\n",
+           v->arch.xen_saved_context.sp, v->arch.xen_saved_context.ra,
+           (unsigned long)v->arch.cpu_info);
+
+    /* Idle VCPUs don't need the rest of this setup */
+    if ( is_idle_vcpu(v) )
+        return rc;
+
+    /*
+     * As the vtimer and interrupt controller (IC) are not yet implemented,
+     * return an error.
+     *
+     * TODO: Drop this once the vtimer and IC are implemented.
+     */
+    rc = -EOPNOTSUPP;
+    goto fail;
+
+    return rc;
+
+ fail:
+    arch_vcpu_destroy(v);
+    return rc;
+}
+
+void arch_vcpu_destroy(struct vcpu *v)
+{
+    free_xenheap_pages(v->arch.stack, STACK_ORDER);
+}
diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index 1e08d3bf78be..86a95df018b5 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -143,7 +143,8 @@
 
 #define SMP_CACHE_BYTES (1 << 6)
 
-#define STACK_SIZE PAGE_SIZE
+#define STACK_ORDER 3
+#define STACK_SIZE (PAGE_SIZE << STACK_ORDER)
 
 #define IDENT_AREA_SIZE 64
 
diff --git a/xen/arch/riscv/include/asm/current.h b/xen/arch/riscv/include/asm/current.h
index 0c3ea70c2ec8..58c9f1506b7c 100644
--- a/xen/arch/riscv/include/asm/current.h
+++ b/xen/arch/riscv/include/asm/current.h
@@ -21,6 +21,12 @@ struct pcpu_info {
 /* tp points to one of these */
 extern struct pcpu_info pcpu_info[NR_CPUS];
 
+/* Per-VCPU state that lives at the top of the stack */
+struct cpu_info {
+    /* This should be the first member. */
+    struct cpu_user_regs guest_cpu_user_regs;
+};
+
 #define set_processor_id(id)    do { \
     tp->processor_id = (id);         \
 } while (0)
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index 639cafdade99..a0ffbbc09c6f 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -49,6 +49,9 @@ struct arch_vcpu
         register_t ra;
     } xen_saved_context;
 
+    struct cpu_info *cpu_info;
+    void *stack;
+
     /* CSRs */
     register_t hstatus;
     register_t hedeleg;
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index 164fc091b28a..eab826e8c3ae 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -126,16 +126,6 @@ void free_vcpu_struct(struct vcpu *v)
     BUG_ON("unimplemented");
 }
 
-int arch_vcpu_create(struct vcpu *v)
-{
-    BUG_ON("unimplemented");
-}
-
-void arch_vcpu_destroy(struct vcpu *v)
-{
-    BUG_ON("unimplemented");
-}
-
 void vcpu_switch_to_aarch64_mode(struct vcpu *v)
 {
     BUG_ON("unimplemented");
-- 
2.52.0


