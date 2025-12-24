Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F83CDCEA2
	for <lists+xen-devel@lfdr.de>; Wed, 24 Dec 2025 18:04:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192954.1512019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYSH4-0004aA-SW; Wed, 24 Dec 2025 17:03:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192954.1512019; Wed, 24 Dec 2025 17:03:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYSH4-0004Vk-Nf; Wed, 24 Dec 2025 17:03:46 +0000
Received: by outflank-mailman (input) for mailman id 1192954;
 Wed, 24 Dec 2025 17:03:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jcWU=66=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vYSH3-0003b7-K0
 for xen-devel@lists.xenproject.org; Wed, 24 Dec 2025 17:03:45 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80ea9404-e0ea-11f0-9cce-f158ae23cfc8;
 Wed, 24 Dec 2025 18:03:44 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b73a9592fb8so1149477966b.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Dec 2025 09:03:44 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037ab7f7bsm1798927766b.18.2025.12.24.09.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 09:03:42 -0800 (PST)
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
X-Inumbo-ID: 80ea9404-e0ea-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766595823; x=1767200623; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVSU+W1QGWlyg8JQ8PYuBMuNclIYpGmrVspxyegORmI=;
        b=ZBAC5fYFgAiZeyasBl4AMnNhfyiqULx860sfQYCDYuZKoX5O7YFjTEFmtNTvEx/4qL
         bfOgjqbUGD5iskG0I9z9pJhk4Rujtp6F4Qgf4sT9392Q+E63HZpFczUDijQbssiBiTc+
         tpKyZuoLoosJQS2G739KfGtaHgaWS8xzxCktWSgW/w6ldU+LZWl/QCh8NafPJPADZ4sv
         s7ZXXnstL48FnasR0egQqE5rM08eb99chyTXZPNBX/vCncDUEFAZJWiXXvrTEk0IHN9h
         czrmjf3J47/z/9M+veX9QdtbQf73NCl1e74HSBWJwdO9/YSo6cO1/1XOD+Momx9sf6xI
         Xm7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766595823; x=1767200623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eVSU+W1QGWlyg8JQ8PYuBMuNclIYpGmrVspxyegORmI=;
        b=b9dk8hNrAFbXTSEyV5GpJrxh0CCXZEJ576COyZyClNqAu9TFPfDvKOJ2cy1PdhJhDP
         qaoXBcHsD+CVp8N59jAEM0qUoWjydLqqmnSmQtjAXLmzof27yx5FLnDvHn81udWI0aiD
         XFAA0Mdjh8ZS5SoIpKnoa2oOLwh/JvcXSTkbI2fA/zHlGYT0LJO2HYdukdnLEWaWD/UE
         JDwUBiaKNBG7UXAnbzmjcUYrJDKNMov6MkCG+Jtvn32PYnCZbZzPHObOdeOTkrHM1+jF
         p85hgr/Yw1cwSveGnRx88bUul+anb9Ls4xw/eIsdseTYeihxigJcAOxNxY6ZQcRptqZk
         rJBg==
X-Gm-Message-State: AOJu0YxzMeHElkjWfjn6iDLA1enbCkFCgSZ56thqBvikWCdRD1Zweo26
	V0s0hlPB0vAoIPCJA4b2MqnecN0zQcRndEjkA5XNUyS/rXtoHt1JNsXgOLA9QA==
X-Gm-Gg: AY/fxX5jrn5FkK+jkSzjxQhtbnTZ76eTGLE3TSZn0EmGcGZ5e6nyxr3K1noI8oUkHZH
	r8brMcV+8/M0wmdlermHGkyZ9j8hi+LKsnvw003Xzv9uh3ZGXPAVNIh8kW/xacqT0fnF3Q/4Jsr
	mxV5mrGaANxwtHb3RAKxSrOK/qmZC7bXcSaW+WE5T575WU4ckbqm1p+X3SI41+FZWQ5oaB6R7Ye
	K0++DNAS6WimOrnTW/mBaJTAGxCHPO7WVmFr9dSmUx3Aa6Wgkgjakskvodjwjvl89ajR03J88tT
	ejundnrBQCEvv02DjnmZqLno+EyTGvJ24dGjsDJ6QJ2hHcTMIojcM9PGey++3jkrMAigjVdQ8+Z
	eTgZPSTcJf+rOUHMmFVIA1RpuPdB2SxSaWquANoVxY0dG1+VfievMWBZB7i4+gLbcKt0jzy9HZZ
	nR8Fmv3nyYziAE5FTk/WlT0Oh2VW0LB+5IpqVQkPUGek/7DAQU3nl8evA=
X-Google-Smtp-Source: AGHT+IHyvwi6tzwoa0da4D5yRiLL+x7c5L6uyL4HDN/1K0/a4HJYGqOGf1921C5u1CXXdfwvsTy1xg==
X-Received: by 2002:a17:906:aa16:b0:b72:dcda:fe5a with SMTP id a640c23a62f3a-b802040097fmr1699255866b.5.1766595822996;
        Wed, 24 Dec 2025 09:03:42 -0800 (PST)
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
Subject: [PATCH v1 07/15] xen/riscv: introduce tracking of pending vCPU interrupts, part 1
Date: Wed, 24 Dec 2025 18:03:20 +0100
Message-ID: <c6bd40a9a40ae3194bcfcf90b9a71d4c190ab7f6.1766595589.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1766595589.git.oleksii.kurochko@gmail.com>
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch is based on Linux kernel 6.16.0.

Introduce a lockless mechanism for tracking pending vCPU interrupts using
atomic bit operations. The design follows a multi-producer, single-consumer
model where the consumer is the vCPU itself.

