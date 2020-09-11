Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4CE2662ED
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 18:07:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGlZW-0001mS-5I; Fri, 11 Sep 2020 16:06:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yBET=CU=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kGlZU-0001m8-PN
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 16:06:44 +0000
X-Inumbo-ID: 7e7ef991-196e-4654-9658-b9b525448060
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7e7ef991-196e-4654-9658-b9b525448060;
 Fri, 11 Sep 2020 16:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=Sa36iyZYfVN3Ys6U7bY6KqH1/AuEo45swTUKX5MoIIg=; b=pAIkVHcO7XFosKsFxGePdmgZQ
 Y/xU2ZujOaxc8WI+pP6ACq2sR5kIcrHzjanSllQBXcivr3WWiK7aAoJiPRSKCiY/UsMFbpNb5rGQ/
 tuKDpUCxOoXYzFXZynwO0utQE7/GW22d8NHmK4MgztGZLhnRJtIBhsPHoTvU0n7FfYrYo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kGlZP-0004xX-3D; Fri, 11 Sep 2020 16:06:39 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kGlZO-0001gv-Mg; Fri, 11 Sep 2020 16:06:38 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: oleksandr_tyshchenko@epam.com, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 1/2] xen/arm: Remove cmpxchg_local() and drop _mb from the
 other helpers
Date: Fri, 11 Sep 2020 17:06:21 +0100
Message-Id: <20200911160622.19721-2-julien@xen.org>
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

The current set of helpers are quite confusing to follow as the naming
is not very consistent.

Given that cmpxchg_local() is not used in Xen, drop it completely.
Furthermore, adopt a naming with _mb so all names are now consistent.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v2:
        - Patch added
---
 xen/include/asm-arm/arm32/cmpxchg.h | 31 ++++++-----------------
 xen/include/asm-arm/arm64/cmpxchg.h | 38 +++++++----------------------
 xen/include/asm-arm/guest_atomics.h |  6 ++---
 3 files changed, 19 insertions(+), 56 deletions(-)

diff --git a/xen/include/asm-arm/arm32/cmpxchg.h b/xen/include/asm-arm/arm32/cmpxchg.h
index 0770f272ee99..3ef1e5c63276 100644
--- a/xen/include/asm-arm/arm32/cmpxchg.h
+++ b/xen/include/asm-arm/arm32/cmpxchg.h
@@ -112,23 +112,12 @@ static always_inline unsigned long __cmpxchg(volatile void *ptr,
 					     unsigned long new,
 					     int size)
 {
+	smp_mb();
 	if (!__int_cmpxchg(ptr, &old, new, size, false, 0))
 		ASSERT_UNREACHABLE();
-
-	return old;
-}
-
-static always_inline unsigned long __cmpxchg_mb(volatile void *ptr,
-                                                unsigned long old,
-                                                unsigned long new, int size)
-{
-	unsigned long ret;
-
-	smp_mb();
-	ret = __cmpxchg(ptr, old, new, size);
 	smp_mb();
 
-	return ret;
+	return old;
 }
 
 /*
@@ -141,11 +130,11 @@ static always_inline unsigned long __cmpxchg_mb(volatile void *ptr,
  * The helper will return true when the update has succeeded (i.e no
  * timeout) and false if the update has failed.
  */
