Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9F04E5753
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 18:20:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294003.499694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX4eH-0007VG-Vl; Wed, 23 Mar 2022 17:19:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294003.499694; Wed, 23 Mar 2022 17:19:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX4eH-0007TK-SP; Wed, 23 Mar 2022 17:19:53 +0000
Received: by outflank-mailman (input) for mailman id 294003;
 Wed, 23 Mar 2022 17:19:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s5zF=UC=gmail.com=philippe.mathieu.daude@srs-se1.protection.inumbo.net>)
 id 1nX4eG-0007T4-Bn
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 17:19:52 +0000
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [2607:f8b0:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71c1a642-aacd-11ec-8fbc-03012f2f19d4;
 Wed, 23 Mar 2022 18:19:50 +0100 (CET)
Received: by mail-pf1-x434.google.com with SMTP id u22so1978514pfg.6
 for <xen-devel@lists.xenproject.org>; Wed, 23 Mar 2022 10:19:50 -0700 (PDT)
Received: from localhost.localdomain (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 h10-20020a056a00230a00b004faa0f67c3esm515084pfh.23.2022.03.23.10.19.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Mar 2022 10:19:48 -0700 (PDT)
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
X-Inumbo-ID: 71c1a642-aacd-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pYl7PFx6HJtSTXEwRh0v4jjLcljevjvNsnI/ABIkNpc=;
        b=AVu5Njemv6HLmOsdKQ+VfG9+68Y75QCUvSBWjlFuBjz/HNiGqkYCNDiZx3nYu9plDG
         UF7gb7VVoz34sG1mev5yCvoNrsQ1z8IWtvbq8+aDO+pYuGeK/DFV2qzT8BBc6poAy1Ll
         lOEl1BAafr+0lbjC4zH66PCSBb7+R1xkhdgQxWxYoeJlwK3WLMcfEGBgnF+sjnGbStK4
         a9SLdMMRZo/bJUh14Z6gnY4UjA5DdwaI6pbaa9fmRZtN7HA6P8qF3KsTh8w0VYYU2kuV
         0AUyXjYRd81y11ZlUPISW8rgQ5pc3ziJB920CpKR3PJuR1zGs+XHXjL8xkJmc2RZcs4z
         JHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pYl7PFx6HJtSTXEwRh0v4jjLcljevjvNsnI/ABIkNpc=;
        b=Z6vpjQOT/GhD6PV5F1enpK2ZvHz6mol000TVSQS20LdBx2kMKuJ09TKd13vhbxw/FK
         1Z5fOn7p6tP38cjt1nibFz0DgqP2li6FKvS/cdb1zYB1fOqOPLfMTjkIDahp7b9cMHSa
         SBWBQUiql7h1mVIXzArBkSwpP82fLtpr/D+jSil1Z69iwyF+ASnVTKUKDKT72opp33/K
         iCcd2kLWJ/a1FUKEgWFx6BtnV4jDAq1kDSsLSSAKwL+ZUQ12Tnj/xdnVzoF+w4Y4VlwF
         EuRz44JhyvLVqEOsr02dMhadlVlAHPA1SwVOaaweEL+z/bTe39i50ioVRZUzHwW9nuJA
         OkAA==
X-Gm-Message-State: AOAM530ONtrQ//u9fzkcHZ82HdbvAMjV9eI4BFbMm3JG1mFT64QpqogR
	X3kE8QooYLq2yDJILDpByCY=
X-Google-Smtp-Source: ABdhPJxwe0fvqNFuFM35WUTu/PR9vPZnoQaBkNABrXApSmPztgel1hVfca2uBIR7EEKKmqRyCL7USA==
X-Received: by 2002:a63:4d56:0:b0:382:9ad9:d28d with SMTP id n22-20020a634d56000000b003829ad9d28dmr691452pgl.45.1648055988955;
        Wed, 23 Mar 2022 10:19:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Wenchao Wang <wenchao.wang@intel.com>,
	Laurent Vivier <lvivier@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Cameron Esfahani <dirty@apple.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	haxm-team@intel.com,
	Paul Durrant <paul@xen.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Roman Bolshakov <r.bolshakov@yadro.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Kamil Rytarowski <kamil@netbsd.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Colin Xu <colin.xu@intel.com>
Subject: [PATCH v4 09/13] accel/all: Extract common_vcpu_thread_create()
Date: Wed, 23 Mar 2022 18:17:47 +0100
Message-Id: <20220323171751.78612-10-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
References: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

All accelerators implement a very similar create_vcpu_thread()
handler. Extract the common part as common_vcpu_thread_create(),
which only requires the AccelOpsClass::vcpu_thread_fn() routine
and the accelerator AccelOpsClass::thread_name for debugging
purpose.

The single exception is TCG/RR which re-use a single vCPU. Have
it use the same logic by using the .precheck/.postcheck handlers.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/accel-softmmu.c             |  2 +-
 accel/dummy-cpus.c                | 15 +--------------
 accel/hvf/hvf-accel-ops.c         | 18 +++---------------
 accel/kvm/kvm-accel-ops.c         | 17 +++--------------
 accel/qtest/qtest.c               |  3 ++-
 accel/tcg/tcg-accel-ops-mttcg.c   | 22 +---------------------
 accel/tcg/tcg-accel-ops-mttcg.h   |  3 +--
 accel/tcg/tcg-accel-ops-rr.c      | 21 +++------------------
 accel/tcg/tcg-accel-ops-rr.h      |  6 ++++--
 accel/tcg/tcg-accel-ops.c         |  6 ++++--
 accel/xen/xen-all.c               |  2 +-
 include/sysemu/accel-ops.h        |  3 ++-
 include/sysemu/cpus.h             |  4 ++--
 softmmu/cpus.c                    | 23 ++++++++++++++++++++---
 target/i386/hax/hax-accel-ops.c   | 20 ++------------------
 target/i386/nvmm/nvmm-accel-ops.c | 17 +++--------------
 target/i386/whpx/whpx-accel-ops.c | 20 +++-----------------
 17 files changed, 56 insertions(+), 146 deletions(-)

diff --git a/accel/accel-softmmu.c b/accel/accel-softmmu.c
index 67276e4f52..7800df0234 100644
--- a/accel/accel-softmmu.c
+++ b/accel/accel-softmmu.c
@@ -77,7 +77,7 @@ void accel_init_ops_interfaces(AccelClass *ac)
 
     /*
      * all accelerators need to define ops, providing at least a mandatory
-     * non-NULL create_vcpu_thread operation.
+     * non-NULL vcpu_thread_fn operation.
      */
     g_assert(ops != NULL);
     if (ops->ops_init) {
diff --git a/accel/dummy-cpus.c b/accel/dummy-cpus.c
index 10429fdfb2..9840057969 100644
--- a/accel/dummy-cpus.c
+++ b/accel/dummy-cpus.c
@@ -18,7 +18,7 @@
 #include "qemu/main-loop.h"
 #include "hw/core/cpu.h"
 
-static void *dummy_cpu_thread_fn(void *arg)
+void *dummy_vcpu_thread_fn(void *arg)
 {
     CPUState *cpu = arg;
     sigset_t waitset;
@@ -57,16 +57,3 @@ static void *dummy_cpu_thread_fn(void *arg)
     rcu_unregister_thread();
     return NULL;
 }
-
-void dummy_start_vcpu_thread(CPUState *cpu)
-{
-    char thread_name[VCPU_THREAD_NAME_SIZE];
-
-    cpu->thread = g_malloc0(sizeof(QemuThread));
-    cpu->halt_cond = g_malloc0(sizeof(QemuCond));
-    qemu_cond_init(cpu->halt_cond);
-    snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "CPU %d/DUMMY",
-             cpu->cpu_index);
-    qemu_thread_create(cpu->thread, thread_name, dummy_cpu_thread_fn, cpu,
-                       QEMU_THREAD_JOINABLE);
-}
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 5c33dc602e..91d65036b4 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -442,25 +442,13 @@ static void *hvf_cpu_thread_fn(void *arg)
     return NULL;
 }
 
-static void hvf_start_vcpu_thread(CPUState *cpu)
-{
-    char thread_name[VCPU_THREAD_NAME_SIZE];
-
-    cpu->thread = g_malloc0(sizeof(QemuThread));
-    cpu->halt_cond = g_malloc0(sizeof(QemuCond));
-    qemu_cond_init(cpu->halt_cond);
-
-    snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "CPU %d/HVF",
-             cpu->cpu_index);
-    qemu_thread_create(cpu->thread, thread_name, hvf_cpu_thread_fn,
-                       cpu, QEMU_THREAD_JOINABLE);
-}
-
 static void hvf_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
