Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBC31C26C3
	for <lists+xen-devel@lfdr.de>; Sat,  2 May 2020 18:08:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUufW-00014b-Na; Sat, 02 May 2020 16:07:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L6si=6Q=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jUufV-00014W-G9
 for xen-devel@lists.xenproject.org; Sat, 02 May 2020 16:07:09 +0000
X-Inumbo-ID: f8ba485c-8c8e-11ea-9bd3-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f8ba485c-8c8e-11ea-9bd3-12813bfff9fa;
 Sat, 02 May 2020 16:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0DZRtHN+DWgkT9wV9AdwEWaM8yO76gVkuFpYC4Ito8Y=; b=tYNu4Jnwx4FrjVSD3Qr29oadK7
 zspxZr/aznHXD7brDyeV1U1bN7GibM9gR+VNOxezJHMgg+0riMC9QUdXDQVkBLOg56dcbEnzDu1FI
 5M/Ta6wUw+zW0KzzueJuWEnaRqA4/T+pFJT2YbKhtoQcdn3yjuTyY9Q/+zYLvKLCqTtc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jUufS-0000ps-Uj; Sat, 02 May 2020 16:07:06 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jUufS-00054b-It; Sat, 02 May 2020 16:07:06 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH for-4.14 2/3] xen/arm: atomic: Rewrite write_atomic()
Date: Sat,  2 May 2020 17:06:59 +0100
Message-Id: <20200502160700.19573-3-julien@xen.org>
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
 julien@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

The current implementation of write_atomic has two issues:
    1) It cannot be used to write pointer value because the switch
    contains cast to other size than the size of the pointer.
    2) It will happily allow to write to a pointer to const.

Additionally, the Arm implementation is returning a value when the x86
implementation does not anymore. This was introduced in commit
2934148a0773 "x86: simplify a few macros / inline functions". There are
no users of the return value, so it is fine to drop it.

The switch is now moved in a static inline helper allowing the compiler
to prevent use of const pointer and also allow to write pointer value.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/include/asm-arm/atomic.h | 40 ++++++++++++++++++++++++++----------
 1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/xen/include/asm-arm/atomic.h b/xen/include/asm-arm/atomic.h
index 3c3d6bb04ee8..ac2798d095eb 100644
--- a/xen/include/asm-arm/atomic.h
+++ b/xen/include/asm-arm/atomic.h
@@ -98,23 +98,41 @@ static always_inline void read_atomic_size(const volatile void *p,
     }
 }
 
+static always_inline void write_atomic_size(volatile void *p,
+                                            void *val,
+                                            unsigned int size)
+{
+    switch ( size )
+    {
+    case 1:
+        write_u8_atomic(p, *(uint8_t *)val);
+        break;
+    case 2:
+        write_u16_atomic(p, *(uint16_t *)val);
+        break;
+    case 4:
+        write_u32_atomic(p, *(uint32_t *)val);
+        break;
+    case 8:
+        write_u64_atomic(p, *(uint64_t *)val);
+        break;
+    default:
+        __bad_atomic_size();
+        break;
+    }
+}
+
 #define read_atomic(p) ({                                               \
     union { typeof(*p) val; char c[0]; } x_;                            \
     read_atomic_size(p, x_.c, sizeof(*p));                              \
     x_.val;                                                             \
 })
 
-#define write_atomic(p, x) ({                                           \
-    typeof(*p) __x = (x);                                               \
-    switch ( sizeof(*p) ) {                                             \
-    case 1: write_u8_atomic((uint8_t *)p, (uint8_t)__x); break;         \
-    case 2: write_u16_atomic((uint16_t *)p, (uint16_t)__x); break;      \
-    case 4: write_u32_atomic((uint32_t *)p, (uint32_t)__x); break;      \
-    case 8: write_u64_atomic((uint64_t *)p, (uint64_t)__x); break;      \
-    default: __bad_atomic_size(); break;                                \
-    }                                                                   \
-    __x;                                                                \
-})
+#define write_atomic(p, x)                                              \
+    do {                                                                \
+        typeof(*p) x_ = (x);                                            \
+        write_atomic_size(p, &x_, sizeof(*p));                          \
+    } while ( false )
 
 #define add_sized(p, x) ({                                              \
     typeof(*(p)) __x = (x);                                             \
-- 
2.17.1


