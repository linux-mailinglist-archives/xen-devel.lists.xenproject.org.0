Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6F3C9F247
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 14:33:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176775.1501246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQmym-0004uO-If; Wed, 03 Dec 2025 13:33:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176775.1501246; Wed, 03 Dec 2025 13:33:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQmym-0004rG-EF; Wed, 03 Dec 2025 13:33:12 +0000
Received: by outflank-mailman (input) for mailman id 1176775;
 Wed, 03 Dec 2025 13:33:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dwxk=6J=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vQmyk-0004r8-NN
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 13:33:11 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97468dee-d04c-11f0-9d1a-b5c5bf9af7f9;
 Wed, 03 Dec 2025 14:33:02 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-477ba2c1ca2so76985325e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Dec 2025 05:33:02 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4792b021cd2sm20007645e9.1.2025.12.03.05.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Dec 2025 05:33:00 -0800 (PST)
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
X-Inumbo-ID: 97468dee-d04c-11f0-9d1a-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1764768781; x=1765373581; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XCUZkoCKxWFHG8v48p67eBgxCJ09M8G5lm8kJ2gK7Lg=;
        b=gX4wkQA6MlFdrU6A+yaDJGof+GCTm4GNiw9FaZTOik7iIMx3vuMfpqb201LjZjkUyh
         YF/lFU4Uy/Y28Vf/PhTHzxrJl9aXUaX0e+cLEhfi14WD2KTxu5zL0mzOvPI1KUK9ilay
         8Znsp+2nlmobUXPgsLC65aD6fBxG13NGtSEgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764768781; x=1765373581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XCUZkoCKxWFHG8v48p67eBgxCJ09M8G5lm8kJ2gK7Lg=;
        b=qOS9GsIMpzPWrIaohU1HtbVRu08Nulh1jhJRYdDEf7503uAmQIGYftsRWZmuKelTc0
         DXtZR3gajF7dugXlGlS54LzVnSvRokZfbqbEF69PWOAMLNoMxmDe49e+12Q3baSTbwf/
         Q7BLOQVLImdGg0gLiLoJRTG47fLtSINMvwVifofeWoN1JGy8yx7o8ihDaU60yashy7zw
         CQHwR0T0hi13fpMOY+DIdW1yUZV0t+e/1MFmc59pSHnLZhjgebKb2QThd6/MIRoFYBqO
         zGgqs3ceosE0T5tRwH9S1dyszpDdhi3aAaNDm7JBhP1Vwu6TInVn6EF665z1Jz1wA/EN
         Sgyg==
X-Gm-Message-State: AOJu0Yz4Bk8Vj6MBIU71Qgu+1IsN9pdn5FiNPp0mIv22e/2IXvU2NbUA
	ZRdjgYWk94PoJO/iOWVj0zIogFrTbDdkAODVBhjXIHj/z+/ghgN4AnEgI3QAaIDQRch3WJbNUwZ
	V8EbX
X-Gm-Gg: ASbGncukGGq2yRZcZ1kRgBF4iO1c/phhofUFkiQOL1S8mYQvloQc0U1FNz32qNObyT4
	3m6kvhYsjjpRRoRTvJ3KGaBgFNr0rrNP2zyQnwGviNKzKq4g2HuFCW4aIDBcQKrJoUVAPYBXpZ1
	h26/3znKZV84ngcKtBc/S+XlOCs4MVXXcMYLUp3syU5E8hzEatsjHtbYQDtGF/e7+IKcQMVB7OA
	vB/1CScHwJsauFCcuV2+Y6csOjUtJW44aaXqkLNdVswTxtVkoyLqM/RlQBe8Znw65xV5g4hkT3W
	N8ivAoYSuoUO5Wpqx+X5GXycIeAMjAAm+kUFcOIZJux9QJjQU7dBr982xfOUVUVm8cM2vMWIwbK
	oF0wWUOphMpdkqntJeXNCoPSODUXWE+hc3y7sPAcVbZ4+ivmKI67kz+jx/kF3HlbbZ37dJPpnjO
	ycPOAaaWhkx+aHH8VAPsro4v5gtWA4PaIN2l6ruD2l7ozVDi6PtBVMhRTueOOZlg==
X-Google-Smtp-Source: AGHT+IHmte9MpL5l72MvytKLIC2I7xNrdtAj40fYBFNuu6NhtCmsg3EjopThFM3ON8RnNJg2GfxcAA==
X-Received: by 2002:a05:600c:4f91:b0:477:aed0:f40a with SMTP id 5b1f17b1804b1-4792af3362cmr26221915e9.19.1764768780973;
        Wed, 03 Dec 2025 05:33:00 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Timothy Pearson <tpearson@raptorengineering.com>
Subject: [PATCH] xen/treewide: Use __ASSEMBLER__ instead of __ASSEMBLY__
Date: Wed,  3 Dec 2025 13:32:58 +0000
Message-Id: <20251203133258.1624223-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

__ASSEMBLER__ is how GCC and Clang spell this, removing the need to set it up
manually in AFLAGS.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Timothy Pearson <tpearson@raptorengineering.com>

Generated with sed.  Linux has done the same change too.

I debated splitting this patch, but it's simple enough IMO.
---
 xen/Makefile                               |  2 --
 xen/arch/arm/arm32/lib/assembler.h         |  2 +-
 xen/arch/arm/arm64/lib/assembler.h         |  2 +-
 xen/arch/arm/include/asm/alternative.h     |  4 ++--
 xen/arch/arm/include/asm/arm32/mpu.h       |  4 ++--
 xen/arch/arm/include/asm/arm32/page.h      |  4 ++--
 xen/arch/arm/include/asm/arm32/processor.h |  2 +-
 xen/arch/arm/include/asm/arm32/sysregs.h   |  6 +++---
 xen/arch/arm/include/asm/arm64/efibind.h   |  2 +-
 xen/arch/arm/include/asm/arm64/mpu.h       |  4 ++--
 xen/arch/arm/include/asm/arm64/page.h      |  4 ++--
 xen/arch/arm/include/asm/arm64/processor.h |  4 ++--
 xen/arch/arm/include/asm/arm64/sysregs.h   |  6 +++---
 xen/arch/arm/include/asm/config.h          |  4 ++--
 xen/arch/arm/include/asm/cpufeature.h      |  4 ++--
 xen/arch/arm/include/asm/current.h         |  2 +-
 xen/arch/arm/include/asm/fixmap.h          |  4 ++--
 xen/arch/arm/include/asm/gic.h             |  4 ++--
 xen/arch/arm/include/asm/insn.h            |  4 ++--
 xen/arch/arm/include/asm/lpae.h            |  4 ++--
 xen/arch/arm/include/asm/macros.h          |  2 +-
 xen/arch/arm/include/asm/mpu.h             |  4 ++--
 xen/arch/arm/include/asm/page.h            |  4 ++--
 xen/arch/arm/include/asm/pl011-uart.h      |  4 ++--
 xen/arch/arm/include/asm/processor.h       |  8 ++++----
 xen/arch/arm/include/asm/regs.h            |  2 +-
 xen/arch/arm/include/asm/smccc.h           |  4 ++--
 xen/arch/arm/include/asm/smp.h             |  2 +-
 xen/arch/arm/include/asm/sysregs.h         |  4 ++--
 xen/arch/ppc/include/asm/current.h         |  4 ++--
 xen/arch/ppc/include/asm/opal-api.h        |  4 ++--
 xen/arch/ppc/include/asm/processor.h       |  4 ++--
 xen/arch/riscv/include/asm/asm.h           |  6 +++---
 xen/arch/riscv/include/asm/bug.h           |  4 ++--
 xen/arch/riscv/include/asm/config.h        |  4 ++--
 xen/arch/riscv/include/asm/cpufeature.h    |  4 ++--
 xen/arch/riscv/include/asm/csr.h           |  4 ++--
 xen/arch/riscv/include/asm/current.h       |  4 ++--
 xen/arch/riscv/include/asm/fixmap.h        |  4 ++--
 xen/arch/riscv/include/asm/page.h          |  4 ++--
 xen/arch/riscv/include/asm/processor.h     |  4 ++--
 xen/arch/riscv/include/asm/regs.h          |  4 ++--
 xen/arch/riscv/include/asm/system.h        |  4 ++--
 xen/arch/riscv/include/asm/traps.h         |  4 ++--
 xen/arch/x86/boot/video.h                  |  4 ++--
 xen/arch/x86/include/asm/alternative-asm.h |  4 ++--
 xen/arch/x86/include/asm/alternative.h     |  4 ++--
 xen/arch/x86/include/asm/asm_defns.h       | 12 ++++++------
 xen/arch/x86/include/asm/bug.h             |  6 +++---
 xen/arch/x86/include/asm/cache.h           |  2 +-
 xen/arch/x86/include/asm/config.h          |  6 +++---
 xen/arch/x86/include/asm/cpufeature.h      |  6 +++---
 xen/arch/x86/include/asm/cpufeatureset.h   |  6 +++---
 xen/arch/x86/include/asm/desc.h            |  8 ++++----
 xen/arch/x86/include/asm/edd.h             |  4 ++--
 xen/arch/x86/include/asm/fixmap.h          |  4 ++--
 xen/arch/x86/include/asm/ldt.h             |  4 ++--
 xen/arch/x86/include/asm/machine_kexec.h   |  2 +-
 xen/arch/x86/include/asm/nops.h            |  2 +-
 xen/arch/x86/include/asm/page.h            | 20 ++++++++++----------
 xen/arch/x86/include/asm/processor.h       |  6 +++---
 xen/arch/x86/include/asm/smp.h             |  6 +++---
 xen/arch/x86/include/asm/spec_ctrl.h       |  4 ++--
 xen/arch/x86/include/asm/spec_ctrl_asm.h   |  4 ++--
 xen/arch/x86/include/asm/trampoline.h      |  4 ++--
 xen/arch/x86/include/asm/x86_64/page.h     |  6 +++---
 xen/common/efi/boot.c                      |  6 +++---
 xen/include/efi/pe.h                       |  4 ++--
 xen/include/public/arch-arm.h              |  4 ++--
 xen/include/public/arch-ppc.h              |  4 ++--
 xen/include/public/arch-riscv.h            |  2 +-
 xen/include/public/arch-x86/xen-mca.h      |  4 ++--
 xen/include/public/arch-x86/xen-x86_32.h   |  4 ++--
 xen/include/public/arch-x86/xen-x86_64.h   |  4 ++--
 xen/include/public/arch-x86/xen.h          |  8 ++++----
 xen/include/public/errno.h                 |  6 +++---
 xen/include/public/tmem.h                  |  2 +-
 xen/include/public/xen.h                   | 10 +++++-----
 xen/include/xen/acpi.h                     |  4 ++--
 xen/include/xen/bitmap.h                   |  4 ++--
 xen/include/xen/bug.h                      |  4 ++--
 xen/include/xen/config.h                   |  2 +-
 xen/include/xen/const.h                    |  2 +-
 xen/include/xen/err.h                      |  4 ++--
 xen/include/xen/errno.h                    |  6 +++---
 xen/include/xen/init.h                     |  4 ++--
 xen/include/xen/kimage.h                   |  4 ++--
 xen/include/xen/lib.h                      |  4 ++--
 xen/include/xen/libfdt/fdt.h               |  2 +-
 xen/include/xen/linkage.h                  |  4 ++--
 xen/include/xen/macros.h                   |  4 ++--
 xen/include/xen/multiboot.h                |  4 ++--
 xen/include/xen/multiboot2.h               |  4 ++--
 xen/include/xen/percpu.h                   |  4 ++--
 xen/include/xen/pmap.h                     |  4 ++--
 xen/include/xen/softirq.h                  |  4 ++--
 96 files changed, 208 insertions(+), 210 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index fc9244420e7d..e6cf2874251c 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -412,8 +412,6 @@ ifneq ($(CONFIG_CC_IS_CLANG),y)
 CFLAGS += -Wa,--strip-local-absolute
 endif
 
