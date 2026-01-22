Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CECbOr9UcmnpfAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 17:47:59 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EB76A3F8
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 17:47:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211348.1522917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vixqX-00089k-8j; Thu, 22 Jan 2026 16:47:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211348.1522917; Thu, 22 Jan 2026 16:47:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vixqX-00085k-1A; Thu, 22 Jan 2026 16:47:49 +0000
Received: by outflank-mailman (input) for mailman id 1211348;
 Thu, 22 Jan 2026 16:47:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcaL=73=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vixqV-0007Ij-36
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 16:47:47 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 137f69b1-f7b2-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 17:47:45 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b884ad1026cso100345066b.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 08:47:45 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b879513e951sm1686014966b.7.2026.01.22.08.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jan 2026 08:47:44 -0800 (PST)
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
X-Inumbo-ID: 137f69b1-f7b2-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769100464; x=1769705264; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZiDH4E+mr1/aSbgm5OGQwje0WHckqigBRFb2xamzygw=;
        b=jnvEBez1Ry9P3ZK8fjJtjD43sFT9HQmGsQa/0SEReCubcoFiswCZ6gqzCPmvznhNh8
         HaKQefC82h8jNlsESFANZUomkdO3hF631H8KwLwJ5qcLSD8iJEFkl23tvhK4BNAxWRFO
         ViHJ1mguW8CLvn0g/xH9UW3heSQSLduQeZVU5vJyaltd+EGonmQSVqzfBcv/Jfc4jiX0
         4Jj+xHbkZ6fPAAY2b+dqzLu6SnkaZIXXDZs0baN+D03i6XGh8VYCLNBMASdUQV36tayi
         oX48ZBrdmdqHRK2frWz4eIQjn/Qg87o6likcwodNL+CX1FEXYzwnEuRzmbASRA/XIvCW
         D9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769100464; x=1769705264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZiDH4E+mr1/aSbgm5OGQwje0WHckqigBRFb2xamzygw=;
        b=py4v1Tb1hU9Tb8qV85BI13w3zA2TFBDUICw6glYH/aFfaowMZixNUpSIS4dGSk5Ea4
         dMN/XtHeTs05mGKuE617uSPjhyIl7AjQgeZFceCUYmS1/1KI3HOmOicwv5B7jIniq67T
         /CGTniwpt4Xxg0h+mSUDzyr5P1uPP5BIveUhMj+YVFUvNUnbWyzKfKOAJp9dxv9DbOC0
         8dKXTysNYtYmzn1i5Vi2hhGtbQRX6Su3YkTI+sxZrWZTex59XDU1LSGKGn5iP4jtt1Vg
         nGH7h9IEFj8iYw+MCsP+NKaB1u7HUkVIHqZJvVUQUNA0TxTQA9m6wVCm+GDLhohgWQlk
         1Fyg==
X-Gm-Message-State: AOJu0Yzr91f7r347Iw6QY7YjiMYTMRut9t04PEuffUp+tM7rnTUY8E3W
	ZQ3G4/md949lFeIT2THCglHtzOB3yZ6zwLv3foxblIvHOKTv2Ucs5E25xF9hUw==
X-Gm-Gg: AZuq6aK0bwCcnOAaxGC93v+RblntYXCeKi1BgXfavWeLDWRVicMppzDCrSusASXndI1
	gyEPyQlGttq4XMc7uFRZTfTE6FmfFU0lQTDoT8Tml+yQhk7MuJuIpf9Ipe7QV9xYio6s03cWDvh
	w9RfuJQ6DgHCD/d0X5z2rVj46WogcXgvHArbjV/iePZiDq6ejIrYrWCgnYt+P2+G7oJEoGCJRNJ
	gPe19ENca6lWpeX78RYADNoQIMRZm/5lJ5m0DEl529MwcycjSM0KgRC4WMVb+7vtDXDqr4KUT7d
	n1/m2wnS9feubJmm8LFx5y3/uGqsb0gtGS1+t+4plHIrpi5Eueqxclw9MQsoTtHvZLJlp7JWswp
	3N0gtn58sZgYMpTYqNn3+zrtaie0Nq8MBV9fG2wbIjYWpmSEWBjzqodgDpuNQmA364aed8q7NX5
	bQ1cIupQ/5G8Z4ZC/MnnTvtLLEsNvSx9kYRFo3QlfT75t2iXD2abDdr5pgb6mTKGAg
