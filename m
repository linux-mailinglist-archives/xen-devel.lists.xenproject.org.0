Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D78D832643F
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 15:42:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90351.170960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFeK2-0003ES-4M; Fri, 26 Feb 2021 14:42:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90351.170960; Fri, 26 Feb 2021 14:42:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFeK2-0003Dx-0N; Fri, 26 Feb 2021 14:42:26 +0000
Received: by outflank-mailman (input) for mailman id 90351;
 Fri, 26 Feb 2021 14:42:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=77G0=H4=amazon.de=prvs=684d0ac3b=nmanthey@srs-us1.protection.inumbo.net>)
 id 1lFeJz-0003Af-Vl
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 14:42:24 +0000
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fd023e65-989c-4b31-9181-f9799691722c;
 Fri, 26 Feb 2021 14:42:18 +0000 (UTC)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2a-1c1b5cdd.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 26 Feb 2021 14:42:11 +0000
Received: from EX13D37EUB004.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-2a-1c1b5cdd.us-west-2.amazon.com (Postfix) with ESMTPS
 id 3C548A180F; Fri, 26 Feb 2021 14:42:10 +0000 (UTC)
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX13D37EUB004.ant.amazon.com (10.43.166.187) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 26 Feb 2021 14:42:08 +0000
Received: from u6fc700a6f3c650.ant.amazon.com (10.1.212.27) by
 mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 26 Feb 2021 14:42:06 +0000
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
X-Inumbo-ID: fd023e65-989c-4b31-9181-f9799691722c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1614350539; x=1645886539;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=sj+epzrMKHexT+eQInL0yberMRcZJMZtWGnBvr9EvEc=;
  b=jgPmjlxNqlt0FICNlzHrJi1Dedm5zhk1r+Ikn0QU1H8+OXQ1Fbc7y/tO
   u0ULtomnF746ELbdc3fieIU+tsZNiQog/UclJa3MsRRu209ka4AEj8Kyr
   /fejyC+PyxnKaUwwBYH69DS2lrmPe2gmDzuSGXEPpU236Nu8aqeHC4IHJ
   E=;
X-IronPort-AV: E=Sophos;i="5.81,208,1610409600"; 
   d="scan'208";a="91300593"
From: Norbert Manthey <nmanthey@amazon.de>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Juergen Gross <jgross@suse.com>, Wei Liu
	<wl@xen.org>, Julien Grall <jgrall@amazon.co.uk>, Michael Kurth
	<mku@amazon.de>, Norbert Manthey <nmanthey@amazon.de>
Subject: [PATCH XENSTORE v1 01/10] xenstore: add missing NULL check
Date: Fri, 26 Feb 2021 15:41:35 +0100
Message-ID: <20210226144144.9252-2-nmanthey@amazon.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226144144.9252-1-nmanthey@amazon.de>
References: <20210226144144.9252-1-nmanthey@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: Bulk

In case of allocation error, we should not dereference the obtained
NULL pointer. Hence, fail early.

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
@@ -1818,6 +1818,10 @@ static int check_store_(const char *name, struct hashtable *reachable)
 
 		struct hashtable * children =
 			create_hashtable(16, hash_from_key_fn, keys_equal_fn);
+		if (!children) {
+			log("check_store create table: ENOMEM");
+			return ENOMEM;
+		}
 
 		if (!remember_string(reachable, name)) {
 			hashtable_destroy(children, 0);
-- 
2.17.1




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




