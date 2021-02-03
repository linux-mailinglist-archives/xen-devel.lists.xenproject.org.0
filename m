Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 294D130D9D7
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 13:33:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80911.148398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7HLQ-0000bl-UE; Wed, 03 Feb 2021 12:33:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80911.148398; Wed, 03 Feb 2021 12:33:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7HLQ-0000bM-R7; Wed, 03 Feb 2021 12:33:16 +0000
Received: by outflank-mailman (input) for mailman id 80911;
 Wed, 03 Feb 2021 12:33:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3m8k=HF=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1l7HLP-0000bH-3Z
 for xen-devel@lists.xen.org; Wed, 03 Feb 2021 12:33:15 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9b429eff-50ba-4fc9-8e6f-edfafd693c2b;
 Wed, 03 Feb 2021 12:33:13 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne
 [IPv6:2001:41d0:fe9d:1100:221:70ff:fe0c:9885])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 113CXC52000249;
 Wed, 3 Feb 2021 13:33:12 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 229AB281D; Wed,  3 Feb 2021 13:33:12 +0100 (CET)
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
X-Inumbo-ID: 9b429eff-50ba-4fc9-8e6f-edfafd693c2b
Date: Wed, 3 Feb 2021 13:33:12 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: xen-devel@lists.xen.org
Subject: Re: xenstored file descriptor leak
Message-ID: <20210203123312.GA2906@antioche.eu.org>
References: <20210203075721.GB445@antioche.eu.org>
 <7768ff4b-837d-965b-61c7-b6794f677d9e@suse.com>
 <20210203081621.GD445@antioche.eu.org>
 <89ddaac0-eb05-8ddb-465a-60d78e4009eb@suse.com>
 <20210203114832.GA1549@antioche.eu.org>
 <73c0dd26-d3a5-221f-84b8-06055ee62889@suse.com>
 <20210203120336.GA2511@antioche.eu.org>
 <8e4f159a-9519-3576-8f6b-3800a0e84500@suse.com>
 <20210203121738.GA2610@antioche.eu.org>
 <cbf97615-a81e-4a5d-6cc2-ce3b850ed2f5@suse.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="d6Gm4EdcadzBjdND"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cbf97615-a81e-4a5d-6cc2-ce3b850ed2f5@suse.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [IPv6:2001:41d0:fe9d:1100:a00:20ff:fe1c:276e]); Wed, 03 Feb 2021 13:33:12 +0100 (MET)


--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Feb 03, 2021 at 01:21:59PM +0100, Jürgen Groß wrote:
> > Will do
> > 
> > In the patch I'm going to submit, may I add
> > 
> > Reviewed-by: Jürgen Groß <jgross@suse.com>
> > ?
> > 
> 
> Let me see the patch (including commit message) first, please.
> 
> So just send out as a regular patch, and I'll respond accordingly. :-)

Attached is the new patch.

As commit message I suggest:

xenstored: close socket connections on error

On error, don't keep socket connection in ignored state but close them.
When the remote end of a socket is closed, xenstored will flag it as an
error and switch the connection to ignored. But on some OSes (e.g.
NetBSD), poll(2) will return only POLLIN in this case, so sockets in ignored
state will stay open forever in xenstored (and it will loop with CPU 100%
busy).

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="xenstored_core.diff"

--- xenstored_core.c.orig	2021-02-03 13:25:38.568308454 +0100
+++ xenstored_core.c	2021-02-03 13:25:44.282429872 +0100
@@ -1440,6 +1440,9 @@
 
 	talloc_free(conn->in);
 	conn->in = NULL;
+	/* if this is a socket connection, drop it now */
+	if (conn->fd >= 0)
+		talloc_free(conn);
 }
 
 static const char *sockmsg_string(enum xsd_sockmsg_type type)

--d6Gm4EdcadzBjdND--

