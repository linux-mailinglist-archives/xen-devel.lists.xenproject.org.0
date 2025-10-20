Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3705BBF23F9
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 17:58:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146529.1478961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsH2-0004vX-30; Mon, 20 Oct 2025 15:58:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146529.1478961; Mon, 20 Oct 2025 15:58:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsH1-0004sN-VY; Mon, 20 Oct 2025 15:58:15 +0000
Received: by outflank-mailman (input) for mailman id 1146529;
 Mon, 20 Oct 2025 15:58:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Li3P=45=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vAsH0-0004nC-Hi
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 15:58:14 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94bbea18-adcd-11f0-980a-7dc792cee155;
 Mon, 20 Oct 2025 17:58:12 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-634cef434beso9263363a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 08:58:12 -0700 (PDT)
Received: from fedora (user-109-243-146-38.play-internet.pl. [109.243.146.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63c48ab560esm6966067a12.12.2025.10.20.08.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 08:58:11 -0700 (PDT)
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
X-Inumbo-ID: 94bbea18-adcd-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760975892; x=1761580692; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWmGSToibzivUmDVNGwha0MNrT+uREcaCidL9vM2xZk=;
        b=dp1Jynl06ZtZwUHAOUnCZxQQr6hVXN8kWZyn9eJMliUPtWHCY5zMHIIX6AWA2Bnq+x
         +QOXHBUChiUpdOQ9YvId60ZINR+Izac008R57skPNgbpw3OYS6fCdOLjEHPs2RvqBQK/
         HnUMq9g4GsXFiYVKqF/7RJ3v/QuHa/a1D+bVnJqsvPWJHGUyxnyGe95aqdoW+yVzv9ve
         NdOYgCD2Syz68ByNXHk16A9AIyuVk78sZQQLL8SYpMLAEGiTtxq9KmhcUCUaBgDBp0I7
         MxZ8wN8nFW7PhqY17xXOjCQVMHyux778Ygz6/2t5OXsmRoP6w5mPO4zwoTwb7YpmReuN
         LvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760975892; x=1761580692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GWmGSToibzivUmDVNGwha0MNrT+uREcaCidL9vM2xZk=;
        b=pfKU9CGiyAVvDMzX2ZbsVaHsyHVpXsAkJtq2vjLsCc1PncY0AwsIqe9wTe5KzS1p9n
         LHIq14ZbEmLh3sPvOkFTsUrXVrZKnK9kJIA0WIt/MB6hc+c/IJSOwVRVRyCb5K7THgZs
         wZT8sqa4Vy8dLHCVqJMr0cqbgQ1sqrC+3HYxcRLbNFmxkJo9wOy/VvBbp7PgHOLwnbMz
         w5getPvapEkK6Ii/Ie4LHI1WLI6VfKh0UQY6r3kT7gkBs9vd9ylelCG6RZ+zT2+ViCu+
         nHdIMgjIxqB8Xrg/e+gEcxMFkZEOsxrp48QMcEnPTnd6pIyy0TIDUaZX5ajiofDlz2xT
         GtLA==
X-Gm-Message-State: AOJu0YxtTLeyQkxZKkCy2Q0H/szoPKlfa23PcrUg1rPWpZUNv6DSB92h
	ufan9g5a4Iwz1I0RxiqR7OX02OVANjx2HMbyfvfglfXGDEZbkeYoCepjw19K3g==
X-Gm-Gg: ASbGncuGEryuoOjwqfQVnUv1hJi7k+RfQRpHrkOUbXKbLeHZaXHs/dWQEGSv/xRwLqB
	2+MOKF5dPo3GG1O5xrYox3RNv4NwlrPAtWltpkVKcNyroiuH9oZ8GQq4JD5mLF9NVkMlxAHEzMi
	nmNStau55YG+Kc9rKsU9ON897CWyoc3llBp9OMlUOkRJdUFluSA5fca1DYC3yvgeS3+uaQmUB2y
	eKq+983XSqWLI2wUkBdWOrjB6OarkahWI1G+GhuCYsKz1vVsECXDpw5lQOIk72vvDWExXbiSDPg
	KDiYGMKzWuRsVDBLwQRRHWdW/PBLvE2nFSYkzzXcucIcsokOzCec/J4i6xwGUDYmsygrDfUeurD
	sCffzkfFbpr1G0wrmFBT0edhUSm7II+UIJ7ACepjq1Vg/dayV5Y9NIL2MMS0jDtexW7l1u5mox/
	CFOOwYLOQe1OrSOy4IJi2sL9Dn1+4eRflb0PFbn/xVrQr+/rM=
X-Google-Smtp-Source: AGHT+IFl+kXYnOxPqXJWpZLPfIZDmmF4pOU+pMLRYn1GhrHeEIZviS1P/RPV0h5ObYnjvrDi9oXOhw==
X-Received: by 2002:a05:6402:42c8:b0:63c:13b9:58b0 with SMTP id 4fb4d7f45d1cf-63c1e1f1fb8mr13945057a12.5.1760975891510;
        Mon, 20 Oct 2025 08:58:11 -0700 (PDT)
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
Subject: [for 4.22 v5 01/18] xen/riscv: detect and initialize G-stage mode
Date: Mon, 20 Oct 2025 17:57:44 +0200
Message-ID: <2b21348b3300c741b276a47d5942e71d306846eb.1760974017.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1760974017.git.oleksii.kurochko@gmail.com>
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce gstage_mode_detect() and pre_gstage_init() to probe supported
G-stage paging modes at boot. The function iterates over possible
HGATP modes (Sv32x4 on RV32, Sv39x4/Sv48x4/Sv57x4 on RV64) and selects
the first valid one by programming CSR_HGATP and reading it back.

The selected mode is stored in gstage_mode (marked __ro_after_init)
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
 xen/arch/riscv/Makefile                     |  1 +
 xen/arch/riscv/include/asm/flushtlb.h       |  7 ++
 xen/arch/riscv/include/asm/p2m.h            |  4 +
 xen/arch/riscv/include/asm/riscv_encoding.h |  5 ++
 xen/arch/riscv/p2m.c                        | 96 +++++++++++++++++++++
 xen/arch/riscv/setup.c                      |  3 +
 6 files changed, 116 insertions(+)
 create mode 100644 xen/arch/riscv/p2m.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index e2b8aa42c8..264e265699 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -7,6 +7,7 @@ obj-y += intc.o
 obj-y += irq.o
 obj-y += mm.o
 obj-y += pt.o
+obj-y += p2m.o
 obj-$(CONFIG_RISCV_64) += riscv64/
 obj-y += sbi.o
 obj-y += setup.o
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
index e43c559e0c..3a5066f360 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -6,6 +6,8 @@
 
 #include <asm/page-bits.h>
 
+extern unsigned char gstage_mode;
+
 #define paddr_bits PADDR_BITS
 
 /*
@@ -88,6 +90,8 @@ static inline bool arch_acquire_resource_check(struct domain *d)
     return false;
 }
 
+void pre_gstage_init(void);
+
 #endif /* ASM__RISCV__P2M_H */
 
 /*
diff --git a/xen/arch/riscv/include/asm/riscv_encoding.h b/xen/arch/riscv/include/asm/riscv_encoding.h
index 6cc8f4eb45..b15f5ad0b4 100644
--- a/xen/arch/riscv/include/asm/riscv_encoding.h
+++ b/xen/arch/riscv/include/asm/riscv_encoding.h
@@ -131,13 +131,16 @@
 #define HGATP_MODE_SV32X4		_UL(1)
 #define HGATP_MODE_SV39X4		_UL(8)
 #define HGATP_MODE_SV48X4		_UL(9)
+#define HGATP_MODE_SV57X4		_UL(10)
 
 #define HGATP32_MODE_SHIFT		31
+#define HGATP32_MODE_MASK		_UL(0x80000000)
 #define HGATP32_VMID_SHIFT		22
 #define HGATP32_VMID_MASK		_UL(0x1FC00000)
 #define HGATP32_PPN			_UL(0x003FFFFF)
 
 #define HGATP64_MODE_SHIFT		60
+#define HGATP64_MODE_MASK		_ULL(0xF000000000000000)
 #define HGATP64_VMID_SHIFT		44
 #define HGATP64_VMID_MASK		_ULL(0x03FFF00000000000)
 #define HGATP64_PPN			_ULL(0x00000FFFFFFFFFFF)
@@ -170,6 +173,7 @@
 #define HGATP_VMID_SHIFT		HGATP64_VMID_SHIFT
 #define HGATP_VMID_MASK			HGATP64_VMID_MASK
 #define HGATP_MODE_SHIFT		HGATP64_MODE_SHIFT
+#define HGATP_MODE_MASK			HGATP64_MODE_MASK
 #else
 #define MSTATUS_SD			MSTATUS32_SD
 #define SSTATUS_SD			SSTATUS32_SD
@@ -181,6 +185,7 @@
 #define HGATP_VMID_SHIFT		HGATP32_VMID_SHIFT
 #define HGATP_VMID_MASK			HGATP32_VMID_MASK
 #define HGATP_MODE_SHIFT		HGATP32_MODE_SHIFT
+#define HGATP_MODE_MASK			HGATP32_MODE_MASK
 #endif
 
 #define TOPI_IID_SHIFT			16
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
new file mode 100644
index 0000000000..00fe676089
--- /dev/null
+++ b/xen/arch/riscv/p2m.c
@@ -0,0 +1,96 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/init.h>
+#include <xen/lib.h>
+#include <xen/macros.h>
+#include <xen/sections.h>
+
+#include <asm/csr.h>
+#include <asm/flushtlb.h>
+#include <asm/riscv_encoding.h>
+
+unsigned char __ro_after_init gstage_mode;
+
+static void __init gstage_mode_detect(void)
+{
+    static const struct {
+        unsigned char mode;
+        unsigned int paging_levels;
+        const char name[8];
+    } modes[] __initconst = {
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
+    gstage_mode = HGATP_MODE_OFF;
+
+    for ( mode_idx = 0; mode_idx < ARRAY_SIZE(modes); mode_idx++ )
+    {
+        unsigned long mode = modes[mode_idx].mode;
+
+        csr_write(CSR_HGATP, MASK_INSR(mode, HGATP_MODE_MASK));
+
+        if ( MASK_EXTR(csr_read(CSR_HGATP), HGATP_MODE_MASK) == mode )
+        {
+            gstage_mode = mode;
+            break;
+        }
+    }
+
+    if ( gstage_mode == HGATP_MODE_OFF )
+        panic("Xen expects that G-stage won't be Bare mode\n");
+
+    printk("G-stage mode is %s\n", modes[mode_idx].name);
+
+    csr_write(CSR_HGATP, 0);
+
+    /*
+     * From RISC-V spec:
+     *   Speculative executions of the address-translation algorithm behave as
+     *   non-speculative executions of the algorithm do, except that they must
+     *   not set the dirty bit for a PTE, they must not trigger an exception,
+     *   and they must not create address-translation cache entries if those
+     *   entries would have been invalidated by any SFENCE.VMA instruction
+     *   executed by the hart since the speculative execution of the algorithm
+     *   began.
+     * The quote above mention explicitly SFENCE.VMA, but I assume it is true
+     * for HFENCE.VMA.
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
+
+void __init pre_gstage_init(void)
+{
+    gstage_mode_detect();
+}
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 483cdd7e17..c4f7793151 100644
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
 
+    pre_gstage_init();
+
     printk("All set up\n");
 
     machine_halt();
-- 
2.51.0


