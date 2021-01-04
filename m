Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FFA2E9417
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 12:31:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61144.107323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwO4Y-0007Vw-VY; Mon, 04 Jan 2021 11:30:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61144.107323; Mon, 04 Jan 2021 11:30:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwO4Y-0007VX-S7; Mon, 04 Jan 2021 11:30:50 +0000
Received: by outflank-mailman (input) for mailman id 61144;
 Mon, 04 Jan 2021 11:30:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jmHV=GH=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kwO4Y-0007VS-0K
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 11:30:50 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1a541c8a-c2b0-4183-87ad-912d35031e40;
 Mon, 04 Jan 2021 11:30:48 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne
 [IPv6:2001:41d0:fe9d:1100:221:70ff:fe0c:9885])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 104BUicL006959;
 Mon, 4 Jan 2021 12:30:44 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 555D9281D; Mon,  4 Jan 2021 12:30:44 +0100 (CET)
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
X-Inumbo-ID: 1a541c8a-c2b0-4183-87ad-912d35031e40
Date: Mon, 4 Jan 2021 12:30:44 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH 11/24] Implement foreignmemory on NetBSD
Message-ID: <20210104113044.GA1530@antioche.eu.org>
References: <20201214163623.2127-1-bouyer@netbsd.org>
 <20201214163623.2127-12-bouyer@netbsd.org>
 <20201229124630.5ld2dt5o6awa53db@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201229124630.5ld2dt5o6awa53db@Air-de-Roger>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [IPv6:2001:41d0:fe9d:1101:0:0:0:1]); Mon, 04 Jan 2021 12:30:44 +0100 (MET)

On Tue, Dec 29, 2020 at 01:46:30PM +0100, Roger Pau Monné wrote:
> [...]
> > diff --git a/tools/libs/foreignmemory/private.h b/tools/libs/foreignmemory/private.h
> > index 8f1bf081ed..abeceb8720 100644
> > --- a/tools/libs/foreignmemory/private.h
> > +++ b/tools/libs/foreignmemory/private.h
> > @@ -8,7 +8,13 @@
> >  #include <xentoolcore_internal.h>
> >  
> >  #include <xen/xen.h>
> > +
> > +#ifdef __NetBSD__
> > +#include <xen/xen.h>
> > +#include <xen/xenio.h>
> > +#else
> >  #include <xen/sys/privcmd.h>
> > +#endif
> >  
> >  #ifndef PAGE_SHIFT /* Mini-os, Yukk */
> >  #define PAGE_SHIFT           12
> > @@ -38,7 +44,7 @@ int osdep_xenforeignmemory_unmap(xenforeignmemory_handle *fmem,
> >  
> >  #if defined(__NetBSD__) || defined(__sun__)
> >  /* Strictly compat for those two only only */
> > -void *compat_mapforeign_batch(xenforeignmem_handle *fmem, uint32_t dom,
> > +void *osdep_map_foreign_batch(xenforeignmemory_handle *fmem, uint32_t dom,
> >                                void *addr, int prot, int flags,
> >                                xen_pfn_t *arr, int num);
> 
> You will have to split this into NetBSD and Solaris variants now if
> this is really required, but AFAICT you replace
> osdep_map_foreign_batch with osdep_xenforeignmemory_map, so this
> prototype is stale?

I think on solaris too, compat_mapforeign_batch() has to be changed to
osdep_map_foreign_batch() as compat.c and solaris.c has something called
osdep_map_foreign_batch(), but nothing defines compat_mapforeign_batch().
Looks like a rename that missed private.h

Indeed osdep_map_foreign_batch() should not be needed on NetBSD now

> 
> Also a little bit below these prototypes are the dummy implementations
> of osdep_xenforeignmemory_restrict,
> osdep_xenforeignmemory_map_resource and
> osdep_xenforeignmemory_unmap_resource. I think you at least need to
> modify the condition below so that on NetBSD the dummy inlines are not
> used?

This is !defined(__NetBSD__) so it should not be used ?

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

