Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C932F0728
	for <lists+xen-devel@lfdr.de>; Sun, 10 Jan 2021 13:23:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64452.113889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyZkQ-00077W-9z; Sun, 10 Jan 2021 12:23:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64452.113889; Sun, 10 Jan 2021 12:23:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyZkQ-000777-6y; Sun, 10 Jan 2021 12:23:06 +0000
Received: by outflank-mailman (input) for mailman id 64452;
 Sun, 10 Jan 2021 12:23:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lRBP=GN=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kyZkO-000772-N0
 for xen-devel@lists.xenproject.org; Sun, 10 Jan 2021 12:23:04 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0fa64bf4-f657-48d0-9560-7ac2bef8ee57;
 Sun, 10 Jan 2021 12:23:00 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne
 [IPv6:2001:41d0:fe9d:1100:221:70ff:fe0c:9885])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 10ACMoHh014961;
 Sun, 10 Jan 2021 13:22:50 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 84761281D; Sun, 10 Jan 2021 13:22:50 +0100 (CET)
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
X-Inumbo-ID: 0fa64bf4-f657-48d0-9560-7ac2bef8ee57
Date: Sun, 10 Jan 2021 13:22:50 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH 10/24] Make libs/evtchn build on NetBSD
Message-ID: <20210110122250.GA1966@antioche.eu.org>
References: <20201214163623.2127-1-bouyer@netbsd.org>
 <20201214163623.2127-11-bouyer@netbsd.org>
 <20201229115243.itpzsuriclqiljs7@Air-de-Roger>
 <20210104102645.GD2005@antioche.eu.org>
 <20210104171524.drvnwbqd2y5i4m66@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210104171524.drvnwbqd2y5i4m66@Air-de-Roger>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [IPv6:2001:41d0:fe9d:1100:a00:20ff:fe1c:276e]); Sun, 10 Jan 2021 13:22:51 +0100 (MET)

On Mon, Jan 04, 2021 at 06:15:24PM +0100, Roger Pau Monné wrote:
> On Mon, Jan 04, 2021 at 11:26:45AM +0100, Manuel Bouyer wrote:
> > On Tue, Dec 29, 2020 at 12:52:43PM +0100, Roger Pau Monné wrote:
> > > On Mon, Dec 14, 2020 at 05:36:09PM +0100, Manuel Bouyer wrote:
> > > > ---
> > > >  tools/libs/evtchn/netbsd.c | 8 ++++----
> > > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/tools/libs/evtchn/netbsd.c b/tools/libs/evtchn/netbsd.c
> > > > index 8b8545d2f9..6d4ce28011 100644
> > > > --- a/tools/libs/evtchn/netbsd.c
> > > > +++ b/tools/libs/evtchn/netbsd.c
> > > > @@ -25,10 +25,10 @@
> > > >  
> > > >  #include <sys/ioctl.h>
> > > >  
> > > > -#include <xen/sys/evtchn.h>
> > > > -
> > > >  #include "private.h"
> > > >  
> > > > +#include <xen/xenio3.h>
> > > > +
> > > >  #define EVTCHN_DEV_NAME  "/dev/xenevt"
> > > >  
> > > >  int osdep_evtchn_open(xenevtchn_handle *xce)
> > > > @@ -131,7 +131,7 @@ xenevtchn_port_or_error_t xenevtchn_pending(xenevtchn_handle *xce)
> > > >      int fd = xce->fd;
> > > >      evtchn_port_t port;
> > > >  
> > > > -    if ( read_exact(fd, (char *)&port, sizeof(port)) == -1 )
> > > > +    if ( read(fd, (char *)&port, sizeof(port)) == -1 )
> > > >          return -1;
> > > >  
> > > >      return port;
> > > > @@ -140,7 +140,7 @@ xenevtchn_port_or_error_t xenevtchn_pending(xenevtchn_handle *xce)
> > > >  int xenevtchn_unmask(xenevtchn_handle *xce, evtchn_port_t port)
> > > >  {
> > > >      int fd = xce->fd;
> > > > -    return write_exact(fd, (char *)&port, sizeof(port));
> > > > +    return write(fd, (char *)&port, sizeof(port));
> > > 
> > > I'm afraid we will need some context as to why {read/write}_exact
> > > doesn't work here.
> > 
> > It just doesn't exists on NetBSD
> 
> But those are not part of libc or any external library, they are
> implemented in tools/libs/ctrl/xc_private.c and should be available to
> the NetBSD build AFAICT.
> 
> They are just helpers build on top of the standard read/write calls.

Yes, I misremembered (I have this patch for a long time, since 4.11 at last,
maybe even older).
Anyway the build fails with:
netbsd.c: In function 'xenevtchn_pending':
netbsd.c:134:10: error: implicit declaration of function 'read_exact'; did you mean 'readlinkat'? [-Werror=implicit-function-declaration]

The only header where I see this function defined is
tools/libs/ctrl/xc_private.h, so I would need something like
#include "../../ctrl/xc_private.h"
but this doesn't look right.

I didn't find where other OSes are getting the prototype from (or maybe
they just have this -Werror turned off ?)

Anyway I think NetBSD doesn't need this read_exact/write_exact thing,
the underlying pseudo-device won't to partial read/write.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

