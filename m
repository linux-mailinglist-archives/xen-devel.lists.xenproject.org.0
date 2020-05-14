Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8821D3578
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 17:45:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZG30-0008Q0-Dq; Thu, 14 May 2020 15:45:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=otfA=64=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jZG2z-0008Pu-5S
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 15:45:21 +0000
X-Inumbo-ID: e9b4f195-95f9-11ea-a4af-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e9b4f195-95f9-11ea-a4af-12813bfff9fa;
 Thu, 14 May 2020 15:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589471120;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=atK0j8stW0hy8yFn0JJVw+dsWCt4Ao8Knt7TgByirK4=;
 b=dfUwAed2/fWL/2fmV5ZKQJr8Omz/cr1kxB+UD4HNe/NBAMbveJVkcXZ7
 OOwPfPeNe6KzdjpHgv5MIewBtTn+syqb7JylNQCtTpdDtnPjZLNqr5BwV
 wZCylw8PaVevmEQfHNvPBWwZr71goL5B4ZI3dL5XOXpglX5wVF7xpz7Lo g=;
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: G0Gf3wODEYDo3iUuf5y1YgV8Gh0FCLChAhSV4EuCqx6Ub9kGYVImC+8UKVypvvwVjjue678NOk
 vR5zBN57gysKdjf4dqHMAw5AhB8YhYo8y0fM5jnEw15zm1HSPgUef9YrUQsYZvYw7M9cnO7cou
 nCviCewpCgFCWaDHMbPe/OXn/R1kFrVrx2gfgxkdaA5tm74H21fBilDbG0QoFIcZmhL7OOUU83
 uTHLCPy4nbhy7FfU3MTEE75Wiwrp/pz5rBOvdNLee3+5TcuoRwTHfofl3fWrm+yeLenEJCgIUY
 KUs=
X-SBRS: 2.7
X-MesageID: 17811274
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,391,1583211600"; d="scan'208";a="17811274"
Date: Thu, 14 May 2020 17:45:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2 1/6] x86/mem-paging: fold p2m_mem_paging_prep()'s main
 if()-s
Message-ID: <20200514154506.GF54375@Air-de-Roger>
References: <b8437b1f-af58-70df-91d2-bd875912e57b@suse.com>
 <cea2307f-1aae-51cb-20ac-fbaf4b945771@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cea2307f-1aae-51cb-20ac-fbaf4b945771@suse.com>
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

On Thu, Apr 23, 2020 at 10:37:06AM +0200, Jan Beulich wrote:
> The condition of the second can be true only if the condition of the
> first was met; the second half of the condition of the second then also
> is redundant with an earlier check. Combine them, drop a pointless
> local variable, and re-flow the affected gdprintk().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> 
> --- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
> @@ -1808,6 +1808,8 @@ int p2m_mem_paging_prep(struct domain *d
>      /* Allocate a page if the gfn does not have one yet */
>      if ( !mfn_valid(mfn) )
>      {
> +        void *guest_map;
> +
>          /* If the user did not provide a buffer, we disallow */
>          ret = -EINVAL;
>          if ( unlikely(user_ptr == NULL) )
> @@ -1819,22 +1821,16 @@ int p2m_mem_paging_prep(struct domain *d
>              goto out;
>          mfn = page_to_mfn(page);
>          page_extant = 0;
> -    }
> -
> -    /* If we were given a buffer, now is the time to use it */
> -    if ( !page_extant && user_ptr )
> -    {
> -        void *guest_map;
> -        int rc;
>  
>          ASSERT( mfn_valid(mfn) );

I would be tempted to remove this assert also, since you just
successfully allocated the page at this point.

Thanks, Roger.

