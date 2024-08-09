Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 370C294D47C
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2024 18:20:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774851.1185303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scSLO-0002xc-Jm; Fri, 09 Aug 2024 16:19:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774851.1185303; Fri, 09 Aug 2024 16:19:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scSLO-0002t2-EB; Fri, 09 Aug 2024 16:19:58 +0000
Received: by outflank-mailman (input) for mailman id 774851;
 Fri, 09 Aug 2024 16:19:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k3r+=PI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1scSLM-0001ij-OL
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2024 16:19:56 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36921a09-566b-11ef-8776-851b0ebba9a2;
 Fri, 09 Aug 2024 18:19:54 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-52efd8807aaso2806898e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 09 Aug 2024 09:19:54 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-530de481f09sm1028479e87.285.2024.08.09.09.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Aug 2024 09:19:53 -0700 (PDT)
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
X-Inumbo-ID: 36921a09-566b-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723220394; x=1723825194; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GpgV+5ZGflCKHPBAOBT08hiAvUTxczzsSOmyHFj6wLc=;
        b=KTbHnStR86Bc+sNep60Ktx4FLfHyLSZFxZvr5j+LuNXYkyYVgHnsyofEuka7Xq2G4X
         tqhU5fTgXkWnBq+A2Zpq28Pzmely5so3ykmCAJBXiIdNCzG5tnnDi2U1mzQwTVIh0beN
         7393XrUrryBdmx5FDlnGk6T3a2WOR1E39Mv7jinmj62B9zh/4UGBDb+K3EApjA+gkcMP
         3/+OJQ6EIRgKq3vDs1N9cDFJYygDIeIlgNw7n0DbjmVfNYaxID9CWNRBzW2rV9Bcz2F5
         Bjk5m+i3EaQ4ynBj6wuAZ6wSMbkfbcwH6lBLCPxG7FdHeIgIhGHe3tq78vvBqpLXqyV6
         ZFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723220394; x=1723825194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GpgV+5ZGflCKHPBAOBT08hiAvUTxczzsSOmyHFj6wLc=;
        b=cg7xZg+KknVZTfzYbERs3keqbAqmHO3sI5s3+gtkJyKdVarhUXKm0rMFx5tBNTnLwh
         be+NZt2fT0dJeUNcAeZYyccEB76WdogYqJvvoKKjn0kq6sp1+HjEEdc49H6qeu/7cx98
         qox29yr6zHApvNp5DqbsNKW+qbUMw6BZVkpAxoZISdUN4MZPkW26X2/lRQR2U9a4SSv4
         vtPt+bMHz7JRp1nQ7qeEjDSvBsS+Y5HtlpOkB1FxTYSg/2PBagTUY/LjFYRH5FldX3W7
         kqhAmEQDWNSgkQSkrOwb+6t19JHvoahjfACd6QMPEyxfROEtZnbjrt7JgSdIlpEh4M8c
         VJXQ==
X-Gm-Message-State: AOJu0YyTlkUFIEJxNLWqjEGQdUSot3/+t52okchwaMHoo/rPuiqWAXOH
	svucXTQfPK8IKbsN1CpdrNE5sk529I+PpRnDnCQpdGx5PtrA3Vz9juDEMQ==
X-Google-Smtp-Source: AGHT+IG2o0qMwqTCFaPJECivbHnFDE5xbiar1f50MIJsOHvhhKAnL/B4XeAAWg1etmmQ3xI2x/YfyQ==
X-Received: by 2002:a05:6512:234b:b0:52c:cca8:a9fb with SMTP id 2adb3069b0e04-530ee9d3920mr1497333e87.42.1723220393860;
        Fri, 09 Aug 2024 09:19:53 -0700 (PDT)
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
Subject: [PATCH v4 5/7] xen/riscv: introduce and initialize SBI RFENCE extension
Date: Fri,  9 Aug 2024 18:19:43 +0200
Message-ID: <1a863d06866f86761d23e6da3f4a6ee58c474473.1723214540.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1723214540.git.oleksii.kurochko@gmail.com>
References: <cover.1723214540.git.oleksii.kurochko@gmail.com>
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
 - Rename __sbi_rfence_v02_call to __sbi_rfence_v02_real and
   remove the unused arg5.
 - Handle NULL cpu_mask to execute rfence on all CPUs by calling
  __sbi_rfence_v02_real(..., 0UL, -1UL,...) instead of creating hmask.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/include/asm/sbi.h |  64 ++++++++
 xen/arch/riscv/sbi.c             | 252 ++++++++++++++++++++++++++++++-
 xen/arch/riscv/setup.c           |   3 +
 3 files changed, 318 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/include/asm/sbi.h b/xen/arch/riscv/include/asm/sbi.h
