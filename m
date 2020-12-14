Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF0A2D93B8
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 08:56:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.51923.90844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koiiU-00086L-7M; Mon, 14 Dec 2020 07:56:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 51923.90844; Mon, 14 Dec 2020 07:56:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koiiU-00085w-4G; Mon, 14 Dec 2020 07:56:22 +0000
Received: by outflank-mailman (input) for mailman id 51923;
 Mon, 14 Dec 2020 07:56:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XC/h=FS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1koiiS-00084z-9R
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 07:56:20 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9baafd8a-bc33-4ffc-8299-c22e92bc3d06;
 Mon, 14 Dec 2020 07:56:18 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B1377AD4D;
 Mon, 14 Dec 2020 07:56:17 +0000 (UTC)
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
X-Inumbo-ID: 9baafd8a-bc33-4ffc-8299-c22e92bc3d06
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607932577; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KnYqlf/P+S7NcIzAGFzhLoCYbM4Ex5RUcFQo+09bQv0=;
	b=JMIzCIoqvl+4Kk85zJ96fL3dk1LmsPf7Eh90am/VZ8i3hIbfNMeKcneb9ggiJJlXwZqy9a
	5mdT6doWSYcEioBQeFwH+n+Ukf3MXE53xbmkeT+fHY/gn7OI/soD0d+F3La1R9/3W1sM5N
	tAjNq8oW73Uxicw76ymhKMK82ifFKZE=
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
Subject: [PATCH v4 2/3] xen: enable keyhandlers to work without register set specified
Date: Mon, 14 Dec 2020 08:56:14 +0100
Message-Id: <20201214075615.25038-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201214075615.25038-1-jgross@suse.com>
References: <20201214075615.25038-1-jgross@suse.com>
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
 xen/common/keyhandler.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
index 68364e987d..de120fa092 100644
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
@@ -481,15 +484,24 @@ static void run_all_keyhandlers(unsigned char key, struct cpu_user_regs *regs)
     tasklet_schedule(&run_all_keyhandlers_tasklet);
 }
 
-static void do_debug_key(unsigned char key, struct cpu_user_regs *regs)
+/* run_in_exception_handler() on Arm requires globally visible symbol. */
+void do_debugger_trap_fatal(struct cpu_user_regs *regs)
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


