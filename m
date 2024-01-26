Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82ADD83DA13
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 13:21:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671974.1045542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTLCl-00088h-IL; Fri, 26 Jan 2024 12:21:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671974.1045542; Fri, 26 Jan 2024 12:21:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTLCl-00086N-Fd; Fri, 26 Jan 2024 12:21:07 +0000
Received: by outflank-mailman (input) for mailman id 671974;
 Fri, 26 Jan 2024 12:21:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DqdW=JE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rTLCj-00086G-Ih
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 12:21:05 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f5e979f-bc45-11ee-8a43-1f161083a0e0;
 Fri, 26 Jan 2024 13:21:03 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2cc9fa5e8e1so2765461fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jan 2024 04:21:03 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 v2-20020aa7cd42000000b0055d1f27f47dsm543631edw.28.2024.01.26.04.21.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jan 2024 04:21:02 -0800 (PST)
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
X-Inumbo-ID: 5f5e979f-bc45-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706271663; x=1706876463; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C1M7zlyz5Ss6moqRXdbeQYXZV1u1WiqCMJnYW3h3HP4=;
        b=Kju/w2aiDJYc8DGlOl9isH71cGAEB7Cgc8Y8abglRjN9gDCcY2tctiIJo4oQuo7rCx
         VKMFjkDSWvYI5lUEF5vTieoCH+4NhYbcIu0hLEupM+Wx3dMkZ1s6BcfRsrnxLpJLWz1O
         dE5DcIDD01ut7+cio7Ao50tzzKVcyq7mk20j/BT5OeCQjkueNWoeD9x+mUOSqtIlIydS
         /Wnz3GrZX5e2aB1Mw1+l7hy1jMQE8dr0Vd5rQj/+osb8Y8zFrRO8N5qnlP7Yarylr3GJ
         56y6++TvyBfICDwng7rjz7RVe78Pg1owZVE+rDt6ithsYFK+2m6lUTV132uzFqeCMPRu
         Xvlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706271663; x=1706876463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C1M7zlyz5Ss6moqRXdbeQYXZV1u1WiqCMJnYW3h3HP4=;
        b=SeWFFXegNZqk7sC/cN3zXIiZzLc/iJcWtYJcrMKlzlYEF64XoHfmJZj7IXNpquKUuN
         WMUScUt2pQyrOWtZoCaO3lxcg0PgTIbapqULFiWDpU7ULQn75Qycbk8OzMNidLePdC4o
         CfjoAoeE2xx9wnkvu1jv5HnewZtBLVpW9wXE6FnRy1eydOXSf5dNqk+zUbn2DnQyvPM2
         eVhMJUipU9f6onAOuWHWyNKx8Eei15d5e3g45/YP9iQr1k5U0dcrTyqPXq6xT7JxKPxA
         3AYq+Mzt9/ys1zin69xvdOk29txGjH63EKrppaMvZTjROtwHegSUOjL4WbHsLdPWt35u
         aSrQ==
X-Gm-Message-State: AOJu0YyfDBb4WrKK0GYbF9sQTQ8/fSUOgAB1RnTFYilmndS20X2Y7Mkd
	GK0uYioFpemTaFLh8oHcvUREgDkwygB15mBuOOutWmJ7rUNto+UVTCtPqczJ
X-Google-Smtp-Source: AGHT+IGDEwBXaixnyY98ilAQ1iKADDafNCOd8Bxs6Ih1X3PfYLi/IAs+19hcfACvNLxg18/KrDo7RQ==
X-Received: by 2002:a2e:994d:0:b0:2cd:dc68:829b with SMTP id r13-20020a2e994d000000b002cddc68829bmr744941ljj.23.1706271662420;
        Fri, 26 Jan 2024 04:21:02 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH] xen/lib: introduce generic find next bit operations
Date: Fri, 26 Jan 2024 14:20:58 +0200
Message-ID: <52730e6314210ba4164a9934a720c4fda201447b.1706266854.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

find-next-bit.c is common for Arm64, PPC and RISCV64,
so it is moved to xen/lib.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 docs/misra/exclude-list.json                  |   4 -
 xen/arch/arm/arm64/lib/Makefile               |   2 +-
 xen/arch/arm/include/asm/arm64/bitops.h       |  48 --------
 xen/arch/ppc/include/asm/bitops.h             | 115 ------------------
 xen/include/xen/bitops.h                      |  48 ++++++++
 xen/lib/Makefile                              |   1 +
 .../find_next_bit.c => lib/find-next-bit.c}   |   0
 7 files changed, 50 insertions(+), 168 deletions(-)
 rename xen/{arch/arm/arm64/lib/find_next_bit.c => lib/find-next-bit.c} (100%)

diff --git a/docs/misra/exclude-list.json b/docs/misra/exclude-list.json
index 7971d0e70f..7fe02b059d 100644
--- a/docs/misra/exclude-list.json
+++ b/docs/misra/exclude-list.json
@@ -13,10 +13,6 @@
             "rel_path": "arch/arm/arm64/insn.c",
             "comment": "Imported on Linux, ignore for now"
         },
