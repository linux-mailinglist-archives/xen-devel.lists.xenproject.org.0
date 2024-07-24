Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B30A393B3DA
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 17:36:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764342.1174789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWe2K-0005BP-9z; Wed, 24 Jul 2024 15:36:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764342.1174789; Wed, 24 Jul 2024 15:36:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWe2K-00058V-77; Wed, 24 Jul 2024 15:36:16 +0000
Received: by outflank-mailman (input) for mailman id 764342;
 Wed, 24 Jul 2024 15:36:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fJNX=OY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sWdy7-0005Od-LS
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 15:31:55 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da30c9c0-49d1-11ef-8776-851b0ebba9a2;
 Wed, 24 Jul 2024 17:31:53 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2ef2d96164aso34910601fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 08:31:53 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ef2b568858sm13237311fa.35.2024.07.24.08.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 08:31:51 -0700 (PDT)
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
X-Inumbo-ID: da30c9c0-49d1-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721835112; x=1722439912; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q/CS7Jv3CQg3aYb6VjDr+kgbj+LlISONX9Xzf/VXrcE=;
        b=isNN5wGfEzeZZBDCZ9UPN64CIA8ouZHSl88/ejQk5xorhIqKLi7Hu1/JoMb5Htmu5m
         Xe2I8R+OnNFq9O4RFLmrRZ5AVyzkL9z4h9ZJKSqBaiEia70zl/X/7ikBvzklpfR8kpQL
         iL0n/Hp+fVh37lxxeQhmC9jE1ESgIjvVXyPL20hAxcLxDkygYtzcHnHZRlw+0x8Gf7+N
         tPwoASJ+5pn7tMlP1v283Hplklr1OMHTDbn4htaDpCoPRjUJKw72w350jGjjYC0lqPls
         +24usiP3A7a4iWmiHc20wj/jHIAzrNC66LbyVq2MqJGhospmD0YHrLOW2ytzto1cOrDC
         l9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721835112; x=1722439912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q/CS7Jv3CQg3aYb6VjDr+kgbj+LlISONX9Xzf/VXrcE=;
        b=SC1eNCQdO5UyIdgcNmYuZUPVbkE6z7tZycwoBPIOZdoxCETx+i/OkLAyThd831RIG6
         c+lHW2jNu3cIKt7D8VEMRJUsyhwDuSS+Zc9zckktaw5eTKFhcW/xehkFFiv7g/Zz74Lm
         aXD81eKNAO9tZV8qeX0zGyDHWf/t9jZsVgC6Wm3qRxH/vVWkGzT97uHv7QygDwmnMuuf
         sG/q+0eD6cDAiKYXee9CnLJCI0EAsUB3w12ySWroXzcXkhu7wwBncxPwMWDzbDUHweye
         UlcDb4WR+dfIcpnhpSlJkAH0nAlmZAw19kFRO3kKc1FbJ2wOT3dRuKeof0bz1uTuOFXA
         POgw==
X-Gm-Message-State: AOJu0YxVvmpUOVxknsuDF0AL70U4K2BeRmaSjaevln2Ap7rNNjnyzHpW
	+S56Bdv74pdKppuFcsSvRSNWiE7zJ6FwB3qY4n5SN8NmenqrTGdDAaT+5cAX
X-Google-Smtp-Source: AGHT+IEyjEPjgLD8s7dHrkVR9Q0dDIrWRBSTtqdVISR/d2JPuqHEq2zU5N7KJ813KWl1O7q1C3Yopg==
X-Received: by 2002:a2e:9d17:0:b0:2ef:2f77:e577 with SMTP id 38308e7fff4ca-2f039cac58dmr1412581fa.27.1721835112186;
        Wed, 24 Jul 2024 08:31:52 -0700 (PDT)
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
Subject: [PATCH v3 7/9] xen/riscv: introduce and init SBI RFENCE extension
Date: Wed, 24 Jul 2024 17:31:38 +0200
Message-ID: <fb2d24731f870378d79077be39b1bc19cc655327.1721834549.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1721834549.git.oleksii.kurochko@gmail.com>
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduces functions to work with SBI RFENCE extenstion
which will be used to do various version of fences for
remote ( not local ) CPU.

Except that sbi_init() function and auxiliary functions and
macros definitions are introduced to proper initialization and
checking availability of SBI extenstions.
At the moment, it is only done for RFENCE.

sbi_remote_sfence_vma() is introduced to send SFENCE_VMA to
a set of target HARTs and based on that flush_xen_tlb_range_va()
will be implemented.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
 - new patch.
---
 xen/arch/riscv/include/asm/sbi.h |  57 +++++++
 xen/arch/riscv/sbi.c             | 256 +++++++++++++++++++++++++++++++
 xen/arch/riscv/setup.c           |   3 +
 3 files changed, 316 insertions(+)

