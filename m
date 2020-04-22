Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA001B3AA4
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2020 11:00:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRBEi-0002mc-9J; Wed, 22 Apr 2020 09:00:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1SgQ=6G=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jRBEg-0002gO-QI
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2020 09:00:02 +0000
X-Inumbo-ID: a609da9c-8477-11ea-b4f4-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a609da9c-8477-11ea-b4f4-bc764e2007e4;
 Wed, 22 Apr 2020 09:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587546001;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1GQREWhDygLwdQroq/fpBH1lWkr/Pvaet3OjXeuuFnk=;
 b=idFuI91GJN9kO9sTEsgwb8BYsGI1Wpd2wuPuA+mLfAdYXir3TT3ioPfz
 cf4TB7lAqMX3jR9U1UMmCwcQ4AS6ncJnRiP/2ZsaDkRVhLfaJ7c/jnll2
 Dmr0tUlVtwDk3xldD6tnx3Prh90mzsphW9coJONsZXnOjB6GuaPzh3fAt o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: K9ua9W/E+CRc044F6sqDf0U/VhPegaPyXX1zi8MzcBuojpVcBboMCSFYwyaaW0c+H9lAzn4iwZ
 sTw5syM29OUMd3FZ7kb41Bd8Nl4S08ndg/7WKU/9uRSJkKi+588Xg2diCcYGx15n0qj/9rErVe
 +chjKZ/CJrcDMhxvWqEuNMs1F5Q+OvidnPlZ0oBiR2qAD6Dbuhf2CW8reraLG/sfJIEGoWuX2n
 jwoMF5KovRL/73WNQyVe2GMXTSjVqbbZTmB1T+2Y20nPEq82mC3ykJrceTIw76F5fsxGywmaoe
 iTo=
X-SBRS: 2.7
X-MesageID: 16453007
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,413,1580792400"; d="scan'208";a="16453007"
Date: Wed, 22 Apr 2020 10:59:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Subject: Re: [PATCH v16 1/3] mem_sharing: fix sharability check during fork
 reset
Message-ID: <20200422085953.GB28601@Air-de-Roger>
References: <cover.1587490511.git.tamas.lengyel@intel.com>
 <8eb756357cb6d9222ed7ec4c0af58473160361a1.1587490511.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <8eb756357cb6d9222ed7ec4c0af58473160361a1.1587490511.git.tamas.lengyel@intel.com>
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Apr 21, 2020 at 10:47:23AM -0700, Tamas K Lengyel wrote:
> When resetting a VM fork we ought to only remove pages that were allocated for
> the fork during it's execution and the contents copied over from the parent.
> This can be determined if the page is sharable as special pages used by the
> fork for other purposes will not pass this test.

Would it be easier to just check if the page refcount is > 1? (as I
expect Xen is also holding a reference to this page)

> Unfortunately during the fork
> reset loop we only partially check whether that's the case. A page's type may
> indicate it is sharable (pass p2m_is_sharable) but that's not a sufficient
> check by itself. All checks that are normally performed before a page is
> converted to the sharable type need to be performed to avoid removing pages
> from the p2m that may be used for other purposes. For example, currently the
> reset loop also removes the vcpu info pages from the p2m, potentially putting
> the guest into infinite page-fault loops.
> 
> For this we extend the existing nominate_page and page_make_sharable functions
> to perform a validation-only run without actually converting the page.

Maybe you could split that chunk into a separate helper that just
performs the checks?

> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> ---
>  xen/arch/x86/mm/mem_sharing.c | 79 ++++++++++++++++++++++-------------
>  1 file changed, 50 insertions(+), 29 deletions(-)
> 
> diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
> index e572e9e39d..d8ed660abb 100644
> --- a/xen/arch/x86/mm/mem_sharing.c
> +++ b/xen/arch/x86/mm/mem_sharing.c
> @@ -633,31 +633,35 @@ unsigned int mem_sharing_get_nr_shared_mfns(void)
>  /* Functions that change a page's type and ownership */
>  static int page_make_sharable(struct domain *d,
>                                struct page_info *page,
> -                              int expected_refcnt)
> +                              int expected_refcnt,
> +                              bool validate_only)
>  {
> -    bool_t drop_dom_ref;
> +    int rc;
> +    bool drop_dom_ref = false;
>  
> -    spin_lock(&d->page_alloc_lock);
> +    /* caller already has the lock when validating only */
> +    if ( !validate_only )
> +        spin_lock(&d->page_alloc_lock);

page_alloc_lock seems to be used as a recursive lock by some callers,
could you do the same here?

>  
>      if ( d->is_dying )
>      {
> -        spin_unlock(&d->page_alloc_lock);
> -        return -EBUSY;
> +        rc = -EBUSY;
> +        goto out;
>      }
>  
>      /* Change page type and count atomically */
>      if ( !get_page_and_type(page, d, PGT_shared_page) )
>      {
> -        spin_unlock(&d->page_alloc_lock);
> -        return -EINVAL;
> +        rc = -EINVAL;
> +        goto out;
>      }
>  
>      /* Check it wasn't already sharable and undo if it was */
>      if ( (page->u.inuse.type_info & PGT_count_mask) != 1 )
>      {
> -        spin_unlock(&d->page_alloc_lock);
>          put_page_and_type(page);
> -        return -EEXIST;
> +        rc = -EEXIST;
> +        goto out;
>      }
>  
>      /*
> @@ -666,20 +670,31 @@ static int page_make_sharable(struct domain *d,
>       */
>      if ( page->count_info != (PGC_allocated | (2 + expected_refcnt)) )
>      {
> -        spin_unlock(&d->page_alloc_lock);
>          /* Return type count back to zero */
>          put_page_and_type(page);
> -        return -E2BIG;
> +        rc = -E2BIG;
> +        goto out;
> +    }
> +
> +    rc = 0;
> +
> +    if ( validate_only )
> +    {
> +        put_page_and_type(page);

You seem to check some page attributes but then put the page again,
which looks racy to me. Since you put the page, couldn't the checks
that you have performed be stale by the point the data is consumed by
the caller?

> +        goto out;
>      }
>  
>      page_set_owner(page, dom_cow);
>      drop_dom_ref = !domain_adjust_tot_pages(d, -1);
>      page_list_del(page, &d->page_list);
> -    spin_unlock(&d->page_alloc_lock);
>  
> +out:
> +    if ( !validate_only )
> +        spin_unlock(&d->page_alloc_lock);
>      if ( drop_dom_ref )
>          put_domain(d);
> -    return 0;
> +
> +    return rc;
>  }
>  
>  static int page_make_private(struct domain *d, struct page_info *page)
> @@ -809,8 +824,8 @@ static int debug_gref(struct domain *d, grant_ref_t ref)
>      return debug_gfn(d, gfn);
>  }
>  
> -static int nominate_page(struct domain *d, gfn_t gfn,
> -                         int expected_refcnt, shr_handle_t *phandle)
> +static int nominate_page(struct domain *d, gfn_t gfn, int expected_refcnt,

Is there any reason for expected_refcnt to be signed? All callers use
unsigned values.

Thanks, Roger.

