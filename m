Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A8CA9701A
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 17:11:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.962924.1354092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7FHo-0002s0-7G; Tue, 22 Apr 2025 15:11:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 962924.1354092; Tue, 22 Apr 2025 15:11:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7FHo-0002ps-0j; Tue, 22 Apr 2025 15:11:48 +0000
Received: by outflank-mailman (input) for mailman id 962924;
 Tue, 22 Apr 2025 15:11:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BiSK=XI=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1u7FDo-0008SP-2z
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 15:07:40 +0000
Received: from 3.mo550.mail-out.ovh.net (3.mo550.mail-out.ovh.net
 [46.105.60.232]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85d7467e-1f8b-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 17:07:35 +0200 (CEST)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.108.17.28])
 by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4Zhlw673wCz1SH0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 15:07:34 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-6tjtj (unknown [10.110.113.175])
 by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 3C0EF1FE9C;
 Tue, 22 Apr 2025 15:07:34 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.104])
 by ghost-submission-5b5ff79f4f-6tjtj with ESMTPSA
 id ZjdlOrWwB2g1AQEAHtJGkA
 (envelope-from <sergii.dmytruk@3mdeb.com>); Tue, 22 Apr 2025 15:07:34 +0000
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
X-Inumbo-ID: 85d7467e-1f8b-11f0-9ffb-bf95429c2676
Authentication-Results:garm.ovh; auth=pass (GARM-104R00566ba59df-84da-4b2d-9200-fbaad77c07ca,
                    7E508E014E7E7C169EB13C6E22C3C4EBF1F0FDD7) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH 11/21] x86/tpm.c: code for early hashing and extending PCRs (for TPM1.2)
Date: Tue, 22 Apr 2025 18:06:45 +0300
Message-ID: <582d247c62748d37ae4982bdfb250b80051fdc8c.1745172094.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
References: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12733364997088064668
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeegtdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgvrhhgihhiucffmhihthhruhhkuceoshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeffjefgudevkeetudegueeihfdthfejgfeileekuefggeegtdegveehfeehfeefueenucffohhmrghinhepsggrshgvrdhmrghppdhhvggrugdrshgsnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukedurddujeekpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheehtdgmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=LQ1Vqe1g6RI6JDcVkxzenf+apwtvgdiVGCvexZNSFH8=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1745334455; v=1;
 b=dDplnzYEQqox6HEw+6yHAYs5SLrXTwyLbV9PGn8liZ/1d0RHGNGTut/46mZwL7AIgR1Nuiwy
 vE15PzwGVthF+hniyLKLc2oLUEqtI+3lDFcwtU/E/d6dfK5RrnGvyrEXWie0KGt9UqWQrAdVQu4
 MHephxrJ8T/6bBUgRvd+5ZaQh7Fnwa27wQ4mpKaTKpsy2GP923PPplC+IRp2wP/5gaop5fd4iF3
 OuKD+W1IhTzW+GfuVlEaDnAVZp5getKoAH7mlTfl/GrELh6aSpYuOvAhmLu9T0Fa4V8ki+fc1cd
 jlY7F8BsFtiFTKBXOAMgkbtknlj6xhFbLg71i7Co8N1xw==

From: Krystian Hebel <krystian.hebel@3mdeb.com>

This file is built twice: for early 32b mode without paging to measure
MBI and for 64b code to measure dom0 kernel and initramfs. Since MBI
is small, the first case uses TPM to do the hashing. Kernel and
initramfs on the other hand are too big, sending them to the TPM would
take multiple minutes.

Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---
 xen/arch/x86/Makefile              |   1 +
 xen/arch/x86/boot/Makefile         |   7 +-
 xen/arch/x86/boot/head.S           |   3 +
 xen/arch/x86/include/asm/slaunch.h |  14 +
 xen/arch/x86/include/asm/tpm.h     |  19 ++
 xen/arch/x86/slaunch.c             |   7 +-
 xen/arch/x86/tpm.c                 | 437 +++++++++++++++++++++++++++++
 7 files changed, 486 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/tpm.h
 create mode 100644 xen/arch/x86/tpm.c

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index cae548f7e9..7d1027a50f 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -67,6 +67,7 @@ obj-y += spec_ctrl.o
 obj-y += srat.o
 obj-y += string.o
 obj-y += time.o
