Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62675AF0D9B
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 10:13:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030390.1404067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWsan-00012v-2d; Wed, 02 Jul 2025 08:13:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030390.1404067; Wed, 02 Jul 2025 08:13:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWsam-00010P-VC; Wed, 02 Jul 2025 08:13:20 +0000
Received: by outflank-mailman (input) for mailman id 1030390;
 Wed, 02 Jul 2025 08:13:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFiP=ZP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uWsam-00082X-2V
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 08:13:20 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68ed5144-571c-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 10:13:18 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7222921189;
 Wed,  2 Jul 2025 08:13:14 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 45A1913A24;
 Wed,  2 Jul 2025 08:13:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id jeA+DxrqZGgDSQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 02 Jul 2025 08:13:14 +0000
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
X-Inumbo-ID: 68ed5144-571c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1751443994; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LGW/gk3WVxXGF0g4wh7ZDjVSEfCjF8UjuqgxFwW7rBU=;
	b=MJBVpMHqpu8cKkaJ8YCM1wr0ucHaY7HYgMgsIa83rTqGBYW/FoUvfFctqetwUWONP3pjkk
	bv+HZOy5FbEORdnda8SPjQo2MMDc2RCX5TyGk9HYCDjXzfZmbYZIEi3diq412+wMu+lOE8
	ADwLeEvdfTYG0kH7/q94Awh/lQ6phOs=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=MJBVpMHq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1751443994; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LGW/gk3WVxXGF0g4wh7ZDjVSEfCjF8UjuqgxFwW7rBU=;
	b=MJBVpMHqpu8cKkaJ8YCM1wr0ucHaY7HYgMgsIa83rTqGBYW/FoUvfFctqetwUWONP3pjkk
	bv+HZOy5FbEORdnda8SPjQo2MMDc2RCX5TyGk9HYCDjXzfZmbYZIEi3diq412+wMu+lOE8
	ADwLeEvdfTYG0kH7/q94Awh/lQ6phOs=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH 03/19] mini-os: grants: support populated grant table at boot
Date: Wed,  2 Jul 2025 10:12:38 +0200
Message-ID: <20250702081254.14383-4-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702081254.14383-1-jgross@suse.com>
References: <20250702081254.14383-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 7222921189
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Score: -3.01
X-Spam-Level: 

When kexec-ing into a new kernel, the grant table might still have
active grants. Support that by not adding populated grant entries to
the list of free grant entries.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 gnttab.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/gnttab.c b/gnttab.c
index 8168ed5d..5b04ab01 100644
--- a/gnttab.c
+++ b/gnttab.c
@@ -183,11 +183,13 @@ init_gnttab(void)
 #ifdef GNT_DEBUG
     memset(inuse, 1, sizeof(inuse));
 #endif
-    for (i = NR_RESERVED_ENTRIES; i < NR_GRANT_ENTRIES; i++)
-        put_free_entry(i);
 
     gnttab_table = arch_init_gnttab(NR_GRANT_FRAMES);
     printk("gnttab_table mapped at %p.\n", gnttab_table);
+
+    for (i = NR_RESERVED_ENTRIES; i < NR_GRANT_ENTRIES; i++)
+        if (gnttab_table[i].flags == 0)
+            put_free_entry(i);
 }
 
 void
-- 
2.43.0


