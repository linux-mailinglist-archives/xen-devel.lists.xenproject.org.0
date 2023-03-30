Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 135E06CFF0B
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 10:50:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516499.800696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phnzC-0005ia-Ro; Thu, 30 Mar 2023 08:50:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516499.800696; Thu, 30 Mar 2023 08:50:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phnzC-0005gg-NZ; Thu, 30 Mar 2023 08:50:22 +0000
Received: by outflank-mailman (input) for mailman id 516499;
 Thu, 30 Mar 2023 08:50:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QMey=7W=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1phnzA-0005fr-Ov
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 08:50:20 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e671c27c-ced7-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 10:50:19 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AFFD51FEAC;
 Thu, 30 Mar 2023 08:50:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8241F138FF;
 Thu, 30 Mar 2023 08:50:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id j1JwHktNJWTPIgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 30 Mar 2023 08:50:19 +0000
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
X-Inumbo-ID: e671c27c-ced7-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1680166219; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3pO10sPGTtdz9QC6xsd1+0esIC5/k5/zllx/QTVNu38=;
	b=DmhuzkqIdzhODt2DGUTtmkrxBKyvhZmORveGHb5t49odyVkcBxg58Ldul7gle+17oGkE0y
	l9C4qHDpsceHqSHpg9zOdTqSo8Qtp6NnVmsRbhjdQtPbw5qtyXiYukkqxwjxnmDsDshn3P
	PiNT3392sf+M+hK/TwxuQhWgOJECEZM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 01/13] tools/xenstore: verify command line parameters better
Date: Thu, 30 Mar 2023 10:49:59 +0200
Message-Id: <20230330085011.9170-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230330085011.9170-1-jgross@suse.com>
References: <20230330085011.9170-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add some more verification of command line parameters.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_core.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 6e2fc06840..7214b3df03 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -2809,7 +2809,7 @@ int main(int argc, char *argv[])
 			no_domain_init = true;
 			break;
 		case 'E':
-			hard_quotas[ACC_NODES].val = strtoul(optarg, NULL, 10);
+			hard_quotas[ACC_NODES].val = get_optval_int(optarg);
 			break;
 		case 'F':
 			pidfile = optarg;
@@ -2827,10 +2827,10 @@ int main(int argc, char *argv[])
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
@@ -2850,14 +2850,13 @@ int main(int argc, char *argv[])
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
@@ -2872,13 +2871,13 @@ int main(int argc, char *argv[])
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


