Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 268A5968C9B
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 19:01:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788312.1197872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slAQr-0004Ut-AU; Mon, 02 Sep 2024 17:01:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788312.1197872; Mon, 02 Sep 2024 17:01:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slAQq-0004RQ-Vz; Mon, 02 Sep 2024 17:01:36 +0000
Received: by outflank-mailman (input) for mailman id 788312;
 Mon, 02 Sep 2024 17:01:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uz6k=QA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1slAQp-0002e4-Ca
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 17:01:35 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01b7d4fd-694d-11ef-99a1-01e77a169b0f;
 Mon, 02 Sep 2024 19:01:33 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5342109d726so3231892e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 10:01:33 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-535408410f5sm1677618e87.211.2024.09.02.10.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 10:01:31 -0700 (PDT)
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
X-Inumbo-ID: 01b7d4fd-694d-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725296493; x=1725901293; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p9h2RnBPxLuIsZLCptIVXCyb1wEUmBx1i66bSmRTi+Q=;
        b=L5I6NgHr4PsyRT3dwR2XgtE2/1W39gbtcXMy7oLweuJhQoHFCtVwZHlAKo2Q7vqiMa
         lWBN1qeTB7m0w5QMTS6fJCyUeMvtPiLmIo4ADeIJdSgD3jhAdgndPsWwgmfu10ql0aUp
         68gpDD9HU4iEGg//o4swlS2Mev2jQn7A/sczQGhzaXtuhM9wPWsvh3n1m0X1OnZZN/81
         D4YKDxMfkIcVSj3h6kYiLILGuwN4ASqKIB26afRn86Wo1+R+7o/Lh5Lkt/pfvxCvKCiK
         NDttkNSukQPP2JRvkTYqu8no08L/iD2XwWRSFIRVSWV/WnI0VdaVgByj81a4+YmAKycq
         qYaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725296493; x=1725901293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p9h2RnBPxLuIsZLCptIVXCyb1wEUmBx1i66bSmRTi+Q=;
        b=PfP3gGR6JkL9ZaCrZVXTb+NeqY/2k5EDsWdmOG/fU2bHuxm4FCpfXen8IO6e9UXpzH
         5MCGSQ9LQKLRd3gNOiYqLPfZyr5EznUUZhwDTGSEu6N9yUt4waEJ6fZtmp3GbigKMcci
         UjDjUvclMlzaY43T6QhqM76kT4cWHs09S5QSWpVFwsslbOsAxRzvbG1t/7TLEvqxs6ZZ
         njWIYXK7e/Pq0FcC1J54+dl49vrwN3772R0i5imrm/jnZbrHjq7kIViJf+GjzB1qRNpf
         3KtxrNiEF9C3G+ejW8rVXeHjjdey2x0cFFtVykxeildzousDadHSYY9gre5pjOI8+LA/
         /wVg==
X-Gm-Message-State: AOJu0YygfZ/cSVkpRObaj+EoC87TnFEC2ykmvnvHT+jxxkbtjKIBqc6b
	KmWGVZgmQ7fNjNB0GJYMXB4qAtFvKEHZ2OC1ppOfet06WY+5ckbYKga68g==
X-Google-Smtp-Source: AGHT+IGtzZliJJ8IAXWTWBLVPh49HglXPbSPGAjEFKDEZFWDbLaf7gwMxX+rojvuqkRYG6mOlvleKw==
X-Received: by 2002:ac2:4f01:0:b0:533:447b:94f0 with SMTP id 2adb3069b0e04-535462f773emr3845469e87.10.1725296491789;
        Mon, 02 Sep 2024 10:01:31 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 7/9] xen/riscv: introduce and initialize SBI RFENCE extension
Date: Mon,  2 Sep 2024 19:01:20 +0200
Message-ID: <83ec05184983bdf9277a11d165b5c45e5116dd5d.1725295716.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1725295716.git.oleksii.kurochko@gmail.com>
References: <cover.1725295716.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce functions to work with the SBI RFENCE extension for issuing
various fence operations to remote CPUs.

