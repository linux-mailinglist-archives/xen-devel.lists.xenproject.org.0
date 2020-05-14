Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 684851D353B
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 17:36:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZFuW-0007D3-8m; Thu, 14 May 2020 15:36:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WGWk=64=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jZFuU-0007Cc-7O
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 15:36:34 +0000
X-Inumbo-ID: a76a2437-95f8-11ea-a4ad-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a76a2437-95f8-11ea-a4ad-12813bfff9fa;
 Thu, 14 May 2020 15:36:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 712D4AEDE;
 Thu, 14 May 2020 15:36:20 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v3 3/3] xen/sched: fix latent races accessing vcpu->dirty_cpu
Date: Thu, 14 May 2020 17:36:14 +0200
Message-Id: <20200514153614.2240-4-jgross@suse.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200514153614.2240-1-jgross@suse.com>
References: <20200514153614.2240-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The dirty_cpu field of struct vcpu denotes which cpu still holds data
of a vcpu. All accesses to this field should be atomic in case the
vcpu could just be running, as it is accessed without any lock held
in most cases. Especially sync_local_execstate() and context_switch()
for the same vcpu running concurrently have a risk for failing.

There are some instances where accesses are not atomically done, and
even worse where multiple accesses are done when a single one would
be mandated.

Correct that in order to avoid potential problems.

Add some assertions to verify dirty_cpu is handled properly.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
V2:
- convert all accesses to v->dirty_cpu to atomic ones (Jan Beulich)
- drop cast (Julien Grall)

V3:
- drop atomic access in vcpu_create() (Jan Beulich)

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/arch/x86/domain.c   | 16 +++++++++++-----
 xen/common/keyhandler.c |  2 +-
 xen/include/xen/sched.h |  2 +-
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index a4428190d5..2e5717b983 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -183,7 +183,7 @@ void startup_cpu_idle_loop(void)
 
     ASSERT(is_idle_vcpu(v));
     cpumask_set_cpu(v->processor, v->domain->dirty_cpumask);
-    v->dirty_cpu = v->processor;
+    write_atomic(&v->dirty_cpu, v->processor);
 
     reset_stack_and_jump(idle_loop);
 }
@@ -1769,6 +1769,7 @@ static void __context_switch(void)
 
     if ( !is_idle_domain(pd) )
     {
+        ASSERT(read_atomic(&p->dirty_cpu) == cpu);
         memcpy(&p->arch.user_regs, stack_regs, CTXT_SWITCH_STACK_BYTES);
         vcpu_save_fpu(p);
         pd->arch.ctxt_switch->from(p);
@@ -1832,7 +1833,7 @@ void context_switch(struct vcpu *prev, struct vcpu *next)
 {
     unsigned int cpu = smp_processor_id();
     const struct domain *prevd = prev->domain, *nextd = next->domain;
-    unsigned int dirty_cpu = next->dirty_cpu;
+    unsigned int dirty_cpu = read_atomic(&next->dirty_cpu);
 
     ASSERT(prev != next);
     ASSERT(local_irq_is_enabled());
@@ -1844,6 +1845,7 @@ void context_switch(struct vcpu *prev, struct vcpu *next)
     {
         /* Remote CPU calls __sync_local_execstate() from flush IPI handler. */
         flush_mask(cpumask_of(dirty_cpu), FLUSH_VCPU_STATE);
+        ASSERT(!vcpu_cpu_dirty(next));
     }
 
     _update_runstate_area(prev);
@@ -1956,13 +1958,17 @@ void sync_local_execstate(void)
 
 void sync_vcpu_execstate(struct vcpu *v)
 {
-    if ( v->dirty_cpu == smp_processor_id() )
+    unsigned int dirty_cpu = read_atomic(&v->dirty_cpu);
+
+    if ( dirty_cpu == smp_processor_id() )
         sync_local_execstate();
-    else if ( vcpu_cpu_dirty(v) )
+    else if ( is_vcpu_dirty_cpu(dirty_cpu) )
     {
         /* Remote CPU calls __sync_local_execstate() from flush IPI handler. */
-        flush_mask(cpumask_of(v->dirty_cpu), FLUSH_VCPU_STATE);
+        flush_mask(cpumask_of(dirty_cpu), FLUSH_VCPU_STATE);
     }
+    ASSERT(!is_vcpu_dirty_cpu(dirty_cpu) ||
+           read_atomic(&v->dirty_cpu) != dirty_cpu);
 }
 
 static int relinquish_memory(
diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
index 87bd145374..68364e987d 100644
--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -316,7 +316,7 @@ static void dump_domains(unsigned char key)
                        vcpu_info(v, evtchn_upcall_pending),
                        !vcpu_event_delivery_is_enabled(v));
                 if ( vcpu_cpu_dirty(v) )
-                    printk("dirty_cpu=%u", v->dirty_cpu);
+                    printk("dirty_cpu=%u", read_atomic(&v->dirty_cpu));
                 printk("\n");
                 printk("    pause_count=%d pause_flags=%lx\n",
                        atomic_read(&v->pause_count), v->pause_flags);
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 6101761d25..ac53519d7f 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -844,7 +844,7 @@ static inline bool is_vcpu_dirty_cpu(unsigned int cpu)
 
 static inline bool vcpu_cpu_dirty(const struct vcpu *v)
 {
-    return is_vcpu_dirty_cpu(v->dirty_cpu);
+    return is_vcpu_dirty_cpu(read_atomic(&v->dirty_cpu));
 }
 
 void vcpu_block(void);
-- 
2.26.1


