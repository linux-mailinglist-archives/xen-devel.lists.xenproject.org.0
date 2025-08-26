Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 900E6B36C75
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 16:56:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094720.1449977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqv5y-0005tz-Lx; Tue, 26 Aug 2025 14:56:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094720.1449977; Tue, 26 Aug 2025 14:56:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqv5y-0005ql-Id; Tue, 26 Aug 2025 14:56:22 +0000
Received: by outflank-mailman (input) for mailman id 1094720;
 Tue, 26 Aug 2025 14:56:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HJCJ=3G=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uqv5w-0005bn-VB
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 14:56:20 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2cffae3-828c-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 16:56:19 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AB2EC1F794;
 Tue, 26 Aug 2025 14:56:16 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5523913A31;
 Tue, 26 Aug 2025 14:56:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id OwNEExDLrWi1TwAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 26 Aug 2025 14:56:16 +0000
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
X-Inumbo-ID: d2cffae3-828c-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1756220176; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OyeT+CWQEc6295XsX5Lhn3JbFSy/Dq6+JVixulzziEY=;
	b=SZVpr0NuEHu/33dqsD11Ya+/DUFraXt930BOxCXygh0FsoMbrfaVapmM2I5IT7ImOPRgP5
	hLvC4UitgxiByj5gu1tK/+GMG5JVlVrU79e4gCkTrlDgSwhe5NdNv2X4ygz1KdsgKDFfeB
	8XArM3bblCxJ29aBNZXk42wKvtET/YI=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1756220176; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OyeT+CWQEc6295XsX5Lhn3JbFSy/Dq6+JVixulzziEY=;
	b=SZVpr0NuEHu/33dqsD11Ya+/DUFraXt930BOxCXygh0FsoMbrfaVapmM2I5IT7ImOPRgP5
	hLvC4UitgxiByj5gu1tK/+GMG5JVlVrU79e4gCkTrlDgSwhe5NdNv2X4ygz1KdsgKDFfeB
	8XArM3bblCxJ29aBNZXk42wKvtET/YI=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 1/3] xen: rework xen_pv_domain()
Date: Tue, 26 Aug 2025 16:56:06 +0200
Message-ID: <20250826145608.10352-2-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250826145608.10352-1-jgross@suse.com>
References: <20250826145608.10352-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email,suse.com:mid];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -6.80

Rework xen_pv_domain() to no longer use the xen_domain_type variable,
but the artificial X86_FEATURE_XENPV cpu feature.

On non-x86 architectures xen_pv_domain() can be defined as "0".

This has the advantage that a kernel not built with CONFIG_XEN_PV
will be smaller due to dead code elimination.

Set the X86_FEATURE_XENPV feature very early, as xen_pv_domain() is
used rather early, too.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/enlighten_pv.c | 2 +-
 include/xen/xen.h           | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 26bbaf4b7330..4806cc28d7ca 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -382,7 +382,6 @@ static bool __init xen_check_xsave(void)
 
 static void __init xen_init_capabilities(void)
 {
-	setup_force_cpu_cap(X86_FEATURE_XENPV);
 	setup_clear_cpu_cap(X86_FEATURE_DCA);
 	setup_clear_cpu_cap(X86_FEATURE_APERFMPERF);
 	setup_clear_cpu_cap(X86_FEATURE_MTRR);
@@ -1402,6 +1401,7 @@ asmlinkage __visible void __init xen_start_kernel(struct start_info *si)
 			JMP32_INSN_SIZE);
 
 	xen_domain_type = XEN_PV_DOMAIN;
+	setup_force_cpu_cap(X86_FEATURE_XENPV);
 	xen_start_flags = xen_start_info->flags;
 	/* Interrupts are guaranteed to be off initially. */
 	early_boot_irqs_disabled = true;
diff --git a/include/xen/xen.h b/include/xen/xen.h
index a1e5b3f18d69..61854e3f2837 100644
--- a/include/xen/xen.h
+++ b/include/xen/xen.h
@@ -22,8 +22,15 @@ extern bool xen_pvh;
 #define xen_pvh			0
 #endif
 
+#ifdef CONFIG_X86
+#include <asm/cpufeature.h>
+
+#define xen_pv_domain()		(cpu_feature_enabled(X86_FEATURE_XENPV))
+#else
+#define xen_pv_domain()		0
+#endif
+
 #define xen_domain()		(xen_domain_type != XEN_NATIVE)
-#define xen_pv_domain()		(xen_domain_type == XEN_PV_DOMAIN)
 #define xen_hvm_domain()	(xen_domain_type == XEN_HVM_DOMAIN)
 #define xen_pvh_domain()	(xen_pvh)
 
-- 
2.43.0


