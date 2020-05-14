Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5541D362E
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 18:14:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZGUT-0003sA-V4; Thu, 14 May 2020 16:13:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=otfA=64=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jZGUS-0003s4-Cs
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 16:13:44 +0000
X-Inumbo-ID: e1763f70-95fd-11ea-9887-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1763f70-95fd-11ea-9887-bc764e2007e4;
 Thu, 14 May 2020 16:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589472823;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=xaY8pStL6yfvJkUyVVFH83gJZhG2kxKjgsQih04PDSI=;
 b=AcCzjHsOsZc1WlpgL4Vvr/1MgAh12Vd3+BxSWPQU/f3x5Hfbnzdgyp4m
 reCeSsSEuCb6hA4HQK5P+XWaL6F6PgTfEHbVevrbkGNPX55DQSWtxlQ3D
 gDa48QEqMqPQ+jZERIbWUYMcK8Z7xwu/kI4+qn6yh9PofJwvUp+Eap7Ht U=;
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
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: HN12NLgAoq9Hf5Ag8lgDFTQgarHL5v6cmtTFZvJlfoZVOooIlJhE4LKbaJgVrVz8mDArT6kTlH
 sAE/5iuoX2P4L8Jhrtp/Tv2LJUPzMvO0MYkdtubi3VqO+fsguwUqrSwn9buo7evga1Tb/O1tTN
 Ocf5aBfr6YDveYRtnnNOd7ZU2f2TG3H1gyRvEZQWaeVr6ePPoYeK2BzOkf8wlV4lMGiOR8NFMD
 AKtjLvxKShehcSbR53AgYKlYBzoc84BZyU92f4ngDPR9uRzz+1Z7WEObfqBqX/co+w62uzC1ek
 ldc=
X-SBRS: 2.7
X-MesageID: 17907785
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,392,1583211600"; d="scan'208";a="17907785"
Date: Thu, 14 May 2020 18:13:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2 3/6] x86/mem-paging: use guest handle for
 XENMEM_paging_op_prep
Message-ID: <20200514161336.GH54375@Air-de-Roger>
References: <b8437b1f-af58-70df-91d2-bd875912e57b@suse.com>
 <43811c95-aa41-a34a-06ce-7d344cb1411d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <43811c95-aa41-a34a-06ce-7d344cb1411d@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Apr 23, 2020 at 10:38:18AM +0200, Jan Beulich wrote:
> While it should have been this way from the beginning, not doing so will
> become an actual problem with PVH Dom0. The interface change is binary
> compatible, but requires tools side producers to be re-built.
> 
> Drop the bogus/unnecessary page alignment restriction on the input
> buffer at the same time.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> v2: Use HANDLE_64() instead of HANDLE_PARAM() for function parameter.
> ---
> Is there really no way to avoid the buffer copying in libxc?
> 
> --- a/tools/libxc/xc_mem_paging.c
> +++ b/tools/libxc/xc_mem_paging.c
> @@ -26,15 +26,33 @@ static int xc_mem_paging_memop(xc_interf
>                                 unsigned int op, uint64_t gfn, void *buffer)
>  {
>      xen_mem_paging_op_t mpo;
> +    DECLARE_HYPERCALL_BOUNCE(buffer, XC_PAGE_SIZE,
> +                             XC_HYPERCALL_BUFFER_BOUNCE_IN);
> +    int rc;
>  
>      memset(&mpo, 0, sizeof(mpo));
>  
>      mpo.op      = op;
>      mpo.domain  = domain_id;
>      mpo.gfn     = gfn;
> -    mpo.buffer  = (unsigned long) buffer;
>  
> -    return do_memory_op(xch, XENMEM_paging_op, &mpo, sizeof(mpo));
> +    if ( buffer )
> +    {
> +        if ( xc_hypercall_bounce_pre(xch, buffer) )
> +        {
> +            PERROR("Could not bounce memory for XENMEM_paging_op %u", op);
> +            return -1;
> +        }
> +
> +        set_xen_guest_handle(mpo.buffer, buffer);
> +    }
> +
> +    rc = do_memory_op(xch, XENMEM_paging_op, &mpo, sizeof(mpo));
> +
> +    if ( buffer )
> +        xc_hypercall_bounce_post(xch, buffer);
> +
> +    return rc;
>  }
>  
>  int xc_mem_paging_enable(xc_interface *xch, uint32_t domain_id,
> @@ -92,28 +110,13 @@ int xc_mem_paging_prep(xc_interface *xch
>  int xc_mem_paging_load(xc_interface *xch, uint32_t domain_id,
>                         uint64_t gfn, void *buffer)
>  {
> -    int rc, old_errno;
> -
>      errno = EINVAL;
>  
>      if ( !buffer )
>          return -1;
>  
> -    if ( ((unsigned long) buffer) & (XC_PAGE_SIZE - 1) )
> -        return -1;
> -
> -    if ( mlock(buffer, XC_PAGE_SIZE) )
> -        return -1;
> -
> -    rc = xc_mem_paging_memop(xch, domain_id,
> -                             XENMEM_paging_op_prep,
> -                             gfn, buffer);
> -
> -    old_errno = errno;
> -    munlock(buffer, XC_PAGE_SIZE);
> -    errno = old_errno;
> -
> -    return rc;
> +    return xc_mem_paging_memop(xch, domain_id, XENMEM_paging_op_prep,
> +                               gfn, buffer);

Sadly this function seems to still return -1/-errnoval, which is
weird, same applies to xc_mem_paging_memop. Not that you should fix it
here, just noticed.

Thanks, Roger.

