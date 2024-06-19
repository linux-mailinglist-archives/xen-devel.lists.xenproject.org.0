Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7026F90E713
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 11:30:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743580.1150501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJrdF-0003UI-QD; Wed, 19 Jun 2024 09:29:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743580.1150501; Wed, 19 Jun 2024 09:29:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJrdF-0003Rc-NY; Wed, 19 Jun 2024 09:29:33 +0000
Received: by outflank-mailman (input) for mailman id 743580;
 Wed, 19 Jun 2024 09:29:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mh+g=NV=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sJrdE-0003RW-L8
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 09:29:32 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e642c78-2e1e-11ef-90a3-e314d9c70b13;
 Wed, 19 Jun 2024 11:29:31 +0200 (CEST)
Received: from truciolo.bugseng.com (unknown [37.161.166.217])
 by support.bugseng.com (Postfix) with ESMTPSA id A5CE74EE0738;
 Wed, 19 Jun 2024 11:29:28 +0200 (CEST)
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
X-Inumbo-ID: 6e642c78-2e1e-11ef-90a3-e314d9c70b13
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH v2] xen: add explicit comment to identify notifier patterns
Date: Wed, 19 Jun 2024 11:29:22 +0200
Message-Id: <d814434bf73e341f5d35836fa7063a728f7b7de4.1718788908.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 16.4 states that every `switch' statement shall have a
`default' label" and a statement or a comment prior to the
terminating break statement.

This patch addresses some violations of the rule related to the
"notifier pattern": a frequently-used pattern whereby only a few values
are handled by the switch statement and nothing should be done for
others (nothing to do in the default case).

