Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63895846C42
	for <lists+xen-devel@lfdr.de>; Fri,  2 Feb 2024 10:39:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674920.1050100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVq0Q-00062y-4A; Fri, 02 Feb 2024 09:38:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674920.1050100; Fri, 02 Feb 2024 09:38:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVq0P-0005vk-UJ; Fri, 02 Feb 2024 09:38:41 +0000
Received: by outflank-mailman (input) for mailman id 674920;
 Fri, 02 Feb 2024 09:38:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lYVL=JL=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rVq0O-0005sE-Ax
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2024 09:38:40 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7913475-c1ae-11ee-98f5-efadbce2ee36;
 Fri, 02 Feb 2024 10:38:38 +0100 (CET)
Received: from beta.station (net-188-218-67-100.cust.vodafonedsl.it
 [188.218.67.100])
 by support.bugseng.com (Postfix) with ESMTPSA id A36D54EE073A;
 Fri,  2 Feb 2024 10:38:36 +0100 (CET)
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
X-Inumbo-ID: d7913475-c1ae-11ee-98f5-efadbce2ee36
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.org,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
Subject: [PATCH v3 1/4] xen: add SAF deviation for debugging and logging effects
Date: Fri,  2 Feb 2024 10:37:44 +0100
Message-Id: <f3ab1e5f79b1c6d4e2cfaa34644512338766736b.1706700228.git.maria.celeste.cesario@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706700228.git.maria.celeste.cesario@bugseng.com>
References: <cover.1706700228.git.maria.celeste.cesario@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 13.1: Initializer lists shall not contain persistent side effects

Effects caused by debug/logging macros and functions (like ASSERT, __bad_atomic_size,
LOG, etc ...) that crash execution or produce logs are not dangerous in initializer
lists. The evaluation order in abnormal conditions is not relevant. Evaluation order
of logging effects is always safe.

Function hvm_get_guest_tsc_fixed (indirectly) performs different side effects.
For example it calls hvm_get_guest_time_fixed that contains an ASSERT and calls
to spin_lock and spin_unlock.

These side effects are not dangerous: they can be executed regardless of the
initializer list evaluation order

This patch deviates violations using SAF commits caused by debug/logging macros and
functions.

Asm volatile statements in initializer lists that do not perform any persistent side
effect are safe: this patch deviates violations caused by uses of the current macro
(that contains an asm volatile) in initializer lists.

No functional changes.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>

---
Changes in v3:
- change commit prefix from xen/arm to xen
- specify where saf-3-safe comments are applied in guestcopy.c
- reword SAF text
Changes in v2:
New patch based on the discussion for "xen/arm: address violations of MISRA C:2012 Rule 13.1".
---
 docs/misra/safe.json     | 16 ++++++++++++++++
 xen/arch/arm/device.c    |  1 +
 xen/arch/arm/guestcopy.c | 16 ++++++++++++----
 xen/arch/x86/hvm/hvm.c   |  1 +
 xen/common/sched/core.c  |  3 +++
 5 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/docs/misra/safe.json b/docs/misra/safe.json
