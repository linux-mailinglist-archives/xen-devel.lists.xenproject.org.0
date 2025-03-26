Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1163A71D9A
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 18:47:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928197.1330942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txUqS-0005UG-1G; Wed, 26 Mar 2025 17:47:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928197.1330942; Wed, 26 Mar 2025 17:47:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txUqR-0005R8-UL; Wed, 26 Mar 2025 17:47:15 +0000
Received: by outflank-mailman (input) for mailman id 928197;
 Wed, 26 Mar 2025 17:47:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+Jq=WN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1txUqQ-0005R2-2j
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 17:47:14 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5891f24a-0a6a-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 18:47:12 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ac289147833so16370666b.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 10:47:12 -0700 (PDT)
Received: from fedora.. (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac6ea5ef3f1sm134877866b.79.2025.03.26.10.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Mar 2025 10:47:10 -0700 (PDT)
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
X-Inumbo-ID: 5891f24a-0a6a-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743011231; x=1743616031; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f7Uzq9oW680zYljd7jZo7KQRh1uZjJNlw96sXDXsCB0=;
        b=j5lJe8VI/21Gdx+UJPwp5kS8OvjEuHb8fNmjGy826D9ZrkbuV12s7J6NsX+/mVSJZY
         D4/AhsV4imDEbiYAwaxsvh99SQCa7OCy88lLT9YP6662uwXbJ+W22RTJdF7O0df5WALA
         fpSMde6yTr2UekJb5MijLxqoffW0j3rxYOavdmiBGiU2ZLBbeF7lQsOCqgxWFkNTaZAm
         AW1bJDSjWgKcCxGH3rkF+4maIwxAMkXZ+TI6RB/CbUDorIqYbIjVL9ua+zGaILtg8atI
         2f1Hji9m13BQMg3j5xEV3kIs8yNMhZqDricGiFpxveMMRBBa468m5YVnvHTSYKHAvHqz
         +X5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743011231; x=1743616031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f7Uzq9oW680zYljd7jZo7KQRh1uZjJNlw96sXDXsCB0=;
        b=uq2aY+73v5xmNi45USC6m5XZeEaXBbUp2fn1X/o+L5p51UF+CfXwahvQFnKs4jgX/B
         s08rhT5d2Y5+W4uISkv8E95nA8/zKVGWpMGLaRe76TjAfJefpOAUY45MP+xnF/SyfHbq
         MZJfY+ka96ZCqQFtXmMVeENBVdlFQHeJPByo7zZa26+gocxubfWnCg0S1fFiBPjw98cy
         EK9paRzxH+W5soZagaOhUVvRJ1RgPyg63i9vICS/Mz4Ezsg03coOLKyxaEE+EH3X+NFN
         0rLQRP1lkWec8nlvDw/xxNlpdTyhyWiTrL31wIXboqR5FDhO7ell+qp4O7RJ56obTYht
         E/ng==
X-Gm-Message-State: AOJu0Yx4VbtpqPWeIKrt1vHITQ9uIq/mOh1nlC1OCEnlfUZgm9KpWWAB
	Lpsz6kDL22W63Lvqn7Jt0KYwpAaxgLAL3abtc9OOhEih+SdTIrgzz4oYqQ==
X-Gm-Gg: ASbGnct3hppJLOCkH3Est3bEuRcUQAthNOLpU1R25sAx6GsT3QU0yslNRH8V0M3EP+H
	wgXA+9GWY2isotFPw/zGCSs47Eg8Rf62IdB0qJB6/anY8tWKXypLR9qM5o5Umjom0yrtr/kL1he
	SN+4hTC5K6xpQMLupakEuA9xLyWGqAAFX+eDRlWQ35mJH+Ctl2gD1lITXPNDzfpAQm7iC5SwYxO
	e0ezIzWmF4RjvrsYmxbx0gCfWvri+CBu7Fz/4v8sIyBtJW87iszgQNCsulldYeUz+BIyWGX6Ukr
	hmrEae7DpvJyoO8wg2x9Jj35eMcT+ihMyX6/VjKPGQEdhWuPUhl51zGBYlGviidJygQ/Jhlp10L
	9vJZP7oIqQkaSBw==
X-Google-Smtp-Source: AGHT+IHo0r83mE4rf9pbHCAAQ+DPsqN72cKLnUv/ar1JHntkyXb3bYZsYi7vqB+UTNo0LNZ+yM0bVA==
X-Received: by 2002:a17:907:78b:b0:abf:67de:2f1f with SMTP id a640c23a62f3a-ac6fb0ff500mr34913066b.44.1743011230604;
        Wed, 26 Mar 2025 10:47:10 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1] xen/config.h: Move BITS_PER_* definitions from asm/config.h to xen/config.h