Note that for function mwait_idle_cpu_init() in
xen/arch/x86/cpu/mwait-idle.c the /* Notifier pattern. */ comment is
not added: differently from the other functions covered in this patch,
the default label has a return statement that does not violates Rule 16.4.

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Changes in v2:
as Jan pointed out, in the v1 some patterns were not explicitly identified
(https://lore.kernel.org/xen-devel/cad05a5c-e2d8-4e5d-af05-30ae6f959184@bugseng.com/).

This version adds the /* Notifier pattern. */ to all the pattern present in
the Xen codebase except for mwait_idle_cpu_init().
---
 xen/arch/arm/cpuerrata.c                     | 1 +
 xen/arch/arm/gic-v3-lpi.c                    | 4 ++++
 xen/arch/arm/gic.c                           | 1 +
 xen/arch/arm/irq.c                           | 4 ++++
 xen/arch/arm/mmu/p2m.c                       | 1 +
 xen/arch/arm/percpu.c                        | 1 +
 xen/arch/arm/smpboot.c                       | 1 +
 xen/arch/arm/time.c                          | 1 +
 xen/arch/arm/vgic-v3-its.c                   | 2 ++
 xen/arch/x86/acpi/cpu_idle.c                 | 4 ++++
 xen/arch/x86/cpu/mcheck/mce.c                | 4 ++++
 xen/arch/x86/cpu/mcheck/mce_intel.c          | 4 ++++
 xen/arch/x86/genapic/x2apic.c                | 3 +++
 xen/arch/x86/hvm/hvm.c                       | 1 +
 xen/arch/x86/nmi.c                           | 1 +
 xen/arch/x86/percpu.c                        | 3 +++
 xen/arch/x86/psr.c                           | 3 +++
 xen/arch/x86/smpboot.c                       | 3 +++
 xen/common/kexec.c                           | 1 +
 xen/common/rcupdate.c                        | 1 +
 xen/common/sched/core.c                      | 1 +
 xen/common/sched/cpupool.c                   | 1 +
 xen/common/spinlock.c                        | 1 +
 xen/common/tasklet.c                         | 1 +
 xen/common/timer.c                           | 1 +
 xen/drivers/cpufreq/cpufreq.c                | 1 +
 xen/drivers/cpufreq/cpufreq_misc_governors.c | 3 +++
 xen/drivers/passthrough/x86/hvm.c            | 3 +++
 xen/drivers/passthrough/x86/iommu.c          | 3 +++
 29 files changed, 59 insertions(+)

diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
index 2b7101ea25..69c30aecd8 100644
--- a/xen/arch/arm/cpuerrata.c
+++ b/xen/arch/arm/cpuerrata.c
@@ -730,6 +730,7 @@ static int cpu_errata_callback(struct notifier_block *nfb,
         rc = enable_nonboot_cpu_caps(arm_errata);
         break;
     default:
+        /* Notifier pattern. */
         break;
     }
 
diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
index eb0a5535e4..4c2bd35403 100644
--- a/xen/arch/arm/gic-v3-lpi.c
+++ b/xen/arch/arm/gic-v3-lpi.c
@@ -389,6 +389,10 @@ static int cpu_callback(struct notifier_block *nfb, unsigned long action,
             printk(XENLOG_ERR "Unable to allocate the pendtable for CPU%lu\n",
                    cpu);
         break;
+
+    default:
+        /* Notifier pattern. */
+        break;
     }
 
     return notifier_from_errno(rc);
diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index 3eaf670fd7..dc5408a456 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -463,6 +463,7 @@ static int cpu_gic_callback(struct notifier_block *nfb,
         release_irq(gic_hw_ops->info->maintenance_irq, NULL);
         break;
     default:
+        /* Notifier pattern. */
         break;
     }
 
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index c60502444c..61ca6f5b87 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -127,6 +127,10 @@ static int cpu_callback(struct notifier_block *nfb, unsigned long action,
             printk(XENLOG_ERR "Unable to allocate local IRQ for CPU%u\n",
                    cpu);
         break;
+
+    default:
+        /* Notifier pattern. */
+        break;
     }
 
     return notifier_from_errno(rc);
diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 1725cca649..bf7c66155d 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -1839,6 +1839,7 @@ static int cpu_virt_paging_callback(struct notifier_block *nfb,
         setup_virt_paging_one(NULL);
         break;
     default:
+        /* Notifier pattern. */
         break;
     }
 
diff --git a/xen/arch/arm/percpu.c b/xen/arch/arm/percpu.c
index 87fe960330..81f91f05bb 100644
--- a/xen/arch/arm/percpu.c
+++ b/xen/arch/arm/percpu.c
@@ -66,6 +66,7 @@ static int cpu_percpu_callback(
         free_percpu_area(cpu);
         break;
     default:
+        /* Notifier pattern. */
         break;
     }
 
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 04e363088d..3d481e59f9 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -591,6 +591,7 @@ static int cpu_smpboot_callback(struct notifier_block *nfb,
         remove_cpu_sibling_map(cpu);
         break;
     default:
+        /* Notifier pattern. */
         break;
     }
 
diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
index e74d30d258..27cbfae874 100644
--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -382,6 +382,7 @@ static int cpu_time_callback(struct notifier_block *nfb,
         deinit_timer_interrupt();
         break;
     default:
+        /* Notifier pattern. */
         break;
     }
 
diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
index 70b5aeb822..a33ff64ff2 100644
--- a/xen/arch/arm/vgic-v3-its.c
+++ b/xen/arch/arm/vgic-v3-its.c
@@ -1194,6 +1194,7 @@ static void sanitize_its_base_reg(uint64_t *reg)
         r |= GIC_BASER_InnerShareable << GITS_BASER_SHAREABILITY_SHIFT;
         break;
     default:
+        /* Notifier pattern. */
         break;
     }
 
@@ -1206,6 +1207,7 @@ static void sanitize_its_base_reg(uint64_t *reg)
         r |= GIC_BASER_CACHE_RaWb << GITS_BASER_INNER_CACHEABILITY_SHIFT;
         break;
     default:
+        /* Notifier pattern. */
         break;
     }
 
diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index 57ac984790..f0af32e578 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -1661,6 +1661,10 @@ static int cf_check cpu_callback(
              processor_powers[cpu] )
             amd_cpuidle_init(processor_powers[cpu]);
         break;