Two bitmaps are added:
 - irqs_pending — represents interrupts currently pending
 - irqs_pending_mask — represents bits that have changed in irqs_pending

Introduce vcpu_(un)set_interrupt() to mark an interrupt in irqs_pending{_mask}
bitmap(s) to notify vCPU that it has or no an interrupt.

Other parts (such as vcpu_has_interrupts(), vcpu_flush_interrupts() and
vcpu_sync_interrupts()) of a lockless mechanism for tracking pending vCPU
interuupts are going to be introduced in a separate patch.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/domain.c                     | 47 +++++++++++++++++++++
 xen/arch/riscv/include/asm/domain.h         | 19 +++++++++
 xen/arch/riscv/include/asm/riscv_encoding.h |  1 +
 3 files changed, 67 insertions(+)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 164ab14a5209..8a010ae5b47e 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -5,9 +5,11 @@
 #include <xen/sched.h>
 #include <xen/smp.h>
 
+#include <asm/bitops.h>
 #include <asm/cpufeature.h>
 #include <asm/csr.h>
 #include <asm/riscv_encoding.h>
+#include <asm/system.h>
 #include <asm/vtimer.h>
 
 static void vcpu_csr_init(struct vcpu *v)
@@ -100,6 +102,9 @@ int arch_vcpu_create(struct vcpu *v)
     if ( is_idle_vcpu(v) )
         return rc;
 
+    bitmap_zero(v->arch.irqs_pending, RISCV_VCPU_NR_IRQS);
+    bitmap_zero(v->arch.irqs_pending_mask, RISCV_VCPU_NR_IRQS);
+
     if ( (rc = vcpu_vtimer_init(v)) )
         goto fail;
 
@@ -135,3 +140,45 @@ void vcpu_kick(struct vcpu *v)
         smp_send_event_check_mask(cpumask_of(v->processor));
     }
 }
+
+int vcpu_set_interrupt(struct vcpu *v, const unsigned int irq)
+{
+    /*
+     * We only allow VS-mode software, timer, and external
+     * interrupts when irq is one of the local interrupts
+     * defined by RISC-V privilege specification.
+     */
+    if ( irq < IRQ_LOCAL_MAX &&
+         irq != IRQ_VS_SOFT &&
+         irq != IRQ_VS_TIMER &&
+         irq != IRQ_VS_EXT )
+        return -EINVAL;
+
+    set_bit(irq, v->arch.irqs_pending);
+    smp_mb__before_atomic();
+    set_bit(irq, v->arch.irqs_pending_mask);
+
+    vcpu_kick(v);
+
+    return 0;
+}
+
+int vcpu_unset_interrupt(struct vcpu *v, const unsigned int irq)
+{
+    /*
+     * We only allow VS-mode software, timer, external
+     * interrupts when irq is one of the local interrupts
+     * defined by RISC-V privilege specification.
+     */
+    if ( irq < IRQ_LOCAL_MAX &&
+         irq != IRQ_VS_SOFT &&
+         irq != IRQ_VS_TIMER &&
+         irq != IRQ_VS_EXT )
+        return -EINVAL;
+
+    clear_bit(irq, v->arch.irqs_pending);
+    smp_mb__before_atomic();
+    set_bit(irq, v->arch.irqs_pending_mask);
+
+    return 0;
+}
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index be7ddaff30e7..a7538e0dc966 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -85,6 +85,22 @@ struct arch_vcpu
     register_t vstval;
     register_t vsatp;
     register_t vsepc;
+
+    /*
+     * VCPU interrupts
+     *
+     * We have a lockless approach for tracking pending VCPU interrupts
+     * implemented using atomic bitops. The irqs_pending bitmap represent
+     * pending interrupts whereas irqs_pending_mask represent bits changed
+     * in irqs_pending. Our approach is modeled around multiple producer
+     * and single consumer problem where the consumer is the VCPU itself.
+     *
+     * DECLARE_BITMAP() is needed here to support 64 vCPU local interrupts
+     * on RV32 host.
+     */
+#define RISCV_VCPU_NR_IRQS 64
+    DECLARE_BITMAP(irqs_pending, RISCV_VCPU_NR_IRQS);
+    DECLARE_BITMAP(irqs_pending_mask, RISCV_VCPU_NR_IRQS);
 }  __cacheline_aligned;
 
 struct paging_domain {
@@ -123,6 +139,9 @@ static inline void update_guest_memory_policy(struct vcpu *v,
 
 static inline void arch_vcpu_block(struct vcpu *v) {}
 
+int vcpu_set_interrupt(struct vcpu *v, const unsigned int irq);
+int vcpu_unset_interrupt(struct vcpu *v, const unsigned int irq);
+
 #endif /* ASM__RISCV__DOMAIN_H */
 
 /*
diff --git a/xen/arch/riscv/include/asm/riscv_encoding.h b/xen/arch/riscv/include/asm/riscv_encoding.h
index dd15731a86fa..32d25f2d3e94 100644
--- a/xen/arch/riscv/include/asm/riscv_encoding.h
+++ b/xen/arch/riscv/include/asm/riscv_encoding.h
@@ -91,6 +91,7 @@
 #define IRQ_M_EXT			11
 #define IRQ_S_GEXT			12
 #define IRQ_PMU_OVF			13
+#define IRQ_LOCAL_MAX		(IRQ_PMU_OVF + 1)
 
 #define MIP_SSIP			(_UL(1) << IRQ_S_SOFT)
 #define MIP_VSSIP			(_UL(1) << IRQ_VS_SOFT)
-- 
2.52.0


