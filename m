Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13783614EEC
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 17:15:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435065.688111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optuv-00011E-7r; Tue, 01 Nov 2022 16:15:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435065.688111; Tue, 01 Nov 2022 16:15:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optuv-0000zG-3y; Tue, 01 Nov 2022 16:15:09 +0000
Received: by outflank-mailman (input) for mailman id 435065;
 Tue, 01 Nov 2022 16:15:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PfM8=3B=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1optus-0000yH-Ny
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 16:15:06 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58e3f89c-5a00-11ed-91b5-6bf2151ebd3b;
 Tue, 01 Nov 2022 17:15:05 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 871D51F90F;
 Tue,  1 Nov 2022 16:15:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 600101346F;
 Tue,  1 Nov 2022 16:15:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mTP/FQlGYWMPdwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 01 Nov 2022 16:15:05 +0000
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
X-Inumbo-ID: 58e3f89c-5a00-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667319305; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SRXNQDO4MhG9H32yh0qBaLPCvnVGtf7v3eYM21ANcnk=;
	b=uE2UvseLH5K44Hrqi7TWdLTAcE5uiNIIixn9OviwEQVluWQGHv5wkD7r7O20R4TuQjPElQ
	cCsFuXRC8LPqau/1IXWJsksgLf6VhHAFrywyThJsId+1dp5vL6DGo5vCz8R8pw2QitTiQB
	Zi1wM+hn6U2EbKVhn4G6iMPIIUSR19g=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 01/10] tools/xenstore: verify command line parameters better
Date: Tue,  1 Nov 2022 17:14:48 +0100
Message-Id: <20221101161457.8470-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221101161457.8470-1-jgross@suse.com>
References: <20221101161457.8470-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add some more verification of command line parameters.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_core.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index ae1ea29b80..714841d9ca 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -2790,7 +2790,7 @@ int main(int argc, char *argv[])
 			no_domain_init = true;
 			break;
 		case 'E':
-			hard_quotas[ACC_NODES].val = strtoul(optarg, NULL, 10);
+			hard_quotas[ACC_NODES].val = get_optval_int(optarg);
 			break;
 		case 'F':
 			pidfile = optarg;
@@ -2808,10 +2808,10 @@ int main(int argc, char *argv[])
 			recovery = false;
 			break;
 		case 'S':
-			hard_quotas[ACC_NODESZ].val = strtoul(optarg, NULL, 10);
+			hard_quotas[ACC_NODESZ].val = get_optval_int(optarg);
 			break;
 		case 't':
-			hard_quotas[ACC_TRANS].val = strtoul(optarg, NULL, 10);
+			hard_quotas[ACC_TRANS].val = get_optval_int(optarg);
 			break;
 		case 'T':
 			tracefile = optarg;
@@ -2830,14 +2830,13 @@ int main(int argc, char *argv[])
 			verbose = true;
 			break;
 		case 'W':
-			hard_quotas[ACC_WATCH].val = strtoul(optarg, NULL, 10);
+			hard_quotas[ACC_WATCH].val = get_optval_int(optarg);
 			break;
 		case 'A':
-			hard_quotas[ACC_NPERM].val = strtoul(optarg, NULL, 10);
+			hard_quotas[ACC_NPERM].val = get_optval_int(optarg);
 			break;
 		case 'M':
-			hard_quotas[ACC_PATHLEN].val =
-				strtoul(optarg, NULL, 10);
+			hard_quotas[ACC_PATHLEN].val = get_optval_int(optarg);
 			hard_quotas[ACC_PATHLEN].val =
 				 min((unsigned int)XENSTORE_REL_PATH_MAX,
 				     hard_quotas[ACC_PATHLEN].val);
@@ -2852,13 +2851,13 @@ int main(int argc, char *argv[])
 			set_timeout(optarg);
 			break;
 		case 'e':
-			dom0_event = strtol(optarg, NULL, 10);
+			dom0_event = get_optval_int(optarg);
 			break;
 		case 'm':
-			dom0_domid = strtol(optarg, NULL, 10);
+			dom0_domid = get_optval_int(optarg);
 			break;
 		case 'p':
-			priv_domid = strtol(optarg, NULL, 10);
+			priv_domid = get_optval_int(optarg);
 			break;
 #ifndef NO_LIVE_UPDATE
 		case 'U':
-- 
2.35.3


