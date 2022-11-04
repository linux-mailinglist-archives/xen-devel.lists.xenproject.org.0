Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5866191E3
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 08:27:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437314.691624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqr6q-0000Zi-7F; Fri, 04 Nov 2022 07:27:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437314.691624; Fri, 04 Nov 2022 07:27:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqr6q-0000X2-3I; Fri, 04 Nov 2022 07:27:24 +0000
Received: by outflank-mailman (input) for mailman id 437314;
 Fri, 04 Nov 2022 07:27:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0BBJ=3E=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oqr6o-0008IY-33
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 07:27:22 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e9fd6f3-5c12-11ed-8fd0-01056ac49cbb;
 Fri, 04 Nov 2022 08:27:21 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0D699218EF;
 Fri,  4 Nov 2022 07:27:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BE74F1346F;
 Fri,  4 Nov 2022 07:27:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wt8nLdi+ZGP8QAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 04 Nov 2022 07:27:20 +0000
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
X-Inumbo-ID: 1e9fd6f3-5c12-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667546841; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZIOvMf0VCiOOdx+pSynOR3iuEcnpBNHWVTTFgfhwJA0=;
	b=EnjxfVY16idoJh9IIy4JkGsUyUCXsUVwU0w51egCCLg5DyQj3J7jxrbkA4rfngpNO2Pwv9
	wov57FtNfpnF/SBFt652DKi5Xmswq2R3f0Y6Q5BJrjFYmZf8ZvCWawW+KwYgwKKIJlgZd1
	wTqlkt/BxLqs95Vk1s+327B34/LytLo=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v2 3/5] x86: drop 32-bit Xen PV guest code in update_task_stack()
Date: Fri,  4 Nov 2022 08:26:59 +0100
Message-Id: <20221104072701.20283-4-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221104072701.20283-1-jgross@suse.com>
References: <20221104072701.20283-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Testing for Xen PV guest mode in a 32-bit only code section can be
dropped, as Xen PV guests are supported in 64-bit mode only.

While at it switch from boot_cpu_has() to cpu_feature_enabled() in the
64-bit part of the code.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/switch_to.h | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/switch_to.h b/arch/x86/include/asm/switch_to.h
index c08eb0fdd11f..5c91305d09d2 100644
--- a/arch/x86/include/asm/switch_to.h
+++ b/arch/x86/include/asm/switch_to.h
@@ -66,13 +66,10 @@ static inline void update_task_stack(struct task_struct *task)
 {
 	/* sp0 always points to the entry trampoline stack, which is constant: */
 #ifdef CONFIG_X86_32
-	if (static_cpu_has(X86_FEATURE_XENPV))
-		load_sp0(task->thread.sp0);
-	else
-		this_cpu_write(cpu_tss_rw.x86_tss.sp1, task->thread.sp0);
+	this_cpu_write(cpu_tss_rw.x86_tss.sp1, task->thread.sp0);
 #else
 	/* Xen PV enters the kernel on the thread stack. */
-	if (static_cpu_has(X86_FEATURE_XENPV))
+	if (cpu_feature_enabled(X86_FEATURE_XENPV))
 		load_sp0(task_top_of_stack(task));
 #endif
 }
-- 
2.35.3