Add the sbi_init() function along with auxiliary functions and macro
definitions for proper initialization and checking the availability of
SBI extensions. Currently, this is implemented only for RFENCE.

Introduce sbi_remote_sfence_vma() to send SFENCE_VMA instructions to
a set of target HARTs. This will support the implementation of
flush_xen_tlb_range_va().

Integrate __sbi_rfence_v02 from Linux kernel 6.6.0-rc4 with minimal
modifications:
 - Adapt to Xen code style.
 - Use cpuid_to_hartid() instead of cpuid_to_hartid_map[].
 - Update BIT(...) to BIT(..., UL).
 - Rename __sbi_rfence_v02_call to sbi_rfence_v02_real and
   remove the unused arg5.
 - Handle NULL cpu_mask to execute rfence on all CPUs by calling
   sbi_rfence_v02_real(..., 0UL, -1UL,...) instead of creating hmask.
 - change type for start_addr and size to vaddr_t and size_t.
 - Add an explanatory comment about when batching can and cannot occur,
   and why batching happens in the first place.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V6:
 - align with zeros the definition of SBI_SPEC_VERSION_MINOR_MASK.
 - drop fallthrough in sbi_err_map_xen_errno() between 'case SBI_ERR_FAILURE'
   and default.
 - update return type of sbi_{major,minor}_version() to unsigned int.
 - move BUG_ON(ret.value < 0); inside if ( !ret.error ) in sbi_ext_base_func().
 - print fid as %#lx instead of %lu.
 - print ret.error instead of what sbi_err_map_xen_errno() as it may lose
   information.
 - drop unrelated information in the comment of the for_each_cpu cycle in
   sbi_rfence_v02().
 - small refactoring in sbi_rfence_v02(): making uniform path for returning
   result variable.
 - rename start_addr argument to start for sbi_remote_sfence_vma().
 - use sbi_err_map_xen_errno() inside sbi_probe_extension() to return an error
   value instead of -EOPNOTSUPP.
 - s/unsigned long start/vaddr_t start
 - s/unsgined long size/size_t size
 - update the commit message.
---
Changes in V5:
 - update the comment for sbi_has_rfence().
 - update the comment for sbi_remote_sfence_vma().
 - update the prototype of sbi_remote_sfence_vma() and declare cpu_mask
   argument as pointer to const.
 - use MASK_EXTR() for sbi_{major, minor}_version().
 - redefine SBI_SPEC_VERSION_MAJOR_MASK as 0x7F000000
 - drop SBI_SPEC_VERSION_MAJOR_SHIFT as unneeded.
 - add BUG_ON(ret.value < 0) inside sbi_ext_base_func() to be sure that
   ret.value is always >= 0 as SBI spec explicitly doesn't say that.
 - s/__sbi_rfence_v02_real/sbi_rfence_v02_real
 - s/__sbi_rfence_v02/sbi_rfence_v02
 - s/__sbi_rfence/sbi_rfence
 - fold cases inside sbi_rfence_v02_real()
 - mark sbi_rfence_v02 with cf_check.
 - code style fixes in sbi_rfence_v02().
 - add the comment with explanation of algorithm used in sbi_rfence_v02().
 - use __ro_after_init for sbi_rfence variable.
 - add ASSERT(sbi_rfebce) inside sbi_remote_sfence_vma to be sure that it
   is not NULL.
 - drop local variable ret inside sbi_init() and init sbi_spec_version
   directly by return value of sbi_get_spec_version() as this function
   should always be must always succeed.
 - add the comment above sbi_get_spec_version().
 - add BUG_ON for sbi_fw_id and sbi_fw_version() to be sure that they
   have correct values.
 - make sbi_fw_id, sbi_fw_version as local because they are used only once
   for printk().
 - s/veriosn/version
 - drop  BUG_ON("At the moment flush_xen_tlb_range_va() uses SBI rfence...")
   as now we have ASSERT() in the flace where sbi_rfence is actually used.
 - update the commit message.
 - s/BUG_ON("Ooops. SBI spec version 0.1 detected. Need to add support")/panic("Ooops. SBI ...");