index 0e6820a4ed..931613646d 100644
--- a/xen/arch/riscv/include/asm/sbi.h
+++ b/xen/arch/riscv/include/asm/sbi.h
@@ -12,8 +12,42 @@
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
+#define SBI_SPEC_VERSION_MAJOR_SHIFT    24
+#define SBI_SPEC_VERSION_MAJOR_MASK     0x7f
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
+#define SBI_SPEC_VERSION_DEFAULT        0x1
+
 struct sbiret {
     long error;
     long value;
@@ -31,4 +65,34 @@ struct sbiret sbi_ecall(unsigned long ext, unsigned long fid,
  */
 void sbi_console_putchar(int ch);
 
+/*
+ * Check underlying SBI implementation has RFENCE
+ *
+ * @return 1 for supported AND 0 for not-supported
+ */
+bool sbi_has_rfence(void);
+
+/*
+ * Instructs the remote harts to execute one or more SFENCE.VMA
+ * instructions, covering the range of virtual addresses between
+ * start_addr and start_addr + size.
+ *
+ * Returns 0 if IPI was sent to all the targeted harts successfully
+ * or negative value if start_addr or size is not valid.
+ *
+ * @hart_mask a cpu mask containing all the target harts.
+ * @param start virtual address start
+ * @param size virtual address range size
+ */
+int sbi_remote_sfence_vma(cpumask_t *cpu_mask,
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
index 0ae166c861..39e46ef859 100644
--- a/xen/arch/riscv/sbi.c
+++ b/xen/arch/riscv/sbi.c
@@ -7,11 +7,23 @@
  * Modified by Bobby Eshleman (bobby.eshleman@gmail.com).
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
+#include <xen/smp.h>
+
+#include <asm/processor.h>
 #include <asm/sbi.h>
 
+static unsigned long sbi_spec_version = SBI_SPEC_VERSION_DEFAULT;
+static unsigned long sbi_fw_id, sbi_fw_version;
+
 struct sbiret sbi_ecall(unsigned long ext, unsigned long fid,
                         unsigned long arg0, unsigned long arg1,
                         unsigned long arg2, unsigned long arg3,
@@ -38,7 +50,245 @@ struct sbiret sbi_ecall(unsigned long ext, unsigned long fid,
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
+    return (sbi_spec_version >> SBI_SPEC_VERSION_MAJOR_SHIFT) &
+        SBI_SPEC_VERSION_MAJOR_MASK;
+}
+
+static unsigned long sbi_minor_version(void)
+{
+    return sbi_spec_version & SBI_SPEC_VERSION_MINOR_MASK;
+}
+
+static long sbi_ext_base_func(long fid)
+{
+    struct sbiret ret;
+
+    ret = sbi_ecall(SBI_EXT_BASE, fid, 0, 0, 0, 0, 0, 0);
+    if ( !ret.error )
+        return ret.value;
+    else
+        return ret.error;
+}
+
+static int __sbi_rfence_v02_real(unsigned long fid,
+                                 unsigned long hmask, unsigned long hbase,
+                                 unsigned long start, unsigned long size,
+                                 unsigned long arg4)
+{
+    struct sbiret ret = {0};
+    int result = 0;
+
+    switch ( fid )
+    {
+    case SBI_EXT_RFENCE_REMOTE_FENCE_I:
+        ret = sbi_ecall(SBI_EXT_RFENCE, fid, hmask, hbase,
+                0, 0, 0, 0);
+        break;
+    case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA:
+        ret = sbi_ecall(SBI_EXT_RFENCE, fid, hmask, hbase,
+                start, size, 0, 0);
+        break;
+    case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID:
+        ret = sbi_ecall(SBI_EXT_RFENCE, fid, hmask, hbase,
+                start, size, arg4, 0);
+        break;
+    case SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA:
+        ret = sbi_ecall(SBI_EXT_RFENCE, fid, hmask, hbase,
+                start, size, 0, 0);
+        break;
+    case SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA_VMID:
+        ret = sbi_ecall(SBI_EXT_RFENCE, fid, hmask, hbase,
+                start, size, arg4, 0);
+        break;
+    case SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA:
+        ret = sbi_ecall(SBI_EXT_RFENCE, fid, hmask, hbase,
+                start, size, 0, 0);
+        break;
+    case SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID:
+        ret = sbi_ecall(SBI_EXT_RFENCE, fid, hmask, hbase,
+                start, size, arg4, 0);
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
+static int __sbi_rfence_v02(unsigned long fid,
+                            const cpumask_t *cpu_mask,
+                            unsigned long start, unsigned long size,
+                            unsigned long arg4, unsigned long arg5)
+{
+    unsigned long hartid, cpuid, hmask = 0, hbase = 0, htop = 0;
+    int result;
+
+    /*
+     * hart_mask_base can be set to -1 to indicate that hart_mask can be
+     * ignored and all available harts must be considered.
+     */
+    if ( !cpu_mask )
+        return __sbi_rfence_v02_real(fid, 0UL, -1UL, start, size, arg4);
+
+    for_each_cpu( cpuid, cpu_mask )
+    {
+        hartid = cpuid_to_hartid(cpuid);
+        if ( hmask )
+        {
+            if ( hartid + BITS_PER_LONG <= htop ||
+                 hbase + BITS_PER_LONG <= hartid )
+            {
+                result = __sbi_rfence_v02_real(fid, hmask, hbase,
+                                               start, size, arg4);
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
+        } else if ( hartid > htop )
+            htop = hartid;
+
+        hmask |= BIT(hartid - hbase, UL);
+    }
+
+    if ( hmask )
+    {
+        result = __sbi_rfence_v02_real(fid, hmask, hbase,
+                                       start, size, arg4);
+        if ( result )
+            return result;
+    }
+
+    return 0;
+}
+
+static int (*__sbi_rfence)(unsigned long fid,
+                           const cpumask_t *cpu_mask,
+                           unsigned long start, unsigned long size,
+                           unsigned long arg4, unsigned long arg5) = NULL;
+
+int sbi_remote_sfence_vma(cpumask_t *cpu_mask,
+                          unsigned long start_addr,
+                          unsigned long size)
+{
+    return __sbi_rfence(SBI_EXT_RFENCE_REMOTE_SFENCE_VMA,
+                        cpu_mask, start_addr, size, 0, 0);
+}
+
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
+    return (__sbi_rfence != NULL);
+}
+
+int __init sbi_init(void)
+{
+    int ret;
+
+    ret = sbi_get_spec_version();
+    if ( ret > 0 )
+        sbi_spec_version = ret;
+
+    printk("SBI specification v%lu.%lu detected\n",
+            sbi_major_version(), sbi_minor_version());
+
+    if ( !sbi_spec_is_0_1() )
+    {
+        sbi_fw_id = sbi_get_firmware_id();
+        sbi_fw_version = sbi_get_firmware_version();
+
+        printk("SBI implementation ID=%#lx Version=%#lx\n",
+            sbi_fw_id, sbi_fw_version);
+
+        if ( sbi_probe_extension(SBI_EXT_RFENCE) > 0 )
+        {
+            __sbi_rfence = __sbi_rfence_v02;
+            printk("SBI v0.2 RFENCE extension detected\n");
+        }
+    } else {
+        BUG_ON("Ooops. SBI spec veriosn 0.1 detected. Need to add support");
+    }
+
+    if ( !sbi_has_rfence() )
+    {
+        BUG_ON("At the moment flush_xen_tlb_range_va() uses SBI rfence to "
+               "flush TLB for all CPUS!");
+    }
+
+    return 0;
+}
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index c9446e6038..a49a8eee90 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -8,6 +8,7 @@
 #include <public/version.h>
 
 #include <asm/early_printk.h>
+#include <asm/sbi.h>
 #include <asm/smp.h>
 #include <asm/traps.h>
 
@@ -56,6 +57,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     trap_init();
 
+    sbi_init();
+
 #ifdef CONFIG_SELF_TESTS
     test_macros_from_bug_h();
 #endif
-- 
2.45.2