-AFLAGS += -D__ASSEMBLY__
-
 $(call cc-option-add,AFLAGS,CC,-Wa$$(comma)--noexecstack)
 
 LDFLAGS-$(call ld-option,--warn-rwx-segments) += --no-warn-rwx-segments
diff --git a/xen/arch/arm/arm32/lib/assembler.h b/xen/arch/arm/arm32/lib/assembler.h
index 6de2638a36d5..75d97ab0cc5f 100644
--- a/xen/arch/arm/arm32/lib/assembler.h
+++ b/xen/arch/arm/arm32/lib/assembler.h
@@ -17,7 +17,7 @@
 #ifndef __ASM_ASSEMBLER_H__
 #define __ASM_ASSEMBLER_H__
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 #error "Only include this from assembly code"
 #endif
 
diff --git a/xen/arch/arm/arm64/lib/assembler.h b/xen/arch/arm/arm64/lib/assembler.h
index 3f9c0dcf5d32..0fac7d1c6e30 100644
--- a/xen/arch/arm/arm64/lib/assembler.h
+++ b/xen/arch/arm/arm64/lib/assembler.h
@@ -1,7 +1,7 @@
 #ifndef __ASM_ASSEMBLER_H__
 #define __ASM_ASSEMBLER_H__
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 #error "Only include this from assembly code"
 #endif
 
diff --git a/xen/arch/arm/include/asm/alternative.h b/xen/arch/arm/include/asm/alternative.h
index 1563f03a0f5a..c751e11fc56b 100644
--- a/xen/arch/arm/include/asm/alternative.h
+++ b/xen/arch/arm/include/asm/alternative.h
@@ -6,7 +6,7 @@
 
 #define ARM_CB_PATCH ARM_NCAPS
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <xen/types.h>
 #include <xen/stringify.h>
@@ -206,7 +206,7 @@ alternative_endif
 #define _ALTERNATIVE_CFG(insn1, insn2, cap, cfg, ...)	\
 	alternative_insn insn1, insn2, cap, IS_ENABLED(cfg)
 
-#endif  /*  __ASSEMBLY__  */
+#endif  /*  __ASSEMBLER__  */
 
 /*
  * Usage: asm_inline (ALTERNATIVE(oldinstr, newinstr, feature));
diff --git a/xen/arch/arm/include/asm/arm32/mpu.h b/xen/arch/arm/include/asm/arm32/mpu.h
index 137022d92264..2cf0f8cbacae 100644
--- a/xen/arch/arm/include/asm/arm32/mpu.h
+++ b/xen/arch/arm/include/asm/arm32/mpu.h
@@ -3,7 +3,7 @@
 #ifndef ARM_ARM32_MPU_H
 #define ARM_ARM32_MPU_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 /*
  * Unlike arm64, there are no reserved 0 bits beyond base and limit bitfield in
@@ -43,7 +43,7 @@ typedef struct {
     uint8_t pad[7];     /* Pad structure to 16 Bytes */
 } pr_t;
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* ARM_ARM32_MPU_H */
 
diff --git a/xen/arch/arm/include/asm/arm32/page.h b/xen/arch/arm/include/asm/arm32/page.h
index 6d1ff0636ce3..d3e86cb61e7c 100644
--- a/xen/arch/arm/include/asm/arm32/page.h
+++ b/xen/arch/arm/include/asm/arm32/page.h
@@ -1,7 +1,7 @@
 #ifndef __ARM_ARM32_PAGE_H__
 #define __ARM_ARM32_PAGE_H__
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 /* Inline ASM to invalidate dcache on register R (may be an inline asm operand) */
 #define __invalidate_dcache_one(R) STORE_CP32(R, DCIMVAC)
@@ -87,7 +87,7 @@ static inline uint64_t gva_to_ipa_par(vaddr_t va, unsigned int flags)
 
 #define clear_page(page) memset((void *)(page), 0, PAGE_SIZE)
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* __ARM_ARM32_PAGE_H__ */
 
diff --git a/xen/arch/arm/include/asm/arm32/processor.h b/xen/arch/arm/include/asm/arm32/processor.h
index 4e679f3273ab..254bc4867c64 100644
--- a/xen/arch/arm/include/asm/arm32/processor.h
+++ b/xen/arch/arm/include/asm/arm32/processor.h
@@ -3,7 +3,7 @@
 
 #define ACTLR_CAXX_SMP      (1<<6)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 /* On stack VCPU state */
 struct cpu_user_regs
 {
diff --git a/xen/arch/arm/include/asm/arm32/sysregs.h b/xen/arch/arm/include/asm/arm32/sysregs.h
index ef1a870fd61e..33ac0c4fdb9c 100644
--- a/xen/arch/arm/include/asm/arm32/sysregs.h
+++ b/xen/arch/arm/include/asm/arm32/sysregs.h
@@ -25,11 +25,11 @@
 #define REGION_DATA_PRBAR       0x19    /* SH=11 AP=00 XN=1 */
 #define REGION_DEVICE_PRBAR     0x11    /* SH=10 AP=00 XN=1 */
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 
 #define WRITE_SYSREG_ASM(v, name) mcr CP32(v, name)
 
-#else /* __ASSEMBLY__ */
+#else /* __ASSEMBLER__ */
 
 /* C wrappers */
 #define READ_CP32(name...) ({                                   \
@@ -93,7 +93,7 @@
 /* MVFR2 is not defined on ARMv7 */
 #define MVFR2_MAYBE_UNDEFINED
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 #endif /* __ASM_ARM_ARM32_SYSREGS_H */
 /*
diff --git a/xen/arch/arm/include/asm/arm64/efibind.h b/xen/arch/arm/include/asm/arm64/efibind.h
index a1323d452e2e..7ab00e4f55a4 100644
--- a/xen/arch/arm/include/asm/arm64/efibind.h
+++ b/xen/arch/arm/include/asm/arm64/efibind.h
@@ -31,7 +31,7 @@ Revision History
 
 #define EFI_STUB_ERROR      MAX_ADDRESS
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 //
 // Basic int types of various widths
 //
diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
index 17f62ccaf6ca..4f694190a8a3 100644
--- a/xen/arch/arm/include/asm/arm64/mpu.h
+++ b/xen/arch/arm/include/asm/arm64/mpu.h
@@ -3,7 +3,7 @@
 #ifndef ARM_ARM64_MPU_H
 #define ARM_ARM64_MPU_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #define MPU_REGION_RES0        (0xFFFFULL << 48)
 
@@ -42,7 +42,7 @@ typedef struct {
     uint8_t pad[15];    /* Pad structure to 32 Bytes */
 } pr_t;
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* ARM_ARM64_MPU_H */
 
diff --git a/xen/arch/arm/include/asm/arm64/page.h b/xen/arch/arm/include/asm/arm64/page.h
index e944985ee09d..f3ba30730b4a 100644
--- a/xen/arch/arm/include/asm/arm64/page.h
+++ b/xen/arch/arm/include/asm/arm64/page.h
@@ -1,7 +1,7 @@
 #ifndef __ARM_ARM64_PAGE_H__
 #define __ARM_ARM64_PAGE_H__
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <asm/alternative.h>
 
@@ -77,7 +77,7 @@ static inline uint64_t gva_to_ipa_par(vaddr_t va, unsigned int flags)
 
 extern void clear_page(void *to);
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* __ARM_ARM64_PAGE_H__ */
 
diff --git a/xen/arch/arm/include/asm/arm64/processor.h b/xen/arch/arm/include/asm/arm64/processor.h
index c749f80ad91b..0513015bbb83 100644
--- a/xen/arch/arm/include/asm/arm64/processor.h
+++ b/xen/arch/arm/include/asm/arm64/processor.h
@@ -1,7 +1,7 @@
 #ifndef __ASM_ARM_ARM64_PROCESSOR_H
 #define __ASM_ARM_ARM64_PROCESSOR_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 /* Anonymous union includes both 32- and 64-bit names (e.g., r0/x0). */
 
@@ -86,7 +86,7 @@ struct cpu_user_regs
 
 #undef __DECL_REG
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* __ASM_ARM_ARM64_PROCESSOR_H */
 /*
diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
index 7440d495e4fb..7dfd20414d7d 100644
--- a/xen/arch/arm/include/asm/arm64/sysregs.h
+++ b/xen/arch/arm/include/asm/arm64/sysregs.h
@@ -467,11 +467,11 @@
 #define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */
 #define REGION_DEVICE_PRBAR     0x22    /* SH=10 AP=00 XN=10 */
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 
 #define WRITE_SYSREG_ASM(v, name) "msr " __stringify(name,) #v
 
-#else /* __ASSEMBLY__ */
+#else /* __ASSEMBLER__ */
 
 /* Access to system registers */
 
@@ -492,7 +492,7 @@
 #define WRITE_SYSREG_LR(v, index)  WRITE_SYSREG(v, ICH_LR_REG(index))
 #define READ_SYSREG_LR(index)      READ_SYSREG(ICH_LR_REG(index))
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 #endif /* _ASM_ARM_ARM64_SYSREGS_H */
 
diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
index f18825bc2d50..a077ec49b77e 100644
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -44,7 +44,7 @@
 #define CONFIG_AEABI
 
 /* Linkage for ARM */
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 #define GLOBAL(name)                            \
   .globl name;                                  \
   name:
