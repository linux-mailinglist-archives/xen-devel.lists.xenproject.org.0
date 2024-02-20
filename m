Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CAC85BD49
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 14:36:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683532.1063095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcQHW-00028a-Dy; Tue, 20 Feb 2024 13:35:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683532.1063095; Tue, 20 Feb 2024 13:35:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcQHW-00026l-Aq; Tue, 20 Feb 2024 13:35:34 +0000
Received: by outflank-mailman (input) for mailman id 683532;
 Tue, 20 Feb 2024 13:35:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/fGf=J5=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rcQHU-00026f-I1
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 13:35:32 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea744172-cff4-11ee-8a52-1f161083a0e0;
 Tue, 20 Feb 2024 14:35:31 +0100 (CET)
Received: from Dell.bugseng.com (unknown [37.163.67.214])
 by support.bugseng.com (Postfix) with ESMTPSA id 78BC44EE073A;
 Tue, 20 Feb 2024 14:35:29 +0100 (CET)
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
X-Inumbo-ID: ea744172-cff4-11ee-8a52-1f161083a0e0
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH] x86/uaccess: add attribute noreturn to __{get,put}_user_bad()
Date: Tue, 20 Feb 2024 14:35:20 +0100
Message-Id: <1595eac56587d20c7f86128bc5652c31c3a72772.1708436010.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__get_user_bad() and __put_user_bad() are undefined symbols used
to assert the unreachability of a program point:
a call to one of such functions is optimized away if it is considered
unreachable by the compiler. Otherwise, a linker error is reported.

In accordance with the purpose of such constructs:
1) add the attribute noreturn to __get_user_bad() and __put_user_bad();
2) change return type of __get_user_bad() to void (returning long is a
   leftover from the past).

Point (1) meets the requirements to deviate MISRA C:2012 Rule 16.3
("An unconditional break statement shall terminate every switch
clause") since functions with noreturn attribute are considered
as allowed terminals for switch clauses.

Point (2) addresses several violations of MISRA C:2012 Rule 17.7
("The value returned by a function having non-void return type
shall be used").

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/include/asm/uaccess.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/include/asm/uaccess.h b/xen/arch/x86/include/asm/uaccess.h
index 7443519d5b..c7bafaf10f 100644
--- a/xen/arch/x86/include/asm/uaccess.h
+++ b/xen/arch/x86/include/asm/uaccess.h
@@ -21,8 +21,8 @@ unsigned int copy_from_guest_ll(void *to, const void __user *from, unsigned int
 unsigned int copy_to_unsafe_ll(void *to, const void *from, unsigned int n);
 unsigned int copy_from_unsafe_ll(void *to, const void *from, unsigned int n);
 
-extern long __get_user_bad(void);
-extern void __put_user_bad(void);
+extern void noreturn __get_user_bad(void);
+extern void noreturn __put_user_bad(void);
 
 #define UA_KEEP(args...) args
 #define UA_DROP(args...)
-- 
2.34.1


