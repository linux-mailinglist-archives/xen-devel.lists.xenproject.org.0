Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B082BA975
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 12:46:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31988.62825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg4s8-00048x-Hj; Fri, 20 Nov 2020 11:46:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31988.62825; Fri, 20 Nov 2020 11:46:36 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg4s8-00048Y-EH; Fri, 20 Nov 2020 11:46:36 +0000
Received: by outflank-mailman (input) for mailman id 31988;
 Fri, 20 Nov 2020 11:46:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wRTa=E2=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kg4s7-00048T-8j
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 11:46:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a5e82017-5a27-4552-a6f1-80ff2084a9d8;
 Fri, 20 Nov 2020 11:46:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 92093ACB0;
 Fri, 20 Nov 2020 11:46:33 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=wRTa=E2=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kg4s7-00048T-8j
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 11:46:35 +0000
X-Inumbo-ID: a5e82017-5a27-4552-a6f1-80ff2084a9d8
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a5e82017-5a27-4552-a6f1-80ff2084a9d8;
	Fri, 20 Nov 2020 11:46:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605872793; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l/t/KHjCWXTPuvdOLof5qOkkQcBYZ5SnwZcODN8IUSA=;
	b=mUXTjK/RfpfB8qehe6baicIMnV1N6l1JWvONIHMdA/X+9o7SA97Orrl+x8nPSwZ1upvNM5
	37fX3mBrO5Ue+Qohc+WRIPluXUtMEIu7HjQQSTOSSjf1G6qiYL3EhJuxJS6auzL27F1TNM
	J5wWI7i+mQocaeKgcKsotzSzfd4F9Qs=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 92093ACB0;
	Fri, 20 Nov 2020 11:46:33 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: peterz@infradead.org,
	luto@kernel.org,
	Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 01/12] x86/xen: use specific Xen pv interrupt entry for MCE
Date: Fri, 20 Nov 2020 12:46:19 +0100
Message-Id: <20201120114630.13552-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201120114630.13552-1-jgross@suse.com>
References: <20201120114630.13552-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xen PV guests don't use IST. For machine check interrupts switch to
the same model as debug interrupts.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/x86/include/asm/idtentry.h |  3 +++
 arch/x86/xen/enlighten_pv.c     | 16 +++++++++++++++-
 arch/x86/xen/xen-asm.S          |  2 +-
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/idtentry.h b/arch/x86/include/asm/idtentry.h
index b2442eb0ac2f..3505c0396fa5 100644
--- a/arch/x86/include/asm/idtentry.h
+++ b/arch/x86/include/asm/idtentry.h
@@ -588,6 +588,9 @@ DECLARE_IDTENTRY_MCE(X86_TRAP_MC,	exc_machine_check);
 #else
 DECLARE_IDTENTRY_RAW(X86_TRAP_MC,	exc_machine_check);
 #endif
+#ifdef CONFIG_XEN_PV
+DECLARE_IDTENTRY_RAW(X86_TRAP_MC,	xenpv_exc_machine_check);
+#endif
 #endif
 
 /* NMI */
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 4409306364dc..9f5e44c1f70a 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -583,6 +583,20 @@ DEFINE_IDTENTRY_RAW(xenpv_exc_debug)
 		exc_debug(regs);
 }
 
+#ifdef CONFIG_X86_MCE
+DEFINE_IDTENTRY_RAW(xenpv_exc_machine_check)
+{
+	/*
+	 * There's no IST on Xen PV, but we still need to dispatch
+	 * to the correct handler.
+	 */
+	if (user_mode(regs))
+		noist_exc_machine_check(regs);
+	else
+		exc_machine_check(regs);
+}
+#endif
+
 struct trap_array_entry {
 	void (*orig)(void);
 	void (*xen)(void);
@@ -603,7 +617,7 @@ static struct trap_array_entry trap_array[] = {
 	TRAP_ENTRY_REDIR(exc_debug,			true  ),
 	TRAP_ENTRY(exc_double_fault,			true  ),
 #ifdef CONFIG_X86_MCE
-	TRAP_ENTRY(exc_machine_check,			true  ),
+	TRAP_ENTRY_REDIR(exc_machine_check,		true  ),
 #endif
 	TRAP_ENTRY_REDIR(exc_nmi,			true  ),
 	TRAP_ENTRY(exc_int3,				false ),
diff --git a/arch/x86/xen/xen-asm.S b/arch/x86/xen/xen-asm.S
index 1cb0e84b9161..bc2586730a5b 100644
--- a/arch/x86/xen/xen-asm.S
+++ b/arch/x86/xen/xen-asm.S
@@ -172,7 +172,7 @@ xen_pv_trap asm_exc_spurious_interrupt_bug
 xen_pv_trap asm_exc_coprocessor_error
 xen_pv_trap asm_exc_alignment_check
 #ifdef CONFIG_X86_MCE
-xen_pv_trap asm_exc_machine_check
+xen_pv_trap asm_xenpv_exc_machine_check
 #endif /* CONFIG_X86_MCE */
 xen_pv_trap asm_exc_simd_coprocessor_error
 #ifdef CONFIG_IA32_EMULATION
-- 
2.26.2


