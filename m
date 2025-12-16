Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0989CC476C
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 17:56:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188143.1509391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVYKx-0006vM-TO; Tue, 16 Dec 2025 16:55:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188143.1509391; Tue, 16 Dec 2025 16:55:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVYKx-0006u9-PT; Tue, 16 Dec 2025 16:55:47 +0000
Received: by outflank-mailman (input) for mailman id 1188143;
 Tue, 16 Dec 2025 16:55:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wcum=6W=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vVYKx-0006gk-4g
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 16:55:47 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f3105b3-daa0-11f0-9cce-f158ae23cfc8;
 Tue, 16 Dec 2025 17:55:43 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b79ea617f55so372279966b.3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Dec 2025 08:55:43 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8003cb349csm63169766b.68.2025.12.16.08.55.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 08:55:42 -0800 (PST)
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
X-Inumbo-ID: 0f3105b3-daa0-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765904143; x=1766508943; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dZegd6aXaLBRkNeMFMoN/ND2IHAaan6sTyPeWinaod4=;
        b=LQ0huGgF8wCp5i2uPXcUdbd5RPmm0DW6ViZt2qFSbIDFXsajGOzEBy9p26ea05TIzR
         TLnIYNrnY6OLzLaTfttoOdPhBHlm183QwGgT68Iulg8JR8ZWlQmnn4ItVk7F8NJbAOR8
         BnNd5dh6BM3NT/kqpv3HDJGe25LogfdI99/73H4bZO4eNOzX1SznAFSkRLUtBVCsySK6
         whYQoKHw4SwA8PuyWB8S/d/YoitRFSOoL5l9GsZmF8pM20L9GPdNK87w0ZUkNYWX5Y+s
         Uj7Rd1caDSP3v1EEB2D3hNrS2sHCIeLsM/vdmZkAc9dSbcS7NCfCmYfbCX5Q/APwQ1qm
         hQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765904143; x=1766508943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dZegd6aXaLBRkNeMFMoN/ND2IHAaan6sTyPeWinaod4=;
        b=JxiGslUzQ9OQPmNzcdqwPHZ6+U99EAU6mr7rNDE5vOn7pIKOmQainOyith2Of0OoJi
         ehk9MBWd6cu0+omGGTzygEB6kWilPNUfB234twsWo5+kCO1oey1s+1jegaQZ2bV7EIBj
         IxS0FhlwLdfB/qwGDAQLXm3rKfdSQtPiUv5oNaWXCXgdELRoc/dHjLaKGhNsFr7QNWEP
         fCGY9uvm2Z3rqW3NGAFOyNIYLuJkOoeyMVdO2McJ2nsExebXq7dNh3UrZ+TLS0MCNEDk
         j2yRJYmTZuMw8j75IaO12p1OQMPuH0KnXqli4jserGd59cmVezpBOz+D3ralYKEOsQdH
         bIjg==
X-Gm-Message-State: AOJu0Yyajb7U3oTUVKrORh9zW1yNUVa1h0XHaKaQhE2kbp+/hem42q3e
	dlY5e06kIPdQ0BSWiTEZzQCEPRITfbjDcS5ldaXenUs6n0lzmtl+Qpl2tDKbyg==
X-Gm-Gg: AY/fxX4N+lE22qXGUImkUNyHzXdocOLVONij6OZT2BFJ3jcZ/OKrNaA4W359VUArmer
	IEwtoLXsIyLctN8oN6WrnsYS17JWzqtU0eeZqcW02BpZXkm5Yytw45r03A2OSjdo72HJgIgYb1y
	ky1yCwLxLlapc5wsgzh+aie85Qg3AceAl8Tjfl4/2x5pCTLjleDchhAQukzdG9MjU92/oyAX+l/
	jHgFNylCFwB26SNubzrfuuWzDYlePNxkR/lozPdmEoThRNnjCqnDu2udfAx4+NlMdlUZUQ+gfK1
	2NQPUFJpd86YBqcSJpny39UGDsz1HPQ2hRZqk6zI2fxqnzloTLBj140HafV7pTt6hl8ZRdL9WnU
	zHeVq+aY8Mos2Znh0tbifjU0EZqF1mXN0YfDbk6sNyl8/0Q2i2m4YPA/MxBL/mUJSASYZ1y7AId
	3wSBmDP27LhFd9FoE9jZ+CtJ/O6To/4dgF32EJMkD5P5ePNdxw4Zrz198roFj+6w==
