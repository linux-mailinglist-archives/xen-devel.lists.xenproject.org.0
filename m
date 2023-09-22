Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DD47AB4A3
	for <lists+xen-devel@lfdr.de>; Fri, 22 Sep 2023 17:19:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606931.945030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjhw4-0004hk-W1; Fri, 22 Sep 2023 15:19:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606931.945030; Fri, 22 Sep 2023 15:19:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjhw4-0004fA-Sb; Fri, 22 Sep 2023 15:19:16 +0000
Received: by outflank-mailman (input) for mailman id 606931;
 Fri, 22 Sep 2023 15:19:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Esjf=FG=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qjhw3-0004f4-Fv
 for xen-devel@lists.xenproject.org; Fri, 22 Sep 2023 15:19:15 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62dcdbb7-595b-11ee-9b0d-b553b5be7939;
 Fri, 22 Sep 2023 17:19:13 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.160.108.56])
 by support.bugseng.com (Postfix) with ESMTPSA id B0EE64EE0739;
 Fri, 22 Sep 2023 17:19:11 +0200 (CEST)
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
X-Inumbo-ID: 62dcdbb7-595b-11ee-9b0d-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2] xen/emul-i8254: remove forward declarations and re-order functions
Date: Fri, 22 Sep 2023 17:19:04 +0200
Message-Id: <b2877f0e2d867e04e806d70cc2ba175386c30d9c.1695392080.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove forward declarations, including one that violates MISRA C Rule
8.3 ("All declarations of an object or function shall use the same
names and type qualifiers"), and re-order functions.
No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/emul-i8254.c | 129 ++++++++++++++++++--------------------
 1 file changed, 62 insertions(+), 67 deletions(-)

diff --git a/xen/arch/x86/emul-i8254.c b/xen/arch/x86/emul-i8254.c
index 41ec4a1ef1..8157428d94 100644
--- a/xen/arch/x86/emul-i8254.c
+++ b/xen/arch/x86/emul-i8254.c
@@ -48,11 +48,6 @@
 #define RW_STATE_WORD0 3
 #define RW_STATE_WORD1 4
 
-static int cf_check handle_pit_io(
-    int dir, unsigned int port, unsigned int bytes, uint32_t *val);
-static int cf_check handle_speaker_io(
-    int dir, unsigned int port, unsigned int bytes, uint32_t *val);
-
 #define get_guest_time(v) \
    (is_hvm_vcpu(v) ? hvm_get_guest_time(v) : (u64)get_s_time())
 
@@ -466,68 +461,7 @@ static int cf_check pit_load(struct domain *d, hvm_domain_context_t *h)
 HVM_REGISTER_SAVE_RESTORE(PIT, pit_save, pit_load, 1, HVMSR_PER_DOM);
 #endif
 
-void pit_reset(struct domain *d)
-{
-    PITState *pit = domain_vpit(d);
-    struct hvm_hw_pit_channel *s;
-    int i;
-
-    if ( !has_vpit(d) )
-        return;
-
-    if ( is_hvm_domain(d) )
-    {
-        TRACE_0D(TRC_HVM_EMUL_PIT_STOP_TIMER);
-        destroy_periodic_time(&pit->pt0);
-        pit->pt0.source = PTSRC_isa;
-    }
-
-    spin_lock(&pit->lock);
-
-    for ( i = 0; i < 3; i++ )
-    {
-        s = &pit->hw.channels[i];
-        s->mode = 0xff; /* the init mode */
-        s->gate = (i != 2);
-        pit_load_count(pit, i, 0);
-    }
-
-    spin_unlock(&pit->lock);
-}
-
-void pit_init(struct domain *d)
-{
-    PITState *pit = domain_vpit(d);
-
-    if ( !has_vpit(d) )
-        return;
-
-    spin_lock_init(&pit->lock);
-
-    if ( is_hvm_domain(d) )
-    {
-        register_portio_handler(d, PIT_BASE, 4, handle_pit_io);
-        register_portio_handler(d, 0x61, 1, handle_speaker_io);
-    }
-
-    pit_reset(d);
-}
-
-void pit_deinit(struct domain *d)
-{
-    PITState *pit = domain_vpit(d);
-
-    if ( !has_vpit(d) )
-        return;
-
-    if ( is_hvm_domain(d) )
-    {
-        TRACE_0D(TRC_HVM_EMUL_PIT_STOP_TIMER);
-        destroy_periodic_time(&pit->pt0);
-    }
-}
-
-/* the intercept action for PIT DM retval:0--not handled; 1--handled */  
+/* the intercept action for PIT DM retval:0--not handled; 1--handled */
 static int cf_check handle_pit_io(
     int dir, unsigned int port, unsigned int bytes, uint32_t *val)
 {
@@ -620,6 +554,67 @@ int pv_pit_handler(int port, int data, int write)
     return !write ? ioreq.data : 0;
 }
 
+void pit_reset(struct domain *d)
+{
+    PITState *pit = domain_vpit(d);
+    struct hvm_hw_pit_channel *s;
+    int i;
+
+    if ( !has_vpit(d) )
+        return;
+
+    if ( is_hvm_domain(d) )
+    {
+        TRACE_0D(TRC_HVM_EMUL_PIT_STOP_TIMER);
+        destroy_periodic_time(&pit->pt0);
+        pit->pt0.source = PTSRC_isa;
+    }
+
+    spin_lock(&pit->lock);
+
+    for ( i = 0; i < 3; i++ )
+    {
+        s = &pit->hw.channels[i];
+        s->mode = 0xff; /* the init mode */
+        s->gate = (i != 2);
+        pit_load_count(pit, i, 0);
+    }
+
+    spin_unlock(&pit->lock);
+}
+
+void pit_init(struct domain *d)
+{
+    PITState *pit = domain_vpit(d);
+
+    if ( !has_vpit(d) )
+        return;
+
+    spin_lock_init(&pit->lock);
+
+    if ( is_hvm_domain(d) )
+    {
+        register_portio_handler(d, PIT_BASE, 4, handle_pit_io);
+        register_portio_handler(d, 0x61, 1, handle_speaker_io);
+    }
+
+    pit_reset(d);
+}
+
+void pit_deinit(struct domain *d)
+{
+    PITState *pit = domain_vpit(d);
+
+    if ( !has_vpit(d) )
+        return;
+
+    if ( is_hvm_domain(d) )
+    {
+        TRACE_0D(TRC_HVM_EMUL_PIT_STOP_TIMER);
+        destroy_periodic_time(&pit->pt0);
+    }
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.34.1


