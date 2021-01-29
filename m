Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A5B3089F6
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 16:38:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78248.142275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5VqD-0001aQ-SG; Fri, 29 Jan 2021 15:37:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78248.142275; Fri, 29 Jan 2021 15:37:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5VqD-0001a1-P5; Fri, 29 Jan 2021 15:37:45 +0000
Received: by outflank-mailman (input) for mailman id 78248;
 Fri, 29 Jan 2021 15:37:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SuVc=HA=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1l5VqC-0001Zw-Cd
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 15:37:44 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b38687c4-395b-4833-8f1d-f7baec6aee38;
 Fri, 29 Jan 2021 15:37:43 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 10TFbZOJ017442;
 Fri, 29 Jan 2021 16:37:35 +0100 (CET)
Received: from armandeche.soc.lip6.fr (armandeche [132.227.63.133])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 10TFbZfp012739;
 Fri, 29 Jan 2021 16:37:35 +0100 (MET)
Received: by armandeche.soc.lip6.fr (Postfix, from userid 20331)
 id 1DEB77218; Fri, 29 Jan 2021 16:37:34 +0100 (MET)
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
X-Inumbo-ID: b38687c4-395b-4833-8f1d-f7baec6aee38
Date: Fri, 29 Jan 2021 16:37:34 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
        Paul Durrant <paul@xen.org>, Juergen Gross <jgross@suse.com>,
        Ian Jackson <iwj@xenproject.org>,
        Micha? Leszczy?ski <michal.leszczynski@cert.pl>,
        Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
        Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v4] tools/foreignmem: Support querying the size of a
 resource
Message-ID: <20210129153734.GB18282@mail.soc.lip6.fr>
References: <20210128120152.9908-1-andrew.cooper3@citrix.com>
 <20210129103843.GC2015@antioche.eu.org>
 <YBQi5IAUK47GvTmG@Air-de-Roger>
 <61ab107e-70e0-0445-bf4a-6c7031cff949@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <61ab107e-70e0-0445-bf4a-6c7031cff949@citrix.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 29 Jan 2021 16:37:36 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

On Fri, Jan 29, 2021 at 03:09:30PM +0000, Andrew Cooper wrote:
> On 29/01/2021 14:59, Roger Pau Monné wrote:
> > On Fri, Jan 29, 2021 at 11:38:43AM +0100, Manuel Bouyer wrote:
> >> On Thu, Jan 28, 2021 at 12:01:52PM +0000, Andrew Cooper wrote:
> >>> With the Xen side of this interface (soon to be) fixed to return real sizes,
> >>> userspace needs to be able to make the query.
> >>>
> >>> Introduce xenforeignmemory_resource_size() for the purpose, bumping the
> >>> library minor version.
> >>>
> >>> Update both all osdep_xenforeignmemory_map_resource() implementations to
> >>> understand size requests, skip the mmap() operation, and copy back the
> >>> nr_frames field.
> >>>
> >>> For NetBSD, also fix up the ioctl() error path to issue an unmap(), which was
> >>> overlooked by c/s 4a64e2bb39 "libs/foreignmemory: Implement on NetBSD".
> >>> [....]
> >>> diff --git a/tools/libs/foreignmemory/netbsd.c b/tools/libs/foreignmemory/netbsd.c
> >>> index d26566f601..4ae60aafdd 100644
> >>> --- a/tools/libs/foreignmemory/netbsd.c
> >>> +++ b/tools/libs/foreignmemory/netbsd.c
> >>> @@ -132,6 +132,10 @@ int osdep_xenforeignmemory_map_resource(
> >>>      };
> >>>      int rc;
> >>>  
> >>> +    if ( !fres->addr && !fres->nr_frames )
> >>> +        /* Request for resource size.  Skip mmap(). */
> >>> +        goto skip_mmap;
> >>> +
> >>>      fres->addr = mmap(fres->addr, fres->nr_frames << PAGE_SHIFT,
> >>>                        fres->prot, fres->flags | MAP_ANON | MAP_SHARED, -1, 0);
> >> What happens if fres->addr is not NULL and nr_frames is 0 ?
> > mmap would return MAP_FAILED and errno == EINVAL in that case AFAICT
> > on Linux and FreeBSD. NetBSD mmap man page doesn't seem to mention
> > what happens in that case, so the comments below apply to Linux and
> > FreeBSD. Maybe we need to handle this differently for NetBSD?
> >
> >> Is it supposed to happen ?
> > I think that's fine. Calling osdep_xenforeignmemory_map_resource with
> > nr_frames == 0 is pointing to a bug in the caller, so returning error
> > should be fine.
> >
> >> Should we assert that fres->addr is NULL when
> >> nr_frames is 0 ? Or force fres->addr to NULL when nr_frames is 0 ?
> > Doesn't really matter, mmap will return EINVAL if nr_frames == 0
> > regardless of the value of addr.
> 
> mmap() of 0 is an unconditional failure.  So sayeth POSIX.
> 
> For the size request, we don't mmap(), and a pointer of 0 is the signal
> to Xen.
> 
> For the regular mapping, we support both NULL (let the kernel choose),
> and non-NULL (I want my mapping here please), just like regular mmap().

OK, so that's no a bug. Thanks

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