X-Google-Smtp-Source: AGHT+IH3DGz5GXtrkhcYsGxJ0b6IyRxNosABDTpAkHu0Tw3UPS3EMFoBU/qYVHt8cuGlW2ZETNJHUg==
X-Received: by 2002:a17:907:2d1f:b0:b7d:11b0:31ca with SMTP id a640c23a62f3a-b7d23bbf1e8mr1461635966b.65.1765904142320;
        Tue, 16 Dec 2025 08:55:42 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v7 01/19] xen/riscv: detect and initialize G-stage mode
Date: Tue, 16 Dec 2025 17:55:11 +0100
Message-ID: <497b52495e108ae2a89952b8b430d865f0bea4d3.1765879052.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1765879052.git.oleksii.kurochko@gmail.com>
References: <cover.1765879052.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce gstage_mode_detect() and guest_mm_init() to probe supported
G-stage paging modes at boot. The function iterates over possible
HGATP modes (Sv32x4 on RV32, Sv39x4/Sv48x4/Sv57x4 on RV64) and selects
the largest supported MMU translation address mode by programming
CSR_HGATP and reading it back.

The selected mode is stored in max_gstage_mode (marked __ro_after_init)
and reported via printk. If no supported mode is found, Xen panics
since Bare mode is not expected to be used.

Finally, CSR_HGATP is cleared and a local_hfence_gvma_all() is issued
to avoid any potential speculative pollution of the TLB, as required
by the RISC-V spec.

The following issue starts to occur:
 ./<riscv>/asm/flushtlb.h:37:55: error: 'struct page_info'  declared inside
   parameter list will not be visible outside of this definition or
   declaration [-Werror]
 37 | static inline void page_set_tlbflush_timestamp(struct page_info *page)
To resolve it, forward declaration of struct page_info is added to
<asm/flushtlb.h.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V7:
 - Move mode_idx declaration into the for loop header.
 - Use single struct assignment instead of assignment of each field of struct
   gstage_mode_desc.
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in V6:
 - Sort items properly in riscv/Makefile.
 - Move the  call of local_hfence_gvma_all() from gstage_mode_detect()
   to pre_gstage_init() to avoid a redundancy when vmid_init() will be
   introduced.
 - Rename pre_gstage_init() to more generic name guest_mm_init().
 - s/gstage_mode/max_gstage_mode
 - Reverse direction of gstage mode detection to find a maximum supported mode to understand what modes are supported. (lower modes are supported automatically)
 - Introduce struct gstage_mode_desc.
 - Introduce get_max_supported_mode().
---
Changes in V5:
 - Add static and __initconst for local variable modes[] in
   gstage_mode_detect().
 - Change type for gstage_mode from 'unsigned long' to 'unsigned char'.
 - Update the comment inisde defintion if modes[] variable in
   gstage_mode_detect():
   - Add information about Bare mode.
   - Drop "a paged virtual-memory scheme described in Section 10.3" as it isn't
     relevant here.
 - Drop printing of function name when chosen G-stage mode message is printed.
 - Drop the call of gstage_mode_detect() from start_xen(). It will be added into
   p2m_init() when the latter will be introduced.
 - Introduce pre_gstage_init().
 - make gstage_mode_detect() static.
---
Changes in V4:
 - New patch.
---
 xen/arch/riscv/Makefile                     |   1 +
 xen/arch/riscv/include/asm/flushtlb.h       |   7 ++
 xen/arch/riscv/include/asm/p2m.h            |   9 ++
 xen/arch/riscv/include/asm/riscv_encoding.h |   5 +
 xen/arch/riscv/p2m.c                        | 102 ++++++++++++++++++++
 xen/arch/riscv/setup.c                      |   3 +
 6 files changed, 127 insertions(+)
 create mode 100644 xen/arch/riscv/p2m.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index d667234949..7b8d0e20e5 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -6,6 +6,7 @@ obj-y += imsic.o
 obj-y += intc.o
 obj-y += irq.o
 obj-y += mm.o
