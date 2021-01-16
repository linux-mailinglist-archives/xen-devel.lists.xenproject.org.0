Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 443BE2F8D17
	for <lists+xen-devel@lfdr.de>; Sat, 16 Jan 2021 12:26:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68986.123650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0jhh-0002jh-Ac; Sat, 16 Jan 2021 11:25:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68986.123650; Sat, 16 Jan 2021 11:25:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0jhh-0002jL-7V; Sat, 16 Jan 2021 11:25:13 +0000
Received: by outflank-mailman (input) for mailman id 68986;
 Sat, 16 Jan 2021 11:25:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/22O=GT=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1l0jhf-0002j0-2w
 for xen-devel@lists.xenproject.org; Sat, 16 Jan 2021 11:25:11 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ddbb874e-dc9e-470f-9a88-759ea03614a8;
 Sat, 16 Jan 2021 11:25:08 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne
 [IPv6:2001:41d0:fe9d:1100:221:70ff:fe0c:9885])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 10GBP2VN004904;
 Sat, 16 Jan 2021 12:25:02 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 55E1E281D; Sat, 16 Jan 2021 12:25:02 +0100 (CET)
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
X-Inumbo-ID: ddbb874e-dc9e-470f-9a88-759ea03614a8
Date: Sat, 16 Jan 2021 12:25:02 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
        Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] libs/light: pass some infos to qemu
Message-ID: <20210116112502.GA1133@antioche.eu.org>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <20210112181242.1570-17-bouyer@antioche.eu.org>
 <20210116101606.sogfpgzg7upunua7@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210116101606.sogfpgzg7upunua7@Air-de-Roger>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [IPv6:2001:41d0:fe9d:1100:a00:20ff:fe1c:276e]); Sat, 16 Jan 2021 12:25:02 +0100 (MET)

On Sat, Jan 16, 2021 at 11:16:06AM +0100, Roger Pau Monné wrote:
> On Tue, Jan 12, 2021 at 07:12:37PM +0100, Manuel Bouyer wrote:
> > From: Manuel Bouyer <bouyer@netbsd.org>
> > 
> > Pass bridge name to qemu as command line option
> > When starting qemu, set an environnement variable XEN_DOMAIN_ID,
> > to be used by qemu helper scripts
> > 
> > Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
> > ---
> >  tools/libs/light/libxl_dm.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
> > index 3da83259c0..8866c3f5ad 100644
> > --- a/tools/libs/light/libxl_dm.c
> > +++ b/tools/libs/light/libxl_dm.c
> > @@ -761,6 +761,8 @@ static int libxl__build_device_model_args_old(libxl__gc *gc,
> >          int nr_set_cpus = 0;
> >          char *s;
> >  
> > +        flexarray_append_pair(dm_envs, "XEN_DOMAIN_ID", GCSPRINTF("%d", domid));
> > +
> >          if (b_info->kernel) {
> >              LOGD(ERROR, domid, "HVM direct kernel boot is not supported by "
> >                   "qemu-xen-traditional");
> > @@ -1547,8 +1549,10 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
> >                  flexarray_append(dm_args, "-netdev");
> >                  flexarray_append(dm_args,
> >                                   GCSPRINTF("type=tap,id=net%d,ifname=%s,"
> > +					   "br=%s,"
> >                                             "script=%s,downscript=%s",
> >                                             nics[i].devid, ifname,
> > +					   nics[i].bridge,
> 
> You have some hard tabs in there.

Yes. What's the problem ?

> 
> Also looking at the manual the br= option seems to only be available
> for the bridge networking mode, while here Xen is using tap instead?

Unless I missed something, the bridge networking mode is using the
tap interface, to connect qemu to the bridge. And indeed, the qemu-ifup
script is doing
exec /sbin/brconfig $2 add $1

(the script is called with: qemu-ifup <tap if> <bridge if>)

This is a problem that hit me when I converted NetBSD to qemu-xen:
qemu-traditional does call the qemu-ifup script with the 2 parameters,
while qemu-xen calls it only with the tap if. So the qemu-ifup script can't
know to which bridge the tap interface should be attached to.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

