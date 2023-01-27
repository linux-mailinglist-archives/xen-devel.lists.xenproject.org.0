Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 779F967E79A
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 14:59:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485591.752942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLPGg-0001bg-Ae; Fri, 27 Jan 2023 13:59:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485591.752942; Fri, 27 Jan 2023 13:59:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLPGg-0001Yc-6R; Fri, 27 Jan 2023 13:59:50 +0000
Received: by outflank-mailman (input) for mailman id 485591;
 Fri, 27 Jan 2023 13:59:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhsa=5Y=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pLPGe-0000nM-Mu
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 13:59:48 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc41cfcc-9e4a-11ed-a5d9-ddcf98b90cbd;
 Fri, 27 Jan 2023 14:59:48 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id fl24so3519043wmb.1
 for <xen-devel@lists.xenproject.org>; Fri, 27 Jan 2023 05:59:47 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 d3-20020adfe2c3000000b002bc7fcf08ddsm3971131wrj.103.2023.01.27.05.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 05:59:46 -0800 (PST)
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
X-Inumbo-ID: dc41cfcc-9e4a-11ed-a5d9-ddcf98b90cbd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7CNvAgjXDN7DvNk7wXZV36nzw79XUYPxFgVXqj3cPmo=;
        b=gfRFhfLrC0gpo+JKFXYycl/QL6Y11jmYjSMdL5zkD5QpmzjJuEiYU5BAlkgNIU3D9G
         D+PSoBedxFd+gJO7dHkbFGw58idBgzvkizWdZGUSHkq84kauS4yII6aP2xz/xPIgr8Ve
         jBCd5XBn/wBcuvXY5vst5+Zq1852g4OYEBsGAoiMitVRBKbxbO0DI+cQhEjyyr0xDOgC
         jVmiNPUUvWm9I6zq0IygTAnOo+o5qhs1+BpvhVuKKmbZ1KDcToyWS/1Yuk9Tnnb+SI69
         yqYqlbBr3QsqzJPBNuvj3s1mgWz47vBNxKIpSDackKesjHss82bxyVzx7vyac/QuaCbl
         JYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7CNvAgjXDN7DvNk7wXZV36nzw79XUYPxFgVXqj3cPmo=;
        b=Nkexcay9fkNMOHrCbDXMEnXql/W/5hBKtzHHatcdm0qp+ara1V1wlvFnDfl7ISBSfh
         jM/asFyoqgsm46SZYShrXDz5jzPY3/XgEoc8yXnoW4HTkl1QCSb/VxDCZBsn/EYyZeBi
         E2ru1kG90INxqdzRcZFkbuhv0Y+5zsli2e3y2AjHkqfUctsFrkxVCEYHS2uu4rI/v8Oi
         I1Exeb6kQuZtrj5Uwb4rANsYkmMv/78d+F6fJhUo+v3AvAHQ3qnr8zN9OJD9hLto4BUq
         yUkIvkaChYZUkb2r3dAV7L+XTUNUVEfX6JKYdDHcQ/8Lc6x2zPtqrHH9xxNIsnw0iY0b
         bq7w==
X-Gm-Message-State: AO0yUKUzNCXSdZZe0d9k8gfWEiDVv1gYnX+RuwDK59MZBHwPFVSu56lr
	wVKXhh/XpsUx2ueQodyV08BswIR+D0M=
X-Google-Smtp-Source: AK7set+bePZVpTJkP/anUZYoflLwL8Nzs21eqGjTRsfEcvnwXCGOOqOPTKCthpF8ezJCXmAU344z2A==
X-Received: by 2002:a7b:c7ce:0:b0:3dc:42d2:aeee with SMTP id z14-20020a7bc7ce000000b003dc42d2aeeemr643533wmk.25.1674827987321;
        Fri, 27 Jan 2023 05:59:47 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v2 04/14] xen/riscv: add <asm/csr.h> header
