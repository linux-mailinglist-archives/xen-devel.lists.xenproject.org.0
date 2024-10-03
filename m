Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB2598F5B7
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 20:00:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809688.1222197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swQ78-0008Oo-0Q; Thu, 03 Oct 2024 17:59:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809688.1222197; Thu, 03 Oct 2024 17:59:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swQ77-0008Hy-ME; Thu, 03 Oct 2024 17:59:45 +0000
Received: by outflank-mailman (input) for mailman id 809688;
 Thu, 03 Oct 2024 17:59:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d1Re=Q7=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swQ75-0006qR-7G
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 17:59:43 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42bb6e2a-81b1-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 19:59:40 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-539908f238fso1545471e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 10:59:40 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99104731a5sm111876166b.180.2024.10.03.10.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 10:59:37 -0700 (PDT)
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
X-Inumbo-ID: 42bb6e2a-81b1-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727978379; x=1728583179; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VaQPIr/iUhJbuSXHFgzk1pv0fVgLMa/FnSrLAtP3Sps=;
        b=YTwepV7IljEvO45/m1udXDdgM3Fav6TP1s9xC5p0e3KoK/bzQZJ84mtH8urXgdgEan
         exNuR8Oy8AhxwwN7TXyQLk66TMCqNUJDI6hk4ULWTrNkpHmTR0gXLI0arL+wPava4ovy
         N4EPw9UlWZ1nwlyePbprWvKwUatrZ6GoCw6No=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727978379; x=1728583179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VaQPIr/iUhJbuSXHFgzk1pv0fVgLMa/FnSrLAtP3Sps=;
        b=g+QbcXM6ET9qYE/SoRrwA97K59BACcEW3I1Ma+pT3OLz/QHmT8njVt9zQ7Adsbt3qX
         5LyFkY0AUCaRyFNkx8K+uLbSDxJfYjMRomTFSe+kX0g1y/kP+cl3LlJZLihqyPWMLpRl
         yb+Fenv/0JhUrSR9iIIEgu9jgM/V8JelCdUtLTpxKI56bW6fDHPD/oZLR0etUP7InfCZ
         AtWMytdiFHLVXaN0b1hjgjENuG+fV8E8HNKs6y81an7WwoxJaKFV0r9Py4TxmvNirEDA
         FWSSj9YWyJGt0u/oSOs0GcioSmOq9ia2TnQHQyELNmu3Kr/iNNSh4hZeA3uSQRRGHFSa
         LDRQ==
X-Gm-Message-State: AOJu0YwYsZzD02LuhO8M3g8NUFXZU6n7dTk9AzXgXs6LSO2MUJjvgL0t
	ZrPtxlTx/lpeR5BkebQTu+CW4heDBA4VsktTMga0Q+ycaOIPG/oAsrE43NYZNiZ8m3MavohmCDl
	U
X-Google-Smtp-Source: AGHT+IGDUi7QlBvXA8JUwVpI1ZuTyFN02eMjmqsUfkFrUMQBZdYpN1nggsjgC4egSb3MJvDvxGReGg==
X-Received: by 2002:a05:6512:3e0f:b0:535:3dae:a14b with SMTP id 2adb3069b0e04-539ab85cc35mr157560e87.2.1727978378167;
        Thu, 03 Oct 2024 10:59:38 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [PATCH v2 05/19] xen: Update header guards - ARM
Date: Thu,  3 Oct 2024 18:59:05 +0100
Message-Id: <20241003175919.472774-6-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241003175919.472774-1-frediano.ziglio@cloud.com>
References: <20241003175919.472774-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updated headers related to ARM.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/arm/arm32/lib/assembler.h                      | 6 +++---
 xen/arch/arm/arm64/lib/assembler.h                      | 6 +++---
 xen/arch/arm/decode.h                                   | 6 +++---
 xen/arch/arm/include/asm/acpi.h                         | 6 +++---
 xen/arch/arm/include/asm/alternative.h                  | 6 +++---
 xen/arch/arm/include/asm/arm32/atomic.h                 | 6 +++---
 xen/arch/arm/include/asm/arm32/bitops.h                 | 6 +++---
 xen/arch/arm/include/asm/arm32/bug.h                    | 6 +++---
 xen/arch/arm/include/asm/arm32/cmpxchg.h                | 4 ++--
 xen/arch/arm/include/asm/arm32/flushtlb.h               | 6 +++---
 xen/arch/arm/include/asm/arm32/insn.h                   | 6 +++---
 xen/arch/arm/include/asm/arm32/io.h                     | 6 +++---
 xen/arch/arm/include/asm/arm32/macros.h                 | 6 +++---
 xen/arch/arm/include/asm/arm32/mm.h                     | 6 +++---
 xen/arch/arm/include/asm/arm32/nospec.h                 | 6 +++---
 xen/arch/arm/include/asm/arm32/page.h                   | 6 +++---
 xen/arch/arm/include/asm/arm32/processor.h              | 6 +++---
 xen/arch/arm/include/asm/arm32/sysregs.h                | 6 +++---
 xen/arch/arm/include/asm/arm32/system.h                 | 4 ++--
 xen/arch/arm/include/asm/arm32/traps.h                  | 6 +++---
 xen/arch/arm/include/asm/arm32/vfp.h                    | 6 +++---
 xen/arch/arm/include/asm/arm64/atomic.h                 | 4 ++--
 xen/arch/arm/include/asm/arm64/bitops.h                 | 6 +++---
 xen/arch/arm/include/asm/arm64/brk.h                    | 6 +++---
 xen/arch/arm/include/asm/arm64/bug.h                    | 6 +++---
 xen/arch/arm/include/asm/arm64/cmpxchg.h                | 4 ++--
 xen/arch/arm/include/asm/arm64/cpufeature.h             | 4 ++--
 xen/arch/arm/include/asm/arm64/efibind.h                | 4 ++--
 xen/arch/arm/include/asm/arm64/flushtlb.h               | 6 +++---
 xen/arch/arm/include/asm/arm64/hsr.h                    | 6 +++---
 xen/arch/arm/include/asm/arm64/insn.h                   | 6 +++---
 xen/arch/arm/include/asm/arm64/io.h                     | 6 +++---
 xen/arch/arm/include/asm/arm64/macros.h                 | 6 +++---
 xen/arch/arm/include/asm/arm64/mm.h                     | 6 +++---
 xen/arch/arm/include/asm/arm64/nospec.h                 | 6 +++---
 xen/arch/arm/include/asm/arm64/page.h                   | 6 +++---
 xen/arch/arm/include/asm/arm64/processor.h              | 6 +++---
 xen/arch/arm/include/asm/arm64/sve.h                    | 6 +++---
 xen/arch/arm/include/asm/arm64/sysregs.h                | 4 ++--
 xen/arch/arm/include/asm/arm64/system.h                 | 4 ++--
 xen/arch/arm/include/asm/arm64/traps.h                  | 6 +++---
 xen/arch/arm/include/asm/arm64/vfp.h                    | 6 +++---
 xen/arch/arm/include/asm/asm_defns.h                    | 6 +++---
 xen/arch/arm/include/asm/atomic.h                       | 6 +++---
 xen/arch/arm/include/asm/bitops.h                       | 6 +++---
 xen/arch/arm/include/asm/bug.h                          | 6 +++---
 xen/arch/arm/include/asm/byteorder.h                    | 6 +++---
 xen/arch/arm/include/asm/cache.h                        | 4 ++--
 xen/arch/arm/include/asm/cadence-uart.h                 | 4 ++--
 xen/arch/arm/include/asm/config.h                       | 6 +++---
 xen/arch/arm/include/asm/cpregs.h                       | 4 ++--
 xen/arch/arm/include/asm/cpuerrata.h                    | 6 +++---
 xen/arch/arm/include/asm/cpufeature.h                   | 4 ++--
 xen/arch/arm/include/asm/current.h                      | 6 +++---
 xen/arch/arm/include/asm/div64.h                        | 4 ++--
 xen/arch/arm/include/asm/dom0less-build.h               | 6 +++---
 xen/arch/arm/include/asm/domain.h                       | 6 +++---
 xen/arch/arm/include/asm/domain_build.h                 | 4 ++--
 xen/arch/arm/include/asm/early_printk.h                 | 4 ++--
 xen/arch/arm/include/asm/elf.h                          | 6 +++---
 xen/arch/arm/include/asm/event.h                        | 4 ++--
 xen/arch/arm/include/asm/exynos4210-uart.h              | 6 +++---
 xen/arch/arm/include/asm/fixmap.h                       | 6 +++---
 xen/arch/arm/include/asm/flushtlb.h                     | 6 +++---
 xen/arch/arm/include/asm/gic.h                          | 4 ++--
 xen/arch/arm/include/asm/gic_v3_defs.h                  | 6 +++---
 xen/arch/arm/include/asm/gic_v3_its.h                   | 4 ++--
 xen/arch/arm/include/asm/grant_table.h                  | 6 +++---
 xen/arch/arm/include/asm/guest_access.h                 | 6 +++---
 xen/arch/arm/include/asm/guest_atomics.h                | 6 +++---
 xen/arch/arm/include/asm/guest_walk.h                   | 6 +++---
 xen/arch/arm/include/asm/hsr.h                          | 6 +++---
 xen/arch/arm/include/asm/hypercall.h                    | 6 +++---
 xen/arch/arm/include/asm/imx-lpuart.h                   | 6 +++---
 xen/arch/arm/include/asm/insn.h                         | 6 +++---
 xen/arch/arm/include/asm/io.h                           | 4 ++--
 xen/arch/arm/include/asm/iommu.h                        | 6 +++---
 xen/arch/arm/include/asm/iommu_fwspec.h                 | 6 +++---
 xen/arch/arm/include/asm/ioreq.h                        | 6 +++---
 xen/arch/arm/include/asm/irq.h                          | 6 +++---
 xen/arch/arm/include/asm/kernel.h                       | 6 +++---
 xen/arch/arm/include/asm/livepatch.h                    | 6 +++---
 xen/arch/arm/include/asm/lpae.h                         | 6 +++---
 xen/arch/arm/include/asm/macros.h                       | 4 ++--
 xen/arch/arm/include/asm/mem_access.h                   | 6 +++---
 xen/arch/arm/include/asm/mm.h                           | 6 +++---
 xen/arch/arm/include/asm/mmio.h                         | 6 +++---
 xen/arch/arm/include/asm/mmu/layout.h                   | 6 +++---
 xen/arch/arm/include/asm/mmu/mm.h                       | 6 +++---
 xen/arch/arm/include/asm/mmu/p2m.h                      | 6 +++---
 xen/arch/arm/include/asm/monitor.h                      | 6 +++---
 xen/arch/arm/include/asm/new_vgic.h                     | 6 +++---
 xen/arch/arm/include/asm/nospec.h                       | 6 +++---
 xen/arch/arm/include/asm/p2m.h                          | 6 +++---
 xen/arch/arm/include/asm/page-bits.h                    | 6 +++---
 xen/arch/arm/include/asm/page.h                         | 6 +++---
 xen/arch/arm/include/asm/pci.h                          | 6 +++---
 xen/arch/arm/include/asm/perfc.h                        | 4 ++--
 xen/arch/arm/include/asm/perfc_defn.h                   | 6 +++---
 xen/arch/arm/include/asm/pl011-uart.h                   | 6 +++---
 xen/arch/arm/include/asm/platform.h                     | 6 +++---
 xen/arch/arm/include/asm/platforms/exynos5.h            | 6 +++---
 xen/arch/arm/include/asm/platforms/midway.h             | 2 +-
 xen/arch/arm/include/asm/platforms/omap5.h              | 4 ++--
 xen/arch/arm/include/asm/platforms/vexpress.h           | 6 +++---
 xen/arch/arm/include/asm/platforms/xilinx-zynqmp-eemi.h | 6 +++---
 xen/arch/arm/include/asm/pmap.h                         | 6 +++---
 xen/arch/arm/include/asm/processor.h                    | 6 +++---
 xen/arch/arm/include/asm/procinfo.h                     | 4 ++--
 xen/arch/arm/include/asm/psci.h                         | 6 +++---
 xen/arch/arm/include/asm/regs.h                         | 6 +++---
 xen/arch/arm/include/asm/scif-uart.h                    | 6 +++---
 xen/arch/arm/include/asm/setup.h                        | 4 ++--
 xen/arch/arm/include/asm/short-desc.h                   | 6 +++---
 xen/arch/arm/include/asm/smccc.h                        | 6 +++---
 xen/arch/arm/include/asm/smp.h                          | 4 ++--
 xen/arch/arm/include/asm/spinlock.h                     | 6 +++---
 xen/arch/arm/include/asm/static-evtchn.h                | 6 +++---
 xen/arch/arm/include/asm/static-memory.h                | 6 +++---
 xen/arch/arm/include/asm/static-shmem.h                 | 6 +++---
 xen/arch/arm/include/asm/string.h                       | 6 +++---
 xen/arch/arm/include/asm/sysregs.h                      | 6 +++---
 xen/arch/arm/include/asm/system.h                       | 4 ++--
 xen/arch/arm/include/asm/tee/ffa.h                      | 6 +++---
 xen/arch/arm/include/asm/tee/optee_msg.h                | 6 +++---
 xen/arch/arm/include/asm/tee/optee_rpc_cmd.h            | 6 +++---
 xen/arch/arm/include/asm/tee/optee_smc.h                | 6 +++---
 xen/arch/arm/include/asm/tee/tee.h                      | 6 +++---
 xen/arch/arm/include/asm/time.h                         | 6 +++---
 xen/arch/arm/include/asm/traps.h                        | 6 +++---
 xen/arch/arm/include/asm/types.h                        | 6 +++---
 xen/arch/arm/include/asm/vfp.h                          | 6 +++---
 xen/arch/arm/include/asm/vgic-emul.h                    | 6 +++---
 xen/arch/arm/include/asm/vgic.h                         | 6 +++---
 xen/arch/arm/include/asm/vpl011.h                       | 6 +++---
 xen/arch/arm/include/asm/vpsci.h                        | 6 +++---
 xen/arch/arm/include/asm/vreg.h                         | 6 +++---
 xen/arch/arm/include/asm/vtimer.h                       | 4 ++--
 xen/arch/arm/tee/ffa_private.h                          | 6 +++---
 xen/arch/arm/vgic/vgic-mmio.h                           | 4 ++--
 xen/arch/arm/vgic/vgic.h                                | 4 ++--
 xen/arch/arm/vpci.h                                     | 6 +++---
 xen/arch/arm/vuart.h                                    | 6 +++---
 xen/drivers/passthrough/arm/smmu-v3.h                   | 6 +++---
 xen/include/public/arch-arm.h                           | 6 +++---
 xen/include/public/arch-arm/hvm/save.h                  | 4 ++--
 xen/include/public/arch-arm/smccc.h                     | 6 +++---
 147 files changed, 409 insertions(+), 409 deletions(-)

diff --git a/xen/arch/arm/arm32/lib/assembler.h b/xen/arch/arm/arm32/lib/assembler.h
index 6de2638a36..a79eef420f 100644
--- a/xen/arch/arm/arm32/lib/assembler.h
+++ b/xen/arch/arm/arm32/lib/assembler.h
@@ -14,8 +14,8 @@
  *  Do not include any C declarations in this file - it is included by
  *  assembler source.
  */
-#ifndef __ASM_ASSEMBLER_H__
-#define __ASM_ASSEMBLER_H__
+#ifndef ARM__ARM32__LIB__ASSEMBLER_H
+#define ARM__ARM32__LIB__ASSEMBLER_H
 
 #ifndef __ASSEMBLY__
 #error "Only include this from assembly code"
@@ -322,4 +322,4 @@
 	.size \name , . - \name
 	.endm
 
-#endif /* __ASM_ASSEMBLER_H__ */
+#endif /* ARM__ARM32__LIB__ASSEMBLER_H */
diff --git a/xen/arch/arm/arm64/lib/assembler.h b/xen/arch/arm/arm64/lib/assembler.h
index 3f9c0dcf5d..6560fae1f5 100644
--- a/xen/arch/arm/arm64/lib/assembler.h
+++ b/xen/arch/arm/arm64/lib/assembler.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_ASSEMBLER_H__
-#define __ASM_ASSEMBLER_H__
+#ifndef ARM__ARM64__LIB__ASSEMBLER_H
+#define ARM__ARM64__LIB__ASSEMBLER_H
 
 #ifndef __ASSEMBLY__
 #error "Only include this from assembly code"
@@ -9,4 +9,4 @@
 #define CPU_BE(x...)
 #define CPU_LE(x...) x
 
-#endif /* __ASM_ASSEMBLER_H__ */
+#endif /* ARM__ARM64__LIB__ASSEMBLER_H */
diff --git a/xen/arch/arm/decode.h b/xen/arch/arm/decode.h
index 13db8ac968..00e9bbe085 100644
--- a/xen/arch/arm/decode.h
+++ b/xen/arch/arm/decode.h
@@ -17,8 +17,8 @@
  * GNU General Public License for more details.
  */
 
