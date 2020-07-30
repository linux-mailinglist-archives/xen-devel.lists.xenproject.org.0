Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4103B23384F
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 20:19:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1D8q-0002zE-9r; Thu, 30 Jul 2020 18:18:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IK5u=BJ=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k1D8p-0002pa-7U
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 18:18:55 +0000
X-Inumbo-ID: 180bcc10-d291-11ea-ab02-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 180bcc10-d291-11ea-ab02-12813bfff9fa;
 Thu, 30 Jul 2020 18:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iYWCfYUjsOmxaTuM6icRxDZYgMO7DF187Z293r7Hn8E=; b=5wqskYdYAkiLkrpXm4p+L07UPL
 BxbyB6xLswpW0FYwHGJ+C10kQqjavS580kMSscP3oTDpO1M/IqO3H2I0RdUw63W3etGrVQ9+3EMjq
 AsKEnCsnqbo1kzVCXL3a+Tv6O/3VT44V/zpdRm0k+h5eSmenRqC9HuECpkViloXztAlE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k1D8Z-0007pd-V6; Thu, 30 Jul 2020 18:18:39 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k1D8Z-0006Uf-Ic; Thu, 30 Jul 2020 18:18:39 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [RESEND][PATCH v2 6/7] xen/guest_access: Consolidate guest access
 helpers in xen/guest_access.h
Date: Thu, 30 Jul 2020 19:18:26 +0100
Message-Id: <20200730181827.1670-7-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200730181827.1670-1-julien@xen.org>
References: <20200730181827.1670-1-julien@xen.org>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

Most of the helpers to access guest memory are implemented the same way
on Arm and x86. The only differences are:
    - guest_handle_{from, to}_param(): while on x86 XEN_GUEST_HANDLE()
      and XEN_GUEST_HANDLE_PARAM() are the same, they are not on Arm. It
      is still fine to use the Arm implementation on x86.
    - __clear_guest_offset(): Interestingly the prototype does not match
      between the x86 and Arm. However, the Arm one is bogus. So the x86
      implementation can be used.
    - guest_handle{,_subrange}_okay(): They are validly differing
      because Arm is only supporting auto-translated guest and therefore
      handles are always valid.

In the past, the ia64 and ppc64 port use a different model to access
guest parameter. They have been long gone now.

Given Xen currently only support 2 archictures, it is too soon to have a
directory asm-generic as it is not possible to differentiate it with the
existing directory xen/. If/When there is a 3rd port, we can decide to
create the new directory if that new port decide to use a different way
to access guest parameter.

For now, consolidate it in xen/guest_access.h.

While it would be possible to adjust the coding style at the same, this
is left for a follow-up patch so 'diff' can be used to check the
consolidation was done correctly.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v2:
        - Expand the commit message explaining why asm-generic is not
        created.
---
 xen/include/asm-arm/guest_access.h | 114 ---------------------------
 xen/include/asm-x86/guest_access.h | 108 --------------------------
 xen/include/xen/guest_access.h     | 119 +++++++++++++++++++++++++++++
 3 files changed, 119 insertions(+), 222 deletions(-)

