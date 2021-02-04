Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 893EF30F1CA
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 12:16:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81256.149806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7ccU-0002l0-CC; Thu, 04 Feb 2021 11:16:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81256.149806; Thu, 04 Feb 2021 11:16:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7ccU-0002kb-8O; Thu, 04 Feb 2021 11:16:18 +0000
Received: by outflank-mailman (input) for mailman id 81256;
 Thu, 04 Feb 2021 11:16:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y0/J=HG=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1l7ccS-0002kW-Q5
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 11:16:16 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 612448c8-c444-4a79-b132-e92b621507c2;
 Thu, 04 Feb 2021 11:16:15 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne
 [IPv6:2001:41d0:fe9d:1100:221:70ff:fe0c:9885])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 114BGDZx025424;
 Thu, 4 Feb 2021 12:16:14 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id E25CB281D; Thu,  4 Feb 2021 12:16:13 +0100 (CET)
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
X-Inumbo-ID: 612448c8-c444-4a79-b132-e92b621507c2
Date: Thu, 4 Feb 2021 12:16:13 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
        Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xenstored: close socket connections on error
Message-ID: <20210204111613.GA2316@antioche.eu.org>
References: <20210203165421.1550-1-bouyer@netbsd.org>
 <20210203165421.1550-2-bouyer@netbsd.org>
 <55faec4f-71e3-71c3-e251-74238bb74c11@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <55faec4f-71e3-71c3-e251-74238bb74c11@suse.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [IPv6:2001:41d0:fe9d:1101:0:0:0:1]); Thu, 04 Feb 2021 12:16:14 +0100 (MET)

On Thu, Feb 04, 2021 at 12:11:02PM +0100, Jürgen Groß wrote:
> On 03.02.21 17:54, Manuel Bouyer wrote:
> > On error, don't keep socket connection in ignored state but close them.
> > When the remote end of a socket is closed, xenstored will flag it as an
> > error and switch the connection to ignored. But on some OSes (e.g.
> > NetBSD), poll(2) will return only POLLIN in this case, so sockets in ignored
> > state will stay open forever in xenstored (and it will loop with CPU 100%
> > busy).
> > 
> > Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
> > Fixes: d2fa370d3ef9cbe22d7256c608671cdcdf6e0083
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

thanks.
I still don't know if I'm supposed to send a new version of the patch with
these tags, even if the patch itself doesn't change, or if the commiter
will handle them ?

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

