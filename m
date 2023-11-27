Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C518C7F9DCD
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 11:40:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641911.1000945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Z2Y-0006gy-UP; Mon, 27 Nov 2023 10:40:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641911.1000945; Mon, 27 Nov 2023 10:40:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Z2Y-0006eN-Qq; Mon, 27 Nov 2023 10:40:34 +0000
Received: by outflank-mailman (input) for mailman id 641911;
 Mon, 27 Nov 2023 10:40:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gVlU=HI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r7YpR-0000Co-FN
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 10:27:01 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f76510e-8d0f-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 11:27:00 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 87E5921A5E;
 Mon, 27 Nov 2023 10:26:59 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 5D66B132A6;
 Mon, 27 Nov 2023 10:26:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id BCGDFfNuZGXofgAAn2gu4w
 (envelope-from <jgross@suse.com>); Mon, 27 Nov 2023 10:26:59 +0000
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
X-Inumbo-ID: 7f76510e-8d0f-11ee-98e2-6d05b1d4d9a1
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 17/32] Mini-OS: add EXPORT_SYMBOL() instances to gntmap.c
Date: Mon, 27 Nov 2023 11:25:08 +0100
Message-Id: <20231127102523.28003-18-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231127102523.28003-1-jgross@suse.com>
References: <20231127102523.28003-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: *************************
X-Spamd-Bar: +++++++++++++++++++++++++
Authentication-Results: smtp-out1.suse.de;
	dkim=none;
	dmarc=fail reason="No valid SPF, No valid DKIM" header.from=suse.com (policy=quarantine);
	spf=fail (smtp-out1.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:98 as permitted sender) smtp.mailfrom=jgross@suse.com
X-Rspamd-Server: rspamd2
X-Spamd-Result: default: False [25.48 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_SPF_FAIL(1.00)[-all];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 DMARC_POLICY_QUARANTINE(1.50)[suse.com : No valid SPF, No valid DKIM,quarantine];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 BAYES_SPAM(3.98)[96.94%];
	 NEURAL_SPAM_SHORT(3.00)[1.000];
	 MX_GOOD(-0.01)[];
	 NEURAL_SPAM_LONG(3.50)[1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: 25.48
X-Rspamd-Queue-Id: 87E5921A5E
X-Spam-Flag: NO

Add the needed instances of EXPORT_SYMBOL() to gntmap.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch
---
 gntmap.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/gntmap.c b/gntmap.c
index 3422ab23..5f57d6b3 100644
--- a/gntmap.c
+++ b/gntmap.c
@@ -106,6 +106,7 @@ gntmap_set_max_grants(struct gntmap *map, int count)
     map->nentries = count;
     return 0;
 }
+EXPORT_SYMBOL(gntmap_set_max_grants);
 
 static int
 _gntmap_unmap_grant_ref(struct gntmap *map, int idx)
@@ -209,6 +210,7 @@ gntmap_munmap(struct gntmap *map, unsigned long start_address, int count)
 
     return 0;
 }
+EXPORT_SYMBOL(gntmap_munmap);
 
 void*
 gntmap_map_grant_refs(struct gntmap *map, 
@@ -251,6 +253,7 @@ gntmap_map_grant_refs(struct gntmap *map,
 
     return (void*) addr;
 }
+EXPORT_SYMBOL(gntmap_map_grant_refs);
 
 void
 gntmap_init(struct gntmap *map)
@@ -259,6 +262,7 @@ gntmap_init(struct gntmap *map)
     map->nentries = 0;
     map->entries = NULL;
 }
+EXPORT_SYMBOL(gntmap_init);
 
 void
 gntmap_fini(struct gntmap *map)
@@ -281,3 +285,4 @@ gntmap_fini(struct gntmap *map)
     map->entries = NULL;
     map->nentries = 0;
 }
+EXPORT_SYMBOL(gntmap_fini);
-- 
2.35.3


