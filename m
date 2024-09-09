Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6089714DF
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 12:08:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794154.1202886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snbJf-00013H-By; Mon, 09 Sep 2024 10:08:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794154.1202886; Mon, 09 Sep 2024 10:08:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snbJf-0000yG-7e; Mon, 09 Sep 2024 10:08:15 +0000
Received: by outflank-mailman (input) for mailman id 794154;
 Mon, 09 Sep 2024 10:08:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dA/l=QH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1snbJd-0000t0-Gq
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 10:08:13 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bb9e764-6e93-11ef-99a1-01e77a169b0f;
 Mon, 09 Sep 2024 12:08:11 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a8d64b27c45so44583766b.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 03:08:11 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25952671sm318275866b.68.2024.09.09.03.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 03:08:10 -0700 (PDT)
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
X-Inumbo-ID: 6bb9e764-6e93-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725876491; x=1726481291; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gvRnfy9Z1obTPUubOTKLqoxb/XdQ79tbc6pl3R3nC5I=;
        b=OIbX7JKHW1HNZcDKSfnLd13/i5m6J/KqSPDwJkVfNqf76aBkxiX8kTzMrgVMcQ+B2u
         irD9yJTcNmPCokqIxR0kPzJfZGRwGhp1G7itVWVy+zY/xIlKMFXvdgDiydZu4gtWzo2i
         JgkycjiNlMLi6AcVssGO2eve6UhQGxhFePzJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725876491; x=1726481291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gvRnfy9Z1obTPUubOTKLqoxb/XdQ79tbc6pl3R3nC5I=;
        b=UypI70iwqolLfx88jgddgg/XgHiFNSulIw/nzWJQk8ZnmCyDr1ar4K3wMwDRvRteS5
         5FrHoLYkrs4n+ojbDFQrMYY/ZqPlSbLTdh19kOyuxRGm2FNgb+GYOxnLfJV4qhrwzFfT
         T9ibC10t8kN35F6Cf1sEFKaopsNb57y18gMu/zotcw45T1fO2posM2/W3klpmCqTUE2j
         qA7DX5CvehApiHut7tUJvNaVMcOD4siV+P2poPTD/NOAGFNkNGH4AWnc1grbhbeTXU5I
         mCc/vFuoSDKCO7TbtHH/8GMdRtwwGqfeKsRHpMrEAtBLPoCVcoNzC3nyS9PHAAfOJUGR
         Iucw==
X-Gm-Message-State: AOJu0YwwsF+EtNa/n5lovQL3dgTpkR6rE/PUizCkEZO2EzR7lppLZy24
	3wFvjtJJmgvaPIDMGzLpvZT8CdCCQmNUWM8n1YD9TB8C8vj7OBnrNcJe9SxQ90LvQ3qHje5aGLg
	i
X-Google-Smtp-Source: AGHT+IFlzXcAirNreIwR+IY5SMFD0S9mPCje55XwezUZj/Xa/WhPFtHSWVcRxszYVKr6dCyHXLA14A==
X-Received: by 2002:a17:906:db07:b0:a86:6a26:fec7 with SMTP id a640c23a62f3a-a8a886667ccmr837901266b.30.1725876490888;
        Mon, 09 Sep 2024 03:08:10 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH] Define and use UINT64_C and INT64_C
Date: Mon,  9 Sep 2024 11:08:05 +0100
Message-Id: <20240909100806.47280-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Makes code and constants work on both 32 and 64 bit.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/include/asm/config.h      |  6 +++---
 xen/arch/x86/include/asm/mm.h          | 12 ++++++------
 xen/arch/x86/include/asm/x86_64/page.h |  4 ++--
 xen/arch/x86/setup.c                   |  4 ++--
 xen/common/efi/boot.c                  |  2 +-
 xen/crypto/vmac.c                      |  2 ++
 xen/include/crypto/vmac.h              |  4 ++++
 xen/include/xen/const.h                |  9 +++++++++
 xen/include/xen/stdint.h               |  2 ++
 9 files changed, 31 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/include/asm/config.h b/xen/arch/x86/include/asm/config.h
