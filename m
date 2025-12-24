Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 198D2CDCEBA
	for <lists+xen-devel@lfdr.de>; Wed, 24 Dec 2025 18:04:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192952.1512000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYSH3-00049I-AW; Wed, 24 Dec 2025 17:03:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192952.1512000; Wed, 24 Dec 2025 17:03:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYSH3-00045q-5d; Wed, 24 Dec 2025 17:03:45 +0000
Received: by outflank-mailman (input) for mailman id 1192952;
 Wed, 24 Dec 2025 17:03:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jcWU=66=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vYSH0-0003b7-VP
 for xen-devel@lists.xenproject.org; Wed, 24 Dec 2025 17:03:42 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f4a175e-e0ea-11f0-9cce-f158ae23cfc8;
 Wed, 24 Dec 2025 18:03:41 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b7a6e56193cso998928766b.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Dec 2025 09:03:41 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037ab7f7bsm1798927766b.18.2025.12.24.09.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 09:03:39 -0800 (PST)
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
X-Inumbo-ID: 7f4a175e-e0ea-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766595820; x=1767200620; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g8XzwJhnCm5wKitCTTX5wDHC/h0G6FAP9bDwWltV38M=;
        b=nfgR1hChQELx+mxttjRdYhOFXOR1RF4K7nrL6wgUmEgNw3EKUYlPwi+XBrl/dnM2ME
         4vX0tuxnVVBQKKt465vlcY58VH6SqQByeDwgPS+rpOnCLtAvG9lnEtqysEBa4TJT3Bgo
         ITKm0bjs1Fc5wmT4IvfHAGI/RBlE5xSKNb/AJaiU+b7LI6+xJGLMb8YB2OG70ouOUklT
         kl/foLM1hRmEcwYd5ZACcE4/UjuTOLG6P8Vh7MbI73x3OYTzgXbXM2IToIvEglbcF0HY
         nArl3PzdqYlSeurj9cOZYDKT1cWri2/n32dUfdI2Fe14ZjbBCY0+9BEikKQUy/N/MBlq
         1Kew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766595820; x=1767200620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g8XzwJhnCm5wKitCTTX5wDHC/h0G6FAP9bDwWltV38M=;
        b=qyhwnoB/5tayQGys97/Dx6fs/FtQaBEypYUvKOFaLItSlZ7jWfDA7w4jvYovEOoa6b
         JCB15pg5MNM0nFtoNljLYUrZA4KW329osYZcbLeFIwRC8GxQYqQxE8+75Yj2HNaHyBBM
         ehIqfmstzCNuTU5WtXgJqaN3FTVMphPecTZucVTiu+olNJIG/8Dc/GYsgREY2/3RDOD9
         psjUyEBZJoKkWKYUq+k8FzrnkBZ1VmZJ/A+tejuNEx4gCZWgiYhDECK1J5veYoeHNiQX
         zxVCYZEy2lbMhFwxgTgYHdH2H7Cvs0s6j3j1slx+7c9jQEavE9zoY8BmInatIQRuw39Z
         jp7w==
X-Gm-Message-State: AOJu0YzhyFnMeeb2NrbUJra8j6baXJNSpGvDJXEGW6Lx39edHfYApBjZ
	wvpG9LbBYGitFamwHy6pb6aoOtH2vaXXjjoIOxLueurrwTJgWM3UVEqRcksemQ==
X-Gm-Gg: AY/fxX6Ipj8/Uoz6RxN6XFizFGQ8OozhgMWIBp6szchNqDkdDdxBkU8MVweYTcoE5cZ
	bGm1CU6oOhEZxJR9mbdcUGWSSVF4GbfPoRP/S1sGCefuAoYO1IxDHe5kekrJ+TFjlXDFkoYtcPn
	3hSKKa3ga9KquoqeJDZwfsR8+8asJrRYLwW8oYrEentZYHLqbkknvmm/B418Y4x+rLzNrmjIM0J
	Pz0B+aklR90TMgofG2JCdlJGMa2Yz3gu9/wjDH4H1k0h4UIsLAgi1bWoMFG8bUQ7of8dVbKCRwW
	/wmu/cacys820Pcgjqc1iMVj5/7n4Q3a9Qhy0WrJahWsvFto6RQB81B2Wup63dAoOqfpz7rwCQ3
	zj3BVbc9jDGyFU9fXINZZ8zpIL01TKa1snLVpRLf461kH87lFaS4qYwlK97Tb6IZHeFw6/+ga2C
	JvNOEEedBG4SNW8sRJxGI0xR+Wu/OZrRciZMbLdmlkDZDFpuFzw6EuQdUzGWMPaxBo4A==
