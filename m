Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FBF84983A
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 11:58:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675857.1051526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwfs-0006j1-SZ; Mon, 05 Feb 2024 10:58:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675857.1051526; Mon, 05 Feb 2024 10:58:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwfs-0006gW-PK; Mon, 05 Feb 2024 10:58:04 +0000
Received: by outflank-mailman (input) for mailman id 675857;
 Mon, 05 Feb 2024 10:58:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b4fC=JO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rWwZh-0000qL-GV
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 10:51:41 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a8666d6-c414-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 11:51:39 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A9D531F8BD;
 Mon,  5 Feb 2024 10:51:39 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 73C17132DD;
 Mon,  5 Feb 2024 10:51:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id QSfEGru9wGWeNgAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 05 Feb 2024 10:51:39 +0000
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
X-Inumbo-ID: 8a8666d6-c414-11ee-98f5-efadbce2ee36
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH v4 17/32] tools/helpers: allocate xenstore event channel for xenstore stubdom
Date: Mon,  5 Feb 2024 11:49:46 +0100
Message-Id: <20240205105001.24171-18-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240205105001.24171-1-jgross@suse.com>
References: <20240205105001.24171-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	none
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: A9D531F8BD
X-Spam-Flag: NO

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


