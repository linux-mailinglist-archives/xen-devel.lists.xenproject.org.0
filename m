Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D998793916D
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 17:09:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762184.1172308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVuei-0004dn-Dl; Mon, 22 Jul 2024 15:08:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762184.1172308; Mon, 22 Jul 2024 15:08:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVuei-0004b8-BA; Mon, 22 Jul 2024 15:08:52 +0000
Received: by outflank-mailman (input) for mailman id 762184;
 Mon, 22 Jul 2024 15:08:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JAiy=OW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sVueg-0004ZE-Mz
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 15:08:50 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b3685f9-483c-11ef-8776-851b0ebba9a2;
 Mon, 22 Jul 2024 17:08:47 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 439301F8D4;
 Mon, 22 Jul 2024 15:08:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 07F68136A9;
 Mon, 22 Jul 2024 15:08:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id BCNvAP51nmaOWAAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 22 Jul 2024 15:08:46 +0000
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
X-Inumbo-ID: 4b3685f9-483c-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1721660926; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=RpkEMa1JSkMWC23Fdqu7c4oTDk4EMFdNp4g2Q+Fetic=;
	b=fwUrGDDlXllR3vP4sUh+N5d5eC2PcGImuUJy2LZYYGexcwSug3ZhHgpZih/KdGV+ct297K
	mHkfKvPmET2CTzK85Jx8z2QXETNkamtpJI3avuHmILIHOFapcjxpACKe3eKTE56G4GT8U2
	RBsmQztXwcMj+VzudL25EqgdRJe3diU=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=fwUrGDDl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1721660926; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=RpkEMa1JSkMWC23Fdqu7c4oTDk4EMFdNp4g2Q+Fetic=;
	b=fwUrGDDlXllR3vP4sUh+N5d5eC2PcGImuUJy2LZYYGexcwSug3ZhHgpZih/KdGV+ct297K
	mHkfKvPmET2CTzK85Jx8z2QXETNkamtpJI3avuHmILIHOFapcjxpACKe3eKTE56G4GT8U2
	RBsmQztXwcMj+VzudL25EqgdRJe3diU=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] mini-os: mm: don't have two large arrays of the same kind
Date: Mon, 22 Jul 2024 17:08:43 +0200
Message-ID: <20240722150843.3947-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.19 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email]
X-Spam-Level: 
X-Rspamd-Queue-Id: 439301F8D4
X-Spam-Score: 0.19
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Bar: /

In the CONFIG_PARAVIRT case there are two identical static arrays of
more than 8kB size with function scope. As the two functions never
nest, a single array of file scope can replace the two existing
instances.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/mm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/x86/mm.c b/arch/x86/mm.c
index be1cf0cf..7ddf16e4 100644
--- a/arch/x86/mm.c
+++ b/arch/x86/mm.c
@@ -198,6 +198,10 @@ static void new_pt_frame(unsigned long *pt_pfn, unsigned long prev_l_mfn,
     *pt_pfn += 1;
 }
 
+#ifdef CONFIG_PARAVIRT
+static mmu_update_t mmu_updates[L1_PAGETABLE_ENTRIES + 1];
+#endif
+
 /*
  * Build the initial pagetable.
  */
@@ -209,7 +213,6 @@ static void build_pagetable(unsigned long *start_pfn, unsigned long *max_pfn)
     unsigned long pt_mfn = pfn_to_mfn(virt_to_pfn(pt_base));
     unsigned long offset;
 #ifdef CONFIG_PARAVIRT
-    static mmu_update_t mmu_updates[L1_PAGETABLE_ENTRIES + 1];
     int count = 0;
     int rc;
 #endif
@@ -323,7 +326,6 @@ static void set_readonly(void *text, void *etext)
     unsigned long offset;
     unsigned long page_size = PAGE_SIZE;
 #ifdef CONFIG_PARAVIRT
-    static mmu_update_t mmu_updates[L1_PAGETABLE_ENTRIES + 1];
     int count = 0;
     int rc;
 #endif
-- 
2.43.0


