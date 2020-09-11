Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C062662EF
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 18:07:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGlZb-0001mn-E9; Fri, 11 Sep 2020 16:06:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yBET=CU=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kGlZZ-0001m8-PO
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 16:06:49 +0000
X-Inumbo-ID: ca5ff15d-c49d-477b-b00b-f3e84782ca56
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ca5ff15d-c49d-477b-b00b-f3e84782ca56;
 Fri, 11 Sep 2020 16:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=HmVBoYD+AJa7li96NWso5BcK1WuNr2xh7fR0XTtGlHw=; b=CHmx9ZxEBBflTWjJwVkq2RcgZ
 E5BU6NQmnOT3mc08SnLWzeS3od0ZNMgGpsMsZD1RxjD8MPI3VJsq47f9gScBZAa2+xzC/3j6hNSe1
 5eZ5vdVx4+uWspa/nkFA3KhQCtktvsNFfZy+dsHMc30kuvENVTs8H9QCk4hhnHdbssNi8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kGlZQ-0004xg-Lx; Fri, 11 Sep 2020 16:06:40 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kGlZQ-0001gv-CF; Fri, 11 Sep 2020 16:06:40 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: oleksandr_tyshchenko@epam.com, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/2] xen: Introduce cmpxchg64() and guest_cmpxchg64()
Date: Fri, 11 Sep 2020 17:06:22 +0100
Message-Id: <20200911160622.19721-3-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200911160622.19721-1-julien@xen.org>
References: <20200911160622.19721-1-julien@xen.org>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

The IOREQ code is using cmpxchg() with 64-bit value. At the moment, this
is x86 code, but there is plan to make it common.

To cater 32-bit arch, introduce two new helpers to deal with 64-bit
cmpxchg().

The Arm 32-bit implementation of cmpxchg64() is based on the __cmpxchg64
in Linux v5.8 (arch/arm/include/asm/cmpxchg.h).

Note that only guest_cmpxchg64() is introduced on x86 so far.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

I have looked at whether we can extend cmpxchg() to support 64-bit on
arm32 bit. However the resulting code is much worse as the compiler will
use the stack more often to spill. Therefore the introduction of
cmpxchg64() is better option.

    Changes in v2:
        - Remove extra teq in the arm32 cmpxchg implementation
        - Don't define cmpxchg64() on x86
        - Drop _mb from the helpers name
        - Add missing barrier in the arm32 implementation
---
 xen/include/asm-arm/arm32/cmpxchg.h | 68 +++++++++++++++++++++++++++++
 xen/include/asm-arm/arm64/cmpxchg.h |  5 +++
 xen/include/asm-arm/guest_atomics.h | 22 ++++++++++
 xen/include/asm-x86/guest_atomics.h |  1 +
 4 files changed, 96 insertions(+)

diff --git a/xen/include/asm-arm/arm32/cmpxchg.h b/xen/include/asm-arm/arm32/cmpxchg.h
index 3ef1e5c63276..b0bd1d8b685e 100644
--- a/xen/include/asm-arm/arm32/cmpxchg.h
+++ b/xen/include/asm-arm/arm32/cmpxchg.h
@@ -87,6 +87,37 @@ __CMPXCHG_CASE(b, 1)
 __CMPXCHG_CASE(h, 2)
 __CMPXCHG_CASE( , 4)
 
+static inline bool __cmpxchg_case_8(volatile uint64_t *ptr,
+			 	    uint64_t *old,
+			 	    uint64_t new,
+			 	    bool timeout,
+				    unsigned int max_try)
+{
+	uint64_t oldval;
+	uint64_t res;
+
+	do {
+		asm volatile(
+		"	ldrexd		%1, %H1, [%3]\n"
+		"	teq		%1, %4\n"
+		"	teqeq		%H1, %H4\n"
+		"	movne		%0, #0\n"
+		"	movne		%H0, #0\n"
+		"	bne		2f\n"
+		"	strexd		%0, %5, %H5, [%3]\n"
+		"2:"
+		: "=&r" (res), "=&r" (oldval), "+Qo" (*ptr)
+		: "r" (ptr), "r" (*old), "r" (new)
+		: "memory", "cc");
+		if (!res)
+			break;
+	} while (!timeout || ((--max_try) > 0));
+
+	*old = oldval;
+
+	return !res;
+}
+
 static always_inline bool __int_cmpxchg(volatile void *ptr, unsigned long *old,
 					unsigned long new, int size,
 					bool timeout, unsigned int max_try)
