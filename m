Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cB/lJvoQimnZGQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:53:14 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DA4112B68
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:53:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225785.1532369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUV9-0007oY-KH; Mon, 09 Feb 2026 16:52:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225785.1532369; Mon, 09 Feb 2026 16:52:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUV9-0007nC-GH; Mon, 09 Feb 2026 16:52:43 +0000
Received: by outflank-mailman (input) for mailman id 1225785;
 Mon, 09 Feb 2026 16:52:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zC3u=AN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vpUV7-0007Zd-Fw
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 16:52:41 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be6d4348-05d7-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 17:52:39 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b884a84e622so812587766b.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 08:52:39 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8edacf1564sm415776866b.52.2026.02.09.08.52.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 08:52:38 -0800 (PST)
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
X-Inumbo-ID: be6d4348-05d7-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770655959; x=1771260759; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JMEwFKcyHIZZ4fXEejJ25YZMQb9FLhdSrVKjYgj/ce8=;
        b=d5CC6t6dB2t2c2BaoE5K0s8L6UrVhG/Kwx5yteQo7PJ+FPh0QdmppARh4W9A8GkCb9
         ZvFOm1CFK4aQNOEJEtWGavTdhgMNAOViCI64+hD7CNBnB1o22hIr9XWcmKZ/hBK8Oxa7
         WU5zK4rkp5KxKDMBL8gcxKBSeF55ZG2MPAh9vV1R24NbOcqsWonn8g5lwtQE7Wh82Wdw
         w3wxz0YA/3N1TloZMi4yWrk0KftlY+Qi5JEzJWejtaBeK7TPn/xJjiqLk/tZIrmM/QOO
         xGiyBglq/D4FVxdEsQsk+wbAbPgcJJoCDRtTZRsS4ePiXX6KxPKzCcb3au1LER45Vd0I
         dFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770655959; x=1771260759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JMEwFKcyHIZZ4fXEejJ25YZMQb9FLhdSrVKjYgj/ce8=;
        b=sJdyJWRY0BxuA3LjCb7afPVeQkBdUXV4aTFCCpbZncniKRRo4I4g8iumq5s4JiBu6q
         XNo2Yam/aTrGW/nSidC2TmNoa6WOTTIo2Zh/gJECIrcltqBJBTeZ8ct2NWNf/JdbMEJe
         Irn1nvIo/+9bxklKyAgNpf25HQKiQKPVV4XHOC4JBsfsq21KIzR0KFAZy46ySyD3hhJG
         YNJ5UQMxSlht/fHq5q89eR3E3BuPJEsP6kZmfeXFuWozGeu3coF0kYlQOFPS4U7xD/HS
         HdKEyAXQTazRv6M+tCNovqi0TAZaocE7cxFnPfzYcwEJfsOIoXYHW8r0C0e78+Vqtxjc
         0dYw==
X-Gm-Message-State: AOJu0YwUdPPwX6KPx49NsiI5aZRJahLA2ynWwOSNAfg2CiQuqlZUvMFu
	PCC58Bst11vlCjV9OtBLL2o5vH91eSmBJ4MqsSgiuGnbY4/eUZCdT/BxSpUHWmq8
X-Gm-Gg: AZuq6aK6FVDU6F+HIzVNKNzARq+AL0J4AybsX+2N5MZnou0/cz6Zvp7txUehbQa8mQw
	1JFGamfp7onKW7zQoY3HaF2Kt+eVXNdf3qZ0SwHijN0HhfSkn5REk67XdUTeV7pOTDoqv1o/DRA
	U2OYWdrcgXBEX9YPpADZoAhVyW/63Rd5+2g+vfs3t+f9e7fSpxNLLLprnv8SIht0rmo+brujN5j
	mBoWzXv4+8rKbwLKioD0/9WAvYy8LA0ihEZ676fYnpdziG9zMWcD1j1fAl89Ix546VtQfiolwut
	5xkArmKLPhs/t0Dh+//CA4oFrHQlDUuMv+gF0BIY1bfm0GanM9sLIzQ+LqgCyQRwL5boO3D4rUs
	esxdkrqMpSeFqM2ZN3qEFDnmTizdKnMsBxaDO/UGGpyNrX0UZTq9Zd+j/2DayYfg7RgCti2P1nO
	oxb4PfifQEevnoXhjTljVNILA8RtQvJxITU/Q48l0YCturmZYeRluY8A==
