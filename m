Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C40A84FB59
	for <lists+xen-devel@lfdr.de>; Fri,  9 Feb 2024 18:58:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678777.1056287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYV93-0005bV-NS; Fri, 09 Feb 2024 17:58:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678777.1056287; Fri, 09 Feb 2024 17:58:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYV93-0005Zc-KH; Fri, 09 Feb 2024 17:58:37 +0000
Received: by outflank-mailman (input) for mailman id 678777;
 Fri, 09 Feb 2024 17:58:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qnec=JS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rYV92-0005ZO-L5
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2024 17:58:36 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7bf9aa8-c774-11ee-98f5-efadbce2ee36;
 Fri, 09 Feb 2024 18:58:34 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a383016f428so137429566b.2
 for <xen-devel@lists.xenproject.org>; Fri, 09 Feb 2024 09:58:34 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 ty15-20020a170907c70f00b00a358b6242fcsm966999ejc.114.2024.02.09.09.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Feb 2024 09:58:33 -0800 (PST)
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
X-Inumbo-ID: d7bf9aa8-c774-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707501514; x=1708106314; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2lrkJ9V+mE1GUJ7aII/vGn7VoenhC2UAArd0NmS/noQ=;
        b=bZCp6P9EgGhWltelv1EW481bmqBLxnOIgPSaJam2HoEi1OOX16qkgcrhu/tAn57f7O
         5ivrYGmrpMgWcVk41+pw4j3Tguw64IjZ9Q3cI0VRtKUEzGGNPmU0ouc7jj4R7q16Etui
         aRo0ldFaYI5J7sNi9ERDymfWjdDzKKwWTY3GmV+zNmj1hDkNuBxm2gqDwbjWe9f4hMzv
         CWPsa1FbjsptMcjdZm6Q9aF7vPXKLpb0kKjr2kAztDfVqiyLL4UJk+h7r9AuZzXeWkYk
         ARwl+miB19FyNPt31N3EuA+C31cu+cNoy2dAYwHpj3fl1UjsrmXjVlR+zKMVa9XIYjCF
         lwaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707501514; x=1708106314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2lrkJ9V+mE1GUJ7aII/vGn7VoenhC2UAArd0NmS/noQ=;
        b=V0m4583EvKKLaKRE/bhtqu01bvfNN0dRqEZC36iJgq9u72Y6PzYMGJGOISGZRmZLYf
         JjFbZ0Ec6agUKaq2aqvXHQA4S4EZqmSR7qeghe7TPSsKMf/2moF1vJ9Ucwyz4yqrTsJS
         DFsoEOvzrUAJMLKVCsv1MIvom97L524GTws+V8ercrWcdaJvtwL6woQYCvbTRbOBoUO+
         J/frfGhV9LWGw1zTj84FM00txy3GFlosCMcl3UDLeeFzhiwiWI/4YzqZ64epCxjJTKNp
         uucXzUUVdGqfOZHgy7WRtF1YhXZWpOchmenXU9TsPpTl2YLAMqJ/xm9ykWqNm+A5qNfh
         +C/g==
X-Gm-Message-State: AOJu0YyOjm/nF5e0MzevVwQ3Xz3/jROXxwnrad0iEjZErX9J/cmvOehY
	qkYDguYf3QmQSBA5N8m9MC+kXMSo5Uj3VcoTc5kstngDkPP0BEJxUSprwOeG