-    ops->create_vcpu_thread = hvf_start_vcpu_thread;
+    ops->thread_name = "HVF";
+    ops->vcpu_thread_fn = hvf_cpu_thread_fn;
+
     ops->kick_vcpu_thread = hvf_kick_vcpu_thread;
 
     ops->synchronize_post_reset = hvf_cpu_synchronize_post_reset;
diff --git a/accel/kvm/kvm-accel-ops.c b/accel/kvm/kvm-accel-ops.c
index c4244a23c6..3d13efce0f 100644
--- a/accel/kvm/kvm-accel-ops.c
+++ b/accel/kvm/kvm-accel-ops.c
@@ -61,19 +61,6 @@ static void *kvm_vcpu_thread_fn(void *arg)
     return NULL;
 }
 
-static void kvm_start_vcpu_thread(CPUState *cpu)
-{
-    char thread_name[VCPU_THREAD_NAME_SIZE];
-
-    cpu->thread = g_malloc0(sizeof(QemuThread));
-    cpu->halt_cond = g_malloc0(sizeof(QemuCond));
-    qemu_cond_init(cpu->halt_cond);
-    snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "CPU %d/KVM",
-             cpu->cpu_index);
-    qemu_thread_create(cpu->thread, thread_name, kvm_vcpu_thread_fn,
-                       cpu, QEMU_THREAD_JOINABLE);
-}
-
 static bool kvm_vcpu_thread_is_idle(CPUState *cpu)
 {
     return !kvm_halt_in_kernel();
@@ -88,7 +75,9 @@ static void kvm_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
-    ops->create_vcpu_thread = kvm_start_vcpu_thread;
+    ops->thread_name = "KVM";
+    ops->vcpu_thread_fn = kvm_vcpu_thread_fn;
+
     ops->cpu_thread_is_idle = kvm_vcpu_thread_is_idle;
     ops->cpus_are_resettable = kvm_cpus_are_resettable;
     ops->synchronize_post_reset = kvm_cpu_synchronize_post_reset;
diff --git a/accel/qtest/qtest.c b/accel/qtest/qtest.c
index f6056ac836..1d0b1c855c 100644
--- a/accel/qtest/qtest.c
+++ b/accel/qtest/qtest.c
@@ -50,7 +50,8 @@ static void qtest_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
-    ops->create_vcpu_thread = dummy_start_vcpu_thread;
+    ops->vcpu_thread_fn = dummy_vcpu_thread_fn;
+
     ops->get_virtual_clock = qtest_get_virtual_clock;
 };
 
