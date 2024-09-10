Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C545D9742FE
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 21:06:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795994.1205512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so6Bq-0006PO-6b; Tue, 10 Sep 2024 19:06:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795994.1205512; Tue, 10 Sep 2024 19:06:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so6Bq-0006NA-3a; Tue, 10 Sep 2024 19:06:14 +0000
Received: by outflank-mailman (input) for mailman id 795994;
 Tue, 10 Sep 2024 19:06:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hUAX=QI=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1so6Bp-0006Mx-07
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 19:06:13 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd2e0ca5-6fa7-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 21:06:09 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-79-37-206-90.retail.telecomitalia.it [79.37.206.90])
 by support.bugseng.com (Postfix) with ESMTPSA id 0E3D54EE0CC2;
 Tue, 10 Sep 2024 21:06:09 +0200 (CEST)
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
X-Inumbo-ID: bd2e0ca5-6fa7-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1725995169; bh=SjszyG5fkNoEpRwDebb1oOfNsAFVzqhPDSqYKoO21ds=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pevzR3sVk6oF8JVme1Lpef7hxQO+15WRkRnNcZwcN0D01hPRqbrNVgSHOgQaeaQnX
	 8Xv7GPD+Y+ej5kM/IdIn7msKEsh7I8L2qk28ComxxPYzKWfxq9aI+HWqrb40F3eGyP
	 kMSo5b+75XTZ9HbcE6Y5/N5c5AALE21NvMfvFcHgSP6VHXZNyvxmn0UaFcuxjU1oEe
	 TRRFxRfSyR0BR4P5ZfxC4CS6Ta4zOCLIeo3JvBHTqy9nXHq/tvC0mEIdtt6bp1Kpok
	 KLU1Cpdt4orxz2QbWrrPSCQPSoHaOD0/Hwyco444WTTf1mtcDI9BgPQxnf4pSaEbwd
	 ouSjbtVwGwc7A==
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 2/3] xen/gnttab: address violations of MISRA C Rule 13.6
Date: Tue, 10 Sep 2024 21:06:01 +0200
Message-Id: <6dd66745505bea8f8730da297d521e842026d40b.1725994633.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725994633.git.federico.serafini@bugseng.com>
References: <cover.1725994633.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor the code to improve readability and address violations of
MISRA C:2012 Rule 13.6 ("The operand of the `sizeof' operator shall
not contain any expression which has potential side effect").

No functional change.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/common/compat/grant_table.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/xen/common/compat/grant_table.c b/xen/common/compat/grant_table.c
index 5ad0debf96..4342e573c5 100644
--- a/xen/common/compat/grant_table.c
+++ b/xen/common/compat/grant_table.c
@@ -78,12 +78,15 @@ int compat_grant_table_op(
         cmd_op = cmd;
     switch ( cmd_op )
     {
-#define CASE(name) \
-    case GNTTABOP_##name: \
-        if ( unlikely(!guest_handle_okay(guest_handle_cast(uop, \
-                                                           gnttab_##name##_compat_t), \
-                                         count)) ) \
-            rc = -EFAULT; \
+#define CASE(name)                                                      \
+        case GNTTABOP_ ## name:                                         \
+        {                                                               \
+            XEN_GUEST_HANDLE_PARAM(gnttab_ ## name ## _compat_t) h =    \
+                guest_handle_cast(uop, gnttab_ ## name ## _compat_t);   \
+                                                                        \
+            if ( unlikely(!guest_handle_okay(h, count)) )               \
+                rc = -EFAULT;                                           \
+        }                                                               \
         break
 
 #ifndef CHECK_gnttab_map_grant_ref
-- 
2.34.1