@@ -69,7 +69,7 @@
 #define watchdog_disable() ((void)0)
 #define watchdog_enable()  ((void)0)
 
-#if defined(__ASSEMBLY__) && !defined(LINKER_SCRIPT)
+#if defined(__ASSEMBLER__) && !defined(LINKER_SCRIPT)
 #include <asm/asm_defns.h>
 #include <asm/macros.h>
 #endif
diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
index b6df18801166..13353c8e1ad1 100644
--- a/xen/arch/arm/include/asm/cpufeature.h
+++ b/xen/arch/arm/include/asm/cpufeature.h
@@ -79,7 +79,7 @@
 
 #define ARM_NCAPS           18
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <xen/types.h>
 #include <xen/lib.h>
@@ -461,7 +461,7 @@ extern struct cpuinfo_arm cpu_data[];
 
 extern struct cpuinfo_arm domain_cpuinfo;
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif
 /*
diff --git a/xen/arch/arm/include/asm/current.h b/xen/arch/arm/include/asm/current.h
index 0be7ad6ef956..8254363fda67 100644
--- a/xen/arch/arm/include/asm/current.h
+++ b/xen/arch/arm/include/asm/current.h
@@ -11,7 +11,7 @@
 #define CPUINFO_WORKAROUND_2_FLAG_SHIFT   0
 #define CPUINFO_WORKAROUND_2_FLAG (_AC(1, U) << CPUINFO_WORKAROUND_2_FLAG_SHIFT)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 struct vcpu;
 
diff --git a/xen/arch/arm/include/asm/fixmap.h b/xen/arch/arm/include/asm/fixmap.h
index 0cb5d54d1c74..84d55e4c2885 100644
--- a/xen/arch/arm/include/asm/fixmap.h
+++ b/xen/arch/arm/include/asm/fixmap.h
@@ -20,7 +20,7 @@
 #define FIXADDR_START FIXMAP_ADDR(0)
 #define FIXADDR_TOP FIXMAP_ADDR(FIX_LAST + 1)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 /*
  * Direct access to xen_fixmap[] should only happen when {set,
@@ -43,6 +43,6 @@ static inline unsigned int virt_to_fix(vaddr_t vaddr)
     return ((vaddr - FIXADDR_START) >> PAGE_SHIFT);
 }
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* __ASM_FIXMAP_H */
diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.h
index 3947c8634d22..8e713aa4773a 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -158,7 +158,7 @@
 #define GICH_LR_PENDING         1
 #define GICH_LR_ACTIVE          2
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 #include <xen/device_tree.h>
 #include <xen/irq.h>
 
@@ -479,7 +479,7 @@ unsigned long gic_get_hwdom_madt_size(const struct domain *d);
 int gic_map_hwdom_extra_mappings(struct domain *d);
 int gic_iomem_deny_access(struct domain *d);
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 #endif
 
 /*
diff --git a/xen/arch/arm/include/asm/insn.h b/xen/arch/arm/include/asm/insn.h
index 27271e95f9e2..db32babd23f6 100644
--- a/xen/arch/arm/include/asm/insn.h
+++ b/xen/arch/arm/include/asm/insn.h
@@ -1,7 +1,7 @@
 #ifndef __ARCH_ARM_INSN
 #define __ARCH_ARM_INSN
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <xen/types.h>
 
@@ -13,7 +13,7 @@
 # error "unknown ARM variant"
 #endif
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 /* On ARM32,64 instructions are always 4 bytes long. */
 #define ARCH_PATCH_INSN_SIZE 4
diff --git a/xen/arch/arm/include/asm/lpae.h b/xen/arch/arm/include/asm/lpae.h
index 4a1679cb3334..8e062c9e37f5 100644
--- a/xen/arch/arm/include/asm/lpae.h
+++ b/xen/arch/arm/include/asm/lpae.h
@@ -1,7 +1,7 @@
 #ifndef __ARM_LPAE_H__
 #define __ARM_LPAE_H__
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <xen/page-defs.h>
 #include <xen/mm-frame.h>
@@ -176,7 +176,7 @@ static inline bool lpae_is_superpage(lpae_t pte, unsigned int level)
  */
 lpae_t mfn_to_xen_entry(mfn_t mfn, unsigned int attr);
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 /*
  * AArch64 supports pages with different sizes (4K, 16K, and 64K).
diff --git a/xen/arch/arm/include/asm/macros.h b/xen/arch/arm/include/asm/macros.h
index dc791245df76..9e8793107e1b 100644
--- a/xen/arch/arm/include/asm/macros.h
+++ b/xen/arch/arm/include/asm/macros.h
@@ -1,7 +1,7 @@
 #ifndef __ASM_MACROS_H
 #define __ASM_MACROS_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 # error "This file should only be included in assembly file"
 #endif
 
diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
index 5053edaf63d6..72fa5b00b861 100644
--- a/xen/arch/arm/include/asm/mpu.h
+++ b/xen/arch/arm/include/asm/mpu.h
@@ -25,7 +25,7 @@
 
 #define PRENR_MASK  GENMASK(31, 0)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 /*
  * Set base address of MPU protection region.
@@ -87,7 +87,7 @@ static inline bool region_is_valid(const pr_t *pr)
     return pr->prlar.reg.en;
 }
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* __ARM_MPU_H__ */
 
diff --git a/xen/arch/arm/include/asm/page.h b/xen/arch/arm/include/asm/page.h
index 03bdf52ce023..90100a96dfda 100644
--- a/xen/arch/arm/include/asm/page.h
+++ b/xen/arch/arm/include/asm/page.h
@@ -121,7 +121,7 @@
 #define GV2M_WRITE (1u<<0)
 #define GV2M_EXEC  (1u<<1)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <xen/errno.h>
 #include <xen/types.h>
@@ -320,7 +320,7 @@ static inline int gva_to_ipa(vaddr_t va, paddr_t *paddr, unsigned int flags)
 /* Bits in the PAR returned by va_to_par */
 #define PAR_FAULT 0x1
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* __ARM_PAGE_H__ */
 
diff --git a/xen/arch/arm/include/asm/pl011-uart.h b/xen/arch/arm/include/asm/pl011-uart.h
index 27c9bfa444cb..a991b274cd4b 100644
--- a/xen/arch/arm/include/asm/pl011-uart.h
+++ b/xen/arch/arm/include/asm/pl011-uart.h
@@ -21,7 +21,7 @@
 #ifndef __ASM_ARM_PL011_H
 #define __ASM_ARM_PL011_H
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 
 /*
  * PL011 registers are 8/16-bit wide. However, there are implementations that
@@ -38,7 +38,7 @@
 #define PL011_LDRH ldrh
 #endif
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 /* PL011 register addresses */
 #define DR     (0x00)
diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index 92c8bc1a3125..ed5674636816 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -1,7 +1,7 @@
 #ifndef __ASM_ARM_PROCESSOR_H
 #define __ASM_ARM_PROCESSOR_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 #include <xen/types.h>
 #endif
 #include <public/arch-arm.h>
@@ -463,7 +463,7 @@
 #define MM64_VMID_16_BITS_SUPPORT   0x2
 #endif
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 extern register_t __cpu_logical_map[];
 #define cpu_logical_map(cpu) __cpu_logical_map[cpu]
@@ -570,7 +570,7 @@ extern register_t __cpu_logical_map[];
 # error "unknown ARM variant"
 #endif
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 void noreturn panic_PAR(uint64_t par);
 
 /* Debugging functions are declared with external linkage to aid development. */
@@ -631,7 +631,7 @@ register_t get_default_cptr_flags(void);
         WRITE_SYSREG((v)->arch.hcr_el2, HCR_EL2);   \
     } while (0)
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 #endif /* __ASM_ARM_PROCESSOR_H */
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/regs.h b/xen/arch/arm/include/asm/regs.h
index 0d9f239a7782..490db9056d12 100644
--- a/xen/arch/arm/include/asm/regs.h
+++ b/xen/arch/arm/include/asm/regs.h
@@ -3,7 +3,7 @@
 
 #define PSR_MODE_MASK 0x1f
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <xen/bug.h>
 #include <xen/types.h>
diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/smccc.h
index a289c48b7ffd..441b3ab65dee 100644
--- a/xen/arch/arm/include/asm/smccc.h
+++ b/xen/arch/arm/include/asm/smccc.h
@@ -54,7 +54,7 @@
 
 #define ARM_SMCCC_FUNC_MASK             _AC(0xFFFF,U)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 extern uint32_t smccc_ver;
 
@@ -307,7 +307,7 @@ void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs *args,
                        struct arm_smccc_1_2_regs *res);
 #endif /* CONFIG_ARM_64 */
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 /*
  * Construct function identifier from call type (fast or standard),
diff --git a/xen/arch/arm/include/asm/smp.h b/xen/arch/arm/include/asm/smp.h
index f5c829e2296e..16ae0844e7b9 100644
--- a/xen/arch/arm/include/asm/smp.h
+++ b/xen/arch/arm/include/asm/smp.h
@@ -1,7 +1,7 @@
 #ifndef __ASM_SMP_H
 #define __ASM_SMP_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 #include <xen/percpu.h>
 #include <xen/cpumask.h>
 #include <asm/current.h>
diff --git a/xen/arch/arm/include/asm/sysregs.h b/xen/arch/arm/include/asm/sysregs.h
index 5c2d362be3d8..f6af987ef5e9 100644
--- a/xen/arch/arm/include/asm/sysregs.h
+++ b/xen/arch/arm/include/asm/sysregs.h
@@ -9,7 +9,7 @@
 # error "unknown ARM variant"
 #endif
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <asm/alternative.h>
 
@@ -33,7 +33,7 @@ static inline register_t read_sysreg_par(void)
     return par_el1;
 }
 
-#endif /*  !__ASSEMBLY__  */
+#endif /*  !__ASSEMBLER__  */
 
 #endif /* __ASM_ARM_SYSREGS_H */
 /*
diff --git a/xen/arch/ppc/include/asm/current.h b/xen/arch/ppc/include/asm/current.h
index e329a548e61e..cd7af3e0c56a 100644
--- a/xen/arch/ppc/include/asm/current.h
+++ b/xen/arch/ppc/include/asm/current.h
@@ -6,7 +6,7 @@
 
 #include <asm/processor.h>
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 struct vcpu;
 
@@ -44,6 +44,6 @@ static inline struct cpu_info *get_cpu_info(void)
 
 #define get_per_cpu_offset()    smp_processor_id() /* TODO: Fix this */
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* __ASM_PPC_CURRENT_H__ */
diff --git a/xen/arch/ppc/include/asm/opal-api.h b/xen/arch/ppc/include/asm/opal-api.h
index 8790246f48ce..a83184a5c2e6 100644
--- a/xen/arch/ppc/include/asm/opal-api.h
+++ b/xen/arch/ppc/include/asm/opal-api.h
@@ -246,7 +246,7 @@
 #define OPAL_CONFIG_IDLE_UNDO		0
 #define OPAL_CONFIG_IDLE_APPLY		1
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <xen/types.h>
 
