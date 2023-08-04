Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 365F676FB97
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 10:04:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576962.903697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRpmw-0007Bk-Vb; Fri, 04 Aug 2023 08:03:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576962.903697; Fri, 04 Aug 2023 08:03:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRpmw-00077W-Qm; Fri, 04 Aug 2023 08:03:58 +0000
Received: by outflank-mailman (input) for mailman id 576962;
 Fri, 04 Aug 2023 08:03:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BlMS=DV=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qRpmv-000750-Ug
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 08:03:57 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 762567e2-329d-11ee-b26a-6b7b168915f2;
 Fri, 04 Aug 2023 10:03:57 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 1396E4EE0740;
 Fri,  4 Aug 2023 10:03:56 +0200 (CEST)
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
X-Inumbo-ID: 762567e2-329d-11ee-b26a-6b7b168915f2
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
Subject: [XEN PATCH v2 1/4] x86/mce: address MISRA C:2012 Rule 5.3
Date: Fri,  4 Aug 2023 10:03:33 +0200
Message-Id: <8a11baf39c140af9d5694298e5f1f0bf59ac0621.1691135862.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691135862.git.nicola.vetrini@bugseng.com>
References: <cover.1691135862.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Suitable mechanical renames are made to avoid shadowing
the function identifier 'wait' declared in 'xen/include/xen/wait.h',
thus addressing violations of MISRA C:2012 Rule 5.3:
"An identifier declared in an inner scope shall not hide an
identifier declared in an outer scope"

The parameter name 'bar' is added as well to comply with MISRA C:2012
Rules 8.2 and 8.3.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v2:
- Added parameter name 'bar' where missing.
- Amended commit message.
---
 xen/arch/x86/cpu/mcheck/barrier.c |  8 ++++----
 xen/arch/x86/cpu/mcheck/barrier.h | 14 +++++++-------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/barrier.c b/xen/arch/x86/cpu/mcheck/barrier.c
index a7e5b19a44..51a1d37a76 100644
--- a/xen/arch/x86/cpu/mcheck/barrier.c
+++ b/xen/arch/x86/cpu/mcheck/barrier.c
@@ -16,11 +16,11 @@ void mce_barrier_dec(struct mce_softirq_barrier *bar)
     atomic_dec(&bar->val);
 }

-void mce_barrier_enter(struct mce_softirq_barrier *bar, bool wait)
+void mce_barrier_enter(struct mce_softirq_barrier *bar, bool do_wait)
 {
     int gen;

-    if ( !wait )
+    if ( !do_wait )
         return;
     atomic_inc(&bar->ingen);
     gen = atomic_read(&bar->outgen);
@@ -34,11 +34,11 @@ void mce_barrier_enter(struct mce_softirq_barrier *bar, bool wait)
     }
 }

-void mce_barrier_exit(struct mce_softirq_barrier *bar, bool wait)
+void mce_barrier_exit(struct mce_softirq_barrier *bar, bool do_wait)
 {
     int gen;

-    if ( !wait )
+    if ( !do_wait )
         return;
     atomic_inc(&bar->outgen);
     gen = atomic_read(&bar->ingen);
diff --git a/xen/arch/x86/cpu/mcheck/barrier.h b/xen/arch/x86/cpu/mcheck/barrier.h
index c4d52b6192..7ec483226f 100644
--- a/xen/arch/x86/cpu/mcheck/barrier.h
+++ b/xen/arch/x86/cpu/mcheck/barrier.h
@@ -20,7 +20,7 @@ struct mce_softirq_barrier {
 /*
  * Initialize a barrier. Just set it to 0.
  */
-void mce_barrier_init(struct mce_softirq_barrier *);
+void mce_barrier_init(struct mce_softirq_barrier *bar);

 /*
  * This function will need to be used when offlining a CPU in the
@@ -29,17 +29,17 @@ void mce_barrier_init(struct mce_softirq_barrier *);
  * Decrement a barrier only. Needed for cases where the CPU
  * in question can't do it itself (e.g. it is being offlined).
  */
-void mce_barrier_dec(struct mce_softirq_barrier *);
+void mce_barrier_dec(struct mce_softirq_barrier *bar);

 /*
- * If @wait is false, mce_barrier_enter/exit() will return immediately
+ * If @do_wait is false, mce_barrier_enter/exit() will return immediately
  * without touching the barrier. It's used when handling a
  * non-broadcasting MCE (e.g. MCE on some old Intel CPU, MCE on AMD
  * CPU and LMCE on Intel Skylake-server CPU) which is received on only
  * one CPU and thus does not invoke mce_barrier_enter/exit() calls on
  * all CPUs.
  *
- * If @wait is true, mce_barrier_enter/exit() will handle the given
+ * If @do_wait is true, mce_barrier_enter/exit() will handle the given
  * barrier as below.
  *
  * Increment the generation number and the value. The generation number
@@ -53,9 +53,9 @@ void mce_barrier_dec(struct mce_softirq_barrier *);
  * These barrier functions should always be paired, so that the
  * counter value will reach 0 again after all CPUs have exited.
  */
-void mce_barrier_enter(struct mce_softirq_barrier *, bool wait);
-void mce_barrier_exit(struct mce_softirq_barrier *, bool wait);
+void mce_barrier_enter(struct mce_softirq_barrier *bar, bool do_wait);
+void mce_barrier_exit(struct mce_softirq_barrier *bar, bool do_wait);

-void mce_barrier(struct mce_softirq_barrier *);
+void mce_barrier(struct mce_softirq_barrier *bar);

 #endif /* _MCHECK_BARRIER_H */
--
2.34.1

