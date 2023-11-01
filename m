Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AD97DDEC4
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 10:53:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626333.976542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7uR-0006Xg-IA; Wed, 01 Nov 2023 09:53:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626333.976542; Wed, 01 Nov 2023 09:53:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7uR-0006UY-D6; Wed, 01 Nov 2023 09:53:11 +0000
Received: by outflank-mailman (input) for mailman id 626333;
 Wed, 01 Nov 2023 09:53:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFMy=GO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qy7cv-0005sN-79
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 09:35:05 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef4ffffe-7899-11ee-9b0e-b553b5be7939;
 Wed, 01 Nov 2023 10:35:03 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 723EF1F74A;
 Wed,  1 Nov 2023 09:35:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 46EC513460;
 Wed,  1 Nov 2023 09:35:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id X4TnD8cbQmVACQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 01 Nov 2023 09:35:03 +0000
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
X-Inumbo-ID: ef4ffffe-7899-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698831303; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=27vJ80eI9t0Dmh4t3Smn4CXNhdUOQ+kVQRJUrk4nmkU=;
	b=PRegSZq/D2YS2jcVY5VwV2nLmFeWrzfWv3s0ckAcO9GitxC6bbU6jRzOKuC3yyEsMaeopF
	I9hBWyqW1SSGwpToPCdPOYQhd9htCExSCA2oqoG6MdfqhFKoS0GisSqQ4lyX8hnD0qg428
	KfIz0VBjdEYINVgfGt+RE5d5QlxcnrA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 17/29] tools/helpers: allocate xenstore event channel for xenstore stubdom
Date: Wed,  1 Nov 2023 10:33:13 +0100
Message-Id: <20231101093325.30302-18-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231101093325.30302-1-jgross@suse.com>
References: <20231101093325.30302-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to prepare support of PV frontends in xenstore-stubdom, add
allocation of a Xenstore event channel to init-xenstore-domain.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
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