-#ifndef __ARCH_ARM_DECODE_H_
-#define __ARCH_ARM_DECODE_H_
+#ifndef ARM__DECODE_H
+#define ARM__DECODE_H
 
 #include <asm/regs.h>
 #include <asm/processor.h>
@@ -73,7 +73,7 @@ union instr {
 int decode_instruction(const struct cpu_user_regs *regs,
                        mmio_info_t *info);
 
-#endif /* __ARCH_ARM_DECODE_H_ */
+#endif /* ARM__DECODE_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/acpi.h b/xen/arch/arm/include/asm/acpi.h
index 13756dd341..364cd671b4 100644
--- a/xen/arch/arm/include/asm/acpi.h
+++ b/xen/arch/arm/include/asm/acpi.h
@@ -19,8 +19,8 @@
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  */
 
-#ifndef _ASM_ARM_ACPI_H
-#define _ASM_ARM_ACPI_H
+#ifndef ASM__ARM__ACPI_H
+#define ASM__ARM__ACPI_H
 
 #include <asm/setup.h>
 
@@ -78,4 +78,4 @@ static inline void enable_acpi(void)
 #define enable_acpi()
 #endif
 
-#endif /*_ASM_ARM_ACPI_H*/
+#endif /*ASM__ARM__ACPI_H*/
diff --git a/xen/arch/arm/include/asm/alternative.h b/xen/arch/arm/include/asm/alternative.h
index 22477d9497..9a03298a41 100644
--- a/xen/arch/arm/include/asm/alternative.h
+++ b/xen/arch/arm/include/asm/alternative.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_ALTERNATIVE_H
-#define __ASM_ALTERNATIVE_H
+#ifndef ASM__ARM__ALTERNATIVE_H
+#define ASM__ARM__ALTERNATIVE_H
 
 #include <asm/cpufeature.h>
 #include <asm/insn.h>
@@ -218,4 +218,4 @@ alternative_endif
 #define ALTERNATIVE(oldinstr, newinstr, ...)   \
 	_ALTERNATIVE_CFG(oldinstr, newinstr, __VA_ARGS__, 1)
 
-#endif /* __ASM_ALTERNATIVE_H */
+#endif /* ASM__ARM__ALTERNATIVE_H */
diff --git a/xen/arch/arm/include/asm/arm32/atomic.h b/xen/arch/arm/include/asm/arm32/atomic.h
index 33f9e73b19..f63efd173c 100644
--- a/xen/arch/arm/include/asm/arm32/atomic.h
+++ b/xen/arch/arm/include/asm/arm32/atomic.h
@@ -8,8 +8,8 @@
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation.
  */
-#ifndef __ARCH_ARM_ARM32_ATOMIC__
-#define __ARCH_ARM_ARM32_ATOMIC__
+#ifndef ASM__ARM__ARM32__ATOMIC_H
+#define ASM__ARM__ARM32__ATOMIC_H
 
 /*
  * ARMv6 UP and SMP safe atomic ops.  We use load exclusive and
@@ -164,7 +164,7 @@ static inline int __atomic_add_unless(atomic_t *v, int a, int u)
 	return oldval;
 }
 
-#endif /* __ARCH_ARM_ARM32_ATOMIC__ */
+#endif /* ASM__ARM__ARM32__ATOMIC_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/arm32/bitops.h b/xen/arch/arm/include/asm/arm32/bitops.h
index 0d7bb12d5c..6e4018df0c 100644
--- a/xen/arch/arm/include/asm/arm32/bitops.h
+++ b/xen/arch/arm/include/asm/arm32/bitops.h
@@ -1,5 +1,5 @@
-#ifndef _ARM_ARM32_BITOPS_H
-#define _ARM_ARM32_BITOPS_H
+#ifndef ASM__ARM__ARM32__BITOPS_H
+#define ASM__ARM__ARM32__BITOPS_H
 
 /*
  * Little endian assembly bitops.  nr = 0 -> byte 0 bit 0.
@@ -37,4 +37,4 @@ extern int _find_next_bit_be(const unsigned long *p, int size, int offset);
 
 #endif
 
-#endif /* _ARM_ARM32_BITOPS_H */
+#endif /* ASM__ARM__ARM32__BITOPS_H */
diff --git a/xen/arch/arm/include/asm/arm32/bug.h b/xen/arch/arm/include/asm/arm32/bug.h
index 25cce151dc..638a8be149 100644
--- a/xen/arch/arm/include/asm/arm32/bug.h
+++ b/xen/arch/arm/include/asm/arm32/bug.h
@@ -1,5 +1,5 @@
-#ifndef __ARM_ARM32_BUG_H__
-#define __ARM_ARM32_BUG_H__
+#ifndef ASM__ARM__ARM32__BUG_H
+#define ASM__ARM__ARM32__BUG_H
 
 #include <xen/stringify.h>
 
@@ -12,4 +12,4 @@
 
 #define BUG_FN_REG r0
 
-#endif /* __ARM_ARM32_BUG_H__ */
+#endif /* ASM__ARM__ARM32__BUG_H */
diff --git a/xen/arch/arm/include/asm/arm32/cmpxchg.h b/xen/arch/arm/include/asm/arm32/cmpxchg.h
index 8455eb7cc3..13f6a9cf19 100644
--- a/xen/arch/arm/include/asm/arm32/cmpxchg.h
+++ b/xen/arch/arm/include/asm/arm32/cmpxchg.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_ARM32_CMPXCHG_H
-#define __ASM_ARM32_CMPXCHG_H
+#ifndef ASM__ARM__ARM32__CMPXCHG_H
+#define ASM__ARM__ARM32__CMPXCHG_H
 
 #include <xen/bug.h>
 #include <xen/prefetch.h>
diff --git a/xen/arch/arm/include/asm/arm32/flushtlb.h b/xen/arch/arm/include/asm/arm32/flushtlb.h
index 61c25a3189..dfeb0f3542 100644
--- a/xen/arch/arm/include/asm/arm32/flushtlb.h
+++ b/xen/arch/arm/include/asm/arm32/flushtlb.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_ARM_ARM32_FLUSHTLB_H__
-#define __ASM_ARM_ARM32_FLUSHTLB_H__
+#ifndef ASM__ARM__ARM32__FLUSHTLB_H
+#define ASM__ARM__ARM32__FLUSHTLB_H
 
 /*
  * Every invalidation operation use the following patterns:
@@ -57,7 +57,7 @@ static inline void __flush_xen_tlb_one(vaddr_t va)
     asm volatile(STORE_CP32(0, TLBIMVAHIS) : : "r" (va) : "memory");
 }
 
-#endif /* __ASM_ARM_ARM32_FLUSHTLB_H__ */
+#endif /* ASM__ARM__ARM32__FLUSHTLB_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/arm32/insn.h b/xen/arch/arm/include/asm/arm32/insn.h
index c800cbfff5..9693ad0606 100644
--- a/xen/arch/arm/include/asm/arm32/insn.h
+++ b/xen/arch/arm/include/asm/arm32/insn.h
@@ -13,8 +13,8 @@
   * You should have received a copy of the GNU General Public License
   * along with this program.  If not, see <http://www.gnu.org/licenses/>.
   */
-#ifndef __ARCH_ARM_ARM32_INSN
-#define __ARCH_ARM_ARM32_INSN
+#ifndef ASM__ARM__ARM32__INSN_H
+#define ASM__ARM__ARM32__INSN_H
 
 #include <xen/types.h>
 
@@ -60,7 +60,7 @@ static inline uint32_t insn_set_branch_offset(uint32_t insn, int32_t offset)
     return aarch32_set_branch_offset(insn, offset);
 }
 
-#endif /* !__ARCH_ARM_ARM32_INSN */
+#endif /* !ASM__ARM__ARM32__INSN_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/arm32/io.h b/xen/arch/arm/include/asm/arm32/io.h
index 782b564809..c92dcaf1ca 100644
--- a/xen/arch/arm/include/asm/arm32/io.h
+++ b/xen/arch/arm/include/asm/arm32/io.h
@@ -18,8 +18,8 @@
  *  18-Jun-2000 RMK    Removed virt_to_* and friends definitions
  *  05-Oct-2004 BJD     Moved memory string functions to use void __iomem
  */
-#ifndef _ARM_ARM32_IO_H
-#define _ARM_ARM32_IO_H
+#ifndef ASM__ARM__ARM32__IO_H
+#define ASM__ARM__ARM32__IO_H
 
 #include <asm/system.h>
 #include <asm/byteorder.h>
@@ -113,4 +113,4 @@ static inline void writeq_relaxed_non_atomic(u64 val, volatile void __iomem *add
 #define writew(v,c)             ({ __iowmb(); writew_relaxed(v,c); })
 #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
 
-#endif /* _ARM_ARM32_IO_H */
+#endif /* ASM__ARM__ARM32__IO_H */
diff --git a/xen/arch/arm/include/asm/arm32/macros.h b/xen/arch/arm/include/asm/arm32/macros.h
index db681a7c7e..dc907117a2 100644
--- a/xen/arch/arm/include/asm/arm32/macros.h
+++ b/xen/arch/arm/include/asm/arm32/macros.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_ARM_ARM32_MACROS_H
-#define __ASM_ARM_ARM32_MACROS_H
+#ifndef ASM__ARM__ARM32__MACROS_H
+#define ASM__ARM__ARM32__MACROS_H
 
 .macro ret
         mov     pc, lr
@@ -75,4 +75,4 @@
 
 #endif /* !CONFIG_EARLY_PRINTK */
 
-#endif /* __ASM_ARM_ARM32_MACROS_H */
+#endif /* ASM__ARM__ARM32__MACROS_H */
diff --git a/xen/arch/arm/include/asm/arm32/mm.h b/xen/arch/arm/include/asm/arm32/mm.h
index 856f2dbec4..4f22d9943a 100644
--- a/xen/arch/arm/include/asm/arm32/mm.h
+++ b/xen/arch/arm/include/asm/arm32/mm.h
@@ -1,5 +1,5 @@
-#ifndef __ARM_ARM32_MM_H__
-#define __ARM_ARM32_MM_H__
+#ifndef ASM__ARM__ARM32__MM_H
+#define ASM__ARM__ARM32__MM_H
 
 #include <xen/percpu.h>
 
@@ -22,7 +22,7 @@ static inline void arch_setup_page_tables(void)
 {
 }
 
-#endif /* __ARM_ARM32_MM_H__ */
+#endif /* ASM__ARM__ARM32__MM_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/arm32/nospec.h b/xen/arch/arm/include/asm/arm32/nospec.h
index be3c7712c8..ecb627b08f 100644
--- a/xen/arch/arm/include/asm/arm32/nospec.h
+++ b/xen/arch/arm/include/asm/arm32/nospec.h
@@ -1,6 +1,6 @@
 /* Portions taken from Linux arch arm */
-#ifndef __ASM_ARM32_NOSPEC_H
-#define __ASM_ARM32_NOSPEC_H
+#ifndef ASM__ARM__ARM32__NOSPEC_H
+#define ASM__ARM__ARM32__NOSPEC_H
 
 #define CSDB    ".inst  0xe320f014"
 
@@ -20,7 +20,7 @@ static inline unsigned long array_index_mask_nospec(unsigned long idx,
 }
 #define array_index_mask_nospec array_index_mask_nospec
 
-#endif /* __ASM_ARM32_NOSPEC_H */
+#endif /* ASM__ARM__ARM32__NOSPEC_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/arm32/page.h b/xen/arch/arm/include/asm/arm32/page.h
index 6d1ff0636c..09e631d94a 100644
--- a/xen/arch/arm/include/asm/arm32/page.h
+++ b/xen/arch/arm/include/asm/arm32/page.h
@@ -1,5 +1,5 @@
-#ifndef __ARM_ARM32_PAGE_H__
-#define __ARM_ARM32_PAGE_H__
+#ifndef ASM__ARM__ARM32__PAGE_H
+#define ASM__ARM__ARM32__PAGE_H
 
 #ifndef __ASSEMBLY__
 
@@ -89,7 +89,7 @@ static inline uint64_t gva_to_ipa_par(vaddr_t va, unsigned int flags)
 
 #endif /* __ASSEMBLY__ */
 
-#endif /* __ARM_ARM32_PAGE_H__ */
+#endif /* ASM__ARM__ARM32__PAGE_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/arm32/processor.h b/xen/arch/arm/include/asm/arm32/processor.h
index 4e679f3273..c9160c69e8 100644
--- a/xen/arch/arm/include/asm/arm32/processor.h
+++ b/xen/arch/arm/include/asm/arm32/processor.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_ARM_ARM32_PROCESSOR_H
-#define __ASM_ARM_ARM32_PROCESSOR_H
+#ifndef ASM__ARM__ARM32__PROCESSOR_H
+#define ASM__ARM__ARM32__PROCESSOR_H
 
 #define ACTLR_CAXX_SMP      (1<<6)
 
@@ -58,7 +58,7 @@ struct cpu_user_regs
 
 #endif
 
-#endif /* __ASM_ARM_ARM32_PROCESSOR_H */
+#endif /* ASM__ARM__ARM32__PROCESSOR_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/arm32/sysregs.h b/xen/arch/arm/include/asm/arm32/sysregs.h
index 22871999af..3846ca73f4 100644
--- a/xen/arch/arm/include/asm/arm32/sysregs.h
+++ b/xen/arch/arm/include/asm/arm32/sysregs.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_ARM_ARM32_SYSREGS_H
-#define __ASM_ARM_ARM32_SYSREGS_H
+#ifndef ASM__ARM__ARM32__SYSREGS_H
+#define ASM__ARM__ARM32__SYSREGS_H
 
 #include <xen/stringify.h>
 #include <asm/cpregs.h>
@@ -86,7 +86,7 @@
 
 #endif /* __ASSEMBLY__ */
 
-#endif /* __ASM_ARM_ARM32_SYSREGS_H */
+#endif /* ASM__ARM__ARM32__SYSREGS_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/arm32/system.h b/xen/arch/arm/include/asm/arm32/system.h
index c617b40438..96060032a9 100644
--- a/xen/arch/arm/include/asm/arm32/system.h
+++ b/xen/arch/arm/include/asm/arm32/system.h
@@ -1,6 +1,6 @@
 /* Portions taken from Linux arch arm */
-#ifndef __ASM_ARM32_SYSTEM_H
-#define __ASM_ARM32_SYSTEM_H
+#ifndef ASM__ARM__ARM32__SYSTEM_H
+#define ASM__ARM__ARM32__SYSTEM_H
 
 #include <asm/arm32/cmpxchg.h>
 
diff --git a/xen/arch/arm/include/asm/arm32/traps.h b/xen/arch/arm/include/asm/arm32/traps.h
index e3c4a8b473..c234e4c051 100644
--- a/xen/arch/arm/include/asm/arm32/traps.h
+++ b/xen/arch/arm/include/asm/arm32/traps.h
@@ -1,7 +1,7 @@
-#ifndef __ASM_ARM32_TRAPS__
-#define __ASM_ARM32_TRAPS__
+#ifndef ASM__ARM__ARM32__TRAPS_H
+#define ASM__ARM__ARM32__TRAPS_H
 
-#endif /* __ASM_ARM32_TRAPS__ */
+#endif /* ASM__ARM__ARM32__TRAPS_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/arm32/vfp.h b/xen/arch/arm/include/asm/arm32/vfp.h
index 2f2e4b24bb..fe17ff7b79 100644
--- a/xen/arch/arm/include/asm/arm32/vfp.h
+++ b/xen/arch/arm/include/asm/arm32/vfp.h
@@ -1,5 +1,5 @@
-#ifndef _ARM_ARM32_VFP_H
-#define _ARM_ARM32_VFP_H
+#ifndef ASM__ARM__ARM32__VFP_H
+#define ASM__ARM__ARM32__VFP_H
 
 #define FPEXC_EX                (1U << 31)
 #define FPEXC_EN                (1U << 30)
@@ -30,7 +30,7 @@ struct vfp_state
     uint32_t fpinst2;
 };
 
