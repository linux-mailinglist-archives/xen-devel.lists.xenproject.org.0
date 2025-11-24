Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6434C807BA
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 13:34:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170574.1495716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVlx-0004E1-RS; Mon, 24 Nov 2025 12:34:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170574.1495716; Mon, 24 Nov 2025 12:34:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVlx-00049E-MI; Mon, 24 Nov 2025 12:34:25 +0000
Received: by outflank-mailman (input) for mailman id 1170574;
 Mon, 24 Nov 2025 12:34:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sr25=6A=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vNVlv-0001Xp-Td
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 12:34:24 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1bc6267-c931-11f0-980a-7dc792cee155;
 Mon, 24 Nov 2025 13:34:12 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b7636c96b9aso566346766b.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 04:34:12 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654cf0435sm1285238866b.4.2025.11.24.04.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 04:34:11 -0800 (PST)
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
X-Inumbo-ID: e1bc6267-c931-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763987652; x=1764592452; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oa21otGq11ozUJodEKyP4ShNyaKJwoS+ijbz4oX2de8=;
        b=d3TOUVselNQmMR+rQng7LvMhQ1+tg+6qxbNj8U1P72B6Nu6VpAcAP18jb2kBoG24ma
         3tpHNGW8ZFHQQk97530s76zGfZL5etEa6LxQYLa8YxTkWHd4YARkUFJwyis4I5jshK+/
         INsvT2ICZfLgiW/o5asDmbx3y0fmJje+YLA8olExEXmasr1ekirvYiqfKmGoU2M8yw9B
         vtsjWpvDmwllvL0Uwpnp6N531q/Ck3za8L2HDeZ9rSNjKXxfSMLpeH2G0X5mgYYI5oDt
         u6Jr3/2666WJ6A/i+vLZOVYza/wy+CqpOH/gL1fgSM3H7FjVQKwHoGVgqsyePiRVJHrd
         G6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763987652; x=1764592452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Oa21otGq11ozUJodEKyP4ShNyaKJwoS+ijbz4oX2de8=;
        b=L7kuc4C0Z8ougfvUe2ySh4NDm5cHiMnirAooZcGBHW/sSFCAUBH9FYezak3IRPo2WQ
         V64p2SvjCfOSiwKdwc+9uzicEcx18AxHAl7CswFr3WM4Fe1ynAc8zWLlO1puy+JgpxW1
         jDaQNBlL8oJ/BZS1kf7zZovDX1XxlreDFugAOS6ovnJs4geVRhCJ7xXjdQoRNL2dOaQ8
         TH4KTgB5IWqwRy12+d83zvtcQ/ZPJy//AUrnWkBRlhJR7wgSgljv9UtnF40imW/Ujba7
         lyNLn8ulbJ7zchZ4MwT/lc+3GADFtEYTWfUsjrzqoNur823hELbMuJHMahPBAvUYDfLY
         tkDA==
X-Gm-Message-State: AOJu0YwzUPKbgh3rCifjivrGiOIOG9vQU/0AXaa2I8Q5k+YFsMUE2g/t
	CmAPdxthiBxFLta65nFs8a9fauXPBkVYLzAIDezYKmUp1neH2+G8Py4nudxLAVT9
X-Gm-Gg: ASbGncvnlbX1YfiwSheDy61VfaNU3O7A+qqej2a2fv8opH9fQL7wUzPkMVyP129gqre
	1Bq5NtlhtsAZ4ZXfueW23gpZSHuGiUhwdcGwY0lAubh5QbuzX4xIY5v+bHzmFHbwyewnXc7y2Fr
	Sp8o9tkczbvPxKMsVj8uRjvmA/94RM6wLHyECjCRDCNtdkC+sflEvDO82+qUwPK10g+pVvTwDuq
	UmVIpKc5pFEQ2+PHQOZ7xsxmp1dBjfhSPUhn4GDuiu9N3359Blf4ttpL8R3psJP2uLHni4KhxJK
	KQ28a931xoFwAkBhERfHotJHKSWGv4g+dO+usQZCzvxG0NcCZwtZ0vSriOpyBju2vGMrVRK1Pn7
	4d+4COtqyZiEwCoAXouhMAE3d1jpX89jQ06Xsky83QDY+7p86wHYR+D9RPWih7d6WypaqZywmMz
	Ew7bWx+SFtyT2exWRtOB77BLFhoq2ENUkiLCtoAP5S491QRHVEvFkDeTs=
X-Google-Smtp-Source: AGHT+IHEC4VD3aCt8e+QKbhOS0y3aEqRL/eweoz1Q2s+Dv48n2fDYUYPaTmxh9hTkYQ2sJmsswBTew==
X-Received: by 2002:a17:907:a0e:b0:b5b:2c82:7dc6 with SMTP id a640c23a62f3a-b7671847665mr1347180366b.40.1763987651704;
        Mon, 24 Nov 2025 04:34:11 -0800 (PST)
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
Subject: [PATCH v6 03/19] xen/riscv: introduce VMID allocation and manegement
Date: Mon, 24 Nov 2025 13:33:36 +0100
Message-ID: <7805662d530eca29c5b0d0afa05a3cd0aac963bb.1763986955.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <cover.1763986955.git.oleksii.kurochko@gmail.com>
References: <cover.1763986955.git.oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/vmid.c               | 170 ++++++++++++++++++++++++++++
 6 files changed, 205 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/vmid.h
 create mode 100644 xen/arch/riscv/vmid.c

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 34004ce282..6c4bfa3603 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -3096,3 +3096,12 @@ the hypervisor was compiled with `CONFIG_XSM` enabled.
 * `silo`: this will deny any unmediated communication channels between
   unprivileged VMs.  To choose this, the separated option in kconfig must also
   be enabled.
+
+### vmid (RISC-V)
+> `= <boolean>`
+
+> Default: `true`
+
+Permit Xen to use Virtual Machine Identifiers. This is an optimisation which
+tags the TLB entries with an ID per vcpu. This allows for guest TLB flushes
+to be performed without the overhead of a complete TLB flush.
diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 5a6f8c115d..1098b6d926 100644
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
index 7bb0fc0ab4..a4c5b682ce 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -9,6 +9,7 @@
 #include <asm/flushtlb.h>
 #include <asm/p2m.h>
 #include <asm/riscv_encoding.h>
+#include <asm/vmid.h>
 
 static struct gstage_mode_desc __ro_after_init max_gstage_mode = {
     .mode = HGATP_MODE_OFF,
@@ -72,9 +73,11 @@ void __init guest_mm_init(void)
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
index 0000000000..dc52d91650
--- /dev/null
+++ b/xen/arch/riscv/vmid.c
@@ -0,0 +1,170 @@
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
2.51.1


