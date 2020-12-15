Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A4E2DA821
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 07:34:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52898.92316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp3tl-00047L-9n; Tue, 15 Dec 2020 06:33:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52898.92316; Tue, 15 Dec 2020 06:33:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp3tl-00046w-5w; Tue, 15 Dec 2020 06:33:25 +0000
Received: by outflank-mailman (input) for mailman id 52898;
 Tue, 15 Dec 2020 06:33:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2CwE=FT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kp3tk-00046r-5L
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 06:33:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 138b3650-0177-4f7b-98cf-ded85c10019b;
 Tue, 15 Dec 2020 06:33:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 609B7AC90;
 Tue, 15 Dec 2020 06:33:22 +0000 (UTC)
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
X-Inumbo-ID: 138b3650-0177-4f7b-98cf-ded85c10019b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608014002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G+FLQAaWCnWATda39k47mXPhSQZGTuR/oZbC6qRnuMI=;
	b=Gw3pGzd139wdCkMm/9aLspEJFkuERVBdp7bR1ykYginclAc4whDUuo9szWH62hPL8NCg7g
	iFvvig0wcf8FNyhWhCCnj0yjrwEiV39qyexQJVeLWG8bRoK4YWbQ2RdsssPklcbo+bA0hy
	m5p2cGNiyQVsuM1UD283PhnWbVsrtsQ=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 2/3] xen: enable keyhandlers to work without register set specified
Date: Tue, 15 Dec 2020 07:33:18 +0100
Message-Id: <20201215063319.23290-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201215063319.23290-1-jgross@suse.com>
References: <20201215063319.23290-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are only two keyhandlers which make use of the cpu_user_regs
struct passed to them. In order to be able to call any keyhandler in
non-interrupt contexts, too, modify those two handlers to copy with a
NULL regs pointer by using run_in_exception_handler() in that case.

Suggested-by: Julien Grall <julien@xen.org>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V4:
- new patch
---
 xen/common/keyhandler.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
index 68364e987d..38020a1360 100644
--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -181,7 +181,10 @@ static void dump_registers(unsigned char key, struct cpu_user_regs *regs)
     cpumask_copy(&dump_execstate_mask, &cpu_online_map);
 
     /* Get local execution state out immediately, in case we get stuck. */
-    dump_execstate(regs);
+    if ( regs )
+        dump_execstate(regs);
+    else
+        run_in_exception_handler(dump_execstate);
 
     /* Alt. handling: remaining CPUs are dumped asynchronously one-by-one. */
     if ( alt_key_handling )
@@ -481,15 +484,23 @@ static void run_all_keyhandlers(unsigned char key, struct cpu_user_regs *regs)
     tasklet_schedule(&run_all_keyhandlers_tasklet);
 }
 
-static void do_debug_key(unsigned char key, struct cpu_user_regs *regs)
+static void do_debugger_trap_fatal(struct cpu_user_regs *regs)
 {
-    printk("'%c' pressed -> trapping into debugger\n", key);
     (void)debugger_trap_fatal(0xf001, regs);
 
     /* Prevent tail call optimisation, which confuses xendbg. */
     barrier();
 }
 
+static void do_debug_key(unsigned char key, struct cpu_user_regs *regs)
+{
+    printk("'%c' pressed -> trapping into debugger\n", key);
+    if ( regs )
+        do_debugger_trap_fatal(regs);
+    else
+        run_in_exception_handler(do_debugger_trap_fatal);
+}
+
 static void do_toggle_alt_key(unsigned char key, struct cpu_user_regs *regs)
 {
     alt_key_handling = !alt_key_handling;
-- 
2.26.2


