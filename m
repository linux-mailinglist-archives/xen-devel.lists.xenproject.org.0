Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Q3euDfleA2r65QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 19:10:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D092F5257E8
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 19:10:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307286.1579069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMqcI-000806-Ly; Tue, 12 May 2026 17:09:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307286.1579069; Tue, 12 May 2026 17:09:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMqcI-0007vj-82; Tue, 12 May 2026 17:09:58 +0000
Received: by outflank-mailman (input) for mailman id 1307286;
 Tue, 12 May 2026 17:09:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wMqcG-0007mm-Ix
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 17:09:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMqcF-00AdLt-Vm
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 19:09:55 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a035ecd-bab6-0a2a0a5309dd-0a2a4506e5aa-36
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 19:09:55 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a035ee3-7371-0a2a45060019-d155802fbd5a-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 19:09:55 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-488b0046078so48589675e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 10:09:55 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.26.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fc8cccf90sm10838845e9.0.2026.05.12.10.09.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 10:09:54 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778605795; x=1779210595; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lkhNyEzobDpYCgF/TpDVG4OQjxYfp1uqUAAZRreqhtU=;
        b=HIjHo2uRftMJxoWplko2MV09aZb+TgQQDwXc/9X8jOIBHNH+emuV09INzgmvNX0kWf
         gwVplwoTi0hvlTUKN+PwB7wJHMQqkESi5ftc48LyKXfqIgrDeaQsewfSXe+20cztL2WM
         gDJ91vUEYhbRGTIScsLG1AWpokGnkf/mQbAPzBqnlI+pS+Bo/dirE1XyPmUrLcJtKUyo
         9G1lktAWbBU0CUdxKQKHNFIByR7qLVYdF1NtumGRL6M9ZsAqXFpV89nOUHX1fO6jOStq
         BUUOATjAc8I7TBYc/JJpT/43CPgz4uDj4ynsdRy1u08NIFQIzgaLd/xEWuha8MQJwU+j
         qbmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778605795; x=1779210595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lkhNyEzobDpYCgF/TpDVG4OQjxYfp1uqUAAZRreqhtU=;
        b=BPsQ6zxy/aLh+M8bOGOekgKfLUynOC/ToEgfF+0/y+1r23iQz+JHJgBbuuji2Xt7ff
         fz0gG4bhzgMS/IXdB6O6MbQSggOuBlrMjuDEPzeGHxpl3RFAMWmtK/H2nq6ONWccg5Mn
         8KXQ8rbdgk4t2/C3T6Lg6gDRtCXEgpZMfAfyjqjoedfw2Dmkq77fXSu00vQMImU0A01r
         6x0udCAKn4xzNrrxiRbTUJf8+fxpE5xiAzHzXSijtr08y4xFouSKyIy8SCxf426qc9/C
         7uHiyYGxI+MvmuuzVehAXapAEozxOsc6QR6xcxxXsjzANjUNGNuklRKVGcZy8u50NfiY
         GnrA==
X-Gm-Message-State: AOJu0YwnzLC1ypjX8naGysuUwsI4la7ULlOXMkjpF7XImAMGuOp1rZDY
	InL0mEcdMtgrcWcnTw4zUjmodabLWs9CCx6U1xwpt4eCZbBo0R+bxlowmWDBAQ==
X-Gm-Gg: Acq92OGObMgOjuE+Wct8qwdrJBgPcddU6k+/Tu4wkCdEg56HGdtSK5bTsDmQtO3RJjl
	+pzQqqAl8xVpriARLEmxka02PNvMsLDRg/Lu9hIiPL0eLcnzEK1AREzJA3NvNKNaMb6KxL1ddkm
	uiSKbfJS3SHt2H/OuYWqO6Hnq2d8onA12cR7UE9KyftnKp0xC5lEAP37B2JJEghrkg6LmPY+LpF
	QA6MMNKQNJH/uW2lRomzX/iBDTxPa3XToiVcv1uiJlip5tnvB28M1URf3aV7xOFr0/Yvyh117Qh
	iZDYJnz8pGywViSWOq1f/sHQe6JtVSuCBfVApj8jK83QGG6LsHqS2kyTJfSH1U4Cr6jiMIUiL7u
	V970glNf4TaLHiD+e4dw1tw9M/N59j9Wm9P3IR6sCdJeHGBjELKjsVTSVnbGLowpMxhwY/pCpnS
	3AHsLJ+s7E8twPiu0afXkhz1mVgw==
