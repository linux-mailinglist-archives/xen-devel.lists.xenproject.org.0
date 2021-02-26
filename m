Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F41326446
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 15:43:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90364.171044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFeKa-0003rK-M6; Fri, 26 Feb 2021 14:43:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90364.171044; Fri, 26 Feb 2021 14:43:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFeKa-0003qf-IQ; Fri, 26 Feb 2021 14:43:00 +0000
Received: by outflank-mailman (input) for mailman id 90364;
 Fri, 26 Feb 2021 14:42:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=77G0=H4=amazon.de=prvs=684d0ac3b=nmanthey@srs-us1.protection.inumbo.net>)
 id 1lFeKZ-0003Af-18
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 14:42:59 +0000
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ad3255a7-ceb8-4214-be52-043c296c2896;
 Fri, 26 Feb 2021 14:42:50 +0000 (UTC)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2b-c7131dcf.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 26 Feb 2021 14:42:49 +0000
Received: from EX13D37EUB002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-2b-c7131dcf.us-west-2.amazon.com (Postfix) with ESMTPS
 id EFEB6A21B1; Fri, 26 Feb 2021 14:42:48 +0000 (UTC)
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX13D37EUB002.ant.amazon.com (10.43.166.116) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 26 Feb 2021 14:42:47 +0000
Received: from u6fc700a6f3c650.ant.amazon.com (10.1.212.27) by
 mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 26 Feb 2021 14:42:44 +0000
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
X-Inumbo-ID: ad3255a7-ceb8-4214-be52-043c296c2896
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1614350570; x=1645886570;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=PoZZTY1JhoFNyUyWnPJ+qOgbzP4vOc+deh5S5ccFoAU=;
  b=al+WrVrFP/kMmEXS4N8LI45roAMxWvIcXsaBwsmFjrjToHum7nK8uxO8
   7dPrZL1kfZkokl91OxBa7ts8XldulN7HkFzpxau+rDuKrcjAvkkILoNKJ
   gGlttY6/iKAcJlgFUMZicPgtyJ+UEiohRTlWJc+5zmbg2sef18GYV88Nn
   c=;
X-IronPort-AV: E=Sophos;i="5.81,208,1610409600"; 
   d="scan'208";a="92741617"
From: Norbert Manthey <nmanthey@amazon.de>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Juergen Gross <jgross@suse.com>, Wei Liu
	<wl@xen.org>, Julien Grall <jgrall@amazon.co.uk>, Michael Kurth
	<mku@amazon.de>, Norbert Manthey <nmanthey@amazon.de>
Subject: [PATCH XENSTORE v1 09/10] xs: handle daemon socket error
Date: Fri, 26 Feb 2021 15:41:43 +0100
Message-ID: <20210226144144.9252-10-nmanthey@amazon.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226144144.9252-1-nmanthey@amazon.de>
References: <20210226144144.9252-1-nmanthey@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: Bulk

When starting the daemon, we might see a NULL pointer instead of the
path to the socket.

Only relevant in case we start the process in a very deep directory
path, with a length close to 4096 so that appending "/socket" would
exceed the limit. Hence, such an error is unlikely, but should still be
fixed to not result in a NULL pointer dereference.

This bug was discovered and resolved using Coverity Static Analysis
Security Testing (SAST) by Synopsys, Inc.

Signed-off-by: Norbert Manthey <nmanthey@amazon.de>
Reviewed-by: Thomas Friebel <friebelt@amazon.de>
Reviewed-by: Julien Grall <jgrall@amazon.co.uk>

---
 tools/libs/store/xs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
--- a/tools/libs/store/xs.c
+++ b/tools/libs/store/xs.c
@@ -240,6 +240,9 @@ static struct xs_handle *get_handle(const char *connect_to)
 	struct xs_handle *h = NULL;
 	int saved_errno;
 
+	if (!connect_to)
+		return NULL;
+
 	h = malloc(sizeof(*h));
 	if (h == NULL)
 		goto err;
-- 
2.17.1




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




