Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DBC45EEA2
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:07:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232786.403825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqawT-0004aU-RG; Fri, 26 Nov 2021 13:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232786.403825; Fri, 26 Nov 2021 13:07:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqawS-0004OW-SF; Fri, 26 Nov 2021 13:07:04 +0000
Received: by outflank-mailman (input) for mailman id 232786;
 Fri, 26 Nov 2021 13:07:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqavX-0003W9-Lx
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:06:07 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ce993e1-4eb9-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 14:06:06 +0100 (CET)
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
X-Inumbo-ID: 9ce993e1-4eb9-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931966;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2fDXaXazfQXnz7/03KLLc3+HD6+G8OCzegB9VcGT+sI=;
  b=WovLxch8km54ezVS+a9dQ6Q7/ObjK2lERKNO/Idq2EndtfXzU5PI34XK
   VSrSsB+RAHTK03jgnNrHgV+q2nLjBUW9fLaGQICBuH5Z6ujeI+uTU8ddA
   nuDGWdtpUA30U5OHjlyxA6YOOPiscbGywAchY2JP1MvfGx65oun+AZZNU
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: H7eJka3pBj2/5aSyGooWyhODYdOVTBX01pBZ5HMUYXzwrHQw4N6Zdx1JYCRe50dDcV/mKhyJ2o
 LdYbbBeM/1MTbhnLwBzgvKOn1s+jxIj/stEL2Gui/z8TpKvY1XES7C9b4sISxBbZSqMWx3cDxD
 ar8pSf/w0TiYno9nnU/Son6DixDzgk6lyk6q0agLrYieBwnq3o30EX+qMQ2uRLo9fPLGFC7Ejq
 dsyMnngAVpHjObqjzBrS/AA7EzjtU2nWqur3/+nG5c1xfjAhBCpUPOF7dOtinOBXOjdpWnR5x3
 KjnjhwXYY5YH/SFeVWULJ23M
X-SBRS: 5.1
X-MesageID: 58696036
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:n1cAIqDBJfxo0xVW/9zkw5YqxClBgxIJ4kV8jS/XYbTApDMr0TFVy
 DcbW2uPafncZjH1c40jbduw8R9TsJPSxoRmQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX5400w7wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/kG+qh+Fhy
 4R0qcKgRj53OrPlhrg6XEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcFjGlh2JgVQ54yY
 eIXMmdpaSnrZyZxYFRPM7U8n7ezjWfWJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tkSFo
 mPL+UzpDxdcM8aQoRKe6W6ljOLLmSL9WaoRGae++/osh0ecrkQDBRtTWValrP2Rjk+lR8kZO
 0ES4jApr6U56AqsVNaVdz+SrWOAvxUcc8FNCOB84waIopc4+C7AWDJCFGQYLoV76olmHlTGy
 2NlgfvyXx93ga2WGEuBqKeblG22JwELcUgNMHpsoRQ+3/Hvp4Q6jxTqR9llEbKogtCdJQwc0
 wxmvwBl2exN0JdjO7GTuAme3mny/sShohsdv12PBgqYAhVFiJlJjmBCwXzS9r5+IYmQVTFtV
 1BUypHFvIji4Xxg/RFhodnh/pn1uJ5p0xWG2DaD+qXNERz2oBZPmqgKvVlDyL9BaJpsRNMQS
 Ba7VfltzJFSJmC2SqR8fpi8Dc8npYC5S4+6Bq6JMYsSPMQqHONiwM2ITRXLt4wKuBJx+ZzTx
 L/BKZr8ZZrkIfgPIMWKqxc1juZwm3FWKZL7TpHn1RW3uYdyl1bOIYrpxGCmN7hjhIvd+V292
 48Ga6OilkUOOMWjM3K/2dNCcjg3wY0TWMmeRzp/LbXYfGKL2QgJVpfs/F/WU9A/wvkOyL6Xp
 irVt40x4AOXuEAr4D6iMhhLAI4Dl74mxZ7iFSBzb1uuxVY5ZoOjsPUWe5ctJOF1/+1/1/9kC
 fICfpzYUPhITz3G/RUbbIX889M+JEj621rWMnr3eiU7cr5hWxfNpo3ucDzw+XRcFSGwr8Y//
 eGtj1uJXZoZSg1+J8/Kc/bznUiptH0QlbsqDUvFK9VeYmv2941uJ3Cjh/M7OZhUex7C2iGbx
 0CdBhJB/bvBpIo88d/og6GYrtj2T7siTxQCR2SCtOS4LyjX+Gan0LRsaufQcGCPTn7w9YWje
 f5Rk6P2PsoYkQsYqIF7Cbtqk/4zvoO9u79Aww14N3zXdFD3WKh4K3yL0MQT5K1AwrhV5Vm/V
 k6Vo4QIPLyIPIXuEUILJRpjZeOGjKlGlj7X5PUzAUP7+C4oo+bXDRQMZ0GB2H5HMb94EII52
 uNw6scZ5ju2hgcuLtvb3Dtf8H6BLyBYXqgq3n3A7FQHVub/Jol+XKHh