X-Google-Smtp-Source: AGHT+IG4/yVaVqTmTUdvj85AiCmykXPfvOVQfW7vtw+raXGRW3duqrmrkW9WeBZDTJwX3xHCQp2kmA==
X-Received: by 2002:a17:906:138e:b0:a37:2566:e248 with SMTP id f14-20020a170906138e00b00a372566e248mr2059724ejc.37.1707501513785;
        Fri, 09 Feb 2024 09:58:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUwj+GLoZzXGKtudUJE+LOLgvk5tKyT1bhuhpO0NzBiT0I0ed1BpOpkwHUUJMMq87ZqBtWZfCHn5kB2ke/v2lh3fuymnZ26krLQpoF+cJLXCEGqzuDwFbCBtLkNz7mKxmjJaRfLna5djXTwDeGDhZRYNt3TuOwxckZpg2ogxybFAz1gWR/HazKkToDwN8o/5jnGsq8TmrDz4ise2ZzaykMsPoTXKOysAftzFpk1oUsQqkG3dxEybwr/88+rWZvEMUYNoENaqrXrEzbD2N7gEMIeX/fhq5ant398QiTegeBJh5GOVXB9HlbjCRlVmPuPWhKflfs/h9DKS4WOoxWeASwbV0uVRJyjDUk3ZcAK9a2HD79L+6T1SE7Y
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
Subject: [PATCH v2] xen/lib: introduce generic find next bit operations
Date: Fri,  9 Feb 2024 18:58:30 +0100
Message-ID: <fea2e65768457adcfedbfcc294004b1d5c2e86ea.1707495704.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

find-next-bit.c is common for Arm64, PPC and RISCV64,
so it is moved to xen/lib.

PPC has been transitioned to generic functions from find-next-bit.c
since it now shares the same implementation as the PPC-specific code.

The MISRA exclude list has been updated to verify
lib/find-next-bit.c instead of Arm's find_next_bit.c,
as Arm's find_next_bit.c has been relocated to xen/lib/.

Despite CONFIG_GENERIC_FIND_FIRST_BIT not currently being used in
Xen and being removed from the Linux kernel [1], it could theoretically
prove useful for Xen. This is because the Linux kernel transitioned
Arm to the generic version of find_first_bit() and
find_first_zero_bit() due to improvements [1] in both performance
and .text size.
It would be prudent to investigate whether [1] is applicable to Xen
as well and, if so, implement the necessary changes in a separate patch.

[1] https://lore.kernel.org/linux-arch/20211005054059.475634-5-yury.norov@gmail.com/

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 docs/misra/exclude-list.json                  |   8 +-
 xen/arch/arm/arm64/lib/Makefile               |   2 +-
 xen/arch/arm/include/asm/arm64/bitops.h       |  46 +------
 xen/arch/ppc/include/asm/bitops.h             | 115 ------------------
 xen/include/xen/bitops.h                      |  48 ++++++++
 xen/lib/Makefile                              |   1 +
 .../find_next_bit.c => lib/find-next-bit.c}   |   0
 7 files changed, 55 insertions(+), 165 deletions(-)
 rename xen/{arch/arm/arm64/lib/find_next_bit.c => lib/find-next-bit.c} (100%)

diff --git a/docs/misra/exclude-list.json b/docs/misra/exclude-list.json
index 7971d0e70f..b28174d0eb 100644
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
@@ -221,6 +217,10 @@
             "rel_path": "include/xen/decompress.h",
             "comment": "Imported from Linux, ignore for now"
         },
+        {
+            "rel_path": "lib/find-next-bit.c",
+            "comment": "Imported from Linux, ignore for now"
+        },
         {
             "rel_path": "lib/list-sort.c",
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
index d85a49bca4..0efde29068 100644
--- a/xen/arch/arm/include/asm/arm64/bitops.h
+++ b/xen/arch/arm/include/asm/arm64/bitops.h
@@ -36,57 +36,13 @@ static inline int flsl(unsigned long x)
 
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
+#ifndef CONFIG_GENERIC_FIND_FIRST_BIT
 
 #define find_first_bit(addr, size) find_next_bit((addr), (size), 0)
 #define find_first_zero_bit(addr, size) find_next_zero_bit((addr), (size), 0)
 
 #endif /* CONFIG_GENERIC_FIND_FIRST_BIT */
 
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
index 2cb7892bcc..e3c5a4ccf3 100644
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


