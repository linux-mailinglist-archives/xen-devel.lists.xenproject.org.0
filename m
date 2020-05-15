Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BB61D4D4F
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 14:02:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZZ2f-0006fz-Hn; Fri, 15 May 2020 12:02:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kC4v=65=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jZZ2d-0006fm-Kh
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 12:02:15 +0000
X-Inumbo-ID: ea3a8f98-96a3-11ea-9887-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea3a8f98-96a3-11ea-9887-bc764e2007e4;
 Fri, 15 May 2020 12:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589544135;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=CCyNLz7EWe53JS9aRhnR6dRoNGqVsGy6uPBVjhf1zjM=;
 b=Kn872NsobxrWac+wZmwoLcwZ6P17X6n0XZznrmhJ+QXbJhRD+d4K3QH+
 vaX0lfHbx8MNPaE+JPlQMibyvtXFWQPuiZ0vavnEl/qCYsqfb+ZfEe0q5
 SvAQ7mhqA2Q6tM+cMl38rcwnroYO4EhSb+rCPPvZglAdFJSdqg9bEXd+g E=;
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: D7Q9zG165YE0dfhtC6ApJ3++Qk+zhWj3M0xdVQPpKDoS8qw45AsPEtnnykbRA1PrgIV6a/hPeg
 OtM7fel3wJtNNALPdsvfhSurTTSo3TGdw2uL60Fm5wZSwpTufxGnV50XcQ4w4chxETmfJhbnWE
 Oi4QFiZW1xa5Di46apvSZzhu9xpd98qG68HgKRZQayCfWEBLP1AnEURSC45H7sbUKAOZzuceBT
 vyXpEEud2UxkZZxMFShXdn00J07p4QSSFuw789gSSSoG/qHIzNaNfdKoUczJF+nP6pHEbiTOzo
 Qfo=
X-SBRS: 2.7
X-MesageID: 17882516
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,395,1583211600"; d="scan'208";a="17882516"
Subject: Re: [PATCH v2 1/6] x86/mem-paging: fold p2m_mem_paging_prep()'s main
 if()-s
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <b8437b1f-af58-70df-91d2-bd875912e57b@suse.com>
 <cea2307f-1aae-51cb-20ac-fbaf4b945771@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e5d2a06e-99bd-a529-1621-4583bb41c78d@citrix.com>
Date: Fri, 15 May 2020 13:02:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <cea2307f-1aae-51cb-20ac-fbaf4b945771@suse.com>
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
> --- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
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
>          guest_map = map_domain_page(mfn);
> -        rc = copy_from_user(guest_map, user_ptr, PAGE_SIZE);
> +        ret = copy_from_user(guest_map, user_ptr, PAGE_SIZE);
>          unmap_domain_page(guest_map);
> -        if ( rc )
> +        if ( ret )
>          {
> -            gdprintk(XENLOG_ERR, "Failed to load paging-in gfn %lx domain %u "
> -                                 "bytes left %d\n", gfn_l, d->domain_id, rc);
> +            gdprintk(XENLOG_ERR,
> +                     "Failed to load paging-in gfn %lx Dom%d bytes left %d\n",
> +                     gfn_l, d->domain_id, ret);

%pd, and "%pd gfn %lx" would be a more natural way to phrase it.

That said - I'm not sure how useful the information is.  We don't
normally print any diagnostics on -EFAULT and I don't see why this case
is special.

With at least %pd fixed, but preferably with the printk() dropped,
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

