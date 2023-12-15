Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA6F814F8B
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 19:15:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655292.1022997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rEChx-0003mX-TO; Fri, 15 Dec 2023 18:14:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655292.1022997; Fri, 15 Dec 2023 18:14:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rEChx-0003jg-QG; Fri, 15 Dec 2023 18:14:45 +0000
Received: by outflank-mailman (input) for mailman id 655292;
 Fri, 15 Dec 2023 18:14:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xt8Y=H2=citrix.com=prvs=706e6129d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1rEChw-0003jY-0h
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 18:14:44 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf0bbfb2-9b75-11ee-98ea-6d05b1d4d9a1;
 Fri, 15 Dec 2023 19:14:40 +0100 (CET)
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
X-Inumbo-ID: cf0bbfb2-9b75-11ee-98ea-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1702664080;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yXDBjaPcuOw/xCtDwRwQPhmDviMcMBFl67n9XyYACmQ=;
  b=KsA6OMHJwSm17WxBIqgXWA54059QBIR3WLYl670qS+0Y4COLkWiJKNCW
   sdvpV3mqIrdtVCqNQuFxyy/ICxbRCJPNrz6Ps8Lzb+hjd4cLwrFqa45yE
   pCvQg1XGrmkwrO8cikrzGmmeSyKnQA7YLkg6qTER/yoN+s5rQSZjVsVHg
   s=;
X-CSE-ConnectionGUID: EbfGol2xRT6TFvuMP1WoPw==
X-CSE-MsgGUID: 59wrAI4lSFaR4S7u+PqXbg==
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 128813335
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:XGSj6a6fi73/StDlUAnVvwxRtDDHchMFZxGqfqrLsTDasY5as4F+v
 jEZWjzSPv2INGLweIwkYYS39E1U757WxoJjTwE5qis8Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRG/ykTraCY3gtLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU34JwehBtC5gZlPKoS4QeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m2
 PYWBzcJNAC5u7yK7qymb9E1ucMbM5y+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmRJUIXUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0MxBbI/
 zmdpDmR7hcyaY2A0xOkrnaXqOb1wRikRcEqDY2y+as/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c/h6HvA+6QqN4rHJ+AvfDW8BJhZac8AvvsIyQT0s1
 3eKksnvCDgpt6eaIVqC8p+EoDX0PjIaRUcAeCsFQA0t89Tl5oYpgXrnQNtvHbS0hdqzAjzqy
 j6LqikWjagclsMN2OOw+lWvvt63jsGXFEhvvFyRBz/0qFwhDGK4W2C2wXXR49lHKNyJdGXfg
 FYahu2mtd8JNY7YwURhX94x8KGVC+etaWKE2wM+RcJ9p1yQF2ifkZe8CQySxXuF0e5eIFcFm
 GeJ5WtsCGZ7ZRNGl5NfbYOrENgNxqP9D9njXf28RoMROsIsK17fonAzNRH4M4XRfK8EyPBXB
 HtmWZz0USZy5VpPlWLeqxghPU8DmXllmDK7qWHTxBW7y7uODEN5up9cWGZimtsRtfveyC2Mq
 oY3Cid/40kHOAEISnWNoNF7wJFjBSRTOK0aXOQKJrfYelQ5RzFJ5j246epJRrGJVp99zo/gl
 kxRkGcBoLYjrRUr8Tm3V00=
IronPort-HdrOrdr: A9a23:3x4eZq8tOSPbjELZWvluk+DgI+orL9Y04lQ7vn2YSXRuHPBw8P
 re+sjztCWE8Ar5N0tBpTntAsW9qDbnhPtICOoqTNCftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAtFD4bbLbGSS4/yU3ODBKadD/OW6
X-Talos-CUID: 9a23:EowecWExNFxvwbXAqmJK/kA7HcR/Ykfhkkv+PVKdMT9WT4WKHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AqUtyyA/eGEIwUGKhtPfzKk6Qf5o5/L6HKRwJqrs?=
 =?us-ascii?q?PgZW/ajEzAy6thjviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.04,279,1695700800"; 
   d="scan'208";a="128813335"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Federico Serafini <federico.serafini@bugseng.com>
Subject: [PATCH 2/2] xen/bug: Complete outstanding TODO
Date: Fri, 15 Dec 2023 18:14:33 +0000
Message-ID: <20231215181433.1588532-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231215181433.1588532-1-andrew.cooper3@citrix.com>
References: <20231215181433.1588532-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Since this TODO was written, BUILD_BUG_ON() has been moved out of xen/lib.h
into xen/macros.h, which has done all the hard work.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/include/xen/bug.h | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/xen/include/xen/bug.h b/xen/include/xen/bug.h
index cb5138410ea7..8cca4486a477 100644
--- a/xen/include/xen/bug.h
+++ b/xen/include/xen/bug.h
@@ -20,7 +20,8 @@
 #define BUG_DEBUGGER_TRAP_FATAL(regs) 0
 #endif
 
-#include <xen/lib.h>
+#include <xen/macros.h>
+#include <xen/types.h>
 
 #ifndef BUG_FRAME_STRUCT
 
@@ -104,14 +105,11 @@ typedef void bug_fn_t(const struct cpu_user_regs *regs);
 
 #ifndef run_in_exception_handler
 
-/*
- * TODO: untangle header dependences, break BUILD_BUG_ON() out of xen/lib.h,
- * and use a real static inline here to get proper type checking of fn().
- */
-#define run_in_exception_handler(fn) do {                   \
-    (void)((fn) == (void (*)(struct cpu_user_regs *))NULL); \
-    BUG_FRAME(BUGFRAME_run_fn, 0, fn, 0, NULL);             \
-} while ( false )
+static void always_inline run_in_exception_handler(
+    void (*fn)(struct cpu_user_regs *regs))
+{
+    BUG_FRAME(BUGFRAME_run_fn, 0, fn, 0, NULL);
+}
 
 #endif /* run_in_exception_handler */
 
-- 
2.30.2


