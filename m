Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFD82E9370
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 11:36:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61087.107214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwNDy-0001df-TZ; Mon, 04 Jan 2021 10:36:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61087.107214; Mon, 04 Jan 2021 10:36:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwNDy-0001dG-Q3; Mon, 04 Jan 2021 10:36:30 +0000
Received: by outflank-mailman (input) for mailman id 61087;
 Mon, 04 Jan 2021 10:36:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jmHV=GH=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kwNDx-0001dB-3F
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 10:36:29 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2ac03143-f02d-43c6-9b05-8cae8b66d81b;
 Mon, 04 Jan 2021 10:36:27 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne
 [IPv6:2001:41d0:fe9d:1100:221:70ff:fe0c:9885])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 104AaNPK002419;
 Mon, 4 Jan 2021 11:36:23 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 23023281D; Mon,  4 Jan 2021 11:36:23 +0100 (CET)
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
X-Inumbo-ID: 2ac03143-f02d-43c6-9b05-8cae8b66d81b
Date: Mon, 4 Jan 2021 11:36:23 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH 14/24] Pass bridge name to qemu and set XEN_DOMAIN_ID
Message-ID: <20210104103623.GG2005@antioche.eu.org>
References: <20201214163623.2127-1-bouyer@netbsd.org>
 <20201214163623.2127-15-bouyer@netbsd.org>
 <20201229151958.ungp5efzj75zszzm@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201229151958.ungp5efzj75zszzm@Air-de-Roger>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [IPv6:2001:41d0:fe9d:1101:0:0:0:1]); Mon, 04 Jan 2021 11:36:23 +0100 (MET)

On Tue, Dec 29, 2020 at 04:19:58PM +0100, Roger Pau Monné wrote:
> On Mon, Dec 14, 2020 at 05:36:13PM +0100, Manuel Bouyer wrote:
> > Pass bridge name to qemu
> > When starting qemu, set an environnement variable XEN_DOMAIN_ID,
> > to be used by qemu helper scripts
> 
> NetBSD is the only one to use QEMU nic scripts, both FreeBSD and Linux
> don't use up/down scripts with QEMU.

I think the scripts are more flexible though; they can be hacked for
local needs ...

> 
> > ---
> >  tools/libs/light/libxl_dm.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
> > index 3da83259c0..5948ace60d 100644
> > --- a/tools/libs/light/libxl_dm.c
> > +++ b/tools/libs/light/libxl_dm.c
> > @@ -761,6 +761,10 @@ static int libxl__build_device_model_args_old(libxl__gc *gc,
> >          int nr_set_cpus = 0;
> >          char *s;
> >  
> > +	static char buf[12];
> > +	snprintf(buf, sizeof(buf), "%d", domid);
> > +        flexarray_append_pair(dm_envs, "XEN_DOMAIN_ID", buf);
> 
> Indentation, here and below.
> 
> Also just use:
> 
> flexarray_append_pair(dm_envs, "XEN_DOMAIN_ID",
>                       GCSPRINTF("%d", domid);
> 
> Here and below.

fixed, thanks

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

