Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4D51DBC04
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 19:54:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbSth-0003AY-G4; Wed, 20 May 2020 17:52:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P2h4=7C=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jbStg-0003AT-7P
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 17:52:52 +0000
X-Inumbo-ID: b91f7612-9ac2-11ea-b9cf-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b91f7612-9ac2-11ea-b9cf-bc764e2007e4;
 Wed, 20 May 2020 17:52:51 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 31A18206B6;
 Wed, 20 May 2020 17:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589997170;
 bh=YBKhQKVIzAMV/Xq4T8XDemXDl9HFFlWw9sVxS+xBgAM=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=ZE7TQFMhu37nyJUuEiBz+0/HVOel0PmP0Wz27Ismmpo7CUMIoQQgDYsPnI2J1B1jY
 YWkcvgen+iAMEiuejlCC138ok84SeJss1bgUh69aFe1qHtuGXKoXRewm/IJJ1RmQOH
 4d9D8tv0KRSZ08wHoW2nQQ4m/zs9TdjGiBSZ+AT4=
Date: Wed, 20 May 2020 10:52:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: =?UTF-8?Q?J=C3=BCrgen_Gro=C3=9F?= <jgross@suse.com>
Subject: Re: grant table issues mapping a ring order 10
In-Reply-To: <ecd0bdf8-6e65-24a7-8383-c244853f7ae6@suse.com>
Message-ID: <alpine.DEB.2.21.2005201050310.27502@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2005191252040.27502@sstabellini-ThinkPad-T480s>
 <03bad8fd-9826-7652-1c08-549e22634f8d@suse.com>
 <ecd0bdf8-6e65-24a7-8383-c244853f7ae6@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1880897936-1589997170=:27502"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: andrew.cooper3@citrix.com, boris.ostrovsky@oracle.com,
 Stefano Stabellini <sstabellini@kernel.org>, jbeulich@suse.com,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1880897936-1589997170=:27502
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 20 May 2020, Jürgen Groß wrote:
> On 20.05.20 08:00, Jürgen Groß wrote:
> > On 19.05.20 23:21, Stefano Stabellini wrote:
> > > Hi Juergen, Boris,
> > > 
> > > I am trying to increase the size of the rings used for Xen 9pfs
> > > connections for performance reasons and also to reduce the likehood of
> > > the backend having to wait on the frontend to free up space from the
> > > ring.
> > > 
> > > FYI I realized that we cannot choose order 11 or greater in Linux
> > > because then we incur into the hard limit CONFIG_FORCE_MAX_ZONEORDER=11.
> > > But that is not the reason why I am writing to you :-)
> > > 
> > > 
> > > The reason why I am writing is that even order 10 fails for some
> > > grant-table related reason I cannot explain. There are two rings, each
> > > of them order 10. Mapping the first ring results into an error. (Order 9
> > > works fine, resulting in both rings being mapped correctly.)
> > > 
> > > QEMU tries to map the refs but gets an error:
> > > 
> > >    gnttab: error: mmap failed: Invalid argument
> > >    xen be: 9pfs-0: xen be: 9pfs-0: xengnttab_map_domain_grant_refs failed:
> > > Invalid argument
> > >    xengnttab_map_domain_grant_refs failed: Invalid argument
> > > 
> > > The error comes from Xen. The hypervisor returns GNTST_bad_gntref to
> > > Linux (drivers/xen/grant-table.c:gnttab_map_refs). Then:
> > > 
> > >          if (map->map_ops[i].status) {
> > >             err = -EINVAL;
> > >             continue;
> > >         }
> > > 
> > > So Linux returns -EINVAL to QEMU. The ref seem to be garbage. The
> > > following printks are in Xen in the implemenation of map_grant_ref:
> > > 
> > > (XEN) DEBUG map_grant_ref 1017 ref=998 nr=2560
> > > (XEN) DEBUG map_grant_ref 1017 ref=999 nr=2560
> > > (XEN) DEBUG map_grant_ref 1013 ref=2050669706 nr=2560
> > > (XEN) grant_table.c:1015:d0v0 Bad ref 0x7a3abc8a for d1
> > > (XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
> > > (XEN) DEBUG map_grant_ref 1017 ref=19 nr=2560
> > > (XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
> > > (XEN) DEBUG map_grant_ref 1013 ref=56423797 nr=2560
> > > (XEN) grant_table.c:1015:d0v0 Bad ref 0x35cf575 for d1
> > > (XEN) DEBUG map_grant_ref 1013 ref=348793 nr=2560
> > > (XEN) grant_table.c:1015:d0v0 Bad ref 0x55279 for d1
> > > (XEN) DEBUG map_grant_ref 1013 ref=1589921828 nr=2560
> > > (XEN) grant_table.c:1015:d0v0 Bad ref 0x5ec44824 for d1
> > > (XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
> > > (XEN) DEBUG map_grant_ref 1013 ref=2070386184 nr=2560
> > > (XEN) grant_table.c:1015:d0v0 Bad ref 0x7b679608 for d1
> > > (XEN) DEBUG map_grant_ref 1013 ref=3421871 nr=2560
> > > (XEN) grant_table.c:1015:d0v0 Bad ref 0x3436af for d1
> > > (XEN) DEBUG map_grant_ref 1013 ref=1589921828 nr=2560
> > > (XEN) grant_table.c:1015:d0v0 Bad ref 0x5ec44824 for d1
> > > (XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
> > > (XEN) DEBUG map_grant_ref 1013 ref=875999099 nr=2560
> > > (XEN) grant_table.c:1015:d0v0 Bad ref 0x3436af7b for d1
> > > (XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
> > > (XEN) DEBUG map_grant_ref 1013 ref=2705045486 nr=2560
> > > (XEN) grant_table.c:1015:d0v0 Bad ref 0xa13bb7ee for d1
> > > (XEN) DEBUG map_grant_ref 1013 ref=4294967295 nr=2560
> > > (XEN) grant_table.c:1015:d0v0 Bad ref 0xffffffff for d1
> > > (XEN) DEBUG map_grant_ref 1013 ref=213291910 nr=2560
> > > (XEN) grant_table.c:1015:d0v0 Bad ref 0xcb69386 for d1
> > > (XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
> > > (XEN) DEBUG map_grant_ref 1013 ref=4912 nr=2560
> > > (XEN) grant_table.c:1015:d0v0 Bad ref 0x1330 for d1
> > > (XEN) DEBUG map_grant_ref 1013 ref=167788925 nr=2560
> > > (XEN) grant_table.c:1015:d0v0 Bad ref 0xa00417d for d1
> > > (XEN) DEBUG map_grant_ref 1017 ref=24 nr=2560
> > > (XEN) DEBUG map_grant_ref 1013 ref=167788925 nr=2560
> > > (XEN) grant_table.c:1015:d0v0 Bad ref 0xa00417d for d1
> > > (XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
> > > (XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
> > > (XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
> > > (XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
> > > (XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
> > > (XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
> > > (XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
> > > (XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
> > > (XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
> > > (XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
> > > (XEN) DEBUG map_grant_ref 1017 ref=0 nr=2560
> > > 
> > > 
> > > Full logs https://pastebin.com/QLTUaUGJ
> > > It is worth mentioning that no limits are being reached: we are below
> > > 2500 entries per domain and below the 64 pages of grant refs per domain.
> > > 
> > > What it seems to happen is that after ref 999, the next refs are garbage.
> > > Do you have any ideas why?
> > 
> > I don't think there is enough space for all the needed grant refs in the
> > initial interface page passed via Xenstore. So how do you pass the refs
> > to the backend?
> 
> Looking into the full log this seems to be the problem: The processing
> is starting with ref=9 and the last successful ref is 999, so 991 refs
> have been processed. Each ref needs 4 bytes, so a page could hold 1024
> refs, but the first 132 bytes of the page are used for other information
> resulting in 1024-33 == 991 refs possible.

  O_O

Dho! That is definitely the issue. Thank you Jurgen!

I added all sorts of checks to the grant table pages and forgot about
the initial shared page used to pass the ring refs themselves.
--8323329-1880897936-1589997170=:27502--

