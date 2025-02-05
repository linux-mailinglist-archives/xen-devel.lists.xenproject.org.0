Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 194FAA28630
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2025 10:11:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881977.1292142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfbR5-0007NQ-B0; Wed, 05 Feb 2025 09:11:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881977.1292142; Wed, 05 Feb 2025 09:11:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfbR5-0007L7-7l; Wed, 05 Feb 2025 09:11:07 +0000
Received: by outflank-mailman (input) for mailman id 881977;
 Wed, 05 Feb 2025 09:11:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j99B=U4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tfbR4-0007L1-Jl
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2025 09:11:06 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f2ab3bf-e3a1-11ef-99a4-01e77a169b0f;
 Wed, 05 Feb 2025 10:11:02 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 03B2E1F455;
 Wed,  5 Feb 2025 09:11:02 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A659F139D8;
 Wed,  5 Feb 2025 09:11:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id D+IfJyUro2d0KQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 05 Feb 2025 09:11:01 +0000
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
X-Inumbo-ID: 1f2ab3bf-e3a1-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1738746662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=1qMmRxVIPypI1xC815rIwVGXXjNCPAkK8hThn5/x/rA=;
	b=LOERfISb+g25ZuGhv73mD20GA7oXGW6Pb6C6xSeDCVvwkKVIQ4aNPmcL1c50pzqmvEi65y
	Bt+BtBeetKB9dNEYTvHbdiMROa69F0k4e3GowabU0jMsGFNev/CWFZYRyJEkVG4NHV0YRU
	2zCuPsgBj/orpvmGacjPYAAPANMsfLs=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1738746662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=1qMmRxVIPypI1xC815rIwVGXXjNCPAkK8hThn5/x/rA=;
	b=LOERfISb+g25ZuGhv73mD20GA7oXGW6Pb6C6xSeDCVvwkKVIQ4aNPmcL1c50pzqmvEi65y
	Bt+BtBeetKB9dNEYTvHbdiMROa69F0k4e3GowabU0jMsGFNev/CWFZYRyJEkVG4NHV0YRU
	2zCuPsgBj/orpvmGacjPYAAPANMsfLs=
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
	xen-devel@lists.xenproject.org
Subject: [PATCH] x86/xen: fix xen_hypercall_hvm() to not clobber %rbx
Date: Wed,  5 Feb 2025 10:10:56 +0100
Message-ID: <20250205091056.17796-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

xen_hypercall_hvm(), which is used when running as a Xen PVH guest at
most only once during early boot, is clobbering %rbx. Depending on
whether the caller relies on %rbx to be preserved across the call or
not, this clobbering might result in an early crash of the system.

This can be avoided by not modifying %rbx in xen_hypercall_hvm().

Fixes: b4845bb63838 ("x86/xen: add central hypercall functions")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/xen-head.S | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/x86/xen/xen-head.S b/arch/x86/xen/xen-head.S
index 9252652afe59..4378b817ed32 100644
--- a/arch/x86/xen/xen-head.S
+++ b/arch/x86/xen/xen-head.S
@@ -117,8 +117,7 @@ SYM_FUNC_START(xen_hypercall_hvm)
 	pop %ebx
 	pop %eax
 #else
-	lea xen_hypercall_amd(%rip), %rbx
-	cmp %rax, %rbx
+	cmp xen_hypercall_amd(%rip), %rax
 #ifdef CONFIG_FRAME_POINTER
 	pop %rax	/* Dummy pop. */
 #endif
-- 
2.43.0