X-Received: by 2002:a05:600c:5248:b0:48a:906a:9050 with SMTP id 5b1f17b1804b1-48e7069175fmr245499865e9.10.1778605794944;
        Tue, 12 May 2026 10:09:54 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v9 10/13] xen/arm64: Save/restore CPU context across SYSTEM_SUSPEND
Date: Tue, 12 May 2026 20:07:17 +0300
Message-ID: <46bbc9e008a65dd86fb2b368e4751eb7d2014afa.1778605274.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1778605274.git.mykola_kvach@epam.com>
References: <cover.1778605274.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1778605795-85361D75-333E9410/0/0
X-purgate-type: clean
X-purgate-size: 11024
X-Rspamd-Queue-Id: D092F5257E8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

From: Mirela Simonovic <mirela.simonovic@aggios.com>

On wakeup from PSCI SYSTEM_SUSPEND, Xen re-enters EL2 with the MMU and
data cache disabled. The resume path must first switch back to Xen's
runtime page tables before it can access the saved CPU context using
virtual addresses.

Add an arm64 hyp_resume trampoline that reuses enable_secondary_cpu_mm()
to enable the data cache and MMU, switch to init_ttbr, and resume in the
runtime virtual mapping. The trampoline then restores the saved CPU
general-purpose and system-control register context.

prepare_resume_ctx() must be invoked just before the PSCI system suspend
call is issued to the platform firmware. It saves the current CPU context
and returns a non-zero value so that the caller enters the physical
SYSTEM_SUSPEND call.

On resume, hyp_resume restores the saved context, including the saved link
register. Control therefore returns to the place where prepare_resume_ctx()
was called. To avoid re-entering the suspend path, the restored path sees
prepare_resume_ctx() return zero.

The assembly save/restore code uses offsets generated by asm-offsets.c
from struct resume_cpu_context, keeping the assembly memory accesses in
sync with the C structure layout.

Support for ARM32 is not implemented. Instead, compilation fails with a
build-time error if suspend is enabled for ARM32.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v9:
- Drop the misleading prepare_resume_ctx() pointer argument and make both
  save/restore paths use the global resume_cpu_context.
- Squash the arm64 resume trampoline into the context save/restore patch.
- Document in code that hyp_resume relies on PSCI initial-state rules.
- Use generic platform firmware wording instead of ATF-specific wording.
- Rename the saved context type/storage to resume_cpu_context and rely on
  implicit zero-initialization for the file-scope object.
- Use asm-offsets.c-generated RESUME_CTX_* offsets to keep the assembly
  save/restore code in sync with struct resume_cpu_context.

Changes in v8:
- Fix alignments in code.

Changes in v7:
- No functional changes, just moved commit.
---
 xen/arch/arm/Makefile              |   1 +
 xen/arch/arm/arm64/asm-offsets.c   |  20 +++++
 xen/arch/arm/arm64/head.S          | 118 +++++++++++++++++++++++++++++
 xen/arch/arm/include/asm/suspend.h |  26 +++++++
 xen/arch/arm/suspend.c             |  14 ++++
 5 files changed, 179 insertions(+)
 create mode 100644 xen/arch/arm/suspend.c

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 982c6c396a..c97df7f3a0 100644
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
diff --git a/xen/arch/arm/arm64/asm-offsets.c b/xen/arch/arm/arm64/asm-offsets.c
index 38a3894a3b..4da5fff584 100644
--- a/xen/arch/arm/arm64/asm-offsets.c
+++ b/xen/arch/arm/arm64/asm-offsets.c
@@ -13,6 +13,7 @@
 #include <asm/mm.h>
 #include <asm/setup.h>
 #include <asm/smccc.h>
