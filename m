Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09425A0312E
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 21:11:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865947.1277256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUtRD-0007ao-IE; Mon, 06 Jan 2025 20:10:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865947.1277256; Mon, 06 Jan 2025 20:10:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUtRD-0007YP-Eh; Mon, 06 Jan 2025 20:10:59 +0000
Received: by outflank-mailman (input) for mailman id 865947;
 Mon, 06 Jan 2025 20:10:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iH3c=T6=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tUtKG-0002s4-U7
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 20:03:48 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5754ab31-cc69-11ef-a0df-8be0dac302b0;
 Mon, 06 Jan 2025 21:03:48 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3862ca8e0bbso11253931f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2025 12:03:48 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436723cb159sm525092965e9.16.2025.01.06.12.03.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Jan 2025 12:03:44 -0800 (PST)
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
X-Inumbo-ID: 5754ab31-cc69-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736193828; x=1736798628; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQTkKmwN0la/zq4/AmggU7ruV8aWhlAE2m8oe1Or7Yc=;
        b=wiwbw6tW/XNvHfXzrP4VUxaUUil+H3o1bKJRh5hX2tZLvnsnK05TCmPNCbercXi49R
         K1t0lRzD2P8qf96f9xx1sPVnyeSZGv4yXt/Vbdfk5PoZZqIEi0Fqpws5QiLiK5wANAyw
         YE9xrk5w+o8Z+J3mKxAktE6HB3dIdcYb+nJZeVi1jicxkvkM9WAvIg6Yvma9J/UQ7xhd
         BZOTdCz1xe8txVo6/RUNzDPFm4oijSgdNJUiVvPBr/DBOE4MV8+NBFEEHktYed259Ug4
         cl3ubXZu0BzRJ6v45bZ8aU2e2lG0Forc7jwb9tWS/meLkXzMDUWT1Dq6D8187w/bjx1/
         EINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736193828; x=1736798628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iQTkKmwN0la/zq4/AmggU7ruV8aWhlAE2m8oe1Or7Yc=;
        b=tIvWUcEyQ2OYQ0v57AgQhsWqPlS6JinMvQqKW/UI/FKTBesti0Kiz1/KeiVaNLgkeJ
         OyBKo2ifLaLkG2XfWfb4exfmebgFy+TvhWwRDbf5j06RdAaw+X7SNwt2yYrVUR7d/yRS
         9PUrDcaKqvsr7H0dMKiFRq2E9P4mg+ZGDkZAmUtxrHILR8kaIYxIl9ylrn7dyfZtV3RI
         39bnvmFWN/fwNj4I2pz6CJ04YaP7s0fYFUAvBF48tqebTcPUprvzmH33/24CWwfgiS09
         8pFyR1W/wKl0yR9eaM8U15RCILzLSj/WyexMo7fLmeEy2sCd5zTxOYoNI+hhuaiLfdK/
         gg+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXYMgicTKWlLLcYZ+9lAfOhfRf0Q8vgA3g8qEbTsUPwqqyiXHV30HhVWZQSszGXk7BIVSidjNww22A=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzoaj4j9aFlQR1XYhISzC5hToL1zaG2pJI6uhcc/jWATFsVZouS
	6Pt1oyihxhFdYsHGvNpoG2dNURpGW4gjpu0N9jw8odoQB5fRRuuAbh8eODUm1FA=
X-Gm-Gg: ASbGncsfAUgXEsPCWLZvQS6YdgVeo/idfPymh3DZ760fPacCgs3xVPCa0C2B1Q4IBJY
	YPrn1vBygnjuli3QqX+psXGEGFSzsy72l01FQidAngCRAw9E1CP3dMP/0JKhw+LIVBVjmWWNryg
	JDQKPPOmePElRCCt15kh4vx5guKgm6ia5JT+2fREJJ4xQhBLuGmIVWuAbi2h7uuBIbT8e1tH8CP
	UtrVaipelATGaaB9r76p6Yl2WdCrjzA4TRPbWaf1YUaeB+nVrCeowce7j+FMmNXxKwU9Zpwx4gJ
	YMDAmlL2CTDfJ3z9Q/6v7dqbEwpN0P4=