@@ -1185,6 +1185,6 @@ struct opal_mpipl_fadump {
 	struct	opal_mpipl_region region[];
 } __packed;
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* __OPAL_API_H */
diff --git a/xen/arch/ppc/include/asm/processor.h b/xen/arch/ppc/include/asm/processor.h
index 50161cc32d50..242346cab957 100644
--- a/xen/arch/ppc/include/asm/processor.h
+++ b/xen/arch/ppc/include/asm/processor.h
@@ -134,7 +134,7 @@
 /* Base address of interrupt vector table when LPCR[AIL]=3 */
 #define AIL_VECTOR_BASE _AC(0xc000000000004000, UL)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <xen/types.h>
 
@@ -221,6 +221,6 @@ static inline void noreturn die(void)
 
 #define dump_execution_state() run_in_exception_handler(show_execution_state)
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* _ASM_PPC_PROCESSOR_H */
diff --git a/xen/arch/riscv/include/asm/asm.h b/xen/arch/riscv/include/asm/asm.h
index 8b0403e2e471..e147b6f05388 100644
--- a/xen/arch/riscv/include/asm/asm.h
+++ b/xen/arch/riscv/include/asm/asm.h
@@ -6,7 +6,7 @@
 #ifndef ASM__RISCV__ASM_H
 #define ASM__RISCV__ASM_H
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 #include <xen/linkage.h>
 #define __ASM_STR(x)	x
 #else
@@ -25,13 +25,13 @@
 #define REG_S		__REG_SEL(sd, sw)
 
 #if __SIZEOF_POINTER__ == 8
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 #define RISCV_PTR		.dword
 #else
 #define RISCV_PTR		".dword"
 #endif
 #elif __SIZEOF_POINTER__ == 4
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 #define RISCV_PTR		.word
 #else
 #define RISCV_PTR		".word"
diff --git a/xen/arch/riscv/include/asm/bug.h b/xen/arch/riscv/include/asm/bug.h
index c395b809c60d..6ec8adc528a9 100644
--- a/xen/arch/riscv/include/asm/bug.h
+++ b/xen/arch/riscv/include/asm/bug.h
@@ -7,7 +7,7 @@
 #ifndef ASM__RISCV__BUG_H
 #define ASM__RISCV__BUG_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #define BUG_INSTR "unimp"
 
@@ -30,6 +30,6 @@
 #define GET_INSN_LENGTH(insn)                               \
     (((insn) & INSN_LENGTH_MASK) == INSN_LENGTH_32 ? 4 : 2) \
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 #endif /* ASM__RISCV__BUG_H */
diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index e150f28f536d..1e08d3bf78be 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -137,7 +137,7 @@
 #define INVALID_VCPU_ID MAX_VIRT_CPUS
 
 /* Linkage for RISCV */
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 #define CODE_FILL /* empty */
 #endif
 
@@ -147,7 +147,7 @@
 
 #define IDENT_AREA_SIZE 64
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 extern unsigned long phys_offset; /* = load_start - XEN_VIRT_START */
 #endif
 
diff --git a/xen/arch/riscv/include/asm/cpufeature.h b/xen/arch/riscv/include/asm/cpufeature.h
index 768b84b769be..d42d7b294ef1 100644
--- a/xen/arch/riscv/include/asm/cpufeature.h
+++ b/xen/arch/riscv/include/asm/cpufeature.h
@@ -2,7 +2,7 @@
 #ifndef ASM__RISCV__CPUFEATURE_H
 #define ASM__RISCV__CPUFEATURE_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <xen/stdbool.h>
 
@@ -46,7 +46,7 @@ void riscv_fill_hwcap(void);
 bool riscv_isa_extension_available(const unsigned long *isa_bitmap,
                                    enum riscv_isa_ext_id id);
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* ASM__RISCV__CPUFEATURE_H */
 
diff --git a/xen/arch/riscv/include/asm/csr.h b/xen/arch/riscv/include/asm/csr.h
index 775f1f170f37..01876f828981 100644
--- a/xen/arch/riscv/include/asm/csr.h
+++ b/xen/arch/riscv/include/asm/csr.h
@@ -10,7 +10,7 @@
 #include <xen/const.h>
 #include <asm/riscv_encoding.h>
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #define csr_read(csr)                                           \
 ({                                                              \
@@ -78,6 +78,6 @@
                            : "memory" );                        \
 })
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* ASM__RISCV__CSR_H */
diff --git a/xen/arch/riscv/include/asm/current.h b/xen/arch/riscv/include/asm/current.h
index 1485bceea414..0c3ea70c2ec8 100644
--- a/xen/arch/riscv/include/asm/current.h
+++ b/xen/arch/riscv/include/asm/current.h
@@ -9,7 +9,7 @@
 
 #include <asm/processor.h>
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 register struct pcpu_info *tp asm ( "tp" );
 
@@ -52,6 +52,6 @@ DECLARE_PER_CPU(struct vcpu *, curr_vcpu);
 
 #define get_per_cpu_offset() __per_cpu_offset[smp_processor_id()]
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* ASM__RISCV__CURRENT_H */
diff --git a/xen/arch/riscv/include/asm/fixmap.h b/xen/arch/riscv/include/asm/fixmap.h
index 5990c964aa2f..085d135c15d4 100644
--- a/xen/arch/riscv/include/asm/fixmap.h
+++ b/xen/arch/riscv/include/asm/fixmap.h
@@ -23,7 +23,7 @@
 #define FIXADDR_START FIXMAP_ADDR(0)
 #define FIXADDR_TOP FIXMAP_ADDR(FIX_LAST + 1)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 /*
  * Direct access to xen_fixmap[] should only happen when {set,
@@ -46,6 +46,6 @@ static inline unsigned int virt_to_fix(vaddr_t vaddr)
     return ((vaddr - FIXADDR_START) >> PAGE_SHIFT);
 }
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* ASM__RISCV__FIXMAP_H */
diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index ddcc4da0a3d5..7fde99f91617 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -3,7 +3,7 @@
 #ifndef ASM__RISCV__PAGE_H
 #define ASM__RISCV__PAGE_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <xen/bug.h>
 #include <xen/const.h>
@@ -213,6 +213,6 @@ static inline pte_t pte_from_mfn(mfn_t mfn, pte_attr_t flags)
 
 pte_t pt_walk(vaddr_t va, unsigned int *pte_level);
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* ASM__RISCV__PAGE_H */
diff --git a/xen/arch/riscv/include/asm/processor.h b/xen/arch/riscv/include/asm/processor.h
index 39696fb58dc6..2502045642d8 100644
--- a/xen/arch/riscv/include/asm/processor.h
+++ b/xen/arch/riscv/include/asm/processor.h
@@ -10,7 +10,7 @@
 #ifndef ASM__RISCV__PROCESSOR_H
 #define ASM__RISCV__PROCESSOR_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 /* On stack VCPU state */
 struct cpu_user_regs
@@ -93,7 +93,7 @@ static inline void sfence_vma(void)
 
 #define dump_execution_state() run_in_exception_handler(show_execution_state)
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* ASM__RISCV__PROCESSOR_H */
 
diff --git a/xen/arch/riscv/include/asm/regs.h b/xen/arch/riscv/include/asm/regs.h
index 218b9455bd5f..531958f3d748 100644
--- a/xen/arch/riscv/include/asm/regs.h
+++ b/xen/arch/riscv/include/asm/regs.h
@@ -2,7 +2,7 @@
 #ifndef ASM__RISCV__REGS_H
 #define ASM__RISCV__REGS_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <xen/bug.h>
 
@@ -15,7 +15,7 @@ static inline bool guest_mode(const struct cpu_user_regs *r)
     BUG_ON("unimplemented");
 }
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* ASM__RISCV__REGS_H */
 