diff --git a/accel/tcg/tcg-accel-ops-mttcg.c b/accel/tcg/tcg-accel-ops-mttcg.c
index 80609964a6..c7836332d7 100644
--- a/accel/tcg/tcg-accel-ops-mttcg.c
+++ b/accel/tcg/tcg-accel-ops-mttcg.c
@@ -63,7 +63,7 @@ static void mttcg_force_rcu(Notifier *notify, void *data)
  * current CPUState for a given thread.
  */
 
-static void *mttcg_cpu_thread_fn(void *arg)
+void *mttcg_vcpu_thread_fn(void *arg)
 {
     MttcgForceRcuNotifier force_rcu;
     CPUState *cpu = arg;
@@ -137,23 +137,3 @@ void mttcg_kick_vcpu_thread(CPUState *cpu)
 {
     cpu_exit(cpu);
 }
-
-void mttcg_start_vcpu_thread(CPUState *cpu)
-{
-    char thread_name[VCPU_THREAD_NAME_SIZE];
-
-    cpu->thread = g_new0(QemuThread, 1);
-    cpu->halt_cond = g_malloc0(sizeof(QemuCond));
-    qemu_cond_init(cpu->halt_cond);
-
-    /* create a thread per vCPU with TCG (MTTCG) */
-    snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "CPU %d/TCG",
-             cpu->cpu_index);
-
-    qemu_thread_create(cpu->thread, thread_name, mttcg_cpu_thread_fn,
-                       cpu, QEMU_THREAD_JOINABLE);
-
-#ifdef _WIN32
-    cpu->hThread = qemu_thread_get_handle(cpu->thread);
-#endif
-}
diff --git a/accel/tcg/tcg-accel-ops-mttcg.h b/accel/tcg/tcg-accel-ops-mttcg.h
index 9fdc5a2ab5..b61aff5c1d 100644
--- a/accel/tcg/tcg-accel-ops-mttcg.h
+++ b/accel/tcg/tcg-accel-ops-mttcg.h
@@ -13,7 +13,6 @@
 /* kick MTTCG vCPU thread */
 void mttcg_kick_vcpu_thread(CPUState *cpu);
 
