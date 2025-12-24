Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DADCDCEAF
	for <lists+xen-devel@lfdr.de>; Wed, 24 Dec 2025 18:04:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192956.1512035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYSH6-0004vU-No; Wed, 24 Dec 2025 17:03:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192956.1512035; Wed, 24 Dec 2025 17:03:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYSH6-0004rx-Dp; Wed, 24 Dec 2025 17:03:48 +0000
Received: by outflank-mailman (input) for mailman id 1192956;
 Wed, 24 Dec 2025 17:03:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jcWU=66=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vYSH4-0003b7-Bs
 for xen-devel@lists.xenproject.org; Wed, 24 Dec 2025 17:03:46 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8162f76f-e0ea-11f0-9cce-f158ae23cfc8;
 Wed, 24 Dec 2025 18:03:44 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b7cee045187so1086233066b.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Dec 2025 09:03:44 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037ab7f7bsm1798927766b.18.2025.12.24.09.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 09:03:43 -0800 (PST)
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
X-Inumbo-ID: 8162f76f-e0ea-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766595824; x=1767200624; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f81w3dP1tK2eL4eFxpXsxUA2ohrjxt2N+AHHpB9O6MY=;
        b=cixfmFkV76J2i6aUf83Gci9BXp7acnnehZOyNLl2lZLptxlmMx5UFw9uybJy/uOxS3
         9WOtavKThU0/fcbkQv5BWDhI8AKfVGtz2RbLC/mmkUd1u0o0EP/7W1kpAF6FR+5DxgZ4
         cE9/1OmNMF9jtD/0cwhzxo++KbkhgoqfxSFzVZQGj/2Q7wGRA+aQO6lJl067yTcRHnFW
         kEL/v/1Eba/IquCukZo1VfWvXhp0hJoS1xEiZ8H74B8Lb+Wl6AXzXpj9CY9ssGBSgbzV
         nWNpBzIlMN1RGg2Xuh+0Tiy0rWYqs0uJxDeOyROvfOV6U7xP2VT5NdSU0GlDzTpOKj7h
         9yDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766595824; x=1767200624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f81w3dP1tK2eL4eFxpXsxUA2ohrjxt2N+AHHpB9O6MY=;
        b=i0cgsjigt5BH8xl/S7IEAyNLXaccp/VLNIAbNEr9dGnPgo59tBAt/ei9Uny/0fZQwB
         AUm4l+fmDjaMFP51J/X35bWOnlw2aeDQIAcUSU0eOFM2LU5Bx76/DMJ2oTGJ1X+O8k7d
         7FZ7TVvPQ+Ebs33+uAQciP+kWpWt/RG71ojfkORpoJrbxjD59ZSU81iB4m5FdCyT3Ga7
         OxLW4GyZXlqARyx/V30xvZKxuEChBQSmsV9zITIEvCgevcMxdbK3DUtOZjLXuJ4/guEm
         +Ti0XcR9E91DbPqQheuKVT9xTKQYwpb8xdTD3/OtKuY9JGLc84jGSrWC+6ACx3Azllm3
         kCPA==
X-Gm-Message-State: AOJu0Yzu5/WfQkeNCgNITqpN4+piC+skAYLeEfTWcXPL77O8mqU1Lk0G
	zVRPv+BzaDl8Mmxc58CO2uLPRMJdhaf/oVhbXhP7ZHgEJiCVLSBKpY+1AcpPDQ==
X-Gm-Gg: AY/fxX5TeXcrfT0SqvSSe1b+hXs5Cy7curRO2Oxu4OHM67C1FtpUOZDv4gfoeOZ7dfc
	EYziGZlRFmofKVD9IpPJpW+Iyi108WsroAMc6xp54bK9oLxGJsGPeqNBsTYF5qvI7ToAGTEequX
	ArXabQ/MaAsRVpC6N/Y17gFGBMJkEkKWjPE+GDSJI00D4LRUFGgNmokrNQtSamg5uxELOANdESs
	qvbvsP9JGcY8nVCAtKCRAD+ZTgBaU0AfxVILj5HaaS0fTnrRLqpM0VSzrRckMu2yISh6/naI01w
	esJPRlJ+4Mo9tRKw8SLoSjOXqNvXX8B2tdOtknEwJp2sb21uRpBUXkcyGRWj6BpDWkY0J9rSYgP
	duDrcZiGXEoOHEbLCogdfc6Vj/v7wZpsKmZrzmhnsGjebikkLXjmIkguFplgTD5YpPDLDZ4ewuD
	9tZbRbkluX4bZpZutCxAmiHdaBDNflsMOJBrBVqA/Ur7jLklX9O+nqHM0=
