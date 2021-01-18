Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4662F9B8C
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 09:52:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69453.124295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1QGx-0001fy-8F; Mon, 18 Jan 2021 08:52:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69453.124295; Mon, 18 Jan 2021 08:52:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1QGx-0001fZ-4p; Mon, 18 Jan 2021 08:52:27 +0000
Received: by outflank-mailman (input) for mailman id 69453;
 Mon, 18 Jan 2021 08:52:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=skM3=GV=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1l1QGv-0001fT-Ct
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 08:52:25 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a17daf4d-bd8c-4569-ad5b-a88c16f93641;
 Mon, 18 Jan 2021 08:52:21 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne [10.0.0.1])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 10I8qEHV011929;
 Mon, 18 Jan 2021 09:52:14 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id C44AA281D; Mon, 18 Jan 2021 09:52:14 +0100 (CET)
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
X-Inumbo-ID: a17daf4d-bd8c-4569-ad5b-a88c16f93641
Date: Mon, 18 Jan 2021 09:52:14 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
        Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] libs/light: pass some infos to qemu
Message-ID: <20210118085214.GB859@antioche.eu.org>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <20210112181242.1570-17-bouyer@antioche.eu.org>
 <20210116101606.sogfpgzg7upunua7@Air-de-Roger>
 <20210116112502.GA1133@antioche.eu.org>
 <20210118083642.deozyeo5o6yziba7@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210118083642.deozyeo5o6yziba7@Air-de-Roger>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Mon, 18 Jan 2021 09:52:15 +0100 (MET)

On Mon, Jan 18, 2021 at 09:36:42AM +0100, Roger Pau Monné wrote:
> On Sat, Jan 16, 2021 at 12:25:02PM +0100, Manuel Bouyer wrote:
> > On Sat, Jan 16, 2021 at 11:16:06AM +0100, Roger Pau Monné wrote:
> > > On Tue, Jan 12, 2021 at 07:12:37PM +0100, Manuel Bouyer wrote:
> > > > From: Manuel Bouyer <bouyer@netbsd.org>
> > > > 
> > > > Pass bridge name to qemu as command line option
> > > > When starting qemu, set an environnement variable XEN_DOMAIN_ID,
> > > > to be used by qemu helper scripts
> > > > 
> > > > Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
> > > > ---
> > > >  tools/libs/light/libxl_dm.c | 6 ++++++
> > > >  1 file changed, 6 insertions(+)
> > > > 
> > > > diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
> > > > index 3da83259c0..8866c3f5ad 100644
> > > > --- a/tools/libs/light/libxl_dm.c
> > > > +++ b/tools/libs/light/libxl_dm.c
> > > > @@ -761,6 +761,8 @@ static int libxl__build_device_model_args_old(libxl__gc *gc,
> > > >          int nr_set_cpus = 0;
> > > >          char *s;
> > > >  
> > > > +        flexarray_append_pair(dm_envs, "XEN_DOMAIN_ID", GCSPRINTF("%d", domid));
> > > > +
> > > >          if (b_info->kernel) {
> > > >              LOGD(ERROR, domid, "HVM direct kernel boot is not supported by "
> > > >                   "qemu-xen-traditional");
> > > > @@ -1547,8 +1549,10 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
> > > >                  flexarray_append(dm_args, "-netdev");
> > > >                  flexarray_append(dm_args,
> > > >                                   GCSPRINTF("type=tap,id=net%d,ifname=%s,"
> > > > +					   "br=%s,"
> > > >                                             "script=%s,downscript=%s",
> > > >                                             nics[i].devid, ifname,
> > > > +					   nics[i].bridge,
> > > 
> > > You have some hard tabs in there.
> > 
> > Yes. What's the problem ?
> 
> This file (and libxenlight) uses only spaces for indentation, it
> breaks the coding style.
> 
> The line you added above uses spaces and it's fine.

Ha OK, will fix. I didn't see a difference in my editor.

> 
> > > 
> > > Also looking at the manual the br= option seems to only be available
> > > for the bridge networking mode, while here Xen is using tap instead?
> > 
> > Unless I missed something, the bridge networking mode is using the
> > tap interface, to connect qemu to the bridge. And indeed, the qemu-ifup
> > script is doing
> > exec /sbin/brconfig $2 add $1
> > 
> > (the script is called with: qemu-ifup <tap if> <bridge if>)
> > 
> > This is a problem that hit me when I converted NetBSD to qemu-xen:
> > qemu-traditional does call the qemu-ifup script with the 2 parameters,
> > while qemu-xen calls it only with the tap if. So the qemu-ifup script can't
> > know to which bridge the tap interface should be attached to.
> 
> OK, so the only functional difference of adding the br parameter is
> that it gets passed to the script. I would add that to the commit
> message:
> 
> "The only functional difference of using the br parameter is that the
> bridge name gets passed to the QEMU script."

will do.

> 
> Note also that there are networking modes that don't use a bridge, so
> you could likely end up with nics[i].bridge == NULL?

I guess it would be nics[i].bridge="" (or some other default value) but
I will check. AFAIK qemu will always be called with nics tap mode ?

> 
> I also wonder why NetBSD needs to add the tap interface to the bridge
> in the QEMU script instead of doing it from the hotplug script called
> by libxl, like Linux and FreeBSD do.

the tap interface is created by qemu itself, its name is not known outside
of qemu. Also, is there guarantee that qemu has created the tap before
the hotplug script is called ?

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

