Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01016BB9510
	for <lists+xen-devel@lfdr.de>; Sun, 05 Oct 2025 11:19:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1137551.1473594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5KtH-0005gJ-Vh; Sun, 05 Oct 2025 09:18:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1137551.1473594; Sun, 05 Oct 2025 09:18:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5KtH-0005dP-Ro; Sun, 05 Oct 2025 09:18:51 +0000
Received: by outflank-mailman (input) for mailman id 1137551;
 Sun, 05 Oct 2025 09:18:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IXf/=4O=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1v5KtG-0005dJ-U3
 for xen-devel@lists.xenproject.org; Sun, 05 Oct 2025 09:18:50 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d35909f-a1cc-11f0-9d15-b5c5bf9af7f9;
 Sun, 05 Oct 2025 11:18:49 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 795A921D61;
 Sun,  5 Oct 2025 09:18:48 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4448313A39;
 Sun,  5 Oct 2025 09:18:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id SONBD/g34mjcewAAD6G6ig
 (envelope-from <jgross@suse.com>); Sun, 05 Oct 2025 09:18:48 +0000
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
X-Inumbo-ID: 4d35909f-a1cc-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1759655928; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=+AiHD+yuxp0p/FZBZl4MKBM0GEgTQxDyMDQgOxsgIMA=;
	b=H+f1egBW2XSbcAQF6oE9eyGpuEd9KvASLzEqdn0BcQlhK2667pHPhIKT4nx5kA2aVE7NRV
	zzO3uBXJqxzzyfpnjZ7aW6Jb8oc4Day+Ws/A7y4TlVCCnWH3fHh//fpWurya0J6LfP7m4s
	AqHyMGb4CWKssIomoTwxQcuCjWiVtDk=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=H+f1egBW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1759655928; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=+AiHD+yuxp0p/FZBZl4MKBM0GEgTQxDyMDQgOxsgIMA=;
	b=H+f1egBW2XSbcAQF6oE9eyGpuEd9KvASLzEqdn0BcQlhK2667pHPhIKT4nx5kA2aVE7NRV
	zzO3uBXJqxzzyfpnjZ7aW6Jb8oc4Day+Ws/A7y4TlVCCnWH3fHh//fpWurya0J6LfP7m4s
	AqHyMGb4CWKssIomoTwxQcuCjWiVtDk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH] libs/guest: don't use unsigned long as type for PFNs
Date: Sun,  5 Oct 2025 11:18:45 +0200
Message-ID: <20251005091845.3725-1-jgross@suse.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.com:+];
	FREEMAIL_CC(0.00)[suse.com,vates.tech,amd.com,gmail.com,arm.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 795A921D61
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -1.51

Declarations of xc_dom_console_init() and
xc_dom_console_set_disconnected() in libxenguest.h don't match their
implementation in the library.

Use xen_pfn_t for PFNs in the library to fix that.

Fixes: b6fc307b0b00 ("libs/guest: Set console as disconnected on resume")
Fixes: 971b7d5ecbcd ("libs/guest: Set console page to disconnected")
Reported-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/guest/xg_dom_boot.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/libs/guest/xg_dom_boot.c b/tools/libs/guest/xg_dom_boot.c
index f51b6a78c8..beeb4a7255 100644
--- a/tools/libs/guest/xg_dom_boot.c
+++ b/tools/libs/guest/xg_dom_boot.c
@@ -430,7 +430,7 @@ int xc_dom_gnttab_init(struct xc_dom_image *dom)
 
 static int dom_console_init(xc_interface *xch,
                             uint32_t domid,
-                            unsigned long dst_pfn,
+                            xen_pfn_t dst_pfn,
                             bool clear)
 {
     const size_t size = PAGE_SIZE;
@@ -451,14 +451,14 @@ static int dom_console_init(xc_interface *xch,
 
 int xc_dom_console_init(xc_interface *xch,
                         uint32_t domid,
-                        unsigned long dst_pfn)
+                        xen_pfn_t dst_pfn)
 {
     return dom_console_init(xch, domid, dst_pfn, true);
 }
 
 int xc_dom_console_set_disconnected(xc_interface *xch,
                                     uint32_t domid,
-                                    unsigned long dst_pfn)
+                                    xen_pfn_t dst_pfn)
 {
     return dom_console_init(xch, domid, dst_pfn, false);
 }
-- 
2.51.0