index 952324f85c..5539e8dfda 100644
--- a/docs/misra/safe.json
+++ b/docs/misra/safe.json
@@ -28,6 +28,22 @@
         },
         {
             "id": "SAF-3-safe",
+            "analyser": {
+                "eclair": "MC3R1.R13.1"
+            },
+            "name": "MC3R1.R13.1: effects for debugging and logging",
+            "text": "Effects for debugging and loggings reasons that crash execution or produce logs are allowed in initializer lists. The evaluation order in abnormal conditions is not relevant."
+        },
+        {
+            "id": "SAF-4-safe",
+            "analyser": {
+                "eclair": "MC3R1.R13.1"
+            },
+            "name": "MC3R1.R13.1: volatile asm statements that do not perform any persistent side effect",
+            "text": "Volatile asm statement in an initializer list that does not perform persistent side effects is safe."
+        },
+        {
+            "id": "SAF-5-safe",
             "analyser": {},
             "name": "Sentinel",
             "text": "Next ID to be used"
diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
index 1f631d3274..fa331f164d 100644
--- a/xen/arch/arm/device.c
+++ b/xen/arch/arm/device.c
@@ -331,6 +331,7 @@ int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt,
         .p2mt = p2mt,
         .skip_mapping = !own_device ||
                         (is_pci_passthrough_enabled() &&
+                        /* SAF-3-safe effects for debugging/logging reasons are safe */
                         (device_get_class(dev) == DEVICE_PCI_HOSTBRIDGE)),
         .iomem_ranges = iomem_ranges,
         .irq_ranges = irq_ranges
diff --git a/xen/arch/arm/guestcopy.c b/xen/arch/arm/guestcopy.c
index 6716b03561..b75538252a 100644
--- a/xen/arch/arm/guestcopy.c
+++ b/xen/arch/arm/guestcopy.c
@@ -110,26 +110,34 @@ static unsigned long copy_guest(void *buf, uint64_t addr, unsigned int len,
 unsigned long raw_copy_to_guest(void *to, const void *from, unsigned int len)
 {
     return copy_guest((void *)from, (vaddr_t)to, len,
-                      GVA_INFO(current), COPY_to_guest | COPY_linear);
+                      /* SAF-4-safe No persistent side effects */
+                      GVA_INFO(current),
+                      COPY_to_guest | COPY_linear);
 }
 
 unsigned long raw_copy_to_guest_flush_dcache(void *to, const void *from,
                                              unsigned int len)
 {
-    return copy_guest((void *)from, (vaddr_t)to, len, GVA_INFO(current),
+    return copy_guest((void *)from, (vaddr_t)to, len,
+                      /* SAF-4-safe No persistent side effects */
+                      GVA_INFO(current),
                       COPY_to_guest | COPY_flush_dcache | COPY_linear);
 }
 
 unsigned long raw_clear_guest(void *to, unsigned int len)
 {
-    return copy_guest(NULL, (vaddr_t)to, len, GVA_INFO(current),
+    return copy_guest(NULL, (vaddr_t)to, len,
+                      /* SAF-4-safe No persistent side effects */
+                      GVA_INFO(current),
                       COPY_to_guest | COPY_linear);
 }
 
 unsigned long raw_copy_from_guest(void *to, const void __user *from,
                                   unsigned int len)
 {
-    return copy_guest(to, (vaddr_t)from, len, GVA_INFO(current),
+    return copy_guest(to, (vaddr_t)from, len,
+                      /* SAF-4-safe No persistent side effects */
+                      GVA_INFO(current),
                       COPY_from_guest | COPY_linear);
 }
 
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index e3bd9157d7..38af437634 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -800,6 +800,7 @@ static int cf_check hvm_save_cpu_ctxt(struct vcpu *v, hvm_domain_context_t *h)
 {
     struct segment_register seg;
     struct hvm_hw_cpu ctxt = {
+        /* SAF-3-safe effects for debugging/logging reasons are safe */
         .tsc = hvm_get_guest_tsc_fixed(v, v->domain->arch.hvm.sync_tsc),
         .msr_tsc_aux = v->arch.msrs->tsc_aux,
         .rax = v->arch.user_regs.rax,
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index d177c675c8..9e973fcf31 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -1521,6 +1521,7 @@ long vcpu_yield(void)
 
     SCHED_STAT_CRANK(vcpu_yield);
 
+    /* SAF-4-safe No persistent side effects */
     TRACE_2D(TRC_SCHED_YIELD, current->domain->domain_id, current->vcpu_id);
     raise_softirq(SCHEDULE_SOFTIRQ);
     return 0;
@@ -1899,6 +1900,7 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( copy_from_guest(&sched_shutdown, arg, 1) )
             break;
 
+        /* SAF-4-safe No persistent side effects */
         TRACE_3D(TRC_SCHED_SHUTDOWN,
                  current->domain->domain_id, current->vcpu_id,
                  sched_shutdown.reason);
@@ -1916,6 +1918,7 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( copy_from_guest(&sched_shutdown, arg, 1) )
             break;
 
+        /* SAF-4-safe No persistent side effects */
         TRACE_3D(TRC_SCHED_SHUTDOWN_CODE,
                  d->domain_id, current->vcpu_id, sched_shutdown.reason);
 
-- 
2.40.0


