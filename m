Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B88D593BCB4
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2024 08:43:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764695.1175199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWsBn-0002sH-IU; Thu, 25 Jul 2024 06:42:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764695.1175199; Thu, 25 Jul 2024 06:42:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWsBn-0002pK-Fl; Thu, 25 Jul 2024 06:42:59 +0000
Received: by outflank-mailman (input) for mailman id 764695;
 Thu, 25 Jul 2024 06:42:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/jnY=OZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sWsBm-0002on-Ix
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2024 06:42:58 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 205d3e64-4a51-11ef-bbff-fd08da9f4363;
 Thu, 25 Jul 2024 08:42:57 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6D11321A2C;
 Thu, 25 Jul 2024 06:42:56 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3C66B13874;
 Thu, 25 Jul 2024 06:42:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UkdKDfDzoWavCgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 25 Jul 2024 06:42:56 +0000
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
X-Inumbo-ID: 205d3e64-4a51-11ef-bbff-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1721889776; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Lfts1DgUcPXDbLNnlF8FqwxDF6KaPncxEu7VvAfnPNk=;
	b=axTgCmqnhEwBKV838KWE0dwgd3Tw8sAZgvgGGsUz8mBX6Y9AoRIbhL0aotT5NcNl1uXHk8
	BTchlGV13qLf2Y2vkJxg0YW9NaasnDP6GQX4icfHwERVYlQYwsiYLTmAl3misTVtWWEfha
	xlecHG4yGSUVPlVxf+ITT1Y3y0Ny7Aw=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=axTgCmqn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1721889776; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Lfts1DgUcPXDbLNnlF8FqwxDF6KaPncxEu7VvAfnPNk=;
	b=axTgCmqnhEwBKV838KWE0dwgd3Tw8sAZgvgGGsUz8mBX6Y9AoRIbhL0aotT5NcNl1uXHk8
	BTchlGV13qLf2Y2vkJxg0YW9NaasnDP6GQX4icfHwERVYlQYwsiYLTmAl3misTVtWWEfha
	xlecHG4yGSUVPlVxf+ITT1Y3y0Ny7Aw=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2] mini-os: put sanity_check() under CONFIG_TEST
Date: Thu, 25 Jul 2024 08:42:54 +0200
Message-ID: <20240725064254.7545-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [0.19 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	FROM_HAS_DN(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.com:dkim];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spamd-Bar: /
X-Rspamd-Queue-Id: 6D11321A2C
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: 0.19

Hide the sanity_check() function, as it is used nowhere. By putting it
under #ifdef CONFIG_TEST it will stay around, but it won't be
included in normal production builds.

Call sanity_check() from the periodic thread of the test app, causing
a sanity check every second.

Since any application linked with Mini-OS can't call sanity_check()
(there is no EXPORT_SYMBOL for it), there is zero chance of breaking
any use case.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- don't remove it, but just hide it (Samuel Thibault)
---
 include/lib.h | 2 ++
 mm.c          | 2 ++
 test.c        | 1 +
 3 files changed, 5 insertions(+)

diff --git a/include/lib.h b/include/lib.h
index abd4e9ab..de67bab0 100644
--- a/include/lib.h
+++ b/include/lib.h
@@ -152,8 +152,10 @@ do {                                                           \
 
 #define BUG_ON(x) ASSERT(!(x))
 
+#ifdef CONFIG_TEST
 /* Consistency check as much as possible. */
 void sanity_check(void);
+#endif
 
 /* Get own domid. */
 domid_t get_domid(void);
diff --git a/mm.c b/mm.c
index 4aa0c6ca..a5d3f5e5 100644
--- a/mm.c
+++ b/mm.c
@@ -395,6 +395,7 @@ void fini_mm(void)
 {
 }
 
+#ifdef CONFIG_TEST
 void sanity_check(void)
 {
     int x;
@@ -410,3 +411,4 @@ void sanity_check(void)
         }
     }
 }
+#endif
diff --git a/test.c b/test.c
index 465c54e8..4dd6e260 100644
--- a/test.c
+++ b/test.c
@@ -185,6 +185,7 @@ static void periodic_thread(void *p)
     {
         gettimeofday(&tv, NULL);
         printk("T(s=%ld us=%ld)\n", tv.tv_sec, tv.tv_usec);
+        sanity_check();
         msleep(1000);
     }
 }
-- 
2.43.0