Date: Wed, 26 Mar 2025 18:47:07 +0100
Message-ID: <4f085bcbf5b6f1bc42824bfb08724e8a9bbd4918.1743005389.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

BITS_PER_* values can be defined in a common way using compiler-provided macros.
Thus, these definitions are moved to xen/config.h to reduce duplication across
architectures.

Additionally, *_BYTEORDER macros are removed, as BITS_PER_* values now come
directly from the compiler environment.

The arch_fls() implementation for Arm and PPC is updated to use BITS_PER_INT
instead of a hardcoded value of 32.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Potentially, BITS_PER_XEN_ULONG could also be moved to xen/config.h, as it is
64 for all architectures except x86. A possible approach:

#ifndef BITS_PER_XEN_ULONG
#define BITS_PER_XEN_ULONG 64
#endif

CI's tests result:
  https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/1736620512
---
 xen/arch/arm/include/asm/bitops.h   |  4 +---
 xen/arch/arm/include/asm/config.h   |  8 --------
 xen/arch/ppc/include/asm/bitops.h   |  4 +---
 xen/arch/ppc/include/asm/config.h   |  7 -------
 xen/arch/riscv/include/asm/config.h | 13 -------------
 xen/arch/x86/include/asm/config.h   |  8 --------
 xen/include/xen/config.h            |  9 +++++++++
 7 files changed, 11 insertions(+), 42 deletions(-)

diff --git a/xen/arch/arm/include/asm/bitops.h b/xen/arch/arm/include/asm/bitops.h
index f163d9bb45..60686a3a55 100644
--- a/xen/arch/arm/include/asm/bitops.h
+++ b/xen/arch/arm/include/asm/bitops.h
@@ -22,8 +22,6 @@
 #define __set_bit(n,p)            set_bit(n,p)
 #define __clear_bit(n,p)          clear_bit(n,p)
 
-#define BITS_PER_BYTE           8
-
 #define ADDR (*(volatile int *) addr)
 #define CONST_ADDR (*(const volatile int *) addr)
 