X-Google-Smtp-Source: AGHT+IHDE/cbM5Uz3mC6dPWI+SKnpmJxnVL7+eC7vPChMfg/0MfF0CSgk918tvS7UmQNdLQuffdZDw==
X-Received: by 2002:a5d:6c64:0:b0:385:f6f4:f8e with SMTP id ffacd0b85a97d-38a223ff1cemr40988273f8f.50.1736193825978;
        Mon, 06 Jan 2025 12:03:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	=?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Barrat?= <fbarrat@linux.ibm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Cameron Esfahani <dirty@apple.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	Alexander Graf <agraf@csgraf.de>,
	Paul Durrant <paul@xen.org>,
	David Hildenbrand <david@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	xen-devel@lists.xenproject.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-s390x@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>,
	Anthony PERARD <anthony@xenproject.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	"Edgar E . Iglesias" <edgar.iglesias@amd.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	David Woodhouse <dwmw2@infradead.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	qemu-ppc@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Anton Johansson <anjo@rev.ng>
Subject: [RFC PATCH 7/7] accel/kvm: Use CPU_FOREACH_KVM()
Date: Mon,  6 Jan 2025 21:02:58 +0100
Message-ID: <20250106200258.37008-8-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106200258.37008-1-philmd@linaro.org>
References: <20250106200258.37008-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Only iterate over KVM vCPUs when running KVM specific code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/system/kvm_int.h         |  3 +++
 accel/kvm/kvm-all.c              | 14 +++++++-------
 hw/i386/kvm/clock.c              |  3 ++-
 hw/intc/spapr_xive_kvm.c         |  5 +++--
 hw/intc/xics_kvm.c               |  5 +++--
 target/i386/kvm/kvm.c            |  4 ++--
 target/i386/kvm/xen-emu.c        |  2 +-
 target/s390x/kvm/kvm.c           |  2 +-
 target/s390x/kvm/stsi-topology.c |  3 ++-
 9 files changed, 24 insertions(+), 17 deletions(-)

diff --git a/include/system/kvm_int.h b/include/system/kvm_int.h
index 4de6106869b..0ef4c336b18 100644
--- a/include/system/kvm_int.h
+++ b/include/system/kvm_int.h
@@ -13,6 +13,7 @@
 #include "qapi/qapi-types-common.h"
 #include "qemu/accel.h"
 #include "qemu/queue.h"
+#include "system/hw_accel.h"
 #include "system/kvm.h"
 #include "hw/boards.h"
 #include "hw/i386/topology.h"
@@ -168,6 +169,8 @@ struct KVMState
     char *device;
 };
 
+#define CPU_FOREACH_KVM(cpu) CPU_FOREACH_HWACCEL(cpu)
+
 void kvm_memory_listener_register(KVMState *s, KVMMemoryListener *kml,
                                   AddressSpace *as, int as_id, const char *name);
 
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index c65b790433c..9b26b286865 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -872,7 +872,7 @@ static uint64_t kvm_dirty_ring_reap_locked(KVMState *s, CPUState* cpu)
     if (cpu) {
         total = kvm_dirty_ring_reap_one(s, cpu);
     } else {
-        CPU_FOREACH(cpu) {
+        CPU_FOREACH_KVM(cpu) {
             total += kvm_dirty_ring_reap_one(s, cpu);
         }
     }
@@ -935,7 +935,7 @@ static void kvm_cpu_synchronize_kick_all(void)
 {
     CPUState *cpu;
 
-    CPU_FOREACH(cpu) {
+    CPU_FOREACH_KVM(cpu) {
         run_on_cpu(cpu, do_kvm_cpu_synchronize_kick, RUN_ON_CPU_NULL);
     }
 }
@@ -3535,7 +3535,7 @@ int kvm_insert_breakpoint(CPUState *cpu, int type, vaddr addr, vaddr len)
         }
     }
 