diff --git a/xen/include/asm-arm/guest_access.h b/xen/include/asm-arm/guest_access.h
index b9a89c495527..53766386d3d8 100644
--- a/xen/include/asm-arm/guest_access.h
+++ b/xen/include/asm-arm/guest_access.h
@@ -23,88 +23,6 @@ int access_guest_memory_by_ipa(struct domain *d, paddr_t ipa, void *buf,
 #define __raw_copy_from_guest raw_copy_from_guest
 #define __raw_clear_guest raw_clear_guest
 
-/* Remainder copied from x86 -- could be common? */
-
-/* Is the guest handle a NULL reference? */
-#define guest_handle_is_null(hnd)        ((hnd).p == NULL)
-
-/* Offset the given guest handle into the array it refers to. */
-#define guest_handle_add_offset(hnd, nr) ((hnd).p += (nr))
-#define guest_handle_subtract_offset(hnd, nr) ((hnd).p -= (nr))
-
-/* Cast a guest handle (either XEN_GUEST_HANDLE or XEN_GUEST_HANDLE_PARAM)
- * to the specified type of XEN_GUEST_HANDLE_PARAM. */
-#define guest_handle_cast(hnd, type) ({         \
-    type *_x = (hnd).p;                         \
-    (XEN_GUEST_HANDLE_PARAM(type)) { _x };            \
-})
-
-/* Convert a XEN_GUEST_HANDLE to XEN_GUEST_HANDLE_PARAM */
-#define guest_handle_to_param(hnd, type) ({                  \
-    typeof((hnd).p) _x = (hnd).p;                            \
-    XEN_GUEST_HANDLE_PARAM(type) _y = { _x };                \
-    /* type checking: make sure that the pointers inside     \
-     * XEN_GUEST_HANDLE and XEN_GUEST_HANDLE_PARAM are of    \
-     * the same type, then return hnd */                     \
-    (void)(&_x == &_y.p);                                    \
-    _y;                                                      \
-})
-
-#define guest_handle_for_field(hnd, type, fld)          \
-    ((XEN_GUEST_HANDLE(type)) { &(hnd).p->fld })
-
-#define guest_handle_from_ptr(ptr, type)        \
-    ((XEN_GUEST_HANDLE_PARAM(type)) { (type *)ptr })
-#define const_guest_handle_from_ptr(ptr, type)  \
-    ((XEN_GUEST_HANDLE_PARAM(const_##type)) { (const type *)ptr })
-
-/*
- * Copy an array of objects to guest context via a guest handle,
- * specifying an offset into the guest array.
- */
-#define copy_to_guest_offset(hnd, off, ptr, nr) ({      \
-    const typeof(*(ptr)) *_s = (ptr);                   \
-    char (*_d)[sizeof(*_s)] = (void *)(hnd).p;          \
-    /* Check that the handle is not for a const type */ \
-    void *__maybe_unused _t = (hnd).p;                  \
-    (void)((hnd).p == _s);                              \
-    raw_copy_to_guest(_d+(off), _s, sizeof(*_s)*(nr));  \
-})
-
-/*
- * Clear an array of objects in guest context via a guest handle,
- * specifying an offset into the guest array.
- */
-#define clear_guest_offset(hnd, off, nr) ({    \
-    void *_d = (hnd).p;                        \
-    raw_clear_guest(_d+(off), nr);             \
-})
-
-/*
- * Copy an array of objects from guest context via a guest handle,
- * specifying an offset into the guest array.
- */
-#define copy_from_guest_offset(ptr, hnd, off, nr) ({    \
-    const typeof(*(ptr)) *_s = (hnd).p;                 \
-    typeof(*(ptr)) *_d = (ptr);                         \
-    raw_copy_from_guest(_d, _s+(off), sizeof(*_d)*(nr));\
-})
-
-/* Copy sub-field of a structure to guest context via a guest handle. */
-#define copy_field_to_guest(hnd, ptr, field) ({         \
-    const typeof(&(ptr)->field) _s = &(ptr)->field;     \
-    void *_d = &(hnd).p->field;                         \
-    (void)(&(hnd).p->field == _s);                      \
-    raw_copy_to_guest(_d, _s, sizeof(*_s));             \
-})
-
-/* Copy sub-field of a structure from guest context via a guest handle. */
-#define copy_field_from_guest(ptr, hnd, field) ({       \
-    const typeof(&(ptr)->field) _s = &(hnd).p->field;   \
-    typeof(&(ptr)->field) _d = &(ptr)->field;           \
-    raw_copy_from_guest(_d, _s, sizeof(*_d));           \
-})
-
 /*
  * Pre-validate a guest handle.
  * Allows use of faster __copy_* functions.
@@ -113,38 +31,6 @@ int access_guest_memory_by_ipa(struct domain *d, paddr_t ipa, void *buf,
 #define guest_handle_okay(hnd, nr) (1)
 #define guest_handle_subrange_okay(hnd, first, last) (1)
 
-#define __copy_to_guest_offset(hnd, off, ptr, nr) ({    \
-    const typeof(*(ptr)) *_s = (ptr);                   \
-    char (*_d)[sizeof(*_s)] = (void *)(hnd).p;          \
-    /* Check that the handle is not for a const type */ \
-    void *__maybe_unused _t = (hnd).p;                  \
-    (void)((hnd).p == _s);                              \
-    __raw_copy_to_guest(_d+(off), _s, sizeof(*_s)*(nr));\
-})
-
-#define __clear_guest_offset(hnd, off, ptr, nr) ({      \
-    __raw_clear_guest(_d+(off), nr);  \
-})
-
-#define __copy_from_guest_offset(ptr, hnd, off, nr) ({  \
-    const typeof(*(ptr)) *_s = (hnd).p;                 \
-    typeof(*(ptr)) *_d = (ptr);                         \
-    __raw_copy_from_guest(_d, _s+(off), sizeof(*_d)*(nr));\
-})
-
-#define __copy_field_to_guest(hnd, ptr, field) ({       \
-    const typeof(&(ptr)->field) _s = &(ptr)->field;     \
-    void *_d = &(hnd).p->field;                         \
-    (void)(&(hnd).p->field == _s);                      \
-    __raw_copy_to_guest(_d, _s, sizeof(*_s));           \
-})
-
-#define __copy_field_from_guest(ptr, hnd, field) ({     \
-    const typeof(&(ptr)->field) _s = &(hnd).p->field;   \
-    typeof(&(ptr)->field) _d = &(ptr)->field;           \
-    __raw_copy_from_guest(_d, _s, sizeof(*_d));         \
-})
-
 #endif /* __ASM_ARM_GUEST_ACCESS_H__ */
 /*
  * Local variables:
diff --git a/xen/include/asm-x86/guest_access.h b/xen/include/asm-x86/guest_access.h
index 3ffde205f6a1..08c9fbbc78e1 100644
--- a/xen/include/asm-x86/guest_access.h
+++ b/xen/include/asm-x86/guest_access.h
@@ -38,81 +38,6 @@
      clear_user_hvm((dst), (len)) :             \
      clear_user((dst), (len)))
 
-/* Is the guest handle a NULL reference? */
-#define guest_handle_is_null(hnd)        ((hnd).p == NULL)
-
-/* Offset the given guest handle into the array it refers to. */
-#define guest_handle_add_offset(hnd, nr) ((hnd).p += (nr))
-#define guest_handle_subtract_offset(hnd, nr) ((hnd).p -= (nr))
-
-/* Cast a guest handle (either XEN_GUEST_HANDLE or XEN_GUEST_HANDLE_PARAM)
- * to the specified type of XEN_GUEST_HANDLE_PARAM. */
-#define guest_handle_cast(hnd, type) ({         \
-    type *_x = (hnd).p;                         \
-    (XEN_GUEST_HANDLE_PARAM(type)) { _x };            \
-})
-
-/* Convert a XEN_GUEST_HANDLE to XEN_GUEST_HANDLE_PARAM */
-#define guest_handle_to_param(hnd, type) ({                  \
-    /* type checking: make sure that the pointers inside     \
-     * XEN_GUEST_HANDLE and XEN_GUEST_HANDLE_PARAM are of    \
-     * the same type, then return hnd */                     \
-    (void)((typeof(&(hnd).p)) 0 ==                           \
-        (typeof(&((XEN_GUEST_HANDLE_PARAM(type)) {}).p)) 0); \
-    (hnd);                                                   \
-})
-
-#define guest_handle_for_field(hnd, type, fld)          \
-    ((XEN_GUEST_HANDLE(type)) { &(hnd).p->fld })
-
-#define guest_handle_from_ptr(ptr, type)        \
-    ((XEN_GUEST_HANDLE_PARAM(type)) { (type *)ptr })
-#define const_guest_handle_from_ptr(ptr, type)  \
-    ((XEN_GUEST_HANDLE_PARAM(const_##type)) { (const type *)ptr })
-
-/*
- * Copy an array of objects to guest context via a guest handle,
- * specifying an offset into the guest array.
- */
-#define copy_to_guest_offset(hnd, off, ptr, nr) ({      \
-    const typeof(*(ptr)) *_s = (ptr);                   \
-    char (*_d)[sizeof(*_s)] = (void *)(hnd).p;          \
-    /* Check that the handle is not for a const type */ \
-    void *__maybe_unused _t = (hnd).p;                  \
-    (void)((hnd).p == _s);                              \
-    raw_copy_to_guest(_d+(off), _s, sizeof(*_s)*(nr));  \
-})
-
-/*
- * Copy an array of objects from guest context via a guest handle,
- * specifying an offset into the guest array.
- */
-#define copy_from_guest_offset(ptr, hnd, off, nr) ({    \
-    const typeof(*(ptr)) *_s = (hnd).p;                 \
-    typeof(*(ptr)) *_d = (ptr);                         \
-    raw_copy_from_guest(_d, _s+(off), sizeof(*_d)*(nr));\
-})
-
-#define clear_guest_offset(hnd, off, nr) ({    \
-    void *_d = (hnd).p;                        \
-    raw_clear_guest(_d+(off), nr);             \
-})
-
-/* Copy sub-field of a structure to guest context via a guest handle. */
-#define copy_field_to_guest(hnd, ptr, field) ({         \
-    const typeof(&(ptr)->field) _s = &(ptr)->field;     \
-    void *_d = &(hnd).p->field;                         \
-    (void)(&(hnd).p->field == _s);                      \
-    raw_copy_to_guest(_d, _s, sizeof(*_s));             \
-})
-
-/* Copy sub-field of a structure from guest context via a guest handle. */
-#define copy_field_from_guest(ptr, hnd, field) ({       \
-    const typeof(&(ptr)->field) _s = &(hnd).p->field;   \
-    typeof(&(ptr)->field) _d = &(ptr)->field;           \
-    raw_copy_from_guest(_d, _s, sizeof(*_d));           \
-})
-
 /*
  * Pre-validate a guest handle.
  * Allows use of faster __copy_* functions.
@@ -126,39 +51,6 @@
                      (last)-(first)+1,                  \
                      sizeof(*(hnd).p)))
 
-#define __copy_to_guest_offset(hnd, off, ptr, nr) ({    \
-    const typeof(*(ptr)) *_s = (ptr);                   \
-    char (*_d)[sizeof(*_s)] = (void *)(hnd).p;          \
-    /* Check that the handle is not for a const type */ \
-    void *__maybe_unused _t = (hnd).p;                  \
-    (void)((hnd).p == _s);                              \
-    __raw_copy_to_guest(_d+(off), _s, sizeof(*_s)*(nr));\
-})
-
-#define __copy_from_guest_offset(ptr, hnd, off, nr) ({  \
-    const typeof(*(ptr)) *_s = (hnd).p;                 \
-    typeof(*(ptr)) *_d = (ptr);                         \
-    __raw_copy_from_guest(_d, _s+(off), sizeof(*_d)*(nr));\
-})
-
-#define __clear_guest_offset(hnd, off, nr) ({    \
-    void *_d = (hnd).p;                          \
-    __raw_clear_guest(_d+(off), nr);             \
-})
-
-#define __copy_field_to_guest(hnd, ptr, field) ({       \
-    const typeof(&(ptr)->field) _s = &(ptr)->field;     \
-    void *_d = &(hnd).p->field;                         \
-    (void)(&(hnd).p->field == _s);                      \
-    __raw_copy_to_guest(_d, _s, sizeof(*_s));           \
-})
-
-#define __copy_field_from_guest(ptr, hnd, field) ({     \
-    const typeof(&(ptr)->field) _s = &(hnd).p->field;   \
-    typeof(&(ptr)->field) _d = &(ptr)->field;           \
-    __raw_copy_from_guest(_d, _s, sizeof(*_d));         \
-})
-
 #endif /* __ASM_X86_GUEST_ACCESS_H__ */
 /*
  * Local variables:
diff --git a/xen/include/xen/guest_access.h b/xen/include/xen/guest_access.h
index ef9aaa3efcfe..4957b8d1f2b8 100644
--- a/xen/include/xen/guest_access.h
+++ b/xen/include/xen/guest_access.h
@@ -11,6 +11,86 @@
 #include <xen/types.h>
 #include <public/xen.h>
 
+/* Is the guest handle a NULL reference? */
+#define guest_handle_is_null(hnd)        ((hnd).p == NULL)
+
+/* Offset the given guest handle into the array it refers to. */
+#define guest_handle_add_offset(hnd, nr) ((hnd).p += (nr))
+#define guest_handle_subtract_offset(hnd, nr) ((hnd).p -= (nr))
+
+/* Cast a guest handle (either XEN_GUEST_HANDLE or XEN_GUEST_HANDLE_PARAM)
+ * to the specified type of XEN_GUEST_HANDLE_PARAM. */
+#define guest_handle_cast(hnd, type) ({         \
+    type *_x = (hnd).p;                         \
+    (XEN_GUEST_HANDLE_PARAM(type)) { _x };            \
+})
+
+/* Cast a XEN_GUEST_HANDLE to XEN_GUEST_HANDLE_PARAM */
+#define guest_handle_to_param(hnd, type) ({                  \
+    typeof((hnd).p) _x = (hnd).p;                            \
+    XEN_GUEST_HANDLE_PARAM(type) _y = { _x };                \
+    /* type checking: make sure that the pointers inside     \
+     * XEN_GUEST_HANDLE and XEN_GUEST_HANDLE_PARAM are of    \
+     * the same type, then return hnd */                     \
+    (void)(&_x == &_y.p);                                    \
+    _y;                                                      \
+})
+
+#define guest_handle_for_field(hnd, type, fld)          \
+    ((XEN_GUEST_HANDLE(type)) { &(hnd).p->fld })
+
+#define guest_handle_from_ptr(ptr, type)        \
+    ((XEN_GUEST_HANDLE_PARAM(type)) { (type *)ptr })
+#define const_guest_handle_from_ptr(ptr, type)  \
+    ((XEN_GUEST_HANDLE_PARAM(const_##type)) { (const type *)ptr })
+
+/*
+ * Copy an array of objects to guest context via a guest handle,
+ * specifying an offset into the guest array.
+ */
+#define copy_to_guest_offset(hnd, off, ptr, nr) ({      \
+    const typeof(*(ptr)) *_s = (ptr);                   \
+    char (*_d)[sizeof(*_s)] = (void *)(hnd).p;          \
+    /* Check that the handle is not for a const type */ \
+    void *__maybe_unused _t = (hnd).p;                  \
+    (void)((hnd).p == _s);                              \
+    raw_copy_to_guest(_d+(off), _s, sizeof(*_s)*(nr));  \
+})
+
+/*
+ * Clear an array of objects in guest context via a guest handle,
+ * specifying an offset into the guest array.
+ */
+#define clear_guest_offset(hnd, off, nr) ({    \
+    void *_d = (hnd).p;                        \
+    raw_clear_guest(_d+(off), nr);             \
+})
+
+/*
+ * Copy an array of objects from guest context via a guest handle,
+ * specifying an offset into the guest array.
+ */
+#define copy_from_guest_offset(ptr, hnd, off, nr) ({    \
+    const typeof(*(ptr)) *_s = (hnd).p;                 \
+    typeof(*(ptr)) *_d = (ptr);                         \
+    raw_copy_from_guest(_d, _s+(off), sizeof(*_d)*(nr));\
+})
+
+/* Copy sub-field of a structure to guest context via a guest handle. */
+#define copy_field_to_guest(hnd, ptr, field) ({         \
+    const typeof(&(ptr)->field) _s = &(ptr)->field;     \
+    void *_d = &(hnd).p->field;                         \
+    (void)(&(hnd).p->field == _s);                      \
+    raw_copy_to_guest(_d, _s, sizeof(*_s));             \
+})
+
+/* Copy sub-field of a structure from guest context via a guest handle. */
+#define copy_field_from_guest(ptr, hnd, field) ({       \
+    const typeof(&(ptr)->field) _s = &(hnd).p->field;   \
+    typeof(&(ptr)->field) _d = &(ptr)->field;           \
+    raw_copy_from_guest(_d, _s, sizeof(*_d));           \
+})
+
 #define copy_to_guest(hnd, ptr, nr)                     \
     copy_to_guest_offset(hnd, 0, ptr, nr)
 
