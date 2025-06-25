Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD07CAE80B3
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 13:14:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024738.1400571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUO5J-0008Nq-8d; Wed, 25 Jun 2025 11:14:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024738.1400571; Wed, 25 Jun 2025 11:14:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUO5J-0008LJ-59; Wed, 25 Jun 2025 11:14:33 +0000
Received: by outflank-mailman (input) for mailman id 1024738;
 Wed, 25 Jun 2025 11:14:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XgUS=ZI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uUO5H-0008L5-FG
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 11:14:31 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8fe1ade2-51b5-11f0-b894-0df219b8e170;
 Wed, 25 Jun 2025 13:14:29 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BB4481F745;
 Wed, 25 Jun 2025 11:14:28 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8FE0813485;
 Wed, 25 Jun 2025 11:14:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id R/yKIRTaW2ifVQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 25 Jun 2025 11:14:28 +0000
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
X-Inumbo-ID: 8fe1ade2-51b5-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750850068; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ebTJSN+LRFMkpgZ0N6d3le5nJ7MpmpJZsubaFSuJRag=;
	b=D9TwRjBkclcK5xmNz6NRX0gdmQzTVySghGcZCgKarn3hCmgFt4kimnMDF+KmD0PsxjzPbA
	WnRndf2/p2gCjL3aQIYiqVmbGnGEbsmppltvw2bgI7aFcuM3dbCOcSqftLUNVCPMDu/lI6
	Cv+ko23dK0QYgh9WgbjIk3YdMFuXVaA=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=D9TwRjBk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750850068; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ebTJSN+LRFMkpgZ0N6d3le5nJ7MpmpJZsubaFSuJRag=;
	b=D9TwRjBkclcK5xmNz6NRX0gdmQzTVySghGcZCgKarn3hCmgFt4kimnMDF+KmD0PsxjzPbA
	WnRndf2/p2gCjL3aQIYiqVmbGnGEbsmppltvw2bgI7aFcuM3dbCOcSqftLUNVCPMDu/lI6
	Cv+ko23dK0QYgh9WgbjIk3YdMFuXVaA=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH] x86/pv: fix breakage of grub-pv build
Date: Wed, 25 Jun 2025 13:14:26 +0200
Message-ID: <20250625111426.25321-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: BB4481F745
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.01

grub-pv is relying on start_info being defined, so provide a definition
which can be used.

Fixes: d669a312b2b2 ("x86/pv: remove global start_info")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/setup.c     | 1 +
 include/hypervisor.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/x86/setup.c b/arch/x86/setup.c
index b3fc835a..ed28d940 100644
--- a/arch/x86/setup.c
+++ b/arch/x86/setup.c
@@ -67,6 +67,7 @@ static inline void sse_init(void) {
  * This pointer holds a reference to the start_info struct.
  */
 start_info_t *start_info_ptr;
+EXPORT_SYMBOL(start_info_ptr);
 
 #define hpc_init()
 
diff --git a/include/hypervisor.h b/include/hypervisor.h
index f40bc8c3..d199f039 100644
--- a/include/hypervisor.h
+++ b/include/hypervisor.h
@@ -30,6 +30,8 @@
 #ifdef CONFIG_PARAVIRT
 /* A pointer to the start of day information passed up from the hypervisor. */
 extern start_info_t *start_info_ptr;
+
+#define start_info (*start_info_ptr)
 #else
 int hvm_get_parameter(int idx, uint64_t *value);
 int hvm_set_parameter(int idx, uint64_t value);
-- 
2.43.0


