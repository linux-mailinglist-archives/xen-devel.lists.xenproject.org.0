Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 887F2538BD3
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 09:09:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339127.563969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvvzj-0001FJ-Rg; Tue, 31 May 2022 07:08:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339127.563969; Tue, 31 May 2022 07:08:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvvzj-00014Y-IT; Tue, 31 May 2022 07:08:47 +0000
Received: by outflank-mailman (input) for mailman id 339127;
 Tue, 31 May 2022 06:58:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rfOh=WH=gmail.com=xiexun162534@srs-se1.protection.inumbo.net>)
 id 1nvvpa-00084L-JZ
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 06:58:18 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0bc3c42a-e0af-11ec-bd2c-47488cf2e6aa;
 Tue, 31 May 2022 08:58:16 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 f7-20020a1c3807000000b0039c1a10507fso610141wma.1
 for <xen-devel@lists.xenproject.org>; Mon, 30 May 2022 23:58:16 -0700 (PDT)
Received: from localhost ([2a03:b0c0:1:d0::944:e002])
 by smtp.gmail.com with ESMTPSA id
 v21-20020a05600c215500b003973e8a227dsm1188377wml.46.2022.05.30.23.58.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 23:58:15 -0700 (PDT)
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
X-Inumbo-ID: 0bc3c42a-e0af-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0IuOTzNajWjkErQtIzVGnkdUea8B4HWED9kLxo7gdNE=;
        b=PJoGbKMwFHUXF/+pd/1LfBrDZgS13kIj7TkZLhW5QJgQ4+GGsjdBJvtGs9r63D5P65
         RErXTGQ9SSiBsNOlf8eTuOD/2lCotlZui+TOEZeRQlCoZ3mRleD3piZTbaooCTjnotw+
         Lv2XIVUbkDrWAVfN3vd3+RKNnC7BMesVqlF7us7s3EJ88KIoMoElk8fOdgeZriyZixPK
         X+jvyCTua511DxOon+rrH/M2hIZ6BeUdQla4V+N4BoBr8pj4UJfYQZXxqqukfPdOOD5Y
         P5Gx/wrayLnm2CR18GSw2+p+PC1xHJk0InF8ttVJPIHnXKH5hL0SbbtamtjbUSmjfEzq
         fPlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0IuOTzNajWjkErQtIzVGnkdUea8B4HWED9kLxo7gdNE=;
        b=UWRuef1XAiPXH5h4n1osPrEmM6X/hfKFpURJFY9T71HmiMZ4Or4xXA+K+x+BjV9hJ8
         nn8hGDuI6wHUjeJpxrl4ZhSqqCJ4aN2qUxuQTXW4/sAuEIU74uMD0XpTupodUb4LvI0u
         PGMucC+lwbbNsDio08TwKKLI+v6uwDdC4Rq9DHPE9xDIuBeNgaN5bYI+oLbXBWypXe6b
         O2rbBzUTVDgggPUVF88HmRwW8WXGva8BBLwvhmbGHbndEpduGrcZHsaUL9+o4JacTF3q
         mYL99hhRTCC6cwgPeeGgVNyEUWXICr034Pe7ZoMnbZnwQMKHbrAcAbMeVQ73Hva/wedo
         IQsQ==
X-Gm-Message-State: AOAM533orcViQQVlnFAWeR0Nght9AAtuxm/3roliHVoUgAYQ/9ADMIMQ
	jgcGFagPw2V8KGgDidLlIZj3inlE9jg=
X-Google-Smtp-Source: ABdhPJzk5zUmY+1vM9HrPeHZTtEvMeYI/zRWy08tuD3nf4SoJQsNqQfbdZXBSvErqtOFSx9ayWxoMw==
X-Received: by 2002:a1c:6a14:0:b0:397:39c4:8ac2 with SMTP id f20-20020a1c6a14000000b0039739c48ac2mr22188609wmc.112.1653980295971;
        Mon, 30 May 2022 23:58:15 -0700 (PDT)