-/* start an mttcg vCPU thread */
-void mttcg_start_vcpu_thread(CPUState *cpu);
+void *mttcg_vcpu_thread_fn(void *arg);
 
 #endif /* TCG_CPUS_MTTCG_H */
diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
index 3da684b8e6..006b787289 100644
--- a/accel/tcg/tcg-accel-ops-rr.c
+++ b/accel/tcg/tcg-accel-ops-rr.c
@@ -148,7 +148,7 @@ static void rr_force_rcu(Notifier *notify, void *data)
  * elsewhere.
  */
 
-static void *rr_cpu_thread_fn(void *arg)
+void *rr_vcpu_thread_fn(void *arg)
 {
     Notifier force_rcu;
     CPUState *cpu = arg;
@@ -279,28 +279,13 @@ bool rr_create_vcpu_thread_precheck(CPUState *cpu)
     return !single_tcg_cpu_thread;
 }
 
-void rr_start_vcpu_thread(CPUState *cpu)
+void rr_create_vcpu_thread_postcheck(CPUState *cpu)
 {
-    char thread_name[VCPU_THREAD_NAME_SIZE];
     static QemuCond *single_tcg_halt_cond;
-    static QemuThread *single_tcg_cpu_thread;
-
-    if (!single_tcg_cpu_thread) {
-        cpu->thread = g_new0(QemuThread, 1);
-        cpu->halt_cond = g_new0(QemuCond, 1);
-        qemu_cond_init(cpu->halt_cond);
-
-        /* share a single thread for all cpus with TCG */
-        snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "ALL CPUs/TCG");
-        qemu_thread_create(cpu->thread, thread_name,
-                           rr_cpu_thread_fn,
-                           cpu, QEMU_THREAD_JOINABLE);
 
+    if (! single_tcg_cpu_thread) {
         single_tcg_halt_cond = cpu->halt_cond;
         single_tcg_cpu_thread = cpu->thread;
-#ifdef _WIN32
-        cpu->hThread = qemu_thread_get_handle(cpu->thread);
-#endif
     } else {
         /* we share the thread */
         cpu->thread = single_tcg_cpu_thread;
diff --git a/accel/tcg/tcg-accel-ops-rr.h b/accel/tcg/tcg-accel-ops-rr.h
index e2273b66d4..a1e75e7afb 100644
--- a/accel/tcg/tcg-accel-ops-rr.h
+++ b/accel/tcg/tcg-accel-ops-rr.h
@@ -16,7 +16,9 @@
 void rr_kick_vcpu_thread(CPUState *unused);
 
 bool rr_create_vcpu_thread_precheck(CPUState *cpu);
-/* start the round robin vcpu thread */
-void rr_start_vcpu_thread(CPUState *cpu);
+void rr_create_vcpu_thread_postcheck(CPUState *cpu);
+bool rr_destroy_vcpu_thread_precheck(CPUState *cpu);
+
+void *rr_vcpu_thread_fn(void *arg);
 
 #endif /* TCG_CPUS_RR_H */
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index d2181ea1e5..127dd6fee5 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -95,11 +95,13 @@ void tcg_handle_interrupt(CPUState *cpu, int mask)
 static void tcg_accel_ops_init(AccelOpsClass *ops)
 {
     if (qemu_tcg_mttcg_enabled()) {
-        ops->create_vcpu_thread = mttcg_start_vcpu_thread;
+        ops->vcpu_thread_fn = mttcg_vcpu_thread_fn;
         ops->kick_vcpu_thread = mttcg_kick_vcpu_thread;
         ops->handle_interrupt = tcg_handle_interrupt;
     } else {
-        ops->create_vcpu_thread = rr_start_vcpu_thread;
+        ops->vcpu_thread_fn = rr_vcpu_thread_fn;
+        ops->create_vcpu_thread_precheck = rr_create_vcpu_thread_precheck;
+        ops->create_vcpu_thread_postcheck = rr_create_vcpu_thread_postcheck;
         ops->kick_vcpu_thread = rr_kick_vcpu_thread;
 
         if (icount_enabled()) {
diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 69aa7d018b..ef40f626e2 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -219,7 +219,7 @@ static void xen_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
-    ops->create_vcpu_thread = dummy_start_vcpu_thread;
+    ops->vcpu_thread_fn = dummy_vcpu_thread_fn;
 }
 
 static const TypeInfo xen_accel_ops_type = {
diff --git a/include/sysemu/accel-ops.h b/include/sysemu/accel-ops.h
index 26b542d35c..caf337f61f 100644
--- a/include/sysemu/accel-ops.h
+++ b/include/sysemu/accel-ops.h
@@ -30,7 +30,8 @@ struct AccelOpsClass {
 
     bool (*cpus_are_resettable)(void);
 
-    void (*create_vcpu_thread)(CPUState *cpu); /* MANDATORY NON-NULL */
+    const char *thread_name;
+    void *(*vcpu_thread_fn)(void *arg); /* MANDATORY NON-NULL */
     /* If non-NULL, return whether common vCPU thread must be created */
     bool (*create_vcpu_thread_precheck)(CPUState *cpu);
     void (*create_vcpu_thread_postcheck)(CPUState *cpu);
diff --git a/include/sysemu/cpus.h b/include/sysemu/cpus.h
index b5c87d48b3..bf5629c58f 100644
--- a/include/sysemu/cpus.h
+++ b/include/sysemu/cpus.h
@@ -9,8 +9,8 @@ void cpus_register_accel(const AccelOpsClass *i);
 
 /* accel/dummy-cpus.c */
 
-/* Create a dummy vcpu for AccelOpsClass->create_vcpu_thread */
-void dummy_start_vcpu_thread(CPUState *);
+/* Create a dummy vcpu for AccelOpsClass->vcpu_thread_fn */
+void *dummy_vcpu_thread_fn(void *arg);
 
 /* interface available for cpus accelerator threads */
 
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 857e2081ba..cf430ac486 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -601,6 +601,22 @@ void resume_all_vcpus(void)
     }
 }
 
+static void common_vcpu_thread_create(CPUState *cpu)
+{
+    char thread_name[VCPU_THREAD_NAME_SIZE];
+
+    cpu->thread = g_new0(QemuThread, 1);
+    cpu->halt_cond = g_new0(QemuCond, 1);
+    qemu_cond_init(cpu->halt_cond);
+    snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "CPU %d/%s",
+             cpu->cpu_index, cpus_accel->thread_name ?: "DUMMY");
+    qemu_thread_create(cpu->thread, thread_name, cpus_accel->vcpu_thread_fn,
+                       cpu, QEMU_THREAD_JOINABLE);
+#ifdef _WIN32
+    cpu->hThread = qemu_thread_get_handle(cpu->thread);
+#endif
+}
+
 void cpu_remove_sync(CPUState *cpu)
 {
     cpu->stop = true;
@@ -614,7 +630,7 @@ void cpu_remove_sync(CPUState *cpu)
 void cpus_register_accel(const AccelOpsClass *ops)
 {
     assert(ops != NULL);
-    assert(ops->create_vcpu_thread != NULL); /* mandatory */
+    assert(ops->vcpu_thread_fn != NULL); /* mandatory */
     cpus_accel = ops;
 }
 
@@ -636,10 +652,11 @@ void qemu_init_vcpu(CPUState *cpu)
     }
 
     /* accelerators all implement the AccelOpsClass */
-    g_assert(cpus_accel != NULL && cpus_accel->create_vcpu_thread != NULL);
+    g_assert(cpus_accel != NULL && cpus_accel->vcpu_thread_fn != NULL);
+
     if (cpus_accel->create_vcpu_thread_precheck == NULL
             || cpus_accel->create_vcpu_thread_precheck(cpu)) {
-        cpus_accel->create_vcpu_thread(cpu);
+        common_vcpu_thread_create(cpu);
     }
     if (cpus_accel->create_vcpu_thread_postcheck) {
         cpus_accel->create_vcpu_thread_postcheck(cpu);
diff --git a/target/i386/hax/hax-accel-ops.c b/target/i386/hax/hax-accel-ops.c
index 18114fe34d..2fc2a9b8a4 100644
--- a/target/i386/hax/hax-accel-ops.c
+++ b/target/i386/hax/hax-accel-ops.c
@@ -57,28 +57,12 @@ static void *hax_cpu_thread_fn(void *arg)
     return NULL;
 }
 
-static void hax_start_vcpu_thread(CPUState *cpu)
-{
-    char thread_name[VCPU_THREAD_NAME_SIZE];
-
-    cpu->thread = g_new0(QemuThread, 1);
-    cpu->halt_cond = g_new0(QemuCond, 1);
-    qemu_cond_init(cpu->halt_cond);
-
-    snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "CPU %d/HAX",
-             cpu->cpu_index);
-    qemu_thread_create(cpu->thread, thread_name, hax_cpu_thread_fn,
-                       cpu, QEMU_THREAD_JOINABLE);
-#ifdef _WIN32
-    cpu->hThread = qemu_thread_get_handle(cpu->thread);
-#endif
-}
-
 static void hax_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
-    ops->create_vcpu_thread = hax_start_vcpu_thread;
+    ops->thread_name = "HAX";
+    ops->vcpu_thread_fn = hax_cpu_thread_fn;
     ops->kick_vcpu_thread = hax_kick_vcpu_thread;
 
     ops->synchronize_post_reset = hax_cpu_synchronize_post_reset;
diff --git a/target/i386/nvmm/nvmm-accel-ops.c b/target/i386/nvmm/nvmm-accel-ops.c
index 6c46101ac1..a6dc73aa35 100644
--- a/target/i386/nvmm/nvmm-accel-ops.c
+++ b/target/i386/nvmm/nvmm-accel-ops.c
@@ -60,19 +60,6 @@ static void *qemu_nvmm_cpu_thread_fn(void *arg)
     return NULL;
 }
 
-static void nvmm_start_vcpu_thread(CPUState *cpu)
-{
-    char thread_name[VCPU_THREAD_NAME_SIZE];
-
-    cpu->thread = g_new0(QemuThread, 1);
-    cpu->halt_cond = g_new0(QemuCond, 1);
-    qemu_cond_init(cpu->halt_cond);
-    snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "CPU %d/NVMM",
-             cpu->cpu_index);
-    qemu_thread_create(cpu->thread, thread_name, qemu_nvmm_cpu_thread_fn,
-                       cpu, QEMU_THREAD_JOINABLE);
-}
-
 /*
  * Abort the call to run the virtual processor by another thread, and to
  * return the control to that thread.
@@ -87,7 +74,9 @@ static void nvmm_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
-    ops->create_vcpu_thread = nvmm_start_vcpu_thread;
+    ops->thread_name = "NVMM";
+    ops->vcpu_thread_fn = qemu_nvmm_cpu_thread_fn;
+
     ops->kick_vcpu_thread = nvmm_kick_vcpu_thread;
 
     ops->synchronize_post_reset = nvmm_cpu_synchronize_post_reset;
diff --git a/target/i386/whpx/whpx-accel-ops.c b/target/i386/whpx/whpx-accel-ops.c
index dd2a9f7657..6498eb2060 100644
--- a/target/i386/whpx/whpx-accel-ops.c
+++ b/target/i386/whpx/whpx-accel-ops.c
@@ -60,22 +60,6 @@ static void *whpx_cpu_thread_fn(void *arg)
     return NULL;
 }
 
-static void whpx_start_vcpu_thread(CPUState *cpu)
-{
-    char thread_name[VCPU_THREAD_NAME_SIZE];
-
-    cpu->thread = g_new0(QemuThread, 1);
-    cpu->halt_cond = g_new0(QemuCond, 1);
-    qemu_cond_init(cpu->halt_cond);
-    snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "CPU %d/WHPX",
-             cpu->cpu_index);
-    qemu_thread_create(cpu->thread, thread_name, whpx_cpu_thread_fn,
-                       cpu, QEMU_THREAD_JOINABLE);
-#ifdef _WIN32
-    cpu->hThread = qemu_thread_get_handle(cpu->thread);
-#endif
-}
-
 static void whpx_kick_vcpu_thread(CPUState *cpu)
 {
     if (!qemu_cpu_is_self(cpu)) {
@@ -92,7 +76,9 @@ static void whpx_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
-    ops->create_vcpu_thread = whpx_start_vcpu_thread;
+    ops->thread_name = "WHPX";
+    ops->vcpu_thread_fn = whpx_cpu_thread_fn;
+
     ops->kick_vcpu_thread = whpx_kick_vcpu_thread;
     ops->cpu_thread_is_idle = whpx_vcpu_thread_is_idle;
 
-- 
2.35.1


