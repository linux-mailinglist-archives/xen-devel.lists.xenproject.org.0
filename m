Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFZ3Cl5JzmlQmgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 12:47:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2E6387DB2
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 12:47:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271537.1559725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8FaP-0006a2-OV; Thu, 02 Apr 2026 10:47:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271537.1559725; Thu, 02 Apr 2026 10:47:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8FaP-0006RL-5v; Thu, 02 Apr 2026 10:47:41 +0000
Received: by outflank-mailman (input) for mailman id 1271537;
 Thu, 02 Apr 2026 10:47:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1w8FaM-00067Z-PE
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 10:47:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8FaM-00Ej0u-4t
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 12:47:38 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69ce4947-2eae-0a2a0a5409dd-0a2a4505b638-12
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 12:47:38 +0200
Received: from [209.85.218.45] (helo=mail-ej1-f45.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69ce494a-3760-0a2a45050019-d155da2da5b5-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 12:47:38 +0200
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-b9a0762ed5fso112580866b.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 03:47:38 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.26.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9c3d028955sm76392366b.61.2026.04.02.03.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2026 03:47:36 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775126857; x=1775731657; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zPqg0vXhWWH1w1hlbbZTkVgax5cKCfDJE6WmuksoUYo=;
        b=XzNNXBZ0XzWFnGtiBZ1yT3Mphevk23hj5Lzrx0nbE/kKI0Kd6lkbAs4bNnRgse3cOl
         BVX2smmpF5UqejCDojw+b3v3bpeLIeaY5poKd2LGN+m6EEg4Z6pa0q8RBmRePnMFvEjk
         xPqnhAhSeDJ5+FqKn3Cz6MOVJjOvuF5m5BTqNK0hJ/XJXgAcN0SQT5Y3odwjhO/h/HcM
         fiu6IeEWNTh4N2hh7AdxvXtwFkcw1XNH2ehMxtuE0lydLq3A0QtCRga98qdC4CwgEVu0
         044j0x/l9N4kMyS9G4o18D4/ywWIYf/yQL9xB1xc743Mrj5EwRfwYiIdvZJGmIeqrjmW
         00fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775126857; x=1775731657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zPqg0vXhWWH1w1hlbbZTkVgax5cKCfDJE6WmuksoUYo=;
        b=MFDW1hOZmdwkhYwFXb/iV4a3OsW+icPDVCZ71xYZxBYE87ZKFahTNlKruEVvRdmDD3
         rNNvr2tYD9ZSDQSKKV2CmvBgzOGeuhas54bBXNOyf0szn84Suzq3OKAGfhfYnf7qHAuY
         L727wWKLIE5cYZCQuEYvuI+Xr4SfEb+TooOxQhpzpK+RiXylpkmLdI39MGYCd0Sec3nh
         3BxPuNFORmr5Tss6Am0TUCxF6aOkD7ykJfRxleM1CVyfllUDOMKdt0Y60rsMmGZAqlf1
         w9n59HD5nc2Z48tWqTB9PlUWhwO84RVMcr45llWE30eJOYKZmPPux3QBH3Lpkgdhe+++
         IYvw==
X-Gm-Message-State: AOJu0Yws0fxml572L6y7c59gdQbXlu4MXPTNWXHbpL0//AbjS+QDLrYa
	XxEOVG0Y7WeLFX8lITdx2Tu8nr4a+Hl+K9puPB9oiuPDZHkI6xCcKbvgUxEhEQrz
X-Gm-Gg: ATEYQzwHtZUkKsviNXdX3X+dd2X1K67kgj3P/lbhGWi2Ft/T6uYs1m9yObm0zQ8NJdB
	ROY/tmdEMuNCjt0gyoIgvk7Eq6wiFws6ze24LrojsYWFOkd6teo+7Fz7qsCTsrYPR3GSAqU0f9v
	VOAuAXrzLm79qSLbdQnvqgNLe8+k33PX9Ndb8K4ekJBVVQUaJQITpcA/GiAbsqnfd4U7GglFJdF
	mY9ughY6Oo4wmZjh2ZoPDfNxftA6j1UV0KfODNK7V602yqFaJ0rywDd/2z9lptQSsDy/gY3DDOc
	JTvHiKiSqp9CvtHZrsOEGHQ9cPaqWPMLnTCGJL9KuEh42iS9TCYLOSy/CCoNl43K1qBjJ5W4DkD
	p5qO18Y0IpmjDetYwh5dYZz7NoEBueZdOnjDoaDIeiN5JAtqH8FU5Ln/lc18KjU6HhX+9uuvitm
	h8Fi1F+vMyYHoAohm0elXluPSNSg==
X-Received: by 2002:a17:907:c22:b0:b98:f1d:6a63 with SMTP id a640c23a62f3a-b9c46e25d10mr98516666b.9.1775126857055;
        Thu, 02 Apr 2026 03:47:37 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v8 11/13] xen/arm: Save/restore context on suspend/resume
