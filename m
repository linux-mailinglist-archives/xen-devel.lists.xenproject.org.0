Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3469632643C
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 15:42:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90350.170947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFeJw-0003BQ-RC; Fri, 26 Feb 2021 14:42:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90350.170947; Fri, 26 Feb 2021 14:42:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFeJw-0003B0-O6; Fri, 26 Feb 2021 14:42:20 +0000
Received: by outflank-mailman (input) for mailman id 90350;
 Fri, 26 Feb 2021 14:42:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=77G0=H4=amazon.de=prvs=684d0ac3b=nmanthey@srs-us1.protection.inumbo.net>)
 id 1lFeJv-0003Af-6K
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 14:42:19 +0000
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 544f7879-e262-4601-8e9d-32a2530603a7;
 Fri, 26 Feb 2021 14:42:18 +0000 (UTC)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2b-4e24fd92.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 26 Feb 2021 14:42:15 +0000
Received: from EX13D37EUA004.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-2b-4e24fd92.us-west-2.amazon.com (Postfix) with ESMTPS
 id A0F63A245E; Fri, 26 Feb 2021 14:42:13 +0000 (UTC)
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX13D37EUA004.ant.amazon.com (10.43.165.124) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 26 Feb 2021 14:42:11 +0000
Received: from u6fc700a6f3c650.ant.amazon.com (10.1.212.27) by
 mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 26 Feb 2021 14:42:09 +0000
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
X-Inumbo-ID: 544f7879-e262-4601-8e9d-32a2530603a7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1614350538; x=1645886538;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=z/DnOJlIa9cXjD7A0d8As04PDDD4dbiymrcM3U2q7us=;
  b=Xe+NLs7N90CvzPGfZD8LqZo0L0ttXEi1LaXREJgMw7QtYBvvAwR80Nlp
   dRH8DetfBcXHcyW650gqM0Nt1Qeo3KnbeZ3zavde2RFD7e+tyQtTTfQfe
   zOZT6/E5EjcHvnKuQG86Zyt0blWN+DT+gOe0SaQhV/wkvJF50yoOFIaV4
   E=;
X-IronPort-AV: E=Sophos;i="5.81,208,1610409600"; 
   d="scan'208";a="91300630"
From: Norbert Manthey <nmanthey@amazon.de>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Juergen Gross <jgross@suse.com>, Wei Liu
	<wl@xen.org>, Julien Grall <jgrall@amazon.co.uk>, Michael Kurth
	<mku@amazon.de>, Norbert Manthey <nmanthey@amazon.de>
Subject: [PATCH XENSTORE v1 02/10] xenstore: fix print format string
Date: Fri, 26 Feb 2021 15:41:36 +0100
Message-ID: <20210226144144.9252-3-nmanthey@amazon.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226144144.9252-1-nmanthey@amazon.de>
References: <20210226144144.9252-1-nmanthey@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: Bulk

Use the correct format specifier for unsigned values. Additionally, a
cast was dropped, as the format specifier did not require it anymore.

This was reported by analysis with cppcheck.

Signed-off-by: Norbert Manthey <nmanthey@amazon.de>
Reviewed-by: Thomas Friebel <friebelt@amazon.de>
Reviewed-by: Julien Grall <jgrall@amazon.co.uk>

---
 tools/xenstore/xs_tdb_dump.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/xenstore/xs_tdb_dump.c b/tools/xenstore/xs_tdb_dump.c
--- a/tools/xenstore/xs_tdb_dump.c
+++ b/tools/xenstore/xs_tdb_dump.c
@@ -59,8 +59,8 @@ int main(int argc, char *argv[])
 			fprintf(stderr, "%.*s: BAD truncated\n",
 				(int)key.dsize, key.dptr);
 		else if (data.dsize != total_size(hdr))
-			fprintf(stderr, "%.*s: BAD length %i for %i/%i/%i (%i)\n",
-				(int)key.dsize, key.dptr, (int)data.dsize,
+			fprintf(stderr, "%.*s: BAD length %zu for %u/%u/%u (%u)\n",
+				(int)key.dsize, key.dptr, data.dsize,
 				hdr->num_perms, hdr->datalen,
 				hdr->childlen, total_size(hdr));
 		else {
@@ -69,7 +69,7 @@ int main(int argc, char *argv[])
 
 			printf("%.*s: ", (int)key.dsize, key.dptr);
 			for (i = 0; i < hdr->num_perms; i++)
-				printf("%s%c%i",
+				printf("%s%c%u",
 				       i == 0 ? "" : ",",
 				       perm_to_char(hdr->perms[i].perms),
 				       hdr->perms[i].id);
-- 
2.17.1




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