Date: Fri, 27 Jan 2023 15:59:09 +0200
Message-Id: <b26d981f189adad8af4560fcc10360da02df97a9.1674818705.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1674818705.git.oleksii.kurochko@gmail.com>
References: <cover.1674818705.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes were made in comparison with <asm/csr.h> from
Linux:
  * remove all defines as they are defined in riscv_encoding.h
  * leave only csr_* macros

Origin: https://github.com/torvalds/linux.git 2475bf0250de
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
  - Minor refactoring mentioned in the commit message, switch tabs to
    spaces and refactor things around __asm__ __volatile__.
  - Update the commit message and add "Origin:" tag.
---
 xen/arch/riscv/include/asm/csr.h | 84 ++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/csr.h

diff --git a/xen/arch/riscv/include/asm/csr.h b/xen/arch/riscv/include/asm/csr.h
new file mode 100644
index 0000000000..4275cf6515
--- /dev/null
+++ b/xen/arch/riscv/include/asm/csr.h
@@ -0,0 +1,84 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-only
+ *
+ * Copyright (C) 2015 Regents of the University of California
+ */
+
+#ifndef _ASM_RISCV_CSR_H
+#define _ASM_RISCV_CSR_H
+
+#include <asm/asm.h>
+#include <xen/const.h>
+#include <asm/riscv_encoding.h>
+
+#ifndef __ASSEMBLY__
+
+#define csr_read(csr)                                           \
+({                                                              \
+    register unsigned long __v;                                 \
+    __asm__ __volatile__ (  "csrr %0, " __ASM_STR(csr)          \
+                            : "=r" (__v)                        \
+                            : : "memory" );                     \
+    __v;                                                        \
+})
+
+#define csr_write(csr, val)                                     \
+({                                                              \
+    unsigned long __v = (unsigned long)(val);                   \
+    __asm__ __volatile__ (  "csrw " __ASM_STR(csr) ", %0"       \
+                            : /* no outputs */                  \
+                            : "rK" (__v)                        \
+                            : "memory" );                       \
+})
+
+#define csr_swap(csr, val)                                      \
+({                                                              \
+    unsigned long __v = (unsigned long)(val);                   \
+    __asm__ __volatile__ (  "csrrw %0, " __ASM_STR(csr) ", %1"  \
+                            : "=r" (__v)                        \
+                            : "rK" (__v)                        \
+                            : "memory" );                       \
+    __v;                                                        \
+})
+
+#define csr_read_set(csr, val)                                  \
+({                                                              \
+    unsigned long __v = (unsigned long)(val);                   \
+    __asm__ __volatile__ (  "csrrs %0, " __ASM_STR(csr) ", %1"  \
+                            : "=r" (__v)                        \
+                            : "rK" (__v)                        \
+                            : "memory" );                       \
+    __v;                                                        \
+})
+
+#define csr_set(csr, val)                                       \
+({                                                              \
+    unsigned long __v = (unsigned long)(val);                   \
+    __asm__ __volatile__ (  "csrs " __ASM_STR(csr) ", %0"       \
+                            : /* no outputs */                  \
+                            : "rK" (__v)                        \
+                            : "memory" );                       \
+})
+
+#define csr_read_clear(csr, val)                                \
+({                                                              \
+    unsigned long __v = (unsigned long)(val);                   \
+    __asm__ __volatile__ (  "csrrc %0, " __ASM_STR(csr) ", %1"  \
+                            : "=r" (__v)                        \
+                            : "rK" (__v)                        \
+                            : "memory" );                       \
+    __v;                                                        \
+})
+
+#define csr_clear(csr, val)                                     \
+({                                                              \
+    unsigned long __v = (unsigned long)(val);                   \
+    __asm__ __volatile__ (  "csrc " __ASM_STR(csr) ", %0"       \
+                            : /*no outputs */                   \
+                            : "rK" (__v)                        \
+                            : "memory" );                       \
+})
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* _ASM_RISCV_CSR_H */
-- 
2.39.0


