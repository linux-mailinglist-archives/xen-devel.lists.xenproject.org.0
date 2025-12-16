Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FF1CC4772
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 17:56:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188144.1509401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVYKz-00079I-43; Tue, 16 Dec 2025 16:55:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188144.1509401; Tue, 16 Dec 2025 16:55:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVYKz-00077d-04; Tue, 16 Dec 2025 16:55:49 +0000
Received: by outflank-mailman (input) for mailman id 1188144;
 Tue, 16 Dec 2025 16:55:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wcum=6W=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vVYKx-0006gk-Ey
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 16:55:47 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0fe45179-daa0-11f0-9cce-f158ae23cfc8;
 Tue, 16 Dec 2025 17:55:44 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-64951939e1eso8589841a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Dec 2025 08:55:44 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8003cb349csm63169766b.68.2025.12.16.08.55.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 08:55:43 -0800 (PST)
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
X-Inumbo-ID: 0fe45179-daa0-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765904144; x=1766508944; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+8mMORbxMUNZTkX3VOmvWIBTB416zrhf+ZA68Ll67BU=;
        b=jgbcqIj9E+tfUpFgwFzICor6pVhXldTmx4au37sbJJzghhhv3yaItS7t90w5Cx1nt/
         e1VzHVCZpYeeteiRWysLILGETqWWJZ0wvS3gpTGmMk+Z7GdJB5mrjs/C0SSTXrwp5etL
         aYTiJIYzo9oeZ679H5gF1JseJm4SZvFFAc6Q/WEcvcR5Z7JG4QQvdE43NKDkxH37Dl3L
         jIXF1HzlvKUH3kG5REXk/GbXeakKDlQkW6wXXfCuyCOdsbUJpGA55Ue7yAfAXEj4+Gl0
         qERT6EiKpjeWE82xsnZ6mFv3qtmofBuh5jw9bJshFE/J7QVB0O5t2D0hQL8fMhg3T6gw
         LB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765904144; x=1766508944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+8mMORbxMUNZTkX3VOmvWIBTB416zrhf+ZA68Ll67BU=;
        b=nlTDnenG+85RnJeFMDnPdIl9+tVo8osI5m1yDtKgaVRt57ZO0x80/uVdfKgT30qxMR
         +eMNAvANnGyUtwHcYiLhytI2RK7K5ndI0+tAww4ergvAKt2R6XKeC5SiXfJBPuvRwJvS
         xoUpsUkKPQqak0kgOzpVJsGwK5AngnGlmrSwA4ebbAzvWjhAVg9SaIm+1Rptm5DHb8Ml
         nd6aceFhQUnBi06gCQg4jsZN+y/Jd7TTFZbj8z0EPulavT34fX3k/elpNVxAszyEgSpK
         PJ0lgC4dviVPS6c1fncVc/WaHJ0KVWSzwYAwCkpqO+vFw3zDO9mF2axCZnoDQRo5Jk9T
         AAQA==
X-Gm-Message-State: AOJu0YxGqa2C9QpuMn0lIyw4emkS5+sj6/RJx67YJbhf5KSWEbpk4JZQ
	hxoM+dhjPrSZQdPhwBp+thPNqmACmvD4RVJSEdxu/ocQeLB8oe2JR4XlZ1/LfA==
X-Gm-Gg: AY/fxX5ohw+VLDzcAfX/dnBttfZjZnzUSoxdNY5eUforyMQyuDRqDSYNrkQg5X7M8DP
	v1OY/dk2ndMvqTd4e6z7bTLvxKiudF0B+ognuQjcM1bp2vNlLaAgULjxACheEoFddtM51SmUNIy
	1W1YmrdhT1NT5LNY6QPuhRPYdER3T/U6Ky2iXhoOlrF6+j/0P9hFhPwOnqrmGkrNakmSNgSr8CQ
	pLFZM0iBb5okWFIefN7d109VSixNRGTH3U8Zw3tAYzedsR3a2naWLpw9dP7Tmkt2EUjB0R5G3cN
	7AXbYaa00QgT4O2QNdpCOLdUVGclWL4jUdQ8vif58aNMQcCmj0cDm1K8Ndocj54iH30phxCZFwc
	qOcOKtUMVxnBrsIqF3G3h3B2v4V5hVWqfNydRmPrMDabxGf5u/51xPPVhsAob+9RvY6MCgDdWSI
	r1FS3GuD+Sg+nQUc7fNYgLPw+9ptnp8WKRRp3H+4WemtovBfg4nkY=
