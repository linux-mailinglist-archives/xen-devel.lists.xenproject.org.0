Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6968B3F4EEF
	for <lists+xen-devel@lfdr.de>; Mon, 23 Aug 2021 19:03:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170503.311302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIDLq-0001Oy-Pu; Mon, 23 Aug 2021 17:03:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170503.311302; Mon, 23 Aug 2021 17:03:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIDLq-0001J7-Kp; Mon, 23 Aug 2021 17:03:10 +0000
Received: by outflank-mailman (input) for mailman id 170503;
 Mon, 23 Aug 2021 17:03:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lvRo=NO=cs.pub.ro=costin.lupu@srs-us1.protection.inumbo.net>)
 id 1mIDLp-0001H2-7b
 for xen-devel@lists.xenproject.org; Mon, 23 Aug 2021 17:03:09 +0000
Received: from mx.upb.ro (unknown [141.85.13.220])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 33d58277-c271-4081-ae4c-a0dbf4362b78;
 Mon, 23 Aug 2021 17:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 2E3B2B56008F;
 Mon, 23 Aug 2021 20:03:06 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id ZXIII3mYf7jK; Mon, 23 Aug 2021 20:03:03 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 90F37B5600BF;
 Mon, 23 Aug 2021 20:03:03 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Wz-XGhTtxHKr; Mon, 23 Aug 2021 20:03:03 +0300 (EEST)
Received: from localhost.localdomain (unknown [86.121.144.181])
 by mx.upb.ro (Postfix) with ESMTPSA id 9185AB56008F;
 Mon, 23 Aug 2021 20:03:02 +0300 (EEST)
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
X-Inumbo-ID: 33d58277-c271-4081-ae4c-a0dbf4362b78
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
Subject: [PATCH v3 1/4] public: Add page related definitions for accessing guests memory
Date: Mon, 23 Aug 2021 20:02:53 +0300
Message-Id: <22031be8466bb18d1dd891481ccc67d8c2b2dd55.1629737453.git.costin.lupu@cs.pub.ro>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1629737453.git.costin.lupu@cs.pub.ro>
References: <cover.1629737453.git.costin.lupu@cs.pub.ro>
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
 xen/include/public/arch-arm.h     | 8 ++++++++
 xen/include/public/arch-x86/xen.h | 8 ++++++++
 xen/include/public/xen.h          | 9 +++++++++
 3 files changed, 25 insertions(+)

diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.=
h
index 64a2ca30da..caf7825d95 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -471,6 +471,14 @@ typedef uint64_t xen_callback_t;
 typedef struct xen_pmu_arch { uint8_t dummy; } xen_pmu_arch_t;
 #endif
=20
+#if defined(__XEN__) || defined(__XEN_TOOLS__)
+/*
+ *  Page definitions needed for accessing guests memory
+ */
+#define XEN_PAGE_SHIFT   12
+
+#endif/* __XEN__ || __XEN_TOOLS__ */
+
 #endif /*  __XEN_PUBLIC_ARCH_ARM_H__ */
=20
 /*
diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-=
x86/xen.h
index 7acd94c8eb..f9939c742b 100644
--- a/xen/include/public/arch-x86/xen.h
+++ b/xen/include/public/arch-x86/xen.h
@@ -385,6 +385,14 @@ DEFINE_XEN_GUEST_HANDLE(xen_msr_entry_t);
  */
 #define XEN_HVM_DEBUGCONS_IOPORT 0xe9
=20
+#if defined(__XEN__) || defined(__XEN_TOOLS__)
+/*
+ *  Page definitions needed for accessing guests memory
+ */
+#define XEN_PAGE_SHIFT   12
+
+#endif /* __XEN__ || __XEN_TOOLS__ */
+
 #endif /* __XEN_PUBLIC_ARCH_X86_XEN_H__ */
=20
 /*
diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
index e373592c33..c6486040b9 100644
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
@@ -1034,6 +1037,12 @@ struct xenctl_bitmap {
 typedef struct xenctl_bitmap xenctl_bitmap_t;
 #endif
=20
+/*
+ *  Page definitions needed for accessing guests memory
+ */
+#define XEN_PAGE_SIZE            (xen_mk_long(1) << XEN_PAGE_SHIFT)
+#define XEN_PAGE_MASK            (~(XEN_PAGE_SIZE - 1))
+
 #endif /* defined(__XEN__) || defined(__XEN_TOOLS__) */
=20
 #endif /* __XEN_PUBLIC_XEN_H__ */
--=20
2.20.1


