Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4053F8364B5
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 14:48:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669906.1042435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRuf3-00086l-F4; Mon, 22 Jan 2024 13:48:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669906.1042435; Mon, 22 Jan 2024 13:48:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRuf3-00082c-Aw; Mon, 22 Jan 2024 13:48:25 +0000
Received: by outflank-mailman (input) for mailman id 669906;
 Mon, 22 Jan 2024 13:48:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t9EV=JA=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rRuf1-0007Ly-Vq
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 13:48:23 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e803ea05-b92c-11ee-98f2-6d05b1d4d9a1;
 Mon, 22 Jan 2024 14:48:21 +0100 (CET)
Received: from Dell.homenet.telecomitalia.it
 (host-87-16-84-78.retail.telecomitalia.it [87.16.84.78])
 by support.bugseng.com (Postfix) with ESMTPSA id 583D04EE0742;
 Mon, 22 Jan 2024 14:48:21 +0100 (CET)
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
X-Inumbo-ID: e803ea05-b92c-11ee-98f2-6d05b1d4d9a1
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 2/3] x86/uaccess: replace __{get,put}_user_bad() with static_assert_unreachable()
Date: Mon, 22 Jan 2024 14:48:07 +0100
Message-Id: <971693bc9c68e86dce793c9e613688f527db0e31.1705930767.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1705930767.git.federico.serafini@bugseng.com>
References: <cover.1705930767.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use static_assert_unreachable() to improve readability and anticipate
the build failure (from a linker error to an assembler error) in case
of wrong size.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/include/asm/uaccess.h | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/include/asm/uaccess.h b/xen/arch/x86/include/asm/uaccess.h
index 7443519d5b..ce608fc2b5 100644
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
+    default: static_assert_unreachable();                                  \
     }                                                                      \
     clac();                                                                \
 } while ( false )
@@ -227,7 +224,7 @@ do {                                                                       \
     case 2: get_unsafe_asm(x, ptr, grd, retval, "w", "=r", errret); break; \
     case 4: get_unsafe_asm(x, ptr, grd, retval, "k", "=r", errret); break; \
     case 8: get_unsafe_asm(x, ptr, grd, retval,  "", "=r", errret); break; \
-    default: __get_user_bad();                                             \
+    default: static_assert_unreachable();                                  \
     }                                                                      \
     clac();                                                                \
 } while ( false )
-- 
2.34.1


