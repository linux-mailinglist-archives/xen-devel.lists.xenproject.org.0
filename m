Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7652D81CBE9
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 16:14:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659415.1029082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhDU-0001Hl-MS; Fri, 22 Dec 2023 15:13:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659415.1029082; Fri, 22 Dec 2023 15:13:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhDU-0001Cg-Dz; Fri, 22 Dec 2023 15:13:36 +0000
Received: by outflank-mailman (input) for mailman id 659415;
 Fri, 22 Dec 2023 15:13:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=buqB=IB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rGhDT-0000EM-3P
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 15:13:35 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac0a0b38-a0dc-11ee-9b0f-b553b5be7939;
 Fri, 22 Dec 2023 16:13:33 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50e64eb3bc7so1191194e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 07:13:33 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 j7-20020a056512108700b0050e6df07728sm45983lfg.180.2023.12.22.07.13.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 07:13:32 -0800 (PST)
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
X-Inumbo-ID: ac0a0b38-a0dc-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703258012; x=1703862812; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Q3XxAtohZzVdjBCMrkOnkvpWvJ70uTXiyTPxPvaq7s=;
        b=R71DaK6d1iFDpovI1a3GtSNH9tTpYaFupHU0K2oZ9wxjeUabc/0Z78HePRj9f7d+vo
         +sFGojNvCRZQ77Jxh9WxVmlslRSDEMAVLkt+cK5oZA6k8ONOZAyIxlfbK2szGg4Rstaz
         Hc6IMPutUvTYEM96l2AufNoKg7lMKlLjjFrYDqZhxXvNi+tWB9Z8yp54W0TD1qP13aX8
         hslpFBZRl70pBV043Kq1gsxmAygwsM3ULISmOnJ2LHHcXUMVN09Ng+YEl+69hAPa0qin
         n01xnJqiJnhnAwcOvlgn0brBUNmx0GOutYENCZM5h/u/8B0fOfaUtDNXsDTdnp8d4Mud
         tW2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703258012; x=1703862812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Q3XxAtohZzVdjBCMrkOnkvpWvJ70uTXiyTPxPvaq7s=;
        b=IjhkEtG3dpLAMWpHMaxaTKNriWeGtwHbNjq/2Hy5o4Eec2oaeScF6DKDHyhPV9g8Bi
         I+EAc/vjSPIspELQZkeptC0tmP6MfG2LVR1dMJ59/wW2ccQxNBfOfmva0YfQQBCPTxSY
         pzwPgPQAdtfuZQzPFL336lNJQksC+0cYOZJ30A2M22zcF2/1vhdk+isRZET8X5burFmQ
         vgnnlxp9ERYUqgAxkJ4qIoz6jew0lKCNdOmhEGpcOhTK7gOMnBYs6jo4+4o9rZ/DrzsN
         Oznhcxapbqw1FjzJOqGTcAImYvNtxP5dCRUHy5lBnnpq6QHuym3i8g1SJDKCwjh8j1os
         CFXA==
X-Gm-Message-State: AOJu0Yx7sW7NGdyasYuKN2DKAgARGmfSMmAb+2NO02VALnUGdR8+yyQG
	x4U3B0DLvNFRJaCN+/HpsTNFNNOVBS0=
X-Google-Smtp-Source: AGHT+IEW9ubjMihjpDo9U++LZhjCgyS3BxzeXAuDpx4kXU0ymEUqqZmZivdoUK3FLQJj/AzT5vUOXQ==
X-Received: by 2002:a05:6512:10ca:b0:50e:6a65:fa97 with SMTP id k10-20020a05651210ca00b0050e6a65fa97mr758709lfg.33.1703258012409;
        Fri, 22 Dec 2023 07:13:32 -0800 (PST)
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
Subject: [PATCH v3 09/34] xen/riscv: introduce system.h
Date: Fri, 22 Dec 2023 17:12:53 +0200
Message-ID: <e577e055932d05ec34f01db57d1b2d2b1be5418d.1703255175.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703255175.git.oleksii.kurochko@gmail.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
 - Add SPDX
 - fix code style issue
 - change prototype of local_irq_is_enabled to return bool.
   update the return code.
 - update the code style
---
Changes in V2:
 - Nothing changed. Only rebase.
---
 xen/arch/riscv/include/asm/system.h | 90 +++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/system.h

diff --git a/xen/arch/riscv/include/asm/system.h b/xen/arch/riscv/include/asm/system.h
new file mode 100644
index 0000000000..08c12158fc
--- /dev/null
+++ b/xen/arch/riscv/include/asm/system.h
@@ -0,0 +1,90 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef _ASM_RISCV_BARRIER_H
+#define _ASM_RISCV_BARRIER_H
+
+#include <xen/stdbool.h>
+
+#include <asm/csr.h>
+
+#ifndef __ASSEMBLY__
+
+#define RISCV_FENCE(p, s) \
+    __asm__ __volatile__ ( "fence " #p "," #s : : : "memory" )
+
+/* These barriers need to enforce ordering on both devices or memory. */
+#define mb()                    RISCV_FENCE(iorw, iorw)
+#define rmb()                   RISCV_FENCE(ir, ir)
+#define wmb()                   RISCV_FENCE(ow, ow)
+
+/* These barriers do not need to enforce ordering on devices, just memory. */
+#define smp_mb()                RISCV_FENCE(rw, rw)
+#define smp_rmb()               RISCV_FENCE(r, r)
+#define smp_wmb()               RISCV_FENCE(w, w)
+#define smp_mb__before_atomic() smp_mb()
+#define smp_mb__after_atomic()  smp_mb()
+
+/*
+#define smp_store_release(p, v)         \
+do {                                    \
+    compiletime_assert_atomic_type(*p); \
+    RISCV_FENCE(rw, w);                 \
+    WRITE_ONCE(*p, v);                  \
+} while (0)
+
+#define smp_load_acquire(p)             \
+({                                      \
+    typeof(*p) p1 = READ_ONCE(*p);      \
+    compiletime_assert_atomic_type(*p); \
+    RISCV_FENCE(r,rw);                  \
+    p1;                                 \
+})
+*/
+
+static inline unsigned long local_save_flags(void)
+{
+    return csr_read(sstatus);
+}
+
+static inline void local_irq_enable(void)
+{
+    csr_set(sstatus, SSTATUS_SIE);
+}
+
+static inline void local_irq_disable(void)
+{
+    csr_clear(sstatus, SSTATUS_SIE);
+}
+
+#define local_irq_save(x)                           \
+({                                                  \
+    x = csr_read_clear(CSR_SSTATUS, SSTATUS_SIE);   \
+    local_irq_disable();                            \
+})
+
+static inline void local_irq_restore(unsigned long flags)
+{
+	csr_set(CSR_SSTATUS, flags & SSTATUS_SIE);
+}
+
+static inline bool local_irq_is_enabled(void)
+{
+    unsigned long flags = local_save_flags();
+
+    return (flags & SSTATUS_SIE) != 0;
+}
+
+#define arch_fetch_and_add(x, v) __sync_fetch_and_add(x, v)
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* _ASM_RISCV_BARRIER_H */
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


