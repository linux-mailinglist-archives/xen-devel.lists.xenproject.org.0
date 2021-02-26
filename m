Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66292326445
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 15:43:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90362.171032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFeKV-0003mP-CU; Fri, 26 Feb 2021 14:42:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90362.171032; Fri, 26 Feb 2021 14:42:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFeKV-0003lo-8n; Fri, 26 Feb 2021 14:42:55 +0000
Received: by outflank-mailman (input) for mailman id 90362;
 Fri, 26 Feb 2021 14:42:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=77G0=H4=amazon.de=prvs=684d0ac3b=nmanthey@srs-us1.protection.inumbo.net>)
 id 1lFeKU-0003Af-1D
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 14:42:54 +0000
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b9e2aa11-92ed-4c6f-b463-3924e0fdbdee;
 Fri, 26 Feb 2021 14:42:47 +0000 (UTC)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2b-c7131dcf.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 26 Feb 2021 14:42:46 +0000
Received: from EX13D02EUB002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-2b-c7131dcf.us-west-2.amazon.com (Postfix) with ESMTPS
 id 254A4A1D59; Fri, 26 Feb 2021 14:42:45 +0000 (UTC)
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX13D02EUB002.ant.amazon.com (10.43.166.170) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 26 Feb 2021 14:42:43 +0000
Received: from u6fc700a6f3c650.ant.amazon.com (10.1.212.27) by
 mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 26 Feb 2021 14:42:40 +0000
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
X-Inumbo-ID: b9e2aa11-92ed-4c6f-b463-3924e0fdbdee
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1614350568; x=1645886568;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=INzRJ60EoL7cehlQhV+bX6hPIdepzG7ggFncfF3yBWA=;
  b=Q2MvJYJ6F2Rgl/e/N4BzVypB4Rm1SE1WMv+cTc39BxFizlRpfAtIAUKq
   tnR+ktRY2QBXgH6valgWP/gTOQHG4EYeIcP2QoQ+rNg/+XKesGiBNdmas
   OQWFgG0hc7fvHlYv4mQqvJ2CT00qHaqr+h/RBtJezb9Ch2ngWChJEP9th
   8=;
X-IronPort-AV: E=Sophos;i="5.81,208,1610409600"; 
   d="scan'208";a="88628276"
From: Norbert Manthey <nmanthey@amazon.de>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Juergen Gross <jgross@suse.com>, Wei Liu
	<wl@xen.org>, Julien Grall <jgrall@amazon.co.uk>, Michael Kurth
	<mku@amazon.de>, Michael Kurth <mku@amazon.com>, Norbert Manthey
	<nmanthey@amazon.de>
Subject: [PATCH XENSTORE v1 08/10] xenstore: add missing NULL check
Date: Fri, 26 Feb 2021 15:41:42 +0100
Message-ID: <20210226144144.9252-9-nmanthey@amazon.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226144144.9252-1-nmanthey@amazon.de>
References: <20210226144144.9252-1-nmanthey@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: Bulk

From: Michael Kurth <mku@amazon.com>

In case of allocation error, we should not dereference the obtained
NULL pointer.

This bug was discovered and resolved using Coverity Static Analysis
Security Testing (SAST) by Synopsys, Inc.

Signed-off-by: Michael Kurth <mku@amazon.com>
Signed-off-by: Norbert Manthey <nmanthey@amazon.de>
Reviewed-by: Thomas Friebel <friebelt@amazon.de>
Reviewed-by: Julien Grall <jgrall@amazon.co.uk>

---
 tools/xenstore/xenstored_core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -504,6 +504,11 @@ int write_node_raw(struct connection *conn, TDB_DATA *key, struct node *node,
 	}
 
 	data.dptr = talloc_size(node, data.dsize);
+	if (!data.dptr) {
+		errno = ENOMEM;
+		return errno;
+	}
+
 	hdr = (void *)data.dptr;
 	hdr->generation = node->generation;
 	hdr->num_perms = node->perms.num;
-- 
2.17.1




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




