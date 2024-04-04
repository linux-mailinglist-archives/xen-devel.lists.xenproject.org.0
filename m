Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43376898270
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 09:50:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700706.1094260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsHqv-0004Tp-WC; Thu, 04 Apr 2024 07:49:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700706.1094260; Thu, 04 Apr 2024 07:49:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsHqv-0004M7-TN; Thu, 04 Apr 2024 07:49:41 +0000
Received: by outflank-mailman (input) for mailman id 700706;
 Thu, 04 Apr 2024 07:49:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WQJu=LJ=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rsHqu-00044q-3E
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 07:49:40 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3288060-f257-11ee-afe5-a90da7624cb6;
 Thu, 04 Apr 2024 09:49:38 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-82-59-164-46.retail.telecomitalia.it [82.59.164.46])
 by support.bugseng.com (Postfix) with ESMTPSA id 0723F4EE0744;
 Thu,  4 Apr 2024 09:49:38 +0200 (CEST)
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
X-Inumbo-ID: e3288060-f257-11ee-afe5-a90da7624cb6
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2 2/2] vsprintf: address violations of MISRA C:2012 Rule 16.3
Date: Thu,  4 Apr 2024 09:49:29 +0200
Message-Id: <9705ea09d3dac2e569c075cd9bd7f594796b12c1.1712215939.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712215939.git.federico.serafini@bugseng.com>
References: <cover.1712215939.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C:2012 Rule 16.3 states: "An unconditional `break' statement
shall terminate every switch-clause".

In order to meet the requirements to deviate the rule:
1) refactor the for loop to make the switch-clause ending with a
   return statement (note that adding a break at the end of the
   switch-clause would result in a violation of Rule 2.1
   "A project shall not contain unreachable code");
2) add pseudo-keyword fallthrough.

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Changes in v2:
- improved commit message.
---
 xen/common/vsprintf.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/xen/common/vsprintf.c b/xen/common/vsprintf.c
index c49631c0a4..612751c90f 100644
--- a/xen/common/vsprintf.c
+++ b/xen/common/vsprintf.c
@@ -377,7 +377,7 @@ static char *pointer(char *str, const char *end, const char **fmt_ptr,
             str = number(str, end, hex_buffer[i], 16, 2, -1, ZEROPAD);
 
             if ( ++i == field_width )
-                return str;
+                break;
 
             if ( sep )
             {
@@ -386,6 +386,8 @@ static char *pointer(char *str, const char *end, const char **fmt_ptr,
                 ++str;
             }
         }
+
+        return str;
     }
 
     case 'p': /* PCI SBDF. */
@@ -619,6 +621,7 @@ int vsnprintf(char *buf, size_t size, const char *fmt, va_list args)
 
         case 'X':
             flags |= LARGE;
+            fallthrough;
         case 'x':
             base = 16;
             break;
@@ -626,6 +629,7 @@ int vsnprintf(char *buf, size_t size, const char *fmt, va_list args)
         case 'd':
         case 'i':
             flags |= SIGN;
+            fallthrough;
         case 'u':
             break;
 
-- 
2.34.1


