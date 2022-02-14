Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C83DA4B5115
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:06:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271713.466374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb3b-0008WA-Ho; Mon, 14 Feb 2022 13:06:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271713.466374; Mon, 14 Feb 2022 13:06:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb3b-0008Fe-2K; Mon, 14 Feb 2022 13:06:19 +0000
Received: by outflank-mailman (input) for mailman id 271713;
 Mon, 14 Feb 2022 13:06:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb35-0008IH-46
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:05:47 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d214b42f-8d96-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:05:45 +0100 (CET)
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
X-Inumbo-ID: d214b42f-8d96-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843945;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=cecI+FT44l503L9yO+BFfcS5GuY0TLog87wC0Mx5p8E=;
  b=O38jx71Zul2bjj1rBV6saBgq7h73AZZqdOR4WfXA2ZBD7BWZcSj28j50
   HY5vlczv7P53mFkiPtqaI05RehnRDj7s7zsMWDYjEfRUpcEkfcU3+T/ri
   0clt9S+IV04H07oaRtbP+hY/QOpIsCBbZChJeNYrAQFOP2an3YbEWbwMY
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: vuaVnpiE5/1VbUEBdoc2AlO5mmSNnFUgbdKKI2IOLHaiq6jyqa/Mn4FpVnPXXszc6kH9GYqlLb
 gSeLTktCqP+0rfKjCvIzUqyVBuyHAGv3L9JoiXgBqO6qGW593IugZwb1CQFWlU2i+aXgYJT1Tx
 sacDZZIirfHeeHsrykrZeLrMjslr+KaSTbggrjTaQjIXR3lvC12B8zTdi9IafYSebzEw9HY82a
 KoqP81SzWAFN04S/uePItXnqyPqjy4I/RxyJIpAhdRZCcCb9XkYFMIDVWMsV+QIQY53gqu+PUL
 Z49Y/4s4hJnOJR2Ytmcvbo7c
X-SBRS: 5.1
X-MesageID: 63592652
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Z2RLJK2Z7uUo8pkPHvbD5c12kn2cJEfYwER7XKvMYLTBsI5bpzAAn
 WodCzvTb/bbZGrye9xzOtvi/UgEvZfcm9NhSgNrpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o5wrJh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhxcxX2
 tJunpuLe1k1P/PFqOM/TgFiOnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Er8IvNsT0eqgYvWlt12rxBvc6W5HTBa7N4Le02R9u3Z0fR6iDP
 aL1bxIzXBvZfkBiCG0NS6oDlcr5r2fWV21x/Qf9Sa0fvDGIkV0ZPKLWGMrYfJmGSNtYmm6cp
 3na5CLpDxcCLtudxDGZtHW2iYfycTjTAdxIUufir7gz3QPVljd75AAquUWT++WfmEmdcNVkG
 RII+3Qnna8Q6VSRZ4yoN/Gnm0KsshkZUttWNuQ17gCR16bZizqk6ng4oi1pM4J/6pJvLdA+/
 hrQxo6yW2Qz2FGAYS/Frt+pQSWO1T/5xIPoTQsNVkM77tbqu+nfZTqfH484QMZZYjAYcAwcI
 gxmTgBj3d3/buZRjs1XGGwrZBr2+PD0ovYdvFm/Y45cxloRiHSZT4Kp80PHyv1LMZyUSFKM1
 FBdxZTCs7BeUMzVzXfXKAnoIF1Oz6zbWAAwfHY1R8Vxn9hT0yLLkX9sDMFWex4yb5dslc7Ba
 07PowJBjKK/z1PxBZKbl7mZUpxwpYC5TIyNfqmNMrJmP8ggHCfarXoGTRPBgAjQfL0EzPhX1
 WGzKp33Ux73yM1PkVKLegvq+eF3l35unTuJHfgWDX2PiNKjWZJccp9dWHPmUwzzxPrsTNz9/
 4kNOs2U5Q9YVeGiMCDb/ZRKdQIBLGQhBICwoMtSL7bRLg1jEWAnKvnQ3bJ+JNA1w/ULzr/Fr
 iOnR0tV6Fvjnnmbew+EXW9uNeH0VpFloHNlYSF1ZQS022IuaJqE5bsEc8dlZqEu8eFulKYmT
 /QMd8iaLO5ITzDLp2YUYZXn9dQwfxW3nwOeeSGiZWFnLZJnQgXI/P7ifxfuq3ZSXnbm65Nmr
 uT5hA3BQJcFSwBzN+rsaaqinwGroHwQuONuRE+UcNNdT1rhrdpxICvrg/5pf8xVcUffxiGX3
 hq9CAsDobWfuJc89dTEiPzWr4qtFOciTENWE3OCsOSzPCjeuGGi3ZVBQKCDejWEDDH4/6CrZ
 ON0yfDgMaJYwAYW4tQkS7s7n7gj49bPpqNBylU2FXrGWF2nF7d8LyTUxsJIrKBMmudUtAbet
 phjITWG1WFl4P/YLWM=
