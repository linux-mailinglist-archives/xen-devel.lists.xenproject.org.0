Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D31E3087E0
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 11:39:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77939.141541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5RB9-0007S0-77; Fri, 29 Jan 2021 10:39:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77939.141541; Fri, 29 Jan 2021 10:39:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5RB9-0007Rc-2M; Fri, 29 Jan 2021 10:39:03 +0000
Received: by outflank-mailman (input) for mailman id 77939;
 Fri, 29 Jan 2021 10:39:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fs4s=HA=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1l5RB8-0007Qj-5Z
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 10:39:02 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d0af308d-fae7-4161-bb7a-66b385d4958c;
 Fri, 29 Jan 2021 10:39:00 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne
 [IPv6:2001:41d0:fe9d:1100:221:70ff:fe0c:9885])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 10TAchpQ008588;
 Fri, 29 Jan 2021 11:38:43 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id BA3E8281D; Fri, 29 Jan 2021 11:38:43 +0100 (CET)
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
X-Inumbo-ID: d0af308d-fae7-4161-bb7a-66b385d4958c
Date: Fri, 29 Jan 2021 11:38:43 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
        Paul Durrant <paul@xen.org>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        Juergen Gross <jgross@suse.com>, Ian Jackson <iwj@xenproject.org>,
        Micha? Leszczy?ski <michal.leszczynski@cert.pl>,
        Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
        Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v4] tools/foreignmem: Support querying the size of a
 resource
Message-ID: <20210129103843.GC2015@antioche.eu.org>
References: <20210128120152.9908-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210128120152.9908-1-andrew.cooper3@citrix.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [IPv6:2001:41d0:fe9d:1100:a00:20ff:fe1c:276e]); Fri, 29 Jan 2021 11:38:44 +0100 (MET)

On Thu, Jan 28, 2021 at 12:01:52PM +0000, Andrew Cooper wrote:
> With the Xen side of this interface (soon to be) fixed to return real sizes,
> userspace needs to be able to make the query.
> 
> Introduce xenforeignmemory_resource_size() for the purpose, bumping the
> library minor version.
> 
> Update both all osdep_xenforeignmemory_map_resource() implementations to
> understand size requests, skip the mmap() operation, and copy back the
> nr_frames field.
> 
> For NetBSD, also fix up the ioctl() error path to issue an unmap(), which was
> overlooked by c/s 4a64e2bb39 "libs/foreignmemory: Implement on NetBSD".
> [....]
> diff --git a/tools/libs/foreignmemory/netbsd.c b/tools/libs/foreignmemory/netbsd.c
> index d26566f601..4ae60aafdd 100644
> --- a/tools/libs/foreignmemory/netbsd.c
> +++ b/tools/libs/foreignmemory/netbsd.c
> @@ -132,6 +132,10 @@ int osdep_xenforeignmemory_map_resource(
>      };
>      int rc;
>  
> +    if ( !fres->addr && !fres->nr_frames )
> +        /* Request for resource size.  Skip mmap(). */
> +        goto skip_mmap;
> +
>      fres->addr = mmap(fres->addr, fres->nr_frames << PAGE_SHIFT,
>                        fres->prot, fres->flags | MAP_ANON | MAP_SHARED, -1, 0);

What happens if fres->addr is not NULL and nr_frames is 0 ?
Is it supposed to happen ? Should we assert that fres->addr is NULL when
nr_frames is 0 ? Or force fres->addr to NULL when nr_frames is 0 ?

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