X-Received: by 2002:a17:907:e158:b0:b88:22f1:769d with SMTP id a640c23a62f3a-b8822f18d1emr325009566b.19.1769100464298;
        Thu, 22 Jan 2026 08:47:44 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Romain Caritey <Romain.Caritey@microchip.com>
Subject: [PATCH v2 04/16] xen/riscv: introduce tracking of pending vCPU interrupts, part 1
Date: Thu, 22 Jan 2026 17:47:19 +0100
Message-ID: <7b5b7cceb8a131b198d33a83f49ed112ff310389.1769099885.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1769099883.git.oleksii.kurochko@gmail.com>
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,microchip.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A5EB76A3F8
X-Rspamd-Action: no action

Based on Linux kernel v6.16.0.

Add lockless tracking of pending vCPU interrupts using atomic bitops.
Two bitmaps are introduced:
 - irqs_pending — interrupts currently pending for the vCPU
 - irqs_pending_mask — bits that have changed in irqs_pending

The design follows a multi-producer, single-consumer model, where the
consumer is the vCPU itself. Producers may set bits in
irqs_pending_mask without a lock. Clearing bits in irqs_pending_mask is
performed only by the consumer via xchg_acquire(). The consumer must not
write to irqs_pending and must not act on bits that are not set in the
mask. Otherwise, extra synchronization should be provided.

On RISC-V interrupts are not injected via guest registers, so pending
interrupts must be recorded in irqs_pending (using the new
vcpu_{un}set_interrupt() helpers) and flushed to the guest by updating
HVIP before returning control to the guest. The consumer side is
implemented in a follow-up patch.

A barrier between updating irqs_pending and setting the corresponding
mask bit in vcpu_set_interrupt() / vcpu_unset_interrupt() guarantees
that if the consumer observes a mask bit set, the corresponding pending
bit is also visible. This prevents missed interrupts during the flush.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - Move the patch before an introduction of vtimer.
 - Drop bitmap_zero() of irqs_pending and irqs_pending_mask bitmaps as
   vcpu structure starts out all zeros.
 - Drop const for irq argument of vcpu_{un}set_interrupt().
 - Drop check "irq < IRQ_LOCAL_MAX" in vcpu_{un}set_interrupt() as it
   could lead to overrun of irqs_pending and irqs_pending_mask bitmaps.
 - Drop IRQ_LOCAL_MAX as there is no usage for it now.
---
 xen/arch/riscv/domain.c             | 41 +++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/domain.h | 19 +++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 3ae5fa3a8805..3777888f34ea 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -5,6 +5,7 @@
 #include <xen/sched.h>
 #include <xen/vmap.h>
 
+#include <asm/bitops.h>
 #include <asm/cpufeature.h>
 #include <asm/csr.h>
 #include <asm/riscv_encoding.h>
@@ -130,3 +131,43 @@ void arch_vcpu_destroy(struct vcpu *v)
 {
     vfree((char *)v->arch.cpu_info + sizeof(struct cpu_info));
 }
+
+int vcpu_set_interrupt(struct vcpu *v, unsigned int irq)
+{
+    /*
+     * We only allow VS-mode software, timer, and external
+     * interrupts when irq is one of the local interrupts
+     * defined by RISC-V privilege specification.
+     */
+    if ( irq != IRQ_VS_SOFT &&
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
+int vcpu_unset_interrupt(struct vcpu *v, unsigned int irq)
+{
+    /*
+     * We only allow VS-mode software, timer, external
+     * interrupts when irq is one of the local interrupts
+     * defined by RISC-V privilege specification.
+     */
+    if ( irq != IRQ_VS_SOFT &&
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
index ec7786c76199..b8178447c68f 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -79,6 +79,22 @@ struct arch_vcpu
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
@@ -117,6 +133,9 @@ static inline void update_guest_memory_policy(struct vcpu *v,
 
 static inline void arch_vcpu_block(struct vcpu *v) {}
 
+int vcpu_set_interrupt(struct vcpu *v, unsigned int irq);
+int vcpu_unset_interrupt(struct vcpu *v, unsigned int irq);
+
 #endif /* ASM__RISCV__DOMAIN_H */
 
 /*
-- 
2.52.0


