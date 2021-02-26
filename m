Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A801326443
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 15:42:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90352.170972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFeK7-0003J8-I6; Fri, 26 Feb 2021 14:42:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90352.170972; Fri, 26 Feb 2021 14:42:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFeK7-0003IU-Ad; Fri, 26 Feb 2021 14:42:31 +0000
Received: by outflank-mailman (input) for mailman id 90352;
 Fri, 26 Feb 2021 14:42:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=77G0=H4=amazon.de=prvs=684d0ac3b=nmanthey@srs-us1.protection.inumbo.net>)
 id 1lFeK4-0003Af-W5
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 14:42:29 +0000
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4c304731-8eb6-43a7-9e85-74d2e28eb149;
 Fri, 26 Feb 2021 14:42:19 +0000 (UTC)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2a-e7be2041.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 26 Feb 2021 14:42:18 +0000
Received: from EX13D37EUB001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-2a-e7be2041.us-west-2.amazon.com (Postfix) with ESMTPS
 id 75A1AA2428; Fri, 26 Feb 2021 14:42:17 +0000 (UTC)
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX13D37EUB001.ant.amazon.com (10.43.166.31) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 26 Feb 2021 14:42:15 +0000
Received: from u6fc700a6f3c650.ant.amazon.com (10.1.212.27) by
 mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 26 Feb 2021 14:42:13 +0000
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
X-Inumbo-ID: 4c304731-8eb6-43a7-9e85-74d2e28eb149
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1614350539; x=1645886539;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=a4CF3aP7V8BLgQT8wGjqFYA8omaY5bulrWv/CPPvqmk=;
  b=unrra1cdH1zvPCzI6P0P2cMWPp73xYGqhDhfSN50qex9j4IFOCS0Lwi6
   7ROdkwS8YMYBO0yFlQ5lb/VgLu9FyCQwWOwP+HCeEQbOchSbmDa/wb6V0
   aigyb4u0o3N9p8123l9AumFW14+gtPwbn1DjRhuPhKUfMRa4UPaEyT1Y0
   4=;
X-IronPort-AV: E=Sophos;i="5.81,208,1610409600"; 
   d="scan'208";a="91300657"
From: Norbert Manthey <nmanthey@amazon.de>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Juergen Gross <jgross@suse.com>, Wei Liu
	<wl@xen.org>, Julien Grall <jgrall@amazon.co.uk>, Michael Kurth
	<mku@amazon.de>, Norbert Manthey <nmanthey@amazon.de>
Subject: [PATCH XENSTORE v1 03/10] xenstore: check formats of trace
Date: Fri, 26 Feb 2021 15:41:37 +0100
Message-ID: <20210226144144.9252-4-nmanthey@amazon.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226144144.9252-1-nmanthey@amazon.de>
References: <20210226144144.9252-1-nmanthey@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: Bulk

When passing format strings to the trace function, allow gcc to analyze
those and warn on issues.

Signed-off-by: Norbert Manthey <nmanthey@amazon.de>
Reviewed-by: Thomas Friebel <friebelt@amazon.de>
Reviewed-by: Julien Grall <jgrall@amazon.co.uk>

---
 tools/xenstore/xenstored_core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -217,7 +217,7 @@ int delay_request(struct connection *conn, struct buffered_data *in,
 /* Tracing infrastructure. */
 void trace_create(const void *data, const char *type);
 void trace_destroy(const void *data, const char *type);
-void trace(const char *fmt, ...);
+void trace(const char *fmt, ...) __attribute__ ((format (printf, 1, 2)));
 void dtrace_io(const struct connection *conn, const struct buffered_data *data, int out);
 void reopen_log(void);
 void close_log(void);
-- 
2.17.1




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




