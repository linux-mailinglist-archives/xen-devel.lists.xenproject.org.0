Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E54201D35AE
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 17:57:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZGF3-0001Dy-BW; Thu, 14 May 2020 15:57:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=otfA=64=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jZGF1-0001Dp-SY
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 15:57:47 +0000
X-Inumbo-ID: a720af10-95fb-11ea-ae69-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a720af10-95fb-11ea-ae69-bc764e2007e4;
 Thu, 14 May 2020 15:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589471866;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=rM6h2i5DD9mIsJ6mQQcZx4xRPynu9dyvimr2JtiPofs=;
 b=IAHVjekh7fIZtnFfaDsbOcWQW+cNVuSJnuuKLxwCoCqM+2HaAQZ6NW+m
 orYYyDTwd1rmNZ8+5dQVVjtgF67Fxus53QysXCwl1S0MvXAPS40N9ePMl
 L6JGl84lkmmVDHMABV4UYTULZnbi1g9oxMRwWUIYxlyyk7EF1aJu6H2oO U=;
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: YtTTa4/qfyQbJOJP/ZSPJ5uQb+0NSsgqQH4T35kug6kkmNX8vzOXJNl1eUrvMFLD6PzI/wcUVe
 R5ufMdZp9MGBMtMj+Yj7Z0whY+mjPscopaMoch1IfVcTDo3L+4YpT88dkEmhDlaquIML5OjYin
 N0KDsGK2HR6d6iXi//e16S6aEgQGlgBSPcfn7X5Y0cxzu+GrSGWXnSgm6hGHBZcU3jQyGsM7FA
 UiJeSNp5mJ8j68T6e/X1nPfizYncGivJ7Zjp/BJfhGYR2qtO48eNweVjgVOBMHxXNGdqtChTSk
 884=
X-SBRS: 2.7
X-MesageID: 18240066
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,391,1583211600"; d="scan'208";a="18240066"
Date: Thu, 14 May 2020 17:57:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2 2/6] x86/mem-paging: correct p2m_mem_paging_prep()'s
 error handling
Message-ID: <20200514155739.GG54375@Air-de-Roger>
References: <b8437b1f-af58-70df-91d2-bd875912e57b@suse.com>
 <bf9dd27b-a7db-de0e-a804-d687e66ecf1e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bf9dd27b-a7db-de0e-a804-d687e66ecf1e@suse.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Apr 23, 2020 at 10:37:46AM +0200, Jan Beulich wrote:
> Communicating errors from p2m_set_entry() to the caller is not enough:
> Neither the M2P nor the stats updates should occur in such a case.
> Instead the allocated page needs to be freed again; for cleanliness
> reasons also properly take into account _PGC_allocated there.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> 
> --- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
> @@ -1781,7 +1781,7 @@ void p2m_mem_paging_populate(struct doma
>   */
>  int p2m_mem_paging_prep(struct domain *d, unsigned long gfn_l, uint64_t buffer)
>  {
> -    struct page_info *page;
> +    struct page_info *page = NULL;
>      p2m_type_t p2mt;
>      p2m_access_t a;
>      gfn_t gfn = _gfn(gfn_l);
> @@ -1816,9 +1816,19 @@ int p2m_mem_paging_prep(struct domain *d
>              goto out;
>          /* Get a free page */
>          ret = -ENOMEM;
> -        page = alloc_domheap_page(p2m->domain, 0);
> +        page = alloc_domheap_page(d, 0);
>          if ( unlikely(page == NULL) )
>              goto out;
> +        if ( unlikely(!get_page(page, d)) )
> +        {
> +            /*
> +             * The domain can't possibly know about this page yet, so failure
> +             * here is a clear indication of something fishy going on.
> +             */
> +            domain_crash(d);
> +            page = NULL;
> +            goto out;
> +        }
>          mfn = page_to_mfn(page);
>          page_extant = 0;
>  
> @@ -1832,7 +1842,6 @@ int p2m_mem_paging_prep(struct domain *d
>                       "Failed to load paging-in gfn %lx Dom%d bytes left %d\n",
>                       gfn_l, d->domain_id, ret);
>              ret = -EFAULT;
> -            put_page(page); /* Don't leak pages */
>              goto out;            
>          }
>      }
> @@ -1843,13 +1852,24 @@ int p2m_mem_paging_prep(struct domain *d
>      ret = p2m_set_entry(p2m, gfn, mfn, PAGE_ORDER_4K,
>                          paging_mode_log_dirty(d) ? p2m_ram_logdirty
>                                                   : p2m_ram_rw, a);
> -    set_gpfn_from_mfn(mfn_x(mfn), gfn_l);

I would instead do `if ( ret ) goto out`;

And won't touch the code afterwards.

Thanks, Roger.