From: Xie Xun <xiexun162534@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Xie Xun <xiexun162534@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [RFC PATCH 4/6] xen/riscv: Add sbi.c, sbi.h
Date: Tue, 31 May 2022 14:57:10 +0800
Message-Id: <ab42b2b2309874e5c3a42ce04e2f94e4409284a7.1653977696.git.xiexun162534@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1653977696.git.xiexun162534@gmail.com>
References: <cover.1653977696.git.xiexun162534@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Xie Xun <xiexun162534@gmail.com>
---
 xen/arch/riscv/Makefile          |   1 +
 xen/arch/riscv/include/asm/sbi.h | 275 ++++++++++++++++++
 xen/arch/riscv/sbi.c             | 483 +++++++++++++++++++++++++++++++
 3 files changed, 759 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/sbi.h
 create mode 100644 xen/arch/riscv/sbi.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 3a57556631..c61349818f 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -8,6 +8,7 @@ obj-y   += irq.o
 obj-y   += p2m.o
 obj-y   += mm.o
 obj-y   += percpu.o
+obj-y   += sbi.o
 obj-y   += setup.o
 obj-y   += shutdown.o
 obj-y   += smp.o
diff --git a/xen/arch/riscv/include/asm/sbi.h b/xen/arch/riscv/include/asm/sbi.h
new file mode 100644
index 0000000000..eb727f1a5e
--- /dev/null
+++ b/xen/arch/riscv/include/asm/sbi.h
@@ -0,0 +1,275 @@
+/**
+ * Copyright (c) 2021 Vates SAS.
+ *
+ * Taken from xvisor, modified by Bobby Eshleman (bobby.eshleman@gmail.com).
+ *
+ * Taken/modified from Xvisor project with the following copyright:
+ *
+ * Copyright (c) 2019 Western Digital Corporation or its affiliates.
+ * All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2, or (at your option)
+ * any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ */
+
+#ifndef __CPU_SBI_H__
+#define __CPU_SBI_H__
+
+#include <xen/types.h>
+
+/* SBI Extension IDs */
+#define	SBI_EXT_0_1_SET_TIMER			0x0
+#define SBI_EXT_0_1_CONSOLE_PUTCHAR		0x1
+#define SBI_EXT_0_1_CONSOLE_GETCHAR		0x2
+#define SBI_EXT_0_1_CLEAR_IPI			0x3
+#define SBI_EXT_0_1_SEND_IPI			0x4
+#define SBI_EXT_0_1_REMOTE_FENCE_I		0x5
+#define SBI_EXT_0_1_REMOTE_SFENCE_VMA		0x6
+#define SBI_EXT_0_1_REMOTE_SFENCE_VMA_ASID	0x7
+#define SBI_EXT_0_1_SHUTDOWN			0x8
+#define SBI_EXT_BASE				0x10
+#define SBI_EXT_TIME				0x54494D45
+#define SBI_EXT_IPI				0x735049
+#define SBI_EXT_RFENCE				0x52464E43
+
+/* SBI function IDs for BASE extension */
+#define SBI_EXT_BASE_GET_SPEC_VERSION		0x0
+#define SBI_EXT_BASE_GET_IMP_ID			0x1
+#define	SBI_EXT_BASE_GET_IMP_VERSION		0x2
+#define	SBI_EXT_BASE_PROBE_EXT			0x3
+#define	SBI_EXT_BASE_GET_MVENDORID		0x4
+#define	SBI_EXT_BASE_GET_MARCHID		0x5
+#define	SBI_EXT_BASE_GET_MIMPID			0x6
+
+#define SBI_SPEC_VERSION_MAJOR_SHIFT		24
+#define SBI_SPEC_VERSION_MAJOR_MASK		0x7f
+#define SBI_SPEC_VERSION_MINOR_MASK		0xffffff
+
+/* SBI function IDs for TIME extension */
+#define SBI_EXT_TIME_SET_TIMER			0x0
+
+/* SBI function IDs for IPI extension */
+#define SBI_EXT_IPI_SEND_IPI			0x0
+
+/* SBI function IDs for RFENCE extension */
+#define	SBI_EXT_RFENCE_REMOTE_FENCE_I		0x0
+#define SBI_EXT_RFENCE_REMOTE_SFENCE_VMA	0x1
+#define SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID	0x2
+#define SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA	0x3
+#define SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA_VMID	0x4
+#define SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA	0x5
+#define SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID	0x6
+
+#define SBI_EXT_VENDOR_START			0x09000000
+#define SBI_EXT_VENDOR_END			0x09FFFFFF
+
+/* SBI return error codes */
+#define SBI_SUCCESS		0
+#define SBI_ERR_FAILURE		-1
+#define SBI_ERR_NOT_SUPPORTED	-2
+#define SBI_ERR_INVALID_PARAM   -3
+#define SBI_ERR_DENIED		-4
+#define SBI_ERR_INVALID_ADDRESS -5
+
+#define SBI_SPEC_VERSION_DEFAULT	0x1
+
+struct cpumask;
+
+struct sbiret {
+	long error;
+	long value;
+};
+
+struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
+			unsigned long arg1, unsigned long arg2,
+			unsigned long arg3, unsigned long arg4,
+			unsigned long arg5);
+
+/**
+ * Convert SBI spec error code into Xvisor error code
+ *
+ * @return errno error code
+ */
+int sbi_err_map_xvisor_errno(int err);
+
+/**
+ * Convert logical CPU mask to hardware HART mask
+ *
+ * @param cmask input logical CPU mask
+ * @param hmask output hardware HART mask
+ */
+void sbi_cpumask_to_hartmask(const struct cpumask *cmask,
+			     struct cpumask *hmask);
+
+/**
+ * Writes given character to the console device.
+ *
+ * @param ch The data to be written to the console.
+ */
+void sbi_console_putchar(int ch);
+
+/**
+ * Reads a character from console device.
+ *
+ * @return the character read from console
+ */
+int sbi_console_getchar(void);
+
+/**
+ * Remove all the harts from executing supervisor code.
+ */
+void sbi_shutdown(void);
+
+/**
+ * Clear any pending IPIs for the calling HART.
+ */
+void sbi_clear_ipi(void);
+
+/**
+ * Send IPIs to a set of target HARTs.
+ *
+ * @param hart_mask mask representing set of target HARTs
+ */
+void sbi_send_ipi(const unsigned long *hart_mask);
+
+/**
+ * Program the timer for next timer event.
+ *
+ * @param stime_value Timer value after which next timer event should fire.
+ */
+void sbi_set_timer(u64 stime_value);
+
+/**
+ * Send FENCE_I to a set of target HARTs.
+ *
+ * @param hart_mask mask representing set of target HARTs
+ */
+void sbi_remote_fence_i(const unsigned long *hart_mask);
+
+/**
+ * Send SFENCE_VMA to a set of target HARTs.
+ *
+ * @param hart_mask mask representing set of target HARTs
+ * @param start virtual address start
+ * @param size virtual address size
+ */
+void sbi_remote_sfence_vma(const unsigned long *hart_mask,
+			   unsigned long start,
+			   unsigned long size);
+
+/**
+ * Send SFENCE_VMA_ASID to a set of target HARTs.
+ *
+ * @param hart_mask mask representing set of target HARTs
+ * @param start virtual address start
+ * @param size virtual address size
+ * @param asid address space ID
+ */
+void sbi_remote_sfence_vma_asid(const unsigned long *hart_mask,
+				unsigned long start,
+				unsigned long size,
+				unsigned long asid);
+
+/**
+ * Send HFENCE_GVMA to a set of target HARTs.
+ *
+ * @param hart_mask mask representing set of target HARTs
+ * @param start guest physical address start
+ * @param size guest physical address size
+ */
+void sbi_remote_hfence_gvma(const unsigned long *hart_mask,
+			    unsigned long start,
+			    unsigned long size);
+
+/**
+ * Send HFENCE_GVMA_VMID to a set of target HARTs.
+ *
+ * @param hart_mask mask representing set of target HARTs
+ * @param start guest physical address start
+ * @param size guest physical address size
+ * @param vmid virtual machine ID
+ */
+void sbi_remote_hfence_gvma_vmid(const unsigned long *hart_mask,
+				 unsigned long start,
+				 unsigned long size,
+				 unsigned long vmid);
+
+/**
+ * Send HFENCE_VVMA to a set of target HARTs.
+ *
+ * @param hart_mask mask representing set of target HARTs
+ * @param start virtual address start
+ * @param size virtual address size
+ */
+void sbi_remote_hfence_vvma(const unsigned long *hart_mask,
+			    unsigned long start,
+			    unsigned long size);
+
+/**
+ * Send HFENCE_VVMA_ASID to a set of target HARTs.
+ *
+ * @param hart_mask mask representing set of target HARTs
+ * @param start virtual address start
+ * @param size virtual address size
+ * @param asid address space ID
+ */
+void sbi_remote_hfence_vvma_asid(const unsigned long *hart_mask,
+				 unsigned long start,
+				 unsigned long size,
+				 unsigned long asid);
+
+/**
+ * Check given SBI extension is supported or not.
+ *
+ * @param ext extension ID
+ * @return >= 0 for supported AND -EOPNOTSUPP for not-supported
+ */
+int sbi_probe_extension(long ext);
+
+/**
+ * Check underlying SBI implementation is v0.1 only
+ *
+ * @return 1 for SBI v0.1 AND 0 for higer version
+ */
+int sbi_spec_is_0_1(void);
+
+/**
+ * Check underlying SBI implementation has v0.2 RFENCE
+ *
+ * @return 1 for supported AND 0 for not-supported
+ */
+int sbi_has_0_2_rfence(void);
+
+/**
+ * Get SBI spec major version
+ *
+ * @return major version number
+ */
+unsigned long sbi_major_version(void);
+
+/**
+ * Get SBI spec minor version
+ *
+ * @return minor version number
+ */
+unsigned long sbi_minor_version(void);
+
+/**
+ * Initialize SBI library
+ *
+ * @return 0 on success, otherwise negative errno on failure
+ */
+int sbi_init(void);
+
+#endif // __CPU_SBI_H__
diff --git a/xen/arch/riscv/sbi.c b/xen/arch/riscv/sbi.c
new file mode 100644
index 0000000000..be5f337a88
--- /dev/null
+++ b/xen/arch/riscv/sbi.c
@@ -0,0 +1,483 @@
+/**
+ * Taken and modified from the xvisor project with the copyright Copyright (c)
+ * 2019 Western Digital Corporation or its affiliates and author Anup Patel
+ * (anup.patel@wdc.com).
+ *
+ * Modified by Bobby Eshleman (bobby.eshleman@gmail.com).
+ *
+ * Copyright (c) 2019 Western Digital Corporation or its affiliates.
+ * Copyright (c) 2021 Vates SAS.
+ * All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2, or (at your option)
+ * any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ */
+
+#include <xen/errno.h>
+#include <xen/init.h>
+#include <xen/smp.h>
+
+#include <asm/system.h>
+#include <asm/sbi.h>
+
+static unsigned long sbi_spec_version = SBI_SPEC_VERSION_DEFAULT;
+
+struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
+			unsigned long arg1, unsigned long arg2,
+			unsigned long arg3, unsigned long arg4,
+			unsigned long arg5)
+{
+	struct sbiret ret;
+
+	register unsigned long a0 asm ("a0") = (unsigned long)(arg0);
+	register unsigned long a1 asm ("a1") = (unsigned long)(arg1);
+	register unsigned long a2 asm ("a2") = (unsigned long)(arg2);
+	register unsigned long a3 asm ("a3") = (unsigned long)(arg3);
+	register unsigned long a4 asm ("a4") = (unsigned long)(arg4);
+	register unsigned long a5 asm ("a5") = (unsigned long)(arg5);
+	register unsigned long a6 asm ("a6") = (unsigned long)(fid);
+	register unsigned long a7 asm ("a7") = (unsigned long)(ext);
+	asm volatile ("ecall"
+		      : "+r" (a0), "+r" (a1)
+		      : "r" (a2), "r" (a3), "r" (a4), "r" (a5), "r" (a6), "r" (a7)
+		      : "memory");
+	ret.error = a0;
+	ret.value = a1;
+
+	return ret;
+}
+
+int sbi_err_map_xen_errno(int err)
+{
+	switch (err) {
+	case SBI_SUCCESS:
+		return 0;
+	case SBI_ERR_DENIED:
+		return -EACCES;
+	case SBI_ERR_INVALID_PARAM:
+		return -EINVAL;
+	case SBI_ERR_INVALID_ADDRESS:
+		return -EFAULT;
+	case SBI_ERR_NOT_SUPPORTED:
+	case SBI_ERR_FAILURE:
+	default:
+		return -EOPNOTSUPP;
+	};
+}
+
+void sbi_cpumask_to_hartmask(const struct cpumask *cmask,
+			     struct cpumask *hmask)
+{
+	u32 cpu;
+	unsigned long hart;
+
+	if (!cmask || !hmask)
+		return;
+
+	cpumask_clear(hmask);
+	for_each_cpu(cpu, cmask) {
+		if (CONFIG_NR_CPUS <= cpu) {
+			printk(XENLOG_ERR "SBI: invalid hart=%lu for cpu=%d\n",
+				     hart, cpu);
+			continue;
+		}
+        hart = pcpu_info[cpu].processor_id;
+		cpumask_set_cpu(hart, hmask);
+	}
+}
+
+void sbi_console_putchar(int ch)
+{
+	sbi_ecall(SBI_EXT_0_1_CONSOLE_PUTCHAR, 0, ch, 0, 0, 0, 0, 0);
+}
+
+int sbi_console_getchar(void)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_0_1_CONSOLE_GETCHAR, 0, 0, 0, 0, 0, 0, 0);
+
+	return ret.error;
+}
+
+void sbi_shutdown(void)
+{
+	sbi_ecall(SBI_EXT_0_1_SHUTDOWN, 0, 0, 0, 0, 0, 0, 0);
+}
+
+void sbi_clear_ipi(void)
+{
+	sbi_ecall(SBI_EXT_0_1_CLEAR_IPI, 0, 0, 0, 0, 0, 0, 0);
+}
+
+static int __sbi_send_ipi_v01(const unsigned long *hart_mask)
+{
+	sbi_ecall(SBI_EXT_0_1_SEND_IPI, 0,
+		  (unsigned long)hart_mask, 0, 0, 0, 0, 0);
+	return 0;
+}
+
+static void __sbi_set_timer_v01(u64 stime_value)
+{
+#ifdef CONFIG_RISCV_64
+	sbi_ecall(SBI_EXT_0_1_SET_TIMER, 0, stime_value, 0, 0, 0, 0, 0);
+#else
+	sbi_ecall(SBI_EXT_0_1_SET_TIMER, 0, stime_value,
+		  stime_value >> 32, 0, 0, 0, 0);
+#endif
+}
+
+static int __sbi_rfence_v01(unsigned long fid,
+			    const unsigned long *hart_mask,
+			    unsigned long start, unsigned long size,
+			    unsigned long arg4, unsigned long arg5)
+{
+	int result = 0;
+
+	switch (fid) {
+	case SBI_EXT_RFENCE_REMOTE_FENCE_I:
+		sbi_ecall(SBI_EXT_0_1_REMOTE_FENCE_I, 0,
+			  (unsigned long)hart_mask, 0, 0, 0, 0, 0);
+		break;
+	case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA:
+		sbi_ecall(SBI_EXT_0_1_REMOTE_SFENCE_VMA, 0,
+			  (unsigned long)hart_mask, start, size,
+			  0, 0, 0);
+		break;
+	case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID:
+		sbi_ecall(SBI_EXT_0_1_REMOTE_SFENCE_VMA_ASID, 0,
+			  (unsigned long)hart_mask, start, size,
+			  arg4, 0, 0);
+		break;
+	default:
+		printk("%s: unknown function ID [%lu]\n", __func__, fid);
+		result = -EINVAL;
+		break;
+	};
+
+	return result;
+}
+
+static void __sbi_set_timer_v02(u64 stime_value)
+{
+#ifdef CONFIG_RISCV_64
+	sbi_ecall(SBI_EXT_TIME, SBI_EXT_TIME_SET_TIMER, stime_value, 0,
+		  0, 0, 0, 0);
+#else
+	sbi_ecall(SBI_EXT_TIME, SBI_EXT_TIME_SET_TIMER, stime_value,
+		  stime_value >> 32, 0, 0, 0, 0);
+#endif
+}
+
+static int __sbi_send_ipi_v02(const unsigned long *hart_mask)
+{
+	struct cpumask tmask;
+	unsigned long hart, hmask, hbase;
+	struct sbiret ret = {0};
+	int result;
+
+	if (!hart_mask) {
+		sbi_cpumask_to_hartmask(&cpu_online_map, &tmask);
+		hart_mask = cpumask_bits(&tmask);
+	}
+
+	hmask = hbase = 0;
+	for_each_set_bit(hart, hart_mask, CONFIG_NR_CPUS) {
+		if (hmask && ((hbase + BITS_PER_LONG) <= hart)) {
+			ret = sbi_ecall(SBI_EXT_IPI, SBI_EXT_IPI_SEND_IPI,
+					hmask, hbase, 0, 0, 0, 0);
+			if (ret.error) {
+				result = sbi_err_map_xen_errno(ret.error);
+				printk("%s: hmask=0x%lx hbase=%lu failed "
+					   "(error %d)\n", __func__, hmask,
+					   hbase, result);
+				return result;
+			}
+			hmask = hbase = 0;
+		}
+		if (!hmask) {
+			hbase = hart;
+		}
+		hmask |= 1UL << (hart - hbase);
+	}
+	if (hmask) {
+		ret = sbi_ecall(SBI_EXT_IPI, SBI_EXT_IPI_SEND_IPI,
+				hmask, hbase, 0, 0, 0, 0);
+		if (ret.error) {
+			result = sbi_err_map_xen_errno(ret.error);
+			printk("%s: hmask=0x%lx hbase=%lu failed "
+				   "(error %d)\n", __func__, hmask,
+				   hbase, result);
+			return result;
+		}
+	}
+
+	return 0;
+}
+
+static int __sbi_rfence_v02_real(unsigned long fid,
+				 unsigned long hmask, unsigned long hbase,
+				 unsigned long start, unsigned long size,
+				 unsigned long arg4)
+{
+	struct sbiret ret = {0};
+	int result = 0;
+
+	switch (fid) {
+	case SBI_EXT_RFENCE_REMOTE_FENCE_I:
+		ret = sbi_ecall(SBI_EXT_RFENCE, fid, hmask, hbase,
+				0, 0, 0, 0);
+		break;
+	case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA:
+		ret = sbi_ecall(SBI_EXT_RFENCE, fid, hmask, hbase,
+				start, size, 0, 0);
+		break;
+	case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID:
+		ret = sbi_ecall(SBI_EXT_RFENCE, fid, hmask, hbase,
+				start, size, arg4, 0);
+		break;
+	case SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA:
+		ret = sbi_ecall(SBI_EXT_RFENCE, fid, hmask, hbase,
+				start, size, 0, 0);
+		break;
+	case SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA_VMID:
+		ret = sbi_ecall(SBI_EXT_RFENCE, fid, hmask, hbase,
+				start, size, arg4, 0);
+		break;
+	case SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA:
+		ret = sbi_ecall(SBI_EXT_RFENCE, fid, hmask, hbase,
+				start, size, 0, 0);
+		break;
+	case SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID:
+		ret = sbi_ecall(SBI_EXT_RFENCE, fid, hmask, hbase,
+				start, size, arg4, 0);
+		break;
+	default:
+		printk("%s: unknown function ID [%lu]\n",
+			   __func__, fid);
+		result = -EINVAL;
+		break;
+	};
+
+	if (ret.error) {
+		result = sbi_err_map_xen_errno(ret.error);
+		printk("%s: hbase=%lu hmask=0x%lx failed (error %d)\n",
+			   __func__, hbase, hmask, result);
+	}
+
+	return result;
+}
+
+static int __sbi_rfence_v02(unsigned long fid,
+			    const unsigned long *hart_mask,
+			    unsigned long start, unsigned long size,
+			    unsigned long arg4, unsigned long arg5)
+{
+	struct cpumask tmask;
+	unsigned long hart, hmask, hbase;
+	int result;
+
+	if (!hart_mask) {
+		sbi_cpumask_to_hartmask(&cpu_online_map, &tmask);
+		hart_mask = cpumask_bits(&tmask);
+	}
+
+	hmask = hbase = 0;
+	for_each_set_bit(hart, hart_mask, CONFIG_NR_CPUS) {
+		if (hmask && ((hbase + BITS_PER_LONG) <= hart)) {
+			result = __sbi_rfence_v02_real(fid, hmask, hbase,
+							start, size, arg4);
+			if (result)
+				return result;
+			hmask = hbase = 0;
+		}
+		if (!hmask) {
+			hbase = hart;
+		}
+		hmask |= 1UL << (hart - hbase);
+	}
+	if (hmask) {
+		result = __sbi_rfence_v02_real(fid, hmask, hbase,
+						start, size, arg4);
+		if (result)
+			return result;
+	}
+
+	return 0;
+}
+
+static void (*__sbi_set_timer)(u64 stime) = __sbi_set_timer_v01;
+static int (*__sbi_send_ipi)(const unsigned long *hart_mask) =
+						__sbi_send_ipi_v01;
+static int (*__sbi_rfence)(unsigned long fid,
+		const unsigned long *hart_mask,
+		unsigned long start, unsigned long size,
+		unsigned long arg4, unsigned long arg5) = __sbi_rfence_v01;
+
+void sbi_send_ipi(const unsigned long *hart_mask)
+{
+	__sbi_send_ipi(hart_mask);
+}
+
+void sbi_set_timer(u64 stime_value)
+{
+	__sbi_set_timer(stime_value);
+}
+
+void sbi_remote_fence_i(const unsigned long *hart_mask)
+{
+	__sbi_rfence(SBI_EXT_RFENCE_REMOTE_FENCE_I,
+		     hart_mask, 0, 0, 0, 0);
+}
+
+void sbi_remote_sfence_vma(const unsigned long *hart_mask,
+			   unsigned long start,
+			   unsigned long size)
+{
+	__sbi_rfence(SBI_EXT_RFENCE_REMOTE_SFENCE_VMA,
+		     hart_mask, start, size, 0, 0);
+}
+
+void sbi_remote_sfence_vma_asid(const unsigned long *hart_mask,
+				unsigned long start,
+				unsigned long size,
+				unsigned long asid)
+{
+	__sbi_rfence(SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID,
+		     hart_mask, start, size, asid, 0);
+}
+
+void sbi_remote_hfence_gvma(const unsigned long *hart_mask,
+			    unsigned long start,
+			    unsigned long size)
+{
+	__sbi_rfence(SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA,
+		     hart_mask, start, size, 0, 0);
+}
+
+void sbi_remote_hfence_gvma_vmid(const unsigned long *hart_mask,
+				 unsigned long start,
+				 unsigned long size,
+				 unsigned long vmid)
+{
+	__sbi_rfence(SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA_VMID,
+		     hart_mask, start, size, vmid, 0);
+}
+
+void sbi_remote_hfence_vvma(const unsigned long *hart_mask,
+			    unsigned long start,
+			    unsigned long size)
+{
+	__sbi_rfence(SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA,
+		     hart_mask, start, size, 0, 0);
+}
+
+void sbi_remote_hfence_vvma_asid(const unsigned long *hart_mask,
+				 unsigned long start,
+				 unsigned long size,
+				 unsigned long asid)
+{
+	__sbi_rfence(SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID,
+		     hart_mask, start, size, asid, 0);
+}
+
+static long sbi_ext_base_func(long fid)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_BASE, fid, 0, 0, 0, 0, 0, 0);
+	if (!ret.error)
+		return ret.value;
+	else
+		return ret.error;
+}
+
+#define sbi_get_spec_version()		\
+	sbi_ext_base_func(SBI_EXT_BASE_GET_SPEC_VERSION)
+
+#define sbi_get_firmware_id()		\
+	sbi_ext_base_func(SBI_EXT_BASE_GET_IMP_ID)
+
+#define sbi_get_firmware_version()	\
+	sbi_ext_base_func(SBI_EXT_BASE_GET_IMP_VERSION)
+
+int sbi_probe_extension(long extid)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_PROBE_EXT, extid,
+			0, 0, 0, 0, 0);
+	if (!ret.error && ret.value)
+		return ret.value;
+
+	return -EOPNOTSUPP;
+}
+
+int sbi_spec_is_0_1(void)
+{
+	return (sbi_spec_version == SBI_SPEC_VERSION_DEFAULT) ? 1 : 0;
+}
+
+int sbi_has_0_2_rfence(void)
+{
+	return (__sbi_rfence == __sbi_rfence_v01) ? 0 : 1;
+}
+
+unsigned long sbi_major_version(void)
+{
+	return (sbi_spec_version >> SBI_SPEC_VERSION_MAJOR_SHIFT) &
+		SBI_SPEC_VERSION_MAJOR_MASK;
+}
+
+unsigned long sbi_minor_version(void)
+{
+	return sbi_spec_version & SBI_SPEC_VERSION_MINOR_MASK;
+}
+
+int __init sbi_init(void)
+{
+	int ret;
+
+	ret = sbi_get_spec_version();
+	if (ret > 0)
+		sbi_spec_version = ret;
+
+	printk("SBI specification v%lu.%lu detected\n",
+			sbi_major_version(), sbi_minor_version());
+
+	if (!sbi_spec_is_0_1()) {
+		printk("SBI implementation ID=0x%lx Version=0x%lx\n",
+			sbi_get_firmware_id(), sbi_get_firmware_version());
+		if (sbi_probe_extension(SBI_EXT_TIME) > 0) {
+			__sbi_set_timer = __sbi_set_timer_v02;
+			printk("SBI v0.2 TIME extension detected\n");
+		}
+		if (sbi_probe_extension(SBI_EXT_IPI) > 0) {
+			__sbi_send_ipi = __sbi_send_ipi_v02;
+			printk("SBI v0.2 IPI extension detected\n");
+		}
+		if (sbi_probe_extension(SBI_EXT_RFENCE) > 0) {
+			__sbi_rfence = __sbi_rfence_v02;
+			printk("SBI v0.2 RFENCE extension detected\n");
+		}
+	}
+
+	if (!sbi_has_0_2_rfence()) {
+		printk("WARNING: SBI v0.2 RFENCE not available !\n");
+	}
+
+	return 0;
+}
+
+__initcall(sbi_init);
-- 
2.30.2


