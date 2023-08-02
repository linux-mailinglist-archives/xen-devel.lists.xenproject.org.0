Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D87A76C9B5
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 11:45:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574819.900417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR8Pe-0000OU-3g; Wed, 02 Aug 2023 09:45:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574819.900417; Wed, 02 Aug 2023 09:45:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR8Pd-0000Ly-S7; Wed, 02 Aug 2023 09:45:01 +0000
Received: by outflank-mailman (input) for mailman id 574819;
 Wed, 02 Aug 2023 09:44:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YIS5=DT=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qR8Pb-0000LL-LD
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 09:44:59 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e698eaf-3119-11ee-b25f-6b7b168915f2;
 Wed, 02 Aug 2023 11:44:58 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id CE9A64EE0740;
 Wed,  2 Aug 2023 11:44:57 +0200 (CEST)
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
X-Inumbo-ID: 3e698eaf-3119-11ee-b25f-6b7b168915f2
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
Subject: [XEN PATCH 1/4] x86/mce: address MISRA C:2012 Rule 5.3
Date: Wed,  2 Aug 2023 11:44:28 +0200
Message-Id: <52ec7caf08089e3aaaad2bcf709a7d387d55d58f.1690969271.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690969271.git.nicola.vetrini@bugseng.com>
References: <cover.1690969271.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Suitable mechanical renames are made to avoid shadowing, thus
addressing violations of MISRA C:2012 Rule 5.3:
"An identifier declared in an inner scope shall not hide an
identifier declared in an outer scope"

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/cpu/mcheck/barrier.c | 8 ++++----
 xen/arch/x86/cpu/mcheck/barrier.h | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

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
index c4d52b6192..5cd1b4e4bf 100644
--- a/xen/arch/x86/cpu/mcheck/barrier.h
+++ b/xen/arch/x86/cpu/mcheck/barrier.h
@@ -32,14 +32,14 @@ void mce_barrier_init(struct mce_softirq_barrier *);
 void mce_barrier_dec(struct mce_softirq_barrier *);
 
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
@@ -53,8 +53,8 @@ void mce_barrier_dec(struct mce_softirq_barrier *);
  * These barrier functions should always be paired, so that the
  * counter value will reach 0 again after all CPUs have exited.
  */
-void mce_barrier_enter(struct mce_softirq_barrier *, bool wait);
-void mce_barrier_exit(struct mce_softirq_barrier *, bool wait);
+void mce_barrier_enter(struct mce_softirq_barrier *, bool do_wait);
+void mce_barrier_exit(struct mce_softirq_barrier *, bool do_wait);
 
 void mce_barrier(struct mce_softirq_barrier *);
 
-- 
2.34.1