-#endif /* _ARM_ARM32_VFP_H */
+#endif /* ASM__ARM__ARM32__VFP_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/arm64/atomic.h b/xen/arch/arm/include/asm/arm64/atomic.h
index 4460165295..1d4c886a07 100644
--- a/xen/arch/arm/include/asm/arm64/atomic.h
+++ b/xen/arch/arm/include/asm/arm64/atomic.h
@@ -19,8 +19,8 @@
  * You should have received a copy of the GNU General Public License
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
-#ifndef __ARCH_ARM_ARM64_ATOMIC
-#define __ARCH_ARM_ARM64_ATOMIC
+#ifndef ASM__ARM__ARM64__ATOMIC_H
+#define ASM__ARM__ARM64__ATOMIC_H
 
 /*
  * AArch64 UP and SMP safe atomic ops.  We use load exclusive and
diff --git a/xen/arch/arm/include/asm/arm64/bitops.h b/xen/arch/arm/include/asm/arm64/bitops.h
index a6135838dc..93ec1bfc98 100644
--- a/xen/arch/arm/include/asm/arm64/bitops.h
+++ b/xen/arch/arm/include/asm/arm64/bitops.h
@@ -1,5 +1,5 @@
-#ifndef _ARM_ARM64_BITOPS_H
-#define _ARM_ARM64_BITOPS_H
+#ifndef ASM__ARM__ARM64__BITOPS_H
+#define ASM__ARM__ARM64__BITOPS_H
 
 /* Based on linux/include/asm-generic/bitops/find.h */
 
@@ -10,7 +10,7 @@
 
 #endif /* CONFIG_GENERIC_FIND_FIRST_BIT */
 
-#endif /* _ARM_ARM64_BITOPS_H */
+#endif /* ASM__ARM__ARM64__BITOPS_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/arm64/brk.h b/xen/arch/arm/include/asm/arm64/brk.h
index 3af153a053..e36841d4ca 100644
--- a/xen/arch/arm/include/asm/arm64/brk.h
+++ b/xen/arch/arm/include/asm/arm64/brk.h
@@ -6,8 +6,8 @@
  * published by the Free Software Foundation.
  */
 
-#ifndef __ASM_ARM_ARM64_BRK
-#define __ASM_ARM_ARM64_BRK
+#ifndef ASM__ARM__ARM64__BRK_H
+#define ASM__ARM__ARM64__BRK_H
 
 /*
  * #imm16 values used for BRK instruction generation
@@ -28,7 +28,7 @@
  */
 #define AARCH64_BREAK_FAULT (AARCH64_BREAK_MON | (BRK_FAULT_IMM << 5))
 
-#endif /* !__ASM_ARM_ARM64_BRK */
+#endif /* !ASM__ARM__ARM64__BRK_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/arm64/bug.h b/xen/arch/arm/include/asm/arm64/bug.h
index 5e11c0dfd5..aedd7c20a7 100644
--- a/xen/arch/arm/include/asm/arm64/bug.h
+++ b/xen/arch/arm/include/asm/arm64/bug.h
@@ -1,5 +1,5 @@
-#ifndef __ARM_ARM64_BUG_H__
-#define __ARM_ARM64_BUG_H__
+#ifndef ASM__ARM__ARM64__BUG_H
+#define ASM__ARM__ARM64__BUG_H
 
 #include <xen/stringify.h>
 #include <asm/arm64/brk.h>
@@ -8,4 +8,4 @@
 
 #define BUG_FN_REG x0
 
-#endif /* __ARM_ARM64_BUG_H__ */
+#endif /* ASM__ARM__ARM64__BUG_H */
diff --git a/xen/arch/arm/include/asm/arm64/cmpxchg.h b/xen/arch/arm/include/asm/arm64/cmpxchg.h
index f160e8e7bc..40db44da13 100644
--- a/xen/arch/arm/include/asm/arm64/cmpxchg.h
+++ b/xen/arch/arm/include/asm/arm64/cmpxchg.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_ARM64_CMPXCHG_H
-#define __ASM_ARM64_CMPXCHG_H
+#ifndef ASM__ARM__ARM64__CMPXCHG_H
+#define ASM__ARM__ARM64__CMPXCHG_H
 
 #include <xen/bug.h>
 
diff --git a/xen/arch/arm/include/asm/arm64/cpufeature.h b/xen/arch/arm/include/asm/arm64/cpufeature.h
index 1bb503e857..52cc65f307 100644
--- a/xen/arch/arm/include/asm/arm64/cpufeature.h
+++ b/xen/arch/arm/include/asm/arm64/cpufeature.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_ARM_ARM64_CPUFEATURES_H
-#define __ASM_ARM_ARM64_CPUFEATURES_H
+#ifndef ASM__ARM__ARM64__CPUFEATURE_H
+#define ASM__ARM__ARM64__CPUFEATURE_H
 
 /*
  * CPU feature register tracking
diff --git a/xen/arch/arm/include/asm/arm64/efibind.h b/xen/arch/arm/include/asm/arm64/efibind.h
index a1323d452e..cdc25f9a9c 100644
--- a/xen/arch/arm/include/asm/arm64/efibind.h
+++ b/xen/arch/arm/include/asm/arm64/efibind.h
@@ -16,8 +16,8 @@ Abstract:
 Revision History
 
 --*/
-#ifndef AARCH64_EFI_BIND
-#define AARCH64_EFI_BIND
+#ifndef ASM__ARM__ARM64__EFIBIND_H
+#define ASM__ARM__ARM64__EFIBIND_H
 #ifndef __GNUC__
 #pragma pack()
 #endif
diff --git a/xen/arch/arm/include/asm/arm64/flushtlb.h b/xen/arch/arm/include/asm/arm64/flushtlb.h
index 45642201d1..90b8187ef1 100644
--- a/xen/arch/arm/include/asm/arm64/flushtlb.h
+++ b/xen/arch/arm/include/asm/arm64/flushtlb.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_ARM_ARM64_FLUSHTLB_H__
-#define __ASM_ARM_ARM64_FLUSHTLB_H__
+#ifndef ASM__ARM__ARM64__FLUSHTLB_H
+#define ASM__ARM__ARM64__FLUSHTLB_H
 
 /*
  * Every invalidation operation use the following patterns:
@@ -90,7 +90,7 @@ TLB_HELPER_VA(__flush_xen_tlb_one, vae2is)
 #undef TLB_HELPER
 #undef TLB_HELPER_VA
 
-#endif /* __ASM_ARM_ARM64_FLUSHTLB_H__ */
+#endif /* ASM__ARM__ARM64__FLUSHTLB_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/arm64/hsr.h b/xen/arch/arm/include/asm/arm64/hsr.h
index 1495ccddea..7d89eca4b1 100644
--- a/xen/arch/arm/include/asm/arm64/hsr.h
+++ b/xen/arch/arm/include/asm/arm64/hsr.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_ARM_ARM64_HSR_H
-#define __ASM_ARM_ARM64_HSR_H
+#ifndef ASM__ARM__ARM64__HSR_H
+#define ASM__ARM__ARM64__HSR_H
 
 /* AArch 64 System Register Encodings */
 #define __HSR_SYSREG_c0  0
@@ -150,7 +150,7 @@
 #define HSR_SYSREG_ID_AA64AFR1_EL1   HSR_SYSREG(3,0,c0,c5,5)
 #define HSR_SYSREG_ID_AA64ZFR0_EL1   HSR_SYSREG(3,0,c0,c4,4)
 
-#endif /* __ASM_ARM_ARM64_HSR_H */
+#endif /* ASM__ARM__ARM64__HSR_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/arm64/insn.h b/xen/arch/arm/include/asm/arm64/insn.h
index ab290030ab..bd701e96c5 100644
--- a/xen/arch/arm/include/asm/arm64/insn.h
+++ b/xen/arch/arm/include/asm/arm64/insn.h
@@ -16,8 +16,8 @@
  * You should have received a copy of the GNU General Public License
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
-#ifndef __ARCH_ARM_ARM64_INSN
-#define __ARCH_ARM_ARM64_INSN
+#ifndef ASM__ARM__ARM64__INSN_H
+#define ASM__ARM__ARM64__INSN_H
 
 #include <xen/types.h>
 #include <xen/stdbool.h>
@@ -99,7 +99,7 @@ static inline uint32_t insn_set_branch_offset(uint32_t insn, int32_t offset)
     return aarch64_set_branch_offset(insn, offset);
 }
 
-#endif /* !__ARCH_ARM_ARM64_INSN */
+#endif /* !ASM__ARM__ARM64__INSN_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/arm64/io.h b/xen/arch/arm/include/asm/arm64/io.h
index 2e2ab24f78..607d2501f4 100644
--- a/xen/arch/arm/include/asm/arm64/io.h
+++ b/xen/arch/arm/include/asm/arm64/io.h
@@ -17,8 +17,8 @@
  * You should have received a copy of the GNU General Public License
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
-#ifndef _ARM_ARM64_IO_H
-#define _ARM_ARM64_IO_H
+#ifndef ASM__ARM__ARM64__IO_H
+#define ASM__ARM__ARM64__IO_H
 
 #include <asm/system.h>
 #include <asm/byteorder.h>
@@ -147,4 +147,4 @@ static inline void emulate_write(u64 addr)
 #define outw(v, c) ( emulate_write(c) )
 #define outl(v, c) ( emulate_write(c) )
 
-#endif /* _ARM_ARM64_IO_H */
+#endif /* ASM__ARM__ARM64__IO_H */
diff --git a/xen/arch/arm/include/asm/arm64/macros.h b/xen/arch/arm/include/asm/arm64/macros.h
index 46f50655ad..968198bceb 100644
--- a/xen/arch/arm/include/asm/arm64/macros.h
+++ b/xen/arch/arm/include/asm/arm64/macros.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_ARM_ARM64_MACROS_H
-#define __ASM_ARM_ARM64_MACROS_H
+#ifndef ASM__ARM__ARM64__MACROS_H
+#define ASM__ARM__ARM64__MACROS_H
 
     /*
      * @dst: Result of get_cpu_info()
@@ -96,5 +96,5 @@
  */
 lr      .req    x30             /* link register */
 
-#endif /* __ASM_ARM_ARM64_MACROS_H */
+#endif /* ASM__ARM__ARM64__MACROS_H */
 
diff --git a/xen/arch/arm/include/asm/arm64/mm.h b/xen/arch/arm/include/asm/arm64/mm.h
index b4f7545d2c..b79fd4d2cd 100644
--- a/xen/arch/arm/include/asm/arm64/mm.h
+++ b/xen/arch/arm/include/asm/arm64/mm.h
@@ -1,5 +1,5 @@
-#ifndef __ARM_ARM64_MM_H__
-#define __ARM_ARM64_MM_H__
+#ifndef ASM__ARM__ARM64__MM_H
+#define ASM__ARM__ARM64__MM_H
 
 extern DEFINE_PAGE_TABLE(xen_pgtable);
 
@@ -16,7 +16,7 @@ void arch_setup_page_tables(void);
 
 void update_boot_mapping(bool enable);
 
-#endif /* __ARM_ARM64_MM_H__ */
+#endif /* ASM__ARM__ARM64__MM_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/arm64/nospec.h b/xen/arch/arm/include/asm/arm64/nospec.h
index 2364ca692b..dc8d5aacb4 100644
--- a/xen/arch/arm/include/asm/arm64/nospec.h
+++ b/xen/arch/arm/include/asm/arm64/nospec.h
@@ -1,6 +1,6 @@
 /* Portions taken from Linux arch arm64 */
-#ifndef __ASM_ARM64_NOSPEC_H
-#define __ASM_ARM64_NOSPEC_H
+#ifndef ASM__ARM__ARM64__NOSPEC_H
+#define ASM__ARM__ARM64__NOSPEC_H
 
 #define csdb()  asm volatile ( "hint #20" : : : "memory" )
 
@@ -24,7 +24,7 @@ static inline unsigned long array_index_mask_nospec(unsigned long idx,
 }
 #define array_index_mask_nospec array_index_mask_nospec
 
-#endif /* __ASM_ARM64_NOSPEC_H */
+#endif /* ASM__ARM__ARM64__NOSPEC_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/arm64/page.h b/xen/arch/arm/include/asm/arm64/page.h
index e944985ee0..8fc0275290 100644
--- a/xen/arch/arm/include/asm/arm64/page.h
+++ b/xen/arch/arm/include/asm/arm64/page.h
@@ -1,5 +1,5 @@
-#ifndef __ARM_ARM64_PAGE_H__
-#define __ARM_ARM64_PAGE_H__
+#ifndef ASM__ARM__ARM64__PAGE_H
+#define ASM__ARM__ARM64__PAGE_H
 
 #ifndef __ASSEMBLY__
 
@@ -79,7 +79,7 @@ extern void clear_page(void *to);
 
 #endif /* __ASSEMBLY__ */
 
-#endif /* __ARM_ARM64_PAGE_H__ */
+#endif /* ASM__ARM__ARM64__PAGE_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/arm64/processor.h b/xen/arch/arm/include/asm/arm64/processor.h
index c749f80ad9..965e9f44f7 100644
--- a/xen/arch/arm/include/asm/arm64/processor.h
+++ b/xen/arch/arm/include/asm/arm64/processor.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_ARM_ARM64_PROCESSOR_H
-#define __ASM_ARM_ARM64_PROCESSOR_H
+#ifndef ASM__ARM__ARM64__PROCESSOR_H
+#define ASM__ARM__ARM64__PROCESSOR_H
 
 #ifndef __ASSEMBLY__
 
@@ -88,7 +88,7 @@ struct cpu_user_regs
 
 #endif /* __ASSEMBLY__ */
 
-#endif /* __ASM_ARM_ARM64_PROCESSOR_H */
+#endif /* ASM__ARM__ARM64__PROCESSOR_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/arm64/sve.h b/xen/arch/arm/include/asm/arm64/sve.h
index a71d6a295d..155dd27766 100644
--- a/xen/arch/arm/include/asm/arm64/sve.h
+++ b/xen/arch/arm/include/asm/arm64/sve.h
@@ -5,8 +5,8 @@
  * Copyright (C) 2022 ARM Ltd.
  */
 
-#ifndef _ARM_ARM64_SVE_H
-#define _ARM_ARM64_SVE_H
+#ifndef ASM__ARM__ARM64__SVE_H
+#define ASM__ARM__ARM64__SVE_H
 
 #include <xen/sched.h>
 
@@ -60,7 +60,7 @@ static inline unsigned int get_sys_vl_len(void)
 
 #endif /* CONFIG_ARM64_SVE */
 
-#endif /* _ARM_ARM64_SVE_H */
+#endif /* ASM__ARM__ARM64__SVE_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
index b593e4028b..ee2b2172db 100644
--- a/xen/arch/arm/include/asm/arm64/sysregs.h
+++ b/xen/arch/arm/include/asm/arm64/sysregs.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_ARM_ARM64_SYSREGS_H
-#define __ASM_ARM_ARM64_SYSREGS_H
+#ifndef ASM__ARM__ARM64__SYSREGS_H
+#define ASM__ARM__ARM64__SYSREGS_H
 
 #include <xen/stringify.h>
 
diff --git a/xen/arch/arm/include/asm/arm64/system.h b/xen/arch/arm/include/asm/arm64/system.h
index 2e2ee212a1..d96a17c30d 100644
--- a/xen/arch/arm/include/asm/arm64/system.h
+++ b/xen/arch/arm/include/asm/arm64/system.h
@@ -1,6 +1,6 @@
 /* Portions taken from Linux arch arm64 */
-#ifndef __ASM_ARM64_SYSTEM_H
-#define __ASM_ARM64_SYSTEM_H
+#ifndef ASM__ARM__ARM64__SYSTEM_H
+#define ASM__ARM__ARM64__SYSTEM_H
 
 #include <asm/arm64/cmpxchg.h>
 
diff --git a/xen/arch/arm/include/asm/arm64/traps.h b/xen/arch/arm/include/asm/arm64/traps.h
index a347cb13d6..2d11192d22 100644
--- a/xen/arch/arm/include/asm/arm64/traps.h
+++ b/xen/arch/arm/include/asm/arm64/traps.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_ARM64_TRAPS__
-#define __ASM_ARM64_TRAPS__
+#ifndef ASM__ARM__ARM64__TRAPS_H
+#define ASM__ARM__ARM64__TRAPS_H
 
 void inject_undef64_exception(struct cpu_user_regs *regs, int instr_len);
 
@@ -8,7 +8,7 @@ void do_sysreg(struct cpu_user_regs *regs,
 
 void do_bad_mode(struct cpu_user_regs *regs, int reason);
 
-#endif /* __ASM_ARM64_TRAPS__ */
+#endif /* ASM__ARM__ARM64__TRAPS_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/arm64/vfp.h b/xen/arch/arm/include/asm/arm64/vfp.h
index 4b399ccbfb..145b2803ec 100644
--- a/xen/arch/arm/include/asm/arm64/vfp.h
+++ b/xen/arch/arm/include/asm/arm64/vfp.h
@@ -1,5 +1,5 @@
-#ifndef _ARM_ARM64_VFP_H
-#define _ARM_ARM64_VFP_H
+#ifndef ASM__ARM__ARM64__VFP_H
+#define ASM__ARM__ARM64__VFP_H
 
 /* ARM64 VFP instruction requires fpregs address to be 128-byte aligned */
 #define __vfp_aligned __attribute__((aligned(16)))
@@ -28,7 +28,7 @@ struct vfp_state
     register_t fpsr;
 };
 
