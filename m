Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F42326442
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 15:42:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90353.170982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFeK7-0003KU-VI; Fri, 26 Feb 2021 14:42:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90353.170982; Fri, 26 Feb 2021 14:42:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFeK7-0003JA-P6; Fri, 26 Feb 2021 14:42:31 +0000
Received: by outflank-mailman (input) for mailman id 90353;
 Fri, 26 Feb 2021 14:42:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=77G0=H4=amazon.de=prvs=684d0ac3b=nmanthey@srs-us1.protection.inumbo.net>)
 id 1lFeK5-0003Hj-Sq
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 14:42:29 +0000
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b51fa24-5831-4103-8c14-4e9df781b30f;
 Fri, 26 Feb 2021 14:42:29 +0000 (UTC)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2c-2225282c.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 26 Feb 2021 14:42:22 +0000
Received: from EX13D37EUA002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-2c-2225282c.us-west-2.amazon.com (Postfix) with ESMTPS
 id 1A2F2A07DC; Fri, 26 Feb 2021 14:42:21 +0000 (UTC)
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX13D37EUA002.ant.amazon.com (10.43.165.200) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 26 Feb 2021 14:42:19 +0000
Received: from u6fc700a6f3c650.ant.amazon.com (10.1.212.27) by
 mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 26 Feb 2021 14:42:17 +0000
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
X-Inumbo-ID: 2b51fa24-5831-4103-8c14-4e9df781b30f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1614350549; x=1645886549;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=ufqPi5XZ73oaK8Z3Lj+n3A5UsFVL/yuIxs1VZVOClrA=;
  b=ej8KE68Muqi19IZucueYR8pAS6Ex1Aq9/uUtE3nzc5gd2ez1E1IGB4VZ
   EvYgeEH067YjdNl4pwCP4MCVfVX54UcU0qAHjsoJYPiyTuMR6TySJYmQB
   hYLIoKvleBGeC35Otj9kz9nsmCE1X57cgXMv/wYZtKCNDwQ5zueEShrQf
   c=;
X-IronPort-AV: E=Sophos;i="5.81,208,1610409600"; 
   d="scan'208";a="92741411"
From: Norbert Manthey <nmanthey@amazon.de>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Juergen Gross <jgross@suse.com>, Wei Liu
	<wl@xen.org>, Julien Grall <jgrall@amazon.co.uk>, Michael Kurth
	<mku@amazon.de>, Norbert Manthey <nmanthey@amazon.de>
Subject: [PATCH XENSTORE v1 04/10] xenstore_client: handle memory on error
Date: Fri, 26 Feb 2021 15:41:38 +0100
Message-ID: <20210226144144.9252-5-nmanthey@amazon.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226144144.9252-1-nmanthey@amazon.de>
References: <20210226144144.9252-1-nmanthey@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: Bulk

In case a command fails, also free the memory. As this is for the CLI
client, currently the leaked memory is freed right after receiving the
error, as the application terminates next.

Similarly, if the allocation fails, do not use the NULL pointer
afterwards, but instead error out.

This bug was discovered and resolved using Coverity Static Analysis
Security Testing (SAST) by Synopsys, Inc.

Signed-off-by: Norbert Manthey <nmanthey@amazon.de>
Reviewed-by: Thomas Friebel <friebelt@amazon.de>
Reviewed-by: Julien Grall <jgrall@amazon.co.uk>

---
 tools/xenstore/xenstore_client.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/xenstore/xenstore_client.c b/tools/xenstore/xenstore_client.c
--- a/tools/xenstore/xenstore_client.c
+++ b/tools/xenstore/xenstore_client.c
@@ -382,11 +382,14 @@ perform(enum mode mode, int optind, int argc, char **argv, struct xs_handle *xsh
                 /* Copy path, because we can't modify argv because we will need it
                    again if xs_transaction_end gives us EAGAIN. */
                 char *p = malloc(strlen(path) + 1);
+                if (!p)
+                    return 1;
                 strcpy(p, path);
                 path = p;
 
             again:
                 if (do_rm(path, xsh, xth)) {
+                    free(path);
                     return 1;
                 }
 
-- 
2.17.1




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




