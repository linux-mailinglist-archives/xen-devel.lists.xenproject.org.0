Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C421D51D7
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 16:41:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZbVl-0005PM-QW; Fri, 15 May 2020 14:40:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kC4v=65=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jZbVl-0005PH-7b
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 14:40:29 +0000
X-Inumbo-ID: 050bbbec-96ba-11ea-ae69-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 050bbbec-96ba-11ea-ae69-bc764e2007e4;
 Fri, 15 May 2020 14:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589553628;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=8Q8tQl8vjsX5cS0QouMdFSLFPF18ydCuLFkK+pEKQlQ=;
 b=GgVsuo5GbHfAHwMHkidqpZ2ZqPjUgFxZ7jWB7ql/8X+lm8iK7d8NM/yY
 aJDafpH5snnjW5Z6lXX+vlIIAweFWILvzhccXw2B+GddHTD2PQX6ZfpYc
 paX1PmCbDkEl4TRC5wZydkXZsYFLFAcrbWZbKsyAEAhUbV8QciXl4Mk4B 4=;
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: 8jnWG1/uxZLjiG6AJmZB7EEE6+XYIEJgiNuiUD7Y4Gjiz112IOVD6a8Vl7Y6Y8JUwUkb7ZGbZv
 PJgZZPWQyq2N/1BLXFkcU9Alwa4CcizyQux2+5FYVg3y4AqjANPlDmiwrxqkHIVEWaUevE/77q
 00sTujf4+kdgqFq5Ajb4oo2nxoKDzRof2JHjJQhgkleewfiRIwk+zFKR8nAQWQ1GP+sYqDrhXi
 wIZ20pIkKHcVdCebqICXWYYTmE1iTh35YtEqqxEfyvZ5nS+b54czsUdQENr9m1gs5eUtQWc0cG
 Qu4=
X-SBRS: 2.7
X-MesageID: 17627724
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,395,1583211600"; d="scan'208";a="17627724"
Subject: Re: [PATCH v2 2/6] x86/mem-paging: correct p2m_mem_paging_prep()'s
 error handling
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <b8437b1f-af58-70df-91d2-bd875912e57b@suse.com>
 <bf9dd27b-a7db-de0e-a804-d687e66ecf1e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <2cccf9bb-3930-436d-65de-f0eb7dd0c498@citrix.com>
Date: Fri, 15 May 2020 15:40:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <bf9dd27b-a7db-de0e-a804-d687e66ecf1e@suse.com>
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
Cc: George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 23/04/2020 09:37, Jan Beulich wrote:
> Communicating errors from p2m_set_entry() to the caller is not enough:
> Neither the M2P nor the stats updates should occur in such a case.

"neither".  Following a colon/semicolon isn't the start of a new sentence.

> Instead the allocated page needs to be freed again; for cleanliness
> reasons also properly take into account _PGC_allocated there.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
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

This needs a gprintk(XENLOG_ERR, ...) of some form.  (which also reminds
me that I *still* need to finish my patch forcing everyone to provide
something to qualify the domain crash, so release builds of Xen get some
hint as to what went on or why.)

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
> +    if ( !ret )
> +    {
> +        set_gpfn_from_mfn(mfn_x(mfn), gfn_l);
>  
> -    if ( !page_extant )
> -        atomic_dec(&d->paged_pages);
> +        if ( !page_extant )
> +            atomic_dec(&d->paged_pages);
> +    }
>  
>   out:
>      gfn_unlock(p2m, gfn, 0);
> +
> +    if ( page )
> +    {
> +        if ( ret )
> +            put_page_alloc_ref(page);
> +        put_page(page);

This is a very long way from clear enough to follow, and buggy if anyone
inserts a new goto out path.

~Andrew

> +    }
> +
>      return ret;
>  }
>  
>


