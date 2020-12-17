Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E2C2DD93C
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 20:18:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56123.97978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpynC-0002SQ-20; Thu, 17 Dec 2020 19:18:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56123.97978; Thu, 17 Dec 2020 19:18:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpynB-0002S4-Ty; Thu, 17 Dec 2020 19:18:25 +0000
Received: by outflank-mailman (input) for mailman id 56123;
 Thu, 17 Dec 2020 19:18:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WIZe=FV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kpynA-0002Rz-9y
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 19:18:24 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 63c5d24a-de23-42eb-9e14-fdcf7b441c36;
 Thu, 17 Dec 2020 19:18:22 +0000 (UTC)
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
X-Inumbo-ID: 63c5d24a-de23-42eb-9e14-fdcf7b441c36
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1608232702;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=b6PMh/U7PSOk0hBN5ueOUeqZfRvoeO+m1nCDE5XKpU0=;
  b=JPKnB4o59ODwzXOE4YRnxiJroTU1xzYRk6TEt5QtTJBL1iU+n7hVwLIl
   K/s96Yi6IFBcjKoTMWdpaZUpxNBIAb2jtMOWV8r/jxvpRDkj0D5DAEO8j
   Is2m2qFx4X20iWQ/am99YshfLjtjfZ3BKc06Hc5oKMR7TElUdRLWdD2Q7
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: aLaqJJDR6DE1K7Xs+j64xFnH5sv4I5b3jN1Ig+aD7bRWWAbbeCknIzsJfHfQ2Ly9IrtDai9vaK
 G9HwcihaRa+ofEvX4RFdglCqOgowlwRtd6ne4IIB6hr8KP0VGYbYri2WoxR4TV6Lsqh3tghfoW
 SH72Mw/OxzR4Asi5nkS1Fysx4yFmZ0wvLaqwcWfVy3bKHK4eyUGA7LpAMofGnSz0S8b7rPG/i2
 bqyTmSv6ceN4itCUU51KcL/f8FKKyg461oYkjqf5Ik4WLa7zuhZB37Dxxt5jPR7B0+SIY4hNrI
 Z4c=
X-SBRS: 5.2
X-MesageID: 33493654
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,428,1599537600"; 
   d="scan'208";a="33493654"
Subject: Re: [PATCH 2/6] x86/mm: p2m_add_foreign() is HVM-only
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>
References: <be9ce75e-9119-2b5a-9e7b-437beb7ee446@suse.com>
 <cf4569c5-a9c5-7b4b-d576-d1521c369418@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f736244b-ece7-af35-1517-2e5fdd9705c7@citrix.com>
Date: Thu, 17 Dec 2020 19:18:16 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cf4569c5-a9c5-7b4b-d576-d1521c369418@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 15/12/2020 16:26, Jan Beulich wrote:
> This is together with its only caller, xenmem_add_to_physmap_one().

I can't parse this sentence.  Perhaps "... as is it's only caller," as a
follow-on from the subject sentence.

>  Move
> the latter next to p2m_add_foreign(), allowing this one to become static
> at the same time.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>, although...

> --- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
> @@ -2639,7 +2646,114 @@ int p2m_add_foreign(struct domain *tdom,
>      return rc;
>  }
>  
> -#ifdef CONFIG_HVM
> +int xenmem_add_to_physmap_one(
> +    struct domain *d,
> +    unsigned int space,
> +    union add_to_physmap_extra extra,
> +    unsigned long idx,
> +    gfn_t gpfn)
> +{
> +    struct page_info *page = NULL;
> +    unsigned long gfn = 0 /* gcc ... */, old_gpfn;
> +    mfn_t prev_mfn;
> +    int rc = 0;
> +    mfn_t mfn = INVALID_MFN;
> +    p2m_type_t p2mt;
> +
> +    switch ( space )
> +    {
> +        case XENMAPSPACE_shared_info:
> +            if ( idx == 0 )
> +                mfn = virt_to_mfn(d->shared_info);
> +            break;
> +        case XENMAPSPACE_grant_table:
> +            rc = gnttab_map_frame(d, idx, gpfn, &mfn);
> +            if ( rc )
> +                return rc;
> +            break;
> +        case XENMAPSPACE_gmfn:
> +        {
> +            p2m_type_t p2mt;
> +
> +            gfn = idx;
> +            mfn = get_gfn_unshare(d, gfn, &p2mt);
> +            /* If the page is still shared, exit early */
> +            if ( p2m_is_shared(p2mt) )
> +            {
> +                put_gfn(d, gfn);
> +                return -ENOMEM;
> +            }
> +            page = get_page_from_mfn(mfn, d);
> +            if ( unlikely(!page) )
> +                mfn = INVALID_MFN;
> +            break;
> +        }
> +        case XENMAPSPACE_gmfn_foreign:
> +            return p2m_add_foreign(d, idx, gfn_x(gpfn), extra.foreign_domid);
> +        default:
> +            break;

... seeing as the function is moving wholesale, can we at least correct
the indention, to save yet another large churn in the future?  (If it
were me, I'd go as far as deleting the default case as well.)

~Andrew