X-Google-Smtp-Source: AGHT+IGgbO4YlQIWDEz5KRaCudwLVcKh42BfPi/+6okZeg1Z2kEChyGw3R22qdLLxZt3JYvY9BHeoA==
X-Received: by 2002:a17:907:3c91:b0:b7a:5c1a:85e with SMTP id a640c23a62f3a-b7d23665af1mr1313493966b.23.1765904143465;
        Tue, 16 Dec 2025 08:55:43 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v7 02/19] xen/riscv: introduce VMID allocation and manegement
Date: Tue, 16 Dec 2025 17:55:12 +0100
Message-ID: <909072f0b5ede1869e6c6993be348ecbdd47e0fa.1765879052.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1765879052.git.oleksii.kurochko@gmail.com>
References: <cover.1765879052.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current implementation is based on x86's way to allocate VMIDs:
  VMIDs partition the physical TLB. In the current implementation VMIDs are
  introduced to reduce the number of TLB flushes. Each time a guest-physical
  address space changes, instead of flushing the TLB, a new VMID is
  assigned. This reduces the number of TLB flushes to at most 1/#VMIDs.
  The biggest advantage is that hot parts of the hypervisor's code and data
  retain in the TLB.

  VMIDs are a hart-local resource.  As preemption of VMIDs is not possible,
  VMIDs are assigned in a round-robin scheme. To minimize the overhead of
  VMID invalidation, at the time of a TLB flush, VMIDs are tagged with a
  64-bit generation. Only on a generation overflow the code needs to
  invalidate all VMID information stored at the VCPUs with are run on the
  specific physical processor. When this overflow appears VMID usage is
  disabled to retain correctness.

Only minor changes are made compared to the x86 implementation.
These include using RISC-V-specific terminology, adding a check to ensure
the type used for storing the VMID has enough bits to hold VMIDLEN,
and introducing a new function vmidlen_detect() to clarify the VMIDLEN
value, rename stuff connected to VMID enable/disable to "VMID use
enable/disable".

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V7:
 - Move the vmid description up in xen-command-line.pandoc to maintain
   alphabetical order.
 - Add explanatory comments above vmid_init() and vmidlen_detect() explaining
   why they are not marked as __init.
---
Changes in V6:
 - Add information about VMID command line option to
   docs/misc/xen-command-line.pandoc.
 - Drop the call of local_hfence_gvma_all() from vmid_init() to avoid
   redundancy as this function is called now in pre_gstage_init().
   Also, update the comment in guest_mm_init() above local_hfence_gvma_all().
 - Add __ro_after_init in declaration of g_disabled.
 - Drop logging of function name in vmid_flush_hart() and drop full stop at
   the end of the message.
 - Add the check that vmid is used at the start of vmid_handle_enter().
 - Drop parentheses around (vmid->vmid == 1) in vmid_handle_enter().
 - Update BUILD_BUG_ON() in vmid_init as HGATP_VMID_SHIFT was dropped.
---
Changes in V5:
 - Rename opt_vmid_use_enabled with opt_vmid to be in sync with command line
   option.
 - Invert the expression for data->used = ... and swap "dis" and "en". Also,
   invert usage of data->used elsewhere.
 - s/vcpu_vmid_flush_vcpu/vmid_flush_vcpu.
 - Add prototypes to asm/vmid.h which could be used outside vmid.c.
 - Update the comment in vmidlen_detect(): instead of Section 3.7 ->
   Section "Physical Memory Protection".
 - Move vmid_init() call to pre_gstage_init().
---
Changes in V4:
 - s/guest's virtual/guest-physical in the comment inside vmid.c
   and in commit message.
 - Drop x86-related numbers in the comment about "Sketch of the Implementation".
 - s/__read_only/__ro_after_init in declaration of opt_vmid_enabled.
 - s/hart_vmid_generation/generation.
 - Update vmidlen_detect() to work with unsigned int type for vmid_bits
   variable.
 - Drop old variable im vmdidlen_detetct, it seems like there is no any reason
   to restore old value of hgatp with no guest running on a hart yet.
 - Update the comment above local_hfence_gvma_all() in vmidlen_detect().
 - s/max_availalbe_bits/max_available_bits.
 - use BITS_PER_BYTE, instead of "<< 3".
 - Add BUILD_BUILD_BUG_ON() instead run-time check that an amount of set bits
   can be held in vmid_data->max_vmid.
 - Apply changes from the patch "x86/HVM: polish hvm_asid_init() a little" here
   (changes connected to g_disabled) with the following minor changes:
   Update the printk() message to "VMIDs use is...".
   Rename g_disabled to g_vmid_used.
 - Rename member 'disabled' of vmid_data structure to used.
 - Use gstage_mode to properly detect VMIDLEN.
