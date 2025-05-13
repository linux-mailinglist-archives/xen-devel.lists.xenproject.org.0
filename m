Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E59AB5AB5
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 19:06:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983182.1369532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEt5H-0003jO-KY; Tue, 13 May 2025 17:06:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983182.1369532; Tue, 13 May 2025 17:06:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEt5H-0003cM-H0; Tue, 13 May 2025 17:06:27 +0000
Received: by outflank-mailman (input) for mailman id 983182;
 Tue, 13 May 2025 17:06:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dvFL=X5=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uEt5F-0003Mm-Ve
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 17:06:26 +0000
Received: from 8.mo560.mail-out.ovh.net (8.mo560.mail-out.ovh.net
 [188.165.52.147]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99f1d132-301c-11f0-9eb6-5ba50f476ded;
 Tue, 13 May 2025 19:06:25 +0200 (CEST)
Received: from director2.ghost.mail-out.ovh.net (unknown [10.109.139.93])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4ZxjYX3pjHz2Cc8
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 17:06:24 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-rfvwm (unknown [10.111.182.110])
 by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 7816F1FD1D;
 Tue, 13 May 2025 17:06:23 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.109])
 by ghost-submission-5b5ff79f4f-rfvwm with ESMTPSA
 id MrzEDA98I2gRCwAAL8LKOQ
 (envelope-from <sergii.dmytruk@3mdeb.com>); Tue, 13 May 2025 17:06:23 +0000
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
X-Inumbo-ID: 99f1d132-301c-11f0-9eb6-5ba50f476ded
Authentication-Results:garm.ovh; auth=pass (GARM-109S003822ad1ed-d2fa-42ec-900b-f5c186a334db,
                    0F27B6D195039ACFBDF5EC7F2AC12BEA7E98F15C) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ross Philipson <ross.philipson@oracle.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	=?UTF-8?q?Mateusz=20M=C3=B3wka?= <mateusz.mowka@intel.com>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH v2 01/22] x86/include/asm/intel-txt.h: constants and accessors for TXT registers and heap
Date: Tue, 13 May 2025 20:05:38 +0300
Message-ID: <c049f4ced707769a630cbb8d38a617910279b404.1747155790.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
References: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8939645263790388380
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdegieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgvrhhgihhiucffmhihthhruhhkuceoshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpefhheefheduieelieekfffgfffgfedutdevleevvdfhfffgledvgfdtuddtheefieenucfkphepuddvjedrtddrtddruddpudejiedrudduuddrudekuddrudejkedpfeejrdehledrudegvddruddtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehiedtmgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=2RbMwstbyyOU4TxQ7vyGzM7EFTqaGpSH29ZxUCa59fk=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1747155984; v=1;
 b=NSA+fs3aROk+AtkBhXfQ4O3gp2O/hdfYc2sqrYiBx6Xh+EVCjArqOSmbMGT2SmM/atXFwOv1
 eNY1kfDQrznxJ7wf5gK/ZYXP8d+xUYm9Csi+5f+gcbTXgf8n+DjFqiytdKf4yRJhi0HEXrxe2ds
 utXV/cl+pAJpNs7iSiaRPEmvZExRMabceQLMkCRbB8L5yDNbM7uCRYbatZpNxUJWvc0fN7741Oh
 SvpiCNaserWyUShopMa57f8wdQ9GaWvyVSS629Pf6A0l59Zc12wWwOP98WpEueLPaAAI5yeHqwr
 9hmopJ1rZcgE/0iii3PbGbQ+VTsGp1rOHSayk/z7OasfQ==

From: Krystian Hebel <krystian.hebel@3mdeb.com>

The file contains TXT register spaces base address, registers offsets,
error codes and inline functions for accessing structures stored on
TXT heap.

Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---
 xen/arch/x86/include/asm/intel-txt.h | 277 +++++++++++++++++++++++++++
 xen/arch/x86/tboot.c                 |  20 +-
 2 files changed, 279 insertions(+), 18 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/intel-txt.h