X-Google-Smtp-Source: AGHT+IHshSx3l5OrJNFlQ2SSgcsfwt3lta9Ueb5q3FYlqr00Fpc0Dn1/nt2xc9qJJ5HAxNygBYvj1w==
X-Received: by 2002:a17:907:7e85:b0:b3a:8070:e269 with SMTP id a640c23a62f3a-b8035649310mr2198873866b.14.1766595823899;
        Wed, 24 Dec 2025 09:03:43 -0800 (PST)
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
Subject: [PATCH v1 08/15] xen/riscv: introduce vtimer_set_timer() and vtimer_expired()
Date: Wed, 24 Dec 2025 18:03:21 +0100
Message-ID: <8cd3efa488b3da2a6751c92d20bbfeb87b3ba39a.1766595589.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1766595589.git.oleksii.kurochko@gmail.com>
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce vtimer_set_timer() to program a vCPU’s virtual timer based on
guest-provided tick values. The function handles clearing pending timer
interrupts, converting ticks to nanoseconds, and correctly treating
(uint64_t)-1 as a request to disable the timer per the RISC-V SBI
specification.

Additionally, update vtimer_expired() to inject IRQ_VS_TIMER into
the target vCPU instead of panicking, enabling basic virtual timer
operation.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/vtimer.h |  2 ++
 xen/arch/riscv/vtimer.c             | 30 ++++++++++++++++++++++++++++-
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/include/asm/vtimer.h b/xen/arch/riscv/include/asm/vtimer.h
index a2ca704cf0cc..2cacaf74b83b 100644
--- a/xen/arch/riscv/include/asm/vtimer.h
+++ b/xen/arch/riscv/include/asm/vtimer.h
@@ -22,4 +22,6 @@ void vcpu_timer_destroy(struct vcpu *v);
 
 int domain_vtimer_init(struct domain *d, struct xen_arch_domainconfig *config);
 
+void vtimer_set_timer(struct vtimer *t, const uint64_t ticks);
+
 #endif /* ASM__RISCV__VTIMER_H */
diff --git a/xen/arch/riscv/vtimer.c b/xen/arch/riscv/vtimer.c
index 5ba533690bc2..99a0c5986f1d 100644
--- a/xen/arch/riscv/vtimer.c
+++ b/xen/arch/riscv/vtimer.c
@@ -1,6 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <xen/domain.h>
 #include <xen/sched.h>
+#include <xen/time.h>
 
 #include <public/xen.h>
 
@@ -15,7 +17,9 @@ int domain_vtimer_init(struct domain *d, struct xen_arch_domainconfig *config)
 
 static void vtimer_expired(void *data)
 {
-    panic("%s: TBD\n", __func__);
+    struct vtimer *t = data;
+
+    vcpu_set_interrupt(t->v, IRQ_VS_TIMER);
 }
 
 int vcpu_vtimer_init(struct vcpu *v)
@@ -37,3 +41,27 @@ void vcpu_timer_destroy(struct vcpu *v)
 
     kill_timer(&v->arch.vtimer.timer);
 }
+
+void vtimer_set_timer(struct vtimer *t, const uint64_t ticks)
+{
+    s_time_t expires = ticks_to_ns(ticks - boot_clock_cycles);
+
+    vcpu_unset_interrupt(t->v, IRQ_VS_TIMER);
+
+    /*
+     * According to the RISC-V sbi spec:
+     *   If the supervisor wishes to clear the timer interrupt without
+     *   scheduling the next timer event, it can either request a timer
+     *   interrupt infinitely far into the future (i.e., (uint64_t)-1),
+     *   or it can instead mask the timer interrupt by clearing sie.STIE CSR
+     *   bit.
+     */
+    if ( ticks == ((uint64_t)~0ULL) )
+    {
+        stop_timer(&t->timer);
+
+        return;
+    }
+
+    set_timer(&t->timer, expires);
+}
-- 
2.52.0


