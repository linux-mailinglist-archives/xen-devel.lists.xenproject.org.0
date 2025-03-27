Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EDDA73A84
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 18:33:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929871.1332643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txr6J-00035z-Qv; Thu, 27 Mar 2025 17:33:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929871.1332643; Thu, 27 Mar 2025 17:33:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txr6J-00033l-MQ; Thu, 27 Mar 2025 17:33:07 +0000
Received: by outflank-mailman (input) for mailman id 929871;
 Thu, 27 Mar 2025 17:33:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eznr=WO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1txr6I-00033f-Vz
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 17:33:07 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a8f3b4e-0b31-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 18:33:05 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ab771575040so463919366b.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 10:33:05 -0700 (PDT)
Received: from fedora.. (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac71922b8aesm28381766b.13.2025.03.27.10.33.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 10:33:04 -0700 (PDT)
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
X-Inumbo-ID: 8a8f3b4e-0b31-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743096785; x=1743701585; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IFoKnyDMTpyL3rQ8P569Ng4MV6MJNyt3gAVshetXZPc=;
        b=Suy+3smMpnDfI0PorY9lUphPAJpLJZUS0SZfI/EoMznLiWRdpS+7jU+yqCmdwby9oh
         7Vt5yGxbRIKio1RRNm3/B//43FqQh//GxpC5pB9/0If1wFAZhjXNnUpCn+5ENQ121FGF
         MMkWlLzq8Gvk/a0KlUYHgc0sKaPqpnuDjD3e+qeuiDTAAevcubZZmwqtvBomJGAV9W+w
         beW8KjvwS3F0b6uKyTEBBw8CHDAoXUdlIYicyWFODG67cOM2AeSJNwGpdZLffNrkyW6j
         DdjY2c60r+Rh6X05mIBvL5A+AttylOAcg61+dmHt68rXDsejIo78OPkpYs2oKPFi+IL+
         UFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743096785; x=1743701585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IFoKnyDMTpyL3rQ8P569Ng4MV6MJNyt3gAVshetXZPc=;
        b=c0wyqDwj6QXewTstmgl83os15B++/ZPCKXm1KZ0vf5+JQoE9yOR/9WoLrBT73o63dI
         2ffcBaA0mD/BF0591fdVUECpohBs/vOWeI8JZM5wZwt9vs031KYHMzb/AqhSepwv1MIt
         zK7oHPACXZCOARwpKSZ5KUlpLrFGeo9r8F/cvCANJcnN8UKF1BOst4Cvld9FFK0bsJsV
         kFNHjVgvcxPAGKHMWFFPXqSGeY98wY1CjeGSuWyCBR12HGFkPm6OthiEan7T2TcxyxaE
         XlNyab/Lc5gMJy7jOgt3SudPCB129+5g8/zh9KBTTh2SPJKwqiqjQzIzNZaGUdGysgr0
         mZTA==
X-Gm-Message-State: AOJu0YyQZQVdrJUpXhKDylhZh5EbJ2W7FCqeSlIajlEud395dmgarx5Z
	mSs7Ttzedo+Y/PXlhuxXtrAiP9RW7EOk8KbtfP8QdRZaTaLRG73c/lE0+g==
X-Gm-Gg: ASbGncvXyqGy4hYzIM584GtGIYP3GwzKxpLy/38Sgnd91AYiLcUfx0Ya4zhiMCtWq1f
	4GMKJ3Kha2MREPkOcmkxwwVe5JLI1ubZ/7MMizeWBUxS/EXmN9YZ15hQFh6HZ1i3WmrkwzdKreb
	S3OWsVIpMTCjkpWhFDPsib8lZ029MPjES0vGnNhtWZGQ8dwSYGkfl4VVbsQKxAJicV7qPJQMstb
	iy4R5BSO6Q13Q8Lnq6MkLtMJ0RP8flPSxFb/zQhTKOOntYzhJ/VkTkV9g8N3k0EnYiufTwrB0nu
	0d1QAm2EsGcegdyBLi1v49Uo7a6OhLxoXnAcq9XiZ4fUBUWFnKSBfaMkxtFU11/fzh0va9FITaq
	j7256Z4/SEeViG64hoA6MmTZs
X-Google-Smtp-Source: AGHT+IGJ+rO1LaXSCQ7ZFD1kDVaSobHiRIlQR8b0RP3Dpn4MnrcOFEbVU/PaglwwkdzSeGKprtoE7A==
X-Received: by 2002:a17:906:4fd5:b0:ac1:e45f:9c71 with SMTP id a640c23a62f3a-ac71683f88dmr138079066b.1.1743096784500;
        Thu, 27 Mar 2025 10:33:04 -0700 (PDT)
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
Subject: [PATCH v2] xen/config.h: Move BITS_PER_* definitions from asm/config.h to xen/config.h
Date: Thu, 27 Mar 2025 18:33:01 +0100
Message-ID: <6b21fb046cf1c8ca760f5ad72fa3cc13b59c4069.1743092485.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
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
 GitLab CI tests results:
   https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/1738505446

 As Anrew mentioned here https://lore.kernel.org/xen-devel/f294e2b1-db03-46b2-b46d-61e89b55cef3@suse.com/T/#ma4205392964ff913d9dfa8e044a4af59ed6aef88:
 "This patch possibly wants to wait until I've fixed the compiler checks to update to the new baseline, ..."

 The patch with compiler fixes is https://lore.kernel.org/xen-devel/f79117a2-1763-4458-862f-a5219b09989a@citrix.com/T/#mf79cf8c1f6f6a3661c49bac84c1c15bbaae7422d.
---
Changes in v2:
 - Add the comment "It is assumed that sizeof(void *) == __alignof(void *)"
   above POINTER_ALIGN definition.
 - Replace "<< 3" with "BITS_PER_BYTE" in definitions of
   BITS_PER_{INT,LONG,LONG_LONG}.
---
 xen/arch/arm/include/asm/bitops.h   |  4 +---
 xen/arch/arm/include/asm/config.h   |  8 --------
 xen/arch/ppc/include/asm/bitops.h   |  4 +---
 xen/arch/ppc/include/asm/config.h   |  7 -------
 xen/arch/riscv/include/asm/config.h | 13 -------------
 xen/arch/x86/include/asm/config.h   |  8 --------
 xen/include/xen/config.h            | 10 ++++++++++
 7 files changed, 12 insertions(+), 42 deletions(-)

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
index d888b2314d..7d43159efb 100644
--- a/xen/include/xen/config.h
+++ b/xen/include/xen/config.h
@@ -98,4 +98,14 @@
 #define ZERO_BLOCK_PTR ((void *)-1L)
 #endif
 
+#define BYTES_PER_LONG  __SIZEOF_LONG__
+
+#define BITS_PER_BYTE   __CHAR_BIT__
+#define BITS_PER_INT    (BITS_PER_BYTE * __SIZEOF_INT__)
+#define BITS_PER_LONG   (BITS_PER_BYTE * BYTES_PER_LONG)
+#define BITS_PER_LLONG  (BITS_PER_BYTE * __SIZEOF_LONG_LONG__)
+
+/* It is assumed that sizeof(void *) == __alignof(void *) */
+#define POINTER_ALIGN   __SIZEOF_POINTER__
+
 #endif /* __XEN_CONFIG_H__ */
-- 
2.49.0


