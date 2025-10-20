Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C8BBF23FC
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 17:58:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146530.1478971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsH3-0005AW-Dk; Mon, 20 Oct 2025 15:58:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146530.1478971; Mon, 20 Oct 2025 15:58:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsH3-00058f-7B; Mon, 20 Oct 2025 15:58:17 +0000
Received: by outflank-mailman (input) for mailman id 1146530;
 Mon, 20 Oct 2025 15:58:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Li3P=45=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vAsH1-0004nC-7b
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 15:58:15 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9550868d-adcd-11f0-980a-7dc792cee155;
 Mon, 20 Oct 2025 17:58:13 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-62fca01f0d9so9337683a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 08:58:13 -0700 (PDT)
Received: from fedora (user-109-243-146-38.play-internet.pl. [109.243.146.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63c48ab560esm6966067a12.12.2025.10.20.08.58.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 08:58:12 -0700 (PDT)
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
X-Inumbo-ID: 9550868d-adcd-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760975893; x=1761580693; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/y05n2DKnmJHAJJHwjH/Vcvfok/SLwNyKqUSGzwe0iw=;
        b=Qk2CnEbHmsiBxLmnUNcDPiPsWtvQEHwrXWCoXsSEWBc5fy5MzQ94mswq0hMWWBTd7u
         eo20HZgEvwOoxtr/LiX/HWI4BDOyhVAI+mnK0p1HPkTf+MNuJ9gJIIHvfUbzocAgE7dn
         q6Gqoo4wfFndxZqBmtRu+glMSX2zHt1T6mhmXcUWQF0+mtGsYQ6HNnqjwODg3Gpoh0Eq
         0UmrwDjLf4uk51uEk5F8erAHJYHSFbZgURE7Ogrn490adNtqZZV16BdRgSfzF/0ZrwWp
         r6xh/aoYlNLARLnWP/fmq/Oj3hUnpUHjn7QD87SS3EPXqgTsv2A4iZnyV8FyYE90B+54
         kMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760975893; x=1761580693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/y05n2DKnmJHAJJHwjH/Vcvfok/SLwNyKqUSGzwe0iw=;
        b=Ll6MZEyAydozKz9dgmBVv7Z48I2p2EyEnuplD6ZJkbX/eZrlfBiTQlP6J99dxqq/JH
         Sv91o15SANKOq9pUN09sSNljsAhqQipfTfjSwDm3/35PiRhLB7YOFFqvtsT1a1kpJ88g
         qUTlMHW1FEqtGma4Yl7U3ywtktFTQmZVYQiUqlbBrp7Rdx7KphqnqqzD7uYS5TPLLVe2
         f9/XFBXHmE8dmwUob+XJyIja/BeuDMLrOPUO6YM+bFuXFAmr3egiT/F7qRaeg2PHiSBM
         6KFI7VCcSUhN89OnWfUG1YlJdMlLoxFkUktK+ro3snioeWixtwVmRilIW4bdZz/UJ/DC
         KsmQ==
X-Gm-Message-State: AOJu0Yw9s0b9zT3gk1qP0jbJPD6XQzn7IFvh3Nnj/nSvFuqPrC8Giq8h
	RKjbKNTwkUsFWqHiMPGZo/TZTQKG5Ucc6GDDtfpvUO0Brs/u43F7PFGP60UH8g==
X-Gm-Gg: ASbGncsLov48qtHP06aV+QlFxCS7FhKMx8d1caGfhwNyV8OPd5kP06NsVJ5GXPnp9+K
	bPsVtAeBnY1U/hLbpbw56pGEPS3vYfOuKLJVQ6JYoby+Xmu8uQ2JNRwlpEBZYrdewLOuDDBavBY
	9/FzMLHKRwknxhMcrK6QxEKagQT+D5HzL8kofLtJa6n8+26wZItmLwExR9CN2o5PwUmTI9oyl2Q
	Z0mHxbsd2JMo94Ws6j7GA7I2KGEkM3wpqxJHgHiCzZOBcLzPxWQQnghrW44M3eRt9u0huVtEqx0
	eANCf105ZEANu/vCY89/ahCB/bdPw0QifJxQpVUAUCTm4uLTbTMmDKj5gFkWR9MQU8YqtX1frJk
	FsO0CteswQt6iRoboYQPDu6SeIB/pt9fG7JWGRS7f1IszMKsgZB6GjLoFpl7bBFuyTpBluUtfDp
	mwa8RHOtc3FADRLQNClKUOzxCztEzPOQyPPSapBNkxroaNsf480BND6PgFhQ==
X-Google-Smtp-Source: AGHT+IFoTak8cjvxQ9wSERYZP5+g/J05ZFd8if40eyHWghby7dkpCqP86idSOalUSXml7xX4uhDbhg==
X-Received: by 2002:a05:6402:909:b0:639:f7b5:9c2d with SMTP id 4fb4d7f45d1cf-63c1f641924mr13404041a12.9.1760975892456;
        Mon, 20 Oct 2025 08:58:12 -0700 (PDT)
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
Subject: [for 4.22 v5 02/18] xen/riscv: introduce VMID allocation and manegement
Date: Mon, 20 Oct 2025 17:57:45 +0200
Message-ID: <bdbe6c13991c2d166614795d43db3f71d790c00f.1760974017.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1760974017.git.oleksii.kurochko@gmail.com>
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/Makefile             |   1 +
 xen/arch/riscv/include/asm/domain.h |   6 +
 xen/arch/riscv/include/asm/vmid.h   |  14 ++
 xen/arch/riscv/p2m.c                |   3 +
 xen/arch/riscv/vmid.c               | 193 ++++++++++++++++++++++++++++
 5 files changed, 217 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/vmid.h
 create mode 100644 xen/arch/riscv/vmid.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 264e265699..e2499210c8 100644
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
index 00fe676089..d8027a270f 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -8,6 +8,7 @@
 #include <asm/csr.h>
 #include <asm/flushtlb.h>
 #include <asm/riscv_encoding.h>
+#include <asm/vmid.h>
 
 unsigned char __ro_after_init gstage_mode;
 
@@ -93,4 +94,6 @@ static void __init gstage_mode_detect(void)
 void __init pre_gstage_init(void)
 {
     gstage_mode_detect();
+
+    vmid_init();
 }
diff --git a/xen/arch/riscv/vmid.c b/xen/arch/riscv/vmid.c
new file mode 100644
index 0000000000..885d177e9f
--- /dev/null
+++ b/xen/arch/riscv/vmid.c
@@ -0,0 +1,193 @@
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
+static unsigned int vmidlen_detect(void)
+{
+    unsigned int vmid_bits;
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
+    /*
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
+
+    return vmid_bits;
+}
+
+void vmid_init(void)
+{
+    static int8_t g_vmid_used = -1;
+
+    unsigned int vmid_len = vmidlen_detect();
+    struct vmid_data *data = &this_cpu(vmid_data);
+
+    BUILD_BUG_ON((HGATP_VMID_MASK >> HGATP_VMID_SHIFT) >
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
+    printk("%s: VMID generation overrun. Disabling VMIDs.\n", __func__);
+    data->used = false;
+}
+
+bool vmid_handle_vmenter(struct vcpu_vmid *vmid)
+{
+    struct vmid_data *data = &this_cpu(vmid_data);
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
2.51.0