@@ -75,7 +73,7 @@ bool clear_mask16_timeout(uint16_t mask, volatile void *p,
 
 #define arch_ffs(x)  ((x) ? 1 + __builtin_ctz(x) : 0)
 #define arch_ffsl(x) ((x) ? 1 + __builtin_ctzl(x) : 0)
-#define arch_fls(x)  ((x) ? 32 - __builtin_clz(x) : 0)
+#define arch_fls(x)  ((x) ? BITS_PER_INT - __builtin_clz(x) : 0)
 #define arch_flsl(x) ((x) ? BITS_PER_LONG - __builtin_clzl(x) : 0)
 
 #endif /* _ARM_BITOPS_H */
diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
index 0a51142efd..5a02db6937 100644
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -8,19 +8,11 @@
 #define __ARM_CONFIG_H__
 
 #if defined(CONFIG_ARM_64)
-# define LONG_BYTEORDER 3
 # define ELFSIZE 64
 #else
-# define LONG_BYTEORDER 2
 # define ELFSIZE 32
 #endif
 
-#define BYTES_PER_LONG (1 << LONG_BYTEORDER)
-#define BITS_PER_LONG (BYTES_PER_LONG << 3)
-#define POINTER_ALIGN BYTES_PER_LONG
-
-#define BITS_PER_LLONG 64
-
 /* xen_ulong_t is always 64 bits */
 #define BITS_PER_XEN_ULONG 64
 
diff --git a/xen/arch/ppc/include/asm/bitops.h b/xen/arch/ppc/include/asm/bitops.h
index c942e9432e..e72942cca0 100644
--- a/xen/arch/ppc/include/asm/bitops.h
+++ b/xen/arch/ppc/include/asm/bitops.h
@@ -15,8 +15,6 @@
 #define __set_bit(n, p)         set_bit(n, p)
 #define __clear_bit(n, p)       clear_bit(n, p)
 
-#define BITS_PER_BYTE           8
-
 /* PPC bit number conversion */
 #define PPC_BITLSHIFT(be)    (BITS_PER_LONG - 1 - (be))
 #define PPC_BIT(bit)         (1UL << PPC_BITLSHIFT(bit))
@@ -121,7 +119,7 @@ static inline int test_and_set_bit(unsigned int nr, volatile void *addr)
 
 #define arch_ffs(x)  ((x) ? 1 + __builtin_ctz(x) : 0)
 #define arch_ffsl(x) ((x) ? 1 + __builtin_ctzl(x) : 0)
-#define arch_fls(x)  ((x) ? 32 - __builtin_clz(x) : 0)
+#define arch_fls(x)  ((x) ? BITS_PER_INT - __builtin_clz(x) : 0)
 #define arch_flsl(x) ((x) ? BITS_PER_LONG - __builtin_clzl(x) : 0)
 
 #define arch_hweightl(x) __builtin_popcountl(x)
diff --git a/xen/arch/ppc/include/asm/config.h b/xen/arch/ppc/include/asm/config.h
index 148fb3074d..8e32edd5a5 100644
--- a/xen/arch/ppc/include/asm/config.h
+++ b/xen/arch/ppc/include/asm/config.h
@@ -6,19 +6,12 @@
 #include <xen/page-size.h>
 
 #if defined(CONFIG_PPC64)
-#define LONG_BYTEORDER 3
 #define ELFSIZE        64
 #define MAX_VIRT_CPUS  1024u
 #else
 #error "Unsupported PowerPC variant"
 #endif
 
-#define BYTES_PER_LONG (1 << LONG_BYTEORDER)
-#define BITS_PER_LONG  (BYTES_PER_LONG << 3)
-#define POINTER_ALIGN  BYTES_PER_LONG
-
-#define BITS_PER_LLONG 64
-
 /* xen_ulong_t is always 64 bits */
 #define BITS_PER_XEN_ULONG 64
 
diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index 7141bd9e46..314c97c20a 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -119,25 +119,12 @@
 #define HYPERVISOR_VIRT_START XEN_VIRT_START
 
 #if defined(CONFIG_RISCV_64)
-# define INT_BYTEORDER 2
-# define LONG_BYTEORDER 3
 # define ELFSIZE 64
 # define MAX_VIRT_CPUS 128u
 #else
 # error "Unsupported RISCV variant"
 #endif
 
-#define BYTES_PER_INT  (1 << INT_BYTEORDER)
-#define BITS_PER_INT  (BYTES_PER_INT << 3)
-
-#define BYTES_PER_LONG (1 << LONG_BYTEORDER)
-#define BITS_PER_LONG  (BYTES_PER_LONG << 3)
-#define POINTER_ALIGN  BYTES_PER_LONG
-
-#define BITS_PER_LLONG 64
-
-#define BITS_PER_BYTE 8
-
 /* xen_ulong_t is always 64 bits */
 #define BITS_PER_XEN_ULONG 64
 
diff --git a/xen/arch/x86/include/asm/config.h b/xen/arch/x86/include/asm/config.h
index 19746f956e..f0123a7de9 100644
--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -7,16 +7,8 @@
 #ifndef __X86_CONFIG_H__
 #define __X86_CONFIG_H__
 
-#define LONG_BYTEORDER 3
 #define CONFIG_PAGING_LEVELS 4
 
-#define BYTES_PER_LONG (1 << LONG_BYTEORDER)
-#define BITS_PER_LONG (BYTES_PER_LONG << 3)
-#define BITS_PER_BYTE 8
-#define POINTER_ALIGN BYTES_PER_LONG
-
-#define BITS_PER_LLONG 64
-
 #define BITS_PER_XEN_ULONG BITS_PER_LONG
 
 #define CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS 1
diff --git a/xen/include/xen/config.h b/xen/include/xen/config.h
index d888b2314d..dbbf2fce62 100644
--- a/xen/include/xen/config.h
+++ b/xen/include/xen/config.h
@@ -98,4 +98,13 @@
 #define ZERO_BLOCK_PTR ((void *)-1L)
 #endif
 
+#define BYTES_PER_LONG  __SIZEOF_LONG__
+
+#define BITS_PER_BYTE   __CHAR_BIT__
+#define BITS_PER_INT    (__SIZEOF_INT__ << 3)
+#define BITS_PER_LONG   (BYTES_PER_LONG << 3)
+#define BITS_PER_LLONG  (__SIZEOF_LONG_LONG__ << 3)
+
+#define POINTER_ALIGN   __SIZEOF_POINTER__
+
 #endif /* __XEN_CONFIG_H__ */
-- 
2.48.1


