Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E292AFAD5
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 22:53:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25298.52997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcy38-0006QD-Ie; Wed, 11 Nov 2020 21:53:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25298.52997; Wed, 11 Nov 2020 21:53:06 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcy38-0006PJ-Dx; Wed, 11 Nov 2020 21:53:06 +0000
Received: by outflank-mailman (input) for mailman id 25298;
 Wed, 11 Nov 2020 21:53:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1kcy36-00064v-PL
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 21:53:04 +0000
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 842d170a-abf2-4a60-8904-60b84d13b358;
 Wed, 11 Nov 2020 21:52:47 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 23so4924528wmg.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 13:52:47 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com.
 [5.71.162.151])
 by smtp.gmail.com with ESMTPSA id u23sm4096078wmc.32.2020.11.11.13.52.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Nov 2020 13:52:45 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	id 1kcy36-00064v-PL
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 21:53:04 +0000
X-Inumbo-ID: 842d170a-abf2-4a60-8904-60b84d13b358
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 842d170a-abf2-4a60-8904-60b84d13b358;
	Wed, 11 Nov 2020 21:52:47 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 23so4924528wmg.1
        for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 13:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sGzJpFoTaZnCaM6xOC0KlI8sjb8W5MHW3wWMiououtA=;
        b=lzrosJwBjf2JJ1R6hDwZGAfEDibeHSG4jsEPUGW4dyTwr9h7yHFIWuauR9MfE/W0Z7
         kCLZ54Z/GachrPhKRopStg6qckWSh/m3aK56rgkZprKQeLZ2M1devLrjrHt+rxHD3Wil
         v+MwST5ssBLkCAaoKR7eRZRPGgMJYExDtRg8PrSMuPZMoGL+t6qORpwd6IaUbR14k3VM
         05deiW3/TcX+UPafP9k0EiRK3dIIj9JK3wLZGssvDHwhb58dmV7CrM82ed2KPrTV4X7w
         4ivCG/OzQPQL1prmrU1tnUqoWhE6TA1mrromhM60WpdfA5Zn4IkON/AlnxcuUeSIWsXa
         ZU8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sGzJpFoTaZnCaM6xOC0KlI8sjb8W5MHW3wWMiououtA=;
        b=p4Zp7ciQqTPLZrPeZwXl/g1SR6dOtuO01Yzj0VxTeX6hwT3itMx7iabZT9cDSbmVcH
         Iaioqft0ZkHI4wwbUcmN5LzLmfvUOIlvcetgahrVVGr8U+/ZqVZ8jOEWzhY8IPas7Hxz
         kFaKmVYAzHOvWH+jne0hCTfOyy35F8PSdRU47D1nVlh678sHaLDMplHoAw6mVzjysqrj
         GCcZCOCoYxOF9IzSswRdapoyMkuqIAHd9aRTAcOHELm54rTzl0uQjvmLwEQwoPKetiYG
         8EWeGytf9iqdepgEndKmnJDQkix4joCCoAyS83H17kPlN9lkgbZtXb+Re854eygz29E1
         SF9Q==
X-Gm-Message-State: AOAM53127UzvnZaYcboeaHN4+Fcq/wDBh5vrv3ewGGMWayOOAlXOOgHQ
	bU4Ytv/z7nuZiXUxiwNSjzKJjOgVSKI=
X-Google-Smtp-Source: ABdhPJwpE+zpDXpZX3INJNNQfvF/71AxIIOCQ6cvj9NkP66u4kzrVa6Nr6tLpWEWx5Vkl/8qZyMo1w==
X-Received: by 2002:a7b:c3d2:: with SMTP id t18mr6509009wmj.112.1605131566282;
        Wed, 11 Nov 2020 13:52:46 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com. [5.71.162.151])
        by smtp.gmail.com with ESMTPSA id u23sm4096078wmc.32.2020.11.11.13.52.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2020 13:52:45 -0800 (PST)
From: Ash Wilding <ash.j.wilding@gmail.com>
X-Google-Original-From: Ash Wilding
To: xen-devel@lists.xenproject.org
Cc: Ash Wilding <ash.j.wilding@gmail.com>,
	julien@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com
Subject: [RFC PATCH v2 06/15] xen: port Linux <asm-generic/rwonce.h> to Xen
Date: Wed, 11 Nov 2020 21:51:54 +0000
Message-Id: <20201111215203.80336-7-ash.j.wilding@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201111215203.80336-1-ash.j.wilding@gmail.com>
References: <20201111215203.80336-1-ash.j.wilding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ash Wilding <ash.j.wilding@gmail.com>

 - Drop kasan related helpers.

 - Drop READ_ONCE() and WRITE_ONCE(); the __* versions are fine for now
   as the only callers in Xen are the arm32 atomics helpers which are
   always accessing an atomic_t's counter member, which is an int. This
   means we can swap the arm32 atomics helpers over to using the __*
   versions like the arm64 code does, removing a dependency on
   <linux/compiler_types.h> for __native_word().

 - Relax __unqual_scalar_typeof() in __READ_ONCE() to just typeof().
   Similarly to above, the only callers in Xen are the arm32/arm64
   atomics helpers, which are always accessing an atomic_t's counter
   member as a regular (int *) which doesn't need unqual'ing. This means
   we can remove the other dependency on <linux/compiler_types.h>.

