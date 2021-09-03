Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EAF4004C4
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 20:20:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178300.324202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMDnE-0004Dc-Bo; Fri, 03 Sep 2021 18:20:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178300.324202; Fri, 03 Sep 2021 18:20:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMDnE-0004AP-7X; Fri, 03 Sep 2021 18:20:00 +0000
Received: by outflank-mailman (input) for mailman id 178300;
 Fri, 03 Sep 2021 18:19:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wQk4=NZ=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1mMDnD-0004AJ-1e
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 18:19:59 +0000
Received: from mail-wr1-x431.google.com (unknown [2a00:1450:4864:20::431])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d25ceb54-55f7-4eb0-a243-faf6ec6d229e;
 Fri, 03 Sep 2021 18:19:57 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id m9so9411815wrb.1
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 11:19:57 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id u23sm136370wmc.24.2021.09.03.11.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 11:19:56 -0700 (PDT)
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
X-Inumbo-ID: d25ceb54-55f7-4eb0-a243-faf6ec6d229e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k3EjGTKaI5g2mQLOHoezT/qbWejrZejERiPKCtXq8gw=;
        b=ojXrCIeyfH+YVO9iz1+TNZ9ezRMcW6h0jHjOAtJni4y0ai5GgfLbbVKAXjbpWwN84L
         Wm56dutgcXCYft6ubwqE6izEV7rcqTas8IDw2060mRAfdL2U6dvcLmlcGNbagstYZVSf
         jve/9McQZrfnans26GBi94oDOXS/nSfcjfw8rvKdqsA1IniKQVKQQbc7TUA0wMVS7nvT
         TBnmW1VCvwKuQQGF8INVzA1baogQfGV8Cas8UMEOVGUt7odj+mlXP4aVg2IUpEe1kmu8
         QYWmHgIkGuFnhk+83UH6zljZXUsTAJP42n6FB7tIoIdWXO+avlqow18bOmY8gb6Phemw
         R0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=k3EjGTKaI5g2mQLOHoezT/qbWejrZejERiPKCtXq8gw=;
        b=XfF9cAChzRC/MmnQT32mfgNCp8u3lnquqpHa9u8I867G7NBDSL5GpRvvE0HhrVnqFi
         5/CR/YW60buIQD9xIkZjtH8MTq23Tg+/0YfQoYQdYoNtl+fEHH5kWfLX9Vxk9N1gQhmN
         /ur+V6+oazKy5mlOlFY8ataHczTfXu7dAcsYnBx9DBgt/oL4zWO9JQKdh98OJEF3T3o3
         Ac50sI3HDLCOkzZESnwvEPWKhs/FEaU8TKWmV9ijzso3JIKqaGsURGZQQ++eait9izdj
         seEWHNO73G7t/ERwFhMlzjfA8DP9Y1ESudysEG9+bfBzpUaX46sPfMr2+JjiPAkMfzAw
         mbfg==
X-Gm-Message-State: AOAM530JmU7js84t8JMQtmy8G5oRDSq47XBIdl7ZUGmx3JH7RJKQM+Vw
	XCEPjoTd1EyeaMlnORYioN4=
X-Google-Smtp-Source: ABdhPJx0dZCgp0zUQLbWfMU8EmsUBXRCSeLlfDHicQVXCHRyEM3DqNc6Zbv9ZU3Q+HTVaH2wLnC6rg==
X-Received: by 2002:a5d:5642:: with SMTP id j2mr433139wrw.264.1630693196710;
        Fri, 03 Sep 2021 11:19:56 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Cameron Esfahani <dirty@apple.com>,
	Claudio Fontana <cfontana@suse.de>,
	Colin Xu <colin.xu@intel.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	haxm-team@intel.com,
	Kamil Rytarowski <kamil@netbsd.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Roman Bolshakov <r.bolshakov@yadro.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Wenchao Wang <wenchao.wang@intel.com>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 30/30] accel: Add missing AccelOpsClass::has_work() and drop SysemuCPUOps one