Date: Thu,  2 Apr 2026 13:45:12 +0300
Message-ID: <f87a2bcb6b09e95e07e51c27541ad91406e849d1.1775125380.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1775125380.git.mykola_kvach@epam.com>
References: <cover.1775125380.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1775126858-3979296F-423BE752/0/0
X-purgate-type: clean
X-purgate-size: 7252
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,epam.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,aggios.com:email];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: CB2E6387DB2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mirela Simonovic <mirela.simonovic@aggios.com>

The context of CPU general purpose and system control registers must be
saved on suspend and restored on resume. This is implemented in
prepare_resume_ctx and before the return from the hyp_resume function.
The prepare_resume_ctx must be invoked just before the PSCI system suspend
call is issued to the ATF. The prepare_resume_ctx must return a non-zero
value so that the calling 'if' statement evaluates to true, causing the
system suspend to be invoked. Upon resume, the context saved on suspend
will be restored, including the link register. Therefore, after
restoring the context, the control flow will return to the address
pointed to by the saved link register, which is the place from which
prepare_resume_ctx was called. To ensure that the calling 'if' statement
does not again evaluate to true and initiate system suspend, hyp_resume
must return a zero value after restoring the context.

Note that the order of saving register context into cpu_context structure
must match the order of restoring.

Support for ARM32 is not implemented. Instead, compilation fails with a
build-time error if suspend is enabled for ARM32.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v8:
- fix alignments in code

Changes in v7:
- no changes
---
 xen/arch/arm/Makefile              |  1 +
 xen/arch/arm/arm64/head.S          | 90 +++++++++++++++++++++++++++++-
 xen/arch/arm/include/asm/suspend.h | 26 +++++++++
 xen/arch/arm/suspend.c             | 14 +++++
 4 files changed, 130 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/suspend.c

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 69200b2728..c36158271a 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -51,6 +51,7 @@ obj-y += setup.o
 obj-y += shutdown.o
 obj-y += smp.o
 obj-y += smpboot.o
+obj-$(CONFIG_SYSTEM_SUSPEND) += suspend.o
 obj-$(CONFIG_SYSCTL) += sysctl.o
 obj-y += time.o
 obj-y += traps.o
diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 596e960152..2cb02ee314 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -562,6 +562,52 @@ END(efi_xen_start)
 #endif /* CONFIG_ARM_EFI */
 
 #ifdef CONFIG_SYSTEM_SUSPEND
+/*
+ * int prepare_resume_ctx(struct cpu_context *ptr)
+ *
+ * x0 - pointer to the storage where callee's context will be saved
+ *
+ * CPU context saved here will be restored on resume in hyp_resume function.
+ * prepare_resume_ctx shall return a non-zero value. Upon restoring context
+ * hyp_resume shall return value zero instead. From C code that invokes
+ * prepare_resume_ctx, the return value is interpreted to determine whether
+ * the context is saved (prepare_resume_ctx) or restored (hyp_resume).
+ */
+FUNC(prepare_resume_ctx)
+        /* Store callee-saved registers */
+        stp   x19, x20, [x0], #16
+        stp   x21, x22, [x0], #16
+        stp   x23, x24, [x0], #16
+        stp   x25, x26, [x0], #16
+        stp   x27, x28, [x0], #16
+        stp   x29, lr, [x0], #16
+
+        /* Store stack-pointer */
+        mov   x2, sp
+        str   x2, [x0], #8
+
+        /* Store system control registers */
+        mrs   x2, VBAR_EL2
+        str   x2, [x0], #8
+        mrs   x2, VTCR_EL2
+        str   x2, [x0], #8
+        mrs   x2, VTTBR_EL2
+        str   x2, [x0], #8
+        mrs   x2, TPIDR_EL2
+        str   x2, [x0], #8
+        mrs   x2, MDCR_EL2
+        str   x2, [x0], #8
+        mrs   x2, HSTR_EL2
+        str   x2, [x0], #8
+        mrs   x2, CPTR_EL2
+        str   x2, [x0], #8
+        mrs   x2, HCR_EL2
+        str   x2, [x0], #8
+
+        /* prepare_resume_ctx must return a non-zero value */
+        mov   x0, #1
+        ret
+END(prepare_resume_ctx)
 
 FUNC(hyp_resume)
         /* Initialize the UART if earlyprintk has been enabled. */
