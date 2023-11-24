Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7173B7F7A6C
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 18:31:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640858.999597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6a0d-0002aU-PU; Fri, 24 Nov 2023 17:30:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640858.999597; Fri, 24 Nov 2023 17:30:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6a0d-0002Ya-Mb; Fri, 24 Nov 2023 17:30:31 +0000
Received: by outflank-mailman (input) for mailman id 640858;
 Fri, 24 Nov 2023 17:30:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SB6C=HF=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1r6a0c-0002YN-KP
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 17:30:30 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2912e1dd-8aef-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 18:30:28 +0100 (CET)
Received: from beta.station (net-37-182-35-120.cust.vodafonedsl.it
 [37.182.35.120])
 by support.bugseng.com (Postfix) with ESMTPSA id BD4C74EE074E;
 Fri, 24 Nov 2023 18:30:27 +0100 (CET)
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
X-Inumbo-ID: 2912e1dd-8aef-11ee-98e2-6d05b1d4d9a1
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [XEN PATCH v2 2/3] xen/arm: add SAF deviation for debugging and logging effects
Date: Fri, 24 Nov 2023 18:29:42 +0100
Message-Id: <761ce615438312ca5d37fb8829a0ba903375392f.1700844359.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700844359.git.simone.ballarin@bugseng.com>
References: <cover.1700844359.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 13.1: Initializer lists shall not contain persistent side effects

Effects caused by debug/logging macros and functions (like ASSERT, __bad_atomic_size,
LOG, etc ...) that crash execution or produce logs are not dangerous in initializer
lists. The evaluation order in abnormal conditions is not relevant. Evaluation order
of logging effects is always safe.

This patch deviates violations using SAF commits caused by debug/logging macros and
functions.

Asm volatile statements in initializer lists that do not perform any persistent side
effect are safe: this patch deviates violations caused by uses of the current macro
(that contains an asm volatile) in initializer lists.

No functional changes.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

---
Changes in v2:
New patch based on the discussion for "xen/arm: address violations of MISRA C:2012 Rule 13.1".
---
 docs/misra/safe.json     | 16 ++++++++++++++++
 xen/arch/arm/device.c    |  1 +
 xen/arch/arm/guestcopy.c |  4 ++++
 xen/arch/x86/hvm/hvm.c   |  1 +
 xen/common/sched/core.c  |  3 +++
 5 files changed, 25 insertions(+)

diff --git a/docs/misra/safe.json b/docs/misra/safe.json
index 952324f85c..69ab526084 100644
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
+            "text": "Volatile asm statements in an initializer list if do not perform persistent side effects are safe."
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
index 6716b03561..31b809ea08 100644
--- a/xen/arch/arm/guestcopy.c
+++ b/xen/arch/arm/guestcopy.c
@@ -110,18 +110,21 @@ static unsigned long copy_guest(void *buf, uint64_t addr, unsigned int len,
 unsigned long raw_copy_to_guest(void *to, const void *from, unsigned int len)
 {
     return copy_guest((void *)from, (vaddr_t)to, len,
+                      /* SAF-4-safe No persistent side effects */
                       GVA_INFO(current), COPY_to_guest | COPY_linear);
 }
 
 unsigned long raw_copy_to_guest_flush_dcache(void *to, const void *from,
                                              unsigned int len)
 {
+    /* SAF-4-safe No persistent side effects */
     return copy_guest((void *)from, (vaddr_t)to, len, GVA_INFO(current),
                       COPY_to_guest | COPY_flush_dcache | COPY_linear);
 }
 
 unsigned long raw_clear_guest(void *to, unsigned int len)
 {
+    /* SAF-4-safe No persistent side effects */
     return copy_guest(NULL, (vaddr_t)to, len, GVA_INFO(current),
                       COPY_to_guest | COPY_linear);
 }
@@ -129,6 +132,7 @@ unsigned long raw_clear_guest(void *to, unsigned int len)
 unsigned long raw_copy_from_guest(void *to, const void __user *from,
                                   unsigned int len)
 {
+    /* SAF-4-safe No persistent side effects */
     return copy_guest(to, (vaddr_t)from, len, GVA_INFO(current),
                       COPY_from_guest | COPY_linear);
 }
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 35a30df3b1..24fd02b363 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1700,6 +1700,7 @@ void hvm_hlt(unsigned int eflags)
 
     do_sched_op(SCHEDOP_block, guest_handle_from_ptr(NULL, void));
 
+    /* SAF-3-safe effects for debugging/logging reasons are safe */
     HVMTRACE_1D(HLT, /* pending = */ vcpu_runnable(curr));
 }
 
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index eba0cea4bb..b1b94c8689 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -1517,6 +1517,7 @@ long vcpu_yield(void)
 
     SCHED_STAT_CRANK(vcpu_yield);
 
+    /* SAF-4-safe No persistent side effects */
     TRACE_2D(TRC_SCHED_YIELD, current->domain->domain_id, current->vcpu_id);
     raise_softirq(SCHEDULE_SOFTIRQ);
     return 0;
@@ -1895,6 +1896,7 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( copy_from_guest(&sched_shutdown, arg, 1) )
             break;
 
+        /* SAF-4-safe No persistent side effects */
         TRACE_3D(TRC_SCHED_SHUTDOWN,
                  current->domain->domain_id, current->vcpu_id,
                  sched_shutdown.reason);
@@ -1912,6 +1914,7 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( copy_from_guest(&sched_shutdown, arg, 1) )
             break;
 
+        /* SAF-4-safe No persistent side effects */
         TRACE_3D(TRC_SCHED_SHUTDOWN_CODE,
                  d->domain_id, current->vcpu_id, sched_shutdown.reason);
 
-- 
2.34.1


