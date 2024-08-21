Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CB695A265
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2024 18:06:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781297.1190881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgnqt-0004pR-Vs; Wed, 21 Aug 2024 16:06:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781297.1190881; Wed, 21 Aug 2024 16:06:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgnqt-0004gT-No; Wed, 21 Aug 2024 16:06:27 +0000
Received: by outflank-mailman (input) for mailman id 781297;
 Wed, 21 Aug 2024 16:06:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Njk=PU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sgnqr-0003sE-If
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2024 16:06:25 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50985ebb-5fd7-11ef-a508-bb4a2ccca743;
 Wed, 21 Aug 2024 18:06:24 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52f04b3cb33so4770220e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 Aug 2024 09:06:24 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5334c75a2cbsm18101e87.187.2024.08.21.09.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2024 09:06:23 -0700 (PDT)
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
X-Inumbo-ID: 50985ebb-5fd7-11ef-a508-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724256384; x=1724861184; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0FpDkLbWKJAQ3CiJs4AaAzuGNEeRXZNpELOZW6xj11I=;
        b=iOctuW/oqjLEbz5oAoRlKz0CK+D7YMHCVkm4WPgJn0BdHqQzI/596wO8wJy8I+M5Nw
         AOtu5E/xeMFLgeOwCsHifrrHG1SpnnzFsIXipmQkB5tU9Gb29frAkkQpjY4mZHMQuAbm
         e/aUhdrYlNkfrOdDoqep07JuAevqr3E8n1r9a14iAekd0UY9+uMZBFFsjT//W0LKo5mH
         Yqp4XXAyuc794i7x2tIA9qefQuyr0YSGlDaeM3crd0gSUCUUkK2fUpIDThjHAyxvlhLl
         xrcLJEMaLztLUeendLydHGYLfKRo7pDpXg5upsuHynjkbMdpqgwcSVsmIxUSk3PvMpF7
         59xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724256384; x=1724861184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0FpDkLbWKJAQ3CiJs4AaAzuGNEeRXZNpELOZW6xj11I=;
        b=IwfuoS338Y2R0jVP5+qp7aaBix6AOSssgr1lTSXJFRyZMiOUV7j2eXWsKCrJD01n20
         go7NBQBIJhY6WroHNIpceTkd7DxrvY3QbSUCHe9yLoQlQ+AoK55apu9qcBV1Aq/F/uY1
         B0+UzVjW+joyhQvOOXx/i8r7IWtsFolh5EiNftedojfszK9SGZrL6qjqRvaPFprwHupU
         hu4PpWdeyWBRQM+YAhVFrBdl2ydea2t1wmb/HfVKGJr8oACgjH5iT0TPTrzYu36J2Uq/
         JHPKBTSMGTTexVwQC4dV8oLNTnJET4xcp0IQdyt/0+J0H3x/l6YtY56nvGosQoxPxR/W
         kuog==
X-Gm-Message-State: AOJu0YxaP5gC0qv3zCjNjDn++oJXTmgnunMhwHU9giioigCsHAzKSaUw
	HS6V3MCCW6EEuXiL83Me3U2wWG/PXmhhcExomXx+4MHhgn1PpoMgUAysfw==
X-Google-Smtp-Source: AGHT+IHDSkBdGU14z0nurNEnNn+IlCY9hD/KtUz/3ycdD6y5OmmVKv9FNLxHQ6bKIEmQ2z6OMu8PPA==
X-Received: by 2002:a05:6512:ba9:b0:533:45c9:67fe with SMTP id 2adb3069b0e04-533485d78dbmr2504042e87.48.1724256383343;
        Wed, 21 Aug 2024 09:06:23 -0700 (PDT)
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
Subject: [PATCH v5 5/7] xen/riscv: introduce and initialize SBI RFENCE extension
Date: Wed, 21 Aug 2024 18:06:14 +0200
Message-ID: <69da9fc18b9987285e4037ef08714e8f9faa66a7.1724256027.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1724256026.git.oleksii.kurochko@gmail.com>
References: <cover.1724256026.git.oleksii.kurochko@gmail.com>
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

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/sbi.c             | 273 ++++++++++++++++++++++++++++++-
 xen/arch/riscv/setup.c           |   3 +
 3 files changed, 338 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/include/asm/sbi.h b/xen/arch/riscv/include/asm/sbi.h