---
Changes in V3:
 - Reimplemnt VMID allocation similar to what x86 has implemented.
---
Changes in V2:
 - New patch.
---
 docs/misc/xen-command-line.pandoc   |   9 ++
 xen/arch/riscv/Makefile             |   1 +
 xen/arch/riscv/include/asm/domain.h |   6 +
 xen/arch/riscv/include/asm/vmid.h   |  14 +++
 xen/arch/riscv/p2m.c                |   7 +-
 xen/arch/riscv/vmid.c               | 178 ++++++++++++++++++++++++++++
 6 files changed, 213 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/vmid.h
 create mode 100644 xen/arch/riscv/vmid.c

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index e92b6d55b5..805da22c44 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2863,6 +2863,15 @@ to disable the feature.  Value is in units of crystal clock cycles.
 Note the hardware might add a threshold to the provided value in order to make
 it safe, and hence using 0 is fine.
 
+### vmid (RISC-V)
+> `= <boolean>`
+
+> Default: `true`
+
+Permit Xen to use Virtual Machine Identifiers. This is an optimisation which
+tags the TLB entries with an ID per vcpu. This allows for guest TLB flushes
+to be performed without the overhead of a complete TLB flush.
+
 ### vpid (Intel)
 > `= <boolean>`
 
diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 7b8d0e20e5..c93c837aac 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -17,6 +17,7 @@ obj-y += smpboot.o
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
diff --git a/xen/arch/riscv/include/asm/vmid.h b/xen/arch/riscv/include/asm/vmid.h
new file mode 100644
index 0000000000..1c500c4aff
--- /dev/null
+++ b/xen/arch/riscv/include/asm/vmid.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef ASM_RISCV_VMID_H
+#define ASM_RISCV_VMID_H
+
+struct vcpu;
+struct vcpu_vmid;
+
+void vmid_init(void);
+bool vmid_handle_vmenter(struct vcpu_vmid *vmid);
+void vmid_flush_vcpu(struct vcpu *v);
+void vmid_flush_hart(void);
+
+#endif /* ASM_RISCV_VMID_H */
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index 076a1c35b2..4e84acaafd 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -9,6 +9,7 @@
 #include <asm/flushtlb.h>
 #include <asm/p2m.h>
 #include <asm/riscv_encoding.h>