index 1f828bfd52..7f91a478f5 100644
--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -86,10 +86,10 @@
 #include <xen/const.h>
 
 #define PML4_ENTRY_BITS  39
-#define PML4_ENTRY_BYTES (_AC(1,UL) << PML4_ENTRY_BITS)
+#define PML4_ENTRY_BYTES (UINT64_C(1) << PML4_ENTRY_BITS)
 #define PML4_ADDR(_slot)                              \
-    (((_AC(_slot, UL) >> 8) * _AC(0xffff000000000000,UL)) | \
-     (_AC(_slot, UL) << PML4_ENTRY_BITS))
+    (((UINT64_C(_slot) >> 8) * UINT64_C(0xffff000000000000)) | \
+     (UINT64_C(_slot) << PML4_ENTRY_BITS))
 
 /*
  * Memory layout:
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index b3853ae734..1077544c76 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -20,7 +20,7 @@
 #define PFN_ORDER(_pfn) ((_pfn)->v.free.order)
 
 #define PG_shift(idx)   (BITS_PER_LONG - (idx))
-#define PG_mask(x, idx) (x ## UL << PG_shift(idx))
+#define PG_mask(x, idx) (UINT64_C(x) << PG_shift(idx))
 
  /* The following page types are MUTUALLY EXCLUSIVE. */
 #define PGT_none          PG_mask(0, 3)  /* no special uses of this page   */
@@ -59,7 +59,7 @@
 
  /* Count of uses of this frame as its current type. */
 #define PGT_count_width   PG_shift(9)
-#define PGT_count_mask    ((1UL<<PGT_count_width)-1)
+#define PGT_count_mask    ((UINT64_C(1)<<PGT_count_width)-1)
 
 /* Are the 'type mask' bits identical? */
 #define PGT_type_equal(x, y) (!(((x) ^ (y)) & PGT_type_mask))
@@ -97,7 +97,7 @@
 #else
 #define PGC_count_width   PG_shift(6)
 #endif
-#define PGC_count_mask    ((1UL<<PGC_count_width)-1)
+#define PGC_count_mask    ((UINT64_C(1)<<PGC_count_width)-1)
 
 /*
  * Page needs to be scrubbed. Since this bit can only be set on a page that is
@@ -499,9 +499,9 @@ static inline int get_page_and_type(struct page_info *page,
  */
 #undef  machine_to_phys_mapping
 #define machine_to_phys_mapping  ((unsigned long *)RDWR_MPT_VIRT_START)
