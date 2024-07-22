Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 550E093913F
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 17:02:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762133.1172284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVuYG-0002EQ-Lq; Mon, 22 Jul 2024 15:02:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762133.1172284; Mon, 22 Jul 2024 15:02:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVuYG-0002An-HH; Mon, 22 Jul 2024 15:02:12 +0000
Received: by outflank-mailman (input) for mailman id 762133;
 Mon, 22 Jul 2024 15:02:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JAiy=OW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sVuYF-0000bJ-IB
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 15:02:11 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d11f637-483b-11ef-8776-851b0ebba9a2;
 Mon, 22 Jul 2024 17:02:07 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 201B01FB73;
 Mon, 22 Jul 2024 15:02:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E1AD3136A9;
 Mon, 22 Jul 2024 15:02:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 9I+bNW50nmaqVgAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 22 Jul 2024 15:02:06 +0000
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
X-Inumbo-ID: 5d11f637-483b-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1721660527; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mS1uWPpdCrC7UXHpXbDcoLGvGKv0oO3EBtOjFDnnTtg=;
	b=uW3yZTksYT8ntBDAceHfaSh/P+deWpsM2FkhzyvTtMVkDekj5nwwhwV+T0TegTJfNv67V3
	HRPzHxqKxdVqgmtEjIM+JRjBFh3tQ2chhM5IcSYiw1UvBGVdVqTi7qhkBgVe8TxfJiTxp6
	BbOxdhmFsaevYvsMIzv7c0DLaZ1x0wI=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=uW3yZTks
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1721660527; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mS1uWPpdCrC7UXHpXbDcoLGvGKv0oO3EBtOjFDnnTtg=;
	b=uW3yZTksYT8ntBDAceHfaSh/P+deWpsM2FkhzyvTtMVkDekj5nwwhwV+T0TegTJfNv67V3
	HRPzHxqKxdVqgmtEjIM+JRjBFh3tQ2chhM5IcSYiw1UvBGVdVqTi7qhkBgVe8TxfJiTxp6
	BbOxdhmFsaevYvsMIzv7c0DLaZ1x0wI=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 4/4] mini-os: remove sanity_check()
Date: Mon, 22 Jul 2024 17:01:41 +0200
Message-ID: <20240722150141.31391-5-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240722150141.31391-1-jgross@suse.com>
References: <20240722150141.31391-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.81
X-Rspamd-Action: no action
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 201B01FB73
X-Spamd-Result: default: False [-2.81 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DWL_DNSWL_BLOCKED(0.00)[suse.com:dkim];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email]
X-Spam-Flag: NO

Remove the sanity_check() function, as it is used nowhere.

Since any application linked with Mini-OS can't call sanity_check()
either (there is no EXPORT_SYMBOL for it), there is zero chance of
breaking any use case.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 include/lib.h |  3 ---
 mm.c          | 16 ----------------
 2 files changed, 19 deletions(-)

diff --git a/include/lib.h b/include/lib.h
index abd4e9ab..acd4acc6 100644
--- a/include/lib.h
+++ b/include/lib.h
@@ -152,9 +152,6 @@ do {                                                           \
 
 #define BUG_ON(x) ASSERT(!(x))
 
-/* Consistency check as much as possible. */
-void sanity_check(void);
-
 /* Get own domid. */
 domid_t get_domid(void);
 
diff --git a/mm.c b/mm.c
index 96686a5c..1fa7e7bf 100644
--- a/mm.c
+++ b/mm.c
@@ -394,19 +394,3 @@ void init_mm(void)
 void fini_mm(void)
 {
 }
-
-void sanity_check(void)
-{
-    int x;
-    chunk_head_t *head;
-
-    for ( x = 0; x < FREELIST_SIZE; x++ )
-    {
-        for ( head = free_list[x].next; !FREELIST_EMPTY(head);
-              head = head->next )
-        {
-            ASSERT(!allocated_in_map(virt_to_pfn(head)));
-            ASSERT(head->next->prev == head);
-        }
-    }
-}
-- 
2.43.0