@@ -580,7 +626,49 @@ FUNC(hyp_resume)
         b     enable_secondary_cpu_mm
 
 mmu_resumed:
-        b .
+        /* Now we can access the cpu_context, so restore the context here */
+        ldr   x0, =cpu_context
+
+        /* Restore callee-saved registers */
+        ldp   x19, x20, [x0], #16
+        ldp   x21, x22, [x0], #16
+        ldp   x23, x24, [x0], #16
+        ldp   x25, x26, [x0], #16
+        ldp   x27, x28, [x0], #16
+        ldp   x29, lr, [x0], #16
+
+        /* Restore stack pointer */
+        ldr   x2, [x0], #8
+        mov   sp, x2
+
+        /* Restore system control registers */
+        ldr   x2, [x0], #8
+        msr   VBAR_EL2, x2
+        ldr   x2, [x0], #8
+        msr   VTCR_EL2, x2
+        ldr   x2, [x0], #8
+        msr   VTTBR_EL2, x2
+        ldr   x2, [x0], #8
+        msr   TPIDR_EL2, x2
+        ldr   x2, [x0], #8
+        msr   MDCR_EL2, x2
+        ldr   x2, [x0], #8
+        msr   HSTR_EL2, x2
+        ldr   x2, [x0], #8
+        msr   CPTR_EL2, x2
+        ldr   x2, [x0], #8
+        msr   HCR_EL2, x2
+        isb
+
+        /*
+         * Since context is restored return from this function will appear
+         * as return from prepare_resume_ctx. To distinguish a return from
+         * prepare_resume_ctx which is called upon finalizing the suspend,
+         * as opposed to return from this function which executes on resume,
+         * we need to return zero value here.
+         */
+        mov   x0, #0
+        ret
 END(hyp_resume)
 
 #endif /* CONFIG_SYSTEM_SUSPEND */
diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/asm/suspend.h
index 31a98a1f1b..c127fa3d78 100644
--- a/xen/arch/arm/include/asm/suspend.h
+++ b/xen/arch/arm/include/asm/suspend.h
@@ -3,6 +3,8 @@
 #ifndef ARM_SUSPEND_H
 #define ARM_SUSPEND_H
 
+#include <xen/types.h>
+
 struct domain;
 struct vcpu;
 struct vcpu_guest_context;
@@ -14,6 +16,30 @@ struct resume_info {
 
 void arch_domain_resume(struct domain *d);
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+#ifdef CONFIG_ARM_64
+struct cpu_context {
+    register_t callee_regs[12];
+    register_t sp;
+    register_t vbar_el2;
+    register_t vtcr_el2;
+    register_t vttbr_el2;
+    register_t tpidr_el2;
+    register_t mdcr_el2;
+    register_t hstr_el2;
+    register_t cptr_el2;
+    register_t hcr_el2;
+} __aligned(16);
+#else
+#error "Define cpu_context structure for arm32"
+#endif
+
+extern struct cpu_context cpu_context;
+
+int prepare_resume_ctx(struct cpu_context *ptr);
+void hyp_resume(void);
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 #endif /* ARM_SUSPEND_H */
 
 /*
diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
new file mode 100644
index 0000000000..e38566b0b7
--- /dev/null
+++ b/xen/arch/arm/suspend.c
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <asm/suspend.h>
+
+struct cpu_context cpu_context = {};
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


