Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E34476D03B
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 16:38:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574973.900639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRCzo-0006sP-SC; Wed, 02 Aug 2023 14:38:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574973.900639; Wed, 02 Aug 2023 14:38:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRCzo-0006ms-NW; Wed, 02 Aug 2023 14:38:40 +0000
Received: by outflank-mailman (input) for mailman id 574973;
 Wed, 02 Aug 2023 14:38:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YIS5=DT=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qRCzn-0006bO-Pv
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 14:38:39 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44f44a64-3142-11ee-b260-6b7b168915f2;
 Wed, 02 Aug 2023 16:38:39 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id D50094EE0741;
 Wed,  2 Aug 2023 16:38:37 +0200 (CEST)
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
X-Inumbo-ID: 44f44a64-3142-11ee-b260-6b7b168915f2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 02/11] x86: move declarations to address MISRA C:2012 Rule 2.1
Date: Wed,  2 Aug 2023 16:38:08 +0200
Message-Id: <204bf3ffcdda04d6d6cf072c42b78720e1e85b4d.1690985045.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690985045.git.nicola.vetrini@bugseng.com>
References: <cover.1690985045.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Variable declarations between a switch statement guard and before
any case label are unreachable code, and hence violate Rule 2.1:
"A project shall not contain unreachable code".

Therefore the declarations are moved in the smallest enclosing
scope, near other variable definitions.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/cpuid.c  |  3 +--
 xen/arch/x86/domain.c | 23 +++++++++++------------
 xen/arch/x86/irq.c    |  3 +--
 xen/arch/x86/msr.c    |  3 +--
 4 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 455a09b2dd..90e1370e90 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -37,6 +37,7 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
 {
     const struct domain *d = v->domain;
     const struct cpu_policy *p = d->arch.cpu_policy;
+    const struct cpu_user_regs *regs;
 
     *res = EMPTY_LEAF;
 
@@ -136,8 +137,6 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
      */
     switch ( leaf )
     {
-        const struct cpu_user_regs *regs;
-
     case 0x1:
         /* TODO: Rework topology logic. */
         res->b &= 0x00ffffffu;
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 5f66c2ae33..015f7b14ab 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2268,6 +2268,17 @@ int domain_relinquish_resources(struct domain *d)
 {
     int ret;
     struct vcpu *v;
+    enum {
+        PROG_iommu_pagetables = 1,
+        PROG_shared,
+        PROG_paging,
+        PROG_vcpu_pagetables,
+        PROG_xen,
+        PROG_l4,
+        PROG_l3,
+        PROG_l2,
+        PROG_done,
+    };
 
     BUG_ON(!cpumask_empty(d->dirty_cpumask));
 
@@ -2291,18 +2302,6 @@ int domain_relinquish_resources(struct domain *d)
 #define PROGRESS(x)                                                     \
         d->arch.rel_priv = PROG_ ## x; /* Fallthrough */ case PROG_ ## x
 
-        enum {
-            PROG_iommu_pagetables = 1,
-            PROG_shared,
-            PROG_paging,
-            PROG_vcpu_pagetables,
-            PROG_xen,
-            PROG_l4,
-            PROG_l3,
-            PROG_l2,
-            PROG_done,
-        };
-
     case 0:
         ret = pci_release_devices(d);
         if ( ret )
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 6abfd81621..4fd0cc163d 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -1135,6 +1135,7 @@ static void cf_check irq_guest_eoi_timer_fn(void *data)
     struct irq_desc *desc = data;
     unsigned int i, irq = desc - irq_desc;
     irq_guest_action_t *action;
+    cpumask_t *cpu_eoi_map;
 
     spin_lock_irq(&desc->lock);
     
@@ -1169,8 +1170,6 @@ static void cf_check irq_guest_eoi_timer_fn(void *data)
 
     switch ( action->ack_type )
     {
-        cpumask_t *cpu_eoi_map;
-
     case ACKTYPE_UNMASK:
         if ( desc->handler->end )
             desc->handler->end(desc, 0);
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index ecf126566d..0e61e0fe4e 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -335,11 +335,10 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
     const struct cpu_policy *cp = d->arch.cpu_policy;
     struct vcpu_msrs *msrs = v->arch.msrs;
     int ret = X86EMUL_OKAY;
+    uint64_t rsvd;
 
     switch ( msr )
     {
-        uint64_t rsvd;
-
         /* Read-only */
     case MSR_IA32_PLATFORM_ID:
     case MSR_CORE_CAPABILITIES:
-- 
2.34.1


