Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1B3CC8E3C
	for <lists+xen-devel@lfdr.de>; Wed, 17 Dec 2025 17:54:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188965.1509984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVunM-0003j2-Gx; Wed, 17 Dec 2025 16:54:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188965.1509984; Wed, 17 Dec 2025 16:54:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVunM-0003fW-DB; Wed, 17 Dec 2025 16:54:36 +0000
Received: by outflank-mailman (input) for mailman id 1188965;
 Wed, 17 Dec 2025 16:54:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ddEZ=6X=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vVunK-0003An-3U
 for xen-devel@lists.xenproject.org; Wed, 17 Dec 2025 16:54:34 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ee1d115-db69-11f0-9cce-f158ae23cfc8;
 Wed, 17 Dec 2025 17:54:31 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b7355f6ef12so1166558066b.3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Dec 2025 08:54:31 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7cfa5d1e89sm2015077966b.69.2025.12.17.08.54.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Dec 2025 08:54:30 -0800 (PST)
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
X-Inumbo-ID: 0ee1d115-db69-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765990471; x=1766595271; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HProhutWVGlAtxwETbSQ5hkPTg+rlxBFKSeiQ584ZZ8=;
        b=Xwl5f+mQLtMQeO7NucwY7GzQkPHCKK1dEuvgD3r9fOD+3PCyE0dMaxoZouvgnAZMsI
         yKkpDY5W6zZNGz0zXDIPqbxBgjaFshIkh4vN/Pohs3nKK8+/f+M7Nd7RX3saHlwj5Sbs
         ln9OBt5vezar28AjM9UJ3qQmS4XMdAr7rO9G4MHnrM7gkPSlEmYl4d9tfIk1gCc/MimE
         WSPXxINToNKpVkpTTr0phYosAh9LQ8gxuJEfH7mGd4mzMmQjW6gh0SjgchZHXxXAtTMr
         ukFfDIPvaZJiqaCSElp1QrYcZXa+CXdhIv25uTHfKeJPRSqWCMN0CRkRcS2xkQvLltkX
         IGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765990471; x=1766595271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HProhutWVGlAtxwETbSQ5hkPTg+rlxBFKSeiQ584ZZ8=;
        b=wnaapf1vaM95z1hLPuJO0eiLFn1p2eHnHNELlAu9XcO/jAwKxfGQlykp5TI+MzFAbL
         CvDWn0RrRMADbldqgNezSqvxVl09ozuXrzn5scc/EML934sXxDnQtBsrJ19Q+NhlChff
         AJ1pWpfjIH2oVQWadn0/4Rfx2OkZ5woNQkzlhIQNkwJB0BOWfhaw82oUZWHlcChuaKq4
         B57kWos7hsbO7hPpHSRkN67mBzl17xA+TQMEPPgBgvL8s3E2D2CvE/hpigZH291zoWxN
         60NTux71F77wi0FioQAM+IV1WCFS2afBG3o1emZ/aZTNlJpv//CPKsLFLnArmsnJyTfR
         +O7w==
X-Gm-Message-State: AOJu0YxJV8lgBwwlhqSObLwiqupQtlaXxSUbChpOrlNYbxIRFAub6HT/
	wne/iEwXWJ8HGSB2aKqqwB+YFHHqIB1HFa38zVhUYQikrO9jZRK8ffa7hlsY/g==
X-Gm-Gg: AY/fxX5NbVTEv3IPjlNA2twCIrihNH+C76H0uiqylJnAO0mWEMySX6d9zBZT8DdrCeB
	syQ5uW70lUPyu5QHFt4UtHJX7cZmQ52/bmevLpUO5yxLRoaoijjkHapXl2Z9tsZwk3yeNzr3csp
	nd0xyq7Kpdf50HZ3w2yfmKdMKi6mdwBufA8MuOK52UzyMkE2nwzpRwj1YmYExUxx1Mbe6nMOYBP
	iYgTeKGq1RZakVmBiM36u1ODM08xZdE1JY8jmzD8dBPT6h4MsiMNsTrc5Gt1ZLQfVbVuNPzXDjL
	ERAscgESzvEElDC0GpIcRow3STU9VjE9iDIPGxG/MmuGE4WIbF1ux7RSW0lOMMDABTs+HM4rNGO
	ndxb7cykD4mDD3ab+9e/clsrbZRmi8d+4jASB3WRtQOL+6aX/eL/Otl50EilKXacPhCgq2eft1y
	qb9iJzgJKD9Ac4mLG9V56tEVURYef8h/nNv8JB2AcV7ie76TFXoKTUoxk=
