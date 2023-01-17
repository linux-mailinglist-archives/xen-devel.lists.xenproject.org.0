Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD02266D99C
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 10:15:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479186.742900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHi3p-00054A-2I; Tue, 17 Jan 2023 09:15:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479186.742900; Tue, 17 Jan 2023 09:15:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHi3o-00050i-QX; Tue, 17 Jan 2023 09:15:16 +0000
Received: by outflank-mailman (input) for mailman id 479186;
 Tue, 17 Jan 2023 09:15:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uRIs=5O=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pHi1f-000725-Kx
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 09:13:03 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24ded8bb-9647-11ed-91b6-6bf2151ebd3b;
 Tue, 17 Jan 2023 10:13:02 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4BC90683DD;
 Tue, 17 Jan 2023 09:13:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 214A41390C;
 Tue, 17 Jan 2023 09:13:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oZ3bBp5mxmO0cAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 17 Jan 2023 09:13:02 +0000
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
X-Inumbo-ID: 24ded8bb-9647-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1673946782; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hbeYM9pX9rme/MidcA7zKLWfF87qgsmjrN7bSznT5S0=;
	b=kXgUN8Ck+aE1WJGaEnno2laahxi4dCDB/JMqBUyD08sCYdIhcJsWaxnegCAVEbp7CTTRYS
	IURXKnaDnuwt6qALRzIeNJpq6z2NexoDgITvx2wrtOfrdw+lut8EFrDfE+fQmJMKFT6i92
	nBzhs9fT9mkSR2AAoazrVHoiqnoXuxw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 17/17] tools/xenstore: make output of "xenstore-control help" more pretty
Date: Tue, 17 Jan 2023 10:11:24 +0100
Message-Id: <20230117091124.22170-18-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230117091124.22170-1-jgross@suse.com>
References: <20230117091124.22170-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using a tab for separating the command from the options in the output
of "xenstore-control help" results in a rather ugly list.

Use a fixed size for the command instead.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 tools/xenstore/xenstored_control.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index 000b2bb8c7..cbd62556c3 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -996,7 +996,7 @@ static int do_control_help(const void *ctx, struct connection *conn,
 	if (!resp)
 		return ENOMEM;
 	for (cmd = 0; cmd < ARRAY_SIZE(cmds); cmd++) {
-		resp = talloc_asprintf_append(resp, "%s\t%s\n",
+		resp = talloc_asprintf_append(resp, "%-15s %s\n",
 					      cmds[cmd].cmd, cmds[cmd].pars);
 		if (!resp)
 			return ENOMEM;
-- 
2.35.3


