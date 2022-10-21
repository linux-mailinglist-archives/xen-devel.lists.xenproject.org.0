Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C9C607565
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 12:51:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427600.676836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olpbt-0003Ro-CA; Fri, 21 Oct 2022 10:50:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427600.676836; Fri, 21 Oct 2022 10:50:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olpbt-0003Od-8D; Fri, 21 Oct 2022 10:50:41 +0000
Received: by outflank-mailman (input) for mailman id 427600;
 Fri, 21 Oct 2022 10:50:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MvAv=2W=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1olpbs-0003OX-JV
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 10:50:40 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3351a39f-512e-11ed-8fd0-01056ac49cbb;
 Fri, 21 Oct 2022 12:50:39 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B3ECD21FC2;
 Fri, 21 Oct 2022 10:50:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5F3FF1331A;
 Fri, 21 Oct 2022 10:50:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KDTZFX55UmPAKAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 21 Oct 2022 10:50:38 +0000
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
X-Inumbo-ID: 3351a39f-512e-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1666349438; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ks5E3OIk9erHpwx/r8PUpwIk+tFEFyRztR1vnSLhO1g=;
	b=lxehLAypw4S4TyAa0wzcdfPY5WyjgGsDJZvd8VcohNtQT+SsNBOUha4X0mtEP+1LT1gUOq
	Z0YNM+oT1cA2y0uEs3iO3zM6kXFLEimUOgdaXny0cuIwCdcBfVNnd/XOOWol1C9l+sbI9C
	Om0a5O8KUKBkFxUNOfPBLVIAkbkBmP8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Dario Faggioli <dfaggioli@suse.com>,
	Henry Wang <Henry.Wang@arm.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v2] xen/sched: fix restore_vcpu_affinity() by removing it
Date: Fri, 21 Oct 2022 12:50:26 +0200
Message-Id: <20221021105026.16186-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When the system is coming up after having been suspended,
restore_vcpu_affinity() is called for each domain in order to adjust
the vcpu's affinity settings in case a cpu didn't come to live again.

The way restore_vcpu_affinity() is doing that is wrong, because the
specific scheduler isn't being informed about a possible migration of
the vcpu to another cpu. Additionally the migration is often even
happening if all cpus are running again, as it is done without check
whether it is really needed.

As cpupool management is already calling cpu_disable_scheduler() for
cpus not having come up again, and cpu_disable_scheduler() is taking
care of eventually needed vcpu migration in the proper way, there is
simply no need for restore_vcpu_affinity().

So just remove restore_vcpu_affinity() completely, together with the
no longer used sched_reset_affinity_broken().

Fixes: 8a04eaa8ea83 ("xen/sched: move some per-vcpu items to struct sched_unit")
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Acked-by: Dario Faggioli <dfaggioli@suse.com>
Release-acked-by: Henry Wang <Henry.Wang@arm.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- also remove sched_reset_affinity_broken() (Jan Beulich)
---
 xen/arch/x86/acpi/power.c |  3 --
 xen/common/sched/core.c   | 78 ---------------------------------------
 xen/include/xen/sched.h   |  1 -
 3 files changed, 82 deletions(-)

diff --git a/xen/arch/x86/acpi/power.c b/xen/arch/x86/acpi/power.c
index 1bb4d78392..b76f673acb 100644
--- a/xen/arch/x86/acpi/power.c
+++ b/xen/arch/x86/acpi/power.c
@@ -159,10 +159,7 @@ static void thaw_domains(void)
 
     rcu_read_lock(&domlist_read_lock);
     for_each_domain ( d )
-    {
-        restore_vcpu_affinity(d);
         domain_unpause(d);
-    }
     rcu_read_unlock(&domlist_read_lock);
 }
 
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 83455fbde1..23fa6845a8 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -1188,84 +1188,6 @@ static bool sched_check_affinity_broken(const struct sched_unit *unit)
     return false;
 }
 
-static void sched_reset_affinity_broken(const struct sched_unit *unit)
-{
-    struct vcpu *v;
-
-    for_each_sched_unit_vcpu ( unit, v )
-        v->affinity_broken = false;
-}
-
-void restore_vcpu_affinity(struct domain *d)
-{
-    unsigned int cpu = smp_processor_id();
-    struct sched_unit *unit;
-
-    ASSERT(system_state == SYS_STATE_resume);
-
-    rcu_read_lock(&sched_res_rculock);
-
-    for_each_sched_unit ( d, unit )
-    {
-        spinlock_t *lock;
-        unsigned int old_cpu = sched_unit_master(unit);
-        struct sched_resource *res;
-
-        ASSERT(!unit_runnable(unit));
-
-        /*
-         * Re-assign the initial processor as after resume we have no
-         * guarantee the old processor has come back to life again.
-         *
-         * Therefore, here, before actually unpausing the domains, we should
-         * set v->processor of each of their vCPUs to something that will
-         * make sense for the scheduler of the cpupool in which they are in.
-         */
-        lock = unit_schedule_lock_irq(unit);
-
-        cpumask_and(cpumask_scratch_cpu(cpu), unit->cpu_hard_affinity,
-                    cpupool_domain_master_cpumask(d));
-        if ( cpumask_empty(cpumask_scratch_cpu(cpu)) )
-        {
-            if ( sched_check_affinity_broken(unit) )
-            {
-                sched_set_affinity(unit, unit->cpu_hard_affinity_saved, NULL);
-                sched_reset_affinity_broken(unit);
-                cpumask_and(cpumask_scratch_cpu(cpu), unit->cpu_hard_affinity,
-                            cpupool_domain_master_cpumask(d));
-            }
-
-            if ( cpumask_empty(cpumask_scratch_cpu(cpu)) )
-            {
-                /* Affinity settings of one vcpu are for the complete unit. */
-                printk(XENLOG_DEBUG "Breaking affinity for %pv\n",
-                       unit->vcpu_list);
-                sched_set_affinity(unit, &cpumask_all, NULL);
-                cpumask_and(cpumask_scratch_cpu(cpu), unit->cpu_hard_affinity,
-                            cpupool_domain_master_cpumask(d));
-            }
-        }
-
-        res = get_sched_res(cpumask_any(cpumask_scratch_cpu(cpu)));
-        sched_set_res(unit, res);
-
-        spin_unlock_irq(lock);
-
-        /* v->processor might have changed, so reacquire the lock. */
-        lock = unit_schedule_lock_irq(unit);
-        res = sched_pick_resource(unit_scheduler(unit), unit);
-        sched_set_res(unit, res);
-        spin_unlock_irq(lock);
-
-        if ( old_cpu != sched_unit_master(unit) )
-            sched_move_irqs(unit);
-    }
-
-    rcu_read_unlock(&sched_res_rculock);
-
-    domain_update_node_affinity(d);
-}
-
 /*
  * This function is used by cpu_hotplug code via cpu notifier chain
  * and from cpupools to switch schedulers on a cpu.
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 557b3229f6..072e4846aa 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1019,7 +1019,6 @@ void vcpu_set_periodic_timer(struct vcpu *v, s_time_t value);
 void sched_setup_dom0_vcpus(struct domain *d);
 int vcpu_temporary_affinity(struct vcpu *v, unsigned int cpu, uint8_t reason);
 int vcpu_set_hard_affinity(struct vcpu *v, const cpumask_t *affinity);
-void restore_vcpu_affinity(struct domain *d);
 int vcpu_affinity_domctl(struct domain *d, uint32_t cmd,
                          struct xen_domctl_vcpuaffinity *vcpuaff);
 
-- 
2.35.3