+#include <asm/vmid.h>
 
 static struct gstage_mode_desc __ro_after_init max_gstage_mode = {
     .mode = HGATP_MODE_OFF,
@@ -68,9 +69,11 @@ void __init guest_mm_init(void)
 {
     gstage_mode_detect();
 
+    vmid_init();
+
     /*
-     * As gstage_mode_detect() is changing CSR_HGATP, it is necessary to flush
-     * guest TLB because:
+     * As gstage_mode_detect() and vmid_init() are changing CSR_HGATP, it is
+     * necessary to flush guest TLB because:
      *
      * From RISC-V spec:
      *   Speculative executions of the address-translation algorithm behave as
diff --git a/xen/arch/riscv/vmid.c b/xen/arch/riscv/vmid.c
new file mode 100644
index 0000000000..8fbcd500f2
--- /dev/null
+++ b/xen/arch/riscv/vmid.c
@@ -0,0 +1,178 @@
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
+#include <asm/p2m.h>
+
+/* Xen command-line option to enable VMIDs */
+static bool __ro_after_init opt_vmid = true;
+boolean_param("vmid", opt_vmid);
+
+/*
+ * VMIDs partition the physical TLB. In the current implementation VMIDs are
+ * introduced to reduce the number of TLB flushes. Each time a guest-physical
+ * address space changes, instead of flushing the TLB, a new VMID is
+ * assigned. This reduces the number of TLB flushes to at most 1/#VMIDs.
+ * The biggest advantage is that hot parts of the hypervisor's code and data
+ * retain in the TLB.
+ *
+ * Sketch of the Implementation:
+ *
+ * VMIDs are a hart-local resource.  As preemption of VMIDs is not possible,
+ * VMIDs are assigned in a round-robin scheme. To minimize the overhead of
+ * VMID invalidation, at the time of a TLB flush, VMIDs are tagged with a
+ * 64-bit generation. Only on a generation overflow the code needs to
+ * invalidate all VMID information stored at the VCPUs with are run on the
+ * specific physical processor. When this overflow appears VMID usage is
+ * disabled to retain correctness.
+ */
+
+/* Per-Hart VMID management. */
+struct vmid_data {
+   uint64_t generation;
+   uint16_t next_vmid;
+   uint16_t max_vmid;
+   bool used;
+};
+
+static DEFINE_PER_CPU(struct vmid_data, vmid_data);
+
+/*
+ * vmidlen_detect() is expected to be called during secondary hart bring-up,
+ * so it should not be marked as __init.
+ */
+static unsigned int vmidlen_detect(void)
+{
+    unsigned int vmid_bits;
+    unsigned char gstage_mode = get_max_supported_mode();
+
+    /*
+     * According to the RISC-V Privileged Architecture Spec:
+     *   When MODE=Bare, guest physical addresses are equal to supervisor
+     *   physical addresses, and there is no further memory protection
+     *   for a guest virtual machine beyond the physical memory protection
+     *   scheme described in Section "Physical Memory Protection".
+     *   In this case, the remaining fields in hgatp must be set to zeros.
+     * Thereby it is necessary to set gstage_mode not equal to Bare.
+     */
+    ASSERT(gstage_mode != HGATP_MODE_OFF);
+    csr_write(CSR_HGATP,
+              MASK_INSR(gstage_mode, HGATP_MODE_MASK) | HGATP_VMID_MASK);
+    vmid_bits = MASK_EXTR(csr_read(CSR_HGATP), HGATP_VMID_MASK);
+    vmid_bits = flsl(vmid_bits);
+    csr_write(CSR_HGATP, _AC(0, UL));
+
+    /* local_hfence_gvma_all() will be called at the end of pre_gstage_init. */
+
+    return vmid_bits;
+}
+
+/*
+ * vmid_init() is expected to be called during secondary hart bring-up,
+ * so it should not be marked as __init.
+ */
+void vmid_init(void)
+{
+    static int8_t __ro_after_init g_vmid_used = -1;
+
+    unsigned int vmid_len = vmidlen_detect();
+    struct vmid_data *data = &this_cpu(vmid_data);
+
+    BUILD_BUG_ON(MASK_EXTR(HGATP_VMID_MASK, HGATP_VMID_MASK) >
+                 (BIT((sizeof(data->max_vmid) * BITS_PER_BYTE), UL) - 1));
+
+    data->max_vmid = BIT(vmid_len, U) - 1;
+    data->used = opt_vmid && (vmid_len > 1);
+
+    if ( g_vmid_used < 0 )
+    {
+        g_vmid_used = data->used;
+        printk("VMIDs use is %sabled\n", data->used ? "en" : "dis");
+    }
+    else if ( g_vmid_used != data->used )
+        printk("CPU%u: VMIDs use is %sabled\n", smp_processor_id(),
+               data->used ? "en" : "dis");
+
+    /* Zero indicates 'invalid generation', so we start the count at one. */
+    data->generation = 1;
+
+    /* Zero indicates 'VMIDs use disabled', so we start the count at one. */
+    data->next_vmid = 1;
+}
+
+void vmid_flush_vcpu(struct vcpu *v)
+{
+    write_atomic(&v->arch.vmid.generation, 0);
+}
+
+void vmid_flush_hart(void)
+{
+    struct vmid_data *data = &this_cpu(vmid_data);
+
+    if ( !data->used )
+        return;
+
+    if ( likely(++data->generation != 0) )
+        return;
+
+    /*
+     * VMID generations are 64 bit.  Overflow of generations never happens.
+     * For safety, we simply disable ASIDs, so correctness is established; it
+     * only runs a bit slower.
+     */
+    printk("VMID generation overrun. Disabling VMIDs\n");
+    data->used = false;
+}
+
+bool vmid_handle_vmenter(struct vcpu_vmid *vmid)
+{
+    struct vmid_data *data = &this_cpu(vmid_data);
+
+    if ( !data->used )
+        goto disabled;
+
+    /* Test if VCPU has valid VMID. */
+    if ( read_atomic(&vmid->generation) == data->generation )
+        return 0;
+
+    /* If there are no free VMIDs, need to go to a new generation. */
+    if ( unlikely(data->next_vmid > data->max_vmid) )
+    {
+        vmid_flush_hart();
+        data->next_vmid = 1;
+        if ( !data->used )
+            goto disabled;
+    }
+
+    /* Now guaranteed to be a free VMID. */
+    vmid->vmid = data->next_vmid++;
+    write_atomic(&vmid->generation, data->generation);
+
+    /*
+     * When we assign VMID 1, flush all TLB entries as we are starting a new
+     * generation, and all old VMID allocations are now stale.
+     */
+    return vmid->vmid == 1;
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
2.52.0


