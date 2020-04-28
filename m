Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 310081BBA88
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 12:01:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTN2q-0004W5-MT; Tue, 28 Apr 2020 10:00:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p0bN=6M=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jTN2p-0004Vu-7r
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 10:00:51 +0000
X-Inumbo-ID: 23726972-8937-11ea-ae69-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23726972-8937-11ea-ae69-bc764e2007e4;
 Tue, 28 Apr 2020 10:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588068050;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8OesVpAHyRD5/QC7oXevGEfVAZ+AqDF+l3jln2eeii8=;
 b=fUVIknj5xTOycoJv3MLeLLHw4A4zAsQ3z1/kdFX+LNZS31sZZdRj/8Ks
 k09L6s14SZrUtKcnPfQESLEKG4AecUa1m/bJBBsjlnytkot+v0xJhqGJ6
 sWVXtsTr3oLfS+Zh47rT6z0KhcA3UQyK7uTqYXSSReDaonwe8wqxgg+E/ M=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Q9XRAlwYkBHl97eX9Mn/+A5sOWPeQeABfBWYRpa0Ikk5cv3r9ye7Sh3rHW9GECWizqyQG0VRDE
 uRieiNWx9FeEMn4ll9XM87vFiDPZkNyvtzJRjIZAFOu6lk1Lv4wPM6pQXo36JINH0DwHAU3LDu
 MVcFQRfc6GBK2DVqeOude+yf7+Q5gSg2cbPAvFR6d1ktOTM8bCEUYnY0NxP39D7VhzKAP6Qn/g
 IWLsaxNt7Q5mklrtDMfgABrDCO7Vpm5/wrFK0OZj6SYb54HLk9wZz2LvNTRP942uPRdpQCx+7i
 CgY=
X-SBRS: 2.7
X-MesageID: 16671844
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,327,1583211600"; d="scan'208";a="16671844"
Date: Tue, 28 Apr 2020 12:00:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Subject: Re: [PATCH] mem_sharing: map shared_info page to same gfn during fork
Message-ID: <20200428100042.GT28601@Air-de-Roger>
References: <08d022bbca06c59624817ac9e23ddcb288121763.1588004969.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <08d022bbca06c59624817ac9e23ddcb288121763.1588004969.git.tamas.lengyel@intel.com>
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

On Mon, Apr 27, 2020 at 09:36:05AM -0700, Tamas K Lengyel wrote:
> During a VM fork we copy the shared_info page; however, we also need to ensure
> that the page is mapped into the same GFN in the fork as its in the parent.
> 
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> Suggested-by: Roger Pau Monne <roger.pau@citrix.com>
> ---
>  xen/arch/x86/mm/mem_sharing.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
> index 344a5bfb3d..acbf21b22c 100644
> --- a/xen/arch/x86/mm/mem_sharing.c
> +++ b/xen/arch/x86/mm/mem_sharing.c
> @@ -1656,6 +1656,7 @@ static void copy_tsc(struct domain *cd, struct domain *d)
>  static int copy_special_pages(struct domain *cd, struct domain *d)
>  {
>      mfn_t new_mfn, old_mfn;
> +    gfn_t old_gfn;
>      struct p2m_domain *p2m = p2m_get_hostp2m(cd);
>      static const unsigned int params[] =
>      {
> @@ -1701,6 +1702,34 @@ static int copy_special_pages(struct domain *cd, struct domain *d)
>      new_mfn = _mfn(virt_to_mfn(cd->shared_info));
>      copy_domain_page(new_mfn, old_mfn);
>  
> +    old_gfn = _gfn(get_gpfn_from_mfn(mfn_x(old_mfn)));
> +
> +    if ( !gfn_eq(old_gfn, INVALID_GFN) )

I think you need to compare the parent shared info gfn against the
child shared info gfn, in case the child has mapped the shared info
but the parent doesn't have it mapped. In which case you want to
remove the mapping when doing a fork reset.

> +    {
> +        /* let's make sure shared_info is mapped to the same gfn */
> +        gfn_t new_gfn = _gfn(get_gpfn_from_mfn(mfn_x(new_mfn)));
> +
> +        if ( !gfn_eq(new_gfn, INVALID_GFN) && !gfn_eq(old_gfn, new_gfn) )

You can then remove the last condition in this if.

> +        {
> +            /* if shared info is mapped to a different gfn just remove it */
> +            rc = p2m->set_entry(p2m, new_gfn, INVALID_MFN, PAGE_ORDER_4K,
> +                                p2m_invalid, p2m->default_access, -1);
> +            if ( rc )
> +                return rc;
> +
> +            new_gfn = INVALID_GFN;
> +        }
> +
> +        if ( gfn_eq(new_gfn, INVALID_GFN) )

And this should then be if ( !gfn_eq(old_gfn, INVALID_GFN) ) ...

Thanks, Roger.

