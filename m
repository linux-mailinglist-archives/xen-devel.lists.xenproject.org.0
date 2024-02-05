Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 247D1849E41
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 16:33:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676209.1052284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0xx-0002LR-CL; Mon, 05 Feb 2024 15:33:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676209.1052284; Mon, 05 Feb 2024 15:33:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0xw-0002D5-Od; Mon, 05 Feb 2024 15:33:00 +0000
Received: by outflank-mailman (input) for mailman id 676209;
 Mon, 05 Feb 2024 15:32:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TPgQ=JO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rX0xu-0007Hv-BE
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 15:32:58 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6a1f12a-c43b-11ee-8a46-1f161083a0e0;
 Mon, 05 Feb 2024 16:32:57 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-51025cafb51so6831349e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 07:32:57 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 s1-20020a056512314100b005114d401157sm474445lfi.2.2024.02.05.07.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 07:32:57 -0800 (PST)
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
X-Inumbo-ID: d6a1f12a-c43b-11ee-8a46-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707147177; x=1707751977; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MJSf6y28Unp6Qbv5KujwB4TmNmYEQsh1IjcgrrZViJk=;
        b=jrASYNRO7Q+s+/OkfnR6uh+wx7RIaznYfzU4++ca5lmpflUvEeOcJmRObDpRRXIxiv
         wr4qe+kq5p6vw6nvL25IPFcXYGluI0cz6FAevgs1SvmX4fOEqB7O2uLuIol3oOPqhCik
         /p//tYeatoq5uN4tpGRuH3lQpA6/mTPAIDGXun104Yy6Bf3IfQgAKY01h54ew1B7kTSQ
         CDVraHJu0ifHZi0YXKYsouTHXI1bcpLws2nSofdwownLYntZiOiEXX7MtNpHvyx3l+uM
         EkjkSWeYUPx7tdKSxlHpaeP5AGimCfyKcTTxq2yatswLGL1HmOCBGDVhVmjESgHD80Eu
         fEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707147177; x=1707751977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MJSf6y28Unp6Qbv5KujwB4TmNmYEQsh1IjcgrrZViJk=;
        b=DKFs+215CmvYs1Wub0faSPUwLd01+eoJlWioJty6bsNxA4Jm32x50BJDY6K4eU+RRc
         qoZEYg0RrZcQEeQbdZFbRDINYr540OZUP+Q4onsSC+F4ySV0+vVRxiGn4tWIvTE9uxd2
         mUslFlINZNv4O9NuS41qP5m+UnYOMBuPjCluorW65gr62UFqv4xNkRkH02fEZbxcNV/7
         iXSq/Eq1qdIBljuj1Dy+aOAeC0ODlSGB2d0fMi2EL5Viv+KfN9mVTcu3IHnntPD33Hbc
         1+QlrCuVsCYqQaHYSSCmZkSylNf3TSQaw/a38BCet8+EvSSPHM6tNFYunwdTA+IK2zmI
         jbhw==
X-Gm-Message-State: AOJu0YyinkluULKXoL2IjaeEiSPHWBcABW1gxwOOUZ1K6a1SWBplcmwR
	lCiDKtzBw6agzhmfw11hs6OSOBe7tUKQRX0EDCLDHd6kDmnZA7/Uhkfc26Uo
X-Google-Smtp-Source: AGHT+IGvEaoKvKsO92WZqjGKP+iQ9RbfnIrHTW8AyWlaAQCFTGYXBWJCe3c8TCEn6bVzOOcCGWGbMA==
X-Received: by 2002:ac2:4142:0:b0:511:51f6:4760 with SMTP id c2-20020ac24142000000b0051151f64760mr1507160lfi.4.1707147177293;
        Mon, 05 Feb 2024 07:32:57 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUrD1xm0E1CoDYjps100oEy4yRSr9LyRJECv0o9KokL1HGC2ay2oh3XADiLtn0rfbLlJ+lzzXHMjWkR/X+NbZgu+h21QNpiULjfsNii1rRr/9sGWOqzZzd1WYImFNCUtotsCbZ8cltRCzGtnZkmDxxxIGNjy4VqIO76FoBbEaNOr8xWER1QOMA/i1l1FtOWDKotnypmPFDy5iqUc6jZLkNW/0f3VSQBCWzDda9Jdt2vBUxAmgJ6B6toZQOab1aAIdCpLkxAQUvLOdW8LprygTkkUcp2z1Y7pK/ao3CNIwgTt0Uw5VEHieUdLuBJ84n+Qe4YRKa9
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
Subject: [PATCH v4 15/30] xen/riscv: introduce irq.h
Date: Mon,  5 Feb 2024 16:32:22 +0100
Message-ID: <6f0bfcda83095b35cb7639538a4705dbb5aa9d58.1707146506.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707146506.git.oleksii.kurochko@gmail.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V4:
 - Change BUG to BUG_ON("unimplemented").
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V3:
 - add SPDX
 - remove all that was wraped to HAS_DEVICETREE_... as for RISC-V it is going to be
   always selected.
 - update the commit message
---
Changes in V2:
 - add ifdef CONFIG_HAS_DEVICE_TREE for things that shouldn't be
   in case !CONFIG_HAS_DEVICE_TREE
 - use proper includes.
---
 xen/arch/riscv/include/asm/irq.h | 37 ++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/irq.h

diff --git a/xen/arch/riscv/include/asm/irq.h b/xen/arch/riscv/include/asm/irq.h
new file mode 100644
index 0000000000..0dfd4d6e8a
--- /dev/null
+++ b/xen/arch/riscv/include/asm/irq.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_RISCV_IRQ_H__
+#define __ASM_RISCV_IRQ_H__
+
+#include <xen/bug.h>
+
+/* TODO */
+#define nr_irqs 0U
+#define nr_static_irqs 0
+#define arch_hwdom_irqs(domid) 0U
+
+#define domain_pirq_to_irq(d, pirq) (pirq)
+
+#define arch_evtchn_bind_pirq(d, pirq) ((void)((d) + (pirq)))
+
+struct arch_pirq {
+};
+
+struct arch_irq_desc {
+    unsigned int type;
+};
+
+static inline void arch_move_irqs(struct vcpu *v)
+{
+    BUG_ON("unimplemented");
+}
+
+#endif /* __ASM_RISCV_IRQ_H__ */
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