X-Google-Smtp-Source: AGHT+IG1H3GtPgFSOJHR9vgrIn0wXF1xLUG3R3t5vkJcnFXHHJV3MrSFklOcRbKrp1y1mVpyVM3LIA==
X-Received: by 2002:a17:907:7f23:b0:b72:588:2976 with SMTP id a640c23a62f3a-b7d23d1390bmr1805073066b.60.1765990470626;
        Wed, 17 Dec 2025 08:54:30 -0800 (PST)
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
Subject: [PATCH v2 3/3] xen/riscv: add RISC-V virtual SBI base extension support for guests
Date: Wed, 17 Dec 2025 17:54:20 +0100
Message-ID: <2e42e8ee51badcfa2cb16e3db71fdecaac445bca.1765888425.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1765888425.git.oleksii.kurochko@gmail.com>
References: <cover.1765888425.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support of virtual SBI base extension calls for RISC-V guests, delegating
hardware-specific queries to the underlying SBI and handling version and
firmware ID queries directly.

The changes include:
1. Define new SBI base extension function IDs (SBI_EXT_BASE_GET_MVENDORID,
   SBI_EXT_BASE_GET_MARCHID, SBI_EXT_BASE_GET_MIMPID).
2. Introduce XEN_SBI_VER_MAJOR, XEN_SBI_VER_MINOR for imeplenataion of
   SBI_EXT_BASE_GET_SPEC_VERSION.
4. Introduce VCPU_SBI_IMPID to implement SBI_EXT_BASE_GET_IMP_ID.
5. Implement handling of SBI base extension functions, including version,
   firmware ID, and machine-specific queries.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - s/vsbi-base-extension.*/base-extension.*
 - Introduce VCPU_SBI_IMPID, XEN_SBI_VER_MINOR and XEN_SBI_VER_MAJOR.
 - Return VCPU_SBI_IMPID in the case of SBI_EXT_BASE_GET_IMP_ID.
 - Return Xen version in the case of SBI_EXT_BASE_GET_IMP_VERSION.
 - Use domain_crash() instead of panic() for default case.
 - For SBI_EXT_BASE_GET_{MVENDORID,MARCHID,MIMPID} abd SBI_EXT_BASE_PROBE_EXT
   add handling of a domain is h/w or not.
---
 xen/arch/riscv/include/asm/sbi.h     |  7 +++
 xen/arch/riscv/vsbi/Makefile         |  1 +
 xen/arch/riscv/vsbi/base-extension.c | 71 ++++++++++++++++++++++++++++
 3 files changed, 79 insertions(+)
 create mode 100644 xen/arch/riscv/vsbi/base-extension.c

diff --git a/xen/arch/riscv/include/asm/sbi.h b/xen/arch/riscv/include/asm/sbi.h
index 751bae6d66..eb710950cc 100644
--- a/xen/arch/riscv/include/asm/sbi.h
+++ b/xen/arch/riscv/include/asm/sbi.h
@@ -14,6 +14,10 @@
 
 #include <xen/cpumask.h>
 
+#define XEN_SBI_VER_MAJOR 0
+#define XEN_SBI_VER_MINOR 2
+#define XEN_SBI_IMPID 7
+
 #define SBI_EXT_0_1_SET_TIMER               0x0
 #define SBI_EXT_0_1_CONSOLE_PUTCHAR         0x1
 #define SBI_EXT_0_1_CONSOLE_GETCHAR         0x2
