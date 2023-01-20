Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AAE6757F3
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 16:00:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481856.747059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIssG-0007N0-Tz; Fri, 20 Jan 2023 15:00:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481856.747059; Fri, 20 Jan 2023 15:00:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIssG-0007JX-Gh; Fri, 20 Jan 2023 15:00:12 +0000
Received: by outflank-mailman (input) for mailman id 481856;
 Fri, 20 Jan 2023 15:00:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RVut=5R=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pIssF-0006SQ-4y
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 15:00:11 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2113fc1c-98d3-11ed-b8d1-410ff93cb8f0;
 Fri, 20 Jan 2023 16:00:08 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id bk16so5076090wrb.11
 for <xen-devel@lists.xenproject.org>; Fri, 20 Jan 2023 07:00:08 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b002bdbead763csm25349811wrf.95.2023.01.20.07.00.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 07:00:06 -0800 (PST)
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
X-Inumbo-ID: 2113fc1c-98d3-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=opQz8gCT9iZSR+WTMArSNrtKt78jXvFW2kTnX4DfyVc=;
        b=WOtan2LjZ2jfOwtlK8bLlMIwol9pKEn7hPN/TZFTpNHBzRMlBhKC/czgmoEFpzncDu
         a5FlIBHjy+DeXabFmAxMAg7CtIy5EByiam7FBsv39XjVD8cb7u0nIN4pNA4wbCf0D0PV
         g+NbtZqC3xroIZIMYI8RFEQcHIwZH9TVGweOOeJ826qcdzVBo5xCdPmvpyuTqxGizpUA
         ThLdu/eAllPPuDi9esG5XNywIvo/bdwo3+Xf2lGcK9a1UpKSKgz6FqFG/oM+aQlf2ori
         tc+rsxpzrXes37X+12Md2eQ35jYikvimz0gFyhA99DPEeh/EXCnABrEvdFtYzi9q/GPN
         yjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=opQz8gCT9iZSR+WTMArSNrtKt78jXvFW2kTnX4DfyVc=;
        b=gg7KpFLJ5vd+XG/Yr4aV/dRS479cI+bmd8f9awMrctzaSYr0zetqvGPy4HfTR4Fbkl
         rgcvGLQTk8R3dUvkPpzyRDR9X2hq3hfY36J3Yxp9DAM3xTgmPuBiA0DLXL3UXktqDg4X
         upHrB3IPa6OLYF7ApU+M8hQnWOe4/RmjKV+PRPJQTl14VUaUf5k89k2EF8emnutonfgF
         U90BPXPvRpVoMbkovhyahS940ZC1tJ1lcmuaM5j7lphP3dRyfLP/3wFEt462nRqSYyE6
         G8egU7F9bd/c8GayagvND93MgZzW5ge5EKVgHdU/smfn6LuffTURyzJS0Vt/vnK9oG9n
         o0Sw==
X-Gm-Message-State: AFqh2kqWME1KAJ9y+cuqdTNoIVQMjcT7zGXXMkGfYLUeXqbCePfjo4N7
	SvYDDtRda93LqZtk5m8QCW2CzaMy0zxL9w==
X-Google-Smtp-Source: AMrXdXuScvj5uQgGPJ3XTwgT2aMxFJsoyM1b85V3S9fi5MqBWbFJc4rQb6iymVthAIGhVLhFI2P7IQ==
X-Received: by 2002:a05:6000:10d:b0:2be:bfc5:c2ef with SMTP id o13-20020a056000010d00b002bebfc5c2efmr1738675wrx.49.1674226807202;
        Fri, 20 Jan 2023 07:00:07 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 04/14] xen/riscv: add <asm/csr.h> header
Date: Fri, 20 Jan 2023 16:59:44 +0200
Message-Id: <afc53b9bee58b5d386f105ee8f23a411d5a15bed.1674226563.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1674226563.git.oleksii.kurochko@gmail.com>
References: <cover.1674226563.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/csr.h | 82 ++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/csr.h

diff --git a/xen/arch/riscv/include/asm/csr.h b/xen/arch/riscv/include/asm/csr.h
new file mode 100644
index 0000000000..1a879c6c4d
--- /dev/null
+++ b/xen/arch/riscv/include/asm/csr.h
@@ -0,0 +1,82 @@
+/*
+ * Take from Linux.
+ *
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
+#define csr_read(csr)						\
+({								\
+	register unsigned long __v;				\
+	__asm__ __volatile__ ("csrr %0, " __ASM_STR(csr)	\
+			      : "=r" (__v) :			\
+			      : "memory");			\
+	__v;							\
+})
+
+#define csr_write(csr, val)					\
+({								\
+	unsigned long __v = (unsigned long)(val);		\
+	__asm__ __volatile__ ("csrw " __ASM_STR(csr) ", %0"	\
+			      : : "rK" (__v)			\
+			      : "memory");			\
+})
+
+/*
+#define csr_swap(csr, val)					\
+({								\
+	unsigned long __v = (unsigned long)(val);		\
+	__asm__ __volatile__ ("csrrw %0, " __ASM_STR(csr) ", %1"\
+			      : "=r" (__v) : "rK" (__v)		\
+			      : "memory");			\
+	__v;							\
+})
+
+#define csr_read_set(csr, val)					\
+({								\
+	unsigned long __v = (unsigned long)(val);		\
+	__asm__ __volatile__ ("csrrs %0, " __ASM_STR(csr) ", %1"\
+			      : "=r" (__v) : "rK" (__v)		\
+			      : "memory");			\
+	__v;							\
+})
+
+#define csr_set(csr, val)					\
+({								\
+	unsigned long __v = (unsigned long)(val);		\
+	__asm__ __volatile__ ("csrs " __ASM_STR(csr) ", %0"	\
+			      : : "rK" (__v)			\
+			      : "memory");			\
+})
+
+#define csr_read_clear(csr, val)				\
+({								\
+	unsigned long __v = (unsigned long)(val);		\
+	__asm__ __volatile__ ("csrrc %0, " __ASM_STR(csr) ", %1"\
+			      : "=r" (__v) : "rK" (__v)		\
+			      : "memory");			\
+	__v;							\
+})
+
+#define csr_clear(csr, val)					\
+({								\
+	unsigned long __v = (unsigned long)(val);		\
+	__asm__ __volatile__ ("csrc " __ASM_STR(csr) ", %0"	\
+			      : : "rK" (__v)			\
+			      : "memory");			\
+})
+*/
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* _ASM_RISCV_CSR_H */
-- 
2.39.0