IronPort-HdrOrdr: A9a23:iinLz6GjHL60mLg8pLqE0MeALOsnbusQ8zAXP0AYc3Jom6uj5r
 mTdZUgpHnJYVkqOE3I9ertBEDEewK4yXcX2/h3AV7BZniEhILAFugLhuGO/9SjIVybygc079
 YZT0EUMrzN5DZB4voSmDPIceod/A==
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="58696036"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 19/65] xen/tasklet: Annotate fnptr targets
Date: Fri, 26 Nov 2021 12:34:00 +0000
Message-ID: <20211126123446.32324-20-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The function pointer cast in hvm_vcpu_initialise() is undefined behaviour.

While it happens to function correctly before this point, it is not
incompatible with control flow typechecking, so introduce a new
hvm_assert_evtchn_irq_tasklet() to handle the parameter type conversion in a
legal way.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/hvm.c                    | 7 ++++++-
 xen/arch/x86/hvm/vlapic.c                 | 2 +-
 xen/arch/x86/mm/shadow/common.c           | 2 +-
 xen/common/domain.c                       | 2 +-
 xen/common/keyhandler.c                   | 6 +++---
 xen/common/livepatch.c                    | 2 +-
 xen/common/stop_machine.c                 | 2 +-
 xen/common/trace.c                        | 2 +-
 xen/drivers/char/console.c                | 2 +-
 xen/drivers/passthrough/amd/iommu_guest.c | 2 +-
 xen/drivers/passthrough/amd/iommu_init.c  | 4 ++--
 xen/drivers/passthrough/arm/smmu-v3.c     | 6 +++---
 xen/drivers/passthrough/vtd/iommu.c       | 2 +-
 xen/include/asm-x86/shadow.h              | 2 +-
 14 files changed, 24 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 0e935be1d772..16e8a32fa768 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1540,6 +1540,11 @@ static int __init cf_check hvm_register_CPU_save_and_restore(void)
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
@@ -1563,7 +1568,7 @@ int hvm_vcpu_initialise(struct vcpu *v)
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
diff --git a/xen/arch/x86/mm/shadow/common.c b/xen/arch/x86/mm/shadow/common.c
index 1e4ee50771f5..b8cacbefef5f 100644
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -3242,7 +3242,7 @@ void shadow_audit_tables(struct vcpu *v)
 
 #ifdef CONFIG_PV
 
-void pv_l1tf_tasklet(void *data)
+void cf_check pv_l1tf_tasklet(void *data)
 {
     struct domain *d = data;
 
diff --git a/xen/common/domain.c b/xen/common/domain.c
index a8b6ee59587c..4fcf9e23911f 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1833,7 +1833,7 @@ struct migrate_info {
 
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
index 0886be089bea..53978466cf92 100644
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
 
diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index d115df732016..5e74266da21e 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -1475,7 +1475,7 @@ static int arm_smmu_init_l2_strtab(struct arm_smmu_device *smmu, u32 sid)
 }
 
 /* IRQ and event handlers */
-static void arm_smmu_evtq_tasklet(void *dev)
+static void cf_check arm_smmu_evtq_tasklet(void *dev)
 {
 	int i;
 	struct arm_smmu_device *smmu = dev;
@@ -1545,7 +1545,7 @@ static void arm_smmu_handle_ppr(struct arm_smmu_device *smmu, u64 *evt)
 	}
 }
 
-static void arm_smmu_priq_tasklet(void *dev)
+static void cf_check arm_smmu_priq_tasklet(void *dev)
 {
 	struct arm_smmu_device *smmu = dev;
 	struct arm_smmu_queue *q = &smmu->priq.q;
@@ -1624,7 +1624,7 @@ static void arm_smmu_combined_irq_handler(int irq, void *dev,
 	tasklet_schedule(&(smmu->combined_irq_tasklet));
 }
 
-static void arm_smmu_combined_irq_tasklet(void *dev)
+static void cf_check arm_smmu_combined_irq_tasklet(void *dev)
 {
 	struct arm_smmu_device *smmu = dev;
 
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index ba1ed5761d23..23519f2081bb 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1065,7 +1065,7 @@ static void __do_iommu_page_fault(struct vtd_iommu *iommu)
     }
 }
 
-static void do_iommu_page_fault(void *unused)
+static void cf_check do_iommu_page_fault(void *unused)
 {
     struct acpi_drhd_unit *drhd;
 
diff --git a/xen/include/asm-x86/shadow.h b/xen/include/asm-x86/shadow.h
index e25f9604d896..7ef76cc0635b 100644
--- a/xen/include/asm-x86/shadow.h
+++ b/xen/include/asm-x86/shadow.h
@@ -233,7 +233,7 @@ static inline bool pv_l1tf_check_l4e(struct domain *d, l4_pgentry_t l4e)
     return pv_l1tf_check_pte(d, 4, l4e.l4);
 }
 
-void pv_l1tf_tasklet(void *data);
+void cf_check pv_l1tf_tasklet(void *data);
 
 static inline void pv_l1tf_domain_init(struct domain *d)
 {
-- 
2.11.0


