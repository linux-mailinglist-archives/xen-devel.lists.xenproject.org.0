Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B22823E47
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 10:09:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661193.1030934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLJjB-000642-DD; Thu, 04 Jan 2024 09:09:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661193.1030934; Thu, 04 Jan 2024 09:09:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLJjB-00061z-9j; Thu, 04 Jan 2024 09:09:25 +0000
Received: by outflank-mailman (input) for mailman id 661193;
 Thu, 04 Jan 2024 09:09:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4u2H=IO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rLJcd-00085z-Qr
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 09:02:39 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02c8d04a-aae0-11ee-98ef-6d05b1d4d9a1;
 Thu, 04 Jan 2024 10:02:39 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0760F1F7F8;
 Thu,  4 Jan 2024 09:02:39 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CBC9813722;
 Thu,  4 Jan 2024 09:02:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id G2Z3MC50lmUIWQAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 04 Jan 2024 09:02:38 +0000
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
X-Inumbo-ID: 02c8d04a-aae0-11ee-98ef-6d05b1d4d9a1
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH v3 18/33] tools/helpers: allocate xenstore event channel for xenstore stubdom
Date: Thu,  4 Jan 2024 10:00:40 +0100
Message-Id: <20240104090055.27323-19-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240104090055.27323-1-jgross@suse.com>
References: <20240104090055.27323-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 0760F1F7F8

In order to prepare support of PV frontends in xenstore-stubdom, add
allocation of a Xenstore event channel to init-xenstore-domain.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/helpers/init-xenstore-domain.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
index b2d5df8ba5..140ed610ae 100644
--- a/tools/helpers/init-xenstore-domain.c
+++ b/tools/helpers/init-xenstore-domain.c
@@ -248,6 +248,13 @@ static int build(xc_interface *xch)
     dom->cmdline = xc_dom_strdup(dom, cmdline);
     dom->xenstore_domid = domid;
     dom->console_evtchn = console_evtchn;
+    rv = xc_evtchn_alloc_unbound(xch, domid, domid);
+    if ( rv < 0 )
+    {
+        fprintf(stderr, "xc_evtchn_alloc_unbound failed\n");
+        goto err;
+    }
+    dom->xenstore_evtchn = rv;
 
     rv = xc_dom_mem_init(dom, memory);
     if ( rv )
-- 
2.35.3


