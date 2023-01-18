Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C708671847
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 10:55:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480350.744725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI5A2-00068w-Dy; Wed, 18 Jan 2023 09:55:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480350.744725; Wed, 18 Jan 2023 09:55:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI5A2-000682-7p; Wed, 18 Jan 2023 09:55:14 +0000
Received: by outflank-mailman (input) for mailman id 480350;
 Wed, 18 Jan 2023 09:55:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ov7m=5P=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pI56l-0001BV-3d
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 09:51:51 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85c9b0ae-9715-11ed-b8d1-410ff93cb8f0;
 Wed, 18 Jan 2023 10:50:21 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 287F020D67;
 Wed, 18 Jan 2023 09:51:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EA25C139D2;
 Wed, 18 Jan 2023 09:51:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YrLJNzTBx2MRRAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 18 Jan 2023 09:51:48 +0000
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
X-Inumbo-ID: 85c9b0ae-9715-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1674035509; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e87nTBW+uIvj9ME8hZyAeCXoO5ik1/HHW8a5gLJKDEU=;
	b=anz5/SV+JZtyzerukg4Kx4fLPZZfBzKQx081ysmpX0VcN/gnJ141oSn2jKIl7dcRF3Ye0M
	4LeWQizoK/XVEiOwfq9ZcBp2uf/24Kn2M8PF0uY2+XIORVt4aeiOj5sG1K+ZXWBjXO5zWk
	LM8KjRHbZFwZG1ShITT/uZrDKOPduwI=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v4 16/17] tools/xenstore: make output of "xenstore-control help" more pretty
Date: Wed, 18 Jan 2023 10:50:15 +0100
Message-Id: <20230118095016.13091-17-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230118095016.13091-1-jgross@suse.com>
References: <20230118095016.13091-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using a tab for separating the command from the options in the output
of "xenstore-control help" results in a rather ugly list.

Use a fixed size for the command instead.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
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