+#include <asm/suspend.h>
 
 #define DEFINE(_sym, _val)                                                 \
     asm volatile ( "\n.ascii\"==>#define " #_sym " %0 /* " #_val " */<==\""\
@@ -57,6 +58,25 @@ void __dummy__(void)
    OFFSET(INITINFO_stack, struct init_info, stack);
    BLANK();
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+   OFFSET(RESUME_CTX_X19, struct resume_cpu_context, callee_regs[0]);
+   OFFSET(RESUME_CTX_X21, struct resume_cpu_context, callee_regs[2]);
+   OFFSET(RESUME_CTX_X23, struct resume_cpu_context, callee_regs[4]);
+   OFFSET(RESUME_CTX_X25, struct resume_cpu_context, callee_regs[6]);
+   OFFSET(RESUME_CTX_X27, struct resume_cpu_context, callee_regs[8]);
+   OFFSET(RESUME_CTX_X29, struct resume_cpu_context, callee_regs[10]);
+   OFFSET(RESUME_CTX_SP, struct resume_cpu_context, sp);
+   OFFSET(RESUME_CTX_VBAR_EL2, struct resume_cpu_context, vbar_el2);
+   OFFSET(RESUME_CTX_VTCR_EL2, struct resume_cpu_context, vtcr_el2);
+   OFFSET(RESUME_CTX_VTTBR_EL2, struct resume_cpu_context, vttbr_el2);
+   OFFSET(RESUME_CTX_TPIDR_EL2, struct resume_cpu_context, tpidr_el2);
+   OFFSET(RESUME_CTX_MDCR_EL2, struct resume_cpu_context, mdcr_el2);
+   OFFSET(RESUME_CTX_HSTR_EL2, struct resume_cpu_context, hstr_el2);
+   OFFSET(RESUME_CTX_CPTR_EL2, struct resume_cpu_context, cptr_el2);
+   OFFSET(RESUME_CTX_HCR_EL2, struct resume_cpu_context, hcr_el2);
+   BLANK();
+#endif
+
    OFFSET(SMCCC_RES_a0, struct arm_smccc_res, a0);
    OFFSET(SMCCC_RES_a2, struct arm_smccc_res, a2);
    OFFSET(ARM_SMCCC_1_2_REGS_X0_OFFS, struct arm_smccc_1_2_regs, a0);
diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 72c7b24498..512a3c35b2 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -561,6 +561,124 @@ END(efi_xen_start)
 
 #endif /* CONFIG_ARM_EFI */
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+/*
+ * int prepare_resume_ctx(void)
+ *
+ * CPU context saved here will be restored on resume in hyp_resume function.
+ * prepare_resume_ctx shall return a non-zero value. Upon restoring context
+ * hyp_resume shall return value zero instead. From C code that invokes
+ * prepare_resume_ctx, the return value is interpreted to determine whether
+ * the context is saved (prepare_resume_ctx) or restored (hyp_resume).
+ */
+FUNC(prepare_resume_ctx)
+        ldr   x0, =resume_cpu_context
+
+        /* Store callee-saved registers */
+        stp   x19, x20, [x0, #RESUME_CTX_X19]
+        stp   x21, x22, [x0, #RESUME_CTX_X21]
+        stp   x23, x24, [x0, #RESUME_CTX_X23]
+        stp   x25, x26, [x0, #RESUME_CTX_X25]
+        stp   x27, x28, [x0, #RESUME_CTX_X27]
+        stp   x29, lr, [x0, #RESUME_CTX_X29]
+
+        /* Store stack-pointer */
+        mov   x2, sp
+        str   x2, [x0, #RESUME_CTX_SP]
+
+        /* Store system control registers */
+        mrs   x2, VBAR_EL2
+        str   x2, [x0, #RESUME_CTX_VBAR_EL2]
+        mrs   x2, VTCR_EL2
+        str   x2, [x0, #RESUME_CTX_VTCR_EL2]
+        mrs   x2, VTTBR_EL2
+        str   x2, [x0, #RESUME_CTX_VTTBR_EL2]
+        mrs   x2, TPIDR_EL2
+        str   x2, [x0, #RESUME_CTX_TPIDR_EL2]
+        mrs   x2, MDCR_EL2
+        str   x2, [x0, #RESUME_CTX_MDCR_EL2]
+        mrs   x2, HSTR_EL2
+        str   x2, [x0, #RESUME_CTX_HSTR_EL2]
+        mrs   x2, CPTR_EL2
+        str   x2, [x0, #RESUME_CTX_CPTR_EL2]
+        mrs   x2, HCR_EL2
+        str   x2, [x0, #RESUME_CTX_HCR_EL2]
+
+        /* prepare_resume_ctx must return a non-zero value */
+        mov   x0, #1
+        ret
+END(prepare_resume_ctx)
+
+FUNC(hyp_resume)
+        /*
+         * PSCI states that SYSTEM_SUSPEND follows the CPU_SUSPEND initial
+         * state rules, so PSCI-compliant firmware must enter the return
+         * exception level with DAIF masked.
+         */
+
+        /* Initialize the UART if earlyprintk has been enabled. */
+#ifdef CONFIG_EARLY_PRINTK
+        bl    init_uart
+#endif
+        PRINT_ID("- Xen resuming -\r\n")
+
+        bl    check_cpu_mode
+        bl    cpu_init
+
+        ldr   x0, =start
+        adr   x20, start             /* x20 := paddr (start) */
+        sub   x20, x20, x0           /* x20 := phys-offset */
+        ldr   lr, =mmu_resumed
+        b     enable_secondary_cpu_mm
+
+mmu_resumed:
+        /* Now we can access the saved context, so restore it here. */
+        ldr   x0, =resume_cpu_context
+
+        /* Restore callee-saved registers */
+        ldp   x19, x20, [x0, #RESUME_CTX_X19]
+        ldp   x21, x22, [x0, #RESUME_CTX_X21]
+        ldp   x23, x24, [x0, #RESUME_CTX_X23]
+        ldp   x25, x26, [x0, #RESUME_CTX_X25]
+        ldp   x27, x28, [x0, #RESUME_CTX_X27]
+        ldp   x29, lr, [x0, #RESUME_CTX_X29]
+
+        /* Restore stack pointer */
+        ldr   x2, [x0, #RESUME_CTX_SP]
+        mov   sp, x2
+
+        /* Restore system control registers */
+        ldr   x2, [x0, #RESUME_CTX_VBAR_EL2]
+        msr   VBAR_EL2, x2
+        ldr   x2, [x0, #RESUME_CTX_VTCR_EL2]
+        msr   VTCR_EL2, x2
+        ldr   x2, [x0, #RESUME_CTX_VTTBR_EL2]
+        msr   VTTBR_EL2, x2
+        ldr   x2, [x0, #RESUME_CTX_TPIDR_EL2]
+        msr   TPIDR_EL2, x2
+        ldr   x2, [x0, #RESUME_CTX_MDCR_EL2]
+        msr   MDCR_EL2, x2
+        ldr   x2, [x0, #RESUME_CTX_HSTR_EL2]
+        msr   HSTR_EL2, x2
+        ldr   x2, [x0, #RESUME_CTX_CPTR_EL2]
+        msr   CPTR_EL2, x2
+        ldr   x2, [x0, #RESUME_CTX_HCR_EL2]
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
+END(hyp_resume)
+
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 /*
  * Local variables:
  * mode: ASM
diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/asm/suspend.h
index 31a98a1f1b..2d9fc331fc 100644
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
+struct resume_cpu_context {
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
+#error "Define resume_cpu_context structure for arm32"
+#endif
+
+extern struct resume_cpu_context resume_cpu_context;
+
+int prepare_resume_ctx(void);
+void hyp_resume(void);
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 #endif /* ARM_SUSPEND_H */
 
 /*
diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
new file mode 100644
index 0000000000..6ea4a0f9cc
--- /dev/null
+++ b/xen/arch/arm/suspend.c
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <asm/suspend.h>
+
+struct resume_cpu_context resume_cpu_context;
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


