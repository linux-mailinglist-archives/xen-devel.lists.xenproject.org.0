Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEE83E47E8
	for <lists+xen-devel@lfdr.de>; Mon,  9 Aug 2021 16:48:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165020.301572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mD6Zm-0006DA-N9; Mon, 09 Aug 2021 14:48:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165020.301572; Mon, 09 Aug 2021 14:48:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mD6Zm-0006BA-JC; Mon, 09 Aug 2021 14:48:26 +0000
Received: by outflank-mailman (input) for mailman id 165020;
 Mon, 09 Aug 2021 14:48:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kFlj=NA=cs.pub.ro=costin.lupu@srs-us1.protection.inumbo.net>)
 id 1mD6Zk-0005Xf-Gr
 for xen-devel@lists.xenproject.org; Mon, 09 Aug 2021 14:48:24 +0000
Received: from mx.upb.ro (unknown [141.85.13.231])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d27da33e-f920-11eb-9f1d-12813bfff9fa;
 Mon, 09 Aug 2021 14:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 212E3B56008E;
 Mon,  9 Aug 2021 17:48:13 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 5XriUPtlryBL; Mon,  9 Aug 2021 17:48:10 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 4CA23B5600A7;
 Mon,  9 Aug 2021 17:48:10 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id R56SC_X4Ih3V; Mon,  9 Aug 2021 17:48:10 +0300 (EEST)
Received: from localhost.localdomain (unknown [86.121.144.181])
 by mx.upb.ro (Postfix) with ESMTPSA id 2DDA7B56008E;
 Mon,  9 Aug 2021 17:48:09 +0300 (EEST)
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
X-Inumbo-ID: d27da33e-f920-11eb-9f1d-12813bfff9fa
X-Virus-Scanned: amavisd-new at upb.ro
From: Costin Lupu <costin.lupu@cs.pub.ro>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/4] public: Add page related definitions for accessing guests memory
Date: Mon,  9 Aug 2021 17:47:56 +0300
Message-Id: <b397d346dcd6243d1957b3e4cfe7a09a6bd1c1b4.1628519855.git.costin.lupu@cs.pub.ro>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1628519855.git.costin.lupu@cs.pub.ro>
References: <cover.1628519855.git.costin.lupu@cs.pub.ro>
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

For this patch we set the same values for both x86 and ARM architectures.

Signed-off-by: Costin Lupu <costin.lupu@cs.pub.ro>
---
 xen/include/public/arch-arm/page.h | 34 ++++++++++++++++++++++++++
 xen/include/public/arch-x86/page.h | 34 ++++++++++++++++++++++++++
 xen/include/public/page.h          | 38 ++++++++++++++++++++++++++++++
 3 files changed, 106 insertions(+)
 create mode 100644 xen/include/public/arch-arm/page.h
 create mode 100644 xen/include/public/arch-x86/page.h
 create mode 100644 xen/include/public/page.h

diff --git a/xen/include/public/arch-arm/page.h b/xen/include/public/arch=
-arm/page.h
new file mode 100644
index 0000000000..e970feb49c
--- /dev/null
+++ b/xen/include/public/arch-arm/page.h
@@ -0,0 +1,34 @@
+/***********************************************************************=
*******
+ * page.h
+ *
+ * Page definitions for accessing guests memory on ARM
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
+#ifndef __XEN_PUBLIC_ARCH_ARM_PAGE_H__
+#define __XEN_PUBLIC_ARCH_ARM_PAGE_H__
+
+#define XEN_PAGE_SHIFT           12
+#define XEN_PAGE_SIZE            (1UL << XEN_PAGE_SHIFT)
+#define XEN_PAGE_MASK            (~(XEN_PAGE_SIZE - 1))
+
+#endif /* __XEN_PUBLIC_ARCH_ARM_PAGE_H__ */
diff --git a/xen/include/public/arch-x86/page.h b/xen/include/public/arch=
-x86/page.h
new file mode 100644
index 0000000000..b1924ea3cb
--- /dev/null
+++ b/xen/include/public/arch-x86/page.h
@@ -0,0 +1,34 @@
+/***********************************************************************=
*******
+ * page.h
+ *
+ * Page definitions for accessing guests memory on x86
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
+#ifndef __XEN_PUBLIC_ARCH_X86_PAGE_H__
+#define __XEN_PUBLIC_ARCH_X86_PAGE_H__
+
+#define XEN_PAGE_SHIFT           12
+#define XEN_PAGE_SIZE            (1UL << XEN_PAGE_SHIFT)
+#define XEN_PAGE_MASK            (~(XEN_PAGE_SIZE - 1))
+
+#endif /* __XEN_PUBLIC_ARCH_X86_PAGE_H__ */
diff --git a/xen/include/public/page.h b/xen/include/public/page.h
new file mode 100644
index 0000000000..d3e95fdb4a
--- /dev/null
+++ b/xen/include/public/page.h
@@ -0,0 +1,38 @@
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
+#if defined(__i386__) || defined(__x86_64__)
+#include "arch-x86/page.h"
+#elif defined (__arm__) || defined (__aarch64__)
+#include "arch-arm/page.h"
+#else
+#error "Unsupported architecture"
+#endif
+
+#endif /* __XEN_PUBLIC_PAGE_H__ */
--=20
2.20.1


