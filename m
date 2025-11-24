Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D51BC807A6
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 13:34:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170565.1495643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVlq-00027N-0Z; Mon, 24 Nov 2025 12:34:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170565.1495643; Mon, 24 Nov 2025 12:34:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVlp-00025L-Oa; Mon, 24 Nov 2025 12:34:17 +0000
Received: by outflank-mailman (input) for mailman id 1170565;
 Mon, 24 Nov 2025 12:34:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sr25=6A=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vNVln-0001zv-Vo
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 12:34:15 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0f46cbc-c931-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 13:34:11 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b762de65c07so169516466b.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 04:34:11 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654cf0435sm1285238866b.4.2025.11.24.04.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 04:34:10 -0800 (PST)
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
X-Inumbo-ID: e0f46cbc-c931-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763987651; x=1764592451; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3RCKGWT544iZvii9cfCS03IWRBChEzAZnQqMhakSVtY=;
        b=dHTlksm5U36qwvrf/Qhmr8O4J98qkttAwtcjR71sUXK/bwXi0a7NBl2xwSBmJhqlGo
         RreLlTHbpmFgA2omw2yJN2M4WTFSEAOE04OehFerb6xWIEQGyqBfhyKV3/5nixJ5XbRW
         YDUnDg5na7RNP7jxgj+ATSj8AjyfGWmwY+FqKzD7zYzWwA/FgKpXBbfyFZQxwGk0eKN2
         NSdGbxFOdsj0bc0uN2oqvceJ0FQwCxQYrqUu5b2dLN5G6GM/BlXorCV+WEhmAvVtzwsg
         wNOttcH8wll7y6e6qhQtiklu2WJxt1CHVa5l6tKwftyayMGFWv6eOaDanZkDbfIekCu4
         xSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763987651; x=1764592451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3RCKGWT544iZvii9cfCS03IWRBChEzAZnQqMhakSVtY=;
        b=ufGtc/oTp6G1U4sxlaQ1OVBnX+jR+UL/0RiyzEzlv0LUbXpu8ZD2igs6zGYHuJj0x8
         VySh+yk+Pjldo/yMAUjq+g9z02azW8fFGTqXf9fn3Jn/logEoOO6J4LGmPH54UWH2jHb
         LK+x63DxC9+dizHa683i2BTpKwiv0A3Zq9EGYAnBuobxEd/4JJaAKJs50dFdSZPgYrlh
         dSOxTt2c1NMFuGbu+4slfjyCHGOeYJGxh5wifRNBUQf2EijjH64aDeA6xlhgc6GXKLD1
         5C+2Owp+W/ApER3+Vn+73tYmBO2PKSxe/BfWHVlQHGQWTxDAkHSpd7277tI3o3CFH0r9
         sUnw==
X-Gm-Message-State: AOJu0Yy1zHHE/gSEoy67RTEVjByGUAnON59o5gQReMOVCJAByba2xRcN
	UsVywW/9KoL41XJAyGoiz2+sTNU/CmuGaCuhNsAcWcC/legTG3njCfr7TNY+9aSQ
X-Gm-Gg: ASbGnctc+sasCc9EpRkU53kCjrDo+eHaZXPeecSJrlYlXOu8sgd7eyKBDHe0n4o1vcL
	8bjEpvthJLS0bmnOxK5uC4IHWEQ9EYIEPjIM5koOSbjMcYdUBoz04pp/vQD71pW0BXBLCpzOwnO
	9mS8EHt76u0nxq/Iom8JSzFwCkIWcWsKSc+dh2y13Yaj06IlOQyH4yUoSgY6v/xVZ4KkAIEBwWV
	PZzZQZVuXXL5m32FzezmwwVnOOxfA8aQdxTLHW5Z0fCBxDTuSQlRPIDpaN7wEbcrJzQWcmnZo2u
	W7WsHwMY+xugDxyrPZoum8OSZs+CgJ690uqC2QRXel+m4LiuWryuytUKx3xBUzn4eFgtyj+7CWY
	y3x4KoGd56K0Z/DNbxI03VdYW0bGWcomaZtwZTR4tVdnCJOVhSA/hbUie+qKBJZ9dMRICH1A5By
	HMUy0Yw2AxpJAjBL4VpMkB+ALazwfCFEXKGzos8b9VKcTTXQea3uw0TrQ=
X-Google-Smtp-Source: AGHT+IH3PLCXYIO0jAk8S7WX9bfyfACIHvlNvFZJli4IUOuVxlNTj2b8s1+3Ok+xi+xRuUe4Jx9h1A==
X-Received: by 2002:a17:906:b7ca:b0:b76:74b6:da78 with SMTP id a640c23a62f3a-b7674b6db1fmr872029766b.35.1763987650379;
        Mon, 24 Nov 2025 04:34:10 -0800 (PST)
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
Subject: [PATCH v6 02/19] xen/riscv: detect and initialize G-stage mode
Date: Mon, 24 Nov 2025 13:33:35 +0100
Message-ID: <0e32a6bd86828952d7494b8d49b48d512f53cada.1763986955.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <cover.1763986955.git.oleksii.kurochko@gmail.com>
References: <cover.1763986955.git.oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/p2m.c                        | 106 ++++++++++++++++++++
 xen/arch/riscv/setup.c                      |   3 +
 6 files changed, 131 insertions(+)
 create mode 100644 xen/arch/riscv/p2m.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index e2b8aa42c8..5a6f8c115d 100644
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
index 0000000000..7bb0fc0ab4
--- /dev/null
+++ b/xen/arch/riscv/p2m.c
@@ -0,0 +1,106 @@
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
+    unsigned int mode_idx;
+
+    for ( mode_idx = ARRAY_SIZE(modes); mode_idx-- > 0; )
+    {
+        unsigned long mode = modes[mode_idx].mode;
+
+        csr_write(CSR_HGATP, MASK_INSR(mode, HGATP_MODE_MASK));
+
+        if ( MASK_EXTR(csr_read(CSR_HGATP), HGATP_MODE_MASK) == mode )
+        {
+            max_gstage_mode.mode = modes[mode_idx].mode;
+            max_gstage_mode.paging_levels = modes[mode_idx].paging_levels;
+            safe_strcpy(max_gstage_mode.name, modes[mode_idx].name);
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
2.51.1


