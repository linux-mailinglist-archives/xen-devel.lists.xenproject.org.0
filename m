Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D620E66C258
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 15:38:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478650.742011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHQcc-0003uN-JU; Mon, 16 Jan 2023 14:38:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478650.742011; Mon, 16 Jan 2023 14:38:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHQcc-0003kj-B8; Mon, 16 Jan 2023 14:38:02 +0000
Received: by outflank-mailman (input) for mailman id 478650;
 Mon, 16 Jan 2023 14:38:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jLMM=5N=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1pHQca-0002Pl-Ex
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 14:38:00 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f9efc28-95ab-11ed-91b6-6bf2151ebd3b;
 Mon, 16 Jan 2023 15:37:59 +0100 (CET)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pHQcT-008oZ5-S7; Mon, 16 Jan 2023 14:37:54 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E59A8300C0C;
 Mon, 16 Jan 2023 15:37:38 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
 id ADBD820B75F3D; Mon, 16 Jan 2023 15:37:38 +0100 (CET)
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
X-Inumbo-ID: 5f9efc28-95ab-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=rHjspetb6Sj1qMw4IETTuTuaCFumb5EYx3riiNCTYv8=; b=cxz2ZJ+y57FVH0axH7GJ3/SDvk
	SfIli5aMNXUCBqSZ5s0hpQ541ETtZeXdeKeGN56Ebrzzk0C4N9eLXGVlRGHVrQ5JzV49oWAUTb+Qe
	Kn4rI0WMLi8kkdccgmv96vW1qIQzU99aMQ1+XNeo6itRotmYQ0j8+xlhlEUBQ0ztiZvuG2cxAChr6
	22QxIhtpXZ6ZvAkrMLo5HT7ZYfsHVWzIJ2yKMB5H3w81SPg3IvAOF/XqgpTenKxT3AR/Anre1jbBa
	5T4FbzmfMt67wCGdvro8HFHivVFFtpRbdX2x3wnviudr35z2uOGNZgbxfcNisa/ZFz7Fzu5vDAznP
	UN6EINCw==;
Message-ID: <20230116143645.589522290@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 16 Jan 2023 15:25:34 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: x86@kernel.org,
 Joan Bruguera <joanbrugueram@gmail.com>
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org,
 Juergen Gross <jgross@suse.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Kees Cook <keescook@chromium.org>,
 mark.rutland@arm.com,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 =?UTF-8?q?J=C3=B6rg=20R=C3=B6del?= <joro@8bytes.org>,
 "H. Peter Anvin" <hpa@zytor.com>,
 jroedel@suse.de
Subject: [PATCH v2 1/7] x86/boot: Remove verify_cpu() from secondary_startup_64()
References: <20230116142533.905102512@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

The boot trampolines from trampoline_64.S have code flow like:

  16bit BIOS			SEV-ES				64bit EFI

  trampoline_start()		sev_es_trampoline_start()	trampoline_start_64()
    verify_cpu()			  |				|
  switch_to_protected:    <---------------'				v
       |							pa_trampoline_compat()
       v								|
  startup_32()		<-----------------------------------------------'
       |
       v
  startup_64()
       |
       v
  tr_start() := head_64.S:secondary_startup_64()

Since AP bringup always goes through the 16bit BIOS path (EFI doesn't
touch the APs), there is already a verify_cpu() invocation.

Removing the verify_cpu() invocation from secondary_startup_64()
renders the whole secondary_startup_64_no_verify() thing moot, so
remove that too.

Cc: jroedel@suse.de
Cc: hpa@zytor.com
Fixes: e81dc127ef69 ("x86/callthunks: Add call patching for call depth tracking")
Reported-by: Joan Bruguera <joanbrugueram@gmail.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/x86/include/asm/realmode.h |    1 -
 arch/x86/kernel/head_64.S       |   16 ----------------
 arch/x86/realmode/init.c        |    6 ------
 3 files changed, 23 deletions(-)

--- a/arch/x86/include/asm/realmode.h
+++ b/arch/x86/include/asm/realmode.h
@@ -73,7 +73,6 @@ extern unsigned char startup_32_smp[];
 extern unsigned char boot_gdt[];
 #else
 extern unsigned char secondary_startup_64[];
-extern unsigned char secondary_startup_64_no_verify[];
 #endif
 
 static inline size_t real_mode_size_needed(void)
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -143,22 +143,6 @@ SYM_CODE_START(secondary_startup_64)
 	 * after the boot processor executes this code.
 	 */
 
-	/* Sanitize CPU configuration */
-	call verify_cpu
-
-	/*
-	 * The secondary_startup_64_no_verify entry point is only used by
-	 * SEV-ES guests. In those guests the call to verify_cpu() would cause
-	 * #VC exceptions which can not be handled at this stage of secondary
-	 * CPU bringup.
-	 *
-	 * All non SEV-ES systems, especially Intel systems, need to execute
-	 * verify_cpu() above to make sure NX is enabled.
-	 */
-SYM_INNER_LABEL(secondary_startup_64_no_verify, SYM_L_GLOBAL)
-	UNWIND_HINT_EMPTY
-	ANNOTATE_NOENDBR
-
 	/*
 	 * Retrieve the modifier (SME encryption mask if SME is active) to be
 	 * added to the initial pgdir entry that will be programmed into CR3.
--- a/arch/x86/realmode/init.c
+++ b/arch/x86/realmode/init.c
@@ -74,12 +74,6 @@ static void __init sme_sev_setup_real_mo
 		th->flags |= TH_FLAGS_SME_ACTIVE;
 
 	if (cc_platform_has(CC_ATTR_GUEST_STATE_ENCRYPT)) {
-		/*
-		 * Skip the call to verify_cpu() in secondary_startup_64 as it
-		 * will cause #VC exceptions when the AP can't handle them yet.
-		 */
-		th->start = (u64) secondary_startup_64_no_verify;
-
 		if (sev_es_setup_ap_jump_table(real_mode_header))
 			panic("Failed to get/update SEV-ES AP Jump Table");
 	}



