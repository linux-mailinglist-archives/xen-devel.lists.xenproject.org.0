Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56839B820AB
	for <lists+xen-devel@lfdr.de>; Wed, 17 Sep 2025 23:56:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1125582.1467485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uz085-0007b1-Nw; Wed, 17 Sep 2025 21:55:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1125582.1467485; Wed, 17 Sep 2025 21:55:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uz085-0007Zd-J9; Wed, 17 Sep 2025 21:55:57 +0000
Received: by outflank-mailman (input) for mailman id 1125582;
 Wed, 17 Sep 2025 21:55:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C67B=34=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uz083-0007Lu-QT
 for xen-devel@lists.xenproject.org; Wed, 17 Sep 2025 21:55:55 +0000
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [2607:f8b0:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14b0e6dd-9411-11f0-9d13-b5c5bf9af7f9;
 Wed, 17 Sep 2025 23:55:54 +0200 (CEST)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-26060bcc5c8so2755765ad.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Sep 2025 14:55:54 -0700 (PDT)
Received: from fedora ([149.199.65.200]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-26980053da4sm5538095ad.20.2025.09.17.14.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 14:55:51 -0700 (PDT)
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
X-Inumbo-ID: 14b0e6dd-9411-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758146152; x=1758750952; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ZKBeOzQlMI0H2OFn3PfjH1UwDz/qzKq2B8yZK4VfQM=;
        b=UBiGUh4WO/uimQQx4AcwOItA+dGGKK41OO6UrtOG3FVcM9KBbQK1SS0ZsN4eh5UTND
         bVFjCjOrMByj1OICSlQfTRCTXsOTfD3bIwpWiwB8LuVI9luGbCk7PWF2D2EZk0vhpVhD
         GjAPnlRGU6ARHOocmB5zZuqK3bKeu5TRzyPkUHRRLJAOa4wQhYG6FTbilqJYMDtVz6m4
         yrPDjfJM8LUJX+Hqasq4cLsi6mkiCSHejLp2abMOlZRguX3jepGG7tn5pKVZYrRJ51LN
         ZxWfUbtQ1zmHWUcLBC1n9ae8AFdmwvYOcWf4H0d4659nTAbSVAqDIX751ZOmlAmG0yG8
         Uueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758146152; x=1758750952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ZKBeOzQlMI0H2OFn3PfjH1UwDz/qzKq2B8yZK4VfQM=;
        b=u0L6Q2Ie4S4cCJ6ev0HC6O+UzgOxz4qhOCtR0Szm44Ef1IXSsTqPRBuDv3q5KusvvS
         yiddt2tQsfQSttOM0z23x4QkI/bB0oyNmdDIJX47z8uCW3UPvjJdbNcebZhN4xQ28E87
         h4OKEIFof/3NB8o3vP+o2RLLH3htDceY5gu6lKWmhdLNfbu6YbrmdwqBvtQiGqvHWBgu
         TVWGxO8cUAk3xDRINHXk4zqF5b9gPsbJluyVCUZKfF/Ck70pZPo+U2dRWhivQY9s4fcl
         mmqsbY6YIvKTRQ/znIhljn7FJfiBdSjtNf0IVtQ8p3xljTZAISSstwP1UfrDVQpQLJEJ
         lMDw==
X-Gm-Message-State: AOJu0Ywe4WAuRGhSj2dP3Xr9KjSWxhNnqTkrynwcSLQX+4GXW6R3quuX
	GbLWwwUBMwKcZIzT3vTwVFbzqIx71KUuQt07yqx/5KZqYQB/WLGHP0ckXTQRJYqblfU=
X-Gm-Gg: ASbGnctkKDo6f3i3DPJA5vC0hIYxy/le9ZgJyjoqKi5dkkESyd6mZVi9fyADsK4Nwmj
	iKJt+moD5BFlgdFwM2xAR5pS5Uwa0X0rqjRxqD/DqAGcZEA6wggWhHlmvhgZudEEAAQxFT5pDpI
	LdiBDO5+IV6NsHWobhDB9mNGiWD5pe2K6qkkKh0bxmrcT4cKd5N7+8qDIPI5Ljw1PUDSXO1tKoK
	FTUpTAH5ISN3sCGcEg+7Ge+P/vYT7pm8jAuSPvTHrsVHG8GP+Hvcz7yKfQ0fVQDlRnknZ7eJwih
	kJ1D4FD//0PiuC1hu2m9Mf2uVHOrQd9QFaZDnlvQPu+sIT/jQGaoqOl3pdiAf/OAm0gcd2aVleE
	7sJv8Jq6rWxW/HzIvg0tdk3hJ6XN/xOzIxKAwZhVytegQ4XwSPhIWJrg=
X-Google-Smtp-Source: AGHT+IG+AQa3vNEfZDh2GYoeHvCiqtccLKi1evIwWX4dlloxp4goqioSadQ8Ej/G9S1lL+YRa9kMwg==
X-Received: by 2002:a17:902:f54f:b0:265:89c:251b with SMTP id d9443c01a7336-268137f24f6mr40577165ad.29.1758146152035;
        Wed, 17 Sep 2025 14:55:52 -0700 (PDT)
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
Subject: [PATCH v4 01/18] xen/riscv: detect and initialize G-stage mode
Date: Wed, 17 Sep 2025 23:55:21 +0200
Message-ID: <7cc37e612db4a0bfe72b63a475d3a492b2e68c83.1758145428.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758145428.git.oleksii.kurochko@gmail.com>
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce gstage_mode_detect() to probe supported G-stage paging
modes at boot. The function iterates over possible HGATP modes
(Sv32x4 on RV32, Sv39x4/Sv48x4/Sv57x4 on RV64) and selects the
first valid one by programming CSR_HGATP and reading it back.

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
 - New patch.
---
 xen/arch/riscv/Makefile                     |  1 +
 xen/arch/riscv/include/asm/flushtlb.h       |  7 ++
 xen/arch/riscv/include/asm/p2m.h            |  4 +
 xen/arch/riscv/include/asm/riscv_encoding.h |  5 ++
 xen/arch/riscv/p2m.c                        | 91 +++++++++++++++++++++
 xen/arch/riscv/setup.c                      |  3 +
 6 files changed, 111 insertions(+)
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
index e43c559e0c..9d4a5d6a2e 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -6,6 +6,8 @@
 
 #include <asm/page-bits.h>
 
+extern unsigned long gstage_mode;
+
 #define paddr_bits PADDR_BITS
 
 /*
@@ -88,6 +90,8 @@ static inline bool arch_acquire_resource_check(struct domain *d)
     return false;
 }
 
+void gstage_mode_detect(void);
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
index 0000000000..56113a2f7a
--- /dev/null
+++ b/xen/arch/riscv/p2m.c
@@ -0,0 +1,91 @@
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
+unsigned long __ro_after_init gstage_mode;
+
+void __init gstage_mode_detect(void)
+{
+    unsigned int mode_idx;
+
+    const struct {
+        unsigned long mode;
+        unsigned int paging_levels;
+        const char *name;
+    } modes[] = {
+        /*
+         * Based on the RISC-V spec:
+         *   When SXLEN=32, the only other valid setting for MODE is Sv32,
+         *   a paged virtual-memory scheme described in Section 10.3.
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
+    printk("%s: G-stage mode is %s\n", __func__, modes[mode_idx].name);
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
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 483cdd7e17..87ee96bdb3 100644
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
 
+    gstage_mode_detect();
+
     printk("All set up\n");
 
     machine_halt();
-- 
2.51.0