IronPort-HdrOrdr: A9a23:PWc8jarwhvv7Qligx5fKpGkaV5opeYIsimQD101hICG8cqSj+f
 xG/c5rrCMc5wxwZJhNo7y90ey7MBbhHP1OkO8s1NWZLWrbUQKTRekIh+bfKn/baknDH4ZmpM
 BdmsNFaeEYY2IUsS+D2njbL+od
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="63592652"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 23/70] xen/tasklet: CFI hardening
Date: Mon, 14 Feb 2022 12:50:40 +0000
Message-ID: <20220214125127.17985-24-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

The function pointer cast in hvm_vcpu_initialise() is undefined behaviour.

While it happens to function correctly, it is not compatible with control flow
typechecking, so introduce a new hvm_assert_evtchn_irq_tasklet() to handle the
parameter type conversion in a legal way.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v2:
 * Fix typo in commit message.
 * Drop changes to arm-only driver.
---
 xen/arch/x86/hvm/hvm.c                    | 7 ++++++-
 xen/arch/x86/hvm/vlapic.c                 | 2 +-
 xen/arch/x86/include/asm/shadow.h         | 2 +-
 xen/arch/x86/mm/shadow/common.c           | 2 +-
 xen/common/domain.c                       | 2 +-
 xen/common/keyhandler.c                   | 6 +++---
 xen/common/livepatch.c                    | 2 +-
 xen/common/stop_machine.c                 | 2 +-
 xen/common/trace.c                        | 2 +-
 xen/drivers/char/console.c                | 2 +-
 xen/drivers/passthrough/amd/iommu_guest.c | 2 +-
 xen/drivers/passthrough/amd/iommu_init.c  | 4 ++--
 xen/drivers/passthrough/vtd/iommu.c       | 2 +-
 13 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 0a193530680a..5ec10f30803e 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1528,6 +1528,11 @@ static int __init cf_check hvm_register_CPU_save_and_restore(void)
 }
 __initcall(hvm_register_CPU_save_and_restore);
 
+static void cf_check hvm_assert_evtchn_irq_tasklet(void *v)
+{
+    hvm_assert_evtchn_irq(v);
+}
+
 int hvm_vcpu_initialise(struct vcpu *v)
 {
     int rc;
@@ -1552,7 +1557,7 @@ int hvm_vcpu_initialise(struct vcpu *v)
         goto fail3;
 
     softirq_tasklet_init(&v->arch.hvm.assert_evtchn_irq_tasklet,
-                         (void (*)(void *))hvm_assert_evtchn_irq, v);
+                         hvm_assert_evtchn_irq_tasklet, v);
 
     v->arch.hvm.inject_event.vector = HVM_EVENT_VECTOR_UNSET;
 
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index b8c84458ffdc..fe375912bef1 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -312,7 +312,7 @@ static void vlapic_init_sipi_one(struct vcpu *target, uint32_t icr)
     vcpu_unpause(target);
 }
 
-static void vlapic_init_sipi_action(void *data)
+static void cf_check vlapic_init_sipi_action(void *data)
 {
     struct vcpu *origin = data;
     uint32_t icr = vcpu_vlapic(origin)->init_sipi.icr;
diff --git a/xen/arch/x86/include/asm/shadow.h b/xen/arch/x86/include/asm/shadow.h
index e25f9604d896..7ef76cc0635b 100644
--- a/xen/arch/x86/include/asm/shadow.h
+++ b/xen/arch/x86/include/asm/shadow.h
@@ -233,7 +233,7 @@ static inline bool pv_l1tf_check_l4e(struct domain *d, l4_pgentry_t l4e)
     return pv_l1tf_check_pte(d, 4, l4e.l4);
 }
 