-        {
-            "rel_path": "arch/arm/arm64/lib/find_next_bit.c",
-            "comment": "Imported from Linux, ignore for now"
-        },
         {
             "rel_path": "arch/x86/acpi/boot.c",
             "comment": "Imported from Linux, ignore for now"
diff --git a/xen/arch/arm/arm64/lib/Makefile b/xen/arch/arm/arm64/lib/Makefile
index 1b9c7a95e6..66cfac435a 100644
--- a/xen/arch/arm/arm64/lib/Makefile
+++ b/xen/arch/arm/arm64/lib/Makefile
@@ -1,4 +1,4 @@
 obj-y += memcpy.o memcmp.o memmove.o memset.o memchr.o
 obj-y += clear_page.o
-obj-y += bitops.o find_next_bit.o
+obj-y += bitops.o
 obj-y += strchr.o strcmp.o strlen.o strncmp.o strnlen.o strrchr.o
diff --git a/xen/arch/arm/include/asm/arm64/bitops.h b/xen/arch/arm/include/asm/arm64/bitops.h
index d85a49bca4..f9dd066237 100644
--- a/xen/arch/arm/include/asm/arm64/bitops.h
+++ b/xen/arch/arm/include/asm/arm64/bitops.h
@@ -36,57 +36,9 @@ static inline int flsl(unsigned long x)
 
 /* Based on linux/include/asm-generic/bitops/find.h */
 
-#ifndef find_next_bit
-/**
- * find_next_bit - find the next set bit in a memory region
- * @addr: The address to base the search on
- * @offset: The bitnumber to start searching at
- * @size: The bitmap size in bits
- */
-extern unsigned long find_next_bit(const unsigned long *addr, unsigned long
-		size, unsigned long offset);
-#endif
-
-#ifndef find_next_zero_bit
-/**
- * find_next_zero_bit - find the next cleared bit in a memory region
- * @addr: The address to base the search on
- * @offset: The bitnumber to start searching at
- * @size: The bitmap size in bits
- */
-extern unsigned long find_next_zero_bit(const unsigned long *addr, unsigned
-		long size, unsigned long offset);
-#endif
-
-#ifdef CONFIG_GENERIC_FIND_FIRST_BIT
-
-/**
- * find_first_bit - find the first set bit in a memory region
- * @addr: The address to start the search at
- * @size: The maximum size to search
- *
- * Returns the bit number of the first set bit.
- */
-extern unsigned long find_first_bit(const unsigned long *addr,
-				    unsigned long size);
-
-/**
- * find_first_zero_bit - find the first cleared bit in a memory region
- * @addr: The address to start the search at
- * @size: The maximum size to search
- *
- * Returns the bit number of the first cleared bit.
- */
-extern unsigned long find_first_zero_bit(const unsigned long *addr,
-					 unsigned long size);
-#else /* CONFIG_GENERIC_FIND_FIRST_BIT */
-
 #define find_first_bit(addr, size) find_next_bit((addr), (size), 0)
 #define find_first_zero_bit(addr, size) find_next_zero_bit((addr), (size), 0)
 
-#endif /* CONFIG_GENERIC_FIND_FIRST_BIT */
-
-
 #endif /* _ARM_ARM64_BITOPS_H */
 /*
  * Local variables:
diff --git a/xen/arch/ppc/include/asm/bitops.h b/xen/arch/ppc/include/asm/bitops.h
index 5e7f36c21d..5820b9ce7b 100644
--- a/xen/arch/ppc/include/asm/bitops.h
+++ b/xen/arch/ppc/include/asm/bitops.h
@@ -217,119 +217,4 @@ static always_inline unsigned long __ffs(unsigned long word)
  */
 #define find_first_set_bit(x) (ffsl(x) - 1)
 
-/*
- * Find the first set bit in a memory region.
- */
-static inline unsigned long find_first_bit(const unsigned long *addr,
-                                           unsigned long size)
-{
-    const unsigned long *p = addr;
-    unsigned long result = 0;
-    unsigned long tmp;
-
-    while ( size & ~(BITS_PER_LONG - 1) )
-    {
-        if ( (tmp = *(p++)) )
-            goto found;
-        result += BITS_PER_LONG;
-        size -= BITS_PER_LONG;
-    }
-    if ( !size )
-        return result;
-
-    tmp = (*p) & (~0UL >> (BITS_PER_LONG - size));
-    if ( tmp == 0UL )         /* Are any bits set? */
-        return result + size; /* Nope. */
- found:
-    return result + __ffs(tmp);
-}
-
-static inline unsigned long find_next_bit(const unsigned long *addr,
-                                          unsigned long size,
-                                          unsigned long offset)
-{
-    const unsigned long *p = addr + BITOP_WORD(offset);
-    unsigned long result = offset & ~(BITS_PER_LONG - 1);
-    unsigned long tmp;
-
-    if ( offset >= size )
-        return size;
-    size -= result;
-    offset %= BITS_PER_LONG;
-    if ( offset )
-    {
-        tmp = *(p++);
-        tmp &= (~0UL << offset);
-        if ( size < BITS_PER_LONG )
-            goto found_first;
-        if ( tmp )
-            goto found_middle;
-        size -= BITS_PER_LONG;
-        result += BITS_PER_LONG;
-    }
-    while ( size & ~(BITS_PER_LONG - 1) )
-    {
-        if ( (tmp = *(p++)) )
-            goto found_middle;
-        result += BITS_PER_LONG;
-        size -= BITS_PER_LONG;
-    }
-    if ( !size )
-        return result;
-    tmp = *p;
-
- found_first:
-    tmp &= (~0UL >> (BITS_PER_LONG - size));
-    if ( tmp == 0UL )         /* Are any bits set? */
-        return result + size; /* Nope. */
- found_middle:
-    return result + __ffs(tmp);
-}
-
-/*
- * This implementation of find_{first,next}_zero_bit was stolen from
- * Linus' asm-alpha/bitops.h.
- */
-static inline unsigned long find_next_zero_bit(const unsigned long *addr,
-                                               unsigned long size,
-                                               unsigned long offset)
-{
-    const unsigned long *p = addr + BITOP_WORD(offset);
-    unsigned long result = offset & ~(BITS_PER_LONG - 1);
-    unsigned long tmp;
-
-    if ( offset >= size )
-        return size;
-    size -= result;
-    offset %= BITS_PER_LONG;
-    if ( offset )
-    {
-        tmp = *(p++);
-        tmp |= ~0UL >> (BITS_PER_LONG - offset);
-        if ( size < BITS_PER_LONG )
-            goto found_first;
-        if ( ~tmp )
-            goto found_middle;
-        size -= BITS_PER_LONG;
-        result += BITS_PER_LONG;
-    }
-    while ( size & ~(BITS_PER_LONG - 1) )
-    {
-        if ( ~(tmp = *(p++)) )
-            goto found_middle;
-        result += BITS_PER_LONG;
-        size -= BITS_PER_LONG;
-    }
-    if ( !size )
-        return result;
-    tmp = *p;
-
- found_first:
-    tmp |= ~0UL << size;
-    if ( tmp == ~0UL )        /* Are any bits zero? */
-        return result + size; /* Nope. */
- found_middle:
-    return result + ffz(tmp);
-}
-
 #endif /* _ASM_PPC_BITOPS_H */
diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index a88d45475c..bddd75a473 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -105,6 +105,54 @@ static inline int generic_flsl(unsigned long x)
  */
 #include <asm/bitops.h>
 
+#ifndef find_next_bit
+/**
+ * find_next_bit - find the next set bit in a memory region
+ * @addr: The address to base the search on
+ * @offset: The bitnumber to start searching at
+ * @size: The bitmap size in bits
+ */
+extern unsigned long find_next_bit(const unsigned long *addr,
+                                   unsigned long size,
+                                   unsigned long offset);
+#endif
+
+#ifndef find_next_zero_bit
+/**
+ * find_next_zero_bit - find the next cleared bit in a memory region
+ * @addr: The address to base the search on
+ * @offset: The bitnumber to start searching at
+ * @size: The bitmap size in bits
+ */
+extern unsigned long find_next_zero_bit(const unsigned long *addr,
+                                        unsigned long size,
+                                        unsigned long offset);
+#endif
+
+#ifndef find_first_bit
+/**
+ * find_first_bit - find the first set bit in a memory region
+ * @addr: The address to start the search at
+ * @size: The maximum size to search
+ *
+ * Returns the bit number of the first set bit.
+ */
+extern unsigned long find_first_bit(const unsigned long *addr,
+                                    unsigned long size);
+#endif
+
+#ifndef find_first_zero_bit
+/**
+ * find_first_zero_bit - find the first cleared bit in a memory region
+ * @addr: The address to start the search at
+ * @size: The maximum size to search
+ *
+ * Returns the bit number of the first cleared bit.
+ */
+extern unsigned long find_first_zero_bit(const unsigned long *addr,
+                                         unsigned long size);
+#endif
+
 #if BITS_PER_LONG == 64
 # define fls64 flsl
 # define ffs64 ffsl
diff --git a/xen/lib/Makefile b/xen/lib/Makefile
index 2d9ebb945f..e63798e1d4 100644
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -3,6 +3,7 @@ obj-$(CONFIG_X86) += x86/
 lib-y += bsearch.o
 lib-y += ctors.o
 lib-y += ctype.o
+lib-y += find-next-bit.o
 lib-y += list-sort.o
 lib-y += memchr.o
 lib-y += memchr_inv.o
diff --git a/xen/arch/arm/arm64/lib/find_next_bit.c b/xen/lib/find-next-bit.c
similarity index 100%
rename from xen/arch/arm/arm64/lib/find_next_bit.c
rename to xen/lib/find-next-bit.c
-- 
2.43.0


