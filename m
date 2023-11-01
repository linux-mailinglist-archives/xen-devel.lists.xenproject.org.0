Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2647DDEAA
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 10:46:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626287.976427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7nS-0006Tq-9A; Wed, 01 Nov 2023 09:45:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626287.976427; Wed, 01 Nov 2023 09:45:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7nS-0006Ls-5N; Wed, 01 Nov 2023 09:45:58 +0000
Received: by outflank-mailman (input) for mailman id 626287;
 Wed, 01 Nov 2023 09:45:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFMy=GO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qy7dH-0005sN-J1
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 09:35:27 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc9c9d34-7899-11ee-9b0e-b553b5be7939;
 Wed, 01 Nov 2023 10:35:26 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C002521A34;
 Wed,  1 Nov 2023 09:35:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 94B2A13460;
 Wed,  1 Nov 2023 09:35:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9JLwIt0bQmV3CQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 01 Nov 2023 09:35:25 +0000
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
X-Inumbo-ID: fc9c9d34-7899-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698831325; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8BjSz724hO0UHJzaR9rl8p5uGL31/PkIonv1NOwSIio=;
	b=fo8fYOp99g80x3D+Weo/P6nTROfs8yQHVNg3vlyLtfzZX1WG1a4mgB+93JkQ1CZ9LfxjiZ
	um2SA8Y4U2lvp6S3iD1d96DaUvT0VL7gcd3/+Mg9ocvrV1ggmSgl/hdFYJPnLdsS5jWvvN
	pKzjvgHwY3uqgul3P5lo+iebH2pJVZQ=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 21/29] tools: tell xenstore-stubdom its own domid
Date: Wed,  1 Nov 2023 10:33:17 +0100
Message-Id: <20231101093325.30302-22-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231101093325.30302-1-jgross@suse.com>
References: <20231101093325.30302-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pass the domid as a boot parameter when starting xenstore-stubdom.
It will be needed to administrate its own Xenstore entries.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/helpers/init-xenstore-domain.c | 4 ++--
 tools/xenstored/core.c               | 9 +++++++++
 tools/xenstored/core.h               | 1 +
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
index a65abae2ac..718cb3ba4e 100644
--- a/tools/helpers/init-xenstore-domain.c
+++ b/tools/helpers/init-xenstore-domain.c
@@ -240,9 +240,9 @@ static int build(xc_interface *xch)
     }
 
     if ( param )
-        snprintf(cmdline, 512, "--event %d %s", rv, param);
+        snprintf(cmdline, 512, "--event %d --domid %u %s", rv, domid, param);
     else
-        snprintf(cmdline, 512, "--event %d", rv);
+        snprintf(cmdline, 512, "--event %d --domid %u", rv, domid);
 
     dom->guest_domid = domid;
     dom->cmdline = xc_dom_strdup(dom, cmdline);
diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index edd07711db..bb4612455d 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -2732,12 +2732,16 @@ static struct option options[] = {
 	{ "watch-nb", 1, NULL, 'W' },
 #ifndef NO_LIVE_UPDATE
 	{ "live-update", 0, NULL, 'U' },
+#endif
+#ifdef __MINIOS__
+	{ "domid", 1, NULL, 2 },
 #endif
 	{ NULL, 0, NULL, 0 } };
 
 int dom0_domid = 0;
 int dom0_event = 0;
 int priv_domid = 0;
+int stub_domid = -1;
 
 static unsigned int get_optval_uint(const char *arg)
 {
@@ -2927,6 +2931,11 @@ int main(int argc, char *argv[])
 		case 'U':
 			live_update = true;
 			break;
+#endif
+#ifdef __MINIOS__
+		case 2:
+			stub_domid = get_optval_uint(optarg);
+			break;
 #endif
 		}
 	}
diff --git a/tools/xenstored/core.h b/tools/xenstored/core.h
index 480b0f5f7b..f7a27a4131 100644
--- a/tools/xenstored/core.h
+++ b/tools/xenstored/core.h
@@ -359,6 +359,7 @@ do {						\
 extern int dom0_domid;
 extern int dom0_event;
 extern int priv_domid;
+extern int stub_domid;
 extern bool keep_orphans;
 
 extern unsigned int timeout_watch_event_msec;
-- 
2.35.3


