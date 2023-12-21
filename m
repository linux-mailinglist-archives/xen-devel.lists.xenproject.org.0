Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E748781B46F
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 11:53:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658817.1028202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGGg8-0000Ml-94; Thu, 21 Dec 2023 10:53:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658817.1028202; Thu, 21 Dec 2023 10:53:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGGg8-0000KC-5x; Thu, 21 Dec 2023 10:53:24 +0000
Received: by outflank-mailman (input) for mailman id 658817;
 Thu, 21 Dec 2023 10:53:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qw+O=IA=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rGGg6-0000K6-Cg
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 10:53:22 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28037153-9fef-11ee-98eb-6d05b1d4d9a1;
 Thu, 21 Dec 2023 11:53:21 +0100 (CET)
Received: from Dell.bugseng.com (unknown [78.210.136.177])
 by support.bugseng.com (Postfix) with ESMTPSA id DDCBF4EE0742;
 Thu, 21 Dec 2023 11:53:19 +0100 (CET)
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
X-Inumbo-ID: 28037153-9fef-11ee-98eb-6d05b1d4d9a1
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN RFC] x86/uaccess: remove __{put,get}_user_bad()
Date: Thu, 21 Dec 2023 11:53:12 +0100
Message-Id: <9cf852da1c03b614bf5010132c58a18adc2a4161.1703155225.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove declarations of __put_user_bad() and __get_user_bad()
since they have no definition.
Replace their uses with a break statement to address violations of
MISRA C:2012 Rule 16.3 ("An unconditional `break' statement shall
terminate every switch-clause").
No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Several violations of Rule 16.3 come from uses of macros
get_unsafe_size() and put_unsafe_size().
Looking at the macro definitions I found __get_user_bad() and __put_user_bad().
I was wondering if instead of just adding the break statement I can also remove
such functions which seem to not have a definition.
---
 xen/arch/x86/include/asm/uaccess.h | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/include/asm/uaccess.h b/xen/arch/x86/include/asm/uaccess.h
index 7443519d5b..15b747d0c7 100644
--- a/xen/arch/x86/include/asm/uaccess.h
+++ b/xen/arch/x86/include/asm/uaccess.h
@@ -21,9 +21,6 @@ unsigned int copy_from_guest_ll(void *to, const void __user *from, unsigned int
 unsigned int copy_to_unsafe_ll(void *to, const void *from, unsigned int n);
 unsigned int copy_from_unsafe_ll(void *to, const void *from, unsigned int n);
 
-extern long __get_user_bad(void);
-extern void __put_user_bad(void);
-
 #define UA_KEEP(args...) args
 #define UA_DROP(args...)
 
@@ -208,7 +205,7 @@ do {                                                                       \
     case 8:                                                                \
         put_unsafe_asm(x, ptr, grd, retval, "q",  "", "ir", errret);       \
         break;                                                             \
-    default: __put_user_bad();                                             \
+    default: break;                                                        \
     }                                                                      \
     clac();                                                                \
 } while ( false )
@@ -227,7 +224,7 @@ do {                                                                       \
     case 2: get_unsafe_asm(x, ptr, grd, retval, "w", "=r", errret); break; \
     case 4: get_unsafe_asm(x, ptr, grd, retval, "k", "=r", errret); break; \
     case 8: get_unsafe_asm(x, ptr, grd, retval,  "", "=r", errret); break; \
-    default: __get_user_bad();                                             \
+    default: break;                                                        \
     }                                                                      \
     clac();                                                                \
 } while ( false )
-- 
2.34.1


