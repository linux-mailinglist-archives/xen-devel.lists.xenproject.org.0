Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF0B1D5B1E
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 23:01:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZhRG-0008LC-Uk; Fri, 15 May 2020 21:00:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kC4v=65=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jZhRF-0008L7-TR
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 21:00:13 +0000
X-Inumbo-ID: 11705778-96ef-11ea-a5c9-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 11705778-96ef-11ea-a5c9-12813bfff9fa;
 Fri, 15 May 2020 21:00:12 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: RYV7/2NCiqT8wgvNSKOcdAlaEfVAvkoeTCimpzCFkJVX/t9DnY0umUjsdcecsfoERxpLU+1kX9
 Z9c2D8cCfrI2bpOvFC5qfssJKQevPoMzzO9M+9RSvj9peSWggf2GzaCS04ekRTVrFXQj08eHmV
 nz19AMedne5JRZQnpHbHuJEhc1LKKGjnMK/9Xb+ieDuy9i2LhJRm0C9coo3mLOzo6S0hJzwVTa
 2FF0hSznfu8GMbdAvFS1YA8DJktXQ9+jU8nF+Tg4uzRvagXl9EwSTHM4i1IfTbeC9/Yb131opH
 1f0=
X-SBRS: 2.7
X-MesageID: 17939101
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,396,1583211600"; d="scan'208";a="17939101"
Subject: Re: IOCTL_PRIVCMD_MMAPBATCH on Xen 4.13.0
To: Manuel Bouyer <bouyer@antioche.eu.org>, <xen-devel@lists.xenproject.org>
References: <20200515202912.GA11714@antioche.eu.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <d623cd12-4024-82ba-7388-21f606e1a0bd@citrix.com>
Date: Fri, 15 May 2020 22:00:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200515202912.GA11714@antioche.eu.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15/05/2020 21:29, Manuel Bouyer wrote:
> Hello,
> NetBSD works as dom0 up to Xen 4.11. I'm trying to get it working
> on 4.13.0. I added the support for gntdev operations,  but I'm stuck with
> privcmd IOCTL_PRIVCMD_MMAPBATCH. It seems to work fine for PV and PVH domUs,
> but with HVM domUs, MMU_NORMAL_PT_UPDATE returns -22 (EINVAL) and
> qemu-dm dumps core (as expected; the page is not mapped).
> Of course this works fine in 4.11
>
> In the Xen kernel, I tracked it down to arch/x86/mm.c near line 2229,
> in mod_l1_entry():
>         /* Translate foreign guest address. */
>         if ( cmd != MMU_PT_UPDATE_NO_TRANSLATE &&
>              paging_mode_translate(pg_dom) )
>         {
>             p2m_type_t p2mt;
>             p2m_query_t q = l1e_get_flags(nl1e) & _PAGE_RW ?
>                             P2M_ALLOC | P2M_UNSHARE : P2M_ALLOC;
>
>             page = get_page_from_gfn(pg_dom, l1e_get_pfn(nl1e), &p2mt, q);
>
>             if ( p2m_is_paged(p2mt) )
>             {
>                 if ( page )
>                     put_page(page);
>                 p2m_mem_paging_populate(pg_dom, l1e_get_pfn(nl1e));
>                 return -ENOENT;
>             }
>
>             if ( p2mt == p2m_ram_paging_in && !page )
>                 return -ENOENT;
>
>             /* Did our attempt to unshare fail? */
>             if ( (q & P2M_UNSHARE) && p2m_is_shared(p2mt) )
>             {
>                 /* We could not have obtained a page ref. */
>                 ASSERT(!page);
>                 /* And mem_sharing_notify has already been called. */
>                 return -ENOMEM;
>             }
>
>             if ( !page ) {
>                 gdprintk(XENLOG_WARNING, "translate but no page\n");
>                 return -EINVAL;
>             }                        
>             nl1e = l1e_from_page(page, l1e_get_flags(nl1e));
>         }
>
> the gdprintk() I added in the ( !page) case fires, so this is the
> cause of the EINVAL.
> Is it expected for a HVM domU ? If so, how should the dom0 code be
> changed to get it working ? I failed to see where our code is different
> from linux ...

What is qemu doing at the time?  Is it by any chance trying to map the
IOREQ server frame?

~Andrew

