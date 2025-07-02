Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDEEAF0DB5
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 10:20:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030444.1404162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWsi2-0005fF-PB; Wed, 02 Jul 2025 08:20:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030444.1404162; Wed, 02 Jul 2025 08:20:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWsi2-0005cN-AO; Wed, 02 Jul 2025 08:20:50 +0000
Received: by outflank-mailman (input) for mailman id 1030444;
 Wed, 02 Jul 2025 08:20:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFiP=ZP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uWsbt-00082X-ID
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 08:14:29 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 921f644a-571c-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 10:14:27 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DA91E1F445;
 Wed,  2 Jul 2025 08:14:26 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B1AB813A24;
 Wed,  2 Jul 2025 08:14:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id OcHtKWLqZGh5SQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 02 Jul 2025 08:14:26 +0000
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
X-Inumbo-ID: 921f644a-571c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1751444066; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zDtKgh+ZY1/kdJFUAdITx2mhsJQDxIfukWhnUYKt9Xs=;
	b=E9DWZ6Na0viwWiCWPwEvvGIAMRSQpkp9uWBmswocEggnZaHHU0DJICmY4fc/xo8wyVo5hS
	aeybllRqaGHgyXQRMEha9KuwX4F58BjCjSQkbp95iW+A4l7huTXTxERt5Yomy5FEITz5J8
	SNJPtsk+IwWk2YMdLIt2z9f380jlCPQ=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=E9DWZ6Na
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1751444066; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zDtKgh+ZY1/kdJFUAdITx2mhsJQDxIfukWhnUYKt9Xs=;
	b=E9DWZ6Na0viwWiCWPwEvvGIAMRSQpkp9uWBmswocEggnZaHHU0DJICmY4fc/xo8wyVo5hS
	aeybllRqaGHgyXQRMEha9KuwX4F58BjCjSQkbp95iW+A4l7huTXTxERt5Yomy5FEITz5J8
	SNJPtsk+IwWk2YMdLIt2z9f380jlCPQ=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH 16/19] gnttab: remove gnttab_alloc_and_grant() function
Date: Wed,  2 Jul 2025 10:12:51 +0200
Message-ID: <20250702081254.14383-17-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702081254.14383-1-jgross@suse.com>
References: <20250702081254.14383-1-jgross@suse.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: DA91E1F445
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.01

The last user of gnttab_alloc_and_grant() is gone.

Remove gnttab_alloc_and_grant() as it is doing more harm than good.
It is hard coded to only grant access for dom0, which is not really
clear from looking at the function name. It would be possible to add
a domid parameter, but given its now 0 users, there doesn't seem to be
a real demand for that function.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 gnttab.c         | 13 -------------
 include/gnttab.h |  1 -
 2 files changed, 14 deletions(-)

diff --git a/gnttab.c b/gnttab.c
index 5b04ab01..6bac0905 100644
--- a/gnttab.c
+++ b/gnttab.c
@@ -149,19 +149,6 @@ gnttab_end_transfer(grant_ref_t ref)
 }
 EXPORT_SYMBOL(gnttab_end_transfer);
 
-grant_ref_t
-gnttab_alloc_and_grant(void **map)
-{
-    unsigned long mfn;
-    grant_ref_t gref;
-
-    *map = (void *)alloc_page();
-    mfn = virt_to_mfn(*map);
-    gref = gnttab_grant_access(0, mfn, 0);
-    return gref;
-}
-EXPORT_SYMBOL(gnttab_alloc_and_grant);
-
 static const char * const gnttabop_error_msgs[] = GNTTABOP_error_msgs;
 
 const char *
diff --git a/include/gnttab.h b/include/gnttab.h
index 974cb89d..108c4425 100644
--- a/include/gnttab.h
+++ b/include/gnttab.h
@@ -4,7 +4,6 @@
 #include <xen/grant_table.h>
 
 void init_gnttab(void);
-grant_ref_t gnttab_alloc_and_grant(void **map);
 grant_ref_t gnttab_grant_access(domid_t domid, unsigned long frame,
 				int readonly);
 grant_ref_t gnttab_grant_transfer(domid_t domid, unsigned long pfn);
-- 
2.43.0


