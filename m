Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3734932643D
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 15:42:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90357.171019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFeKM-0003cH-2u; Fri, 26 Feb 2021 14:42:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90357.171019; Fri, 26 Feb 2021 14:42:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFeKL-0003bb-Tz; Fri, 26 Feb 2021 14:42:45 +0000
Received: by outflank-mailman (input) for mailman id 90357;
 Fri, 26 Feb 2021 14:42:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=77G0=H4=amazon.de=prvs=684d0ac3b=nmanthey@srs-us1.protection.inumbo.net>)
 id 1lFeKK-0003Af-0e
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 14:42:44 +0000
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 332821f5-e44f-486c-9617-573c982777f0;
 Fri, 26 Feb 2021 14:42:42 +0000 (UTC)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2a-1c1b5cdd.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 26 Feb 2021 14:42:42 +0000
Received: from EX13D02EUB003.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-2a-1c1b5cdd.us-west-2.amazon.com (Postfix) with ESMTPS
 id 4D6FEA17CD; Fri, 26 Feb 2021 14:42:41 +0000 (UTC)
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX13D02EUB003.ant.amazon.com (10.43.166.172) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 26 Feb 2021 14:42:39 +0000
Received: from u6fc700a6f3c650.ant.amazon.com (10.1.212.27) by
 mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 26 Feb 2021 14:42:37 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 332821f5-e44f-486c-9617-573c982777f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1614350562; x=1645886562;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=waHFe5N5zD0cDJXNQ231nyWcAqRV9zOpFqGCBH9GqNQ=;
  b=qldJzvdj2I8bgEtNmUiBlNlXySANiaIgWRBf7zMTb8fVaV6EwaaB4bzK
   s/d2RASTOM5yGZ2RVD5+W36P5rjyzowJEIbApRjO2JfVVMnotjyrU3OPK
   H+OeJPsMYpCF2f+aMYlvqtT9XBbvrPiBQVXP6O7SoQwPBBu6Vlyg3vNQL
   c=;
X-IronPort-AV: E=Sophos;i="5.81,208,1610409600"; 
   d="scan'208";a="92741519"
From: Norbert Manthey <nmanthey@amazon.de>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Juergen Gross <jgross@suse.com>, Wei Liu
	<wl@xen.org>, Julien Grall <jgrall@amazon.co.uk>, Michael Kurth
	<mku@amazon.de>, Norbert Manthey <nmanthey@amazon.de>
Subject: [PATCH XENSTORE v1 07/10] xenstore: handle do_mkdir and do_rm failure
Date: Fri, 26 Feb 2021 15:41:41 +0100
Message-ID: <20210226144144.9252-8-nmanthey@amazon.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226144144.9252-1-nmanthey@amazon.de>
References: <20210226144144.9252-1-nmanthey@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: Bulk

In the out of memory case, we might return a NULL pointer when
canonicalizing node names. This NULL pointer is not checked when
creating a directory, or when removing a node. This change handles
the NULL pointer for these two cases.

This bug was discovered and resolved using Coverity Static Analysis
Security Testing (SAST) by Synopsys, Inc.

Signed-off-by: Norbert Manthey <nmanthey@amazon.de>
Reviewed-by: Thomas Friebel <friebelt@amazon.de>
Reviewed-by: Julien Grall <jgrall@amazon.co.uk>

---
 tools/xenstore/xenstored_core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -1160,6 +1160,8 @@ static int do_mkdir(struct connection *conn, struct buffered_data *in)
 		/* No permissions? */
 		if (errno != ENOENT)
 			return errno;
+		if (!name)
+			return ENOMEM;
 		node = create_node(conn, in, name, NULL, 0);
 		if (!node)
 			return errno;
@@ -1274,6 +1276,8 @@ static int do_rm(struct connection *conn, struct buffered_data *in)
 	if (!node) {
 		/* Didn't exist already?  Fine, if parent exists. */
 		if (errno == ENOENT) {
+			if (!name)
+				return ENOMEM;
 			parentname = get_parent(in, name);
 			if (!parentname)
 				return errno;
-- 
2.17.1




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