X-Received: by 2002:a17:907:a44:b0:b8e:d0ec:c9e2 with SMTP id a640c23a62f3a-b8edf37ec3emr628174066b.53.1770655958667;
        Mon, 09 Feb 2026 08:52:38 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 01/16] xen/riscv: implement arch_vcpu_{create,destroy}()
Date: Mon,  9 Feb 2026 17:52:14 +0100
Message-ID: <d385b802054e0d55129da4cbba60d34b658992c2.1770650552.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770650552.git.oleksii.kurochko@gmail.com>
References: <cover.1770650552.git.oleksii.kurochko@gmail.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 43DA4112B68
X-Rspamd-Action: no action

Introduce architecture-specific functions to create and destroy VCPUs.
Note that arch_vcpu_create() currently returns -EOPNOTSUPP, as the virtual
timer and interrupt controller are not yet implemented.

Add calle-saved registers used to preserve Xen’s own execution context
when switching between vCPU stacks.
It is going to be used in the following way (pseudocode):
  context_switch(prev_vcpu, next_vcpu):
    ...

    /* Switch from previous stack to the next stack. */
    __context_switch(prev_vcpu, next_vcpu);

    ...
    schedule_tail(prev_vcpu):
        Save and restore vCPU's CSRs.
The Xen-saved context allows __context_switch() to switch execution
from the previous vCPU’s stack to the next vCPU’s stack and later resume
execution on the original stack when switching back.

During vCPU creation, the Xen-saved context is going to be initialized
with:
  - SP pointing to the newly allocated vCPU stack
  - RA pointing to a helper that performs final vCPU setup before
    transferring control to the guest
After the first execution of __context_switch(), RA naturally points to
the instruction following the call site, and the remaining callee-saved
registers contain the Xen register state at the time of the switch.

As part of this change, add continue_new_vcpu(), which will be used after
the first context_switch() of a new vCPU. Since this functionality is not
yet implemented, continue_new_vcpu() is currently provided as a stub.
The prev argument is going to be set by RISC-V ABI (prev will be stored in
a0) when __context_swtich() will be introduced and called from
context_switch().

Update the STACK_SIZE definition and introduce STACK_ORDER (to align with
other architectures) for allocating the vCPU stack.

Introduce struct cpu_info to store per-vCPU state that lives at the top
of the vCPU's stack.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - Move declaration of xen_saved_context structure and cpu_info structure
   here as they are going to be used in this patch.
 - Drop separate zero-ing of arch.cpu_info as a memory for it is allocated
   by vzalloc().
 - Correct calculation of stack pointer in arch_vcpu_destroy() function.
---
Changes in v2:
 - Drop BUILD_BUG_ON() in arch_vcpu_create() as a check isn't very useful.
 - Use vzalloc() instead of alloc_xenheap_page() to use the larger domheap to
   allocate vCPU's stack.
 - Drop printk() inside arch_vcpu_create() to not have potential big noise
   in console as it could be that an amount of vCPUs is pretty big.
 - Use XVFREE() instead of free_xenheap_pages() as vCPU's stack allocation
   happens with a usage of vzalloc() now.
 - Drop stack field as it is enough to have only cpu_info as stack pointer
   could be calculated based on cpu_info.
 - Drop cast when v.arch.cpu_info is inialized as it is not necessary
        to have it.
 - Drop memset() for arch.cpu_info() as it is enough to have vzalloc().
---
 xen/arch/riscv/Makefile              |  1 +
 xen/arch/riscv/domain.c              | 58 ++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/config.h  |  3 +-
 xen/arch/riscv/include/asm/current.h |  6 +++
 xen/arch/riscv/include/asm/domain.h  | 24 ++++++++++++
 xen/arch/riscv/stubs.c               | 10 -----
 6 files changed, 91 insertions(+), 11 deletions(-)
 create mode 100644 xen/arch/riscv/domain.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 0df139b27423..868514c25006 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -1,5 +1,6 @@
 obj-y += aplic.o
 obj-y += cpufeature.o
+obj-y += domain.o
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 obj-y += entry.o
 obj-y += imsic.o
diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
new file mode 100644
index 000000000000..d035b105c2cc
--- /dev/null
+++ b/xen/arch/riscv/domain.c
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/init.h>
+#include <xen/mm.h>
+#include <xen/sched.h>
+#include <xen/vmap.h>
+
+static void continue_new_vcpu(struct vcpu *prev)
+{
+    BUG_ON("unimplemented\n");
+}
+
+static void __init __maybe_unused build_assertions(void)
+{
+    /*
+     * Enforce the requirement documented in struct cpu_info that
+     * guest_cpu_user_regs must be the first field.
+     */
+    BUILD_BUG_ON(offsetof(struct cpu_info, guest_cpu_user_regs) != 0);
+}
+
+int arch_vcpu_create(struct vcpu *v)
+{
+    int rc = 0;
+    void *stack = vzalloc(STACK_SIZE);
+
+    if ( !stack )
+        return -ENOMEM;
+
+    v->arch.cpu_info = stack + STACK_SIZE - sizeof(struct cpu_info);
+
+    v->arch.xen_saved_context.sp = (register_t)v->arch.cpu_info;
+    v->arch.xen_saved_context.ra = (register_t)continue_new_vcpu;
+
+    /* Idle VCPUs don't need the rest of this setup */
+    if ( is_idle_vcpu(v) )
+        return rc;
+
+    /*
+     * As the vtimer and interrupt controller (IC) are not yet implemented,
+     * return an error.
+     *
+     * TODO: Drop this once the vtimer and IC are implemented.
+     */
+    rc = -EOPNOTSUPP;
+    goto fail;
+
+    return rc;
+
+ fail:
+    arch_vcpu_destroy(v);
+    return rc;
+}
+
+void arch_vcpu_destroy(struct vcpu *v)
+{
+    vfree((char *)v->arch.cpu_info + sizeof(struct cpu_info) - STACK_SIZE);
+}
diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index 1e08d3bf78be..86a95df018b5 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -143,7 +143,8 @@
 
 #define SMP_CACHE_BYTES (1 << 6)
 
-#define STACK_SIZE PAGE_SIZE
+#define STACK_ORDER 3
+#define STACK_SIZE (PAGE_SIZE << STACK_ORDER)
 
 #define IDENT_AREA_SIZE 64
 
diff --git a/xen/arch/riscv/include/asm/current.h b/xen/arch/riscv/include/asm/current.h
index 0c3ea70c2ec8..58c9f1506b7c 100644
--- a/xen/arch/riscv/include/asm/current.h
+++ b/xen/arch/riscv/include/asm/current.h
@@ -21,6 +21,12 @@ struct pcpu_info {
 /* tp points to one of these */
 extern struct pcpu_info pcpu_info[NR_CPUS];
 
+/* Per-VCPU state that lives at the top of the stack */
+struct cpu_info {
+    /* This should be the first member. */
+    struct cpu_user_regs guest_cpu_user_regs;
+};
+
 #define set_processor_id(id)    do { \
     tp->processor_id = (id);         \
 } while (0)
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index 316e7c6c8448..f78f145258d6 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -24,6 +24,30 @@ struct arch_vcpu_io {
 
 struct arch_vcpu {
     struct vcpu_vmid vmid;
+
+    /*
+     * Callee saved registers for Xen's state used to switch from
+     * prev's stack to the next's stack during context switch.
+     */
+    struct
+    {
+        register_t s0;
+        register_t s1;
+        register_t s2;
+        register_t s3;
+        register_t s4;
+        register_t s5;
+        register_t s6;
+        register_t s7;
+        register_t s8;
+        register_t s9;
+        register_t s10;
+        register_t s11;
+        register_t sp;
+        register_t ra;
+    } xen_saved_context;
+
+    struct cpu_info *cpu_info;
 };
 
 struct paging_domain {
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index acbfde79b5a7..c5784a436574 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -116,16 +116,6 @@ void dump_pageframe_info(struct domain *d)
     BUG_ON("unimplemented");
 }
 
-int arch_vcpu_create(struct vcpu *v)
-{
-    BUG_ON("unimplemented");
-}
-
-void arch_vcpu_destroy(struct vcpu *v)
-{
-    BUG_ON("unimplemented");
-}
-
 void vcpu_switch_to_aarch64_mode(struct vcpu *v)
 {
     BUG_ON("unimplemented");
-- 
2.52.0