+obj-y += tpm.o
 obj-y += traps-setup.o
 obj-y += traps.o
 obj-$(CONFIG_INTEL) += tsx.o
diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index d0015f7d19..ab37ab1fb7 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -6,6 +6,7 @@ obj32 := cmdline.32.o
 obj32 += reloc.32.o
 obj32 += reloc-trampoline.32.o
 obj32 += slaunch_early.32.o
+obj32 += tpm_early.32.o
 
 obj64 := reloc-trampoline.o
 
@@ -31,6 +32,10 @@ $(obj)/%.32.o: $(src)/%.c FORCE
 
 $(obj)/slaunch_early.32.o: XEN_CFLAGS += -D__EARLY_SLAUNCH__
 
+$(obj)/tpm_early.32.o: XEN_CFLAGS += -D__EARLY_SLAUNCH__
+$(obj)/tpm_early.32.o: $(src)/../tpm.c FORCE
+	$(call if_changed_rule,cc_o_c)
+
 orphan-handling-$(call ld-option,--orphan-handling=error) := --orphan-handling=error
 LDFLAGS_DIRECT-$(call ld-option,--warn-rwx-segments) := --no-warn-rwx-segments
 LDFLAGS_DIRECT += $(LDFLAGS_DIRECT-y)
@@ -84,7 +89,7 @@ cmd_combine = \
               --bin1      $(obj)/built-in-32.base.bin \
               --bin2      $(obj)/built-in-32.offset.bin \
               --map       $(obj)/built-in-32.base.map \
-              --exports   cmdline_parse_early,reloc,reloc_trampoline32,slaunch_early_init \
+              --exports   cmdline_parse_early,reloc,reloc_trampoline32,slaunch_early_init,tpm_extend_mbi \
               --output    $@
 
 targets += built-in-32.S
diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index e522a36305..0b7903070a 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -527,6 +527,9 @@ __start:
         /* Store MBI address in EBX where MB2 code expects it. */
         mov     %eax, %ebx
 
+        /* tpm_extend_mbi(mbi/eax, slrt/edx) using fastcall. */
+        call    tpm_extend_mbi
+
         /* Move magic number expected by Multiboot 2 to EAX and fall through. */
         movl    $MULTIBOOT2_BOOTLOADER_MAGIC, %eax
 
diff --git a/xen/arch/x86/include/asm/slaunch.h b/xen/arch/x86/include/asm/slaunch.h
index 78d3c8bf37..b9b50f20c6 100644
--- a/xen/arch/x86/include/asm/slaunch.h
+++ b/xen/arch/x86/include/asm/slaunch.h
@@ -10,6 +10,20 @@
 #include <xen/slr_table.h>
 #include <xen/types.h>
 