+obj-y += p2m.o
 obj-y += pt.o
 obj-$(CONFIG_RISCV_64) += riscv64/
 obj-y += sbi.o
diff --git a/xen/arch/riscv/include/asm/flushtlb.h b/xen/arch/riscv/include/asm/flushtlb.h
index 51c8f753c5..e70badae0c 100644
--- a/xen/arch/riscv/include/asm/flushtlb.h
+++ b/xen/arch/riscv/include/asm/flushtlb.h
@@ -7,6 +7,13 @@
 
 #include <asm/sbi.h>
 
+struct page_info;
+
+static inline void local_hfence_gvma_all(void)
+{
+    asm volatile ( "hfence.gvma zero, zero" ::: "memory" );
+}
+
 /* Flush TLB of local processor for address va. */
 static inline void flush_tlb_one_local(vaddr_t va)
 {
diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index e43c559e0c..3776b98303 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -8,6 +8,12 @@
 
 #define paddr_bits PADDR_BITS
 
+struct gstage_mode_desc {
+    unsigned char mode;
+    unsigned int paging_levels;
+    char name[8];
+};
+
 /*
  * List of possible type for each page in the p2m entry.
  * The number of available bit per page in the pte for this purpose is 2 bits.
@@ -88,6 +94,9 @@ static inline bool arch_acquire_resource_check(struct domain *d)
     return false;
 }
 
+void guest_mm_init(void);
+unsigned char get_max_supported_mode(void);
+
 #endif /* ASM__RISCV__P2M_H */
 
 /*
diff --git a/xen/arch/riscv/include/asm/riscv_encoding.h b/xen/arch/riscv/include/asm/riscv_encoding.h
index fd27f74cb7..e0a5e8b58b 100644
--- a/xen/arch/riscv/include/asm/riscv_encoding.h
+++ b/xen/arch/riscv/include/asm/riscv_encoding.h
@@ -131,10 +131,13 @@
 #define HGATP_MODE_SV32X4		_UL(1)
 #define HGATP_MODE_SV39X4		_UL(8)
 #define HGATP_MODE_SV48X4		_UL(9)
+#define HGATP_MODE_SV57X4		_UL(10)
 
+#define HGATP32_MODE_MASK		_UL(0x80000000)
 #define HGATP32_VMID_MASK		_UL(0x1FC00000)
 #define HGATP32_PPN_MASK		_UL(0x003FFFFF)
 
+#define HGATP64_MODE_MASK		_ULL(0xF000000000000000)
 #define HGATP64_VMID_MASK		_ULL(0x03FFF00000000000)
 #define HGATP64_PPN_MASK		_ULL(0x00000FFFFFFFFFFF)
 
@@ -164,6 +167,7 @@
 
 #define HGATP_PPN_MASK			HGATP64_PPN_MASK
 #define HGATP_VMID_MASK			HGATP64_VMID_MASK
+#define HGATP_MODE_MASK			HGATP64_MODE_MASK
 #else
 #define MSTATUS_SD			MSTATUS32_SD
 #define SSTATUS_SD			SSTATUS32_SD
@@ -173,6 +177,7 @@
 
 #define HGATP_PPN_MASK			HGATP32_PPN_MASK
 #define HGATP_VMID_MASK			HGATP32_VMID_MASK
+#define HGATP_MODE_MASK			HGATP32_MODE_MASK
 #endif
 
 #define TOPI_IID_SHIFT			16
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
new file mode 100644
index 0000000000..076a1c35b2
--- /dev/null
+++ b/xen/arch/riscv/p2m.c
@@ -0,0 +1,102 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/init.h>
+#include <xen/lib.h>
+#include <xen/macros.h>
+#include <xen/sections.h>
+
+#include <asm/csr.h>
+#include <asm/flushtlb.h>
+#include <asm/p2m.h>
+#include <asm/riscv_encoding.h>
+
+static struct gstage_mode_desc __ro_after_init max_gstage_mode = {
+    .mode = HGATP_MODE_OFF,
+    .paging_levels = 0,
+    .name = "Bare",
+};
+
+unsigned char get_max_supported_mode(void)
+{
+    return max_gstage_mode.mode;
+}
+
+static void __init gstage_mode_detect(void)
+{
+    static const struct gstage_mode_desc modes[] __initconst = {
+        /*
+         * Based on the RISC-V spec:
+         *   Bare mode is always supported, regardless of SXLEN.
+         *   When SXLEN=32, the only other valid setting for MODE is Sv32.
+         *   When SXLEN=64, three paged virtual-memory schemes are defined:
+         *   Sv39, Sv48, and Sv57.
+         */
+#ifdef CONFIG_RISCV_32
+        { HGATP_MODE_SV32X4, 2, "Sv32x4" }
+#else
+        { HGATP_MODE_SV39X4, 3, "Sv39x4" },
+        { HGATP_MODE_SV48X4, 4, "Sv48x4" },
+        { HGATP_MODE_SV57X4, 5, "Sv57x4" },
+#endif
+    };
+
+    for ( unsigned int mode_idx = ARRAY_SIZE(modes); mode_idx-- > 0; )
+    {
+        unsigned long mode = modes[mode_idx].mode;
+
+        csr_write(CSR_HGATP, MASK_INSR(mode, HGATP_MODE_MASK));
+
+        if ( MASK_EXTR(csr_read(CSR_HGATP), HGATP_MODE_MASK) == mode )
+        {
+            max_gstage_mode = modes[mode_idx];
+
+            break;
+        }
+    }
+
+    if ( max_gstage_mode.mode == HGATP_MODE_OFF )
+        panic("Xen expects that G-stage won't be Bare mode\n");
+
+    printk("Max supported G-stage mode is %s\n", max_gstage_mode.name);
+
+    csr_write(CSR_HGATP, 0);
+
+    /* local_hfence_gvma_all() will be called at the end of guest_mm_init. */
+}
+
+void __init guest_mm_init(void)
+{
+    gstage_mode_detect();
+
+    /*
+     * As gstage_mode_detect() is changing CSR_HGATP, it is necessary to flush
+     * guest TLB because:
+     *
+     * From RISC-V spec:
+     *   Speculative executions of the address-translation algorithm behave as
+     *   non-speculative executions of the algorithm do, except that they must
+     *   not set the dirty bit for a PTE, they must not trigger an exception,
+     *   and they must not create address-translation cache entries if those
+     *   entries would have been invalidated by any SFENCE.VMA instruction
+     *   executed by the hart since the speculative execution of the algorithm
+     *   began.
+     *
+     * Also, despite of the fact here it is mentioned that when V=0 two-stage
+     * address translation is inactivated:
+     *   The current virtualization mode, denoted V, indicates whether the hart
+     *   is currently executing in a guest. When V=1, the hart is either in
+     *   virtual S-mode (VS-mode), or in virtual U-mode (VU-mode) atop a guest
+     *   OS running in VS-mode. When V=0, the hart is either in M-mode, in
+     *   HS-mode, or in U-mode atop an OS running in HS-mode. The
+     *   virtualization mode also indicates whether two-stage address
+     *   translation is active (V=1) or inactive (V=0).
+     * But on the same side, writing to hgatp register activates it:
+     *   The hgatp register is considered active for the purposes of
+     *   the address-translation algorithm unless the effective privilege mode
+     *   is U and hstatus.HU=0.
+     *
+     * Thereby it leaves some room for speculation even in this stage of boot,
+     * so it could be that we polluted local TLB so flush all guest TLB.
+     */
+    local_hfence_gvma_all();
+}
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 483cdd7e17..8f46f1a1de 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -22,6 +22,7 @@
 #include <asm/early_printk.h>
 #include <asm/fixmap.h>
 #include <asm/intc.h>
+#include <asm/p2m.h>
 #include <asm/sbi.h>
 #include <asm/setup.h>
 #include <asm/traps.h>
@@ -148,6 +149,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     console_init_postirq();
 
+    guest_mm_init();
+
     printk("All set up\n");
 
     machine_halt();
-- 
2.52.0