X-Google-Smtp-Source: AGHT+IH6Bhd0noBuZdsNvUD5oseP8WhloVgyS5FPCVJYVoTkO6Qd/swFoYV/yyKbBks3zpi7Qwzu6g==
X-Received: by 2002:a17:907:7e85:b0:b7c:eb19:2094 with SMTP id a640c23a62f3a-b8037257589mr1663597366b.48.1766595820172;
        Wed, 24 Dec 2025 09:03:40 -0800 (PST)
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
Subject: [PATCH v1 04/15] xen/riscv: introduce vtimer
Date: Wed, 24 Dec 2025 18:03:17 +0100
Message-ID: <94ffc70d3050e532290126560355dc548161f466.1766595589.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1766595589.git.oleksii.kurochko@gmail.com>
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a virtual timer structure along with functions to initialize
and destroy the virtual timer.

Add a vtimer_expired() function and implement it as a stub, as the timer
and tasklet subsystems are not functional at this stage.

Call vcpu_vtimer_init() in arch_vcpu_create().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/Makefile             |  1 +
 xen/arch/riscv/domain.c             |  8 ++++--
 xen/arch/riscv/include/asm/domain.h |  4 +++
 xen/arch/riscv/include/asm/vtimer.h | 25 ++++++++++++++++++
 xen/arch/riscv/vtimer.c             | 39 +++++++++++++++++++++++++++++
 5 files changed, 75 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/vtimer.h
 create mode 100644 xen/arch/riscv/vtimer.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 8863d4b15605..5bd180130165 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -22,6 +22,7 @@ obj-y += traps.o
 obj-y += vmid.o
 obj-y += vm_event.o
 obj-y += vsbi/
+obj-y += vtimer.o
 
 $(TARGET): $(TARGET)-syms
 	$(OBJCOPY) -O binary -S $< $@
diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 44387d056546..dd3c237d163d 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -6,6 +6,7 @@
 #include <asm/cpufeature.h>
 #include <asm/csr.h>
 #include <asm/riscv_encoding.h>
+#include <asm/vtimer.h>
 
 static void vcpu_csr_init(struct vcpu *v)
 {
@@ -97,11 +98,14 @@ int arch_vcpu_create(struct vcpu *v)
     if ( is_idle_vcpu(v) )
         return rc;
 
+    if ( (rc = vcpu_vtimer_init(v)) )
+        goto fail;
+
     /*
-     * As the vtimer and interrupt controller (IC) are not yet implemented,
+     * As interrupt controller (IC) is not yet implemented,
      * return an error.
      *
-     * TODO: Drop this once the vtimer and IC are implemented.
+     * TODO: Drop this once IC is implemented.
      */
     rc = -EOPNOTSUPP;
     goto fail;
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index a0ffbbc09c6f..be7ddaff30e7 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -8,6 +8,7 @@
 #include <public/hvm/params.h>
 
 #include <asm/p2m.h>
+#include <asm/vtimer.h>
 
 struct vcpu_vmid {
     uint64_t generation;
@@ -52,6 +53,9 @@ struct arch_vcpu
     struct cpu_info *cpu_info;
     void *stack;
 
+    struct vtimer vtimer;
+    bool vtimer_initialized;
+
     /* CSRs */
     register_t hstatus;
     register_t hedeleg;
diff --git a/xen/arch/riscv/include/asm/vtimer.h b/xen/arch/riscv/include/asm/vtimer.h
new file mode 100644
index 000000000000..a2ca704cf0cc
--- /dev/null
+++ b/xen/arch/riscv/include/asm/vtimer.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * (c) 2023-2024 Vates
+ */
+
+#ifndef ASM__RISCV__VTIMER_H
+#define ASM__RISCV__VTIMER_H
+
+#include <xen/timer.h>
+
+struct domain;
+struct vcpu;
+struct xen_arch_domainconfig;
+
+struct vtimer {
+    struct vcpu *v;
+    struct timer timer;
+};
+
+int vcpu_vtimer_init(struct vcpu *v);
+void vcpu_timer_destroy(struct vcpu *v);
+
+int domain_vtimer_init(struct domain *d, struct xen_arch_domainconfig *config);
+
+#endif /* ASM__RISCV__VTIMER_H */
diff --git a/xen/arch/riscv/vtimer.c b/xen/arch/riscv/vtimer.c
new file mode 100644
index 000000000000..5ba533690bc2
--- /dev/null
+++ b/xen/arch/riscv/vtimer.c
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/sched.h>
+
+#include <public/xen.h>
+
+#include <asm/vtimer.h>
+
+int domain_vtimer_init(struct domain *d, struct xen_arch_domainconfig *config)
+{
+    /* Nothing to do at the moment */
+
+    return 0;
+}
+
+static void vtimer_expired(void *data)
+{
+    panic("%s: TBD\n", __func__);
+}
+
+int vcpu_vtimer_init(struct vcpu *v)
+{
+    struct vtimer *t = &v->arch.vtimer;
+
+    t->v = v;
+    init_timer(&t->timer, vtimer_expired, t, v->processor);
+
+    v->arch.vtimer_initialized = true;
+
+    return 0;
+}
+
+void vcpu_timer_destroy(struct vcpu *v)
+{
+    if ( !v->arch.vtimer_initialized )
+        return;
+
+    kill_timer(&v->arch.vtimer.timer);
+}
-- 
2.52.0