diff --git a/xen/arch/x86/include/asm/intel-txt.h b/xen/arch/x86/include/asm/intel-txt.h
new file mode 100644
index 0000000000..07be43f557
--- /dev/null
+++ b/xen/arch/x86/include/asm/intel-txt.h
@@ -0,0 +1,277 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#ifndef ASM__X86__INTEL_TXT_H
+#define ASM__X86__INTEL_TXT_H
+
+/*
+ * TXT configuration registers (offsets from TXT_{PUB, PRIV}_CONFIG_REGS_BASE)
+ */
+#define TXT_PUB_CONFIG_REGS_BASE        0xfed30000U
+#define TXT_PRIV_CONFIG_REGS_BASE       0xfed20000U
+
+/*
+ * The same set of registers is exposed twice (with different permissions) and
+ * they are allocated continuously with page alignment.
+ */
+#define NR_TXT_CONFIG_SIZE \
+    (TXT_PUB_CONFIG_REGS_BASE - TXT_PRIV_CONFIG_REGS_BASE)
+
+/* Offsets from pub/priv config space. */
+#define TXTCR_STS                       0x0000
+#define TXTCR_ESTS                      0x0008
+#define TXTCR_ERRORCODE                 0x0030
+#define TXTCR_CMD_RESET                 0x0038
+#define TXTCR_CMD_CLOSE_PRIVATE         0x0048
+#define TXTCR_DIDVID                    0x0110
+#define TXTCR_VER_EMIF                  0x0200
+#define TXTCR_CMD_UNLOCK_MEM_CONFIG     0x0218
+#define TXTCR_SINIT_BASE                0x0270
+#define TXTCR_SINIT_SIZE                0x0278
+#define TXTCR_MLE_JOIN                  0x0290
+#define TXTCR_HEAP_BASE                 0x0300
+#define TXTCR_HEAP_SIZE                 0x0308
+#define TXTCR_SCRATCHPAD                0x0378
+#define TXTCR_CMD_OPEN_LOCALITY1        0x0380
+#define TXTCR_CMD_CLOSE_LOCALITY1       0x0388
+#define TXTCR_CMD_OPEN_LOCALITY2        0x0390
+#define TXTCR_CMD_CLOSE_LOCALITY2       0x0398
+#define TXTCR_CMD_SECRETS               0x08e0
+#define TXTCR_CMD_NO_SECRETS            0x08e8
+#define TXTCR_E2STS                     0x08f0
+
+/*
+ * Secure Launch Defined Error Codes used in MLE-initiated TXT resets.
+ *
+ * TXT Specification
+ * Appendix I ACM Error Codes
+ */
+#define SLAUNCH_ERROR_GENERIC                0xc0008001U
+#define SLAUNCH_ERROR_TPM_INIT               0xc0008002U
+#define SLAUNCH_ERROR_TPM_INVALID_LOG20      0xc0008003U
+#define SLAUNCH_ERROR_TPM_LOGGING_FAILED     0xc0008004U
+#define SLAUNCH_ERROR_REGION_STRADDLE_4GB    0xc0008005U
+#define SLAUNCH_ERROR_TPM_EXTEND             0xc0008006U
+#define SLAUNCH_ERROR_MTRR_INV_VCNT          0xc0008007U
+#define SLAUNCH_ERROR_MTRR_INV_DEF_TYPE      0xc0008008U
+#define SLAUNCH_ERROR_MTRR_INV_BASE          0xc0008009U
+#define SLAUNCH_ERROR_MTRR_INV_MASK          0xc000800aU
+#define SLAUNCH_ERROR_MSR_INV_MISC_EN        0xc000800bU
+#define SLAUNCH_ERROR_INV_AP_INTERRUPT       0xc000800cU
+#define SLAUNCH_ERROR_INTEGER_OVERFLOW       0xc000800dU
+#define SLAUNCH_ERROR_HEAP_WALK              0xc000800eU
+#define SLAUNCH_ERROR_HEAP_MAP               0xc000800fU
+#define SLAUNCH_ERROR_REGION_ABOVE_4GB       0xc0008010U
+#define SLAUNCH_ERROR_HEAP_INVALID_DMAR      0xc0008011U
+#define SLAUNCH_ERROR_HEAP_DMAR_SIZE         0xc0008012U
+#define SLAUNCH_ERROR_HEAP_DMAR_MAP          0xc0008013U
+#define SLAUNCH_ERROR_HI_PMR_BASE            0xc0008014U
+#define SLAUNCH_ERROR_HI_PMR_SIZE            0xc0008015U
+#define SLAUNCH_ERROR_LO_PMR_BASE            0xc0008016U
+#define SLAUNCH_ERROR_LO_PMR_SIZE            0xc0008017U
+#define SLAUNCH_ERROR_LO_PMR_MLE             0xc0008018U
+#define SLAUNCH_ERROR_INITRD_TOO_BIG         0xc0008019U
+#define SLAUNCH_ERROR_HEAP_ZERO_OFFSET       0xc000801aU
+#define SLAUNCH_ERROR_WAKE_BLOCK_TOO_SMALL   0xc000801bU
+#define SLAUNCH_ERROR_MLE_BUFFER_OVERLAP     0xc000801cU
+#define SLAUNCH_ERROR_BUFFER_BEYOND_PMR      0xc000801dU
+#define SLAUNCH_ERROR_OS_SINIT_BAD_VERSION   0xc000801eU
+#define SLAUNCH_ERROR_EVENTLOG_MAP           0xc000801fU
+#define SLAUNCH_ERROR_TPM_NUMBER_ALGS        0xc0008020U
+#define SLAUNCH_ERROR_TPM_UNKNOWN_DIGEST     0xc0008021U
+#define SLAUNCH_ERROR_TPM_INVALID_EVENT      0xc0008022U
+
+#define SLAUNCH_BOOTLOADER_MAGIC             0x4c534254
+
+#ifndef __ASSEMBLY__
+
+/* Need to differentiate between pre- and post paging enabled. */
+#ifdef __EARLY_SLAUNCH__
+#include <xen/macros.h>
+#define _txt(x) _p(x)
+#else
+#include <xen/types.h>
+#include <asm/page.h>   // __va()
+#define _txt(x) __va(x)
+#endif
+
+/*
+ * Always use private space as some of registers are either read-only or not
+ * present in public space.
+ */
+static inline uint64_t read_txt_reg(int reg_no)
+{
+    volatile uint64_t *reg = _txt(TXT_PRIV_CONFIG_REGS_BASE + reg_no);
+    return *reg;
+}
+
+static inline void write_txt_reg(int reg_no, uint64_t val)
+{
+    volatile uint64_t *reg = _txt(TXT_PRIV_CONFIG_REGS_BASE + reg_no);
+    *reg = val;
+    /* This serves as TXT register barrier */
+    (void)read_txt_reg(TXTCR_ESTS);
+}
+
+static inline void txt_reset(uint32_t error)
+{
+    write_txt_reg(TXTCR_ERRORCODE, error);
+    write_txt_reg(TXTCR_CMD_NO_SECRETS, 1);
+    write_txt_reg(TXTCR_CMD_UNLOCK_MEM_CONFIG, 1);
+    write_txt_reg(TXTCR_CMD_RESET, 1);
+    while (1);
+}
+
+/*
+ * Secure Launch defined OS/MLE TXT Heap table
+ */
+struct txt_os_mle_data {
+    uint32_t version;
+    uint32_t reserved;
+    uint64_t slrt;
+    uint64_t txt_info;
+    uint32_t ap_wake_block;
+    uint32_t ap_wake_block_size;
+    uint8_t mle_scratch[64];
+} __packed;
+
+/*
+ * TXT specification defined BIOS data TXT Heap table
+ */
+struct txt_bios_data {
+    uint32_t version; /* Currently 5 for TPM 1.2 and 6 for TPM 2.0 */
+    uint32_t bios_sinit_size;
+    uint64_t reserved1;
+    uint64_t reserved2;
+    uint32_t num_logical_procs;
+    /* Versions >= 3 && < 5 */
+    uint32_t sinit_flags;
+    /* Versions >= 5 with updates in version 6 */
+    uint32_t mle_flags;
+    /* Versions >= 4 */
+    /* Ext Data Elements */
+} __packed;
+
+/*
+ * TXT specification defined OS/SINIT TXT Heap table
+ */
+struct txt_os_sinit_data {
+    uint32_t version;       /* Currently 6 for TPM 1.2 and 7 for TPM 2.0 */
+    uint32_t flags;         /* Reserved in version 6 */
+    uint64_t mle_ptab;
+    uint64_t mle_size;
+    uint64_t mle_hdr_base;
+    uint64_t vtd_pmr_lo_base;
+    uint64_t vtd_pmr_lo_size;
+    uint64_t vtd_pmr_hi_base;
+    uint64_t vtd_pmr_hi_size;
+    uint64_t lcp_po_base;
+    uint64_t lcp_po_size;
+    uint32_t capabilities;
+    /* Version = 5 */
+    uint64_t efi_rsdt_ptr;  /* RSD*P* in versions >= 6 */
+    /* Versions >= 6 */
+    /* Ext Data Elements */
+} __packed;
+
+/*
+ * TXT specification defined SINIT/MLE TXT Heap table
+ */
+struct txt_sinit_mle_data {
+    uint32_t version;  /* Current values are 6 through 9 */
+    /* Versions <= 8, fields until lcp_policy_control must be 0 for >= 9 */
+    uint8_t bios_acm_id[20];
+    uint32_t edx_senter_flags;
+    uint64_t mseg_valid;
+    uint8_t sinit_hash[20];
+    uint8_t mle_hash[20];
+    uint8_t stm_hash[20];
+    uint8_t lcp_policy_hash[20];
+    uint32_t lcp_policy_control;
+    /* Versions >= 7 */
+    uint32_t rlp_wakeup_addr;
+    uint32_t reserved;
+    uint32_t num_of_sinit_mdrs;
+    uint32_t sinit_mdrs_table_offset;
+    uint32_t sinit_vtd_dmar_table_size;
+    uint32_t sinit_vtd_dmar_table_offset;
+    /* Versions >= 8 */
+    uint32_t processor_scrtm_status;
+    /* Versions >= 9 */
+    /* Ext Data Elements */
+} __packed;
+
+/*
+ * Functions to extract data from the Intel TXT Heap Memory. The layout
+ * of the heap is as follows:
+ *  +------------------------------------+
+ *  | Size of Bios Data table (uint64_t) |
+ *  +------------------------------------+
+ *  | Bios Data table                    |
+ *  +------------------------------------+
+ *  | Size of OS MLE table (uint64_t)    |
+ *  +------------------------------------+
+ *  | OS MLE table                       |
+ *  +--------------------------------    +
+ *  | Size of OS SINIT table (uint64_t)  |
+ *  +------------------------------------+
+ *  | OS SINIT table                     |
+ *  +------------------------------------+
+ *  | Size of SINIT MLE table (uint64_t) |
+ *  +------------------------------------+
+ *  | SINIT MLE table                    |
+ *  +------------------------------------+
+ *
+ *  NOTE: the table size fields include the 8 byte size field itself.
+ */
+static inline uint64_t txt_bios_data_size(void *heap)
+{
+    return *((uint64_t *)heap) - sizeof(uint64_t);
+}
+
+static inline void *txt_bios_data_start(void *heap)
+{
+    return heap + sizeof(uint64_t);
+}
+
+static inline uint64_t txt_os_mle_data_size(void *heap)
+{
+    return *((uint64_t *)(txt_bios_data_start(heap) +
+                          txt_bios_data_size(heap))) -
+        sizeof(uint64_t);
+}
+
+static inline void *txt_os_mle_data_start(void *heap)
+{
+    return txt_bios_data_start(heap) + txt_bios_data_size(heap) +
+        sizeof(uint64_t);
+}
+
+static inline uint64_t txt_os_sinit_data_size(void *heap)
+{
+    return *((uint64_t *)(txt_os_mle_data_start(heap) +
+                          txt_os_mle_data_size(heap))) -
+        sizeof(uint64_t);
+}
+
+static inline void *txt_os_sinit_data_start(void *heap)
+{
+    return txt_os_mle_data_start(heap) + txt_os_mle_data_size(heap) +
+        sizeof(uint64_t);
+}
+
+static inline uint64_t txt_sinit_mle_data_size(void *heap)
+{
+    return *((uint64_t *)(txt_os_sinit_data_start(heap) +
+                          txt_os_sinit_data_size(heap))) -
+        sizeof(uint64_t);
+}
+
+static inline void *txt_sinit_mle_data_start(void *heap)
+{
+    return txt_os_sinit_data_start(heap) + txt_os_sinit_data_size(heap) +
+        sizeof(uint64_t);
+}
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* ASM__X86__INTEL_TXT_H */
diff --git a/xen/arch/x86/tboot.c b/xen/arch/x86/tboot.c
index d5db60d335..8a573d8c79 100644
--- a/xen/arch/x86/tboot.c
+++ b/xen/arch/x86/tboot.c
@@ -15,6 +15,7 @@
 #include <asm/tboot.h>
 #include <asm/setup.h>
 #include <asm/trampoline.h>
