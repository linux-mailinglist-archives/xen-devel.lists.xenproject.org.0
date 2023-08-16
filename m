Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9263B77DECF
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:32:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584508.915410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDpD-0007Aw-Uc; Wed, 16 Aug 2023 10:32:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584508.915410; Wed, 16 Aug 2023 10:32:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDpD-000745-Jv; Wed, 16 Aug 2023 10:32:27 +0000
Received: by outflank-mailman (input) for mailman id 584508;
 Wed, 16 Aug 2023 10:32:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDdg-0003RA-V6
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:32 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 874b39bb-3c1e-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 12:20:31 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-31972944f30so2802158f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:31 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:30 -0700 (PDT)
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
X-Inumbo-ID: 874b39bb-3c1e-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181230; x=1692786030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=in0Dcq8RIGHS1n/QAl0M1ChBHH95P2peAp6/fkLi2Hk=;
        b=LAukkhAeI5IN+5QozRO1cmKtPKbbjmbkQcSuMFKwE6QvSAjLIYSg8s/J6pKVyt9S1B
         ojafZ43q4OL/rSrSWEQaEvj7CmT7RHBH4ppqlg3cBAsGtizDmGgd3xn3w+VzgSGjLrFt
         zq0A7/L7vFZlw9lNmZ0y42PJHeoNxMv/Lzy+R3expqSO7Aw0+0Yh55OL5yRWQOztPiOd
         XXSQJXcMeewebfZDYCngzCNtF0gi9k54k5W1eAkfHHMBTD01aMTIIzI7AZmZloXN6vKd
         WndaIjtpC2G1gT18eJpu1QkkRpVUFR/vgqziakFr8WT9etdAeUln8w0O4kRux+EK5uv5
         R0HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181230; x=1692786030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=in0Dcq8RIGHS1n/QAl0M1ChBHH95P2peAp6/fkLi2Hk=;
        b=EaZMcdvO9J0qz7hoK0AKVrILPcBLNkAFMhtE7dxRUUl40pwoC/VQFYYivDT6KnhO8X
         4gEn5ggUkHCwruydqDELhJpBS1V2wm2+iyAaX3BTBD4WQtnJRFL+YAbjiireCVhoJvU4
         QYO2elraNBXpBTYwSZOOxJSmpHLz93rK7+Rn1uC6MfB4e+h/6biTivgF84MV2DcQW17T
         CnSx1PDJG5g1mRVLKr9BB/2XUvdOEt5SaECEYN5NHofNZdnHVW55QShtjCs50r2MbNlM
         Tvr9po4NtuuGXJkRIBH8ZNhg7gn03sM/Dp2tr6PeEKk6A4RjxZQ5dvYjJSyEpG/j/+Ek
         EASQ==
X-Gm-Message-State: AOJu0Yy6ivKT5oUIkVytTeJQkllyFTYNuxcfcXnKh0vGw54c1/czk6xa
	y+bN3xeV3H8sAldz9vP8NC21tMeRsryMRMxT
X-Google-Smtp-Source: AGHT+IEhc7jiuxTfIm1R9jaNOj/68oiobUK7MnUL2ZK4GZWQFmmYSdfDBaBEXTbQfMSRFJM0tfCXPw==
X-Received: by 2002:adf:f2ca:0:b0:313:fe1b:f441 with SMTP id d10-20020adff2ca000000b00313fe1bf441mr1023734wrp.29.1692181230310;
        Wed, 16 Aug 2023 03:20:30 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 20/57] xen/riscv: introduce asm/system.h
Date: Wed, 16 Aug 2023 13:19:30 +0300
Message-ID: <6e6d1e322635fbab0625ceac65c7dac83c5ff036.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/system.h | 83 +++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/system.h

diff --git a/xen/arch/riscv/include/asm/system.h b/xen/arch/riscv/include/asm/system.h
new file mode 100644
index 0000000000..b1d9936594
--- /dev/null
+++ b/xen/arch/riscv/include/asm/system.h
@@ -0,0 +1,83 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _ASM_RISCV_BARRIER_H
+#define _ASM_RISCV_BARRIER_H
+
+#include <asm/csr.h>
+// #include <xen/lib.h>
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
+// extern struct vcpu *__context_switch(struct vcpu *prev, struct vcpu *next);
+
+#endif /* __ASSEMBLY__ */
+
+
+#endif /* _ASM_RISCV_BARRIER_H */
-- 
2.41.0