---
Changes in V4:
 - update the commit message.
 - code style fixes
 - update return type of sbi_has_rfence() from int to bool and drop
   conditional operator inside implementation.
 - Update mapping of SBI_ERR_FAILURE in sbi_err_map_xen_errno().
 - Update return type of sbi_spec_is_0_1() and drop conditional operator
   inside implementation.
 - s/0x%lx/%#lx
 - update the comment above declaration of sbi_remote_sfence_vma() with
   more detailed explanation what the function does.
 - update prototype of sbi_remote_sfence_vma(). Now it receives cpumask_t
   and returns int.
 - refactor __sbi_rfence_v02() take from the Linux kernel as it takes into
   account a case that hart id could be from different hbase. For example,
   the case when hart IDs are the following 0, 3, 65, 2. Or the case when
   hart IDs are unsorted: 0 3 1 2.
 - drop sbi_cpumask_to_hartmask() as it is not needed anymore
 - Update the prototype of sbi_remote_sfence_vma() and implemntation accordingly
   to the fact it returns 'int'.
 - s/flush_xen_tlb_one_local/flush_tlb_one_local
---
Changes in V3:
 - new patch.
---
 xen/arch/riscv/include/asm/sbi.h |  63 +++++++
 xen/arch/riscv/sbi.c             | 274 ++++++++++++++++++++++++++++++-
 xen/arch/riscv/setup.c           |   3 +
 3 files changed, 339 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/include/asm/sbi.h b/xen/arch/riscv/include/asm/sbi.h
index 0e6820a4ed..445d215535 100644
--- a/xen/arch/riscv/include/asm/sbi.h
+++ b/xen/arch/riscv/include/asm/sbi.h
@@ -12,8 +12,41 @@
 #ifndef __ASM_RISCV_SBI_H__
 #define __ASM_RISCV_SBI_H__
 
+#include <xen/cpumask.h>
+
 #define SBI_EXT_0_1_CONSOLE_PUTCHAR		0x1
 