@@ -32,6 +36,9 @@
 #define SBI_EXT_BASE_GET_IMP_ID         0x1
 #define SBI_EXT_BASE_GET_IMP_VERSION    0x2
 #define SBI_EXT_BASE_PROBE_EXT          0x3
+#define SBI_EXT_BASE_GET_MVENDORID      0x4
+#define SBI_EXT_BASE_GET_MARCHID        0x5
+#define SBI_EXT_BASE_GET_MIMPID         0x6
 
 /* SBI function IDs for RFENCE extension */
 #define SBI_EXT_RFENCE_REMOTE_FENCE_I           0x0
diff --git a/xen/arch/riscv/vsbi/Makefile b/xen/arch/riscv/vsbi/Makefile
index bc5755cb13..8ce470f787 100644
--- a/xen/arch/riscv/vsbi/Makefile
+++ b/xen/arch/riscv/vsbi/Makefile
@@ -1,2 +1,3 @@
+obj-y += base-extension.o
 obj-y += core.o
 obj-y += legacy-extension.o
diff --git a/xen/arch/riscv/vsbi/base-extension.c b/xen/arch/riscv/vsbi/base-extension.c
new file mode 100644
index 0000000000..567429c715
--- /dev/null
+++ b/xen/arch/riscv/vsbi/base-extension.c
@@ -0,0 +1,71 @@
+
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/lib.h>
+#include <xen/sched.h>
+#include <xen/version.h>
+
+#include <asm/processor.h>
+#include <asm/sbi.h>
+#include <asm/vsbi.h>
+
+static int vsbi_base_ecall_handler(struct vcpu *vcpu, unsigned long eid,
+                                   unsigned long fid,
+                                   struct cpu_user_regs *regs)
+{
+    int ret = 0;
+    struct sbiret sbi_ret;
+
+    switch ( fid ) {
+    case SBI_EXT_BASE_GET_SPEC_VERSION:
+        regs->a1 = MASK_INSR(XEN_SBI_VER_MAJOR, SBI_SPEC_VERSION_MAJOR_MASK) |
+                   XEN_SBI_VER_MINOR;
+        break;
+    case SBI_EXT_BASE_GET_IMP_ID:
+        regs->a1 = XEN_SBI_IMPID;
+        break;
+    case SBI_EXT_BASE_GET_IMP_VERSION:
+        regs->a1 = (xen_major_version() << 16) | xen_minor_version();
+        break;
+    case SBI_EXT_BASE_GET_MVENDORID:
+    case SBI_EXT_BASE_GET_MARCHID:
+    case SBI_EXT_BASE_GET_MIMPID:
+        if ( is_hardware_domain(vcpu->domain) )
+        {
+            sbi_ret = sbi_ecall(SBI_EXT_BASE, fid, 0, 0, 0, 0, 0, 0);
+            ret = sbi_ret.error;
+            regs->a1 = sbi_ret.value;
+        }
+        else
+            /*
+             * vSBI should present a consistent, virtualized view to guests.
+             * In particular, DomU-visible data must remain stable across
+             * migration and must not expose hardware-specific details.
+             *
+             * These register(s) must be readable in any implementation,
+             * but a value of 0 can be returned to indicate the field
+             * is not implemented.
+             */
+            regs->a1 = 0;
+
+        break;
+    case SBI_EXT_BASE_PROBE_EXT:
+        regs->a1 = vsbi_find_extension(regs->a0) ? 1 : 0;
+        break;
+    default:
+        /*
+         * TODO: domain_crash() is acceptable here while things are still under
+         * development.
+         * It shouldn't stay like this in the end though: guests should not
+         * be punished like this for something Xen hasn't implemented.
+         */
+        domain_crash(vcpu->domain,
+                     "%s: Unsupported ecall: FID: #%lx, EID: #%lx\n",
+                     __func__, fid, eid);
+        break;
+    }
+
+    return ret;
+}
+
+VSBI_EXT(base, SBI_EXT_BASE, SBI_EXT_BASE, vsbi_base_ecall_handler)
-- 
2.52.0


