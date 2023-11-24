Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3CE7F71E6
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:44:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640485.998796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Tfo-0008Fn-K4; Fri, 24 Nov 2023 10:44:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640485.998796; Fri, 24 Nov 2023 10:44:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Tfo-0008Cd-HA; Fri, 24 Nov 2023 10:44:36 +0000
Received: by outflank-mailman (input) for mailman id 640485;
 Fri, 24 Nov 2023 10:44:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpHI=HF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r6TTO-0006hx-BQ
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:31:46 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5d19f9d-8ab4-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 11:31:37 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a08e4352992so67622066b.1
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 02:31:37 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g1-20020a170906348100b009de3641d538sm1882374ejb.134.2023.11.24.02.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 02:31:36 -0800 (PST)
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
X-Inumbo-ID: a5d19f9d-8ab4-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700821897; x=1701426697; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/1Y+ElyEax+d7lF3PYeMEPW+VxVlj8iOZ6H0S0TfVc=;
        b=DyRUynsk+U9u0NCI+BjidufOlXfYDH2/19E03lHlIjgkJf8ibAm7wgi8s2Ew7MDiMq
         oACQY6sj2kfq7Wfeg67aM7QcrGL3r195vb+fGK7JLB2IYFNGqfK5piHtsxUHz22c9wOW
         040a5CH7yA2bnx7KvhNh8MeeRf3US+xuAE25pLSJ63Vn7jXVcC4BD2PAAM1kKPWASW1C
         0+Ps8Q14tIzTG2RBs+mwE51ciR1aJxA+UcIn54aLqc1IaocfATmgaasoO6xwyjt6wJCL
         MPc2yfjDw+DNJXzkI4DAO31cWPpM7uLGbIZmQ1YkLzYd+9VvqKsDx3wjePv0IZ/6NWJU
         pWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700821897; x=1701426697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u/1Y+ElyEax+d7lF3PYeMEPW+VxVlj8iOZ6H0S0TfVc=;
        b=Tw0xbEuap/1cg//JszOOmb+5wMp8ldmEnH10W11NULrf4OSeinxP1b3ucoMHxhH655
         8BUHJRHTaVR4453jczH3a591XfkxhHhyKvf9rWg4aX7qLZb2tJKCG1a8x8YTl/a1K+7X
         jZsH08sDUVX20Lb/PVkntNy0DGJ3QCmyDKcsa3+A20XXBGIPbt/725VCI/vDy4nhx0BQ
         gk99Op5z04Kb1GQmf0jOE9AEi7g3H4MV9O8HAV+d/NRE0R5CSxYgWhhgIi/2eC+7Imm/
         W20UJN9YDgKTroOr0egkuMLXXX9E13Hkpwh9YGz+UQ4EBP4vpQEvZG5F9hiKYJltNmpH
         M3pg==
X-Gm-Message-State: AOJu0Ywt/gHZAOviQUeRPG+z+LEbZ3pFFmHA7zTPAmbBgc8r7nMgS3VR
	MXcDl9g0U8JT4XH/wLCUHzHYMpE50yVwnA==
X-Google-Smtp-Source: AGHT+IESCotu9xvxJak6NVzsn7YcZ4FPdqZBUC4Q8D/pB4AMePUT6A9SYdnJomfIJjkq2KaeeKRtUw==
X-Received: by 2002:a17:906:7245:b0:a01:e916:3584 with SMTP id n5-20020a170906724500b00a01e9163584mr1589552ejk.54.1700821896912;
        Fri, 24 Nov 2023 02:31:36 -0800 (PST)
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
Subject: [PATCH v2 26/39] xen/riscv: introduce asm/regs.h
Date: Fri, 24 Nov 2023 12:30:46 +0200
Message-ID: <073c9a03abe429c1e45f6f66b648a25aff87e9f3.1700761381.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1700761381.git.oleksii.kurochko@gmail.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - change xen/lib.h to xen/bug.h
 - remove unnecessary empty line
---
 xen/arch/riscv/include/asm/regs.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/regs.h

diff --git a/xen/arch/riscv/include/asm/regs.h b/xen/arch/riscv/include/asm/regs.h
new file mode 100644
index 0000000000..8556837c65
--- /dev/null
+++ b/xen/arch/riscv/include/asm/regs.h
@@ -0,0 +1,26 @@
+#ifndef __ARM_RISCV_REGS_H__
+#define __ARM_RISCV_REGS_H__
+
+#ifndef __ASSEMBLY__
+
+#include <xen/bug.h>
+#include <asm/current.h>
+
+#define hyp_mode(r)     (0)
+
+static inline bool guest_mode(const struct cpu_user_regs *r)
+{
+    BUG();
+}
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* __ARM_RISCV_REGS_H__ */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.42.0


