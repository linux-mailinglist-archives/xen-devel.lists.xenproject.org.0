Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E531BFE62
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 16:33:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUAFp-0003aG-3H; Thu, 30 Apr 2020 14:33:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/gX9=6O=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jUAFn-0003Zz-Qa
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 14:33:31 +0000
X-Inumbo-ID: 8eeb9661-8aef-11ea-9a60-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8eeb9661-8aef-11ea-9a60-12813bfff9fa;
 Thu, 30 Apr 2020 14:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588257209;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5UfxOhG2UO9dRqqHimG4omLldKZGephHFunru/KJUz0=;
 b=eKkYZQCd3ClMslvdMpO9jRInpnDoKBGjH3vehC+ii3UAbigwzLZ++ABd
 8JDGfqH1Jc0YH9+zvkFg21KF8CBq+7+n/OZytupumRz1NdnKx0d6z509J
 /eiqIfkwZpntLB4o5djgxyBzhLZ1SFOHqa7NeUHsc9hKgrjNdoNK3bZ4h E=;
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
IronPort-SDR: jt56STdCNGd+x9LuHProSxsEaOrOVudPbxSuDBlZ1kXnNGTlCSGApQfXM1AVnJoYbLXOFOfwni
 7eUhQoGby9YjqJi8HrbvVzk4YoMbrJiMBY+uVRL5GTQt/SPIAkjQgbuq0w6EzFJzqLydtFCsX8
 YTx/5L1qsL7UlwMF9wYhOrET5DtLe9odKmaplmMSA5k1/psgAXHMP3TX8hFx+45/pujqizZTwu
 6eHGN8q9Ay5cua+Jc/NAM+SwzrVYX7uc3K5NuXpFXz5942zNfJLIZj4de1+ZGOoh7/scC6Ev+4
 CiM=
X-SBRS: 2.7
X-MesageID: 16825940
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,336,1583211600"; d="scan'208";a="16825940"
Date: Thu, 30 Apr 2020 16:33:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/hvm: allow for more fine grained assisted flush
Message-ID: <20200430143321.GE28601@Air-de-Roger>
References: <20200430091725.80656-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20200430091725.80656-1-roger.pau@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Apr 30, 2020 at 11:17:25AM +0200, Roger Pau Monne wrote:
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 814b7020d8..1d41b6e2ea 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -4011,17 +4011,42 @@ static void hvm_s3_resume(struct domain *d)
>      }
>  }
>  
> -static bool always_flush(void *ctxt, struct vcpu *v)
> +static bool flush_check(void *mask, struct vcpu *v)
>  {
> -    return true;
> +    return mask ? test_bit(v->vcpu_id, (unsigned long *)mask) : true;
>  }
>  
> -static int hvmop_flush_tlb_all(void)
> +static int hvmop_flush_tlb(XEN_GUEST_HANDLE_PARAM(xen_hvm_flush_tlbs_t) uop)
>  {
> +    xen_hvm_flush_tlbs_t op;
> +    DECLARE_BITMAP(mask, HVM_MAX_VCPUS) = { };
> +    bool valid_mask = false;
> +
>      if ( !is_hvm_domain(current->domain) )
>          return -EINVAL;
>  
> -    return paging_flush_tlb(always_flush, NULL) ? 0 : -ERESTART;
> +    if ( !guest_handle_is_null(uop) )
> +    {
> +        if ( copy_from_guest(&op, uop, 1) )
> +            return -EFAULT;
> +
> +        /*
> +         * TODO: implement support for the other features present in
> +         * xen_hvm_flush_tlbs_t: flushing a specific virtual address and not
> +         * flushing global mappings.
> +         */
> +
> +        if ( op.mask_size > ARRAY_SIZE(mask) )

This should also check that the passed in flags are correct, ie:

if ( op.mask_size > ARRAY_SIZE(mask) ||
     (op.flags & ~(HVMOP_flush_global | HVMOP_flush_va_valid)) )
     return -EINVAL;

Roger.

