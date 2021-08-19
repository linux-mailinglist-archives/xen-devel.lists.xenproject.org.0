Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F243F2028
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 20:49:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169066.308840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGn6K-0001Eo-2D; Thu, 19 Aug 2021 18:49:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169066.308840; Thu, 19 Aug 2021 18:49:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGn6J-0001Cw-Ri; Thu, 19 Aug 2021 18:49:15 +0000
Received: by outflank-mailman (input) for mailman id 169066;
 Thu, 19 Aug 2021 18:49:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ErsO=NK=cs.pub.ro=costin.lupu@srs-us1.protection.inumbo.net>)
 id 1mGn6H-0000ee-P0
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 18:49:13 +0000
Received: from mx.upb.ro (unknown [141.85.13.210])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 21538bc0-011e-11ec-a652-12813bfff9fa;
 Thu, 19 Aug 2021 18:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id AEA1DB5601C0;
 Thu, 19 Aug 2021 21:49:05 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id vYzLY_UwEol9; Thu, 19 Aug 2021 21:49:03 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 97263B560300;
 Thu, 19 Aug 2021 21:34:02 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id TlMOKk-SEeul; Thu, 19 Aug 2021 21:34:02 +0300 (EEST)
Received: from localhost.localdomain (unknown [86.121.144.181])
 by mx.upb.ro (Postfix) with ESMTPSA id 7042EB56168B;
 Thu, 19 Aug 2021 20:50:17 +0300 (EEST)
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
X-Inumbo-ID: 21538bc0-011e-11ec-a652-12813bfff9fa
X-Virus-Scanned: amavisd-new at upb.ro
From: Costin Lupu <costin.lupu@cs.pub.ro>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/4] public: Add page related definitions for accessing guests memory
Date: Thu, 19 Aug 2021 20:50:09 +0300
Message-Id: <1d9338102d2013addfabc0cf9275ef156fd5080f.1629395092.git.costin.lupu@cs.pub.ro>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1629395092.git.costin.lupu@cs.pub.ro>
References: <cover.1629395092.git.costin.lupu@cs.pub.ro>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

These changes introduce the page related definitions needed for mapping a=
nd
accessing guests memory. These values are intended to be used by any tool=
stack
component that needs to map guests memory. Until now, the values were def=
ined
by the xenctrl.h header, therefore whenever a component had to use them i=
t also
had to add a dependency for the xenctrl library.

This patch also introduces xen_mk_long() macrodefinition for defining lon=
g
constants both for C and assembler code.

Signed-off-by: Costin Lupu <costin.lupu@cs.pub.ro>
---
 xen/include/public/page.h | 36 ++++++++++++++++++++++++++++++++++++
 xen/include/public/xen.h  |  3 +++
 2 files changed, 39 insertions(+)
 create mode 100644 xen/include/public/page.h

diff --git a/xen/include/public/page.h b/xen/include/public/page.h
new file mode 100644
index 0000000000..6b06259bad
--- /dev/null
+++ b/xen/include/public/page.h
@@ -0,0 +1,36 @@
+/***********************************************************************=
*******
+ * page.h
+ *
+ * Page definitions for accessing guests memory
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining=
 a copy
+ * of this software and associated documentation files (the "Software"),=
 to
+ * deal in the Software without restriction, including without limitatio=
n the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, =
and/or
+ * sell copies of the Software, and to permit persons to whom the Softwa=
re is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be includ=
ed in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHA=
LL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHE=
R
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ * Copyright (c) 2021, Costin Lupu
+ */
+
+#ifndef __XEN_PUBLIC_PAGE_H__
+#define __XEN_PUBLIC_PAGE_H__
+
+#include "xen.h"
+
+#define XEN_PAGE_SHIFT           12
+#define XEN_PAGE_SIZE            (xen_mk_long(1) << XEN_PAGE_SHIFT)
+#define XEN_PAGE_MASK            (~(XEN_PAGE_SIZE - 1))
+
+#endif /* __XEN_PUBLIC_PAGE_H__ */
diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
index e373592c33..12531c02b5 100644
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -64,11 +64,13 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
=20
 /* Turn a plain number into a C unsigned (long (long)) constant. */
 #define __xen_mk_uint(x)  x ## U
+#define __xen_mk_long(x)  x ## L
 #define __xen_mk_ulong(x) x ## UL
 #ifndef __xen_mk_ullong
 # define __xen_mk_ullong(x) x ## ULL
 #endif
 #define xen_mk_uint(x)    __xen_mk_uint(x)
+#define xen_mk_long(x)    __xen_mk_long(x)
 #define xen_mk_ulong(x)   __xen_mk_ulong(x)
 #define xen_mk_ullong(x)  __xen_mk_ullong(x)
=20
@@ -76,6 +78,7 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
=20
 /* In assembly code we cannot use C numeric constant suffixes. */
 #define xen_mk_uint(x)   x
+#define xen_mk_long(x)   x
 #define xen_mk_ulong(x)  x
 #define xen_mk_ullong(x) x
=20
--=20
2.20.1


