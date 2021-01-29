Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 916B73087FB
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 11:58:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78000.141683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5RTX-0002G3-O8; Fri, 29 Jan 2021 10:58:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78000.141683; Fri, 29 Jan 2021 10:58:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5RTX-0002Fc-Ks; Fri, 29 Jan 2021 10:58:03 +0000
Received: by outflank-mailman (input) for mailman id 78000;
 Fri, 29 Jan 2021 10:58:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fs4s=HA=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1l5RTW-0002FG-1J
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 10:58:02 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 399be38c-6426-4f81-96d2-f94d7a513063;
 Fri, 29 Jan 2021 10:58:00 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne
 [IPv6:2001:41d0:fe9d:1100:221:70ff:fe0c:9885])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 10TAvtaC025799;
 Fri, 29 Jan 2021 11:57:55 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id A51E0281D; Fri, 29 Jan 2021 11:57:55 +0100 (CET)
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
X-Inumbo-ID: 399be38c-6426-4f81-96d2-f94d7a513063
Date: Fri, 29 Jan 2021 11:57:55 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
        Elena Ufimtseva <elena.ufimtseva@oracle.com>,
        Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] NetBSD: use system-provided headers
Message-ID: <20210129105755.GI2015@antioche.eu.org>
References: <20210126224800.1246-1-bouyer@netbsd.org>
 <20210126224800.1246-4-bouyer@netbsd.org>
 <YBKePdnq7SA90GJI@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YBKePdnq7SA90GJI@Air-de-Roger>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [IPv6:2001:41d0:fe9d:1100:a00:20ff:fe1c:276e]); Fri, 29 Jan 2021 11:57:56 +0100 (MET)

On Thu, Jan 28, 2021 at 12:21:33PM +0100, Roger Pau Monné wrote:
> On Tue, Jan 26, 2021 at 11:47:50PM +0100, Manuel Bouyer wrote:
> > On NetBSD use the system-provided headers for ioctl and related definitions,
> > they are up to date and have more chances to match the kernel's idea of
> > the ioctls and structures.
> > Remove now-unused NetBSD/evtchn.h and NetBSD/privcmd.h.
> > Don't fail install if xen/sys/*.h are not present.
> > 
> > Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
> > ---
> >  tools/debugger/gdbsx/xg/xg_main.c      |   4 +
> >  tools/include/Makefile                 |   2 +
> >  tools/include/xen-sys/NetBSD/evtchn.h  |  86 --------------------
> >  tools/include/xen-sys/NetBSD/privcmd.h | 106 -------------------------
> >  tools/libs/call/private.h              |   4 +
> >  tools/libs/ctrl/xc_private.h           |   4 +
> >  tools/libs/foreignmemory/private.h     |   6 ++
> >  7 files changed, 20 insertions(+), 192 deletions(-)
> >  delete mode 100644 tools/include/xen-sys/NetBSD/evtchn.h
> >  delete mode 100644 tools/include/xen-sys/NetBSD/privcmd.h
> > 
> > diff --git a/tools/debugger/gdbsx/xg/xg_main.c b/tools/debugger/gdbsx/xg/xg_main.c
> > index 4576c762af..903d60baed 100644
> > --- a/tools/debugger/gdbsx/xg/xg_main.c
> > +++ b/tools/debugger/gdbsx/xg/xg_main.c
> > @@ -49,7 +49,11 @@
> >  #include "xg_public.h"
> >  #include <xen/version.h>
> >  #include <xen/domctl.h>
> > +#ifdef __NetBSD__
> > +#include <xen/xenio.h>
> > +#else
> >  #include <xen/sys/privcmd.h>
> > +#endif
> >  #include <xen/foreign/x86_32.h>
> >  #include <xen/foreign/x86_64.h>
> >  
> > diff --git a/tools/include/Makefile b/tools/include/Makefile
> > index 4d4ec5f974..04902397b7 100644
> > --- a/tools/include/Makefile
> > +++ b/tools/include/Makefile
> > @@ -68,7 +68,9 @@ install: all
> >  	$(INSTALL_DATA) xen/foreign/*.h $(DESTDIR)$(includedir)/xen/foreign
> >  	$(INSTALL_DATA) xen/hvm/*.h $(DESTDIR)$(includedir)/xen/hvm
> >  	$(INSTALL_DATA) xen/io/*.h $(DESTDIR)$(includedir)/xen/io
> > +ifeq ($(wildcard xen/sys/.),)
> 
> Maybe I'm confused, but doesn't this need to be ifneq? So that if
> wildcard returns any output the command is executed?
> 
> I would also use $(wildcard xen/sys/*.h) because that matches exactly
> the pattern used below.

You're right. It's strange that I didn't get an error at install time.
Will send a fixed version

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