diff --git a/xen/arch/riscv/include/asm/sbi.h b/xen/arch/riscv/include/asm/sbi.h
index 0e6820a4ed..0985fbb1aa 100644
--- a/xen/arch/riscv/include/asm/sbi.h
+++ b/xen/arch/riscv/include/asm/sbi.h
@@ -14,6 +14,38 @@
 
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
+#define SBI_ERR_FAILURE         -1
+#define SBI_ERR_NOT_SUPPORTED   -2
+#define SBI_ERR_INVALID_PARAM   -3
+#define SBI_ERR_DENIED          -4
+#define SBI_ERR_INVALID_ADDRESS -5
+
+#define SBI_SPEC_VERSION_DEFAULT        0x1
+
 struct sbiret {
     long error;
     long value;
@@ -31,4 +63,29 @@ struct sbiret sbi_ecall(unsigned long ext, unsigned long fid,
  */
 void sbi_console_putchar(int ch);
 
+/*
+ * Check underlying SBI implementation has RFENCE
+ *
+ * @return 1 for supported AND 0 for not-supported
+ */
+int sbi_has_rfence(void);
+
+/*
+ * Send SFENCE_VMA to a set of target HARTs.
+ *
+ * @param hart_mask mask representing set of target HARTs
+ * @param start virtual address start
+ * @param size virtual address size
+ */
+void sbi_remote_sfence_vma(const unsigned long *hart_mask,
+                           unsigned long start,
+                           unsigned long size);
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
index 0ae166c861..04d878d1e2 100644
--- a/xen/arch/riscv/sbi.c
+++ b/xen/arch/riscv/sbi.c
@@ -10,8 +10,18 @@
  * Copyright (c) 2021-2023 Vates SAS.
  */
 
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
@@ -38,7 +48,253 @@ struct sbiret sbi_ecall(unsigned long ext, unsigned long fid,
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
+    case SBI_ERR_FAILURE:
+    default:
+        return -EOPNOTSUPP;
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
+    if (!ret.error)
+        return ret.value;
+    else
+        return ret.error;
+}
+
+static void sbi_cpumask_to_hartmask(const struct cpumask *cmask,
+                 struct cpumask *hmask)
+{
+    u32 cpu;
+    unsigned long hart = INVALID_HARTID;
+
+    if (!cmask || !hmask)
+        return;
+
+    cpumask_clear(hmask);
+    for_each_cpu(cpu, cmask)
+    {
+        if ( CONFIG_NR_CPUS <= cpu )
+        {
+            printk(XENLOG_ERR "SBI: invalid hart=%lu for cpu=%d\n",
+                     hart, cpu);
+            continue;
+        }
+
+        hart = cpuid_to_hartid_map(pcpu_info[cpu].processor_id);
+        cpumask_set_cpu(hart, hmask);
+    }
+}
+
+static int __sbi_rfence_v02_real(unsigned long fid,
+                 unsigned long hmask, unsigned long hbase,
+                 unsigned long start, unsigned long size,
+                 unsigned long arg4)
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
+        printk("%s: hbase=%lu hmask=0x%lx failed (error %d)\n",
+               __func__, hbase, hmask, result);
+    }
+
+    return result;
+}
+
+static int __sbi_rfence_v02(unsigned long fid,
+                const unsigned long *hart_mask,
+                unsigned long start, unsigned long size,
+                unsigned long arg4, unsigned long arg5)
+{
+    struct cpumask tmask;
+    unsigned long hart, hmask, hbase;
+    int result;
+
+    if (!hart_mask)
+    {
+        sbi_cpumask_to_hartmask(&cpu_online_map, &tmask);
+        hart_mask = cpumask_bits(&tmask);
+    }
+
+    hmask = hbase = 0;
+    for_each_set_bit(hart, hart_mask, CONFIG_NR_CPUS)
+    {
+        if (hmask && ((hbase + BITS_PER_LONG) <= hart))
+        {
+            result = __sbi_rfence_v02_real(fid, hmask, hbase,
+                            start, size, arg4);
+            if (result)
+                return result;
+            hmask = hbase = 0;
+        }
+
+        if (!hmask)
+            hbase = hart;
+
+        hmask |= 1UL << (hart - hbase);
+    }
+
+    if (hmask)
+    {
+        result = __sbi_rfence_v02_real(fid, hmask, hbase,
+                        start, size, arg4);
+        if (result)
+            return result;
+    }
+
+    return 0;
+}
+
+static int (*__sbi_rfence)(unsigned long fid,
+        const unsigned long *hart_mask,
+        unsigned long start, unsigned long size,
+        unsigned long arg4, unsigned long arg5) = NULL;
+
+void sbi_remote_sfence_vma(const unsigned long *hart_mask,
+                           unsigned long start,
+                           unsigned long size)
+{
+    __sbi_rfence(SBI_EXT_RFENCE_REMOTE_SFENCE_VMA,
+             hart_mask, start, size, 0, 0);
+}
+
+#define sbi_get_spec_version()		\
+    sbi_ext_base_func(SBI_EXT_BASE_GET_SPEC_VERSION)
+
+#define sbi_get_firmware_id()		\
+    sbi_ext_base_func(SBI_EXT_BASE_GET_IMP_ID)
+
+#define sbi_get_firmware_version()	\
+    sbi_ext_base_func(SBI_EXT_BASE_GET_IMP_VERSION)
+
+int sbi_probe_extension(long extid)
+{
+    struct sbiret ret;
+
+    ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_PROBE_EXT, extid,
+            0, 0, 0, 0, 0);
+    if (!ret.error && ret.value)
+        return ret.value;
+
+    return -EOPNOTSUPP;
+}
+
+static int sbi_spec_is_0_1(void)
+{
+    return (sbi_spec_version == SBI_SPEC_VERSION_DEFAULT) ? 1 : 0;
+}
+
+int sbi_has_rfence(void)
+{
+    return __sbi_rfence ? 1 : 0;
+}
+
+int __init sbi_init(void)
+{
+    int ret;
+
+    ret = sbi_get_spec_version();
+    if (ret > 0)
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
+        printk("SBI implementation ID=0x%lx Version=0x%lx\n",
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
index 37b234360c..497e273081 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -8,6 +8,7 @@
 #include <public/version.h>
 
 #include <asm/early_printk.h>
+#include <asm/sbi.h>
 #include <asm/traps.h>
 
 void arch_get_xen_caps(xen_capabilities_info_t *info)
@@ -55,6 +56,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     trap_init();
 
+    sbi_init();
+
 #ifdef CONFIG_SELF_TESTS
     test_macros_from_bug_h();
 #endif
-- 
2.45.2


