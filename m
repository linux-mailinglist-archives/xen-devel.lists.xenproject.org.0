Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A991B867EDB
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 18:39:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685693.1066838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reewf-0008QM-Cb; Mon, 26 Feb 2024 17:39:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685693.1066838; Mon, 26 Feb 2024 17:39:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reewf-0008ME-72; Mon, 26 Feb 2024 17:39:17 +0000
Received: by outflank-mailman (input) for mailman id 685693;
 Mon, 26 Feb 2024 17:39:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OiHA=KD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1reewd-0007pd-Pl
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 17:39:15 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5bf0e89-d4cd-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 18:39:15 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2d26227d508so37271271fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 09:39:15 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 z8-20020a2e8e88000000b002d0ae22ff6fsm920883ljk.60.2024.02.26.09.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 09:39:12 -0800 (PST)
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
X-Inumbo-ID: f5bf0e89-d4cd-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708969154; x=1709573954; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T7m6VMdKIKFz3mQdT8KKo2X5qy108374IX/REaCKQHg=;
        b=fce2LjTjTxSIJpJgG/+HYOOINmrc3gHzk5DijnZqchNRzLmrydFdf3lsn1UpaRXRCW
         nb4gykaDRtpR4sVsaw3FQhVNJGZjGFUOPVBb/P9U6HZvdD6m6lkWntUCHF3djSA/u/qk
         EYHkTgGiB1/qRXhGvW2xhekGE7rAwlbbPUZJ77IwWyIlludPbTEavGJiv+afCeJJKMos
         7niZ4dSETUUYASWYAfxybM/n/WsLo4QhkoO2t5nsMb7c3G10ykbWd8HWRdQSnXY8SKMC
         J7hjx2dS9xZk6DLuA5XwFvpp/xpPQ87kqh0UXKZSM2a2bCnSUjCaQrlA2vlrUNCtWtyt
         npHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708969154; x=1709573954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T7m6VMdKIKFz3mQdT8KKo2X5qy108374IX/REaCKQHg=;
        b=omh1gZYszTuH5eSVnKZMyMA231NYvDaJTXjnj9F13ooVV29tk7u7r3e1vG4khdxS7a
         /0lNw1GLLMwzdXIA7DNVfiTciV9p7JDdkB6D0nWpWdIRSWJKh57IL6oMchItjbKug7T4
         cdAGsoCobiDx+bQrgsXejKBV7Op14AcT/BOehNNda8UeUckVG3yR6zRouemCBWYcsqD+
         diqtoGLQcydUdbtuimj+IDqvgUFHLyfq1eDVfh4mPT60aC4pMASXsRtMbRbYrKuwjYvX
         BrITPMfR0HGm8AsRsPIIwR+wcxsWgHok4yfcUPRv5CmH87K1xnz+LQjrPndwjjWRPFig
         m1rQ==
X-Gm-Message-State: AOJu0Yx2dYJBEmgbOJKiYYZIaHfVYvwd7GEEAvlFdOazne42ejSkYMDs
	bUtx6I5VYUzuHOuDakaz+sSxVD4Uf3EtviKHJ7QcFhbgmPIurOqtDiQGULla
X-Google-Smtp-Source: AGHT+IH0gLIB5rqhmUwCgtqyn/EnJIYIP/ECs5zIRMjGJTzRJaySLpV4A2ck6fqAHspGdtqGSCq/jw==
X-Received: by 2002:a05:651c:105c:b0:2d2:3202:68c5 with SMTP id x28-20020a05651c105c00b002d2320268c5mr4276561ljm.32.1708969153933;
        Mon, 26 Feb 2024 09:39:13 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 03/23] xen/riscv: introduce nospec.h
Date: Mon, 26 Feb 2024 18:38:45 +0100
Message-ID: <16370492de5344ae8e1aab688261600491868f4e.1708962629.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1708962629.git.oleksii.kurochko@gmail.com>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From the unpriviliged doc:
  No standard hints are presently defined.
  We anticipate standard hints to eventually include memory-system spatial
  and temporal locality hints, branch prediction hints, thread-scheduling
  hints, security tags, and instrumentation flags for simulation/emulation.

Also, there are no speculation execution barriers.

Therefore, functions evaluate_nospec() and block_speculation() should
remain empty until a specific platform has an extension to deal with
speculation execution.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 Changes in V5:
   - new patch
---
 xen/arch/riscv/include/asm/nospec.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/nospec.h

diff --git a/xen/arch/riscv/include/asm/nospec.h b/xen/arch/riscv/include/asm/nospec.h
new file mode 100644
index 0000000000..4fb404a0a2
--- /dev/null
+++ b/xen/arch/riscv/include/asm/nospec.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (C) 2024 Vates */
+
+#ifndef _ASM_GENERIC_NOSPEC_H
+#define _ASM_GENERIC_NOSPEC_H
+
+static inline bool evaluate_nospec(bool condition)
+{
+    return condition;
+}
+
+static inline void block_speculation(void)
+{
+}
+
+#endif /* _ASM_GENERIC_NOSPEC_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.43.0