+#define DRTM_LOC                   2
+#define DRTM_CODE_PCR              17
+#define DRTM_DATA_PCR              18
+
+/*
+ * Secure Launch event log entry types. The TXT specification defines the base
+ * event value as 0x400 for DRTM values, use it regardless of the DRTM for
+ * consistency.
+ */
+#define DLE_EVTYPE_BASE            0x400
+#define DLE_EVTYPE_SLAUNCH         (DLE_EVTYPE_BASE + 0x102)
+#define DLE_EVTYPE_SLAUNCH_START   (DLE_EVTYPE_BASE + 0x103)
+#define DLE_EVTYPE_SLAUNCH_END     (DLE_EVTYPE_BASE + 0x104)
+
 extern bool slaunch_active;
 
 /*
diff --git a/xen/arch/x86/include/asm/tpm.h b/xen/arch/x86/include/asm/tpm.h
new file mode 100644
index 0000000000..d46eba673c
--- /dev/null
+++ b/xen/arch/x86/include/asm/tpm.h
@@ -0,0 +1,19 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Copyright (c) 2022-2025 3mdeb Sp. z o.o. All rights reserved.
+ */
+
+#ifndef _ASM_X86_TPM_H_
+#define _ASM_X86_TPM_H_
+
+#include <xen/types.h>
+
+#define TPM_TIS_BASE  0xFED40000
+#define TPM_TIS_SIZE  0x00010000
+
+void tpm_hash_extend(unsigned loc, unsigned pcr, const uint8_t *buf,
+                     unsigned size, uint32_t type, const uint8_t *log_data,
+                     unsigned log_data_size);
+
+#endif /* _ASM_X86_TPM_H_ */
diff --git a/xen/arch/x86/slaunch.c b/xen/arch/x86/slaunch.c
index 20e277cc5c..7b13b0a852 100644
--- a/xen/arch/x86/slaunch.c
+++ b/xen/arch/x86/slaunch.c
@@ -13,6 +13,7 @@
 #include <asm/intel_txt.h>
 #include <asm/page.h>
 #include <asm/slaunch.h>
+#include <asm/tpm.h>
 
 /*
  * These variables are assigned to by the code near Xen's entry point.
@@ -65,16 +66,20 @@ struct slr_table *__init slaunch_get_slrt(void)
 
 void __init slaunch_map_mem_regions(void)
 {
+    int rc;
     void *evt_log_addr;
     uint32_t evt_log_size;
 
+    rc = slaunch_map_l2(TPM_TIS_BASE, TPM_TIS_SIZE);
+    BUG_ON(rc != 0);
+
     /* Vendor-specific part. */
     txt_map_mem_regions();
 
     find_evt_log(slaunch_get_slrt(), &evt_log_addr, &evt_log_size);
     if ( evt_log_addr != NULL )
     {
-        int rc = slaunch_map_l2((uintptr_t)evt_log_addr, evt_log_size);
+        rc = slaunch_map_l2((uintptr_t)evt_log_addr, evt_log_size);
         BUG_ON(rc != 0);
     }
 }
