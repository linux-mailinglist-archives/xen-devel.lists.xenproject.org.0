Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F3B894C9A
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 09:24:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700003.1092526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrYVP-0005P5-S7; Tue, 02 Apr 2024 07:24:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700003.1092526; Tue, 02 Apr 2024 07:24:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrYVP-0005Hf-N7; Tue, 02 Apr 2024 07:24:27 +0000
Received: by outflank-mailman (input) for mailman id 700003;
 Tue, 02 Apr 2024 07:24:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tdu6=LH=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rrYVN-0003jD-MN
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 07:24:25 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0700aa4f-f0c2-11ee-afe5-a90da7624cb6;
 Tue, 02 Apr 2024 09:24:22 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-82-59-164-46.retail.telecomitalia.it [82.59.164.46])
 by support.bugseng.com (Postfix) with ESMTPSA id 5A84B4EE0745;
 Tue,  2 Apr 2024 09:24:22 +0200 (CEST)
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
X-Inumbo-ID: 0700aa4f-f0c2-11ee-afe5-a90da7624cb6
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 7/7] vsprintf: address violations of MISRA C:2012 Rule 16.3
Date: Tue,  2 Apr 2024 09:22:10 +0200
Message-Id: <b1f2dc6467571090f882ce7c0611db13a8c63555.1712042178.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712042178.git.federico.serafini@bugseng.com>
References: <cover.1712042178.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C:2012 Rule 16.3 states: "An unconditional `break' statement
shall terminate every switch-clause".

Add break statement to address violations of the rule or add
pseudo-keyword fallthrough to meet the requirements to deviate it.

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
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