Date: Fri,  3 Sep 2021 20:19:43 +0200
Message-Id: <20210903181943.763360-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902161543.417092-1-f4bug@amsat.org>
References: <20210902161543.417092-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

cpu_common_has_work() is the default has_work() implementation
and returns 'false'.

Explicit it for the QTest / HAX / HVF / NVMM / Xen accelerators
and remove cpu_common_has_work().

Since there are no more implementations of SysemuCPUOps::has_work,
remove it along with the assertion in cpu_has_work().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h             | 2 --
 accel/hvf/hvf-accel-ops.c         | 6 ++++++
 accel/qtest/qtest.c               | 6 ++++++
 accel/xen/xen-all.c               | 6 ++++++
 hw/core/cpu-common.c              | 6 ------
 softmmu/cpus.c                    | 9 ++-------
 target/i386/hax/hax-accel-ops.c   | 6 ++++++
 target/i386/nvmm/nvmm-accel-ops.c | 6 ++++++
 8 files changed, 32 insertions(+), 15 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index e2dd171a13f..c64709b898c 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -89,7 +89,6 @@ struct SysemuCPUOps;
  * instantiatable CPU type.
  * @parse_features: Callback to parse command line arguments.
  * @reset_dump_flags: #CPUDumpFlags to use for reset logging.
- * @has_work: Callback for checking if there is work to do.
  * @memory_rw_debug: Callback for GDB memory access.
  * @dump_state: Callback for dumping state.
  * @get_arch_id: Callback for getting architecture-dependent CPU ID.
@@ -132,7 +131,6 @@ struct CPUClass {
     void (*parse_features)(const char *typename, char *str, Error **errp);
 
     int reset_dump_flags;
-    bool (*has_work)(CPUState *cpu);
     int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
                            uint8_t *buf, int len, bool is_write);
     void (*dump_state)(CPUState *cpu, FILE *, int flags);
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index d1691be9896..53c427ee42e 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -446,6 +446,11 @@ static void hvf_start_vcpu_thread(CPUState *cpu)
                        cpu, QEMU_THREAD_JOINABLE);
 }
 
+static bool hvf_cpu_has_work(CPUState *cpu)
+{
+    return false;
+}
+
 static void hvf_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
@@ -456,6 +461,7 @@ static void hvf_accel_ops_class_init(ObjectClass *oc, void *data)
     ops->synchronize_post_init = hvf_cpu_synchronize_post_init;
     ops->synchronize_state = hvf_cpu_synchronize_state;
     ops->synchronize_pre_loadvm = hvf_cpu_synchronize_pre_loadvm;
+    ops->has_work = hvf_cpu_has_work;
 };
 static const TypeInfo hvf_accel_ops_type = {
     .name = ACCEL_OPS_NAME("hvf"),
diff --git a/accel/qtest/qtest.c b/accel/qtest/qtest.c
index 7e6b8110d52..eb5a17cef18 100644
--- a/accel/qtest/qtest.c
+++ b/accel/qtest/qtest.c
@@ -47,12 +47,18 @@ static const TypeInfo qtest_accel_type = {
 };
 module_obj(TYPE_QTEST_ACCEL);
 
+static bool qtest_cpu_has_work(CPUState *cpu)
+{
+    return false;
+}
+
 static void qtest_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
     ops->create_vcpu_thread = dummy_start_vcpu_thread;
     ops->get_virtual_clock = qtest_get_virtual_clock;
+    ops->has_work = qtest_cpu_has_work;
 };
 
 static const TypeInfo qtest_accel_ops_type = {
diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 69aa7d018b2..fe5a37fa2e6 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -215,11 +215,17 @@ static const TypeInfo xen_accel_type = {
     .class_init = xen_accel_class_init,
 };
 
+static bool xen_cpu_has_work(CPUState *cpu)
+{
+    return false;
+}
+
 static void xen_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
     ops->create_vcpu_thread = dummy_start_vcpu_thread;
+    ops->has_work = xen_cpu_has_work;
 }
 
 static const TypeInfo xen_accel_ops_type = {
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index e2f5a646046..5ed1ccdfdd5 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -143,11 +143,6 @@ static void cpu_common_reset(DeviceState *dev)
     }
 }
 
