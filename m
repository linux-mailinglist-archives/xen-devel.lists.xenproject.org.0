Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA5E715919
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 10:54:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540870.842952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3v7e-0001qz-5j; Tue, 30 May 2023 08:54:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540870.842952; Tue, 30 May 2023 08:54:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3v7e-0001nl-2m; Tue, 30 May 2023 08:54:30 +0000
Received: by outflank-mailman (input) for mailman id 540870;
 Tue, 30 May 2023 08:54:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2tj/=BT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1q3v7b-0001Xf-SA
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 08:54:27 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94f9d21f-fec7-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 10:54:27 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E137421AA0;
 Tue, 30 May 2023 08:54:26 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id AFFF11341B;
 Tue, 30 May 2023 08:54:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id XFOhKcK5dWQ3GwAAGKfGzw
 (envelope-from <jgross@suse.com>); Tue, 30 May 2023 08:54:26 +0000
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
X-Inumbo-ID: 94f9d21f-fec7-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1685436866; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A4prpz1ycS+3ar6IMyNb023Z80jGKOwvg7NsWxkIJDI=;
	b=CyEx1QkqV0aW6vYFlgEvz3YRsqbzt0vsDcu4cWuHuoBYYLQiMn/ZKdDPxxpX6Py0AQe2wE
	dUqQoS9c0SyuVbtd2OkyjsZO994Kq/6E0IkZOK7zvKYJ7g9sdI91NNOb5ewcLjM17TUbr2
	WgA03+R3+yykhFFC9sBNVj6ej82YKVI=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v3 01/16] tools/xenstore: verify command line parameters better
Date: Tue, 30 May 2023 10:54:03 +0200
Message-Id: <20230530085418.5417-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230530085418.5417-1-jgross@suse.com>
References: <20230530085418.5417-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add some more verification of command line parameters.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstore/xenstored_core.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 6f03f6687a..22df395aac 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -2820,7 +2820,7 @@ int main(int argc, char *argv[])
 			no_domain_init = true;
 			break;
 		case 'E':
-			hard_quotas[ACC_NODES].val = strtoul(optarg, NULL, 10);
+			hard_quotas[ACC_NODES].val = get_optval_uint(optarg);
 			break;
 		case 'F':
 			pidfile = optarg;
@@ -2838,10 +2838,10 @@ int main(int argc, char *argv[])
 			recovery = false;
 			break;
 		case 'S':
-			hard_quotas[ACC_NODESZ].val = strtoul(optarg, NULL, 10);
+			hard_quotas[ACC_NODESZ].val = get_optval_uint(optarg);
 			break;
 		case 't':
-			hard_quotas[ACC_TRANS].val = strtoul(optarg, NULL, 10);
+			hard_quotas[ACC_TRANS].val = get_optval_uint(optarg);
 			break;
 		case 'T':
 			tracefile = optarg;
@@ -2861,14 +2861,13 @@ int main(int argc, char *argv[])
 			verbose = true;
 			break;
 		case 'W':
-			hard_quotas[ACC_WATCH].val = strtoul(optarg, NULL, 10);
+			hard_quotas[ACC_WATCH].val = get_optval_uint(optarg);
 			break;
 		case 'A':
-			hard_quotas[ACC_NPERM].val = strtoul(optarg, NULL, 10);
+			hard_quotas[ACC_NPERM].val = get_optval_uint(optarg);
 			break;
 		case 'M':
-			hard_quotas[ACC_PATHLEN].val =
-				strtoul(optarg, NULL, 10);
+			hard_quotas[ACC_PATHLEN].val = get_optval_uint(optarg);
 			hard_quotas[ACC_PATHLEN].val =
 				 min((unsigned int)XENSTORE_REL_PATH_MAX,
 				     hard_quotas[ACC_PATHLEN].val);
@@ -2883,13 +2882,13 @@ int main(int argc, char *argv[])
 			set_timeout(optarg);
 			break;
 		case 'e':
-			dom0_event = strtol(optarg, NULL, 10);
+			dom0_event = get_optval_uint(optarg);
 			break;
 		case 'm':
-			dom0_domid = strtol(optarg, NULL, 10);
+			dom0_domid = get_optval_uint(optarg);
 			break;
 		case 'p':
-			priv_domid = strtol(optarg, NULL, 10);
+			priv_domid = get_optval_uint(optarg);
 			break;
 #ifndef NO_LIVE_UPDATE
 		case 'U':
-- 
2.35.3