-#endif /* _ARM_ARM64_VFP_H */
+#endif /* ASM__ARM__ARM64__VFP_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/asm_defns.h b/xen/arch/arm/include/asm/asm_defns.h
index 47efdf5234..c3e136b240 100644
--- a/xen/arch/arm/include/asm/asm_defns.h
+++ b/xen/arch/arm/include/asm/asm_defns.h
@@ -1,5 +1,5 @@
-#ifndef __ARM_ASM_DEFNS_H__
-#define __ARM_ASM_DEFNS_H__
+#ifndef ASM__ARM__ASM_DEFNS_H
+#define ASM__ARM__ASM_DEFNS_H
 
 #ifndef COMPILE_OFFSETS
 /* NB. Auto-generated from arch/.../asm-offsets.c */
@@ -28,7 +28,7 @@
 label:  .asciz msg;                             \
 .popsection
 
-#endif /* __ARM_ASM_DEFNS_H__ */
+#endif /* ASM__ARM__ASM_DEFNS_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/atomic.h b/xen/arch/arm/include/asm/atomic.h
index 517216d2a8..1af5ee851f 100644
--- a/xen/arch/arm/include/asm/atomic.h
+++ b/xen/arch/arm/include/asm/atomic.h
@@ -1,5 +1,5 @@
-#ifndef __ARCH_ARM_ATOMIC__
-#define __ARCH_ARM_ATOMIC__
+#ifndef ASM__ARM__ATOMIC_H
+#define ASM__ARM__ATOMIC_H
 
 #include <xen/atomic.h>
 #include <xen/prefetch.h>
@@ -227,7 +227,7 @@ static inline int atomic_add_unless(atomic_t *v, int a, int u)
 
 #define atomic_xchg(v, new) (xchg(&((v)->counter), new))
 
-#endif /* __ARCH_ARM_ATOMIC__ */
+#endif /* ASM__ARM__ATOMIC_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/bitops.h b/xen/arch/arm/include/asm/bitops.h
index f163d9bb45..001e2960c4 100644
--- a/xen/arch/arm/include/asm/bitops.h
+++ b/xen/arch/arm/include/asm/bitops.h
@@ -6,8 +6,8 @@
  *  reworked by rmk.
  */
 
-#ifndef _ARM_BITOPS_H
-#define _ARM_BITOPS_H
+#ifndef ASM__ARM__BITOPS_H
+#define ASM__ARM__BITOPS_H
 
 #include <xen/macros.h>
 
