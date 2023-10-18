Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E28427CDF49
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 16:19:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618596.962450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt7Nz-0005c4-GV; Wed, 18 Oct 2023 14:18:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618596.962450; Wed, 18 Oct 2023 14:18:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt7Nz-0005Ws-CH; Wed, 18 Oct 2023 14:18:59 +0000
Received: by outflank-mailman (input) for mailman id 618596;
 Wed, 18 Oct 2023 14:18:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7etD=GA=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qt7Nx-0005Dj-J1
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 14:18:57 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45c0c852-6dc1-11ee-98d4-6d05b1d4d9a1;
 Wed, 18 Oct 2023 16:18:56 +0200 (CEST)
Received: from beta.station (net-188-218-250-245.cust.vodafonedsl.it
 [188.218.250.245])
 by support.bugseng.com (Postfix) with ESMTPSA id A09F04EE0744;
 Wed, 18 Oct 2023 16:18:55 +0200 (CEST)
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
X-Inumbo-ID: 45c0c852-6dc1-11ee-98d4-6d05b1d4d9a1
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.org,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 4/4] xen: address violations of MISRA C:2012 Rule 13.1
Date: Wed, 18 Oct 2023 16:18:51 +0200
Message-Id: <1e0f12095bcbc82ae3585c9fcf57bec7e324049c.1697638210.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697638210.git.simone.ballarin@bugseng.com>
References: <cover.1697638210.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 13.1: Initializer lists shall not contain persistent side effects

This patch moves expressions with side-effects outside the initializer lists.

No functional changes.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 xen/common/sched/core.c    | 16 ++++++++++++----
 xen/drivers/char/ns16550.c |  4 +++-
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 12deefa745..519884f989 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -1504,6 +1504,8 @@ long vcpu_yield(void)
 {
     struct vcpu * v=current;
     spinlock_t *lock;
+    domid_t domain_id;
+    int vcpu_id;
 
     rcu_read_lock(&sched_res_rculock);
 
@@ -1515,7 +1517,9 @@ long vcpu_yield(void)
 
     SCHED_STAT_CRANK(vcpu_yield);
 
-    TRACE_2D(TRC_SCHED_YIELD, current->domain->domain_id, current->vcpu_id);
+    domain_id = current->domain->domain_id;
+    vcpu_id = current->vcpu_id;
+    TRACE_2D(TRC_SCHED_YIELD, domain_id, vcpu_id);
     raise_softirq(SCHEDULE_SOFTIRQ);
     return 0;
 }
@@ -1888,14 +1892,17 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     case SCHEDOP_shutdown:
     {
         struct sched_shutdown sched_shutdown;
+        domid_t domain_id;
+        int vcpu_id;
 
         ret = -EFAULT;
         if ( copy_from_guest(&sched_shutdown, arg, 1) )
             break;
 
+        domain_id = current->domain->domain_id;
+        vcpu_id = current->vcpu_id;
         TRACE_3D(TRC_SCHED_SHUTDOWN,
-                 current->domain->domain_id, current->vcpu_id,
-                 sched_shutdown.reason);
+                 domain_id, vcpu_id, sched_shutdown.reason);
         ret = domain_shutdown(current->domain, (u8)sched_shutdown.reason);
 
         break;
@@ -1905,13 +1912,14 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     {
         struct sched_shutdown sched_shutdown;
         struct domain *d = current->domain;
+        int vcpu_id = current->vcpu_id;
 
         ret = -EFAULT;
         if ( copy_from_guest(&sched_shutdown, arg, 1) )
             break;
 
         TRACE_3D(TRC_SCHED_SHUTDOWN_CODE,
-                 d->domain_id, current->vcpu_id, sched_shutdown.reason);
+                 d->domain_id, vcpu_id, sched_shutdown.reason);
 
         spin_lock(&d->shutdown_lock);
         if ( d->shutdown_code == SHUTDOWN_CODE_INVALID )
diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 28ddedd50d..0b3d8b2a30 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -445,10 +445,12 @@ static void __init cf_check ns16550_init_postirq(struct serial_port *port)
             struct msi_info msi = {
                 .sbdf = PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
                                  uart->ps_bdf[2]),
-                .irq = rc = uart->irq,
+                .irq = uart->irq,
                 .entry_nr = 1
             };
 
+            rc = uart->irq;
+
             if ( rc > 0 )
             {
                 struct msi_desc *msi_desc = NULL;
-- 
2.34.1