-static always_inline bool __cmpxchg_mb_timeout(volatile void *ptr,
-					       unsigned long *old,
-					       unsigned long new,
-					       int size,
-					       unsigned int max_try)
+static always_inline bool __cmpxchg_timeout(volatile void *ptr,
+					    unsigned long *old,
+					    unsigned long new,
+					    int size,
+					    unsigned int max_try)
 {
 	bool ret;
 
@@ -157,12 +146,6 @@ static always_inline bool __cmpxchg_mb_timeout(volatile void *ptr,
 }
 
 #define cmpxchg(ptr,o,n)						\
-	((__typeof__(*(ptr)))__cmpxchg_mb((ptr),			\
-					  (unsigned long)(o),		\
-					  (unsigned long)(n),		\
-					  sizeof(*(ptr))))
-
-#define cmpxchg_local(ptr,o,n)						\
 	((__typeof__(*(ptr)))__cmpxchg((ptr),				\
 				       (unsigned long)(o),		\
 				       (unsigned long)(n),		\
diff --git a/xen/include/asm-arm/arm64/cmpxchg.h b/xen/include/asm-arm/arm64/cmpxchg.h
index fc5c60f0bd74..f4a8c1ccba80 100644
--- a/xen/include/asm-arm/arm64/cmpxchg.h
+++ b/xen/include/asm-arm/arm64/cmpxchg.h
@@ -125,23 +125,12 @@ static always_inline unsigned long __cmpxchg(volatile void *ptr,
 					     unsigned long new,
 					     int size)
 {
+	smp_mb();
 	if (!__int_cmpxchg(ptr, &old, new, size, false, 0))
 		ASSERT_UNREACHABLE();
-
-	return old;
-}
-
-static always_inline unsigned long __cmpxchg_mb(volatile void *ptr,
-						unsigned long old,
-						unsigned long new, int size)
-{
-	unsigned long ret;
-
-	smp_mb();
-	ret = __cmpxchg(ptr, old, new, size);
 	smp_mb();
 
-	return ret;
+	return old;
 }
 
 /*
@@ -154,11 +143,11 @@ static always_inline unsigned long __cmpxchg_mb(volatile void *ptr,
  * The helper will return true when the update has succeeded (i.e no
  * timeout) and false if the update has failed.
  */
-static always_inline bool __cmpxchg_mb_timeout(volatile void *ptr,
-					       unsigned long *old,
-					       unsigned long new,
-					       int size,
-					       unsigned int max_try)
+static always_inline bool __cmpxchg_timeout(volatile void *ptr,
+					    unsigned long *old,
+					    unsigned long new,
+					    int size,
+					    unsigned int max_try)
 {
 	bool ret;
 
@@ -173,17 +162,8 @@ static always_inline bool __cmpxchg_mb_timeout(volatile void *ptr,
 ({ \
 	__typeof__(*(ptr)) __ret; \
 	__ret = (__typeof__(*(ptr))) \
-		__cmpxchg_mb((ptr), (unsigned long)(o), (unsigned long)(n), \
-			     sizeof(*(ptr))); \
-	__ret; \
-})
-
-#define cmpxchg_local(ptr, o, n) \
-({ \
-	__typeof__(*(ptr)) __ret; \
-	__ret = (__typeof__(*(ptr))) \
-		__cmpxchg((ptr), (unsigned long)(o), \
-			  (unsigned long)(n), sizeof(*(ptr))); \
+		__cmpxchg((ptr), (unsigned long)(o), (unsigned long)(n), \
+			  sizeof(*(ptr))); \
 	__ret; \
 })
 
diff --git a/xen/include/asm-arm/guest_atomics.h b/xen/include/asm-arm/guest_atomics.h
index af27cc627bf3..20347849e56c 100644
--- a/xen/include/asm-arm/guest_atomics.h
+++ b/xen/include/asm-arm/guest_atomics.h
@@ -96,14 +96,14 @@ static inline unsigned long __guest_cmpxchg(struct domain *d,
 
     perfc_incr(atomics_guest);
 
-    if ( __cmpxchg_mb_timeout(ptr, &oldval, new, size,
-                              this_cpu(guest_safe_atomic_max)) )
+    if ( __cmpxchg_timeout(ptr, &oldval, new, size,
+                           this_cpu(guest_safe_atomic_max)) )
         return oldval;
 
     perfc_incr(atomics_guest_paused);
 
     domain_pause_nosync(d);
-    oldval = __cmpxchg_mb(ptr, old, new, size);
+    oldval = __cmpxchg(ptr, old, new, size);
     domain_unpause(d);
 
     return oldval;
-- 
2.17.1


