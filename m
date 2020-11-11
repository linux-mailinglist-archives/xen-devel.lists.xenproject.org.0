Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C012AF119
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 13:45:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24713.52084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcpVG-0005tD-Bf; Wed, 11 Nov 2020 12:45:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24713.52084; Wed, 11 Nov 2020 12:45:34 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcpVG-0005so-88; Wed, 11 Nov 2020 12:45:34 +0000
Received: by outflank-mailman (input) for mailman id 24713;
 Wed, 11 Nov 2020 12:45:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ttLz=ER=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kcpVE-0005sj-Ei
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 12:45:32 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1fac7159-7aec-46a3-80ae-c5c7bb35efa8;
 Wed, 11 Nov 2020 12:45:29 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ttLz=ER=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kcpVE-0005sj-Ei
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 12:45:32 +0000
X-Inumbo-ID: 1fac7159-7aec-46a3-80ae-c5c7bb35efa8
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 1fac7159-7aec-46a3-80ae-c5c7bb35efa8;
	Wed, 11 Nov 2020 12:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605098729;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wOOaUGGr8yuGb3kdKrSs9X8NrLohjLcCYBJmLWeB+Rc=;
  b=C7OHBe3m2xDAK4QHIoTDBEmVJrtq1ZDSG+7MwkJrXvV6iiR7luFbG0gg
   Mv+RUp9csSqo/wXgNBTsMTyCwx3MiYXwfqAc3qZ9eNWZ683ahfhJinMdm
   qpuZVIw26GSi7vCc1zRbyCXXA44Wd7LylLyvG8K6GI9anNDQjqAekcD50
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 7hJHVumaeqUa2QZfLZhaNCM5d21SmxemD0EJmWzkQyRsAM4wxfe6x5X+IJb2AqOMwyDA1906FM
 nL67wMsPi0GEUjm/a+aCkiEV4rku92rxYSNgMp11D0LAILztepA/S8Dj74OIAMtnEnkQXWwyE6
 uYBp8WS/cKY7U4F6VZsTF9wjCANaRVq8IM3Mh5NnIEHBVdIg6d06hKEWsz8r+ndyhR8hyt6prp
 nXLlWOGtUS/EtYFG9RK0xfALhOH9kMfEZk2Ucal91VOAQR+y44U8yo1Ld321/Do4eeXdM7bGwc
 h4I=
X-SBRS: None
X-MesageID: 30970913
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,469,1596513600"; 
   d="scan'208";a="30970913"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] xen/x86: Work around Clang code generation bug with asm parameters
Date: Wed, 11 Nov 2020 12:45:12 +0000
Message-ID: <20201111124512.2268-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Clang 9 and later don't handle the clobber of %r10 correctly in
_hypercall64_4().  See https://bugs.llvm.org/show_bug.cgi?id=48122

Rewrite the logic to use the "+r" form, rather than using separate input and
output specifiers, which works around the issue.  For consistency, adjust all
operand handling.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/include/asm-x86/guest/xen-hcall.h | 35 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/xen/include/asm-x86/guest/xen-hcall.h b/xen/include/asm-x86/guest/xen-hcall.h
index 03d5868a9e..3240d9807b 100644
--- a/xen/include/asm-x86/guest/xen-hcall.h
+++ b/xen/include/asm-x86/guest/xen-hcall.h
@@ -39,53 +39,50 @@
 
 #define _hypercall64_1(type, hcall, a1)                                 \
     ({                                                                  \
-        long res, tmp__;                                                \
+        long res, _a1 = (long)(a1);                                     \
         asm volatile (                                                  \
             "call hypercall_page + %c[offset]"                          \
-            : "=a" (res), "=D" (tmp__) ASM_CALL_CONSTRAINT              \
-            : [offset] "i" (hcall * 32),                                \
-              "1" ((long)(a1))                                          \
+            : "=a" (res), "+D" (_a1) ASM_CALL_CONSTRAINT                \
+            : [offset] "i" (hcall * 32)                                 \
             : "memory" );                                               \
         (type)res;                                                      \
     })
 
 #define _hypercall64_2(type, hcall, a1, a2)                             \
     ({                                                                  \
-        long res, tmp__;                                                \
+        long res, _a1 = (long)(a1), _a2 = (long)(a2);                   \
         asm volatile (                                                  \
             "call hypercall_page + %c[offset]"                          \
-            : "=a" (res), "=D" (tmp__), "=S" (tmp__)                    \
+            : "=a" (res), "+D" (_a1), "+S" (_a2)                        \
               ASM_CALL_CONSTRAINT                                       \
-            : [offset] "i" (hcall * 32),                                \
-              "1" ((long)(a1)), "2" ((long)(a2))                        \
+            : [offset] "i" (hcall * 32)                                 \
             : "memory" );                                               \
         (type)res;                                                      \
     })
 
 #define _hypercall64_3(type, hcall, a1, a2, a3)                         \
     ({                                                                  \
-        long res, tmp__;                                                \
+        long res, _a1 = (long)(a1), _a2 = (long)(a2),                   \
+            _a3 = (long)(a3);                                           \
         asm volatile (                                                  \
             "call hypercall_page + %c[offset]"                          \
-            : "=a" (res), "=D" (tmp__), "=S" (tmp__), "=d" (tmp__)      \
+            : "=a" (res), "+D" (_a1), "+S" (_a2), "+d" (_a3)            \
               ASM_CALL_CONSTRAINT                                       \
-            : [offset] "i" (hcall * 32),                                \
-              "1" ((long)(a1)), "2" ((long)(a2)), "3" ((long)(a3))      \
+            : [offset] "i" (hcall * 32)                                 \
             : "memory" );                                               \
         (type)res;                                                      \
     })
 
 #define _hypercall64_4(type, hcall, a1, a2, a3, a4)                     \
     ({                                                                  \
-        long res, tmp__;                                                \
-        register long _a4 asm ("r10") = ((long)(a4));                   \
+        long res, _a1 = (long)(a1), _a2 = (long)(a2),                   \
+            _a3 = (long)(a3);                                           \
+        register long _a4 asm ("r10") = (long)(a4);                     \
         asm volatile (                                                  \
             "call hypercall_page + %c[offset]"                          \
-            : "=a" (res), "=D" (tmp__), "=S" (tmp__), "=d" (tmp__),     \
-              "=&r" (tmp__) ASM_CALL_CONSTRAINT                         \
-            : [offset] "i" (hcall * 32),                                \
-              "1" ((long)(a1)), "2" ((long)(a2)), "3" ((long)(a3)),     \
-              "4" (_a4)                                                 \
+            : "=a" (res), "+D" (_a1), "+S" (_a2), "+d" (_a3)            \
+              "+r" (_a4) ASM_CALL_CONSTRAINT                            \
+            : [offset] "i" (hcall * 32)                                 \
             : "memory" );                                               \
         (type)res;                                                      \
     })
-- 
2.11.0