-    CPU_FOREACH(cpu) {
+    CPU_FOREACH_KVM(cpu) {
         err = kvm_update_guest_debug(cpu, 0);
         if (err) {
             return err;
@@ -3574,7 +3574,7 @@ int kvm_remove_breakpoint(CPUState *cpu, int type, vaddr addr, vaddr len)
         }
     }
 
-    CPU_FOREACH(cpu) {
+    CPU_FOREACH_KVM(cpu) {
         err = kvm_update_guest_debug(cpu, 0);
         if (err) {
             return err;
@@ -3592,7 +3592,7 @@ void kvm_remove_all_breakpoints(CPUState *cpu)
     QTAILQ_FOREACH_SAFE(bp, &s->kvm_sw_breakpoints, entry, next) {
         if (kvm_arch_remove_sw_breakpoint(cpu, bp) != 0) {
             /* Try harder to find a CPU that currently sees the breakpoint. */
-            CPU_FOREACH(tmpcpu) {
+            CPU_FOREACH_KVM(tmpcpu) {
                 if (kvm_arch_remove_sw_breakpoint(tmpcpu, bp) == 0) {
                     break;
                 }
@@ -3603,7 +3603,7 @@ void kvm_remove_all_breakpoints(CPUState *cpu)
     }
     kvm_arch_remove_all_hw_breakpoints();
 
-    CPU_FOREACH(cpu) {
+    CPU_FOREACH_KVM(cpu) {
         kvm_update_guest_debug(cpu, 0);
     }
 }
@@ -4384,7 +4384,7 @@ static void query_stats_cb(StatsResultList **result, StatsTarget target,
         stats_args.result.stats = result;
         stats_args.names = names;
         stats_args.errp = errp;
-        CPU_FOREACH(cpu) {
+        CPU_FOREACH_KVM(cpu) {
             if (!apply_str_list_filter(cpu->parent_obj.canonical_path, targets)) {
                 continue;
             }
diff --git a/hw/i386/kvm/clock.c b/hw/i386/kvm/clock.c
index 63be5088420..f2638cf2c22 100644
--- a/hw/i386/kvm/clock.c
+++ b/hw/i386/kvm/clock.c
@@ -17,6 +17,7 @@
 #include "qemu/host-utils.h"
 #include "qemu/module.h"
 #include "system/kvm.h"
+#include "system/kvm_int.h"
 #include "system/runstate.h"
 #include "system/hw_accel.h"
 #include "kvm/kvm_i386.h"
@@ -196,7 +197,7 @@ static void kvmclock_vm_state_change(void *opaque, bool running,
         if (!cap_clock_ctrl) {
             return;
         }
-        CPU_FOREACH(cpu) {
+        CPU_FOREACH_KVM(cpu) {
             run_on_cpu(cpu, do_kvmclock_ctrl, RUN_ON_CPU_NULL);
         }
     } else {
diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
index 26d30b41c15..08354f08512 100644
--- a/hw/intc/spapr_xive_kvm.c
+++ b/hw/intc/spapr_xive_kvm.c
@@ -14,6 +14,7 @@
 #include "target/ppc/cpu.h"
 #include "system/cpus.h"
 #include "system/kvm.h"
+#include "system/kvm_int.h"
 #include "system/runstate.h"
 #include "hw/ppc/spapr.h"
 #include "hw/ppc/spapr_cpu_core.h"
@@ -678,7 +679,7 @@ int kvmppc_xive_post_load(SpaprXive *xive, int version_id)
      * 'post_load' handler of XiveTCTX because the machine is not
      * necessarily connected to the KVM device at that time.
      */
-    CPU_FOREACH(cs) {
+    CPU_FOREACH_KVM(cs) {
         PowerPCCPU *cpu = POWERPC_CPU(cs);
 
         ret = kvmppc_xive_cpu_set_state(spapr_cpu_state(cpu)->tctx, &local_err);
@@ -795,7 +796,7 @@ int kvmppc_xive_connect(SpaprInterruptController *intc, uint32_t nr_servers,
         kvmppc_xive_change_state_handler, xive);
 
     /* Connect the presenters to the initial VCPUs of the machine */
-    CPU_FOREACH(cs) {
+    CPU_FOREACH_KVM(cs) {
         PowerPCCPU *cpu = POWERPC_CPU(cs);
 
         ret = kvmppc_xive_cpu_connect(spapr_cpu_state(cpu)->tctx, errp);
diff --git a/hw/intc/xics_kvm.c b/hw/intc/xics_kvm.c
index ee72969f5f1..aed2ad44363 100644
--- a/hw/intc/xics_kvm.c
+++ b/hw/intc/xics_kvm.c
@@ -29,6 +29,7 @@
 #include "qapi/error.h"
 #include "trace.h"
 #include "system/kvm.h"
+#include "system/kvm_int.h"
 #include "hw/ppc/spapr.h"
 #include "hw/ppc/spapr_cpu_core.h"
 #include "hw/ppc/xics.h"
@@ -418,7 +419,7 @@ int xics_kvm_connect(SpaprInterruptController *intc, uint32_t nr_servers,
     kvm_gsi_direct_mapping = true;
 
     /* Create the presenters */
-    CPU_FOREACH(cs) {
+    CPU_FOREACH_KVM(cs) {
         PowerPCCPU *cpu = POWERPC_CPU(cs);
 
         icp_kvm_realize(DEVICE(spapr_cpu_state(cpu)->icp), &local_err);
@@ -434,7 +435,7 @@ int xics_kvm_connect(SpaprInterruptController *intc, uint32_t nr_servers,
     }
 
     /* Connect the presenters to the initial VCPUs of the machine */
-    CPU_FOREACH(cs) {
+    CPU_FOREACH_KVM(cs) {
         PowerPCCPU *cpu = POWERPC_CPU(cs);
         icp_set_kvm_state(spapr_cpu_state(cpu)->icp, &local_err);
         if (local_err) {
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 2f66e63b880..437911d6c6a 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -329,7 +329,7 @@ void kvm_synchronize_all_tsc(void)
     CPUState *cpu;
 
     if (kvm_enabled()) {
-        CPU_FOREACH(cpu) {
+        CPU_FOREACH_KVM(cpu) {
             run_on_cpu(cpu, do_kvm_synchronize_tsc, RUN_ON_CPU_NULL);
         }
     }
@@ -2847,7 +2847,7 @@ static void *kvm_msr_energy_thread(void *data)
          * Identify the vcpu threads
          * Calculate the number of vcpu per package
          */
-        CPU_FOREACH(cpu) {
+        CPU_FOREACH_KVM(cpu) {
             for (int i = 0; i < num_threads; i++) {
                 if (cpu->thread_id == thd_stat[i].thread_id) {
                     thd_stat[i].is_vcpu = true;
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index e81a2458812..36ae9c11252 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -1422,7 +1422,7 @@ int kvm_xen_soft_reset(void)
         return err;
     }
 
-    CPU_FOREACH(cpu) {
+    CPU_FOREACH_KVM(cpu) {
         async_run_on_cpu(cpu, do_vcpu_soft_reset, RUN_ON_CPU_NULL);
     }
 
diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index db645a48133..a02e78ce807 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -1559,7 +1559,7 @@ static void handle_diag_318(S390CPU *cpu, struct kvm_run *run)
         return;
     }
 
-    CPU_FOREACH(t) {
+    CPU_FOREACH_KVM(t) {
         run_on_cpu(t, s390_do_cpu_set_diag318,
                    RUN_ON_CPU_HOST_ULONG(diag318_info));
     }
diff --git a/target/s390x/kvm/stsi-topology.c b/target/s390x/kvm/stsi-topology.c
index c8d6389cd87..cf1a9b5d218 100644
--- a/target/s390x/kvm/stsi-topology.c
+++ b/target/s390x/kvm/stsi-topology.c
@@ -10,6 +10,7 @@
 #include "cpu.h"
 #include "hw/s390x/sclp.h"
 #include "hw/s390x/cpu-topology.h"
+#include "system/kvm_int.h"
 
 QEMU_BUILD_BUG_ON(S390_CPU_ENTITLEMENT_LOW != 1);
 QEMU_BUILD_BUG_ON(S390_CPU_ENTITLEMENT_MEDIUM != 2);
@@ -256,7 +257,7 @@ static void s390_topology_fill_list_sorted(S390TopologyList *topology_list)
 
     QTAILQ_INSERT_HEAD(topology_list, &sentinel, next);
 
-    CPU_FOREACH(cs) {
+    CPU_FOREACH_KVM(cs) {
         S390TopologyId id = s390_topology_from_cpu(S390_CPU(cs));
         S390TopologyEntry *entry = NULL, *tmp;
 
-- 
2.47.1


