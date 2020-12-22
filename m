Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F702DCE58
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 10:32:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55776.97225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kppdb-0006ZM-UE; Thu, 17 Dec 2020 09:31:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55776.97225; Thu, 17 Dec 2020 09:31:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kppdb-0006YI-Pj; Thu, 17 Dec 2020 09:31:55 +0000
Received: by outflank-mailman (input) for mailman id 55776;
 Thu, 17 Dec 2020 09:31:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gjir=FV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kppdZ-0006RQ-U1
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 09:31:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d7e3094e-7f00-4912-b097-4a068f2a9ff6;
 Thu, 17 Dec 2020 09:31:47 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 31C95AF68;
 Thu, 17 Dec 2020 09:31:46 +0000 (UTC)
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
X-Inumbo-ID: d7e3094e-7f00-4912-b097-4a068f2a9ff6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608197506; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sHlV/W1YFbgt7ZvBN6riN3ibxVfg2lJ3Lv2QWPteOwQ=;
	b=aCNZ52DNsGKEPUfQUQ8t1aBQp1M8U5RMwBKcreHecPni3WpfYrIU/UZIPnclCUTzeUgua/
	8fn4E8VJvoE3+ZFjWNhNgBOjsMRnh6j8awKUr574LcIJFCBDqxtP8kguiVgXmEfMyoVsiy
	psxAUComfKsTH2Qhw526GmJdB4iYHmU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH v3 02/15] x86/xen: use specific Xen pv interrupt entry for DF
Date: Thu, 17 Dec 2020 10:31:20 +0100
Message-Id: <20201217093133.1507-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201217093133.1507-1-jgross@suse.com>
References: <20201217093133.1507-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xen PV guests don't use IST. For double fault interrupts switch to
the same model as NMI.

Correct a typo in a comment while copying it.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
---
V2:
- fix typo (Andy Lutomirski)
---
 arch/x86/include/asm/idtentry.h |  3 +++
 arch/x86/xen/enlighten_pv.c     | 10 ++++++++--
 arch/x86/xen/xen-asm.S          |  2 +-
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/x86/include/asm/idtentry.h b/arch/x86/include/asm/idtentry.h
index 5dd64404715a..3ac84cb702fc 100644
--- a/arch/x86/include/asm/idtentry.h
+++ b/arch/x86/include/asm/idtentry.h
@@ -608,6 +608,9 @@ DECLARE_IDTENTRY_RAW(X86_TRAP_DB,	xenpv_exc_debug);
 
 /* #DF */
 DECLARE_IDTENTRY_DF(X86_TRAP_DF,	exc_double_fault);
+#ifdef CONFIG_XEN_PV
+DECLARE_IDTENTRY_RAW_ERRORCODE(X86_TRAP_DF,	xenpv_exc_double_fault);
+#endif
 
 /* #VC */
 #ifdef CONFIG_AMD_MEM_ENCRYPT
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 9f5e44c1f70a..76616024129e 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -567,10 +567,16 @@ void noist_exc_debug(struct pt_regs *regs);
 
 DEFINE_IDTENTRY_RAW(xenpv_exc_nmi)
 {
-	/* On Xen PV, NMI doesn't use IST.  The C part is the sane as native. */
+	/* On Xen PV, NMI doesn't use IST.  The C part is the same as native. */
 	exc_nmi(regs);
 }
 
+DEFINE_IDTENTRY_RAW_ERRORCODE(xenpv_exc_double_fault)
+{
+	/* On Xen PV, DF doesn't use IST.  The C part is the same as native. */
+	exc_double_fault(regs, error_code);
+}
+
 DEFINE_IDTENTRY_RAW(xenpv_exc_debug)
 {
 	/*
@@ -615,7 +621,7 @@ struct trap_array_entry {
 
 static struct trap_array_entry trap_array[] = {
 	TRAP_ENTRY_REDIR(exc_debug,			true  ),
-	TRAP_ENTRY(exc_double_fault,			true  ),
+	TRAP_ENTRY_REDIR(exc_double_fault,		true  ),
 #ifdef CONFIG_X86_MCE
 	TRAP_ENTRY_REDIR(exc_machine_check,		true  ),
 #endif
diff --git a/arch/x86/xen/xen-asm.S b/arch/x86/xen/xen-asm.S
index bc2586730a5b..1d054c915046 100644
--- a/arch/x86/xen/xen-asm.S
+++ b/arch/x86/xen/xen-asm.S
@@ -161,7 +161,7 @@ xen_pv_trap asm_exc_overflow
 xen_pv_trap asm_exc_bounds
 xen_pv_trap asm_exc_invalid_op
 xen_pv_trap asm_exc_device_not_available
-xen_pv_trap asm_exc_double_fault
+xen_pv_trap asm_xenpv_exc_double_fault
 xen_pv_trap asm_exc_coproc_segment_overrun
 xen_pv_trap asm_exc_invalid_tss
 xen_pv_trap asm_exc_segment_not_present
-- 
2.26.2


