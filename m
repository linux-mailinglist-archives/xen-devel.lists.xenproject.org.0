Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3062F76A9C0
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 09:06:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573713.898675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQjRd-00034j-Me; Tue, 01 Aug 2023 07:05:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573713.898675; Tue, 01 Aug 2023 07:05:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQjRd-00032k-Ji; Tue, 01 Aug 2023 07:05:25 +0000
Received: by outflank-mailman (input) for mailman id 573713;
 Tue, 01 Aug 2023 07:05:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MJ0s=DS=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qQjRb-00032e-VD
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 07:05:23 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7d1b24a-3039-11ee-b259-6b7b168915f2;
 Tue, 01 Aug 2023 09:05:22 +0200 (CEST)
Received: from Dell.bugseng.com.homenet.telecomitalia.it
 (host-79-35-203-138.retail.telecomitalia.it [79.35.203.138])
 by support.bugseng.com (Postfix) with ESMTPSA id 63F004EE0737;
 Tue,  1 Aug 2023 09:05:21 +0200 (CEST)
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
X-Inumbo-ID: c7d1b24a-3039-11ee-b259-6b7b168915f2
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH] xen/lib: address violations of MISRA C:2012 Rules 8.2 and 8.3
Date: Tue,  1 Aug 2023 09:05:07 +0200
Message-Id: <18adbd526ec48a83ace2d9049671d3abd2f9c45b.1690873427.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Give a name to unnamed parameters thus addressing violations of
MISRA C:2012 Rule 8.2 ("Function types shall be in prototype form with
named parameters").
Keep consistency between parameter names and types used in function
declarations and the ones used in the corresponding function
definitions, thus addressing violations of MISRA C:2012 Rule 8.3
("All declarations of an object or function shall use the same names
and type qualifiers").

No functional changes.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/include/xen/lib.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index 359cfdc784..8eef557dd5 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -78,7 +78,7 @@ debugtrace_printk(const char *fmt, ...) {}
 
 /* Allows us to use '%p' as general-purpose machine-word format char. */
 #define _p(_x) ((void *)(unsigned long)(_x))
-extern void printk(const char *format, ...)
+extern void printk(const char *fmt, ...)
     __attribute__ ((format (printf, 1, 2)));
 
 #define printk_once(fmt, args...)               \
@@ -91,9 +91,9 @@ extern void printk(const char *format, ...)
     }                                           \
 })
 
-extern void guest_printk(const struct domain *d, const char *format, ...)
+extern void guest_printk(const struct domain *d, const char *fmt, ...)
     __attribute__ ((format (printf, 2, 3)));
-extern void noreturn panic(const char *format, ...)
+extern void noreturn panic(const char *fmt, ...)
     __attribute__ ((format (printf, 1, 2)));
 extern int __printk_ratelimit(int ratelimit_ms, int ratelimit_burst);
 extern int printk_ratelimit(void);
@@ -173,7 +173,7 @@ extern char *print_tainted(char *str);
 extern void add_taint(unsigned int taint);
 
 struct cpu_user_regs;
-void cf_check dump_execstate(struct cpu_user_regs *);
+void cf_check dump_execstate(struct cpu_user_regs *regs);
 
 void init_constructors(void);
 
-- 
2.34.1