@@ -78,7 +78,7 @@ bool clear_mask16_timeout(uint16_t mask, volatile void *p,
 #define arch_fls(x)  ((x) ? 32 - __builtin_clz(x) : 0)
 #define arch_flsl(x) ((x) ? BITS_PER_LONG - __builtin_clzl(x) : 0)
 
-#endif /* _ARM_BITOPS_H */
+#endif /* ASM__ARM__BITOPS_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/bug.h b/xen/arch/arm/include/asm/bug.h
index cacaf014ab..19d4645984 100644
--- a/xen/arch/arm/include/asm/bug.h
+++ b/xen/arch/arm/include/asm/bug.h
@@ -1,5 +1,5 @@
-#ifndef __ARM_BUG_H__
-#define __ARM_BUG_H__
+#ifndef ASM__ARM__BUG_H
+#define ASM__ARM__BUG_H
 
 #include <xen/types.h>
 
@@ -82,7 +82,7 @@ struct bug_frame {
     unreachable();                                              \
 } while (0)
 
-#endif /* __ARM_BUG_H__ */
+#endif /* ASM__ARM__BUG_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/byteorder.h b/xen/arch/arm/include/asm/byteorder.h
index 9c712c4788..0a564c6aa3 100644
--- a/xen/arch/arm/include/asm/byteorder.h
+++ b/xen/arch/arm/include/asm/byteorder.h
@@ -1,11 +1,11 @@
-#ifndef __ASM_ARM_BYTEORDER_H__
-#define __ASM_ARM_BYTEORDER_H__
+#ifndef ASM__ARM__BYTEORDER_H
+#define ASM__ARM__BYTEORDER_H
 
 #define __BYTEORDER_HAS_U64__
 
 #include <xen/byteorder/little_endian.h>
 
-#endif /* __ASM_ARM_BYTEORDER_H__ */
+#endif /* ASM__ARM__BYTEORDER_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/cache.h b/xen/arch/arm/include/asm/cache.h
index b75c970b68..e60a27498d 100644
--- a/xen/arch/arm/include/asm/cache.h
+++ b/xen/arch/arm/include/asm/cache.h
@@ -1,5 +1,5 @@
-#ifndef __ARCH_ARM_CACHE_H
-#define __ARCH_ARM_CACHE_H
+#ifndef ASM__ARM__CACHE_H
+#define ASM__ARM__CACHE_H
 
 
 /* L1 cache line size */
diff --git a/xen/arch/arm/include/asm/cadence-uart.h b/xen/arch/arm/include/asm/cadence-uart.h
index 48680eea4b..7107ad3e0c 100644
--- a/xen/arch/arm/include/asm/cadence-uart.h
+++ b/xen/arch/arm/include/asm/cadence-uart.h
@@ -15,8 +15,8 @@
  * GNU General Public License for more details.
  */
 
-#ifndef __ASM_ARM_CADENCE_UART_H__
-#define __ASM_ARM_CADENCE_UART_H__
+#ifndef ASM__ARM__CADENCE_UART_H
+#define ASM__ARM__CADENCE_UART_H
 
 #define R_UART_CR    0x00
 #define UART_CR_RX_RST       0x01
diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
index a2e22b659d..25a014f480 100644
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -4,8 +4,8 @@
  * A Linux-style configuration list.
  */
 
-#ifndef __ARM_CONFIG_H__
-#define __ARM_CONFIG_H__
+#ifndef ASM__ARM__CONFIG_H
+#define ASM__ARM__CONFIG_H
 
 #if defined(CONFIG_ARM_64)
 # define LONG_BYTEORDER 3
@@ -92,7 +92,7 @@ extern unsigned long frametable_virt_end;
 #include <asm/macros.h>
 #endif
 
-#endif /* __ARM_CONFIG_H__ */
+#endif /* ASM__ARM__CONFIG_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
index aec9e8f329..0732cce1f3 100644
--- a/xen/arch/arm/include/asm/cpregs.h
+++ b/xen/arch/arm/include/asm/cpregs.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_ARM_CPREGS_H
-#define __ASM_ARM_CPREGS_H
+#ifndef ASM__ARM__CPREGS_H
+#define ASM__ARM__CPREGS_H
 
 /*
  * AArch32 Co-processor registers.
diff --git a/xen/arch/arm/include/asm/cpuerrata.h b/xen/arch/arm/include/asm/cpuerrata.h
index 8d7e7b9375..8c9e3e0104 100644
--- a/xen/arch/arm/include/asm/cpuerrata.h
+++ b/xen/arch/arm/include/asm/cpuerrata.h
@@ -1,5 +1,5 @@
-#ifndef __ARM_CPUERRATA_H__
-#define __ARM_CPUERRATA_H__
+#ifndef ASM__ARM__CPUERRATA_H
+#define ASM__ARM__CPUERRATA_H
 
 #include <asm/cpufeature.h>
 #include <asm/alternative.h>
@@ -74,7 +74,7 @@ static inline enum ssbd_state get_ssbd_state(void)
 
 #endif
 
-#endif /* __ARM_CPUERRATA_H__ */
+#endif /* ASM__ARM__CPUERRATA_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
index 969e043f5b..b9f42beac7 100644
--- a/xen/arch/arm/include/asm/cpufeature.h
+++ b/xen/arch/arm/include/asm/cpufeature.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_ARM_CPUFEATURE_H
-#define __ASM_ARM_CPUFEATURE_H
+#ifndef ASM__ARM__CPUFEATURE_H
+#define ASM__ARM__CPUFEATURE_H
 
 #ifdef CONFIG_ARM_64
 #define cpu_feature64(c, feat)         ((c)->pfr64.feat)
diff --git a/xen/arch/arm/include/asm/current.h b/xen/arch/arm/include/asm/current.h
index 0be7ad6ef9..226cf953d7 100644
--- a/xen/arch/arm/include/asm/current.h
+++ b/xen/arch/arm/include/asm/current.h
@@ -1,5 +1,5 @@
-#ifndef __ARM_CURRENT_H__
-#define __ARM_CURRENT_H__
+#ifndef ASM__ARM__CURRENT_H
+#define ASM__ARM__CURRENT_H
 
 #include <xen/page-size.h>
 #include <xen/percpu.h>
@@ -65,7 +65,7 @@ do {                                                    \
 
 #endif
 
-#endif /* __ARM_CURRENT_H__ */
+#endif /* ASM__ARM__CURRENT_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/div64.h b/xen/arch/arm/include/asm/div64.h
index 8fe17f0ff2..627583f04f 100644
--- a/xen/arch/arm/include/asm/div64.h
+++ b/xen/arch/arm/include/asm/div64.h
@@ -1,6 +1,6 @@
 /* Taken from Linux arch/arm */
-#ifndef __ASM_ARM_DIV64
-#define __ASM_ARM_DIV64
+#ifndef ASM__ARM__DIV64_H
+#define ASM__ARM__DIV64_H
 
 #include <asm/system.h>
 #include <xen/types.h>
diff --git a/xen/arch/arm/include/asm/dom0less-build.h b/xen/arch/arm/include/asm/dom0less-build.h
index 5864944bda..48c5c85ead 100644
--- a/xen/arch/arm/include/asm/dom0less-build.h
+++ b/xen/arch/arm/include/asm/dom0less-build.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#ifndef __ASM_DOM0LESS_BUILD_H_
-#define __ASM_DOM0LESS_BUILD_H_
+#ifndef ASM__ARM__DOM0LESS_BUILD_H
+#define ASM__ARM__DOM0LESS_BUILD_H
 
 #include <xen/stdbool.h>
 
@@ -20,7 +20,7 @@ static inline bool is_dom0less_mode(void)
 
 #endif /* CONFIG_DOM0LESS_BOOT */
 
-#endif /* __ASM_DOM0LESS_BUILD_H_ */
+#endif /* ASM__ARM__DOM0LESS_BUILD_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index f1d72c6e48..f27353d9c8 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_DOMAIN_H__
-#define __ASM_DOMAIN_H__
+#ifndef ASM__ARM__DOMAIN_H
+#define ASM__ARM__DOMAIN_H
 
 #include <xen/cache.h>
 #include <xen/timer.h>
@@ -310,7 +310,7 @@ static inline void update_guest_memory_policy(struct vcpu *v,
                                               struct guest_memory_policy *gmp)
 {}
 
-#endif /* __ASM_DOMAIN_H__ */
+#endif /* ASM__ARM__DOMAIN_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
index e712afbc7f..740a45f964 100644
--- a/xen/arch/arm/include/asm/domain_build.h
+++ b/xen/arch/arm/include/asm/domain_build.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_DOMAIN_BUILD_H__
-#define __ASM_DOMAIN_BUILD_H__
+#ifndef ASM__ARM__DOMAIN_BUILD_H
+#define ASM__ARM__DOMAIN_BUILD_H
 
 #include <xen/sched.h>
 #include <asm/kernel.h>
diff --git a/xen/arch/arm/include/asm/early_printk.h b/xen/arch/arm/include/asm/early_printk.h
index 46a5e562dd..5dc65483f1 100644
--- a/xen/arch/arm/include/asm/early_printk.h
+++ b/xen/arch/arm/include/asm/early_printk.h
@@ -7,8 +7,8 @@
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation.
  */
-#ifndef __ARM_EARLY_PRINTK_H__
-#define __ARM_EARLY_PRINTK_H__
+#ifndef ASM__ARM__EARLY_PRINTK_H
+#define ASM__ARM__EARLY_PRINTK_H
 
 #include <xen/page-size.h>
 #include <asm/fixmap.h>
diff --git a/xen/arch/arm/include/asm/elf.h b/xen/arch/arm/include/asm/elf.h
index 9e436e7556..d55e8a1912 100644
--- a/xen/arch/arm/include/asm/elf.h
+++ b/xen/arch/arm/include/asm/elf.h
@@ -1,5 +1,5 @@
-#ifndef __ARM_ELF_H__
-#define __ARM_ELF_H__
+#ifndef ASM__ARM__ELF_H
+#define ASM__ARM__ELF_H
 
 typedef struct {
     unsigned long r0;
@@ -20,7 +20,7 @@ typedef struct {
     unsigned long pc;
 } ELF_Gregset;
 
-#endif /* __ARM_ELF_H__ */
+#endif /* ASM__ARM__ELF_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/event.h b/xen/arch/arm/include/asm/event.h
index b14c166ad6..c0088bbb64 100644
--- a/xen/arch/arm/include/asm/event.h
+++ b/xen/arch/arm/include/asm/event.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_EVENT_H__
-#define __ASM_EVENT_H__
+#ifndef ASM__ARM__EVENT_H
+#define ASM__ARM__EVENT_H
 
 #include <asm/domain.h>
 
diff --git a/xen/arch/arm/include/asm/exynos4210-uart.h b/xen/arch/arm/include/asm/exynos4210-uart.h
index e2ab4a43e4..21afc9e3f3 100644
--- a/xen/arch/arm/include/asm/exynos4210-uart.h
+++ b/xen/arch/arm/include/asm/exynos4210-uart.h
@@ -18,8 +18,8 @@
  * GNU General Public License for more details.
  */
 
-#ifndef __ASM_ARM_EXYNOS4210_H
-#define __ASM_ARM_EXYNOS4210_H
+#ifndef ASM__ARM__EXYNOS4210_UART_H
+#define ASM__ARM__EXYNOS4210_UART_H
 
 
 /*
@@ -100,7 +100,7 @@
 #define UINTM_RXD       (1 << 0)
 #define UINTM_ALLI      (UINTM_MODEM | UINTM_TXD | UINTM_ERROR | UINTM_RXD)
 
-#endif /* __ASM_ARM_EXYNOS4210_H */
+#endif /* ASM__ARM__EXYNOS4210_UART_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/fixmap.h b/xen/arch/arm/include/asm/fixmap.h
index 0cb5d54d1c..da6bf72bec 100644
--- a/xen/arch/arm/include/asm/fixmap.h
+++ b/xen/arch/arm/include/asm/fixmap.h
@@ -1,8 +1,8 @@
 /*
  * fixmap.h: compile-time virtual memory allocation
  */
-#ifndef __ASM_FIXMAP_H
-#define __ASM_FIXMAP_H
+#ifndef ASM__ARM__FIXMAP_H
+#define ASM__ARM__FIXMAP_H
 
 #include <xen/acpi.h>
 #include <xen/pmap.h>
@@ -45,4 +45,4 @@ static inline unsigned int virt_to_fix(vaddr_t vaddr)
 
 #endif /* __ASSEMBLY__ */
 
-#endif /* __ASM_FIXMAP_H */
+#endif /* ASM__ARM__FIXMAP_H */
diff --git a/xen/arch/arm/include/asm/flushtlb.h b/xen/arch/arm/include/asm/flushtlb.h
index e45fb6d97b..2239acf4fc 100644
--- a/xen/arch/arm/include/asm/flushtlb.h
+++ b/xen/arch/arm/include/asm/flushtlb.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_ARM_FLUSHTLB_H__
-#define __ASM_ARM_FLUSHTLB_H__
+#ifndef ASM__ARM__FLUSHTLB_H
+#define ASM__ARM__FLUSHTLB_H
 
 #include <xen/cpumask.h>
 
@@ -68,7 +68,7 @@ static inline void flush_xen_tlb_range_va(vaddr_t va,
     isb();
 }
 
-#endif /* __ASM_ARM_FLUSHTLB_H__ */
+#endif /* ASM__ARM__FLUSHTLB_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.h
index 541f0eeb80..edbeba6388 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -15,8 +15,8 @@
  * GNU General Public License for more details.
  */
 
-#ifndef __ASM_ARM_GIC_H__
-#define __ASM_ARM_GIC_H__
+#ifndef ASM__ARM__GIC_H
+#define ASM__ARM__GIC_H
 
 #define NR_GIC_LOCAL_IRQS  NR_LOCAL_IRQS
 #define NR_GIC_SGI         16
diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/asm/gic_v3_defs.h
index 2af093e774..39c594470b 100644
--- a/xen/arch/arm/include/asm/gic_v3_defs.h
+++ b/xen/arch/arm/include/asm/gic_v3_defs.h
@@ -15,8 +15,8 @@
  * GNU General Public License for more details.
  */
 
-#ifndef __ASM_ARM_GIC_V3_DEFS_H__
-#define __ASM_ARM_GIC_V3_DEFS_H__
+#ifndef ASM__ARM__GIC_V3_DEFS_H
+#define ASM__ARM__GIC_V3_DEFS_H
 
 #include <xen/sizes.h>
 
@@ -210,7 +210,7 @@ struct rdist_region {
     bool single_rdist;
 };
 
-#endif /* __ASM_ARM_GIC_V3_DEFS_H__ */
+#endif /* ASM__ARM__GIC_V3_DEFS_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include/asm/gic_v3_its.h
index c24d4752d0..f34b803f66 100644
--- a/xen/arch/arm/include/asm/gic_v3_its.h
+++ b/xen/arch/arm/include/asm/gic_v3_its.h
@@ -17,8 +17,8 @@
  * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef __ASM_ARM_ITS_H__
-#define __ASM_ARM_ITS_H__
+#ifndef ASM__ARM__GIC_V3_ITS_H
+#define ASM__ARM__GIC_V3_ITS_H
 
 #define GITS_CTLR                       0x000
 #define GITS_IIDR                       0x004
diff --git a/xen/arch/arm/include/asm/grant_table.h b/xen/arch/arm/include/asm/grant_table.h
index d3c518a926..b104fc890c 100644
--- a/xen/arch/arm/include/asm/grant_table.h
+++ b/xen/arch/arm/include/asm/grant_table.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_GRANT_TABLE_H__
-#define __ASM_GRANT_TABLE_H__
+#ifndef ASM__ARM__GRANT_TABLE_H
+#define ASM__ARM__GRANT_TABLE_H
 
 #include <xen/grant_table.h>
 #include <xen/kernel.h>
@@ -76,7 +76,7 @@ int replace_grant_host_mapping(uint64_t gpaddr, mfn_t frame,
 #define gnttab_need_iommu_mapping(d)                    \
     (is_domain_direct_mapped(d) && is_iommu_enabled(d))
 
-#endif /* __ASM_GRANT_TABLE_H__ */
+#endif /* ASM__ARM__GRANT_TABLE_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/guest_access.h b/xen/arch/arm/include/asm/guest_access.h
index 18c88b70d7..2deaf968f9 100644
--- a/xen/arch/arm/include/asm/guest_access.h
+++ b/xen/arch/arm/include/asm/guest_access.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_ARM_GUEST_ACCESS_H__
-#define __ASM_ARM_GUEST_ACCESS_H__
+#ifndef ASM__ARM__GUEST_ACCESS_H
+#define ASM__ARM__GUEST_ACCESS_H
 
 #include <xen/errno.h>
 #include <xen/sched.h>
@@ -31,7 +31,7 @@ int access_guest_memory_by_gpa(struct domain *d, paddr_t gpa, void *buf,
 #define guest_handle_okay(hnd, nr) (1)
 #define guest_handle_subrange_okay(hnd, first, last) (1)
 
-#endif /* __ASM_ARM_GUEST_ACCESS_H__ */
+#endif /* ASM__ARM__GUEST_ACCESS_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/guest_atomics.h b/xen/arch/arm/include/asm/guest_atomics.h
index 8893eb9a55..29fc05f5e7 100644
--- a/xen/arch/arm/include/asm/guest_atomics.h
+++ b/xen/arch/arm/include/asm/guest_atomics.h
@@ -1,5 +1,5 @@
-#ifndef _ARM_GUEST_ATOMICS_H
-#define _ARM_GUEST_ATOMICS_H
+#ifndef ASM__ARM__GUEST_ATOMICS_H
+#define ASM__ARM__GUEST_ATOMICS_H
 
 #include <xen/bitops.h>
 #include <xen/sched.h>
@@ -137,7 +137,7 @@ static inline uint64_t guest_cmpxchg64(struct domain *d,
     return oldval;
 }
 
-#endif /* _ARM_GUEST_ATOMICS_H */
+#endif /* ASM__ARM__GUEST_ATOMICS_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/guest_walk.h b/xen/arch/arm/include/asm/guest_walk.h
index 8768ac9894..2be96d9020 100644
--- a/xen/arch/arm/include/asm/guest_walk.h
+++ b/xen/arch/arm/include/asm/guest_walk.h
@@ -1,5 +1,5 @@
-#ifndef _XEN_GUEST_WALK_H
-#define _XEN_GUEST_WALK_H
+#ifndef ASM__ARM__GUEST_WALK_H
+#define ASM__ARM__GUEST_WALK_H
 
 /* Walk the guest's page tables in software. */
 bool guest_walk_tables(const struct vcpu *v,
@@ -7,7 +7,7 @@ bool guest_walk_tables(const struct vcpu *v,
                        paddr_t *ipa,
                        unsigned int *perms);
 
-#endif /* _XEN_GUEST_WALK_H */
+#endif /* ASM__ARM__GUEST_WALK_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/hsr.h b/xen/arch/arm/include/asm/hsr.h
index 9b91b28c48..d3e7b70835 100644
--- a/xen/arch/arm/include/asm/hsr.h
+++ b/xen/arch/arm/include/asm/hsr.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_ARM_HSR_H
-#define __ASM_ARM_HSR_H
+#ifndef ASM__ARM__HSR_H
+#define ASM__ARM__HSR_H
 
 #include <xen/types.h>
 
@@ -205,7 +205,7 @@ union hsr {
 /* HSR.EC == HSR_{HVC32, HVC64, SMC64, SVC32, SVC64} */
 #define HSR_XXC_IMM_MASK     (0xffff)
 
-#endif /* __ASM_ARM_HSR_H */
+#endif /* ASM__ARM__HSR_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/hypercall.h b/xen/arch/arm/include/asm/hypercall.h
index 0a23f8d484..95d38206b6 100644
--- a/xen/arch/arm/include/asm/hypercall.h
+++ b/xen/arch/arm/include/asm/hypercall.h
@@ -3,15 +3,15 @@
 #error "asm/hypercall.h should not be included directly - include xen/hypercall.h instead"
 #endif
 
-#ifndef __ASM_ARM_HYPERCALL_H__
-#define __ASM_ARM_HYPERCALL_H__
+#ifndef ASM__ARM__HYPERCALL_H
+#define ASM__ARM__HYPERCALL_H
 
 #include <public/domctl.h> /* for arch_do_domctl */
 
 long subarch_do_domctl(struct xen_domctl *domctl, struct domain *d,
                        XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
 
-#endif /* __ASM_ARM_HYPERCALL_H__ */
+#endif /* ASM__ARM__HYPERCALL_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/imx-lpuart.h b/xen/arch/arm/include/asm/imx-lpuart.h
index fe859045dc..1e074649cf 100644
--- a/xen/arch/arm/include/asm/imx-lpuart.h
+++ b/xen/arch/arm/include/asm/imx-lpuart.h
@@ -17,8 +17,8 @@
  * GNU General Public License for more details.
  */
 
-#ifndef __ASM_ARM_IMX_LPUART_H__
-#define __ASM_ARM_IMX_LPUART_H__
+#ifndef ASM__ARM__IMX_LPUART_H
+#define ASM__ARM__IMX_LPUART_H
 
 /* 32-bit register definition */
 #define UARTBAUD          (0x10)
@@ -52,7 +52,7 @@
 
 #define UARTWATER_RXCNT_OFF     24
 
-#endif /* __ASM_ARM_IMX_LPUART_H__ */
+#endif /* ASM__ARM__IMX_LPUART_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/insn.h b/xen/arch/arm/include/asm/insn.h
index 27271e95f9..8aa66b2e95 100644
--- a/xen/arch/arm/include/asm/insn.h
+++ b/xen/arch/arm/include/asm/insn.h
@@ -1,5 +1,5 @@
-#ifndef __ARCH_ARM_INSN
-#define __ARCH_ARM_INSN
+#ifndef ASM__ARM__INSN_H
+#define ASM__ARM__INSN_H
 
 #ifndef __ASSEMBLY__
 
@@ -18,7 +18,7 @@
 /* On ARM32,64 instructions are always 4 bytes long. */
 #define ARCH_PATCH_INSN_SIZE 4
 
-#endif /* !__ARCH_ARM_INSN */
+#endif /* !ASM__ARM__INSN_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/io.h b/xen/arch/arm/include/asm/io.h
index e426804424..2475fca9de 100644
--- a/xen/arch/arm/include/asm/io.h
+++ b/xen/arch/arm/include/asm/io.h
@@ -1,5 +1,5 @@
-#ifndef _ASM_IO_H
-#define _ASM_IO_H
+#ifndef ASM__ARM__IO_H
+#define ASM__ARM__IO_H
 
 #if defined(CONFIG_ARM_32)
 # include <asm/arm32/io.h>
diff --git a/xen/arch/arm/include/asm/iommu.h b/xen/arch/arm/include/asm/iommu.h
index d57bd8a38c..eba17ec695 100644
--- a/xen/arch/arm/include/asm/iommu.h
+++ b/xen/arch/arm/include/asm/iommu.h
@@ -11,8 +11,8 @@
  * You should have received a copy of the GNU General Public License along with
  * this program; If not, see <http://www.gnu.org/licenses/>.
 */
-#ifndef __ARCH_ARM_IOMMU_H__
-#define __ARCH_ARM_IOMMU_H__
+#ifndef ASM__ARM__IOMMU_H
+#define ASM__ARM__IOMMU_H
 
 struct arch_iommu
 {
@@ -34,7 +34,7 @@ int __must_check arm_iommu_unmap_page(struct domain *d, dfn_t dfn,
                                       unsigned int order,
                                       unsigned int *flush_flags);
 
-#endif /* __ARCH_ARM_IOMMU_H__ */
+#endif /* ASM__ARM__IOMMU_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/iommu_fwspec.h b/xen/arch/arm/include/asm/iommu_fwspec.h
index 5cdb53f8e8..f018e121f9 100644
--- a/xen/arch/arm/include/asm/iommu_fwspec.h
+++ b/xen/arch/arm/include/asm/iommu_fwspec.h
@@ -24,8 +24,8 @@
  * License along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef __ARCH_ARM_IOMMU_FWSPEC_H__
-#define __ARCH_ARM_IOMMU_FWSPEC_H__
+#ifndef ASM__ARM__IOMMU_FWSPEC_H
+#define ASM__ARM__IOMMU_FWSPEC_H
 
 /* per-device IOMMU instance data */
 struct iommu_fwspec {
@@ -55,7 +55,7 @@ static inline void dev_iommu_fwspec_set(struct device *dev,
     dev->iommu_fwspec = fwspec;
 }
 
-#endif /* __ARCH_ARM_IOMMU_FWSPEC_H__ */
+#endif /* ASM__ARM__IOMMU_FWSPEC_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/ioreq.h b/xen/arch/arm/include/asm/ioreq.h
index 50185978d5..9300ba53d6 100644
--- a/xen/arch/arm/include/asm/ioreq.h
+++ b/xen/arch/arm/include/asm/ioreq.h
@@ -17,8 +17,8 @@
  * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef __ASM_ARM_IOREQ_H__
-#define __ASM_ARM_IOREQ_H__
+#ifndef ASM__ARM__IOREQ_H
+#define ASM__ARM__IOREQ_H
 
 #ifdef CONFIG_IOREQ_SERVER
 enum io_state handle_ioserv(struct cpu_user_regs *regs, struct vcpu *v);
@@ -57,7 +57,7 @@ static inline void msix_write_completion(struct vcpu *v)
 #define IOREQ_STATUS_UNHANDLED   IO_UNHANDLED
 #define IOREQ_STATUS_RETRY       IO_RETRY
 
-#endif /* __ASM_ARM_IOREQ_H__ */
+#endif /* ASM__ARM__IOREQ_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.h
index 88e060bf29..42abb6614e 100644
--- a/xen/arch/arm/include/asm/irq.h
+++ b/xen/arch/arm/include/asm/irq.h
@@ -1,5 +1,5 @@
-#ifndef _ASM_HW_IRQ_H
-#define _ASM_HW_IRQ_H
+#ifndef ASM__ARM__IRQ_H
+#define ASM__ARM__IRQ_H
 
 #include <xen/device_tree.h>
 #include <public/device_tree_defs.h>
@@ -101,7 +101,7 @@ bool irq_type_set_by_domain(const struct domain *d);
 void irq_end_none(struct irq_desc *irq);
 #define irq_end_none irq_end_none
 
-#endif /* _ASM_HW_IRQ_H */
+#endif /* ASM__ARM__IRQ_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
index 7e6e3c82a4..39452f984b 100644
--- a/xen/arch/arm/include/asm/kernel.h
+++ b/xen/arch/arm/include/asm/kernel.h
@@ -3,8 +3,8 @@
  *
  * Copyright (C) 2011 Citrix Systems, Inc.
  */
-#ifndef __ARCH_ARM_KERNEL_H__
-#define __ARCH_ARM_KERNEL_H__
+#ifndef ASM__ARM__KERNEL_H
+#define ASM__ARM__KERNEL_H
 
 #include <xen/device_tree.h>
 #include <asm/domain.h>
@@ -126,7 +126,7 @@ int kernel_probe(struct kernel_info *info, const struct dt_device_node *domain);
  */
 void kernel_load(struct kernel_info *info);
 
-#endif /* #ifdef __ARCH_ARM_KERNEL_H__ */
+#endif /* #ifdef ASM__ARM__KERNEL_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/livepatch.h b/xen/arch/arm/include/asm/livepatch.h
index 026af5e7dc..11fec2033c 100644
--- a/xen/arch/arm/include/asm/livepatch.h
+++ b/xen/arch/arm/include/asm/livepatch.h
@@ -3,8 +3,8 @@
  *
  */
 
-#ifndef __XEN_ARM_LIVEPATCH_H__
-#define __XEN_ARM_LIVEPATCH_H__
+#ifndef ASM__ARM__LIVEPATCH_H
+#define ASM__ARM__LIVEPATCH_H
 
 #include <xen/sizes.h> /* For SZ_* macros. */
 #include <asm/insn.h>
@@ -24,7 +24,7 @@ extern void *vmap_of_xen_text;
 #define ARCH_LIVEPATCH_RANGE SZ_128M
 #endif
 
-#endif /* __XEN_ARM_LIVEPATCH_H__ */
+#endif /* ASM__ARM__LIVEPATCH_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/lpae.h b/xen/arch/arm/include/asm/lpae.h
index 4a1679cb33..ebf20ac121 100644
--- a/xen/arch/arm/include/asm/lpae.h
+++ b/xen/arch/arm/include/asm/lpae.h
@@ -1,5 +1,5 @@
-#ifndef __ARM_LPAE_H__
-#define __ARM_LPAE_H__
+#ifndef ASM__ARM__LPAE_H
+#define ASM__ARM__LPAE_H
 
 #ifndef __ASSEMBLY__
 
@@ -284,7 +284,7 @@ lpae_t __aligned(PAGE_SIZE) name[XEN_PT_LPAE_ENTRIES * (nr)]
 
 #define DEFINE_PAGE_TABLE(name) DEFINE_PAGE_TABLES(name, 1)
 
-#endif /* __ARM_LPAE_H__ */
+#endif /* ASM__ARM__LPAE_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/macros.h b/xen/arch/arm/include/asm/macros.h
index dc791245df..a6b212f4e3 100644
--- a/xen/arch/arm/include/asm/macros.h
+++ b/xen/arch/arm/include/asm/macros.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_MACROS_H
-#define __ASM_MACROS_H
+#ifndef ASM__ARM__MACROS_H
+#define ASM__ARM__MACROS_H
 
 #ifndef __ASSEMBLY__
 # error "This file should only be included in assembly file"
diff --git a/xen/arch/arm/include/asm/mem_access.h b/xen/arch/arm/include/asm/mem_access.h
index abac8032fc..22b3dc3786 100644
--- a/xen/arch/arm/include/asm/mem_access.h
+++ b/xen/arch/arm/include/asm/mem_access.h
@@ -14,8 +14,8 @@
  * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef _ASM_ARM_MEM_ACCESS_H
-#define _ASM_ARM_MEM_ACCESS_H
+#ifndef ASM__ARM__MEM_ACCESS_H
+#define ASM__ARM__MEM_ACCESS_H
 
 #include <xen/types.h>
 
@@ -59,7 +59,7 @@ p2m_mem_access_check_and_get_page(vaddr_t gva, unsigned long flag,
 }
 
 #endif /*CONFIG_MEM_ACCESS*/
-#endif /* _ASM_ARM_MEM_ACCESS_H */
+#endif /* ASM__ARM__MEM_ACCESS_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 5abd4b0d1c..227f678a2e 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -1,5 +1,5 @@
-#ifndef __ARCH_ARM_MM__
-#define __ARCH_ARM_MM__
+#ifndef ASM__ARM__MM_H
+#define ASM__ARM__MM_H
 
 #include <xen/kernel.h>
 #include <asm/page.h>
@@ -426,7 +426,7 @@ static inline void page_set_xenheap_gfn(struct page_info *p, gfn_t gfn)
     } while ( (y = cmpxchg(&p->u.inuse.type_info, x, nx)) != x );
 }
 
-#endif /*  __ARCH_ARM_MM__ */
+#endif /*  ASM__ARM__MM_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/mmio.h b/xen/arch/arm/include/asm/mmio.h
index b22cfdac5b..a0c5efeba7 100644
--- a/xen/arch/arm/include/asm/mmio.h
+++ b/xen/arch/arm/include/asm/mmio.h
@@ -16,8 +16,8 @@
  * GNU General Public License for more details.
  */
 
-#ifndef __ASM_ARM_MMIO_H__
-#define __ASM_ARM_MMIO_H__
+#ifndef ASM__ARM__MMIO_H
+#define ASM__ARM__MMIO_H
 
 #include <xen/lib.h>
 #include <xen/rwlock.h>
@@ -92,7 +92,7 @@ void domain_io_free(struct domain *d);
 void try_decode_instruction(const struct cpu_user_regs *regs,
                             mmio_info_t *info);
 
-#endif  /* __ASM_ARM_MMIO_H__ */
+#endif  /* ASM__ARM__MMIO_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/mmu/layout.h b/xen/arch/arm/include/asm/mmu/layout.h
index a3b546465b..5fe3d1db57 100644
--- a/xen/arch/arm/include/asm/mmu/layout.h
+++ b/xen/arch/arm/include/asm/mmu/layout.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#ifndef __ARM_MMU_LAYOUT_H__
-#define __ARM_MMU_LAYOUT_H__
+#ifndef ASM__ARM__MMU__LAYOUT_H
+#define ASM__ARM__MMU__LAYOUT_H
 
 /*
  * ARM32 layout:
@@ -140,7 +140,7 @@
 
 #endif
 
-#endif /* __ARM_MMU_LAYOUT_H__ */
+#endif /* ASM__ARM__MMU__LAYOUT_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/mmu/mm.h b/xen/arch/arm/include/asm/mmu/mm.h
index c5e03a66bf..44cd9b9007 100644
--- a/xen/arch/arm/include/asm/mmu/mm.h
+++ b/xen/arch/arm/include/asm/mmu/mm.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
-#ifndef __ARM_MMU_MM_H__
-#define __ARM_MMU_MM_H__
+#ifndef ASM__ARM__MMU__MM_H
+#define ASM__ARM__MMU__MM_H
 
 /* Non-boot CPUs use this to find the correct pagetables. */
 extern uint64_t init_ttbr;
@@ -32,7 +32,7 @@ void dump_pt_walk(paddr_t ttbr, paddr_t addr,
 /* Switch to a new root page-tables */
 extern void switch_ttbr(uint64_t ttbr);
 
-#endif /* __ARM_MMU_MM_H__ */
+#endif /* ASM__ARM__MMU__MM_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/mmu/p2m.h b/xen/arch/arm/include/asm/mmu/p2m.h
index 58496c0b09..f085075d8f 100644
--- a/xen/arch/arm/include/asm/mmu/p2m.h
+++ b/xen/arch/arm/include/asm/mmu/p2m.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
-#ifndef __ARM_MMU_P2M_H__
-#define __ARM_MMU_P2M_H__
+#ifndef ASM__ARM__MMU__P2M_H
+#define ASM__ARM__MMU__P2M_H
 
 extern unsigned int p2m_root_order;
 extern unsigned int p2m_root_level;
@@ -14,7 +14,7 @@ void p2m_tlb_flush_sync(struct p2m_domain *p2m);
 
 void p2m_clear_root_pages(struct p2m_domain *p2m);
 
-#endif /* __ARM_MMU_P2M_H__ */
+#endif /* ASM__ARM__MMU__P2M_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/monitor.h b/xen/arch/arm/include/asm/monitor.h
index 77a3c1a36c..5ee181065e 100644
--- a/xen/arch/arm/include/asm/monitor.h
+++ b/xen/arch/arm/include/asm/monitor.h
@@ -19,8 +19,8 @@
  * License along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef __ASM_ARM_MONITOR_H__
-#define __ASM_ARM_MONITOR_H__
+#ifndef ASM__ARM__MONITOR_H
+#define ASM__ARM__MONITOR_H
 
 #include <xen/sched.h>
 #include <public/domctl.h>
@@ -44,4 +44,4 @@ static inline uint32_t arch_monitor_get_capabilities(struct domain *d)
 
 int monitor_smc(void);
 
-#endif /* __ASM_ARM_MONITOR_H__ */
+#endif /* ASM__ARM__MONITOR_H */
diff --git a/xen/arch/arm/include/asm/new_vgic.h b/xen/arch/arm/include/asm/new_vgic.h
index 1e76213893..8007d7d717 100644
--- a/xen/arch/arm/include/asm/new_vgic.h
+++ b/xen/arch/arm/include/asm/new_vgic.h
@@ -13,8 +13,8 @@
  * You should have received a copy of the GNU General Public License
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
-#ifndef __ASM_ARM_NEW_VGIC_H
-#define __ASM_ARM_NEW_VGIC_H
+#ifndef ASM__ARM__NEW_VGIC_H
+#define ASM__ARM__NEW_VGIC_H
 
 #include <asm/atomic.h>
 #include <asm/mmio.h>
@@ -198,7 +198,7 @@ static inline paddr_t vgic_dist_base(const struct vgic_dist *vgic)
     return vgic->dbase;
 }
 
-#endif /* __ASM_ARM_NEW_VGIC_H */
+#endif /* ASM__ARM__NEW_VGIC_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/nospec.h b/xen/arch/arm/include/asm/nospec.h
index efac51fc03..f06d40fba4 100644
--- a/xen/arch/arm/include/asm/nospec.h
+++ b/xen/arch/arm/include/asm/nospec.h
@@ -1,8 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /* Copyright 2018 Amazon.com, Inc. or its affiliates. All Rights Reserved. */
 
-#ifndef _ASM_ARM_NOSPEC_H
-#define _ASM_ARM_NOSPEC_H
+#ifndef ASM__ARM__NOSPEC_H
+#define ASM__ARM__NOSPEC_H
 
 #if defined(CONFIG_ARM_32)
 # include <asm/arm32/nospec.h>
@@ -21,7 +21,7 @@ static inline void block_speculation(void)
 {
 }
 
-#endif /* _ASM_ARM_NOSPEC_H */
+#endif /* ASM__ARM__NOSPEC_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index c84fe8d97d..edbcaad77e 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -1,5 +1,5 @@
-#ifndef _XEN_P2M_H
-#define _XEN_P2M_H
+#ifndef ASM__ARM__P2M_H
+#define ASM__ARM__P2M_H
 
 #include <xen/mm.h>
 #include <xen/radix-tree.h>
@@ -449,7 +449,7 @@ static inline bool vcpu_has_cache_enabled(struct vcpu *v)
     return (READ_SYSREG(SCTLR_EL1) & mask) == mask;
 }
 
-#endif /* _XEN_P2M_H */
+#endif /* ASM__ARM__P2M_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/page-bits.h b/xen/arch/arm/include/asm/page-bits.h
index deb381ceeb..5a0fd0a93f 100644
--- a/xen/arch/arm/include/asm/page-bits.h
+++ b/xen/arch/arm/include/asm/page-bits.h
@@ -1,8 +1,8 @@
-#ifndef __ARM_PAGE_SHIFT_H__
-#define __ARM_PAGE_SHIFT_H__
+#ifndef ASM__ARM__PAGE_BITS_H
+#define ASM__ARM__PAGE_BITS_H
 
 #define PAGE_SHIFT              12
 
 #define PADDR_BITS              CONFIG_PADDR_BITS
 
-#endif /* __ARM_PAGE_SHIFT_H__ */
+#endif /* ASM__ARM__PAGE_BITS_H */
diff --git a/xen/arch/arm/include/asm/page.h b/xen/arch/arm/include/asm/page.h
index 69f817d1e6..24849998aa 100644
--- a/xen/arch/arm/include/asm/page.h
+++ b/xen/arch/arm/include/asm/page.h
@@ -1,5 +1,5 @@
-#ifndef __ARM_PAGE_H__
-#define __ARM_PAGE_H__
+#ifndef ASM__ARM__PAGE_H
+#define ASM__ARM__PAGE_H
 
 #include <public/xen.h>
 #include <xen/page-size.h>
@@ -316,7 +316,7 @@ static inline int gva_to_ipa(vaddr_t va, paddr_t *paddr, unsigned int flags)
 
 #endif /* __ASSEMBLY__ */
 
-#endif /* __ARM_PAGE_H__ */
+#endif /* ASM__ARM__PAGE_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.h
index 7f77226c9b..ccef80687c 100644
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -12,8 +12,8 @@
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef __ARM_PCI_H__
-#define __ARM_PCI_H__
+#ifndef ASM__ARM__PCI_H
+#define ASM__ARM__PCI_H
 
 #ifdef CONFIG_HAS_PCI
 
@@ -148,4 +148,4 @@ static inline int pci_get_new_domain_nr(void)
 }
 
 #endif  /*!CONFIG_HAS_PCI*/
-#endif /* __ARM_PCI_H__ */
+#endif /* ASM__ARM__PCI_H */
diff --git a/xen/arch/arm/include/asm/perfc.h b/xen/arch/arm/include/asm/perfc.h
index 95c4b2b6b7..5c6a62720a 100644
--- a/xen/arch/arm/include/asm/perfc.h
+++ b/xen/arch/arm/include/asm/perfc.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_PERFC_H__
-#define __ASM_PERFC_H__
+#ifndef ASM__ARM__PERFC_H
+#define ASM__ARM__PERFC_H
 
 static inline void arch_perfc_reset(void)
 {
diff --git a/xen/arch/arm/include/asm/perfc_defn.h b/xen/arch/arm/include/asm/perfc_defn.h
index 3ab0391175..56d9541e5f 100644
--- a/xen/arch/arm/include/asm/perfc_defn.h
+++ b/xen/arch/arm/include/asm/perfc_defn.h
@@ -1,6 +1,6 @@
 /* This file is legitimately included multiple times. */
-/*#ifndef __XEN_PERFC_DEFN_H__*/
-/*#define __XEN_PERFC_DEFN_H__*/
+/*#ifndef ASM__ARM__PERFC_DEFN_H*/
+/*#define ASM__ARM__PERFC_DEFN_H*/
 
 PERFCOUNTER(invalid_hypercalls, "invalid hypercalls")
 
@@ -76,7 +76,7 @@ PERFCOUNTER(maintenance_irqs, "Maintenance interrupts")
 PERFCOUNTER(atomics_guest,    "atomics: guest access")
 PERFCOUNTER(atomics_guest_paused,   "atomics: guest paused")
 
-/*#endif*/ /* __XEN_PERFC_DEFN_H__ */
+/*#endif*/ /* ASM__ARM__PERFC_DEFN_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/pl011-uart.h b/xen/arch/arm/include/asm/pl011-uart.h
index 27c9bfa444..ce6084784a 100644
--- a/xen/arch/arm/include/asm/pl011-uart.h
+++ b/xen/arch/arm/include/asm/pl011-uart.h
@@ -18,8 +18,8 @@
  * GNU General Public License for more details.
  */
 
-#ifndef __ASM_ARM_PL011_H
-#define __ASM_ARM_PL011_H
+#ifndef ASM__ARM__PL011_UART_H
+#define ASM__ARM__PL011_UART_H
 
 #ifdef __ASSEMBLY__
 
@@ -95,7 +95,7 @@
 #define RIMI  (1<<0)  /* nUARTRI Modem interrupt mask */
 #define ALLI  OEI|BEI|PEI|FEI|RTI|TXI|RXI|DSRMI|DCDMI|CTSMI|RIMI
 
-#endif /* __ASM_ARM_PL011_H */
+#endif /* ASM__ARM__PL011_UART_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/platform.h b/xen/arch/arm/include/asm/platform.h
index 997eb25216..d674858a06 100644
--- a/xen/arch/arm/include/asm/platform.h
+++ b/xen/arch/arm/include/asm/platform.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_ARM_PLATFORM_H
-#define __ASM_ARM_PLATFORM_H
+#ifndef ASM__ARM__PLATFORM_H
+#define ASM__ARM__PLATFORM_H
 
 #include <xen/sched.h>
 #include <xen/mm.h>
@@ -70,7 +70,7 @@ __section(".arch.info") = {                                     \
 #define PLATFORM_END                                            \
 };
 
-#endif /* __ASM_ARM_PLATFORM_H */
+#endif /* ASM__ARM__PLATFORM_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/platforms/exynos5.h b/xen/arch/arm/include/asm/platforms/exynos5.h
index aef5c67084..90305fedff 100644
--- a/xen/arch/arm/include/asm/platforms/exynos5.h
+++ b/xen/arch/arm/include/asm/platforms/exynos5.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_ARM_PLATFORMS_EXYNOS5_H
-#define __ASM_ARM_PLATFORMS_EXYNOS5_H
+#ifndef ASM__ARM__PLATFORMS__EXYNOS5_H
+#define ASM__ARM__PLATFORMS__EXYNOS5_H
 
 #define EXYNOS5_MCT_G_TCON          0x240       /* Relative to MCT_BASE */
 #define EXYNOS5_MCT_G_TCON_START    (1 << 8)
@@ -9,7 +9,7 @@
 
 #define EXYNOS5_SWRESET             0x0400      /* Relative to PA_PMU */
 
-#endif /* __ASM_ARM_PLATFORMS_EXYNOS5_H */
+#endif /* ASM__ARM__PLATFORMS__EXYNOS5_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/platforms/midway.h b/xen/arch/arm/include/asm/platforms/midway.h
index 099e4350f9..b6396e64b3 100644
--- a/xen/arch/arm/include/asm/platforms/midway.h
+++ b/xen/arch/arm/include/asm/platforms/midway.h
@@ -1,5 +1,5 @@
 #ifndef __ASM_ARM_PLATFORMS_MIDWAY_H
-#define __ASM_ASM_PLATFORMS_MIDWAY_H
+#define ASM__ARM__PLATFORMS__MIDWAY_H
 
 /* addresses of SREG registers for resetting the SoC */
 #define MW_SREG_PWR_REQ             0xfff3cf00
diff --git a/xen/arch/arm/include/asm/platforms/omap5.h b/xen/arch/arm/include/asm/platforms/omap5.h
index c559c84b61..811db96281 100644
--- a/xen/arch/arm/include/asm/platforms/omap5.h
+++ b/xen/arch/arm/include/asm/platforms/omap5.h
@@ -1,4 +1,4 @@
-#ifndef __ASM_ARM_PLATFORMS_OMAP5_H
+#ifndef ASM__ARM__PLATFORMS__OMAP5_H
 #define __ASM_ASM_PLATFORMS_OMAP5_H
 
 #define REALTIME_COUNTER_BASE                   0x48243200
@@ -20,7 +20,7 @@
 #define OMAP_AUX_CORE_BOOT_0_OFFSET             0x800
 #define OMAP_AUX_CORE_BOOT_1_OFFSET             0x804
 
-#endif /* __ASM_ARM_PLATFORMS_OMAP5_H */
+#endif /* ASM__ARM__PLATFORMS__OMAP5_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/platforms/vexpress.h b/xen/arch/arm/include/asm/platforms/vexpress.h
index 8b45d3a850..da81c3d1a5 100644
--- a/xen/arch/arm/include/asm/platforms/vexpress.h
+++ b/xen/arch/arm/include/asm/platforms/vexpress.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_ARM_PLATFORMS_VEXPRESS_H
-#define __ASM_ARM_PLATFORMS_VEXPRESS_H
+#ifndef ASM__ARM__PLATFORMS__VEXPRESS_H
+#define ASM__ARM__PLATFORMS__VEXPRESS_H
 
 /* V2M */
 #define V2M_SYS_MMIO_BASE     (0x1c010000)
@@ -26,7 +26,7 @@
 /* Board-specific: base address of system controller */
 #define SP810_ADDRESS 0x1C020000
 
-#endif /* __ASM_ARM_PLATFORMS_VEXPRESS_H */
+#endif /* ASM__ARM__PLATFORMS__VEXPRESS_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/platforms/xilinx-zynqmp-eemi.h b/xen/arch/arm/include/asm/platforms/xilinx-zynqmp-eemi.h
index cf25a9014d..005199d019 100644
--- a/xen/arch/arm/include/asm/platforms/xilinx-zynqmp-eemi.h
+++ b/xen/arch/arm/include/asm/platforms/xilinx-zynqmp-eemi.h
@@ -11,8 +11,8 @@
  * GNU General Public License for more details.
  */
 
-#ifndef __ASM_ARM_PLATFORMS_ZYNQMP_H
-#define __ASM_ARM_PLATFORMS_ZYNQMP_H
+#ifndef ASM__ARM__PLATFORMS__XILINX_ZYNQMP_EEMI_H
+#define ASM__ARM__PLATFORMS__XILINX_ZYNQMP_EEMI_H
 
 #include <asm/processor.h>
 #include <asm/smccc.h>
@@ -116,7 +116,7 @@ enum ipi_api_id {
 
 extern bool zynqmp_eemi(struct cpu_user_regs *regs);
 
-#endif /* __ASM_ARM_PLATFORMS_ZYNQMP_H */
+#endif /* ASM__ARM__PLATFORMS__XILINX_ZYNQMP_EEMI_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/pmap.h b/xen/arch/arm/include/asm/pmap.h
index bca3381796..a14d89cb46 100644
--- a/xen/arch/arm/include/asm/pmap.h
+++ b/xen/arch/arm/include/asm/pmap.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_PMAP_H__
-#define __ASM_PMAP_H__
+#ifndef ASM__ARM__PMAP_H
+#define ASM__ARM__PMAP_H
 
 #include <xen/mm.h>
 
@@ -31,4 +31,4 @@ static inline void arch_pmap_unmap(unsigned int slot)
     flush_xen_tlb_range_va_local(FIXMAP_ADDR(slot), PAGE_SIZE);
 }
 
-#endif /* __ASM_PMAP_H__ */
+#endif /* ASM__ARM__PMAP_H */
diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index 8e02410465..4d8be173f9 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_ARM_PROCESSOR_H
-#define __ASM_ARM_PROCESSOR_H
+#ifndef ASM__ARM__PROCESSOR_H
+#define ASM__ARM__PROCESSOR_H
 
 #ifndef __ASSEMBLY__
 #include <xen/types.h>
@@ -616,7 +616,7 @@ register_t get_default_cptr_flags(void);
     } while (0)
 
 #endif /* __ASSEMBLY__ */
-#endif /* __ASM_ARM_PROCESSOR_H */
+#endif /* ASM__ARM__PROCESSOR_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/procinfo.h b/xen/arch/arm/include/asm/procinfo.h
index 3a05f27784..d3b9f7d47c 100644
--- a/xen/arch/arm/include/asm/procinfo.h
+++ b/xen/arch/arm/include/asm/procinfo.h
@@ -18,8 +18,8 @@
  * GNU General Public License for more details.
  */
 
-#ifndef __ASM_ARM_PROCINFO_H
-#define __ASM_ARM_PROCINFO_H
+#ifndef ASM__ARM__PROCINFO_H
+#define ASM__ARM__PROCINFO_H
 
 #include <xen/sched.h>
 
diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm/psci.h
index 4780972621..e4e1abbebc 100644
--- a/xen/arch/arm/include/asm/psci.h
+++ b/xen/arch/arm/include/asm/psci.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_PSCI_H__
-#define __ASM_PSCI_H__
+#ifndef ASM__ARM__PSCI_H
+#define ASM__ARM__PSCI_H
 
 #include <asm/smccc.h>
 
@@ -82,7 +82,7 @@ void call_psci_system_reset(void);
 #define PSCI_VERSION(major, minor)          \
     (((major) << PSCI_VERSION_MAJOR_SHIFT) | (minor))
 
-#endif /* __ASM_PSCI_H__ */
+#endif /* ASM__ARM__PSCI_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/regs.h b/xen/arch/arm/include/asm/regs.h
index 0d9f239a77..47a22ef0a4 100644
--- a/xen/arch/arm/include/asm/regs.h
+++ b/xen/arch/arm/include/asm/regs.h
@@ -1,5 +1,5 @@
-#ifndef __ARM_REGS_H__
-#define __ARM_REGS_H__
+#ifndef ASM__ARM__REGS_H
+#define ASM__ARM__REGS_H
 
 #define PSR_MODE_MASK 0x1f
 
@@ -74,7 +74,7 @@ static inline void uint64_to_regpair(register_t *reg0, register_t *reg1,
 
 #endif
 
-#endif /* __ARM_REGS_H__ */
+#endif /* ASM__ARM__REGS_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/scif-uart.h b/xen/arch/arm/include/asm/scif-uart.h
index bce3404898..23f4bfe3fc 100644
--- a/xen/arch/arm/include/asm/scif-uart.h
+++ b/xen/arch/arm/include/asm/scif-uart.h
@@ -18,8 +18,8 @@
  * GNU General Public License for more details.
  */
 
-#ifndef __ASM_ARM_SCIF_UART_H
-#define __ASM_ARM_SCIF_UART_H
+#ifndef ASM__ARM__SCIF_UART_H
+#define ASM__ARM__SCIF_UART_H
 
 /* Register offsets (SCIF) */
 #define SCIF_SCSMR     (0x00)    /* Serial mode register           */
@@ -115,7 +115,7 @@
 #define SCASSR_RDF     (1 << 1)    /* Receive FIFO Data Full */
 #define SCASSR_DR      (1 << 0)    /* Receive Data Ready */
 
-#endif /* __ASM_ARM_SCIF_UART_H */
+#endif /* ASM__ARM__SCIF_UART_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 64c227d171..95ac787e2f 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -1,5 +1,5 @@
-#ifndef __ARM_SETUP_H_
-#define __ARM_SETUP_H_
+#ifndef ASM__ARM__SETUP_H
+#define ASM__ARM__SETUP_H
 
 #include <public/version.h>
 #include <asm/p2m.h>
diff --git a/xen/arch/arm/include/asm/short-desc.h b/xen/arch/arm/include/asm/short-desc.h
index 9652a103c4..4d28e54598 100644
--- a/xen/arch/arm/include/asm/short-desc.h
+++ b/xen/arch/arm/include/asm/short-desc.h
@@ -1,5 +1,5 @@
-#ifndef __ARM_SHORT_DESC_H__
-#define __ARM_SHORT_DESC_H__
+#ifndef ASM__ARM__SHORT_DESC_H
+#define ASM__ARM__SHORT_DESC_H
 
 /*
  * First level translation table descriptor types used by the AArch32
@@ -127,4 +127,4 @@ typedef union {
     short_desc_l2_lpage_t lpg;
 } short_desc_t;
 
-#endif /* __ARM_SHORT_DESC_H__ */
+#endif /* ASM__ARM__SHORT_DESC_H */
diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/smccc.h
index a289c48b7f..6c7735dece 100644
--- a/xen/arch/arm/include/asm/smccc.h
+++ b/xen/arch/arm/include/asm/smccc.h
@@ -13,8 +13,8 @@
  *
  */
 
-#ifndef __ASM_ARM_SMCCC_H__
-#define __ASM_ARM_SMCCC_H__
+#ifndef ASM__ARM__SMCCC_H
+#define ASM__ARM__SMCCC_H
 
 #include <asm/alternative.h>
 #include <asm/cpufeature.h>
@@ -390,7 +390,7 @@ void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs *args,
 #define ARM_SMCCC_RESERVED_RANGE_START  0x0
 #define ARM_SMCCC_RESERVED_RANGE_END    0x0100FFFF
 
-#endif  /* __ASM_ARM_SMCCC_H__ */
+#endif  /* ASM__ARM__SMCCC_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/smp.h b/xen/arch/arm/include/asm/smp.h
index e99a3a3f53..e6c5601596 100644
--- a/xen/arch/arm/include/asm/smp.h
+++ b/xen/arch/arm/include/asm/smp.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_SMP_H
-#define __ASM_SMP_H
+#ifndef ASM__ARM__SMP_H
+#define ASM__ARM__SMP_H
 
 #ifndef __ASSEMBLY__
 #include <xen/cpumask.h>
diff --git a/xen/arch/arm/include/asm/spinlock.h b/xen/arch/arm/include/asm/spinlock.h
index 42b0f584fe..b1fd46336f 100644
--- a/xen/arch/arm/include/asm/spinlock.h
+++ b/xen/arch/arm/include/asm/spinlock.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_SPINLOCK_H
-#define __ASM_SPINLOCK_H
+#ifndef ASM__ARM__SPINLOCK_H
+#define ASM__ARM__SPINLOCK_H
 
 #define arch_lock_acquire_barrier() smp_mb()
 #define arch_lock_release_barrier() smp_mb()
@@ -12,4 +12,4 @@
 
 #define arch_lock_signal_wmb()  arch_lock_signal()
 
-#endif /* __ASM_SPINLOCK_H */
+#endif /* ASM__ARM__SPINLOCK_H */
diff --git a/xen/arch/arm/include/asm/static-evtchn.h b/xen/arch/arm/include/asm/static-evtchn.h
index f964522f6a..5f7916f2ac 100644
--- a/xen/arch/arm/include/asm/static-evtchn.h
+++ b/xen/arch/arm/include/asm/static-evtchn.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#ifndef __ASM_STATIC_EVTCHN_H_
-#define __ASM_STATIC_EVTCHN_H_
+#ifndef ASM__ARM__STATIC_EVTCHN_H
+#define ASM__ARM__STATIC_EVTCHN_H
 
 #ifdef CONFIG_STATIC_EVTCHN
 
@@ -13,7 +13,7 @@ static inline void alloc_static_evtchn(void) {};
 
 #endif /* CONFIG_STATIC_EVTCHN */
 
-#endif /* __ASM_STATIC_EVTCHN_H_ */
+#endif /* ASM__ARM__STATIC_EVTCHN_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/static-memory.h b/xen/arch/arm/include/asm/static-memory.h
index 804166e541..654d47eb77 100644
--- a/xen/arch/arm/include/asm/static-memory.h
+++ b/xen/arch/arm/include/asm/static-memory.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#ifndef __ASM_STATIC_MEMORY_H_
-#define __ASM_STATIC_MEMORY_H_
+#ifndef ASM__ARM__STATIC_MEMORY_H
+#define ASM__ARM__STATIC_MEMORY_H
 
 #include <xen/pfn.h>
 #include <asm/kernel.h>
@@ -46,7 +46,7 @@ static inline void init_staticmem_pages(void) {};
 
 #endif /* CONFIG_STATIC_MEMORY */
 
-#endif /* __ASM_STATIC_MEMORY_H_ */
+#endif /* ASM__ARM__STATIC_MEMORY_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/static-shmem.h b/xen/arch/arm/include/asm/static-shmem.h
index fd0867c4f2..5e9b69d66f 100644
--- a/xen/arch/arm/include/asm/static-shmem.h
+++ b/xen/arch/arm/include/asm/static-shmem.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#ifndef __ASM_STATIC_SHMEM_H_
-#define __ASM_STATIC_SHMEM_H_
+#ifndef ASM__ARM__STATIC_SHMEM_H
+#define ASM__ARM__STATIC_SHMEM_H
 
 #include <xen/types.h>
 #include <asm/kernel.h>
@@ -106,7 +106,7 @@ static inline void shm_mem_node_fill_reg_range(const struct kernel_info *kinfo,
 
 #endif /* CONFIG_STATIC_SHM */
 
-#endif /* __ASM_STATIC_SHMEM_H_ */
+#endif /* ASM__ARM__STATIC_SHMEM_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/string.h b/xen/arch/arm/include/asm/string.h
index b485e49044..8cbcfca3f8 100644
--- a/xen/arch/arm/include/asm/string.h
+++ b/xen/arch/arm/include/asm/string.h
@@ -1,5 +1,5 @@
-#ifndef __ARM_STRING_H__
-#define __ARM_STRING_H__
+#ifndef ASM__ARM__STRING_H
+#define ASM__ARM__STRING_H
 
 
 /*
@@ -42,7 +42,7 @@ void __memzero(void *ptr, size_t n);
 
 #endif
 
-#endif /* __ARM_STRING_H__ */
+#endif /* ASM__ARM__STRING_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/sysregs.h b/xen/arch/arm/include/asm/sysregs.h
index 61e30c9e51..98523e96d3 100644
--- a/xen/arch/arm/include/asm/sysregs.h
+++ b/xen/arch/arm/include/asm/sysregs.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_ARM_SYSREGS_H
-#define __ASM_ARM_SYSREGS_H
+#ifndef ASM__ARM__SYSREGS_H
+#define ASM__ARM__SYSREGS_H
 
 #if defined(CONFIG_ARM_32)
 # include <asm/arm32/sysregs.h>
@@ -33,7 +33,7 @@ static inline register_t read_sysreg_par(void)
 
 #endif /*  !__ASSEMBLY__  */
 
-#endif /* __ASM_ARM_SYSREGS_H */
+#endif /* ASM__ARM__SYSREGS_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/system.h b/xen/arch/arm/include/asm/system.h
index 65d5c8e423..e69340c71b 100644
--- a/xen/arch/arm/include/asm/system.h
+++ b/xen/arch/arm/include/asm/system.h
@@ -1,6 +1,6 @@
 /* Portions taken from Linux arch arm */
-#ifndef __ASM_SYSTEM_H
-#define __ASM_SYSTEM_H
+#ifndef ASM__ARM__SYSTEM_H
+#define ASM__ARM__SYSTEM_H
 
 #include <xen/lib.h>
 #include <public/arch-arm.h>
diff --git a/xen/arch/arm/include/asm/tee/ffa.h b/xen/arch/arm/include/asm/tee/ffa.h
index 24cd4d99c8..ef7b21840a 100644
--- a/xen/arch/arm/include/asm/tee/ffa.h
+++ b/xen/arch/arm/include/asm/tee/ffa.h
@@ -7,8 +7,8 @@
  * Copyright (C) 2023  Linaro Limited
  */
 
-#ifndef __ASM_ARM_TEE_FFA_H__
-#define __ASM_ARM_TEE_FFA_H__
+#ifndef ASM__ARM__TEE__FFA_H
+#define ASM__ARM__TEE__FFA_H
 
 #include <xen/const.h>
 
@@ -31,4 +31,4 @@ static inline bool is_ffa_fid(uint32_t fid)
 #define FFA_NR_FUNCS    0
 #endif
 
-#endif /*__ASM_ARM_TEE_FFA_H__*/
+#endif /*ASM__ARM__TEE__FFA_H*/
diff --git a/xen/arch/arm/include/asm/tee/optee_msg.h b/xen/arch/arm/include/asm/tee/optee_msg.h
index fe743dbde3..ec2d267981 100644
--- a/xen/arch/arm/include/asm/tee/optee_msg.h
+++ b/xen/arch/arm/include/asm/tee/optee_msg.h
@@ -2,8 +2,8 @@
 /*
  * Copyright (c) 2015-2017, Linaro Limited
  */
-#ifndef _OPTEE_MSG_H
-#define _OPTEE_MSG_H
+#ifndef ASM__ARM__TEE__OPTEE_MSG_H
+#define ASM__ARM__TEE__OPTEE_MSG_H
 
 #include <xen/bitops.h>
 #include <xen/types.h>
@@ -307,4 +307,4 @@ struct optee_msg_arg {
 #define OPTEE_MSG_CMD_UNREGISTER_SHM	5
 #define OPTEE_MSG_FUNCID_CALL_WITH_ARG	0x0004
 
-#endif /* _OPTEE_MSG_H */
+#endif /* ASM__ARM__TEE__OPTEE_MSG_H */
diff --git a/xen/arch/arm/include/asm/tee/optee_rpc_cmd.h b/xen/arch/arm/include/asm/tee/optee_rpc_cmd.h
index d6b9dfe30c..891d23be6a 100644
--- a/xen/arch/arm/include/asm/tee/optee_rpc_cmd.h
+++ b/xen/arch/arm/include/asm/tee/optee_rpc_cmd.h
@@ -3,8 +3,8 @@
  * Copyright (c) 2016-2017, Linaro Limited
  */
 
-#ifndef __OPTEE_RPC_CMD_H
-#define __OPTEE_RPC_CMD_H
+#ifndef ASM__ARM__TEE__OPTEE_RPC_CMD_H
+#define ASM__ARM__TEE__OPTEE_RPC_CMD_H
 
 /*
  * All RPC is done with a struct optee_msg_arg as bearer of information,
@@ -315,4 +315,4 @@
 
 /* End of definition of protocol for command OPTEE_RPC_CMD_SOCKET */
 
-#endif /*__OPTEE_RPC_CMD_H*/
+#endif /*ASM__ARM__TEE__OPTEE_RPC_CMD_H*/
diff --git a/xen/arch/arm/include/asm/tee/optee_smc.h b/xen/arch/arm/include/asm/tee/optee_smc.h
index 2f5c702326..6e0bde66d6 100644
--- a/xen/arch/arm/include/asm/tee/optee_smc.h
+++ b/xen/arch/arm/include/asm/tee/optee_smc.h
@@ -2,8 +2,8 @@
 /*
  * Copyright (c) 2015, Linaro Limited
  */
-#ifndef OPTEE_SMC_H
-#define OPTEE_SMC_H
+#ifndef ASM__ARM__TEE__OPTEE_SMC_H
+#define ASM__ARM__TEE__OPTEE_SMC_H
 
 /*
  * This file is exported by OP-TEE and is in kept in sync between secure
@@ -564,4 +564,4 @@
 	((((ret) & OPTEE_SMC_RETURN_RPC_PREFIX_MASK) == \
 		OPTEE_SMC_RETURN_RPC_PREFIX)))
 
-#endif /* OPTEE_SMC_H */
+#endif /* ASM__ARM__TEE__OPTEE_SMC_H */
diff --git a/xen/arch/arm/include/asm/tee/tee.h b/xen/arch/arm/include/asm/tee/tee.h
index 0169fd746b..58659290d6 100644
--- a/xen/arch/arm/include/asm/tee/tee.h
+++ b/xen/arch/arm/include/asm/tee/tee.h
@@ -11,8 +11,8 @@
  * published by the Free Software Foundation.
  */
 
-#ifndef __ARCH_ARM_TEE_TEE_H__
-#define __ARCH_ARM_TEE_TEE_H__
+#ifndef ASM__ARM__TEE__TEE_H
+#define ASM__ARM__TEE__TEE_H
 
 #include <xen/lib.h>
 #include <xen/types.h>
@@ -121,7 +121,7 @@ static inline void tee_free_domain_ctx(struct domain *d)
 
 #endif  /* CONFIG_TEE */
 
-#endif /* __ARCH_ARM_TEE_TEE_H__ */
+#endif /* ASM__ARM__TEE__TEE_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/time.h b/xen/arch/arm/include/asm/time.h
index 49ad8c1a6d..d4301ea852 100644
--- a/xen/arch/arm/include/asm/time.h
+++ b/xen/arch/arm/include/asm/time.h
@@ -1,5 +1,5 @@
-#ifndef __ARM_TIME_H__
-#define __ARM_TIME_H__
+#ifndef ASM__ARM__TIME_H
+#define ASM__ARM__TIME_H
 
 #include <asm/sysregs.h>
 #include <asm/system.h>
@@ -108,7 +108,7 @@ void preinit_xen_time(void);
 
 void force_update_vcpu_system_time(struct vcpu *v);
 
-#endif /* __ARM_TIME_H__ */
+#endif /* ASM__ARM__TIME_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/traps.h b/xen/arch/arm/include/asm/traps.h
index 9a60dbf70e..2a935a9afb 100644
--- a/xen/arch/arm/include/asm/traps.h
+++ b/xen/arch/arm/include/asm/traps.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_ARM_TRAPS__
-#define __ASM_ARM_TRAPS__
+#ifndef ASM__ARM__TRAPS_H
+#define ASM__ARM__TRAPS_H
 
 #include <asm/hsr.h>
 #include <asm/processor.h>
@@ -118,7 +118,7 @@ static inline register_t sign_extend(const struct hsr_dabt dabt, register_t r)
 
 void finalize_instr_emulation(const struct instr_details *instr);
 
-#endif /* __ASM_ARM_TRAPS__ */
+#endif /* ASM__ARM__TRAPS_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/types.h b/xen/arch/arm/include/asm/types.h
index b0a34ea730..28e55890dc 100644
--- a/xen/arch/arm/include/asm/types.h
+++ b/xen/arch/arm/include/asm/types.h
@@ -1,5 +1,5 @@
-#ifndef __ARM_TYPES_H__
-#define __ARM_TYPES_H__
+#ifndef ASM__ARM__TYPES_H
+#define ASM__ARM__TYPES_H
 
 #if defined(CONFIG_ARM_32)
 
@@ -37,7 +37,7 @@ typedef u64 register_t;
 
 #endif
 
-#endif /* __ARM_TYPES_H__ */
+#endif /* ASM__ARM__TYPES_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/vfp.h b/xen/arch/arm/include/asm/vfp.h
index 142a91ef8b..b7cc2ba906 100644
--- a/xen/arch/arm/include/asm/vfp.h
+++ b/xen/arch/arm/include/asm/vfp.h
@@ -1,5 +1,5 @@
-#ifndef _ASM_VFP_H
-#define _ASM_VFP_H
+#ifndef ASM__ARM__VFP_H
+#define ASM__ARM__VFP_H
 
 struct vcpu;
 
@@ -14,7 +14,7 @@ struct vcpu;
 void vfp_save_state(struct vcpu *v);
 void vfp_restore_state(struct vcpu *v);
 
-#endif /* _ASM_VFP_H */
+#endif /* ASM__ARM__VFP_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/vgic-emul.h b/xen/arch/arm/include/asm/vgic-emul.h
index fd0cfa2175..cf3670a6cd 100644
--- a/xen/arch/arm/include/asm/vgic-emul.h
+++ b/xen/arch/arm/include/asm/vgic-emul.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_ARM_VGIC_EMUL_H__
-#define __ASM_ARM_VGIC_EMUL_H__
+#ifndef ASM__ARM__VGIC_EMUL_H
+#define ASM__ARM__VGIC_EMUL_H
 
 /*
  * Helpers to create easily a case to match emulate a single register or
@@ -21,7 +21,7 @@ static inline bool vgic_reg64_check_access(struct hsr_dabt dabt)
     return ( dabt.size == DABT_DOUBLE_WORD || dabt.size == DABT_WORD );
 }
 
-#endif /* __ASM_ARM_VGIC_EMUL_H__ */
+#endif /* ASM__ARM__VGIC_EMUL_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgic.h
index e309dca1ad..bb1e45554a 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -15,8 +15,8 @@
  * GNU General Public License for more details.
  */
 
-#ifndef __ASM_ARM_VGIC_H__
-#define __ASM_ARM_VGIC_H__
+#ifndef ASM__ARM__VGIC_H
+#define ASM__ARM__VGIC_H
 
 #ifdef CONFIG_NEW_VGIC
 #include <asm/new_vgic.h>
@@ -388,7 +388,7 @@ void vgic_sync_from_lrs(struct vcpu *v);
 
 int vgic_vcpu_pending_irq(struct vcpu *v);
 
-#endif /* __ASM_ARM_VGIC_H__ */
+#endif /* ASM__ARM__VGIC_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/vpl011.h b/xen/arch/arm/include/asm/vpl011.h
index c09abcd7a9..bbfa5661d9 100644
--- a/xen/arch/arm/include/asm/vpl011.h
+++ b/xen/arch/arm/include/asm/vpl011.h
@@ -16,8 +16,8 @@
  * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef _VPL011_H_
-#define _VPL011_H_
+#ifndef ASM__ARM__VPL011_H
+#define ASM__ARM__VPL011_H
 
 #include <public/domctl.h>
 #include <public/io/ring.h>
@@ -79,7 +79,7 @@ static inline int domain_vpl011_init(struct domain *d,
 
 static inline void domain_vpl011_deinit(struct domain *d) { }
 #endif
-#endif  /* _VPL011_H_ */
+#endif  /* ASM__ARM__VPL011_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/vpsci.h b/xen/arch/arm/include/asm/vpsci.h
index 0cca5e6830..fc158d827e 100644
--- a/xen/arch/arm/include/asm/vpsci.h
+++ b/xen/arch/arm/include/asm/vpsci.h
@@ -17,8 +17,8 @@
  * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef __ASM_VPSCI_H__
-#define __ASM_VPSCI_H__
+#ifndef ASM__ARM__VPSCI_H
+#define ASM__ARM__VPSCI_H
 
 #include <asm/psci.h>
 
@@ -29,7 +29,7 @@
 bool do_vpsci_0_1_call(struct cpu_user_regs *regs, uint32_t fid);
 bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid);
 
-#endif /* __ASM_VPSCI_H__ */
+#endif /* ASM__ARM__VPSCI_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/vreg.h b/xen/arch/arm/include/asm/vreg.h
index 387ce76e7e..97b9d71066 100644
--- a/xen/arch/arm/include/asm/vreg.h
+++ b/xen/arch/arm/include/asm/vreg.h
@@ -1,8 +1,8 @@
 /*
  * Helpers to emulate co-processor and system registers
  */
-#ifndef __ASM_ARM_VREG__
-#define __ASM_ARM_VREG__
+#ifndef ASM__ARM__VREG_H
+#define ASM__ARM__VREG_H
 
 typedef bool (*vreg_reg64_fn_t)(struct cpu_user_regs *regs, uint64_t *r,
                                    bool read);
@@ -145,4 +145,4 @@ VREG_REG_HELPERS(32, 0x3)
 
 #undef VREG_REG_HELPERS
 
-#endif /* __ASM_ARM_VREG__ */
+#endif /* ASM__ARM__VREG_H */
diff --git a/xen/arch/arm/include/asm/vtimer.h b/xen/arch/arm/include/asm/vtimer.h
index 9d4fb4c6e8..a2c54d000b 100644
--- a/xen/arch/arm/include/asm/vtimer.h
+++ b/xen/arch/arm/include/asm/vtimer.h
@@ -17,8 +17,8 @@
  * GNU General Public License for more details.
  */
 
-#ifndef __ARCH_ARM_VTIMER_H__
-#define __ARCH_ARM_VTIMER_H__
+#ifndef ASM__ARM__VTIMER_H
+#define ASM__ARM__VTIMER_H
 
 extern int domain_vtimer_init(struct domain *d,
                               struct xen_arch_domainconfig *config);
diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
index 7c6b06f686..b32f4a21a2 100644
--- a/xen/arch/arm/tee/ffa_private.h
+++ b/xen/arch/arm/tee/ffa_private.h
@@ -3,8 +3,8 @@
  * Copyright (C) 2023  Linaro Limited
  */
 
-#ifndef __FFA_PRIVATE_H__
-#define __FFA_PRIVATE_H__
+#ifndef ARM__TEE__FFA_PRIVATE_H
+#define ARM__TEE__FFA_PRIVATE_H
 
 #include <xen/const.h>
 #include <xen/sizes.h>
@@ -398,4 +398,4 @@ static inline int32_t ffa_rx_release(void)
     return ffa_simple_call(FFA_RX_RELEASE, 0, 0, 0, 0);
 }
 
-#endif /*__FFA_PRIVATE_H__*/
+#endif /*ARM__TEE__FFA_PRIVATE_H*/
diff --git a/xen/arch/arm/vgic/vgic-mmio.h b/xen/arch/arm/vgic/vgic-mmio.h
index 3566cf237c..1bbcb778e9 100644
--- a/xen/arch/arm/vgic/vgic-mmio.h
+++ b/xen/arch/arm/vgic/vgic-mmio.h
@@ -13,8 +13,8 @@
  * You should have received a copy of the GNU General Public License
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
-#ifndef __XEN_ARM_VGIC_VGIC_MMIO_H__
-#define __XEN_ARM_VGIC_VGIC_MMIO_H__
+#ifndef ARM__VGIC__VGIC_MMIO_H
+#define ARM__VGIC__VGIC_MMIO_H
 
 struct vgic_register_region {
     unsigned int reg_offset;
diff --git a/xen/arch/arm/vgic/vgic.h b/xen/arch/arm/vgic/vgic.h
index 534b24bcd3..3cb5e37077 100644
--- a/xen/arch/arm/vgic/vgic.h
+++ b/xen/arch/arm/vgic/vgic.h
@@ -14,8 +14,8 @@
  * You should have received a copy of the GNU General Public License
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
-#ifndef __XEN_ARM_VGIC_VGIC_H__
-#define __XEN_ARM_VGIC_VGIC_H__
+#ifndef ARM__VGIC__VGIC_H
+#define ARM__VGIC__VGIC_H
 
 /*
  * We piggy-back on the already used KVM product ID,  but use a different
diff --git a/xen/arch/arm/vpci.h b/xen/arch/arm/vpci.h
index 3c713f3fcd..8d01a7c006 100644
--- a/xen/arch/arm/vpci.h
+++ b/xen/arch/arm/vpci.h
@@ -12,8 +12,8 @@
  * GNU General Public License for more details.
  */
 
-#ifndef __ARCH_ARM_VPCI_H__
-#define __ARCH_ARM_VPCI_H__
+#ifndef ARM__VPCI_H
+#define ARM__VPCI_H
 
 #ifdef CONFIG_HAS_VPCI
 int domain_vpci_init(struct domain *d);
@@ -30,7 +30,7 @@ static inline unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
 }
 #endif
 
-#endif /* __ARCH_ARM_VPCI_H__ */
+#endif /* ARM__VPCI_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/vuart.h b/xen/arch/arm/vuart.h
index e90d84c6ed..697cb0225d 100644
--- a/xen/arch/arm/vuart.h
+++ b/xen/arch/arm/vuart.h
@@ -17,8 +17,8 @@
  * GNU General Public License for more details.
  */
 
-#ifndef __ARCH_ARM_VUART_H__
-#define __ARCH_ARM_VUART_H__
+#ifndef ARM__VUART_H
+#define ARM__VUART_H
 
 struct domain;
 
@@ -42,7 +42,7 @@ static inline void domain_vuart_free(struct domain *d) {};
 
 #endif /* CONFIG_HWDOM_VUART */
 
-#endif /* __ARCH_ARM_VUART_H__ */
+#endif /* ARM__VUART_H */
 
 /*
  * Local variables:
diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthrough/arm/smmu-v3.h
index f09048812c..d104588aea 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.h
+++ b/xen/drivers/passthrough/arm/smmu-v3.h
@@ -5,8 +5,8 @@
  * Copyright (C) 2022 ARM Limited
  */
 
-#ifndef _ARM_SMMU_V3_H
-#define _ARM_SMMU_V3_H
+#ifndef DRIVERS__PASSTHROUGH__ARM__SMMU_V3_H
+#define DRIVERS__PASSTHROUGH__ARM__SMMU_V3_H
 
 /* MMIO registers */
 #define ARM_SMMU_IDR0			0x0
@@ -668,4 +668,4 @@ struct arm_smmu_domain {
 	spinlock_t			devices_lock;
 };
 
-#endif /* _ARM_SMMU_V3_H */
+#endif /* DRIVERS__PASSTHROUGH__ARM__SMMU_V3_H */
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index e2412a1747..65dac78ce1 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -7,8 +7,8 @@
  * Copyright 2011 (C) Citrix Systems
  */
 
-#ifndef __XEN_PUBLIC_ARCH_ARM_H__
-#define __XEN_PUBLIC_ARCH_ARM_H__
+#ifndef PUBLIC__ARCH_ARM_H
+#define PUBLIC__ARCH_ARM_H
 
 /*
  * `incontents 50 arm_abi Hypercall Calling Convention
@@ -542,7 +542,7 @@ typedef uint64_t xen_callback_t;
 typedef struct xen_pmu_arch { uint8_t dummy; } xen_pmu_arch_t;
 #endif
 
-#endif /*  __XEN_PUBLIC_ARCH_ARM_H__ */
+#endif /*  PUBLIC__ARCH_ARM_H */
 
 /*
  * Local variables:
diff --git a/xen/include/public/arch-arm/hvm/save.h b/xen/include/public/arch-arm/hvm/save.h
index fc1b28f59b..77ebe54aee 100644
--- a/xen/include/public/arch-arm/hvm/save.h
+++ b/xen/include/public/arch-arm/hvm/save.h
@@ -6,8 +6,8 @@
  * Copyright (c) 2012 Citrix Systems Ltd.
  */
 
-#ifndef __XEN_PUBLIC_HVM_SAVE_ARM_H__
-#define __XEN_PUBLIC_HVM_SAVE_ARM_H__
+#ifndef PUBLIC__ARCH_ARM__HVM__SAVE_H
+#define PUBLIC__ARCH_ARM__HVM__SAVE_H
 
 #endif
 
diff --git a/xen/include/public/arch-arm/smccc.h b/xen/include/public/arch-arm/smccc.h
index 8a9321ebed..774f8c6987 100644
--- a/xen/include/public/arch-arm/smccc.h
+++ b/xen/include/public/arch-arm/smccc.h
@@ -7,8 +7,8 @@
  * Copyright 2017 (C) EPAM Systems
  */
 
-#ifndef __XEN_PUBLIC_ARCH_ARM_SMCCC_H__
-#define __XEN_PUBLIC_ARCH_ARM_SMCCC_H__
+#ifndef PUBLIC__ARCH_ARM__SMCCC_H
+#define PUBLIC__ARCH_ARM__SMCCC_H
 
 #include "public/xen.h"
 
@@ -37,7 +37,7 @@
 #define SSSC_SMCCC_UID XEN_DEFINE_UUID(0xf863386fU, 0x4b39, 0x4cbd, 0x9220,\
                                        0xce, 0x16, 0x41, 0xe5, 0x9f, 0x6f)
 
-#endif /* __XEN_PUBLIC_ARCH_ARM_SMCCC_H__ */
+#endif /* PUBLIC__ARCH_ARM__SMCCC_H */
 
 /*
  * Local variables:
-- 
2.34.1


