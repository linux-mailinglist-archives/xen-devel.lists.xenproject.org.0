Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA47812FB9
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 13:09:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654523.1021511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDkWJ-0001i7-5j; Thu, 14 Dec 2023 12:08:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654523.1021511; Thu, 14 Dec 2023 12:08:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDkWI-0001Wq-SQ; Thu, 14 Dec 2023 12:08:50 +0000
Received: by outflank-mailman (input) for mailman id 654523;
 Thu, 14 Dec 2023 12:08:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vWU9=HZ=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rDkWH-0000tC-BT
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 12:08:49 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 896fae79-9a79-11ee-98e9-6d05b1d4d9a1;
 Thu, 14 Dec 2023 13:08:48 +0100 (CET)
Received: from beta.station (net-37-182-35-120.cust.vodafonedsl.it
 [37.182.35.120])
 by support.bugseng.com (Postfix) with ESMTPSA id CEBE34EE0C8D;
 Thu, 14 Dec 2023 13:08:47 +0100 (CET)
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
X-Inumbo-ID: 896fae79-9a79-11ee-98e9-6d05b1d4d9a1
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [PATCH 7/9] x86/hvm: address violations of MISRA C:2012 Rule 11.8
Date: Thu, 14 Dec 2023 13:07:49 +0100
Message-Id: <bfdd8f021230224e3bb1aea2aceaf2c712615ba7.1702555387.git.maria.celeste.cesario@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702555386.git.maria.celeste.cesario@bugseng.com>
References: <cover.1702555386.git.maria.celeste.cesario@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>

The xen sources contain violations of MISRA C:2012 Rule 11.8 whose
headline states:
"A conversion shall not remove any const, volatile or _Atomic qualification
from the type pointed to by a pointer".

Remove unnecessary cast.
from is a const-qualified pointer to void and the function hvm_copy_to_guest_linear
requires a const void* type argument, therefore the cast to void* is not necessary.

No functional change.

Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
---
 xen/arch/x86/hvm/hvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 35a30df3b1..523e0df57c 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -3462,7 +3462,7 @@ unsigned int copy_to_user_hvm(void *to, const void *from, unsigned int len)
         return 0;
     }
 
-    rc = hvm_copy_to_guest_linear((unsigned long)to, (void *)from, len, 0, NULL);
+    rc = hvm_copy_to_guest_linear((unsigned long)to, from, len, 0, NULL);
     return rc ? len : 0; /* fake a copy_to_user() return code */
 }
 
-- 
2.40.0