diff --git a/xen/arch/riscv/include/asm/system.h b/xen/arch/riscv/include/asm/system.h
index 7b78d11e04dd..f33af64fd2ec 100644
--- a/xen/arch/riscv/include/asm/system.h
+++ b/xen/arch/riscv/include/asm/system.h
@@ -7,7 +7,7 @@
 
 #include <asm/csr.h>
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #define RISCV_FENCE(p, s) \
     __asm__ __volatile__ ( "fence " #p "," #s : : : "memory" )
@@ -76,7 +76,7 @@ static inline bool local_irq_is_enabled(void)
 
 #define arch_fetch_and_add(x, v) __sync_fetch_and_add(x, v)
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* ASM__RISCV__SYSTEM_H */
 
diff --git a/xen/arch/riscv/include/asm/traps.h b/xen/arch/riscv/include/asm/traps.h
index 72b8f6c475cc..21fa3c3259b3 100644
--- a/xen/arch/riscv/include/asm/traps.h
+++ b/xen/arch/riscv/include/asm/traps.h
@@ -5,12 +5,12 @@
 
 #include <asm/processor.h>
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 void do_trap(struct cpu_user_regs *cpu_regs);
 void handle_trap(void);
 void trap_init(void);
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* ASM__RISCV__TRAPS_H */
diff --git a/xen/arch/x86/boot/video.h b/xen/arch/x86/boot/video.h
index 1203515f9e5b..7c2848791799 100644
--- a/xen/arch/x86/boot/video.h
+++ b/xen/arch/x86/boot/video.h
@@ -28,7 +28,7 @@
 /* The "recalculate timings" flag */
 #define VIDEO_RECALC        0x8000
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 struct boot_video_info {
     uint8_t  orig_x;             /* 0x00 */
     uint8_t  orig_y;             /* 0x01 */
@@ -69,6 +69,6 @@ struct boot_video_info {
 };
 
 extern struct boot_video_info boot_vid_info;
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* __BOOT_VIDEO_H__ */
diff --git a/xen/arch/x86/include/asm/alternative-asm.h b/xen/arch/x86/include/asm/alternative-asm.h
index 3eb0f4e8a02a..d5c7f18160d9 100644
--- a/xen/arch/x86/include/asm/alternative-asm.h
+++ b/xen/arch/x86/include/asm/alternative-asm.h
@@ -3,7 +3,7 @@
 
 #include <asm/nops.h>
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 
 /*
  * Issue one struct alt_instr descriptor entry (need to put it into
@@ -120,7 +120,7 @@
 #undef decl_orig
 #undef as_true
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 #endif /* _ASM_X86_ALTERNATIVE_ASM_H_ */
 
 /*
diff --git a/xen/arch/x86/include/asm/alternative.h b/xen/arch/x86/include/asm/alternative.h
index 0482bbf7cbf1..18109e3dc594 100644
--- a/xen/arch/x86/include/asm/alternative.h
+++ b/xen/arch/x86/include/asm/alternative.h
@@ -8,7 +8,7 @@
 #define ALT_FLAG_NOT (1 << 15)
 #define ALT_NOT(x) (ALT_FLAG_NOT | (x))
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 #include <asm/alternative-asm.h>
 #else
 
@@ -175,6 +175,6 @@ extern void alternative_instructions(void);
 /* Use this macro(s) if you need more than one output parameter. */
 #define ASM_OUTPUT2(a...) a
 
-#endif /*  !__ASSEMBLY__  */
+#endif /*  !__ASSEMBLER__  */
 
 #endif /* __X86_ALTERNATIVE_H__ */
diff --git a/xen/arch/x86/include/asm/asm_defns.h b/xen/arch/x86/include/asm/asm_defns.h
index 72a0082d319d..9b75c9cae3d4 100644
--- a/xen/arch/x86/include/asm/asm_defns.h
+++ b/xen/arch/x86/include/asm/asm_defns.h
@@ -12,7 +12,7 @@
 #include <asm/cpufeature.h>
 #include <asm/alternative.h>
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 #include <xen/linkage.h>
 #include <asm/asm-defns.h>
 #ifndef CONFIG_INDIRECT_THUNK
@@ -24,7 +24,7 @@ asm ( "\t.equ CONFIG_INDIRECT_THUNK, "
       __stringify(IS_ENABLED(CONFIG_INDIRECT_THUNK)) );
 #endif
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 /*
  * This output constraint should be used for any inline asm which has a "call"
@@ -57,14 +57,14 @@ register unsigned long current_stack_pointer asm("rsp");
 #define ASSERT_INTERRUPTS_DISABLED \
     ASSERT_INTERRUPT_STATUS(z, "INTERRUPTS DISABLED")
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 # define _ASM_EX(p) p-.
 #else
 # define _ASM_EX(p) #p "-."
 #endif
 
 /* Exception table entry */
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 # define _ASM__EXTABLE(sfx, from, to)             \
     .section .ex_table##sfx, "a" ;                \
     .balign 4 ;                                   \
@@ -81,7 +81,7 @@ register unsigned long current_stack_pointer asm("rsp");
 #define _ASM_EXTABLE(from, to)     _ASM__EXTABLE(, from, to)
 #define _ASM_PRE_EXTABLE(from, to) _ASM__EXTABLE(.pre, from, to)
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 
 .macro BUILD_BUG_ON condstr, cond:vararg
         .if \cond
@@ -221,7 +221,7 @@ static always_inline void stac(void)
 }
 #endif
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 .macro SAVE_ALL compat=0
         addq  $-(UREGS_error_code-UREGS_r15), %rsp
         cld
diff --git a/xen/arch/x86/include/asm/bug.h b/xen/arch/x86/include/asm/bug.h
index e748b6c2f269..3a4f41e38032 100644
--- a/xen/arch/x86/include/asm/bug.h
+++ b/xen/arch/x86/include/asm/bug.h
@@ -19,12 +19,12 @@
  *  ...
  */
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #define BUG_INSTR       "ud2"
 #define BUG_ASM_CONST   "c"
 
-#else  /* !__ASSEMBLY__ */
+#else  /* !__ASSEMBLER__ */
 
 /*
  * Construct a bugframe, suitable for using in assembly code.  Should always
@@ -66,6 +66,6 @@
 #define ASSERT_FAILED(msg)                                      \
      BUG_FRAME BUGFRAME_assert, __LINE__, __FILE__, 1, msg
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 #endif /* __X86_BUG_H__ */
diff --git a/xen/arch/x86/include/asm/cache.h b/xen/arch/x86/include/asm/cache.h
index f15d10dc7f2d..e17a10b49ee5 100644
--- a/xen/arch/x86/include/asm/cache.h
+++ b/xen/arch/x86/include/asm/cache.h
@@ -9,7 +9,7 @@
 #define L1_CACHE_SHIFT	(CONFIG_X86_L1_CACHE_SHIFT)
 #define L1_CACHE_BYTES	(1 << L1_CACHE_SHIFT)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 void cache_flush(const void *addr, unsigned int size);
 void cache_writeback(const void *addr, unsigned int size);
diff --git a/xen/arch/x86/include/asm/config.h b/xen/arch/x86/include/asm/config.h
index 3553bf89dc97..156369695442 100644
--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -32,7 +32,7 @@
 #define OPT_CONSOLE_STR "vga"
 
 /* Linkage for x86 */
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 #define CODE_FILL 0x90
 #endif
 
@@ -195,7 +195,7 @@
 #endif
 #define DIRECTMAP_VIRT_END      (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #ifdef CONFIG_PV32
 
@@ -237,7 +237,7 @@
 #define __OS          "q"  /* Operation Suffix */
 #define __OP          "r"  /* Operand Prefix */
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 extern unsigned long xen_phys_start;
 #endif
 
diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index 0b764b9fb97b..28c4085cc786 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -10,7 +10,7 @@
 #include <xen/const.h>
 #include <xen/macros.h>
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 #include <asm/cpuid.h>
 #else
 #include <asm/cpufeatureset.h>
@@ -38,7 +38,7 @@
 #define VFM_FAMILY(vfm) MASK_EXTR(vfm, VFM_FAMILY_MASK)
 #define VFM_VENDOR(vfm) MASK_EXTR(vfm, VFM_VENDOR_MASK)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 struct cpuinfo_x86 {
     /* TODO: Phase out the x86 prefixed names. */
@@ -349,7 +349,7 @@ struct cpuid4_info {
 };
 
 int cpuid4_cache_lookup(int index, struct cpuid4_info *this_leaf);
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 #endif /* __ASM_I386_CPUFEATURE_H */
 
diff --git a/xen/arch/x86/include/asm/cpufeatureset.h b/xen/arch/x86/include/asm/cpufeatureset.h
index a9c51bc514a8..e12b54ab2223 100644
--- a/xen/arch/x86/include/asm/cpufeatureset.h
+++ b/xen/arch/x86/include/asm/cpufeatureset.h
@@ -1,7 +1,7 @@
 #ifndef __XEN_X86_CPUFEATURESET_H__
 #define __XEN_X86_CPUFEATURESET_H__
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <xen/stringify.h>
 
@@ -17,13 +17,13 @@ enum {
 #include <public/arch-x86/cpufeatureset.h>
 #include <asm/cpufeatures.h>
 
-#else /* !__ASSEMBLY__ */
+#else /* !__ASSEMBLER__ */
 
 #define XEN_CPUFEATURE(name, value) .equ X86_FEATURE_##name, value
 #include <public/arch-x86/cpufeatureset.h>
 #include <asm/cpufeatures.h>
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #undef XEN_CPUFEATURE
 
diff --git a/xen/arch/x86/include/asm/desc.h b/xen/arch/x86/include/asm/desc.h
index 85fae6b2f9ae..dcbdac3ff7d4 100644
--- a/xen/arch/x86/include/asm/desc.h
+++ b/xen/arch/x86/include/asm/desc.h
@@ -42,7 +42,7 @@
 #define LDT_SELECTOR     (LDT_ENTRY << 3)
 #define PER_CPU_SELECTOR (PER_CPU_GDT_ENTRY << 3)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #define GUEST_KERNEL_RPL(d) (is_pv_32bit_domain(d) ? 1 : 3)
 
@@ -76,7 +76,7 @@
                 FLAT_COMPAT_KERNEL_CS)) ||                              \
      ((sel) & 4))                               /* LDT seg? */
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 /* These are bitmasks for the high 32 bits of a descriptor table entry. */
 #define _SEGMENT_TYPE    (15<< 8)
@@ -92,7 +92,7 @@
 #define _SEGMENT_DB      ( 1<<22) /* 16- or 32-bit segment */
 #define _SEGMENT_G       ( 1<<23) /* Granularity */
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 /* System Descriptor types for GDT and IDT entries. */
 #define SYS_DESC_tss16_avail  1
