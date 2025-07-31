Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD68B17472
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 17:58:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065869.1431224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVfy-00023l-J8; Thu, 31 Jul 2025 15:58:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065869.1431224; Thu, 31 Jul 2025 15:58:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVfy-00021G-Dm; Thu, 31 Jul 2025 15:58:38 +0000
Received: by outflank-mailman (input) for mailman id 1065869;
 Thu, 31 Jul 2025 15:58:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Jdx=2M=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uhVfx-0001FB-04
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 15:58:37 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36e93794-6e27-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 17:58:35 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-32b7113ed6bso11700921fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 08:58:35 -0700 (PDT)
Received: from fedora (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88c9931bsm278746e87.101.2025.07.31.08.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 08:58:33 -0700 (PDT)
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
X-Inumbo-ID: 36e93794-6e27-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753977514; x=1754582314; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YAaFHO3rUPEAzf/9yrT1X5pYejy4+Vy0hPa0YIS5wII=;
        b=Mu+5HaaUJGK74I0Ccav6fJAt0BT6wK3g9gdDax9PR9noX8AJmO/1MAjKqbK93wVQEb
         +oOqf1+g+ws5IlrjoQDkGYtA23HxPHUijp7D5zOPK7wb4XU6l2jNORGfRl5pudiimhpE
         5COwh4ugOpdBgfwNo55RST0VRlUgGjO9E8OfVsSMw0Zj4YYr2tEg68edewQGDNGX5lMA
         NTB+bgT2zqPtwUZun0qBD0VSaXhb/Og7+u/BG0z3HYPVhxdUgEBx+AGuN1deRAtvIDDd
         w4wxHRPTdQnDWGVGlvxf9404oQkG1RlusZysl3KIK6d2CKHPOwn0K0vaOO0Xr+0YihSU
         NpRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753977514; x=1754582314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YAaFHO3rUPEAzf/9yrT1X5pYejy4+Vy0hPa0YIS5wII=;
        b=Dh8e+dO/34e+WMuxKmL4NOQE4TTe5lYPv804WfdfpSoEC0s0ny2fDnjEgJPYLluMvb
         HJT2kQGyp4sg3bPIZlhaiXf5obxe1XGfuAUFdL18iihHxfCr+kuFTxW2Sch+Ap/mnQK1
         j2uT1G6aANbp7Oz/knmOK+SECsYbP6OmKLEcDxFBQGvPDwr24Guuxw1pX7WQcln4e5ze
         eYZ9RrUTEwtT8mUzrVGgJa8NXdCxOVSfCEWSP+q7ALrqcogjtqHBBOa9P1hrPYz+Rajb
         Qf1myMolQrzLflNfh17LDl1bGIRVhlYBUkqPlPC15tTgEszl2ARegPUc2+mFidPbv+wO
         1pTg==
X-Gm-Message-State: AOJu0YyWitFJeg/SE+Vid8OYGl20iAXbRq+/Zwu9hns2hcVRLmE7mMoy
	eaN3CJKMdFuKpeu3yi53RXR54H3wR9zlI52RuxOKEO0Ghommm0BPNl4dHqDHAQ==
X-Gm-Gg: ASbGnctHvUm3vgbHC3HiElJKjncHsdPLydlq/KypErggXjAHEB9c+JrZlCr1MH5Mf1T
	SG8ptuRaT5WvKzPcmsQeqzZDYkZLYliD71WTPZwHiYUDC0xLzmRmkiBIXtoFcgDiayzzscY7Hjt
	eYfitdVZlZhKNo8f1TnAiiNDSapfL0XmD3y+MSQFcZdODfK4f1PmEPxCqAEWS0wbE3MGryaTJG2
	BjVmkKHeOcYQDg1AKllc9/Ef1LPoG3ybHL7q6QUHDan2iiO4Uyt0NKI46h7vAFqtefywMEEAhrE
	WG9BdhsFg8IebTO3vN8dQYDwI9myAz6txgBRuaIgswP6mlATIsPr6kxJuLMjjA0H1gcj6UaiX/G
	eFY0Zd/sF3ldgz9U8ADRLfyQIz6ENCMVz7Ss2fSv4YNNeaRYONYVqvQRv6fBcVw==
X-Google-Smtp-Source: AGHT+IE9CGjE6mb4ckGHh0x7f7Wnu2OSI7Gu6OQJWfpE3SEzcDkHVtbLTZ6EDRFXe6aj/MqflRzFmg==
X-Received: by 2002:a05:651c:214f:b0:32b:4773:7aaf with SMTP id 38308e7fff4ca-33224be5d43mr14803431fa.35.1753977514052;
        Thu, 31 Jul 2025 08:58:34 -0700 (PDT)
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
Subject: [PATCH v3 03/20] xen/riscv: introduce VMID allocation and manegement
Date: Thu, 31 Jul 2025 17:58:02 +0200
Message-ID: <d61f5f831ac8045055a1775ee710d4f2fe8dcc26.1753973161.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1753973161.git.oleksii.kurochko@gmail.com>
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current implementation is based on x86's way to allocate VMIDs:
  VMIDs partition the physical TLB. In the current implementation VMIDs are
  introduced to reduce the number of TLB flushes.  Each time the guest's
  virtual address space changes, instead of flushing the TLB, a new VMID is
  assigned.  This reduces the number of TLB flushes to at most 1/#VMIDs.
  The biggest advantage is that hot parts of the hypervisor's code and data
  retain in the TLB.

  VMIDs are a hart-local resource.  As preemption of VMIDs is not possible,
  VMIDs are assigned in a round-robin scheme.  To minimize the overhead of
  VMID invalidation, at the time of a TLB flush, VMIDs are tagged with a
  64-bit generation. Only on a generation overflow the code needs to
  invalidate all VMID information stored at the VCPUs with are run on the
  specific physical processor.  This overflow appears after about 2^80
  host processor cycles, so we do not optimize this case, but simply disable
  VMID useage to retain correctness.

Only minor changes are made compared to the x86 implementation.
These include using RISC-V-specific terminology, adding a check to ensure
the type used for storing the VMID has enough bits to hold VMIDLEN,
and introducing a new function vmidlen_detect() to clarify the VMIDLEN
value.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
 - Reimplemnt VMID allocation similar to what x86 has implemented.
---
Changes in V2:
 - New patch.
---
 xen/arch/riscv/Makefile               |   1 +
 xen/arch/riscv/include/asm/domain.h   |   6 +
 xen/arch/riscv/include/asm/flushtlb.h |   5 +
 xen/arch/riscv/include/asm/vmid.h     |   8 ++
 xen/arch/riscv/setup.c                |   3 +
 xen/arch/riscv/vmid.c                 | 165 ++++++++++++++++++++++++++
 6 files changed, 188 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/vmid.h
 create mode 100644 xen/arch/riscv/vmid.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index e2b8aa42c8..745a85e116 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -16,6 +16,7 @@ obj-y += smpboot.o
 obj-y += stubs.o
 obj-y += time.o
 obj-y += traps.o
+obj-y += vmid.o
 obj-y += vm_event.o
 
 $(TARGET): $(TARGET)-syms
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index c3d965a559..aac1040658 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -5,6 +5,11 @@
 #include <xen/xmalloc.h>
 #include <public/hvm/params.h>
 
+struct vcpu_vmid {
+    uint64_t generation;
+    uint16_t vmid;
+};
+
 struct hvm_domain
 {
     uint64_t              params[HVM_NR_PARAMS];
@@ -14,6 +19,7 @@ struct arch_vcpu_io {
 };
 
 struct arch_vcpu {
+    struct vcpu_vmid vmid;
 };
 
 struct arch_domain {
diff --git a/xen/arch/riscv/include/asm/flushtlb.h b/xen/arch/riscv/include/asm/flushtlb.h
index 51c8f753c5..f391ae6eb7 100644
--- a/xen/arch/riscv/include/asm/flushtlb.h
+++ b/xen/arch/riscv/include/asm/flushtlb.h
@@ -7,6 +7,11 @@
 
 #include <asm/sbi.h>
 
+static inline void local_hfence_gvma_all(void)
+{
+    asm volatile ( "hfence.gvma zero, zero" ::: "memory" );
+}
+
 /* Flush TLB of local processor for address va. */
 static inline void flush_tlb_one_local(vaddr_t va)
 {
diff --git a/xen/arch/riscv/include/asm/vmid.h b/xen/arch/riscv/include/asm/vmid.h
new file mode 100644
index 0000000000..2f1f7ec9a2
--- /dev/null
+++ b/xen/arch/riscv/include/asm/vmid.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef ASM_RISCV_VMID_H
+#define ASM_RISCV_VMID_H
+
+void vmid_init(void);
+
+#endif /* ASM_RISCV_VMID_H */
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 483cdd7e17..549228d73f 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -25,6 +25,7 @@
 #include <asm/sbi.h>
 #include <asm/setup.h>
 #include <asm/traps.h>
+#include <asm/vmid.h>
 
 /* Xen stack for bringing up the first CPU. */
 unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
@@ -148,6 +149,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     console_init_postirq();
 
+    vmid_init();
+
     printk("All set up\n");
 
     machine_halt();
diff --git a/xen/arch/riscv/vmid.c b/xen/arch/riscv/vmid.c
new file mode 100644
index 0000000000..7ad1b91ee2
--- /dev/null
+++ b/xen/arch/riscv/vmid.c
@@ -0,0 +1,165 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/domain.h>
+#include <xen/init.h>
+#include <xen/sections.h>
+#include <xen/lib.h>
+#include <xen/param.h>
+#include <xen/percpu.h>
+
+#include <asm/atomic.h>
+#include <asm/csr.h>
+#include <asm/flushtlb.h>
+
+/* Xen command-line option to enable VMIDs */
+static bool __read_mostly opt_vmid_enabled = true;
+boolean_param("vmid", opt_vmid_enabled);
+
+/*
+ * VMIDs partition the physical TLB. In the current implementation VMIDs are
+ * introduced to reduce the number of TLB flushes.  Each time the guest's
+ * virtual address space changes, instead of flushing the TLB, a new VMID is
+ * assigned. This reduces the number of TLB flushes to at most 1/#VMIDs.
+ * The biggest advantage is that hot parts of the hypervisor's code and data
+ * retain in the TLB.
+ *
+ * Sketch of the Implementation:
+ *
+ * VMIDs are a hart-local resource.  As preemption of VMIDs is not possible,
+ * VMIDs are assigned in a round-robin scheme.  To minimize the overhead of
+ * VMID invalidation, at the time of a TLB flush, VMIDs are tagged with a
+ * 64-bit generation. Only on a generation overflow the code needs to
+ * invalidate all VMID information stored at the VCPUs with are run on the
+ * specific physical processor.  This overflow appears after about 2^80
+ * host processor cycles, so we do not optimize this case, but simply disable
+ * VMID useage to retain correctness.
+ */
+
+/* Per-Hart VMID management. */
+struct vmid_data {
+   uint64_t hart_vmid_generation;
+   uint16_t next_vmid;
+   uint16_t max_vmid;
+   bool disabled;
+};
+
+static DEFINE_PER_CPU(struct vmid_data, vmid_data);
+
+static unsigned long vmidlen_detect(void)
+{
+    unsigned long vmid_bits;
+    unsigned long old;
+
+    /* Figure-out number of VMID bits in HW */
+    old = csr_read(CSR_HGATP);
+
+    csr_write(CSR_HGATP, old | HGATP_VMID_MASK);
+    vmid_bits = csr_read(CSR_HGATP);
+    vmid_bits =  MASK_EXTR(vmid_bits, HGATP_VMID_MASK);
+    vmid_bits = flsl(vmid_bits);
+    csr_write(CSR_HGATP, old);
+
+    /*
+     * We polluted local TLB so flush all guest TLB as
+     * a speculative access can happen at any time.
+     */
+    local_hfence_gvma_all();
+
+    return vmid_bits;
+}
+
+void vmid_init(void)
+{
+    static bool g_disabled = false;
+
+    unsigned long vmid_len = vmidlen_detect();
+    struct vmid_data *data = &this_cpu(vmid_data);
+    unsigned long max_availalbe_bits = sizeof(data->max_vmid) << 3;
+
+    if ( vmid_len > max_availalbe_bits )
+        panic("%s: VMIDLEN is bigger then a type which represent VMID: %lu(%lu)\n",
+              __func__, vmid_len, max_availalbe_bits);
+
+    data->max_vmid = BIT(vmid_len, U) - 1;
+    data->disabled = !opt_vmid_enabled || (vmid_len <= 1);
+
+    if ( g_disabled != data->disabled )
+    {
+        printk("%s: VMIDs %sabled.\n", __func__,
+               data->disabled ? "dis" : "en");
+        if ( !g_disabled )
+            g_disabled = data->disabled;
+    }
+
+    /* Zero indicates 'invalid generation', so we start the count at one. */
+    data->hart_vmid_generation = 1;
+
+    /* Zero indicates 'VMIDs disabled', so we start the count at one. */
+    data->next_vmid = 1;
+}
+
+void vcpu_vmid_flush_vcpu(struct vcpu *v)
+{
+    write_atomic(&v->arch.vmid.generation, 0);
+}
+
+void vmid_flush_hart(void)
+{
+    struct vmid_data *data = &this_cpu(vmid_data);
+
+    if ( data->disabled )
+        return;
+
+    if ( likely(++data->hart_vmid_generation != 0) )
+        return;
+
+    /*
+     * VMID generations are 64 bit.  Overflow of generations never happens.
+     * For safety, we simply disable ASIDs, so correctness is established; it
+     * only runs a bit slower.
+     */
+    printk("%s: VMID generation overrun. Disabling VMIDs.\n", __func__);
+    data->disabled = 1;
+}
+
+bool vmid_handle_vmenter(struct vcpu_vmid *vmid)
+{
+    struct vmid_data *data = &this_cpu(vmid_data);
+
+    /* Test if VCPU has valid VMID. */
+    if ( read_atomic(&vmid->generation) == data->hart_vmid_generation )
+        return 0;
+
+    /* If there are no free VMIDs, need to go to a new generation. */
+    if ( unlikely(data->next_vmid > data->max_vmid) )
+    {
+        vmid_flush_hart();
+        data->next_vmid = 1;
+        if ( data->disabled )
+            goto disabled;
+    }
+
+    /* Now guaranteed to be a free VMID. */
+    vmid->vmid = data->next_vmid++;
+    write_atomic(&vmid->generation, data->hart_vmid_generation);
+
+    /*
+     * When we assign VMID 1, flush all TLB entries as we are starting a new
+     * generation, and all old VMID allocations are now stale.
+     */
+    return (vmid->vmid == 1);
+
+ disabled:
+    vmid->vmid = 0;
+    return 0;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.50.1