+#include <asm/intel-txt.h>
 
 #include <crypto/vmac.h>
 
@@ -35,23 +36,6 @@ static uint64_t __initdata sinit_base, __initdata sinit_size;
 
 static bool __ro_after_init is_vtd;
 
-/*
- * TXT configuration registers (offsets from TXT_{PUB, PRIV}_CONFIG_REGS_BASE)
- */
-
-#define TXT_PUB_CONFIG_REGS_BASE       0xfed30000
-#define TXT_PRIV_CONFIG_REGS_BASE      0xfed20000
-
-/* # pages for each config regs space - used by fixmap */
-#define NR_TXT_CONFIG_PAGES     ((TXT_PUB_CONFIG_REGS_BASE -                \
-                                  TXT_PRIV_CONFIG_REGS_BASE) >> PAGE_SHIFT)
-
-/* offsets from pub/priv config space */
-#define TXTCR_SINIT_BASE            0x0270
-#define TXTCR_SINIT_SIZE            0x0278
-#define TXTCR_HEAP_BASE             0x0300
-#define TXTCR_HEAP_SIZE             0x0308
-
 #define SHA1_SIZE      20
 typedef uint8_t   sha1_hash_t[SHA1_SIZE];
 
@@ -409,7 +393,7 @@ int __init tboot_protect_mem_regions(void)
 
     /* TXT Private Space */
     rc = e820_change_range_type(&e820, TXT_PRIV_CONFIG_REGS_BASE,
-                 TXT_PRIV_CONFIG_REGS_BASE + NR_TXT_CONFIG_PAGES * PAGE_SIZE,
+                 TXT_PRIV_CONFIG_REGS_BASE + NR_TXT_CONFIG_SIZE,
                  E820_RESERVED, E820_UNUSABLE);
     if ( !rc )
         return 0;
-- 
2.49.0


