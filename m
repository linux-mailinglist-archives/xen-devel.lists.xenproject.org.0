Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7C6A28632
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2025 10:11:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881978.1292151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfbRK-0007gj-JN; Wed, 05 Feb 2025 09:11:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881978.1292151; Wed, 05 Feb 2025 09:11:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfbRK-0007ed-GF; Wed, 05 Feb 2025 09:11:22 +0000
Received: by outflank-mailman (input) for mailman id 881978;
 Wed, 05 Feb 2025 09:11:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j99B=U4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tfbRJ-0007L1-4I
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2025 09:11:21 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 295dd878-e3a1-11ef-99a4-01e77a169b0f;
 Wed, 05 Feb 2025 10:11:19 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1FD0621199;
 Wed,  5 Feb 2025 09:11:19 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B5655139D8;
 Wed,  5 Feb 2025 09:11:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8R3kKjYro2eCKQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 05 Feb 2025 09:11:18 +0000
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
X-Inumbo-ID: 295dd878-e3a1-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1738746679; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=55+l40Za75lk0fPEB2LTeFAhFpiQCHhTL5YwgTfyczY=;
	b=IZwBATMeX55nT9G+T8PGoVmQExK0tM9bfcgDoWXy+q+4HbdqxUC4nVhkShIdWq0PiaBKiE
	QUsVJgWrUYGr/cBxL8gnPTrBn0uPoaApRCNvgrLGSvTbdFu2H6MfikMXGhrlHQa1pdQQ2E
	lcq1dxyobTP4dRui4qMWodc9go7PfsA=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=IZwBATMe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1738746679; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=55+l40Za75lk0fPEB2LTeFAhFpiQCHhTL5YwgTfyczY=;
	b=IZwBATMeX55nT9G+T8PGoVmQExK0tM9bfcgDoWXy+q+4HbdqxUC4nVhkShIdWq0PiaBKiE
	QUsVJgWrUYGr/cBxL8gnPTrBn0uPoaApRCNvgrLGSvTbdFu2H6MfikMXGhrlHQa1pdQQ2E
	lcq1dxyobTP4dRui4qMWodc9go7PfsA=
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
	xen-devel@lists.xenproject.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] x86/xen: add FRAME_END to xen_hypercall_hvm()
Date: Wed,  5 Feb 2025 10:11:15 +0100
Message-ID: <20250205091115.17844-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1FD0621199
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

xen_hypercall_hvm() is missing a FRAME_END at the end, add it.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202502030848.HTNTTuo9-lkp@intel.com/
Fixes: b4845bb63838 ("x86/xen: add central hypercall functions")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/xen-head.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/xen/xen-head.S b/arch/x86/xen/xen-head.S
index 4378b817ed32..0254d010a987 100644
--- a/arch/x86/xen/xen-head.S
+++ b/arch/x86/xen/xen-head.S
@@ -131,6 +131,7 @@ SYM_FUNC_START(xen_hypercall_hvm)
 	pop %rcx
 	pop %rax
 #endif
+	FRAME_END
 	/* Use correct hypercall function. */
 	jz xen_hypercall_amd
 	jmp xen_hypercall_intel
-- 
2.43.0