@@ -162,6 +162,6 @@ static inline void ltr(unsigned int sel)
     __asm__ __volatile__ ( "ltr %w0" :: "rm" (sel) : "memory" );
 }
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 #endif /* __ARCH_DESC_H */
diff --git a/xen/arch/x86/include/asm/edd.h b/xen/arch/x86/include/asm/edd.h
index afaa23732a38..ebd46171c195 100644
--- a/xen/arch/x86/include/asm/edd.h
+++ b/xen/arch/x86/include/asm/edd.h
@@ -23,7 +23,7 @@
 #ifndef __XEN_EDD_H__
 #define __XEN_EDD_H__
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 struct __packed edd_info {
     /* Int13, Fn48: Check Extensions Present. */
@@ -149,7 +149,7 @@ extern u8 boot_mbr_signature_nr;
 extern struct edd_info boot_edd_info[];
 extern u8 boot_edd_info_nr;
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 /* Maximum number of EDD information structures at boot_edd_info. */
 #define EDD_INFO_MAX            6
diff --git a/xen/arch/x86/include/asm/fixmap.h b/xen/arch/x86/include/asm/fixmap.h
index 516ec3fa6c95..5b9e1a240153 100644
--- a/xen/arch/x86/include/asm/fixmap.h
+++ b/xen/arch/x86/include/asm/fixmap.h
@@ -17,7 +17,7 @@
 #define FIXADDR_TOP (VMAP_VIRT_END - PAGE_SIZE)
 #define FIXADDR_X_TOP (XEN_VIRT_END - PAGE_SIZE)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <xen/acpi.h>
 #include <xen/pfn.h>
@@ -118,6 +118,6 @@ extern void __set_fixmap_x(
 #define __fix_x_to_virt(x) (FIXADDR_X_TOP - ((x) << PAGE_SHIFT))
 #define fix_x_to_virt(x)   ((void *)__fix_x_to_virt(x))
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif
diff --git a/xen/arch/x86/include/asm/ldt.h b/xen/arch/x86/include/asm/ldt.h
index 58e3e042fcf9..f08e0230906a 100644
--- a/xen/arch/x86/include/asm/ldt.h
+++ b/xen/arch/x86/include/asm/ldt.h
@@ -2,7 +2,7 @@
 #ifndef __ARCH_LDT_H
 #define __ARCH_LDT_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 static inline void load_LDT(struct vcpu *v)
 {
@@ -20,7 +20,7 @@ static inline void load_LDT(struct vcpu *v)
     }
 }
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 #endif
 
diff --git a/xen/arch/x86/include/asm/machine_kexec.h b/xen/arch/x86/include/asm/machine_kexec.h
index d4880818c1d9..3e189acf2464 100644
--- a/xen/arch/x86/include/asm/machine_kexec.h
+++ b/xen/arch/x86/include/asm/machine_kexec.h
@@ -3,7 +3,7 @@
 
 #define KEXEC_RELOC_FLAG_COMPAT 0x1 /* 32-bit image */
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 extern void kexec_reloc(unsigned long reloc_code, unsigned long reloc_pt,
                         unsigned long ind_maddr, unsigned long entry_maddr,
diff --git a/xen/arch/x86/include/asm/nops.h b/xen/arch/x86/include/asm/nops.h
index 2724a9862e6b..32a05c88133f 100644
--- a/xen/arch/x86/include/asm/nops.h
+++ b/xen/arch/x86/include/asm/nops.h
@@ -47,7 +47,7 @@
 #define P6_NOP8 0x0f,0x1f,0x84,0x00,0,0,0,0
 #define P6_NOP9 0x66,0x0f,0x1f,0x84,0x00,0,0,0,0
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 #define _ASM_MK_NOP(x) .byte x
 #else
 #define _ASM_MK_NOP(x) ".byte " __stringify(x) "\n"
diff --git a/xen/arch/x86/include/asm/page.h b/xen/arch/x86/include/asm/page.h
index 65a01f240213..23e06d39ad84 100644
--- a/xen/arch/x86/include/asm/page.h
+++ b/xen/arch/x86/include/asm/page.h
@@ -8,7 +8,7 @@
 #define PAGE_ORDER_2M       9
 #define PAGE_ORDER_1G       18
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 # include <xen/types.h>
 # include <xen/lib.h>
 #endif
@@ -107,7 +107,7 @@
 #define l4e_from_mfn(m, f) l4e_from_pfn(mfn_x(m), f)
 
 /* Construct a pte from a physical address and access flags. */
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 static inline l1_pgentry_t l1e_from_paddr(paddr_t pa, unsigned int flags)
 {
     ASSERT((pa & ~(PADDR_MASK & PAGE_MASK)) == 0);
@@ -128,7 +128,7 @@ static inline l4_pgentry_t l4e_from_paddr(paddr_t pa, unsigned int flags)
     ASSERT((pa & ~(PADDR_MASK & PAGE_MASK)) == 0);
     return (l4_pgentry_t) { pa | put_pte_flags(flags) };
 }
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 /* Construct a pte from its direct integer representation. */
 #define l1e_from_intpte(intpte)    ((l1_pgentry_t) { (intpte_t)(intpte) })
@@ -204,7 +204,7 @@ static inline l4_pgentry_t l4e_from_paddr(paddr_t pa, unsigned int flags)
 #define pgentry_ptr_to_slot(_p)    \
     (((unsigned long)(_p) & ~PAGE_MASK) / sizeof(*(_p)))
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 /* Page-table type. */
 typedef struct { u64 pfn; } pagetable_t;
@@ -270,7 +270,7 @@ void scrub_page_cold(void *ptr);
 #define vmap_to_mfn(va)     xen_map_to_mfn((unsigned long)(va))
 #define vmap_to_page(va)    mfn_to_page(vmap_to_mfn(va))
 
-#endif /* !defined(__ASSEMBLY__) */
+#endif /* !defined(__ASSEMBLER__) */
 
 /* Where to find each level of the linear mapping */
 #define __linear_l1_table ((l1_pgentry_t *)(LINEAR_PT_VIRT_START))
@@ -282,7 +282,7 @@ void scrub_page_cold(void *ptr);
  ((l4_pgentry_t *)(__linear_l3_table + l3_linear_offset(LINEAR_PT_VIRT_START)))
 
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 extern root_pgentry_t idle_pg_table[ROOT_PAGETABLE_ENTRIES];
 extern l2_pgentry_t  *compat_idle_pg_table_l2;
 extern unsigned int   m2p_compat_vstart;
@@ -293,7 +293,7 @@ extern l2_pgentry_t l2_directmap[4*L2_PAGETABLE_ENTRIES];
 extern l1_pgentry_t l1_fixmap[L1_PAGETABLE_ENTRIES];
 void paging_init(void);
 void efi_update_l4_pgtable(unsigned int l4idx, l4_pgentry_t l4e);
-#endif /* !defined(__ASSEMBLY__) */
+#endif /* !defined(__ASSEMBLER__) */
 
 #define _PAGE_NONE     _AC(0x000,U)
 #define _PAGE_PRESENT  _AC(0x001,U)
@@ -313,7 +313,7 @@ void efi_update_l4_pgtable(unsigned int l4idx, l4_pgentry_t l4e);
 #define _PAGE_PSE_PAT  _AC(0x1000,U)
 #define _PAGE_AVAIL_HIGH (_AC(0x7ff, U) << 12)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 /* Dependency on NX being available can't be expressed. */
 #define _PAGE_NX       (cpu_has_nx ? _PAGE_NX_BIT : 0)
 #endif
@@ -354,7 +354,7 @@ void efi_update_l4_pgtable(unsigned int l4idx, l4_pgentry_t l4e);
 
 #define MAP_SMALL_PAGES _PAGE_AVAIL0 /* don't use superpages mappings */
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 /* Convert between PAT/PCD/PWT embedded in PTE flags and 3-bit cacheattr. */
 static inline unsigned int pte_flags_to_cacheattr(unsigned int flags)
@@ -391,7 +391,7 @@ static inline void invalidate_icache(void)
  */
 }
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 #endif /* __X86_PAGE_H__ */
 
diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index 2e087c625770..cf614bd8c678 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -4,7 +4,7 @@
 #ifndef __ASM_X86_PROCESSOR_H
 #define __ASM_X86_PROCESSOR_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 #include <xen/types.h>
 #include <xen/smp.h>
 #include <xen/percpu.h>
@@ -75,7 +75,7 @@
                      (_AC(X86_MT_UC,  ULL) << 0x30) | \
                      (_AC(X86_MT_UC,  ULL) << 0x38))
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 struct domain;
 struct vcpu;
@@ -435,7 +435,7 @@ enum ap_boot_method {
 };
 extern enum ap_boot_method ap_boot_method;
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 #endif /* __ASM_X86_PROCESSOR_H */
 
diff --git a/xen/arch/x86/include/asm/smp.h b/xen/arch/x86/include/asm/smp.h
index 60eb4ac254bb..3f16e6269615 100644
--- a/xen/arch/x86/include/asm/smp.h
+++ b/xen/arch/x86/include/asm/smp.h
@@ -4,7 +4,7 @@
 /*
  * We need the APIC definitions automatically as part of 'smp.h'
  */
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 #include <xen/bitops.h>
 #include <xen/kernel.h>
 #include <xen/cpumask.h>
@@ -14,7 +14,7 @@
 
 #define BAD_APICID   (-1U)
 #define INVALID_CUID (~0U)   /* AMD Compute Unit ID */
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 /*
  * Private routines/data
@@ -80,6 +80,6 @@ extern bool unaccounted_cpus;
 
 void *cpu_alloc_stack(unsigned int cpu);
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 #endif
diff --git a/xen/arch/x86/include/asm/spec_ctrl.h b/xen/arch/x86/include/asm/spec_ctrl.h
index 3d92928f9439..505e3ab863f0 100644
--- a/xen/arch/x86/include/asm/spec_ctrl.h
+++ b/xen/arch/x86/include/asm/spec_ctrl.h
@@ -45,7 +45,7 @@
  */
 #define SCF_DOM_MASK (SCF_verw | SCF_entry_ibpb | SCF_entry_bhb)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <asm/alternative.h>
 #include <asm/current.h>