+
+    default:
+        /* Notifier pattern. */
+        break;
     }
 
     return notifier_from_errno(rc);
diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
index 32c1b2756b..222b174bbb 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -722,6 +722,10 @@ static int cf_check cpu_callback(
         if ( park_offline_cpus )
             cpu_bank_free(cpu);
         break;
+
+    default:
+        /* Notifier pattern. */
+        break;
     }
 
     return notifier_from_errno(rc);
diff --git a/xen/arch/x86/cpu/mcheck/mce_intel.c b/xen/arch/x86/cpu/mcheck/mce_intel.c
index dd812f4b8a..be82ea4631 100644
--- a/xen/arch/x86/cpu/mcheck/mce_intel.c
+++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
@@ -949,6 +949,10 @@ static int cf_check cpu_callback(
         cpu_mcheck_distribute_cmci();
         cpu_mcabank_free(cpu);
         break;
+
+    default:
+        /* Notifier pattern. */
+        break;
     }
 
     return notifier_from_errno(rc);
diff --git a/xen/arch/x86/genapic/x2apic.c b/xen/arch/x86/genapic/x2apic.c
index 371dd100c7..d271102f9f 100644
--- a/xen/arch/x86/genapic/x2apic.c
+++ b/xen/arch/x86/genapic/x2apic.c
@@ -238,6 +238,9 @@ static int cf_check update_clusterinfo(
         }
         FREE_CPUMASK_VAR(per_cpu(scratch_mask, cpu));
         break;
+    default:
+        /* Notifier pattern. */
+        break;
     }
 
     return notifier_from_errno(err);
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 8334ab1711..00c360cf24 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -123,6 +123,7 @@ static int cf_check cpu_callback(
         alternative_vcall(hvm_funcs.cpu_dead, cpu);
         break;
     default:
+        /* Notifier pattern. */
         break;
     }
 
diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
index 9793fa2316..105efa5a71 100644
--- a/xen/arch/x86/nmi.c
+++ b/xen/arch/x86/nmi.c
@@ -434,6 +434,7 @@ static int cf_check cpu_nmi_callback(
         kill_timer(&per_cpu(nmi_timer, cpu));
         break;
     default:
+        /* Notifier pattern. */
         break;
     }
 
diff --git a/xen/arch/x86/percpu.c b/xen/arch/x86/percpu.c
index 3205eacea6..627b56b9f3 100644
--- a/xen/arch/x86/percpu.c
+++ b/xen/arch/x86/percpu.c
@@ -84,6 +84,9 @@ static int cf_check cpu_percpu_callback(
         if ( park_offline_cpus )
             free_percpu_area(cpu);
         break;
+    default:
+        /* Notifier pattern. */
+        break;
     }
 
     return notifier_from_errno(rc);
diff --git a/xen/arch/x86/psr.c b/xen/arch/x86/psr.c
index 0b9631ac44..e76b129e6c 100644
--- a/xen/arch/x86/psr.c
+++ b/xen/arch/x86/psr.c
@@ -1661,6 +1661,9 @@ static int cf_check cpu_callback(
     case CPU_DEAD:
         psr_cpu_fini(cpu);
         break;
+    default:
+        /* Notifier pattern. */
+        break;
     }
 
     return notifier_from_errno(rc);
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 8aa621533f..5b9b196d58 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -1134,6 +1134,9 @@ static int cf_check cpu_smpboot_callback(
     case CPU_REMOVE:
         cpu_smpboot_free(cpu, true);
         break;
+    default:
+        /* Notifier pattern. */
+        break;
     }
 
     return notifier_from_errno(rc);
diff --git a/xen/common/kexec.c b/xen/common/kexec.c
index 84fe8c3597..96883cdc70 100644
--- a/xen/common/kexec.c
+++ b/xen/common/kexec.c
@@ -549,6 +549,7 @@ static int cf_check cpu_callback(
         kexec_init_cpu_notes(cpu);
         break;
     default:
+        /* Notifier pattern. */
         break;
     }
     return NOTIFY_DONE;