@@ -145,11 +176,48 @@ static always_inline bool __cmpxchg_timeout(volatile void *ptr,
 	return ret;
 }
 
+/*
+ * The helper may fail to update the memory if the action takes too long.
+ *
+ * @old: On call the value pointed contains the expected old value. It will be
+ * updated to the actual old value.
+ * @max_try: Maximum number of iterations
+ *
+ * The helper will return true when the update has succeeded (i.e no
+ * timeout) and false if the update has failed.
+ */
+static always_inline bool __cmpxchg64_timeout(volatile uint64_t *ptr,
+					      uint64_t *old,
+					      uint64_t new,
+					      unsigned int max_try)
+{
+	bool ret;
+
+	smp_mb();
+	ret = __cmpxchg_case_8(ptr, old, new, true, max_try);
+	smp_mb();
+
+	return ret;
+}
+
 #define cmpxchg(ptr,o,n)						\
 	((__typeof__(*(ptr)))__cmpxchg((ptr),				\
 				       (unsigned long)(o),		\
 				       (unsigned long)(n),		\
 				       sizeof(*(ptr))))
+
+static inline uint64_t cmpxchg64(volatile uint64_t *ptr,
+				 uint64_t old,
+				 uint64_t new)
+{
+	smp_mb();
+	if (!__cmpxchg_case_8(ptr, &old, new, false, 0))
+		ASSERT_UNREACHABLE();
+	smp_mb();
+
+	return old;
+}
+
 #endif
 /*
  * Local variables:
diff --git a/xen/include/asm-arm/arm64/cmpxchg.h b/xen/include/asm-arm/arm64/cmpxchg.h
index f4a8c1ccba80..10e4edc022b7 100644
--- a/xen/include/asm-arm/arm64/cmpxchg.h
+++ b/xen/include/asm-arm/arm64/cmpxchg.h
@@ -167,6 +167,11 @@ static always_inline bool __cmpxchg_timeout(volatile void *ptr,
 	__ret; \
 })
 
+#define cmpxchg64(ptr, o, n) cmpxchg(ptr, o, n)
+
+#define __cmpxchg64_timeout(ptr, old, new, max_try)	\
+	__cmpxchg_timeout(ptr, old, new, 8, max_try)
+
 #endif
 /*
  * Local variables:
diff --git a/xen/include/asm-arm/guest_atomics.h b/xen/include/asm-arm/guest_atomics.h
index 20347849e56c..9e2e96d4ff72 100644
--- a/xen/include/asm-arm/guest_atomics.h
+++ b/xen/include/asm-arm/guest_atomics.h
@@ -115,6 +115,28 @@ static inline unsigned long __guest_cmpxchg(struct domain *d,
                                          (unsigned long)(n),\
                                          sizeof (*(ptr))))
 
+static inline uint64_t guest_cmpxchg64(struct domain *d,
+                                       volatile uint64_t *ptr,
+                                       uint64_t old,
+                                       uint64_t new)
+{
+    uint64_t oldval = old;
+
+    perfc_incr(atomics_guest);
+
+    if ( __cmpxchg64_timeout(ptr, &oldval, new,
+                             this_cpu(guest_safe_atomic_max)) )
+        return oldval;
+
+    perfc_incr(atomics_guest_paused);
+
+    domain_pause_nosync(d);
+    oldval = cmpxchg64(ptr, old, new);
+    domain_unpause(d);
+
+    return oldval;
+}
+
 #endif /* _ARM_GUEST_ATOMICS_H */
 /*
  * Local variables:
diff --git a/xen/include/asm-x86/guest_atomics.h b/xen/include/asm-x86/guest_atomics.h
index 029417c8ffc1..87e7075b7623 100644
--- a/xen/include/asm-x86/guest_atomics.h
+++ b/xen/include/asm-x86/guest_atomics.h
@@ -20,6 +20,7 @@
     ((void)(d), test_and_change_bit(nr, p))
 
 #define guest_cmpxchg(d, ptr, o, n) ((void)(d), cmpxchg(ptr, o, n))
+#define guest_cmpxchg64(d, ptr, o, n) ((void)(d), cmpxchg(ptr, o, n))
 
 #endif /* _X86_GUEST_ATOMICS_H */
 /*
-- 
2.17.1


