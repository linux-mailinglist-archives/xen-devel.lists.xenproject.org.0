Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D8668DC06
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 15:47:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491188.760207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPPFO-0004qh-KN; Tue, 07 Feb 2023 14:47:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491188.760207; Tue, 07 Feb 2023 14:47:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPPFO-0004pD-Gd; Tue, 07 Feb 2023 14:47:02 +0000
Received: by outflank-mailman (input) for mailman id 491188;
 Tue, 07 Feb 2023 14:47:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BG9e=6D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pPPFN-00043Z-3f
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 14:47:01 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47213d3c-a6f6-11ed-933c-83870f6b2ba8;
 Tue, 07 Feb 2023 15:47:00 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id o18so13802865wrj.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Feb 2023 06:47:00 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.109.85.nat.umts.dynamic.t-mobile.pl. [46.204.109.85])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a5d4fca000000b002c3e94cb757sm5269743wrw.117.2023.02.07.06.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 06:46:59 -0800 (PST)
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
X-Inumbo-ID: 47213d3c-a6f6-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OxYCQq01h12RUP/eyWz/O7MFFuhOlyFFr7TX4jQoI/U=;
        b=H4JNQlCrpWpbRS9D75dBSvGVXJUZ5y0BPr76bV3vEIfBT9Tpc+WXmEhGn+2YcYRnA3
         o+I3zBVlSORkux1fxax5KmYKHVlVtPpSYjNZwTnVJngztGGpH53d+dEk5P6llwN1mT2u
         PLzbR+5ofut80mDQpqcgXGPeWTyFejPaNwidwdKPLizYbxa+Er3CXjWEwML5D5T/ozdJ
         prBfMgfKKINZUjHIY2H0bEXYFQXfUHObTsPnoRp8uZb/ml9S3xh0AOgyz6vq5qr9ftPM
         23S0/JC639XRoqyzTbnu/r6XEIzQufGpXu9RxVjokco1RSlXR9xtiX+Ujrq7KHk3Igl+
         xjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OxYCQq01h12RUP/eyWz/O7MFFuhOlyFFr7TX4jQoI/U=;
        b=OfFGNc3Je5cPOGolYO+nURiI95WDoxXsMFX4beedeuxPz6hbadHVUs6fukjXKkdLqm
         W9ygPCRhuRD+7P4ghYgGu+j7/1yKCKTpX9t1A+F2q6WB82fk9USh2ew2WiBKHduRgvcA
         dySIouGhr2cMRNUyzpKY9xoCbt2M7SuJqXNyNfj91AFxE1sks9uVLT4+DtNVY6EJUTxs
         0GIhW5/OGFaTY7OYL/pwRWDBoHU1H+YRGGy1NO4plQxSuROs50kPpXkzXlDLct/Ji7gh
         riM75CLY23be31rCH7s3hRVNc+YoLGsQdGBU0fH9cUokS+EZ+eJdY7raAi3b/8ouaQrS
         da8Q==
X-Gm-Message-State: AO0yUKUiPU1BIgk2HcYZnmsQBg8FhD1wgSdZXa+PTgL6LX6J6C6W7jFf
	9NyIN+tN/AWO+/+aX9UWavSONB+KmTc=
X-Google-Smtp-Source: AK7set9PU/vNtc9ac4qkctk68Byc909U61wI9XuJyABb2tsMHaccyEkm/KHnWAMYDx0G7KNsb50tkQ==
X-Received: by 2002:a5d:5505:0:b0:2bb:e868:6a45 with SMTP id b5-20020a5d5505000000b002bbe8686a45mr2841966wrv.56.1675781220173;
        Tue, 07 Feb 2023 06:47:00 -0800 (PST)
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
Subject: [PATCH v3 04/14] xen/riscv: add <asm/csr.h> header
Date: Tue,  7 Feb 2023 16:46:39 +0200
Message-Id: <94a46f35bc9387c699d9d24b1c792b54ec290255.1675779308.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1675779308.git.oleksii.kurochko@gmail.com>
References: <cover.1675779308.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes were made in comparison with <asm/csr.h> from
Linux:
  * remove all defines as they are defined in riscv_encoding.h
  * leave only csr_* macros

Origin: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ d2d11f342b17
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
  - Update origin to https://git.kernel.org/...
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


