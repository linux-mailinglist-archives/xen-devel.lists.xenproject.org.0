Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BB930D926
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 12:49:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80888.148296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7GeE-0003O3-6D; Wed, 03 Feb 2021 11:48:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80888.148296; Wed, 03 Feb 2021 11:48:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7GeE-0003Ni-32; Wed, 03 Feb 2021 11:48:38 +0000
Received: by outflank-mailman (input) for mailman id 80888;
 Wed, 03 Feb 2021 11:48:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3m8k=HF=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1l7GeC-0003Nd-0E
 for xen-devel@lists.xen.org; Wed, 03 Feb 2021 11:48:36 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9a4c9ca2-3f2a-4598-9f7b-ab8122802911;
 Wed, 03 Feb 2021 11:48:34 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne
 [IPv6:2001:41d0:fe9d:1100:221:70ff:fe0c:9885])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 113BmWBO026723;
 Wed, 3 Feb 2021 12:48:32 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 8CD48281D; Wed,  3 Feb 2021 12:48:32 +0100 (CET)
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
X-Inumbo-ID: 9a4c9ca2-3f2a-4598-9f7b-ab8122802911
Date: Wed, 3 Feb 2021 12:48:32 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: xen-devel@lists.xen.org
Subject: Re: xenstored file descriptor leak
Message-ID: <20210203114832.GA1549@antioche.eu.org>
References: <20210202183735.GA25046@mail.soc.lip6.fr>
 <b6ed10d4-7976-6a61-434d-35e467763deb@suse.com>
 <20210203075721.GB445@antioche.eu.org>
 <7768ff4b-837d-965b-61c7-b6794f677d9e@suse.com>
 <20210203081621.GD445@antioche.eu.org>
 <89ddaac0-eb05-8ddb-465a-60d78e4009eb@suse.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="liOOAslEiF7prFVr"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <89ddaac0-eb05-8ddb-465a-60d78e4009eb@suse.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [IPv6:2001:41d0:fe9d:1100:a00:20ff:fe1c:276e]); Wed, 03 Feb 2021 12:48:32 +0100 (MET)


--liOOAslEiF7prFVr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Feb 03, 2021 at 09:21:32AM +0100, Jürgen Groß wrote:
> [...]
> This shouldn't happen in case we are closing the socket actively.
> 
> In the end we should just do a talloc_free(conn) in
> ignore_connection() if it is a socket based one. This should revert
> the critical modification of the XSA-115 fixes for sockets while
> keeping the desired effect for domain connections.

Hello
here's an updated patch which works for me. Does anyone see a problem
with it ? If not I will submit it for commit.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

--liOOAslEiF7prFVr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="xenstored_core.diff"

--- xenstored_core.c.orig	2021-02-02 18:06:33.389316841 +0100
+++ xenstored_core.c	2021-02-03 12:46:17.204376338 +0100
@@ -397,9 +397,12 @@
 			     !list_empty(&conn->out_list)))
 				*ptimeout = 0;
 		} else {
-			short events = POLLIN|POLLPRI;
-			if (!list_empty(&conn->out_list))
-				events |= POLLOUT;
+			short events = 0;
+			if (!conn->is_ignored) {
+				events |= POLLIN|POLLPRI;
+			        if (!list_empty(&conn->out_list))
+				        events |= POLLOUT;
+			}
 			conn->pollfd_idx = set_fd(conn->fd, events);
 		}
 	}
@@ -1440,6 +1443,9 @@
 
 	talloc_free(conn->in);
 	conn->in = NULL;
+	/* if this is a socket connection, drop it now */
+	if (conn->fd >= 0)
+		talloc_free(conn);
 }
 
 static const char *sockmsg_string(enum xsd_sockmsg_type type)

--liOOAslEiF7prFVr--

