Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCF71C26C4
	for <lists+xen-devel@lfdr.de>; Sat,  2 May 2020 18:08:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUufY-00014w-3r; Sat, 02 May 2020 16:07:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L6si=6Q=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jUufX-00014h-98
 for xen-devel@lists.xenproject.org; Sat, 02 May 2020 16:07:11 +0000
X-Inumbo-ID: f8426b2a-8c8e-11ea-b07b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f8426b2a-8c8e-11ea-b07b-bc764e2007e4;
 Sat, 02 May 2020 16:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EquJ+P1MjKxYVanc5AWfgfmBQn5lz7a3I5D3bo//H6o=; b=KUDrWZVvEZWpLImbEeyABfPOQ0
 lzI103l846PopeLBujNexEEOSDZloGpuAry1hWahRpExEJ7uIRDMk1+6O9LnGHAVFnAMScNsTos6z
 Zj6gK1fgZTknM4ls5CqaKS3LnI9V/Jk4WDx42uIh5OxXqD1M+nrRK3Eo7Q8UL5wp6A8Q=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jUufR-0000pm-Sl; Sat, 02 May 2020 16:07:05 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jUufR-00054b-He; Sat, 02 May 2020 16:07:05 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH for-4.14 1/3] xen/arm: atomic: Allow read_atomic() to be used
 in more cases
Date: Sat,  2 May 2020 17:06:58 +0100
Message-Id: <20200502160700.19573-2-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200502160700.19573-1-julien@xen.org>
References: <20200502160700.19573-1-julien@xen.org>
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
Cc: Juergen Gross <jgross@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
 julien@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

The current implementation of read_atomic() on Arm will not allow to:
    1) Read a value from a pointer to const because the temporary
    variable will be const and therefore it is not possible to assign
    any value. This can be solved by using a union between the type and
    a char[0].
    2) Read a pointer value (e.g void *) because the switch contains
    cast from other type than the size of a pointer. This can be solved by
    by introducing a static inline for the switch and use void * for the
    pointer.

Reported-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/include/asm-arm/atomic.h | 37 +++++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/xen/include/asm-arm/atomic.h b/xen/include/asm-arm/atomic.h
index e81bf80e305c..3c3d6bb04ee8 100644
--- a/xen/include/asm-arm/atomic.h
+++ b/xen/include/asm-arm/atomic.h
@@ -71,18 +71,37 @@ build_add_sized(add_u32_sized, "", WORD, uint32_t)
 #undef build_atomic_write
 #undef build_add_sized
 
+void __bad_atomic_read(const volatile void *p, void *res);
 void __bad_atomic_size(void);
 
+static always_inline void read_atomic_size(const volatile void *p,
+                                           void *res,
+                                           unsigned int size)
+{
+    switch ( size )
+    {
+    case 1:
+        *(uint8_t *)res = read_u8_atomic(p);
+        break;
+    case 2:
+        *(uint16_t *)res = read_u16_atomic(p);
+        break;
+    case 4:
+        *(uint32_t *)res = read_u32_atomic(p);
+        break;
+    case 8:
+        *(uint64_t *)res = read_u64_atomic(p);
+        break;
+    default:
+        __bad_atomic_read(p, res);
+        break;
+    }
+}
+
 #define read_atomic(p) ({                                               \
-    typeof(*p) __x;                                                     \
-    switch ( sizeof(*p) ) {                                             \
-    case 1: __x = (typeof(*p))read_u8_atomic((uint8_t *)p); break;      \
-    case 2: __x = (typeof(*p))read_u16_atomic((uint16_t *)p); break;    \
-    case 4: __x = (typeof(*p))read_u32_atomic((uint32_t *)p); break;    \
-    case 8: __x = (typeof(*p))read_u64_atomic((uint64_t *)p); break;    \
-    default: __x = 0; __bad_atomic_size(); break;                       \
-    }                                                                   \
-    __x;                                                                \
+    union { typeof(*p) val; char c[0]; } x_;                            \
+    read_atomic_size(p, x_.c, sizeof(*p));                              \
+    x_.val;                                                             \
 })
 
 #define write_atomic(p, x) ({                                           \
-- 
2.17.1