-void pv_l1tf_tasklet(void *data);
+void cf_check pv_l1tf_tasklet(void *data);
 
 static inline void pv_l1tf_domain_init(struct domain *d)
 {
diff --git a/xen/arch/x86/mm/shadow/common.c b/xen/arch/x86/mm/shadow/common.c
index b8730a9441ce..fb370af90b5c 100644
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -3242,7 +3242,7 @@ void shadow_audit_tables(struct vcpu *v)
 
 #ifdef CONFIG_PV
 
-void pv_l1tf_tasklet(void *data)
+void cf_check pv_l1tf_tasklet(void *data)
 {
     struct domain *d = data;
 
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 32ec156e6f6a..a49c26064601 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1824,7 +1824,7 @@ struct migrate_info {
 
 static DEFINE_PER_CPU(struct migrate_info *, continue_info);
 
-static void continue_hypercall_tasklet_handler(void *data)
+static void cf_check continue_hypercall_tasklet_handler(void *data)
 {
     struct migrate_info *info = data;
     struct vcpu *v = info->vcpu;
diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
index 2c916d528ab2..b568484ca62c 100644
--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -73,7 +73,7 @@ static struct keyhandler {
 #undef KEYHANDLER
 };
 
-static void keypress_action(void *unused)
+static void cf_check keypress_action(void *unused)
 {
     handle_keypress(keypress_key, NULL);
 }
@@ -206,7 +206,7 @@ static void dump_registers(unsigned char key, struct cpu_user_regs *regs)
 
 static DECLARE_TASKLET(dump_hwdom_tasklet, NULL, NULL);
 
-static void dump_hwdom_action(void *data)
+static void cf_check dump_hwdom_action(void *data)
 {
     struct vcpu *v = data;
 
@@ -437,7 +437,7 @@ static void read_clocks(unsigned char key)
            maxdif_cycles, sumdif_cycles/count, count, dif_cycles);
 }
 
-static void run_all_nonirq_keyhandlers(void *unused)
+static void cf_check run_all_nonirq_keyhandlers(void *unused)
 {
     /* Fire all the non-IRQ-context diagnostic keyhandlers */
     struct keyhandler *h;
diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index 701efd87a173..4e1c29ab7879 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -1591,7 +1591,7 @@ static int schedule_work(struct payload *data, uint32_t cmd, uint32_t timeout)
     return 0;
 }
 
-static void tasklet_fn(void *unused)
+static void cf_check tasklet_fn(void *unused)
 {
     this_cpu(work_to_do) = 1;
 }
diff --git a/xen/common/stop_machine.c b/xen/common/stop_machine.c
index a122bd4afe09..3adbe380de96 100644
--- a/xen/common/stop_machine.c
+++ b/xen/common/stop_machine.c
@@ -141,7 +141,7 @@ int stop_machine_run(int (*fn)(void *), void *data, unsigned int cpu)
     return ret;
 }
 
-static void stopmachine_action(void *data)
+static void cf_check stopmachine_action(void *data)
 {
     unsigned int cpu = (unsigned long)data;
     enum stopmachine_state state = STOPMACHINE_START;
diff --git a/xen/common/trace.c b/xen/common/trace.c
index b5358508f804..a7c092fcbbe9 100644
--- a/xen/common/trace.c
+++ b/xen/common/trace.c
@@ -663,7 +663,7 @@ static inline void insert_lost_records(struct t_buf *buf)
  * Notification is performed in qtasklet to avoid deadlocks with contexts
  * which __trace_var() may be called from (e.g., scheduler critical regions).
  */
-static void trace_notify_dom0(void *unused)
+static void cf_check trace_notify_dom0(void *unused)
 {
     send_global_virq(VIRQ_TBUF);
 }
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 4694be83db45..d74b65f6bf23 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -574,7 +574,7 @@ static void serial_rx(char c, struct cpu_user_regs *regs)
     __serial_rx(c, regs);
 }
 
-static void notify_dom0_con_ring(void *unused)
+static void cf_check notify_dom0_con_ring(void *unused)
 {
     send_global_virq(VIRQ_CON_RING);
 }
diff --git a/xen/drivers/passthrough/amd/iommu_guest.c b/xen/drivers/passthrough/amd/iommu_guest.c
index 85828490ffee..361ff864d846 100644
--- a/xen/drivers/passthrough/amd/iommu_guest.c
+++ b/xen/drivers/passthrough/amd/iommu_guest.c
@@ -456,7 +456,7 @@ static int do_invalidate_dte(struct domain *d, cmd_entry_t *cmd)
     return 0;
 }
 
-static void guest_iommu_process_command(void *data)
+static void cf_check guest_iommu_process_command(void *data)
 {
     unsigned long opcode, tail, head, cmd_mfn;
     cmd_entry_t *cmd;
diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
index f1ed75558227..34a9e49f1c5a 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -26,7 +26,7 @@
 static int __initdata nr_amd_iommus;
 static bool __initdata pci_init;
 
-static void do_amd_iommu_irq(void *data);
+static void cf_check do_amd_iommu_irq(void *data);
 static DECLARE_SOFTIRQ_TASKLET(amd_iommu_irq_tasklet, do_amd_iommu_irq, NULL);
 
 unsigned int __read_mostly amd_iommu_acpi_info;
@@ -692,7 +692,7 @@ static void iommu_check_ppr_log(struct amd_iommu *iommu)
     spin_unlock_irqrestore(&iommu->lock, flags);
 }
 
-static void do_amd_iommu_irq(void *unused)
+static void cf_check do_amd_iommu_irq(void *unused)
 {
     struct amd_iommu *iommu;
 
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index 9e85016830bf..7a9c391bec70 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1097,7 +1097,7 @@ static void __do_iommu_page_fault(struct vtd_iommu *iommu)
     }
 }
 
-static void do_iommu_page_fault(void *unused)
+static void cf_check do_iommu_page_fault(void *unused)
 {
     struct acpi_drhd_unit *drhd;
 
-- 
2.11.0


