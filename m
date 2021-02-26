Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7002532643E
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 15:42:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90354.170996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFeKC-0003QI-AC; Fri, 26 Feb 2021 14:42:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90354.170996; Fri, 26 Feb 2021 14:42:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFeKC-0003PN-2g; Fri, 26 Feb 2021 14:42:36 +0000
Received: by outflank-mailman (input) for mailman id 90354;
 Fri, 26 Feb 2021 14:42:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=77G0=H4=amazon.de=prvs=684d0ac3b=nmanthey@srs-us1.protection.inumbo.net>)
 id 1lFeK9-0003Af-WF
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 14:42:34 +0000
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2894b2c9-2b51-40ed-9e89-1632ac5f3a26;
 Fri, 26 Feb 2021 14:42:33 +0000 (UTC)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-16425a8d.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 26 Feb 2021 14:42:25 +0000
Received: from EX13D02EUB004.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-1d-16425a8d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 12398100C47; Fri, 26 Feb 2021 14:42:24 +0000 (UTC)
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX13D02EUB004.ant.amazon.com (10.43.166.221) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 26 Feb 2021 14:42:22 +0000
Received: from u6fc700a6f3c650.ant.amazon.com (10.1.212.27) by
 mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 26 Feb 2021 14:42:20 +0000
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
X-Inumbo-ID: 2894b2c9-2b51-40ed-9e89-1632ac5f3a26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1614350553; x=1645886553;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=aupOUlFlXdRu4KMtyn+0J4vkXjNtTUzjaeSxjmikpeI=;
  b=GlBHrEWZnEBl7CZdRlCi/dpGEnXRCr3W49Sr1Q+fcVKrwc3SiVTmdbqs
   8sBRbLbYPYv5VbC11GhmEhLN/0NKTHrnlp+FcFc5UxzUXJzWjX4rbWwKw
   yzsHP60SQ0dOKc1lP59qbFv4IMRU8qSd9QMQVC6BKZtshvLqowTz1Lclh
   8=;
X-IronPort-AV: E=Sophos;i="5.81,208,1610409600"; 
   d="scan'208";a="88504713"
From: Norbert Manthey <nmanthey@amazon.de>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Juergen Gross <jgross@suse.com>, Wei Liu
	<wl@xen.org>, Julien Grall <jgrall@amazon.co.uk>, Michael Kurth
	<mku@amazon.de>, Norbert Manthey <nmanthey@amazon.de>
Subject: [PATCH XENSTORE v1 05/10] xenstore: handle daemon creation errors
Date: Fri, 26 Feb 2021 15:41:39 +0100
Message-ID: <20210226144144.9252-6-nmanthey@amazon.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226144144.9252-1-nmanthey@amazon.de>
References: <20210226144144.9252-1-nmanthey@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: Bulk

In rare cases, the path to the daemon socket cannot be created as it is
longer than PATH_MAX. Instead of failing with a NULL pointer dereference,
terminate the application with an error message.

This bug was discovered and resolved using Coverity Static Analysis
Security Testing (SAST) by Synopsys, Inc.

Signed-off-by: Norbert Manthey <nmanthey@amazon.de>
Reviewed-by: Thomas Friebel <friebelt@amazon.de>
Reviewed-by: Julien Grall <jgrall@amazon.co.uk>

---
 tools/xenstore/xenstored_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -1996,6 +1996,9 @@ static void init_sockets(void)
 	struct sockaddr_un addr;
 	const char *soc_str = xs_daemon_socket();
 
+	if (!soc_str)
+		barf_perror("Failed to obtain xs domain socket");
+
 	/* Create sockets for them to listen to. */
 	atexit(destroy_fds);
 	sock = socket(PF_UNIX, SOCK_STREAM, 0);
-- 
2.17.1




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




