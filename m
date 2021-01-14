Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 413EA2F64CF
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 16:38:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67209.119821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04hj-00032A-TC; Thu, 14 Jan 2021 15:38:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67209.119821; Thu, 14 Jan 2021 15:38:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04hj-00030R-JG; Thu, 14 Jan 2021 15:38:31 +0000
Received: by outflank-mailman (input) for mailman id 67209;
 Thu, 14 Jan 2021 15:38:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P5GR=GR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l04hh-0002Sh-J0
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 15:38:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ada90ed4-6fa4-410c-8edf-1b6a54c872b3;
 Thu, 14 Jan 2021 15:38:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1024DAF13;
 Thu, 14 Jan 2021 15:38:09 +0000 (UTC)
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
X-Inumbo-ID: ada90ed4-6fa4-410c-8edf-1b6a54c872b3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610638689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oPsWgsu0Wo7yJeT1ib74W9U6E/lawBZhnW/z8jovZm8=;
	b=N1xAQkx/RFrfnU4I0qMxcASLYpepg/we8dUn01dSCrxM2yL2jtzcpnHoHlJ48YY5FTw1Mk
	gv1/RRq3B+bTcwUgOHpRVEs3Pysy28b1uv//ixjidmVyZvSYNBCRtyZuqgvmw0Rnu59EL6
	/EAOXH/sr3DcsAx8Op1CPzgOj6w3/rk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Julien Grall <jgrall@amazon.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v11 11/27] tools/xenstore: add command line handling for live update
Date: Thu, 14 Jan 2021 16:37:47 +0100
Message-Id: <20210114153803.2591-12-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114153803.2591-1-jgross@suse.com>
References: <20210114153803.2591-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updating an instance of Xenstore via live update needs to hand over
the command line parameters to the updated instance. Those can be
either the parameters used by the updated instance or new ones when
supplied when starting the live update.

So when supplied store the new command line parameters in lu_status.

As it is related add a new option -U (or --live-update") to the command
line of xenstored which will be added when starting the new instance.
This enables to perform slightly different initializations when
started as a result of live update.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 tools/xenstore/xenstored_control.c | 6 ++++++
 tools/xenstore/xenstored_core.c    | 7 ++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index 95ac1a1648..2e0827b9ef 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -42,6 +42,8 @@ struct live_update {
 #else
 	char *filename;
 #endif
+
+	char *cmdline;
 };
 
 static struct live_update *lu_status;
@@ -211,6 +213,10 @@ static const char *lu_cmdline(const void *ctx, struct connection *conn,
 	if (!lu_status || lu_status->conn != conn)
 		return "Not in live-update session.";
 
+	lu_status->cmdline = talloc_strdup(lu_status, cmdline);
+	if (!lu_status->cmdline)
+		return "Allocation failure.";
+
 	return NULL;
 }
 
diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index e1b92c3dc8..0dddf24327 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -1969,6 +1969,7 @@ static struct option options[] = {
 	{ "internal-db", 0, NULL, 'I' },
 	{ "verbose", 0, NULL, 'V' },
 	{ "watch-nb", 1, NULL, 'W' },
+	{ "live-update", 0, NULL, 'U' },
 	{ NULL, 0, NULL, 0 } };
 
 extern void dump_conn(struct connection *conn); 
@@ -1983,11 +1984,12 @@ int main(int argc, char *argv[])
 	bool dofork = true;
 	bool outputpid = false;
 	bool no_domain_init = false;
+	bool live_update = false;
 	const char *pidfile = NULL;
 	int timeout;
 
 
-	while ((opt = getopt_long(argc, argv, "DE:F:HNPS:t:A:M:T:RVW:", options,
+	while ((opt = getopt_long(argc, argv, "DE:F:HNPS:t:A:M:T:RVW:U", options,
 				  NULL)) != -1) {
 		switch (opt) {
 		case 'D':
@@ -2045,6 +2047,9 @@ int main(int argc, char *argv[])
 		case 'p':
 			priv_domid = strtol(optarg, NULL, 10);
 			break;
+		case 'U':
+			live_update = true;
+			break;
 		}
 	}
 	if (optind != argc)
-- 
2.26.2