index 0e6820a4ed..76921d4cd1 100644
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
+#define SBI_SPEC_VERSION_MAJOR_MASK     0x7F000000
+#define SBI_SPEC_VERSION_MINOR_MASK     0xffffff
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
+                          unsigned long start_addr,
+                          unsigned long size);
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
index 0ae166c861..c4036c8e4b 100644
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
@@ -38,7 +51,265 @@ struct sbiret sbi_ecall(unsigned long ext, unsigned long fid,
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
+        fallthrough;
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
+static unsigned long sbi_major_version(void)
+{
+    return MASK_EXTR(sbi_spec_version, SBI_SPEC_VERSION_MAJOR_MASK);
+}
+
+static unsigned long sbi_minor_version(void)
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
+    /*
+     * I wasn't able to find a case in the SBI spec where sbiret.value
+     * could be negative.
+     *
+     * Unfortunately, the spec does not specify the possible values of
+     * sbiret.value, but based on the description of the SBI function,
+     * ret.value >= 0 when sbiret.error = 0. SPI spec specify only
+     * possible value for sbiret.error (<= 0 whwere 0 is SBI_SUCCESS ).
+     *
+     * Just to be sure that SBI base extension functions one day won't
+     * start to return a negative value for sbiret.value when
+     * sbiret.error < 0 BUG_ON() is added.
+     */
+    BUG_ON(ret.value < 0);
+
+    if ( !ret.error )
+        return ret.value;
+    else
+        return ret.error;
+}
+
+static int sbi_rfence_v02_real(unsigned long fid,
+                               unsigned long hmask, unsigned long hbase,
+                               unsigned long start, unsigned long size,
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
+        printk("%s: unknown function ID [%lu]\n",
+               __func__, fid);
+        result = -EINVAL;
+        break;
+    };
+
+    if ( ret.error )
+    {
+        result = sbi_err_map_xen_errno(ret.error);
+        printk("%s: hbase=%lu hmask=%#lx failed (error %d)\n",
+               __func__, hbase, hmask, result);
+    }
+
+    return result;
+}
+
+static int cf_check sbi_rfence_v02(unsigned long fid,
+                                   const cpumask_t *cpu_mask,
+                                   unsigned long start, unsigned long size,
+                                   unsigned long arg4, unsigned long arg5)
+{
+    unsigned long hartid, cpuid, hmask = 0, hbase = 0, htop = 0;
+    int result;
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
+        * a multiprocessor system, but at least one hart must have a
+        * hart ID of zero.
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
+        *   0, 64, 1, 65, 2, 66
+        */
+        hartid = cpuid_to_hartid(cpuid);
+        if ( hmask )
+        {
+            if ( hartid + BITS_PER_LONG <= htop ||
+                 hbase + BITS_PER_LONG <= hartid )
+            {
+                result = sbi_rfence_v02_real(fid, hmask, hbase,
+                                             start, size, arg4);
+                if ( result )
+                    return result;
+                hmask = 0;
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
+    {
+        result = sbi_rfence_v02_real(fid, hmask, hbase,
+                                     start, size, arg4);
+        if ( result )
+            return result;
+    }
+
+    return 0;
+}
+
+static int (* __ro_after_init sbi_rfence)(unsigned long fid,
+                                          const cpumask_t *cpu_mask,
+                                          unsigned long start,
+                                          unsigned long size,
+                                          unsigned long arg4,
+                                          unsigned long arg5);
+
+int sbi_remote_sfence_vma(const cpumask_t *cpu_mask,
+                          unsigned long start_addr,
+                          unsigned long size)
+{
+    ASSERT(sbi_rfence);
+
+    return sbi_rfence(SBI_EXT_RFENCE_REMOTE_SFENCE_VMA,
+                      cpu_mask, start_addr, size, 0, 0);
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
+    return -EOPNOTSUPP;
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
+    printk("SBI specification v%lu.%lu detected\n",
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
index e15f34509c..f147ba672f 100644
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


