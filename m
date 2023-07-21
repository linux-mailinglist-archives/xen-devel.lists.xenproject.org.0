Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF1D75D04A
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 19:03:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567667.887007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMtX6-0002zE-Fg; Fri, 21 Jul 2023 17:03:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567667.887007; Fri, 21 Jul 2023 17:03:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMtX6-0002vi-Ar; Fri, 21 Jul 2023 17:03:12 +0000
Received: by outflank-mailman (input) for mailman id 567667;
 Fri, 21 Jul 2023 17:03:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NI5b=DH=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qMtX5-0002su-2M
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 17:03:11 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7735ddd6-27e8-11ee-8611-37d641c3527e;
 Fri, 21 Jul 2023 19:03:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id A9EF38285A38;
 Fri, 21 Jul 2023 12:03:07 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id l0yDkxV9icTe; Fri, 21 Jul 2023 12:03:06 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id A766C82854B9;
 Fri, 21 Jul 2023 12:03:06 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 48LnXrMlU6Zm; Fri, 21 Jul 2023 12:03:06 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 45715828595C;
 Fri, 21 Jul 2023 12:03:06 -0500 (CDT)
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
X-Inumbo-ID: 7735ddd6-27e8-11ee-8611-37d641c3527e
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com A766C82854B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1689958986; bh=5BKPx6suFK1+ADUkLZOgesyhysDJmQwNfyKldiRHhA4=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=SURVH41qAVPMC5b5EA14Bdc9QA9CBTpegQPILnyETN2hFEBtoNjwhatpgAtHh9OF6
	 xlBHXdEU9UhAMWhij8jPkceWcAKRtSwa2MdY86Lpu5U7uaL2tID+GBXVjXdJ6D0a8k
	 iF5lXhKKalAfyN8KS0vVOHS8iP+p7MyENxEH8hK0=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v5 1/4] common: Move a few more standalone macros from xen/lib.h to xen/macros.h
Date: Fri, 21 Jul 2023 12:02:52 -0500
Message-Id: <4f4d87438933b39859f8e3e8009092056fe8c885.1689958538.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1689958538.git.sanastasio@raptorengineering.com>
References: <cover.1689958538.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Move a few more macros which have no dependencies on other headers from
xen/lib.h to xen/macros.h. Notably, this includes BUILD_BUG_ON* and
ARRAY_SIZE.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 xen/include/xen/lib.h    | 28 ----------------------------
 xen/include/xen/macros.h | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 28 deletions(-)

diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index dae2a1f085..359cfdc784 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -21,24 +21,6 @@
     unlikely(ret_warn_on_);             \
 })
=20
-/* All clang versions supported by Xen have _Static_assert. */
-#if defined(__clang__) || \
-    (__GNUC__ > 4 || (__GNUC__ =3D=3D 4 && __GNUC_MINOR__ >=3D 6))
-/* Force a compilation error if condition is true */
-#define BUILD_BUG_ON(cond) ({ _Static_assert(!(cond), "!(" #cond ")"); }=
)
-
-/* Force a compilation error if condition is true, but also produce a
-   result (of value 0 and type size_t), so the expression can be used
-   e.g. in a structure initializer (or where-ever else comma expressions
-   aren't permitted). */
-#define BUILD_BUG_ON_ZERO(cond) \
-    (sizeof(struct { char c; _Static_assert(!(cond), "!(" #cond ")"); })=
 & 0)
-#else
-#define BUILD_BUG_ON_ZERO(cond) \
-    (sizeof(struct { unsigned u : !(cond); }) & 0)
-#define BUILD_BUG_ON(cond) ((void)BUILD_BUG_ON_ZERO(cond))
-#endif
-
 #ifndef NDEBUG
 #define ASSERT(p) \
     do { if ( unlikely(!(p)) ) assert_failed(#p); } while (0)
@@ -48,16 +30,6 @@
 #define ASSERT_UNREACHABLE() do { } while (0)
 #endif
=20
-#define ABS(_x) ({                              \
-    typeof(_x) __x =3D (_x);                      \
-    (__x < 0) ? -__x : __x;                     \
-})
-
-#define SWAP(_a, _b) \
-   do { typeof(_a) _t =3D (_a); (_a) =3D (_b); (_b) =3D _t; } while ( 0 =
)
-
-#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]) + __must_be_array(x))
-
 #define __ACCESS_ONCE(x) ({                             \
             (void)(typeof(x))0; /* Scalar typecheck. */ \
             (volatile typeof(x) *)&(x); })
diff --git a/xen/include/xen/macros.h b/xen/include/xen/macros.h
index 7b92d34504..d0caae7db2 100644
--- a/xen/include/xen/macros.h
+++ b/xen/include/xen/macros.h
@@ -22,6 +22,40 @@
 #define __STR(...) #__VA_ARGS__
 #define STR(...) __STR(__VA_ARGS__)
=20
+#ifndef __ASSEMBLY__
+
+/* All clang versions supported by Xen have _Static_assert. */
+#if defined(__clang__) || \
+    (__GNUC__ > 4 || (__GNUC__ =3D=3D 4 && __GNUC_MINOR__ >=3D 6))
+/* Force a compilation error if condition is true */
+#define BUILD_BUG_ON(cond) ({ _Static_assert(!(cond), "!(" #cond ")"); }=
)
+
+/*
+ * Force a compilation error if condition is true, but also produce a
+ * result (of value 0 and type size_t), so the expression can be used
+ * e.g. in a structure initializer (or where-ever else comma expressions
+ * aren't permitted).
+ */
+#define BUILD_BUG_ON_ZERO(cond) \
+    (sizeof(struct { char c; _Static_assert(!(cond), "!(" #cond ")"); })=
 & 0)
+#else
+#define BUILD_BUG_ON_ZERO(cond) \
+    (sizeof(struct { unsigned u : !(cond); }) & 0)
+#define BUILD_BUG_ON(cond) ((void)BUILD_BUG_ON_ZERO(cond))
+#endif
+
+#define ABS(x) ({                              \
+    typeof(x) x_ =3D (x);                        \
+    (x_ < 0) ? -x_ : x_;                       \
+})
+
+#define SWAP(a, b) \
+   do { typeof(a) t_ =3D (a); (a) =3D (b); (b) =3D t_; } while ( 0 )
+
+#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]) + __must_be_array(x))
+
+#endif /* __ASSEMBLY__ */
+
 #endif /* __MACROS_H__ */
=20
 /*
--=20
2.30.2