diff --git a/xen/arch/x86/tpm.c b/xen/arch/x86/tpm.c
new file mode 100644
index 0000000000..8cf836d0df
--- /dev/null
+++ b/xen/arch/x86/tpm.c
@@ -0,0 +1,437 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Copyright (c) 2022-2025 3mdeb Sp. z o.o. All rights reserved.
+ */
+
+#include <xen/sha1.h>
+#include <xen/types.h>
+#include <asm/intel_txt.h>
+#include <asm/slaunch.h>
+#include <asm/tpm.h>
+
+#ifdef __EARLY_SLAUNCH__
+
+#ifdef __va
+#error "__va defined in non-paged mode!"
+#endif
+
+#define __va(x)     _p(x)
+
+/* Implementation of slaunch_get_slrt() for early TPM code. */
+static uint32_t slrt_location;
+struct slr_table *slaunch_get_slrt(void)
+{
+    return __va(slrt_location);
+}
+
+/*
+ * The code is being compiled as a standalone binary without linking to any
+ * other part of Xen.  Providing implementation of builtin functions in this
+ * case is necessary if compiler chooses to not use an inline builtin.
+ */
+void *memcpy(void *dest, const void *src, size_t n)
+{
+    const uint8_t *s = src;
+    uint8_t *d = dest;
+
+    while ( n-- )
+        *d++ = *s++;
+
+    return dest;
+}
+
+#else   /* __EARLY_SLAUNCH__ */
+
+#include <xen/mm.h>
+#include <xen/pfn.h>
+
+#endif  /* __EARLY_SLAUNCH__ */
+
+#define TPM_LOC_REG(loc, reg)   (0x1000 * (loc) + (reg))
+
+#define TPM_ACCESS_(x)          TPM_LOC_REG(x, 0x00)
+#define ACCESS_REQUEST_USE       (1 << 1)
+#define ACCESS_ACTIVE_LOCALITY   (1 << 5)
+#define TPM_INTF_CAPABILITY_(x) TPM_LOC_REG(x, 0x14)
+#define INTF_VERSION_MASK        0x70000000
+#define TPM_STS_(x)             TPM_LOC_REG(x, 0x18)
+#define TPM_FAMILY_MASK          0x0C000000
+#define STS_DATA_AVAIL           (1 << 4)
+#define STS_TPM_GO               (1 << 5)
+#define STS_COMMAND_READY        (1 << 6)
+#define STS_VALID                (1 << 7)
+#define TPM_DATA_FIFO_(x)       TPM_LOC_REG(x, 0x24)
+
+#define swap16(x)       __builtin_bswap16(x)
+#define swap32(x)       __builtin_bswap32(x)
+#define memcpy(d, s, n) __builtin_memcpy(d, s, n)
+
+static inline volatile uint32_t tis_read32(unsigned reg)
+{
+    return *(volatile uint32_t *)__va(TPM_TIS_BASE + reg);
+}
+
+static inline volatile uint8_t tis_read8(unsigned reg)
+{
+    return *(volatile uint8_t *)__va(TPM_TIS_BASE + reg);
+}
+
+static inline void tis_write8(unsigned reg, uint8_t val)
+{
+    *(volatile uint8_t *)__va(TPM_TIS_BASE + reg) = val;
+}
+
+static inline void request_locality(unsigned loc)
+{
+    tis_write8(TPM_ACCESS_(loc), ACCESS_REQUEST_USE);
+    /* Check that locality was actually activated. */
+    while ( (tis_read8(TPM_ACCESS_(loc)) & ACCESS_ACTIVE_LOCALITY) == 0 );
+}
+
+static inline void relinquish_locality(unsigned loc)
+{
+    tis_write8(TPM_ACCESS_(loc), ACCESS_ACTIVE_LOCALITY);
+}
+
+static void send_cmd(unsigned loc, uint8_t *buf, unsigned i_size,
+                     unsigned *o_size)
+{
+    /*
+     * Value of "data available" bit counts only when "valid" field is set as
+     * well.
+     */
+    const unsigned data_avail = STS_VALID | STS_DATA_AVAIL;
+
+    unsigned i;
+
+    /* Make sure TPM can accept a command. */
+    if ( (tis_read8(TPM_STS_(loc)) & STS_COMMAND_READY) == 0 )
+    {
+        /* Abort current command. */
+        tis_write8(TPM_STS_(loc), STS_COMMAND_READY);
+        /* Wait until TPM is ready for a new one. */
+        while ( (tis_read8(TPM_STS_(loc)) & STS_COMMAND_READY) == 0 );
+    }
+
+    for ( i = 0; i < i_size; i++ )
+        tis_write8(TPM_DATA_FIFO_(loc), buf[i]);
+
+    tis_write8(TPM_STS_(loc), STS_TPM_GO);
+
+    /* Wait for the first byte of response. */
+    while ( (tis_read8(TPM_STS_(loc)) & data_avail) != data_avail);
+
+    for ( i = 0; i < *o_size && tis_read8(TPM_STS_(loc)) & data_avail; i++ )
+        buf[i] = tis_read8(TPM_DATA_FIFO_(loc));
+
+    if ( i < *o_size )
+        *o_size = i;
+
+    tis_write8(TPM_STS_(loc), STS_COMMAND_READY);
+}
+
+static inline bool is_tpm12(void)
+{
+    /*
+     * If one of these conditions is true:
+     *  - INTF_CAPABILITY_x.interfaceVersion is 0 (TIS <= 1.21)
+     *  - INTF_CAPABILITY_x.interfaceVersion is 2 (TIS == 1.3)
+     *  - STS_x.tpmFamily is 0
+     * we're dealing with TPM1.2.
+     */
+    uint32_t intf_version = tis_read32(TPM_INTF_CAPABILITY_(0))
+                          & INTF_VERSION_MASK;
+    return (intf_version == 0x00000000 || intf_version == 0x20000000 ||
+            (tis_read32(TPM_STS_(0)) & TPM_FAMILY_MASK) == 0);
+}
+
+/****************************** TPM1.2 specific *******************************/
+#define TPM_ORD_Extend              0x00000014
+#define TPM_ORD_SHA1Start           0x000000A0
+#define TPM_ORD_SHA1Update          0x000000A1
+#define TPM_ORD_SHA1CompleteExtend  0x000000A3
+
+#define TPM_TAG_RQU_COMMAND         0x00C1
+#define TPM_TAG_RSP_COMMAND         0x00C4
+
+/* All fields of following structs are big endian. */
+struct tpm_cmd_hdr {
+    uint16_t    tag;
+    uint32_t    paramSize;
+    uint32_t    ordinal;
+} __packed;
+
+struct tpm_rsp_hdr {
+    uint16_t    tag;
+    uint32_t    paramSize;
+    uint32_t    returnCode;
+} __packed;
+
+struct extend_cmd {
+    struct tpm_cmd_hdr h;
+    uint32_t pcrNum;
+    uint8_t inDigest[SHA1_DIGEST_SIZE];
+} __packed;
+
+struct extend_rsp {
+    struct tpm_rsp_hdr h;
+    uint8_t outDigest[SHA1_DIGEST_SIZE];
+} __packed;
+
+struct sha1_start_cmd {
+    struct tpm_cmd_hdr h;
+} __packed;
+
+struct sha1_start_rsp {
+    struct tpm_rsp_hdr h;
+    uint32_t maxNumBytes;
+} __packed;
+
+struct sha1_update_cmd {
+    struct tpm_cmd_hdr h;
+    uint32_t numBytes;          /* Must be a multiple of 64 */
+    uint8_t hashData[];
+} __packed;
+
+struct sha1_update_rsp {
+    struct tpm_rsp_hdr h;
+} __packed;
+
+struct sha1_complete_extend_cmd {
+    struct tpm_cmd_hdr h;
+    uint32_t pcrNum;
+    uint32_t hashDataSize;      /* 0-64, inclusive */
+    uint8_t hashData[];
+} __packed;
+
+struct sha1_complete_extend_rsp {
+    struct tpm_rsp_hdr h;
+    uint8_t hashValue[SHA1_DIGEST_SIZE];
+    uint8_t outDigest[SHA1_DIGEST_SIZE];
+} __packed;
+
+struct TPM12_PCREvent {
+    uint32_t PCRIndex;
+    uint32_t Type;
+    uint8_t Digest[SHA1_DIGEST_SIZE];
+    uint32_t Size;
+    uint8_t Data[];
+};
+
+struct txt_ev_log_container_12 {
+    char        Signature[20];      /* "TXT Event Container", null-terminated */
+    uint8_t     Reserved[12];
+    uint8_t     ContainerVerMajor;
+    uint8_t     ContainerVerMinor;
+    uint8_t     PCREventVerMajor;
+    uint8_t     PCREventVerMinor;
+    uint32_t    ContainerSize;      /* Allocated size */
+    uint32_t    PCREventsOffset;
+    uint32_t    NextEventOffset;
+    struct TPM12_PCREvent   PCREvents[];
+};
+
+#ifdef __EARLY_SLAUNCH__
+/*
+ * TPM1.2 is required to support commands of up to 1101 bytes, vendors rarely
+ * go above that. Limit maximum size of block of data to be hashed to 1024.
+ */
+#define MAX_HASH_BLOCK      1024
+#define CMD_RSP_BUF_SIZE    (sizeof(struct sha1_update_cmd) + MAX_HASH_BLOCK)
+
+union cmd_rsp {
+    struct sha1_start_cmd start_c;
+    struct sha1_start_rsp start_r;
+    struct sha1_update_cmd update_c;
+    struct sha1_update_rsp update_r;
+    struct sha1_complete_extend_cmd finish_c;
+    struct sha1_complete_extend_rsp finish_r;
+    uint8_t buf[CMD_RSP_BUF_SIZE];
+};
+
+/* Returns true on success. */
+static bool tpm12_hash_extend(unsigned loc, const uint8_t *buf, unsigned size,
+                              unsigned pcr, uint8_t *out_digest)
+{
+    union cmd_rsp cmd_rsp;
+    unsigned max_bytes = MAX_HASH_BLOCK;
+    unsigned o_size = sizeof(cmd_rsp);
+    bool success = false;
+
+    request_locality(loc);
+
+    cmd_rsp.start_c = (struct sha1_start_cmd) {
+        .h.tag = swap16(TPM_TAG_RQU_COMMAND),
+        .h.paramSize = swap32(sizeof(struct sha1_start_cmd)),
+        .h.ordinal = swap32(TPM_ORD_SHA1Start),
+    };
+
+    send_cmd(loc, cmd_rsp.buf, sizeof(struct sha1_start_cmd), &o_size);
+    if ( o_size < sizeof(struct sha1_start_rsp) )
+        goto error;
+
+    if ( max_bytes > swap32(cmd_rsp.start_r.maxNumBytes) )
+        max_bytes = swap32(cmd_rsp.start_r.maxNumBytes);
+
+    while ( size > 64 )
+    {
+        if ( size < max_bytes )
+            max_bytes = size & ~(64 - 1);
+
+        o_size = sizeof(cmd_rsp);
+
+        cmd_rsp.update_c = (struct sha1_update_cmd){
+            .h.tag = swap16(TPM_TAG_RQU_COMMAND),
+            .h.paramSize = swap32(sizeof(struct sha1_update_cmd) + max_bytes),
+            .h.ordinal = swap32(TPM_ORD_SHA1Update),
+            .numBytes = swap32(max_bytes),
+        };
+        memcpy(cmd_rsp.update_c.hashData, buf, max_bytes);
+
+        send_cmd(loc, cmd_rsp.buf, sizeof(struct sha1_update_cmd) + max_bytes,
+                 &o_size);
+        if ( o_size < sizeof(struct sha1_update_rsp) )
+            goto error;
+
+        size -= max_bytes;
+        buf += max_bytes;
+    }
+
+    o_size = sizeof(cmd_rsp);
+
+    cmd_rsp.finish_c = (struct sha1_complete_extend_cmd) {
+        .h.tag = swap16(TPM_TAG_RQU_COMMAND),
+        .h.paramSize = swap32(sizeof(struct sha1_complete_extend_cmd) + size),
+        .h.ordinal = swap32(TPM_ORD_SHA1CompleteExtend),
+        .pcrNum = swap32(pcr),
+        .hashDataSize = swap32(size),
+    };
+    memcpy(cmd_rsp.finish_c.hashData, buf, size);
+
+    send_cmd(loc, cmd_rsp.buf, sizeof(struct sha1_complete_extend_cmd) + size,
+             &o_size);
+    if ( o_size < sizeof(struct sha1_complete_extend_rsp) )
+        goto error;
+
+    if ( out_digest != NULL )
+        memcpy(out_digest, cmd_rsp.finish_r.hashValue, SHA1_DIGEST_SIZE);
+
+    success = true;
+
+error:
+    relinquish_locality(loc);
+    return success;
+}
+
+#else
+
+union cmd_rsp {
+    struct extend_cmd extend_c;
+    struct extend_rsp extend_r;
+};
+
+/* Returns true on success. */
+static bool tpm12_hash_extend(unsigned loc, const uint8_t *buf, unsigned size,
+                              unsigned pcr, uint8_t *out_digest)
+{
+    union cmd_rsp cmd_rsp;
+    unsigned o_size = sizeof(cmd_rsp);
+
+    sha1_hash(buf, size, out_digest);
+
+    request_locality(loc);
+
+    cmd_rsp.extend_c = (struct extend_cmd) {
+        .h.tag = swap16(TPM_TAG_RQU_COMMAND),
+        .h.paramSize = swap32(sizeof(struct extend_cmd)),
+        .h.ordinal = swap32(TPM_ORD_Extend),
+        .pcrNum = swap32(pcr),
+    };
+
+    memcpy(cmd_rsp.extend_c.inDigest, out_digest, SHA1_DIGEST_SIZE);
+
+    send_cmd(loc, (uint8_t *)&cmd_rsp, sizeof(struct extend_cmd), &o_size);
+
+    relinquish_locality(loc);
+
+    return (o_size >= sizeof(struct extend_rsp));
+}
+
+#endif /* __EARLY_SLAUNCH__ */
+
+static void *create_log_event12(struct txt_ev_log_container_12 *evt_log,
+                                uint32_t evt_log_size, uint32_t pcr,
+                                uint32_t type, const uint8_t *data,
+                                unsigned data_size)
+{
+    struct TPM12_PCREvent *new_entry;
+
+    new_entry = (void *)(((uint8_t *)evt_log) + evt_log->NextEventOffset);
+
+    /*
+     * Check if there is enough space left for new entry.
+     * Note: it is possible to introduce a gap in event log if entry with big
+     * data_size is followed by another entry with smaller data. Maybe we should
+     * cap the event log size in such case?
+     */
+    if ( evt_log->NextEventOffset + sizeof(struct TPM12_PCREvent) + data_size
+         > evt_log_size )
+        return NULL;
+
+    evt_log->NextEventOffset += sizeof(struct TPM12_PCREvent) + data_size;
+
+    new_entry->PCRIndex = pcr;
+    new_entry->Type = type;
+    new_entry->Size = data_size;
+
+    if ( data && data_size > 0 )
+        memcpy(new_entry->Data, data, data_size);
+
+    return new_entry->Digest;
+}
+
+/************************** end of TPM1.2 specific ****************************/
+
+void tpm_hash_extend(unsigned loc, unsigned pcr, const uint8_t *buf,
+                     unsigned size, uint32_t type, const uint8_t *log_data,
+                     unsigned log_data_size)
+{
+    void *evt_log_addr;
+    uint32_t evt_log_size;
+
+    find_evt_log(slaunch_get_slrt(), &evt_log_addr, &evt_log_size);
+    evt_log_addr = __va((uintptr_t)evt_log_addr);
+
+    if ( is_tpm12() )
+    {
+        uint8_t sha1_digest[SHA1_DIGEST_SIZE];
+
+        struct txt_ev_log_container_12 *evt_log = evt_log_addr;
+        void *entry_digest = create_log_event12(evt_log, evt_log_size, pcr,
+                                                type, log_data, log_data_size);
+
+        /* We still need to write computed hash somewhere. */
+        if ( entry_digest == NULL )
+            entry_digest = sha1_digest;
+
+        if ( !tpm12_hash_extend(loc, buf, size, pcr, entry_digest) )
+        {
+#ifndef __EARLY_SLAUNCH__
+            printk(XENLOG_ERR "Extending PCR%u failed\n", pcr);
+#endif
+        }
+    }
+}
+
+#ifdef __EARLY_SLAUNCH__
+void tpm_extend_mbi(uint32_t *mbi, uint32_t slrt_pa)
+{
+    /* Need this to implement slaunch_get_slrt() for early TPM code. */
+    slrt_location = slrt_pa;
+
+    /* MBI starts with uint32_t total_size. */
+    tpm_hash_extend(DRTM_LOC, DRTM_DATA_PCR, (uint8_t *)mbi, *mbi,
+                    DLE_EVTYPE_SLAUNCH, NULL, 0);
+}
+#endif
-- 
2.49.0


