Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5ADD326459
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 15:49:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90380.171055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFeQT-0004XX-AH; Fri, 26 Feb 2021 14:49:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90380.171055; Fri, 26 Feb 2021 14:49:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFeQT-0004X8-7C; Fri, 26 Feb 2021 14:49:05 +0000
Received: by outflank-mailman (input) for mailman id 90380;
 Fri, 26 Feb 2021 14:49:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=77G0=H4=amazon.de=prvs=684d0ac3b=nmanthey@srs-us1.protection.inumbo.net>)
 id 1lFeKj-0003Af-1T
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 14:43:09 +0000
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 44022063-d5f2-4039-a073-964d796716bb;
 Fri, 26 Feb 2021 14:42:54 +0000 (UTC)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-c5104f52.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 26 Feb 2021 14:42:54 +0000
Received: from EX13D02EUB002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-2a-c5104f52.us-west-2.amazon.com (Postfix) with ESMTPS
 id 27771A1E6A; Fri, 26 Feb 2021 14:42:53 +0000 (UTC)
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX13D02EUB002.ant.amazon.com (10.43.166.170) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 26 Feb 2021 14:42:51 +0000
Received: from u6fc700a6f3c650.ant.amazon.com (10.1.212.27) by
 mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 26 Feb 2021 14:42:49 +0000
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
X-Inumbo-ID: 44022063-d5f2-4039-a073-964d796716bb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1614350575; x=1645886575;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=/ouoVhSElmsKf09bjsubId7QzwGwRxcvcchsYXzRAAQ=;
  b=ChvSllwggXCJgCv3PB5U54Aw4kKAv3fd8lbIrNiKsIl2bdAKO74kNeJx
   d5q1g9YmxdKOoZ9DLR9nnP6XVDsX9tIzGlcTXFhz27bzCUi1kkJ8tgVQl
   GGTz0il6TIHXeBaEMB+pRneCnCQsTCWF2ZPu9wYuMc08myGZJ33lIg2Ui
   E=;
X-IronPort-AV: E=Sophos;i="5.81,208,1610409600"; 
   d="scan'208";a="88504949"
From: Norbert Manthey <nmanthey@amazon.de>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Juergen Gross <jgross@suse.com>, Wei Liu
	<wl@xen.org>, Julien Grall <jgrall@amazon.co.uk>, Michael Kurth
	<mku@amazon.de>, Norbert Manthey <nmanthey@amazon.de>
Subject: [PATCH XENSTORE v1 10/10] xs: add error handling
Date: Fri, 26 Feb 2021 15:41:44 +0100
Message-ID: <20210226144144.9252-11-nmanthey@amazon.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226144144.9252-1-nmanthey@amazon.de>
References: <20210226144144.9252-1-nmanthey@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: Bulk

In case of a failure deep in the call tree, we might return NULL as the
value of the domain. In that case, error out instead of dereferencing
the NULL pointer.

This bug was discovered and resolved using Coverity Static Analysis
Security Testing (SAST) by Synopsys, Inc.

Signed-off-by: Norbert Manthey <nmanthey@amazon.de>
Reviewed-by: Julien Grall <jgrall@amazon.co.uk>
Reviewed-by: Raphael Ning <raphning@amazon.co.uk>

---
 tools/libs/store/xs.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
--- a/tools/libs/store/xs.c
+++ b/tools/libs/store/xs.c
@@ -1183,7 +1183,12 @@ bool xs_path_is_subpath(const char *parent, const char *child)
 bool xs_is_domain_introduced(struct xs_handle *h, unsigned int domid)
 {
 	char *domain = single_with_domid(h, XS_IS_DOMAIN_INTRODUCED, domid);
-	int rc = strcmp("F", domain);
+	bool rc = false;
+
+	if (!domain)
+		return rc;
+
+	rc = strcmp("F", domain) != 0;
 
 	free(domain);
 	return rc;
-- 
2.17.1




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