-#define INVALID_M2P_ENTRY        (~0UL)
-#define VALID_M2P(_e)            (!((_e) & (1UL<<(BITS_PER_LONG-1))))
-#define SHARED_M2P_ENTRY         (~0UL - 1UL)
+#define INVALID_M2P_ENTRY        (~UINT64_C(0))
+#define VALID_M2P(_e)            (!((_e) & (UINT64_C(1)<<(BITS_PER_LONG-1))))
+#define SHARED_M2P_ENTRY         (~UINT64_C(0) - UINT64_C(1))
 #define SHARED_M2P(_e)           ((_e) == SHARED_M2P_ENTRY)
 
 /*
diff --git a/xen/arch/x86/include/asm/x86_64/page.h b/xen/arch/x86/include/asm/x86_64/page.h
index 201b79f99e..dbf2fd061c 100644
--- a/xen/arch/x86/include/asm/x86_64/page.h
+++ b/xen/arch/x86/include/asm/x86_64/page.h
@@ -4,8 +4,8 @@
 
 #define __XEN_VIRT_START        XEN_VIRT_START
 
-#define VADDR_TOP_BIT           (1UL << (VADDR_BITS - 1))
-#define CANONICAL_MASK          (~0UL & ~VADDR_MASK)
+#define VADDR_TOP_BIT           (UINT64_C(1) << (VADDR_BITS - 1))
+#define CANONICAL_MASK          (~UINT64_C(0) & ~VADDR_MASK)
 
 #define is_canonical_address(x) (((long)(x) >> 47) == ((long)(x) >> 63))
 
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index a6e77c9ed9..6330549e8f 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1384,9 +1384,9 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
         }
 
         if ( e > min(HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START,
-                     1UL << (PAGE_SHIFT + 32)) )
+                     UINT64_C(1) << (PAGE_SHIFT + 32)) )
             e = min(HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START,
-                    1UL << (PAGE_SHIFT + 32));
+                    UINT64_C(1) << (PAGE_SHIFT + 32));
 #define reloc_size ((__pa(__2M_rwdata_end) + mask) & ~mask)
         /* Is the region suitable for relocating Xen? */
         if ( !xen_phys_start && e <= limit )
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index efbec00af9..185a471a04 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -770,7 +770,7 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
         what = what ?: L"Seek";
     else
     {
-        file->addr = min(1UL << (32 + PAGE_SHIFT),
+        file->addr = min(UINT64_C(1) << (32 + PAGE_SHIFT),
                          HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START);
         ret = efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderData,
                                     PFN_UP(size), &file->addr);
diff --git a/xen/crypto/vmac.c b/xen/crypto/vmac.c
index 294dd16a52..d831114f9c 100644
--- a/xen/crypto/vmac.c
+++ b/xen/crypto/vmac.c
@@ -11,7 +11,9 @@
 #include <xen/types.h>
 #include <xen/lib.h>
 #include <crypto/vmac.h>
+#ifndef UINT64_C
 #define UINT64_C(x)  x##ULL
+#endif
 /* end for Xen */
 
 /* Enable code tuned for 64-bit registers; otherwise tuned for 32-bit */
diff --git a/xen/include/crypto/vmac.h b/xen/include/crypto/vmac.h
index 457f3f5dd6..ab8c644e70 100644
--- a/xen/include/crypto/vmac.h
+++ b/xen/include/crypto/vmac.h
@@ -51,12 +51,16 @@
 #elif (_MSC_VER)                  /* Microsoft C does not have stdint.h    */
 typedef unsigned __int32 uint32_t;
 typedef unsigned __int64 uint64_t;
+#ifndef UINT64_C
 #define UINT64_C(v) v ## UI64
+#endif
 #else                             /* Guess sensibly - may need adaptation  */
 typedef unsigned int uint32_t;
 typedef unsigned long long uint64_t;
+#ifndef UINT64_C
 #define UINT64_C(v) v ## ULL
 #endif
+#endif
 
 /* --------------------------------------------------------------------------
  * This implementation supports two free AES implementations: OpenSSL's and
diff --git a/xen/include/xen/const.h b/xen/include/xen/const.h
index baf28ef144..e2fb0fd3a4 100644
--- a/xen/include/xen/const.h
+++ b/xen/include/xen/const.h
@@ -15,10 +15,19 @@
 #ifdef __ASSEMBLY__
 #define _AC(X,Y)	X
 #define _AT(T,X)	X
+#define UINT64_C(X)     X
+#define INT64_C(X)      X
 #else
 #define __AC(X,Y)	(X##Y)
 #define _AC(X,Y)	__AC(X,Y)
 #define _AT(T,X)	((T)(X))
+#if __SIZEOF_LONG__ >= 8
+#define UINT64_C(X)     X ## UL
+#define INT64_C(X)      X ## L
+#else
+#define UINT64_C(X)     X ## ULL
+#define INT64_C(X)      X ## LL
+#endif
 #endif
 
 #define BIT(pos, sfx)   (_AC(1, sfx) << (pos))
diff --git a/xen/include/xen/stdint.h b/xen/include/xen/stdint.h
index a40165c6ae..e80756c4a4 100644
--- a/xen/include/xen/stdint.h
+++ b/xen/include/xen/stdint.h
@@ -30,4 +30,6 @@ typedef __UINT64_TYPE__    uint64_t;
 
 #endif
 
+#include <xen/const.h>
+
 #endif /* __XEN_STDINT_H__ */
-- 
2.34.1


