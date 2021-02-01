Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDC730A473
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 10:38:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79630.145007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6Vej-0006T3-JY; Mon, 01 Feb 2021 09:38:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79630.145007; Mon, 01 Feb 2021 09:38:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6Vej-0006Sf-GD; Mon, 01 Feb 2021 09:38:01 +0000
Received: by outflank-mailman (input) for mailman id 79630;
 Mon, 01 Feb 2021 09:37:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=npej=HD=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1l6Veh-0006SX-Ii
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 09:37:59 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 229d5425-a32d-4a00-bfe8-480a686f2dfe;
 Mon, 01 Feb 2021 09:37:56 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne [10.0.0.1])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 1119blZa005621;
 Mon, 1 Feb 2021 10:37:47 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 66E13281D; Mon,  1 Feb 2021 10:37:47 +0100 (CET)
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
X-Inumbo-ID: 229d5425-a32d-4a00-bfe8-480a686f2dfe
Date: Mon, 1 Feb 2021 10:37:47 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
        Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 2/2] Document qemu-ifup on NetBSD
Message-ID: <20210201093747.GA624@antioche.eu.org>
References: <20210130230300.11664-1-bouyer@netbsd.org>
 <20210130230300.11664-2-bouyer@netbsd.org>
 <YBe6JpR6jOLvYDz6@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YBe6JpR6jOLvYDz6@Air-de-Roger>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Mon, 01 Feb 2021 10:37:47 +0100 (MET)

On Mon, Feb 01, 2021 at 09:21:58AM +0100, Roger Pau Monné wrote:
> On Sun, Jan 31, 2021 at 12:03:00AM +0100, Manuel Bouyer wrote:
> > Document that on NetBSD, the tap interface will be configured by the
> > qemu-ifup script. Document the arguments, and XEN_DOMAIN_ID environnement
> > variable.
> 
> You are missing a Signed-off-by tag here ;).
> 
> > ---
> >  docs/man/xl-network-configuration.5.pod | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/docs/man/xl-network-configuration.5.pod b/docs/man/xl-network-configuration.5.pod
> > index af058d4d3c..f6eb6c31fc 100644
> > --- a/docs/man/xl-network-configuration.5.pod
> > +++ b/docs/man/xl-network-configuration.5.pod
> > @@ -172,6 +172,10 @@ add it to the relevant bridge). Defaults to
> >  C<XEN_SCRIPT_DIR/vif-bridge> but can be set to any script. Some example
> >  scripts are installed in C<XEN_SCRIPT_DIR>.
> >  
> > +On NetBSD, HVM guests will always use
> > +C<XEN_SCRIPT_DIR/qemu-ifup> to configure the tap interface. The first argument
> > +is the tap interface, the second is the bridge name. the environnement variable
> > +C<XEN_DOMAIN_ID> contains the domU's ID.
> 
> LGTM, but I would make it even less technical and more user focused:
> 
> Note on NetBSD HVM guests will ignore the script option for tap
> (emulated) interfaces and always use C<XEN_SCRIPT_DIR/qemu-ifup> to
> configure the interface in bridged mode.

Well, as a user, I want to know how the scripts are called, so that I can
tune them ...

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

