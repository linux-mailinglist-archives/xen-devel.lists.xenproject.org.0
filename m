Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DA330C9FD
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 19:38:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80692.147785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l70YY-0006Jm-E0; Tue, 02 Feb 2021 18:37:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80692.147785; Tue, 02 Feb 2021 18:37:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l70YY-0006JN-Ab; Tue, 02 Feb 2021 18:37:42 +0000
Received: by outflank-mailman (input) for mailman id 80692;
 Tue, 02 Feb 2021 18:37:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eq/0=HE=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1l70YW-0006JI-At
 for xen-devel@lists.xen.org; Tue, 02 Feb 2021 18:37:40 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c3b8160-42e0-4667-b88a-7629e24dddfd;
 Tue, 02 Feb 2021 18:37:38 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 112Ibaqt002576
 for <xen-devel@lists.xen.org>; Tue, 2 Feb 2021 19:37:36 +0100 (CET)
Received: from armandeche.soc.lip6.fr (armandeche [132.227.63.133])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 112IbaKq013885
 for <xen-devel@lists.xen.org>; Tue, 2 Feb 2021 19:37:36 +0100 (MET)
Received: by armandeche.soc.lip6.fr (Postfix, from userid 20331)
 id 00A467120; Tue,  2 Feb 2021 19:37:35 +0100 (MET)
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
X-Inumbo-ID: 2c3b8160-42e0-4667-b88a-7629e24dddfd
Date: Tue, 2 Feb 2021 19:37:35 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: xen-devel@lists.xen.org
Subject: xenstored file descriptor leak
Message-ID: <20210202183735.GA25046@mail.soc.lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 02 Feb 2021 19:37:36 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

Hello,
on NetBSD I'm tracking down an issue where xenstored never closes its
file descriptor to /var/run/xenstored/socket and instead loops at 100%
CPU on these descriptors.

xenstored loops because poll(2) returns a POLLIN event for these
descriptors but they are marked is_ignored = true. 

I'm seeing this with xen 4.15, 4.13 and has also been reported with 4.11
with latest security patches.
It seems to have started with patches for XSA-115 (A user reported this
for 4.11)

I've tracked it down to a difference in poll(2) implementation; it seems
that linux will return something that is not (POLLIN|POLLOUT) when a
socket if closed; while NetBSD returns POLLIN (this matches the NetBSD's
man page).

First I think there may be a security issue here, as, even on linux it should
be possible for a client to cause a socket to go to the is_ignored state,
while still sending data and cause xenstored to go to a 100% CPU loop.
I think this is needed anyway:

--- xenstored_core.c.orig	2021-02-02 18:06:33.389316841 +0100
+++ xenstored_core.c	2021-02-02 19:27:43.761877371 +0100
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

Now I wonder if, on NetBSD at last, a read error or short read shouldn't
cause the socket to be closed, as with:

@@ -1561,6 +1565,8 @@
 
 bad_client:
 	ignore_connection(conn);
+	/* we don't want to keep this connection alive */
+	talloc_free(conn);
 }
 
 static void handle_output(struct connection *conn)


what do you think ?

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

