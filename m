Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1638264B93E
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 17:05:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460806.718883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p57mZ-0001vT-UO; Tue, 13 Dec 2022 16:05:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460806.718883; Tue, 13 Dec 2022 16:05:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p57mZ-0001s9-PF; Tue, 13 Dec 2022 16:05:27 +0000
Received: by outflank-mailman (input) for mailman id 460806;
 Tue, 13 Dec 2022 16:05:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Djt=4L=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1p57jn-0001ta-66
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 16:02:35 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e0be871-7aff-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 17:02:33 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0875322A34;
 Tue, 13 Dec 2022 16:02:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D03B8138EE;
 Tue, 13 Dec 2022 16:02:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /YOFMRmimGNsKgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 13 Dec 2022 16:02:33 +0000
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
X-Inumbo-ID: 8e0be871-7aff-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1670947354; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hbeYM9pX9rme/MidcA7zKLWfF87qgsmjrN7bSznT5S0=;
	b=BLaU+lI2DeLbF1LLGTSBoJUqghFWQ2QhyO4e4yko1LD5sKsEL1RzAOdMBWSDmjin+eyPEN
	byW4iPtQ/8j74Er7BkWNZtYkRnlIPUOMZP4gmRDzcLN9DMmNhjKVkmrDGnt2xuiKjkFhdt
	55MH9k9aHdGwbUziX18Weufq5siSdLI=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 19/19] tools/xenstore: make output of "xenstore-control help" more pretty
Date: Tue, 13 Dec 2022 17:00:45 +0100
Message-Id: <20221213160045.28170-20-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221213160045.28170-1-jgross@suse.com>
References: <20221213160045.28170-1-jgross@suse.com>
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