diff --git a/xen/common/rcupdate.c b/xen/common/rcupdate.c
index 212a99acd8..0fe4097544 100644
--- a/xen/common/rcupdate.c
+++ b/xen/common/rcupdate.c
@@ -657,6 +657,7 @@ static int cf_check cpu_callback(
         rcu_offline_cpu(&this_cpu(rcu_data), &rcu_ctrlblk, rdp);
         break;
     default:
+        /* Notifier pattern. */
         break;
     }
 
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index d84b65f197..dffa1ef476 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -2907,6 +2907,7 @@ static int cf_check cpu_schedule_callback(
         cpu_schedule_down(cpu);
         break;
     default:
+        /* Notifier pattern. */
         break;
     }
 
diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index ad8f608462..c7117f4243 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -1073,6 +1073,7 @@ static int cf_check cpu_callback(
         cpupool_cpu_remove_forced(cpu);
         break;
     default:
+        /* Notifier pattern. */
         break;
     }
 
diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index 28c6e9d3ac..bf082478db 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -55,6 +55,7 @@ static int cf_check cpu_lockdebug_callback(struct notifier_block *nfb,
         break;
 
     default:
+        /* Notifier pattern. */
         break;
     }
 
diff --git a/xen/common/tasklet.c b/xen/common/tasklet.c
index 4c8d87a338..879b1f0d80 100644
--- a/xen/common/tasklet.c
+++ b/xen/common/tasklet.c
@@ -232,6 +232,7 @@ static int cf_check cpu_callback(
         migrate_tasklets_from_cpu(cpu, &per_cpu(softirq_tasklet_list, cpu));
         break;
     default:
+        /* Notifier pattern. */
         break;
     }
 
diff --git a/xen/common/timer.c b/xen/common/timer.c
index a21798b76f..60e9a1493e 100644
--- a/xen/common/timer.c
+++ b/xen/common/timer.c
@@ -677,6 +677,7 @@ static int cf_check cpu_callback(
         break;
 
     default:
+        /* Notifier pattern. */
         break;
     }
 
diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index 8659ad3aee..9584b55398 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -682,6 +682,7 @@ static int cf_check cpu_callback(
         (void)cpufreq_del_cpu(cpu);
         break;
     default:
+        /* Notifier pattern. */
         break;
     }
 
diff --git a/xen/drivers/cpufreq/cpufreq_misc_governors.c b/xen/drivers/cpufreq/cpufreq_misc_governors.c
index 0327fad23b..464b267a17 100644
--- a/xen/drivers/cpufreq/cpufreq_misc_governors.c
+++ b/xen/drivers/cpufreq/cpufreq_misc_governors.c
@@ -101,6 +101,9 @@ static int cf_check cpufreq_userspace_cpu_callback(
     case CPU_UP_PREPARE:
         per_cpu(cpu_set_freq, cpu) = userspace_cmdline_freq;
         break;
+    default:
+        /* Notifier pattern. */
+        break;
     }
 
     return NOTIFY_DONE;
diff --git a/xen/drivers/passthrough/x86/hvm.c b/xen/drivers/passthrough/x86/hvm.c
index d3627e4af7..e5b6be4794 100644
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -1122,6 +1122,9 @@ static int cf_check cpu_callback(
          */
         ASSERT(list_empty(&per_cpu(dpci_list, cpu)));
         break;
+    default:
+        /* Notifier pattern. */
+        break;
     }
 
     return NOTIFY_DONE;
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index cc0062b027..f0c84eeb85 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -749,6 +749,9 @@ static int cf_check cpu_callback(
         if ( !page_list_empty(list) )
             tasklet_schedule(tasklet);
         break;
+    default:
+        /* Notifier pattern. */
+        break;
     }
 
     return NOTIFY_DONE;
-- 
2.34.1


