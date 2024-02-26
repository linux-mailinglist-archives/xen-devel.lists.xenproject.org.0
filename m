Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6B1866C8D
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 09:40:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685318.1065839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reWWo-0006TB-8d; Mon, 26 Feb 2024 08:40:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685318.1065839; Mon, 26 Feb 2024 08:40:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reWWo-0006QM-5C; Mon, 26 Feb 2024 08:40:02 +0000
Received: by outflank-mailman (input) for mailman id 685318;
 Mon, 26 Feb 2024 08:40:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+ho1=KD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1reWWm-0006Aw-NE
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 08:40:00 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0098e7f-d482-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 09:40:00 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C202E2252B;
 Mon, 26 Feb 2024 08:39:58 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 8FDA21329E;
 Mon, 26 Feb 2024 08:39:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id uF2hIV5O3GW5CQAAn2gu4w
 (envelope-from <jgross@suse.com>); Mon, 26 Feb 2024 08:39:58 +0000
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
X-Inumbo-ID: a0098e7f-d482-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1708936798; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3W5kxAVBkPCkGhzOvhislR9+9KRyj6IR2EuJkg2BVik=;
	b=mqJTJZyDA1u5I3Jd5LRNttTT+6MnG46+P0QcrEHZu0nypefAc9yQ6+EffLHsP2NnsHVhGE
	dqPLNYnK+5LlZvwR4aaHCY72R+HT0Yfr1IMOX08rQGQTkHLe0YTMYQrSu1HS9MAa/hsLXh
	hMLx8zHimU0inlLh9MYD2RgNDt4DiwI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1708936798; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3W5kxAVBkPCkGhzOvhislR9+9KRyj6IR2EuJkg2BVik=;
	b=mqJTJZyDA1u5I3Jd5LRNttTT+6MnG46+P0QcrEHZu0nypefAc9yQ6+EffLHsP2NnsHVhGE
	dqPLNYnK+5LlZvwR4aaHCY72R+HT0Yfr1IMOX08rQGQTkHLe0YTMYQrSu1HS9MAa/hsLXh
	hMLx8zHimU0inlLh9MYD2RgNDt4DiwI=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] Mini-OS: add symbol exports for xenstore stubdom
Date: Mon, 26 Feb 2024 09:39:55 +0100
Message-Id: <20240226083955.19350-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [4.90 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-0.00)[23.12%];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Level: ****
X-Spam-Score: 4.90
X-Spam-Flag: NO

Xenstore stubdom needs some more symbols exported.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xenbus.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xenbus.c b/xenbus.c
index eb9af055..686428a4 100644
--- a/xenbus.c
+++ b/xenbus.c
@@ -45,6 +45,7 @@
 #endif
 
 struct xenstore_domain_interface *xenstore_buf;
+EXPORT_SYMBOL(xenstore_buf);
 static DECLARE_WAIT_QUEUE_HEAD(xb_waitq);
 DECLARE_WAIT_QUEUE_HEAD(xenbus_watch_queue);
 static __DECLARE_SEMAPHORE_GENERIC(xb_write_sem, 1);
@@ -70,6 +71,7 @@ static struct xenbus_req_info req_info[NR_REQS];
 static char *errmsg(struct xsd_sockmsg *rep);
 
 uint32_t xenbus_evtchn;
+EXPORT_SYMBOL(xenbus_evtchn);
 
 #ifdef CONFIG_PARAVIRT
 void get_xenbus(void *p)
-- 
2.35.3