+#define SBI_EXT_BASE                    0x10
+#define SBI_EXT_RFENCE                  0x52464E43
+
+/* SBI function IDs for BASE extension */
+#define SBI_EXT_BASE_GET_SPEC_VERSION   0x0
+#define SBI_EXT_BASE_GET_IMP_ID         0x1
+#define SBI_EXT_BASE_GET_IMP_VERSION    0x2
+#define SBI_EXT_BASE_PROBE_EXT          0x3
+
+/* SBI function IDs for RFENCE extension */
+#define SBI_EXT_RFENCE_REMOTE_FENCE_I           0x0
+#define SBI_EXT_RFENCE_REMOTE_SFENCE_VMA        0x1
+#define SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID   0x2
+#define SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA       0x3
+#define SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA_VMID  0x4
+#define SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA       0x5
+#define SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID  0x6
+
+#define SBI_SPEC_VERSION_MAJOR_MASK     0x7f000000
+#define SBI_SPEC_VERSION_MINOR_MASK     0x00ffffff
+
+/* SBI return error codes */
+#define SBI_SUCCESS             0
+#define SBI_ERR_FAILURE         (-1)
+#define SBI_ERR_NOT_SUPPORTED   (-2)
+#define SBI_ERR_INVALID_PARAM   (-3)
+#define SBI_ERR_DENIED          (-4)
+#define SBI_ERR_INVALID_ADDRESS (-5)
+
+#define SBI_SPEC_VERSION_DEFAULT 0x1
+
 struct sbiret {
     long error;
     long value;
@@ -31,4 +64,34 @@ struct sbiret sbi_ecall(unsigned long ext, unsigned long fid,
  */
 void sbi_console_putchar(int ch);
 
+/*
+ * Check underlying SBI implementation has RFENCE
+ *
+ * @return true for supported AND false for not-supported
+ */
+bool sbi_has_rfence(void);
+
+/*
+ * Instructs the remote harts to execute one or more SFENCE.VMA
+ * instructions, covering the range of virtual addresses between
+ * [start_addr, start_addr + size).
+ *
+ * Returns 0 if IPI was sent to all the targeted harts successfully
+ * or negative value if start_addr or size is not valid.
+ *
+ * @hart_mask a cpu mask containing all the target harts.
+ * @param start virtual address start
+ * @param size virtual address range size
+ */
+int sbi_remote_sfence_vma(const cpumask_t *cpu_mask,
+                          vaddr_t start,
+                          size_t size);
+
+/*
+ * Initialize SBI library
+ *
+ * @return 0 on success, otherwise negative errno on failure
+ */
+int sbi_init(void);
+
 #endif /* __ASM_RISCV_SBI_H__ */
diff --git a/xen/arch/riscv/sbi.c b/xen/arch/riscv/sbi.c
index 0ae166c861..30ef661118 100644
--- a/xen/arch/riscv/sbi.c
+++ b/xen/arch/riscv/sbi.c
@@ -5,13 +5,26 @@
  * (anup.patel@wdc.com).
  *
  * Modified by Bobby Eshleman (bobby.eshleman@gmail.com).
+ * Modified by Oleksii Kurochko (oleksii.kurochko@gmail.com).
  *
  * Copyright (c) 2019 Western Digital Corporation or its affiliates.
- * Copyright (c) 2021-2023 Vates SAS.
+ * Copyright (c) 2021-2024 Vates SAS.
  */
 
+#include <xen/compiler.h>
+#include <xen/const.h>
+#include <xen/cpumask.h>
+#include <xen/errno.h>
+#include <xen/init.h>
+#include <xen/lib.h>
+#include <xen/sections.h>
+#include <xen/smp.h>
+
+#include <asm/processor.h>
 #include <asm/sbi.h>
 
+static unsigned long __ro_after_init sbi_spec_version = SBI_SPEC_VERSION_DEFAULT;
+
 struct sbiret sbi_ecall(unsigned long ext, unsigned long fid,
                         unsigned long arg0, unsigned long arg1,
                         unsigned long arg2, unsigned long arg3,
@@ -38,7 +51,266 @@ struct sbiret sbi_ecall(unsigned long ext, unsigned long fid,
     return ret;
 }
 
+static int sbi_err_map_xen_errno(int err)
+{
+    switch ( err )
+    {
+    case SBI_SUCCESS:
+        return 0;
+    case SBI_ERR_DENIED:
+        return -EACCES;
+    case SBI_ERR_INVALID_PARAM:
+        return -EINVAL;
+    case SBI_ERR_INVALID_ADDRESS:
+        return -EFAULT;
+    case SBI_ERR_NOT_SUPPORTED:
+        return -EOPNOTSUPP;
+    case SBI_ERR_FAILURE:
+    default:
+        return -ENOSYS;
+    };
+}
+
 void sbi_console_putchar(int ch)
 {
     sbi_ecall(SBI_EXT_0_1_CONSOLE_PUTCHAR, 0, ch, 0, 0, 0, 0, 0);
 }
+
+static unsigned int sbi_major_version(void)
+{
+    return MASK_EXTR(sbi_spec_version, SBI_SPEC_VERSION_MAJOR_MASK);
+}
+
+static unsigned int sbi_minor_version(void)
+{
+    return MASK_EXTR(sbi_spec_version, SBI_SPEC_VERSION_MINOR_MASK);
+}
+
+static long sbi_ext_base_func(long fid)
+{
+    struct sbiret ret;
+
+    ret = sbi_ecall(SBI_EXT_BASE, fid, 0, 0, 0, 0, 0, 0);
+
+    if ( !ret.error )
+    {
+       /*
+        * I wasn't able to find a case in the SBI spec where sbiret.value
+        * could be negative.
+        *
+        * Unfortunately, the spec does not specify the possible values of
+        * sbiret.value, but based on the description of the SBI function,
+        * ret.value >= 0 when sbiret.error = 0. SPI spec specify only
+        * possible value for sbiret.error (<= 0 whwere 0 is SBI_SUCCESS ).
+        *
+        * Just to be sure that SBI base extension functions one day won't
+        * start to return a negative value for sbiret.value when
+        * sbiret.error < 0 BUG_ON() is added.
+        */
+        BUG_ON(ret.value < 0);
+
+        return ret.value;
+    }
+    else
+        return ret.error;
+}
+
+static int sbi_rfence_v02_real(unsigned long fid,
+                               unsigned long hmask, unsigned long hbase,
+                               vaddr_t start, size_t size,
+                               unsigned long arg4)
+{
+    struct sbiret ret = {0};
+    int result = 0;
+
+    switch ( fid )
+    {
+    case SBI_EXT_RFENCE_REMOTE_FENCE_I:
+        ret = sbi_ecall(SBI_EXT_RFENCE, fid, hmask, hbase,
+                        0, 0, 0, 0);
+        break;
+
+    case SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA:
+    case SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA:
+    case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA:
+        ret = sbi_ecall(SBI_EXT_RFENCE, fid, hmask, hbase,
+                        start, size, 0, 0);
+        break;
+
+    case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID:
+    case SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA_VMID:
+    case SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID:
+        ret = sbi_ecall(SBI_EXT_RFENCE, fid, hmask, hbase,
+                        start, size, arg4, 0);
+        break;
+
+    default:
+        printk("%s: unknown function ID [%#lx]\n",
+               __func__, fid);
+        result = -EINVAL;
+        break;
+    };
+
+    if ( ret.error )
+    {
+        result = sbi_err_map_xen_errno(ret.error);
+        printk("%s: hbase=%lu hmask=%#lx failed (error %ld)\n",
+               __func__, hbase, hmask, ret.error);
+    }
+
+    return result;
+}
+
+static int cf_check sbi_rfence_v02(unsigned long fid,
+                                   const cpumask_t *cpu_mask,
+                                   vaddr_t start, size_t size,
+                                   unsigned long arg4, unsigned long arg5)
+{
+    unsigned long hartid, cpuid, hmask = 0, hbase = 0, htop = 0;
+    int result = -EINVAL;
+
+    /*
+     * hart_mask_base can be set to -1 to indicate that hart_mask can be
+     * ignored and all available harts must be considered.
+     */
+    if ( !cpu_mask )
+        return sbi_rfence_v02_real(fid, 0UL, -1UL, start, size, arg4);
+
+    for_each_cpu ( cpuid, cpu_mask )
+    {
+        /*
+        * Hart IDs might not necessarily be numbered contiguously in
+        * a multiprocessor system.
+        *
+        * This means that it is possible for the hart ID mapping to look like:
+        *  0, 1, 3, 65, 66, 69
+        * In such cases, more than one call to sbi_rfence_v02_real() will be
+        * needed, as a single hmask can only cover sizeof(unsigned long) CPUs:
+        *  1. sbi_rfence_v02_real(hmask=0b1011, hbase=0)
+        *  2. sbi_rfence_v02_real(hmask=0b1011, hbase=65)
+        *
+        * The algorithm below tries to batch as many harts as possible before
+        * making an SBI call. However, batching may not always be possible.
+        * For example, consider the hart ID mapping:
+        *   0, 64, 1, 65, 2, 66 (1)
+        *
+        * Generally, batching is also possible for (1):
+        *    First (0,1,2), then (64,65,66).
+        * It just requires a different approach and updates to the current
+        * algorithm.
+        */
+        hartid = cpuid_to_hartid(cpuid);
+        if ( hmask )
+        {
+            if ( hartid + BITS_PER_LONG <= htop ||
+                 hbase + BITS_PER_LONG <= hartid )
+            {
+                result = sbi_rfence_v02_real(fid, hmask, hbase,
+                                             start, size, arg4);
+                hmask = 0;
+                if ( result )
+                    break;
+            }
+            else if ( hartid < hbase )
+            {
+                /* shift the mask to fit lower hartid */
+                hmask <<= hbase - hartid;
+                hbase = hartid;
+            }
+        }
+
+        if ( !hmask )
+        {
+            hbase = hartid;
+            htop = hartid;
+        }
+        else if ( hartid > htop )
+            htop = hartid;
+
+        hmask |= BIT(hartid - hbase, UL);
+    }
+
+    if ( hmask )
+        result = sbi_rfence_v02_real(fid, hmask, hbase,
+                                     start, size, arg4);
+
+    return result;
+}
+
+static int (* __ro_after_init sbi_rfence)(unsigned long fid,
+                                          const cpumask_t *cpu_mask,
+                                          vaddr_t start,
+                                          size_t size,
+                                          unsigned long arg4,
+                                          unsigned long arg5);
+
+int sbi_remote_sfence_vma(const cpumask_t *cpu_mask,
+                          vaddr_t start,
+                          size_t size)
+{
+    ASSERT(sbi_rfence);
+
+    return sbi_rfence(SBI_EXT_RFENCE_REMOTE_SFENCE_VMA,
+                      cpu_mask, start, size, 0, 0);
+}
+
+/* This function must always succeed. */
+#define sbi_get_spec_version()  \
+    sbi_ext_base_func(SBI_EXT_BASE_GET_SPEC_VERSION)
+
+#define sbi_get_firmware_id()   \
+    sbi_ext_base_func(SBI_EXT_BASE_GET_IMP_ID)
+
+#define sbi_get_firmware_version()  \
+    sbi_ext_base_func(SBI_EXT_BASE_GET_IMP_VERSION)
+
+int sbi_probe_extension(long extid)
+{
+    struct sbiret ret;
+
+    ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_PROBE_EXT, extid,
+                    0, 0, 0, 0, 0);
+    if ( !ret.error && ret.value )
+        return ret.value;
+
+    return sbi_err_map_xen_errno(ret.error);
+}
+
+static bool sbi_spec_is_0_1(void)
+{
+    return (sbi_spec_version == SBI_SPEC_VERSION_DEFAULT);
+}
+
+bool sbi_has_rfence(void)
+{
+    return (sbi_rfence != NULL);
+}
+
+int __init sbi_init(void)
+{
+    sbi_spec_version = sbi_get_spec_version();
+
+    printk("SBI specification v%u.%u detected\n",
+            sbi_major_version(), sbi_minor_version());
+
+    if ( !sbi_spec_is_0_1() )
+    {
+        long sbi_fw_id = sbi_get_firmware_id();
+        long sbi_fw_version = sbi_get_firmware_version();
+
+        BUG_ON((sbi_fw_id < 0) || (sbi_fw_version < 0));
+
+        printk("SBI implementation ID=%#lx Version=%#lx\n",
+            sbi_fw_id, sbi_fw_version);
+
+        if ( sbi_probe_extension(SBI_EXT_RFENCE) > 0 )
+        {
+            sbi_rfence = sbi_rfence_v02;
+            printk("SBI v0.2 RFENCE extension detected\n");
+        }
+    }
+    else
+        panic("Ooops. SBI spec version 0.1 detected. Need to add support");
+
+    return 0;
+}
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 540a3a608e..164b9cfdd1 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -8,6 +8,7 @@
 #include <public/version.h>
 
 #include <asm/early_printk.h>
+#include <asm/sbi.h>
 #include <asm/smp.h>
 #include <asm/traps.h>
 
@@ -47,6 +48,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     trap_init();
 
+    sbi_init();
+
 #ifdef CONFIG_SELF_TESTS
     test_macros_from_bug_h();
 #endif
-- 
2.46.0


