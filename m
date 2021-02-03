Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A9630E026
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 17:55:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80970.148664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7LQW-0003Fq-PB; Wed, 03 Feb 2021 16:54:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80970.148664; Wed, 03 Feb 2021 16:54:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7LQW-0003FO-LH; Wed, 03 Feb 2021 16:54:48 +0000
Received: by outflank-mailman (input) for mailman id 80970;
 Wed, 03 Feb 2021 16:54:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+rCV=HF=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1l7LQV-0003Do-Lq
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 16:54:47 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 153216e8-a24f-4064-8feb-d0305b03f932;
 Wed, 03 Feb 2021 16:54:45 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 113GsiS3013800;
 Wed, 3 Feb 2021 17:54:44 +0100 (CET)
Received: from borneo.soc.lip6.fr (borneo [132.227.103.47])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 113Gsi37000552;
 Wed, 3 Feb 2021 17:54:44 +0100 (MET)
Received: by borneo.soc.lip6.fr (Postfix, from userid 373)
 id 07683AA8BB; Wed,  3 Feb 2021 17:54:44 +0100 (MET)
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
X-Inumbo-ID: 153216e8-a24f-4064-8feb-d0305b03f932
From: Manuel Bouyer <bouyer@netbsd.org>
To: xen-devel@lists.xenproject.org
Cc: Manuel Bouyer <bouyer@netbsd.org>, Ian Jackson <iwj@xenproject.org>,
        Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [PATCH] xenstored: close socket connections on error
Date: Wed,  3 Feb 2021 17:54:19 +0100
Message-Id: <20210203165421.1550-2-bouyer@netbsd.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210203165421.1550-1-bouyer@netbsd.org>
References: <20210203165421.1550-1-bouyer@netbsd.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 03 Feb 2021 17:54:44 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

On error, don't keep socket connection in ignored state but close them.
When the remote end of a socket is closed, xenstored will flag it as an
error and switch the connection to ignored. But on some OSes (e.g.
NetBSD), poll(2) will return only POLLIN in this case, so sockets in ignored
state will stay open forever in xenstored (and it will loop with CPU 100%
busy).

Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
Fixes: d2fa370d3ef9cbe22d7256c608671cdcdf6e0083
---
 tools/xenstore/xenstored_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 1ab6f162cb..0fea598352 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -1440,6 +1440,9 @@ static void ignore_connection(struct connection *conn)
 
 	talloc_free(conn->in);
 	conn->in = NULL;
+	/* if this is a socket connection, drop it now */
+	if (conn->fd >= 0)
+		talloc_free(conn);
 }
 
 static const char *sockmsg_string(enum xsd_sockmsg_type type)
-- 
2.29.2