@@ -20,6 +100,45 @@
 #define clear_guest(hnd, nr)                            \
     clear_guest_offset(hnd, 0, nr)
 
+/*
+ * The __copy_* functions should only be used after the guest handle has
+ * been pre-validated via guest_handle_okay() and
+ * guest_handle_subrange_okay().
+ */
+
+#define __copy_to_guest_offset(hnd, off, ptr, nr) ({    \
+    const typeof(*(ptr)) *_s = (ptr);                   \
+    char (*_d)[sizeof(*_s)] = (void *)(hnd).p;          \
+    /* Check that the handle is not for a const type */ \
+    void *__maybe_unused _t = (hnd).p;                  \
+    (void)((hnd).p == _s);                              \
+    __raw_copy_to_guest(_d+(off), _s, sizeof(*_s)*(nr));\
+})
+
+#define __clear_guest_offset(hnd, off, nr) ({    \
+    void *_d = (hnd).p;                          \
+    __raw_clear_guest(_d + (off), nr);           \
+})
+
+#define __copy_from_guest_offset(ptr, hnd, off, nr) ({  \
+    const typeof(*(ptr)) *_s = (hnd).p;                 \
+    typeof(*(ptr)) *_d = (ptr);                         \
+    __raw_copy_from_guest(_d, _s+(off), sizeof(*_d)*(nr));\
+})
+
+#define __copy_field_to_guest(hnd, ptr, field) ({       \
+    const typeof(&(ptr)->field) _s = &(ptr)->field;     \
+    void *_d = &(hnd).p->field;                         \
+    (void)(&(hnd).p->field == _s);                      \
+    __raw_copy_to_guest(_d, _s, sizeof(*_s));           \
+})
+
+#define __copy_field_from_guest(ptr, hnd, field) ({     \
+    const typeof(&(ptr)->field) _s = &(hnd).p->field;   \
+    typeof(&(ptr)->field) _d = &(ptr)->field;           \
+    __raw_copy_from_guest(_d, _s, sizeof(*_d));         \
+})
+
 #define __copy_to_guest(hnd, ptr, nr)                   \
     __copy_to_guest_offset(hnd, 0, ptr, nr)
 
-- 
2.17.1