Please see previous patch in the series for expanded rationale on why
not having to port <linux/compiler_types.h> to Xen makes life easier.

Signed-off-by: Ash Wilding <ash.j.wilding@gmail.com>
---
 xen/include/xen/rwonce.h | 79 +++-------------------------------------
 1 file changed, 5 insertions(+), 74 deletions(-)

diff --git a/xen/include/xen/rwonce.h b/xen/include/xen/rwonce.h
index 6b47392d1c..d001e7e41e 100644
--- a/xen/include/xen/rwonce.h
+++ b/xen/include/xen/rwonce.h
@@ -1,90 +1,21 @@
-/* SPDX-License-Identifier: GPL-2.0 */
 /*
- * Prevent the compiler from merging or refetching reads or writes. The
- * compiler is also forbidden from reordering successive instances of
- * READ_ONCE and WRITE_ONCE, but only when the compiler is aware of some
- * particular ordering. One way to make the compiler aware of ordering is to
- * put the two invocations of READ_ONCE or WRITE_ONCE in different C
- * statements.
+ * Taken from Linux 5.10-rc2 (last commit 3cea11cd5)
  *
- * These two macros will also work on aggregate data types like structs or
- * unions.
- *
- * Their two major use cases are: (1) Mediating communication between
- * process-level code and irq/NMI handlers, all running on the same CPU,
- * and (2) Ensuring that the compiler does not fold, spindle, or otherwise
- * mutilate accesses that either do not require ordering or that interact
- * with an explicit memory barrier or atomic instruction that provides the
- * required ordering.
+ * SPDX-License-Identifier: GPL-2.0
  */
+
 #ifndef __ASM_GENERIC_RWONCE_H
 #define __ASM_GENERIC_RWONCE_H
 
 #ifndef __ASSEMBLY__
 
-#include <linux/compiler_types.h>
-#include <linux/kasan-checks.h>
-#include <linux/kcsan-checks.h>
-
-/*
- * Yes, this permits 64-bit accesses on 32-bit architectures. These will
- * actually be atomic in some cases (namely Armv7 + LPAE), but for others we
- * rely on the access being split into 2x32-bit accesses for a 32-bit quantity
- * (e.g. a virtual address) and a strong prevailing wind.
- */
-#define compiletime_assert_rwonce_type(t)					\
-	compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),	\
-		"Unsupported access size for {READ,WRITE}_ONCE().")
-
-/*
- * Use __READ_ONCE() instead of READ_ONCE() if you do not require any
- * atomicity. Note that this may result in tears!
- */
-#ifndef __READ_ONCE
-#define __READ_ONCE(x)	(*(const volatile __unqual_scalar_typeof(x) *)&(x))
-#endif
-
-#define READ_ONCE(x)							\
-({									\
-	compiletime_assert_rwonce_type(x);				\
-	__READ_ONCE(x);							\
-})
+#define __READ_ONCE(x)	(*(const volatile typeof(x) *)&(x))
 
 #define __WRITE_ONCE(x, val)						\
 do {									\
 	*(volatile typeof(x) *)&(x) = (val);				\
 } while (0)
 
-#define WRITE_ONCE(x, val)						\
-do {									\
-	compiletime_assert_rwonce_type(x);				\
-	__WRITE_ONCE(x, val);						\
-} while (0)
-
-static __no_sanitize_or_inline
-unsigned long __read_once_word_nocheck(const void *addr)
-{
-	return __READ_ONCE(*(unsigned long *)addr);
-}
-
-/*
- * Use READ_ONCE_NOCHECK() instead of READ_ONCE() if you need to load a
- * word from memory atomically but without telling KASAN/KCSAN. This is
- * usually used by unwinding code when walking the stack of a running process.
- */
-#define READ_ONCE_NOCHECK(x)						\
-({									\
-	compiletime_assert(sizeof(x) == sizeof(unsigned long),		\
-		"Unsupported access size for READ_ONCE_NOCHECK().");	\
-	(typeof(x))__read_once_word_nocheck(&(x));			\
-})
-
-static __no_kasan_or_inline
-unsigned long read_word_at_a_time(const void *addr)
-{
-	kasan_check_read(addr, 1);
-	return *(unsigned long *)addr;
-}
 
 #endif /* __ASSEMBLY__ */
-#endif	/* __ASM_GENERIC_RWONCE_H */
\ No newline at end of file
+#endif	/* __ASM_GENERIC_RWONCE_H */
-- 
2.24.3 (Apple Git-128)