-static bool cpu_common_has_work(CPUState *cs)
-{
-    return false;
-}
-
 ObjectClass *cpu_class_by_name(const char *typename, const char *cpu_model)
 {
     CPUClass *cc = CPU_CLASS(object_class_by_name(typename));
@@ -279,7 +274,6 @@ static void cpu_class_init(ObjectClass *klass, void *data)
 
     k->parse_features = cpu_common_parse_features;
     k->get_arch_id = cpu_common_get_arch_id;
-    k->has_work = cpu_common_has_work;
     k->gdb_read_register = cpu_common_gdb_read_register;
     k->gdb_write_register = cpu_common_gdb_write_register;
     set_bit(DEVICE_CATEGORY_CPU, dc->categories);
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 6bce52ce561..e6dad2243c6 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -251,13 +251,8 @@ void cpu_interrupt(CPUState *cpu, int mask)
 
 bool cpu_has_work(CPUState *cpu)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    if (cpus_accel->has_work) {
-        return cpus_accel->has_work(cpu);
-    }
-    g_assert(cc->has_work);
-    return cc->has_work(cpu);
+    g_assert(cpus_accel->has_work);
+    return cpus_accel->has_work(cpu);
 }
 
 static int do_vm_stop(RunState state, bool send_stop)
diff --git a/target/i386/hax/hax-accel-ops.c b/target/i386/hax/hax-accel-ops.c
index 136630e9b23..5407ba17eaf 100644
--- a/target/i386/hax/hax-accel-ops.c
+++ b/target/i386/hax/hax-accel-ops.c
@@ -74,6 +74,11 @@ static void hax_start_vcpu_thread(CPUState *cpu)
 #endif
 }
 
+static bool hax_cpu_has_work(CPUState *cpu)
+{
+    return false;
+}
+
 static void hax_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
@@ -85,6 +90,7 @@ static void hax_accel_ops_class_init(ObjectClass *oc, void *data)
     ops->synchronize_post_init = hax_cpu_synchronize_post_init;
     ops->synchronize_state = hax_cpu_synchronize_state;
     ops->synchronize_pre_loadvm = hax_cpu_synchronize_pre_loadvm;
+    ops->has_work = hax_cpu_has_work;
 }
 
 static const TypeInfo hax_accel_ops_type = {
diff --git a/target/i386/nvmm/nvmm-accel-ops.c b/target/i386/nvmm/nvmm-accel-ops.c
index f788f75289f..36296f79ff8 100644
--- a/target/i386/nvmm/nvmm-accel-ops.c
+++ b/target/i386/nvmm/nvmm-accel-ops.c
@@ -83,6 +83,11 @@ static void nvmm_kick_vcpu_thread(CPUState *cpu)
     cpus_kick_thread(cpu);
 }
 
+static bool nvmm_cpu_has_work(CPUState *cpu)
+{
+    return false;
+}
+
 static void nvmm_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
@@ -94,6 +99,7 @@ static void nvmm_accel_ops_class_init(ObjectClass *oc, void *data)
     ops->synchronize_post_init = nvmm_cpu_synchronize_post_init;
     ops->synchronize_state = nvmm_cpu_synchronize_state;
     ops->synchronize_pre_loadvm = nvmm_cpu_synchronize_pre_loadvm;
+    ops->has_work = nvmm_cpu_has_work;
 }
 
 static const TypeInfo nvmm_accel_ops_type = {
-- 
2.31.1


