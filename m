Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6BB7F716A
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:31:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640378.998522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TT6-0001uY-I2; Fri, 24 Nov 2023 10:31:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640378.998522; Fri, 24 Nov 2023 10:31:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TT6-0001hZ-Bo; Fri, 24 Nov 2023 10:31:28 +0000
Received: by outflank-mailman (input) for mailman id 640378;
 Fri, 24 Nov 2023 10:31:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpHI=HF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r6TT3-0006hy-0F
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:31:25 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9da6b42b-8ab4-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 11:31:24 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a002562bd8bso338511566b.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 02:31:24 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g1-20020a170906348100b009de3641d538sm1882374ejb.134.2023.11.24.02.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 02:31:22 -0800 (PST)
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
X-Inumbo-ID: 9da6b42b-8ab4-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700821883; x=1701426683; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RvyNUD8u7+KxhE+Xgpff9qujHHMUnFEc/YxdYnHNT4c=;
        b=EA+hbYwq803BapCw9q/jjVZLtKVoIgn8ipp/m4Pfynf/wU3so4BiVsQKEOxoDvKFam
         pfxsdPfPHQitgXEVJijWD+4Eajoz1i+IuzotAWksXtlaflPMER4/WS7q6bZ+QnnyWYL7
         13Pu6zlvVkNoqHoCSygibVB+wiUdGZ1/3Pv2puTsxKwrX4pnifTXrmvOtcrKofoYldKp
         r4s/mk6lml5uRk2Qav68zmRvDemrgmzJTalYJW86WU9lwRFncNEOkuKsVKSvLHKtfrrc
         X3kc6/XC1RyHEdI+tH68MigB9zSOP47ck3PA+jI+QFX38xNjY6PEnN1rwLEav+t/dxvh
         hh9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700821883; x=1701426683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RvyNUD8u7+KxhE+Xgpff9qujHHMUnFEc/YxdYnHNT4c=;
        b=DYAd/isjojdO1+50DSsj9jUJOnyND1iqyqCYRwEshc6tttnZhbNlyHSGVZl2IuknZ5
         3QPV1cJoJFH0XlDAbZQ3qARWQ+SzlG99fhf3XDghzbfBFOnFUagQwMEzhuDm+2W/gEh/
         sasJNxCssUW+PQOSjDz1dQHo+pqBBOFy83xuNTae4vmmSqtSNQBuX9ptxbqgKpSF1KWk
         E7vgbujawIihdKoyizpWWJO0wHKB7OzH1C2noPDm6iuW+QVqja/GOtsgHQQSMpybZJhh
         LEFGi3E61QH5RWv0/Zew2E4hpZZoSld/sk44vw+G+skX5NuG7k521xyaqqhnVhE7D6Q5
         iMug==
X-Gm-Message-State: AOJu0Yyi4YlfnLiee2495WILOpESL+yLMoPGp62YUXjc6/erNamYrbFn
	4DNi2OwUf1FvQ7wOacKX72Vrei+MULZ4kQ==
X-Google-Smtp-Source: AGHT+IFmhbp9lOgU0DYaUnhpRmHR2aHkrCQ3QrA11Lu1maIummhabw6XUtU1EIMwDqt8fnKvTaHmIw==
X-Received: by 2002:a17:906:2212:b0:9fd:fdae:a9d0 with SMTP id s18-20020a170906221200b009fdfdaea9d0mr5230923ejs.5.1700821883285;
        Fri, 24 Nov 2023 02:31:23 -0800 (PST)
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
Subject: [PATCH v2 13/39] xen/riscv: introduce asm/system.h
Date: Fri, 24 Nov 2023 12:30:33 +0200
Message-ID: <3007fb3d841dbaa078bb5b7af699c883356badca.1700761381.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1700761381.git.oleksii.kurochko@gmail.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - Nothing changed. Only rebase.
---
 xen/arch/riscv/include/asm/system.h | 79 +++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/system.h

diff --git a/xen/arch/riscv/include/asm/system.h b/xen/arch/riscv/include/asm/system.h
new file mode 100644
index 0000000000..45bfed4e2b
--- /dev/null
+++ b/xen/arch/riscv/include/asm/system.h
@@ -0,0 +1,79 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _ASM_RISCV_BARRIER_H
+#define _ASM_RISCV_BARRIER_H
+
+#include <asm/csr.h>
+
+#ifndef __ASSEMBLY__
+
+#define RISCV_FENCE(p, s) \
+    __asm__ __volatile__ ("fence " #p "," #s : : : "memory")
+
+/* These barriers need to enforce ordering on both devices or memory. */
+#define mb()                    RISCV_FENCE(iorw,iorw)
+#define rmb()                   RISCV_FENCE(ir,ir)
+#define wmb()                   RISCV_FENCE(ow,ow)
+
+/* These barriers do not need to enforce ordering on devices, just memory. */
+#define smp_mb()                RISCV_FENCE(rw,rw)
+#define smp_rmb()               RISCV_FENCE(r,r)
+#define smp_wmb()               RISCV_FENCE(w,w)
+#define smp_mb__before_atomic() smp_mb()
+#define smp_mb__after_atomic()  smp_mb()
+
+/*
+#define __smp_store_release(p, v)       \
+do {                                    \
+	compiletime_assert_atomic_type(*p); \
+	RISCV_FENCE(rw,w);                  \
+	WRITE_ONCE(*p, v);                  \
+} while (0)
+
+#define __smp_load_acquire(p)           \
+({                                      \
+    typeof(*p) ___p1 = READ_ONCE(*p);   \
+    compiletime_assert_atomic_type(*p); \
+    RISCV_FENCE(r,rw);                  \
+    ___p1;                              \
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
+static inline int local_irq_is_enabled(void)
+{
+    unsigned long flags = local_save_flags();
+
+    return flags & SSTATUS_SIE;
+}
+
+#define arch_fetch_and_add(x, v) __sync_fetch_and_add(x, v)
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* _ASM_RISCV_BARRIER_H */
-- 
2.42.0