@@ -201,7 +201,7 @@ static always_inline void spec_ctrl_exit_idle(struct cpu_info *info)
      */
 }
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 #endif /* !__X86_SPEC_CTRL_H__ */
 
 /*
diff --git a/xen/arch/x86/include/asm/spec_ctrl_asm.h b/xen/arch/x86/include/asm/spec_ctrl_asm.h
index 729a830411eb..abb64ad2b7f9 100644
--- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
+++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
@@ -8,7 +8,7 @@
 #ifndef __X86_SPEC_CTRL_ASM_H__
 #define __X86_SPEC_CTRL_ASM_H__
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 #include <asm/msr-index.h>
 #include <asm/spec_ctrl.h>
 
@@ -500,7 +500,7 @@
 .L\@_skip_ist_exit:
 .endm
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 #endif /* !__X86_SPEC_CTRL_ASM_H__ */
 
 /*
diff --git a/xen/arch/x86/include/asm/trampoline.h b/xen/arch/x86/include/asm/trampoline.h
index dc536efe1f3d..deed2679d9d5 100644
--- a/xen/arch/x86/include/asm/trampoline.h
+++ b/xen/arch/x86/include/asm/trampoline.h
@@ -96,7 +96,7 @@
 #define TRAMPOLINE_HEAP_END     (TRAMPOLINE_SIZE - PAGE_SIZE)
 #define MBI_SPACE_MIN           (2 * PAGE_SIZE)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <xen/compiler.h>
 #include <xen/types.h>
@@ -168,5 +168,5 @@ extern uint8_t kbd_shift_flags;
 extern uint16_t boot_edid_caps;
 extern uint8_t boot_edid_info[128];
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 #endif /* X86_ASM_TRAMPOLINE_H */
diff --git a/xen/arch/x86/include/asm/x86_64/page.h b/xen/arch/x86/include/asm/x86_64/page.h
index 201b79f99e57..c80b4b01ad26 100644
--- a/xen/arch/x86/include/asm/x86_64/page.h
+++ b/xen/arch/x86/include/asm/x86_64/page.h
@@ -9,7 +9,7 @@
 
 #define is_canonical_address(x) (((long)(x) >> 47) == ((long)(x) >> 63))
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 static inline unsigned long canonicalise_addr(unsigned long addr)
 {
@@ -68,7 +68,7 @@ typedef struct { intpte_t l3; } l3_pgentry_t;
 typedef struct { intpte_t l4; } l4_pgentry_t;
 typedef l4_pgentry_t root_pgentry_t;
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 /* Given a virtual address, get an entry offset into a linear page table. */
 #define l1_linear_offset(_a) (((_a) & VADDR_MASK) >> L1_PAGETABLE_SHIFT)
@@ -100,7 +100,7 @@ typedef l4_pgentry_t root_pgentry_t;
  */
 
 /* Extract flags into 24-bit integer, or turn 24-bit flags into a pte mask. */
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 static inline unsigned int get_pte_flags(intpte_t x)
 {
     return ((x >> 40) & ~0xfff) | (x & 0xfff);
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index d7f4d0cb2200..8adba7bd4da8 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -25,11 +25,11 @@
 /*
  * Keep this arch-specific modified include in the common file, as moving
  * it to the arch specific include file would obscure that special care is
- * taken to include it with __ASSEMBLY__ defined.
+ * taken to include it with __ASSEMBLER__ defined.
  */
-#define __ASSEMBLY__ /* avoid pulling in ACPI stuff (conflicts with EFI) */
+#define __ASSEMBLER__ /* avoid pulling in ACPI stuff (conflicts with EFI) */
 #include <asm/fixmap.h>
-#undef __ASSEMBLY__
+#undef __ASSEMBLER__
 #endif
 
 #define EFI_REVISION(major, minor) (((major) << 16) | (minor))
diff --git a/xen/include/efi/pe.h b/xen/include/efi/pe.h
index 64e047e88b4d..6b3458e888b7 100644
--- a/xen/include/efi/pe.h
+++ b/xen/include/efi/pe.h
@@ -136,7 +136,7 @@
 #define IMAGE_DEBUG_TYPE_CODEVIEW              2
 #define IMAGE_DEBUG_TYPE_EX_DLLCHARACTERISTICS 20
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 struct mz_hdr {
     uint16_t magic;              /* MZ_MAGIC */
@@ -286,6 +286,6 @@ struct section_header {
     uint32_t flags;
 };
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* EFI__PE_H */
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index b31324f8d409..cd563cf70684 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -184,7 +184,7 @@
 #define uint64_aligned_t uint64_t __attribute__((__aligned__(8)))
 #endif
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 #define ___DEFINE_XEN_GUEST_HANDLE(name, type)                  \
     typedef union { type *p; unsigned long q; }                 \
         __guest_handle_ ## name;                                \
@@ -542,7 +542,7 @@ typedef uint64_t xen_callback_t;
 
 #endif
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 /* Stub definition of PMU structure */
 typedef struct xen_pmu_arch { uint8_t dummy; } xen_pmu_arch_t;
 #endif
diff --git a/xen/include/public/arch-ppc.h b/xen/include/public/arch-ppc.h
index 264e20b89ea4..b5e1a940a575 100644
--- a/xen/include/public/arch-ppc.h
+++ b/xen/include/public/arch-ppc.h
@@ -16,7 +16,7 @@
 #define uint64_aligned_t uint64_t __attribute__((__aligned__(8)))
 #endif
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 #define ___DEFINE_XEN_GUEST_HANDLE(name, type)                  \
     typedef union { type *p; unsigned long q; }                 \
         __guest_handle_ ## name;                                \
@@ -102,6 +102,6 @@ struct xen_arch_domainconfig {
 
 typedef struct xen_pmu_arch { uint8_t dummy; } xen_pmu_arch_t;
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 #endif /* __XEN_PUBLIC_ARCH_PPC_H__ */
diff --git a/xen/include/public/arch-riscv.h b/xen/include/public/arch-riscv.h
index 168263b92074..360d8e6871ba 100644
--- a/xen/include/public/arch-riscv.h
+++ b/xen/include/public/arch-riscv.h
@@ -12,7 +12,7 @@
 #define uint64_aligned_t uint64_t __attribute__((__aligned__(8)))
 #endif
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 #define ___DEFINE_XEN_GUEST_HANDLE(name, type)                  \
     typedef union { type *p; unsigned long q; }                 \
         __guest_handle_ ## name;                                \
diff --git a/xen/include/public/arch-x86/xen-mca.h b/xen/include/public/arch-x86/xen-mca.h
index bb1b12f14fae..30d18b6ad767 100644
--- a/xen/include/public/arch-x86/xen-mca.h
+++ b/xen/include/public/arch-x86/xen-mca.h
@@ -74,7 +74,7 @@
 /* Applicable to all mc_vcpuid fields below. */
 #define XEN_MC_VCPUID_INVALID 0xffff
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #define VIRQ_MCA VIRQ_ARCH_0 /* G. (DOM0) Machine Check Architecture */
 
@@ -433,6 +433,6 @@ struct xen_mc {
 typedef struct xen_mc xen_mc_t;
 DEFINE_XEN_GUEST_HANDLE(xen_mc_t);
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* __XEN_PUBLIC_ARCH_X86_MCA_H__ */
diff --git a/xen/include/public/arch-x86/xen-x86_32.h b/xen/include/public/arch-x86/xen-x86_32.h
index 25cc44728838..6a5eddf0c3b4 100644
--- a/xen/include/public/arch-x86/xen-x86_32.h
+++ b/xen/include/public/arch-x86/xen-x86_32.h
@@ -90,7 +90,7 @@
 #define XEN_GUEST_HANDLE_64(name) __XEN_GUEST_HANDLE_64(name)
 #endif
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #if defined(XEN_GENERATING_COMPAT_HEADERS)
 /* nothing */
@@ -171,7 +171,7 @@ struct xen_callback {
 };
 typedef struct xen_callback xen_callback_t;
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 #endif /* __XEN_PUBLIC_ARCH_X86_XEN_X86_32_H__ */
 
diff --git a/xen/include/public/arch-x86/xen-x86_64.h b/xen/include/public/arch-x86/xen-x86_64.h
index ea6b56aa3bd8..75f121be0e14 100644
--- a/xen/include/public/arch-x86/xen-x86_64.h
+++ b/xen/include/public/arch-x86/xen-x86_64.h
@@ -105,7 +105,7 @@
 #define VGCF_in_syscall  (1<<_VGCF_in_syscall)
 #define VGCF_IN_SYSCALL  VGCF_in_syscall
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 struct iret_context {
     /* Top of stack (%rsp at point of hypercall). */
@@ -218,7 +218,7 @@ typedef struct arch_vcpu_info arch_vcpu_info_t;
 
 typedef unsigned long xen_callback_t;
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 #endif /* __XEN_PUBLIC_ARCH_X86_XEN_X86_64_H__ */
 
diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-x86/xen.h
index b99a691706f8..a7bf046ee006 100644
--- a/xen/include/public/arch-x86/xen.h
+++ b/xen/include/public/arch-x86/xen.h
@@ -53,7 +53,7 @@ __DeFiNe__ __DECL_REG_LO16(name) e ## name
 #include "xen-x86_64.h"
 #endif
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 typedef unsigned long xen_pfn_t;
 #define PRI_xen_pfn "lx"
 #define PRIu_xen_pfn "lu"
@@ -97,7 +97,7 @@ typedef unsigned long xen_pfn_t;
 /* Maximum number of virtual CPUs in legacy multi-processor guests. */
 #define XEN_LEGACY_MAX_VCPUS 32
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 typedef unsigned long xen_ulong_t;
 #define PRI_xen_ulong "lx"
@@ -335,7 +335,7 @@ typedef struct xen_msr_entry {
 } xen_msr_entry_t;
 DEFINE_XEN_GUEST_HANDLE(xen_msr_entry_t);
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 /*
  * ` enum neg_errnoval
@@ -359,7 +359,7 @@ DEFINE_XEN_GUEST_HANDLE(xen_msr_entry_t);
  * Prefix forces emulation of some non-trapping instructions.
  * Currently only CPUID.
  */
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 #define XEN_EMULATE_PREFIX .byte 0x0f,0x0b,0x78,0x65,0x6e ;
 #define XEN_CPUID          XEN_EMULATE_PREFIX cpuid
 #else
diff --git a/xen/include/public/errno.h b/xen/include/public/errno.h
index b9fc6762fbb6..6543d0f3530a 100644
--- a/xen/include/public/errno.h
+++ b/xen/include/public/errno.h
@@ -30,7 +30,7 @@
 
 #define XEN_ERRNO_DEFAULT_INCLUDE
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #define XEN_ERRNO(name, value) XEN_##name = (value),
 enum xen_errno {
@@ -39,7 +39,7 @@ enum xen_errno {
 
 #define XEN_ERRNO(name, value) .equ XEN_##name, value
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* __XEN_PUBLIC_ERRNO_H__ */
 #endif /* !XEN_ERRNO */
@@ -123,7 +123,7 @@ XEN_ERRNO(ECONNREFUSED,	111)	/* Connection refused */
 /* Clean up from a default include.  Close the enum (for C). */
 #ifdef XEN_ERRNO_DEFAULT_INCLUDE
 #undef XEN_ERRNO_DEFAULT_INCLUDE
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 };
 #endif
 
diff --git a/xen/include/public/tmem.h b/xen/include/public/tmem.h
index da68de76fe5f..8c91a7bb944f 100644
--- a/xen/include/public/tmem.h
+++ b/xen/include/public/tmem.h
@@ -58,7 +58,7 @@ struct xen_tmem_oid {
 typedef struct xen_tmem_oid xen_tmem_oid_t;
 DEFINE_XEN_GUEST_HANDLE(xen_tmem_oid_t);
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 #if __XEN_INTERFACE_VERSION__ < 0x00040400
 typedef xen_pfn_t tmem_cli_mfn_t;
 #endif
diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
index 82b9c05a76b7..7f15204c3885 100644
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -24,7 +24,7 @@
 #error "Unsupported architecture"
 #endif
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 /* Guest handles for primitive C types. */
 DEFINE_XEN_GUEST_HANDLE(char);
 __DEFINE_XEN_GUEST_HANDLE(uchar, unsigned char);
@@ -437,7 +437,7 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
 #define MMUEXT_UNMARK_SUPER     20
 /* ` } */
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 struct mmuext_op {
     unsigned int cmd; /* => enum mmuext_cmd */
     union {
@@ -614,7 +614,7 @@ DEFINE_XEN_GUEST_HANDLE(mmuext_op_t);
 /* Mask for valid domain id values */
 #define DOMID_MASK           xen_mk_uint(0x7FFF)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 typedef uint16_t domid_t;
 
@@ -1011,7 +1011,7 @@ typedef struct {
     XEN_DEFINE_UUID_(a, b, c, d, e1, e2, e3, e4, e5, e6)
 #endif /* __STDC_VERSION__ / __GNUC__ */
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 /* Default definitions for macros used by domctl/sysctl. */
 #if defined(__XEN__) || defined(__XEN_TOOLS__)
@@ -1026,7 +1026,7 @@ typedef struct {
 #define XEN_GUEST_HANDLE_64(name) XEN_GUEST_HANDLE(name)
 #endif
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 struct xenctl_bitmap {
     XEN_GUEST_HANDLE_64(uint8) bitmap;
     uint32_t nr_bits;
diff --git a/xen/include/xen/acpi.h b/xen/include/xen/acpi.h
index 57e710a16d90..90635ba0f322 100644
--- a/xen/include/xen/acpi.h
+++ b/xen/include/xen/acpi.h
@@ -35,7 +35,7 @@
  */
 #define NUM_FIXMAP_ACPI_PAGES  64
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <xen/errno.h>
 #include <xen/list.h>
@@ -202,6 +202,6 @@ static inline void acpi_dmar_zap(void) {}
 static inline void acpi_dmar_reinstate(void) {}
 #endif
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /*_LINUX_ACPI_H*/
diff --git a/xen/include/xen/bitmap.h b/xen/include/xen/bitmap.h
index b5e9cdd3db86..c69398a12796 100644
--- a/xen/include/xen/bitmap.h
+++ b/xen/include/xen/bitmap.h
@@ -1,7 +1,7 @@
 #ifndef __XEN_BITMAP_H
 #define __XEN_BITMAP_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <xen/lib.h>
 #include <xen/types.h>
@@ -290,6 +290,6 @@ int xenctl_bitmap_to_bitmap(unsigned long *bitmap,
 int bitmap_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_bitmap,
                             const unsigned long *bitmap, unsigned int nbits);
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* __XEN_BITMAP_H */
diff --git a/xen/include/xen/bug.h b/xen/include/xen/bug.h
index 0cabdba37992..044c059d6936 100644
--- a/xen/include/xen/bug.h
+++ b/xen/include/xen/bug.h
@@ -14,7 +14,7 @@
 
 #include <asm/bug.h>
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <xen/compiler.h>
 #include <xen/macros.h>
@@ -156,7 +156,7 @@ int do_bug_frame(const struct cpu_user_regs *regs, unsigned long pc);
 
 #endif /* CONFIG_GENERIC_BUG_FRAME */
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 #endif /* __XEN_BUG_H__ */
 /*
diff --git a/xen/include/xen/config.h b/xen/include/xen/config.h
index 1d7195066c08..33e6aafa407b 100644
--- a/xen/include/xen/config.h
+++ b/xen/include/xen/config.h
@@ -13,7 +13,7 @@
 
 #include <xen/kconfig.h>
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 #include <xen/compiler.h>
 
 #if defined(CONFIG_ENFORCE_UNIQUE_SYMBOLS) || defined(__clang__)
diff --git a/xen/include/xen/const.h b/xen/include/xen/const.h
index baf28ef14487..af228874025a 100644
--- a/xen/include/xen/const.h
+++ b/xen/include/xen/const.h
@@ -12,7 +12,7 @@
  * leave it unchanged in asm.
  */
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 #define _AC(X,Y)	X
 #define _AT(T,X)	X
 #else
diff --git a/xen/include/xen/err.h b/xen/include/xen/err.h
index a5971e290c16..4465468cdedf 100644
--- a/xen/include/xen/err.h
+++ b/xen/include/xen/err.h
@@ -1,7 +1,7 @@
 #ifndef XEN_ERR_H
 #define XEN_ERR_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <xen/compiler.h>
 #include <xen/errno.h>
@@ -43,6 +43,6 @@ static inline int __must_check PTR_RET(const void *ptr)
 	return IS_ERR(ptr) ? PTR_ERR(ptr) : 0;
 }
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* XEN_ERR_H */
diff --git a/xen/include/xen/errno.h b/xen/include/xen/errno.h
index 506674701fae..db9ef7f3e103 100644
--- a/xen/include/xen/errno.h
+++ b/xen/include/xen/errno.h
@@ -1,18 +1,18 @@
 #ifndef __XEN_ERRNO_H__
 #define __XEN_ERRNO_H__
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #define XEN_ERRNO(name, value) name = (value),
 enum {
 #include <public/errno.h>
 };
 
-#else /* !__ASSEMBLY__ */
+#else /* !__ASSEMBLER__ */
 
 #define XEN_ERRNO(name, value) .equ name, value
 #include <public/errno.h>
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /*  __XEN_ERRNO_H__ */
diff --git a/xen/include/xen/init.h b/xen/include/xen/init.h
index abf275f0eb72..0c921672c196 100644
--- a/xen/include/xen/init.h
+++ b/xen/include/xen/init.h
@@ -54,7 +54,7 @@
  * Also note, that this data cannot be "const".
  */
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 /*
  * Used for initialization calls..
@@ -72,7 +72,7 @@ typedef void (*exitcall_t)(void);
 void do_presmp_initcalls(void);
 void do_initcalls(void);
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #ifdef CONFIG_LATE_HWDOM
 #define __hwdom_init
diff --git a/xen/include/xen/kimage.h b/xen/include/xen/kimage.h
index 348f07f5c881..fccba1d88d5c 100644
--- a/xen/include/xen/kimage.h
+++ b/xen/include/xen/kimage.h
@@ -7,7 +7,7 @@
 #define IND_SOURCE       0x8
 #define IND_ZERO        0x10
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <xen/list.h>
 #include <xen/mm.h>
@@ -53,7 +53,7 @@ unsigned long kimage_entry_ind(kimage_entry_t *entry, bool compat);
 int kimage_build_ind(struct kexec_image *image, mfn_t ind_mfn,
                      bool compat);
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* __XEN_KIMAGE_H__ */
 
diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index c4ac4823920f..559e87636c02 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -3,7 +3,7 @@
 
 #include <xen/macros.h>
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <xen/inttypes.h>
 #include <xen/stdarg.h>
@@ -165,6 +165,6 @@ void cf_check dump_execstate(const struct cpu_user_regs *regs);
 
 void init_constructors(void);
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* __LIB_H__ */
diff --git a/xen/include/xen/libfdt/fdt.h b/xen/include/xen/libfdt/fdt.h
index f2e68807f277..57fe566306d0 100644
--- a/xen/include/xen/libfdt/fdt.h
+++ b/xen/include/xen/libfdt/fdt.h
@@ -7,7 +7,7 @@
  * Copyright 2012 Kim Phillips, Freescale Semiconductor.
  */
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 struct fdt_header {
 	fdt32_t magic;			 /* magic word FDT_MAGIC */
diff --git a/xen/include/xen/linkage.h b/xen/include/xen/linkage.h
index 3d401b88c1ad..4446eee5a8db 100644
--- a/xen/include/xen/linkage.h
+++ b/xen/include/xen/linkage.h
@@ -1,7 +1,7 @@
 #ifndef __LINKAGE_H__
 #define __LINKAGE_H__
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 
 #include <xen/macros.h>
 
@@ -62,6 +62,6 @@
 
 #define ASM_INT(label, val)    DATA(label, 4) .long (val); END(label)
 
-#endif /*  __ASSEMBLY__ */
+#endif /*  __ASSEMBLER__ */
 
 #endif /* __LINKAGE_H__ */
diff --git a/xen/include/xen/macros.h b/xen/include/xen/macros.h
index 6b4a8dc8b766..6e8ac8b45290 100644
--- a/xen/include/xen/macros.h
+++ b/xen/include/xen/macros.h
@@ -38,7 +38,7 @@
 #define __STR(...) #__VA_ARGS__
 #define STR(...) __STR(__VA_ARGS__)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 /* Force a compilation error if condition is true */
 #define BUILD_BUG_ON(cond) ({ _Static_assert(!(cond), "!(" #cond ")"); })
@@ -140,7 +140,7 @@
 #define MIN(x, y) ((x) < (y) ? (x) : (y))
 #define MAX(x, y) ((x) > (y) ? (x) : (y))
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* __MACROS_H__ */
 
diff --git a/xen/include/xen/multiboot.h b/xen/include/xen/multiboot.h
index 6d7f2b767161..4acb614669c3 100644
--- a/xen/include/xen/multiboot.h
+++ b/xen/include/xen/multiboot.h
@@ -43,7 +43,7 @@
 #define MBI_LOADERNAME (_AC(1,u) << 9)
 #define MBI_APM        (_AC(1,u) << 10)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <xen/stdint.h>
 
@@ -130,6 +130,6 @@ struct memory_map {
 typedef struct memory_map memory_map_t;
 
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* __MULTIBOOT_H__ */
diff --git a/xen/include/xen/multiboot2.h b/xen/include/xen/multiboot2.h
index 534b26444cc3..7c9180929e68 100644
--- a/xen/include/xen/multiboot2.h
+++ b/xen/include/xen/multiboot2.h
@@ -113,7 +113,7 @@
 #define MULTIBOOT2_FRAMEBUFFER_TYPE_RGB                 1
 #define MULTIBOOT2_FRAMEBUFFER_TYPE_EGA_TEXT            2
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <xen/stdint.h>
 
@@ -233,6 +233,6 @@ typedef struct {
     uint32_t mod_end;
     char cmdline[];
 } multiboot2_tag_module_t;
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* __MULTIBOOT2_H__ */
diff --git a/xen/include/xen/percpu.h b/xen/include/xen/percpu.h
index e7f585c7ed69..fcf2095bd543 100644
--- a/xen/include/xen/percpu.h
+++ b/xen/include/xen/percpu.h
@@ -29,7 +29,7 @@
 
 #include <asm/percpu.h>
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <xen/types.h>
 #include <asm/current.h>
@@ -57,7 +57,7 @@ extern unsigned long __per_cpu_offset[];
 
 void percpu_init_areas(void);
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 /* Linux compatibility. */
 #define get_cpu_var(var) this_cpu(var)
diff --git a/xen/include/xen/pmap.h b/xen/include/xen/pmap.h
index 93e61b10870e..b223fa919690 100644
--- a/xen/include/xen/pmap.h
+++ b/xen/include/xen/pmap.h
@@ -4,13 +4,13 @@
 /* Large enough for mapping 5 levels of page tables with some headroom */
 #define NUM_FIX_PMAP 8
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <xen/mm-frame.h>
 
 void *pmap_map(mfn_t mfn);
 void pmap_unmap(const void *p);
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* __XEN_PMAP_H__ */
diff --git a/xen/include/xen/softirq.h b/xen/include/xen/softirq.h
index 48f17e49efa1..49da6974feb1 100644
--- a/xen/include/xen/softirq.h
+++ b/xen/include/xen/softirq.h
@@ -1,7 +1,7 @@
 #ifndef XEN_SOFTIRQ_H
 #define XEN_SOFTIRQ_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 /* Low-latency softirqs come first in the following list. */
 enum {
@@ -58,6 +58,6 @@ void cpu_raise_softirq_batch_finish(void);
  */
 void process_pending_softirqs(void);
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* XEN_SOFTIRQ_H */

base-commit: 62bd4c2a8ee809c181d47098583270dc9db9300e
-- 
2.39.5


