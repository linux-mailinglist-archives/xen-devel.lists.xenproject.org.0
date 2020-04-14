Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 981F91A7552
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 10:02:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOGWH-00011f-Af; Tue, 14 Apr 2020 08:02:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=18iO=56=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jOGWF-00011a-Lz
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 08:02:07 +0000
X-Inumbo-ID: 3babb5fa-7e26-11ea-b58d-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3babb5fa-7e26-11ea-b58d-bc764e2007e4;
 Tue, 14 Apr 2020 08:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586851327;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=l5g8loIidFzbiBQ70AnP8vDOO60Pey9SqyRaP/IVSOI=;
 b=IQuzjCWkn1e1n0HdVkU4/y8UAujgfyV0HcBr5BwiCwg4M8bOIQhe7XDS
 Ep1m2UUfMJmo5Xip4tg5w3mmq6kE5/3XghDfl4Eh0kSDHNUfEXvKE25i4
 GTHSMt1hjMw3uLXuoGcG30kUMCeRHRVT93sxHCs2S0cQyYQwB8c0OoXCW 4=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: wlKJPaEW0Fww8VnTFA14ERq+EzmvyMsrwweCRquRIicpqZYI+7aI6hVkOUk4KIlvaFfIABYjO8
 xvOb+QzexkgPFEjLXNFnGpf+v78tz5LBb5+JJNybzTCkMfUuL/LemRc/IYbYIJ5D7iJsKM8Oy7
 NTzFdhWxr/0qYGzMZ/0Jkp58ui5TlBL2xZE500T+G5LuvDeF58ZiZp8LhsaIHLsu1TxupZNFa7
 6ILrTaPSP1Hb/jNp/MNDajUv8BuQnkdxZmze81kRIv+1/Ypo2kb+UdNH1y8CnCiO48c45QIXJ3
 71k=
X-SBRS: 2.7
X-MesageID: 15610179
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,381,1580792400"; d="scan'208";a="15610179"
Date: Tue, 14 Apr 2020 10:01:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v9 1/3] x86/tlb: introduce a flush HVM ASIDs flag
Message-ID: <20200414080158.GD28601@Air-de-Roger>
References: <20200406105703.79201-1-roger.pau@citrix.com>
 <20200406105703.79201-2-roger.pau@citrix.com>
 <9c7ec98b-bd2d-4fbf-530a-2164dbbee200@suse.com>
 <20200408151055.GB28601@Air-de-Roger>
 <00c10f30-5502-2b43-b394-efa8137cf264@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <00c10f30-5502-2b43-b394-efa8137cf264@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Apr 09, 2020 at 01:16:57PM +0200, Jan Beulich wrote:
> On 08.04.2020 17:10, Roger Pau Monné wrote:
> > On Wed, Apr 08, 2020 at 01:25:14PM +0200, Jan Beulich wrote:
> >> On 06.04.2020 12:57, Roger Pau Monne wrote:
> >>> --- a/xen/arch/x86/mm/paging.c
> >>> +++ b/xen/arch/x86/mm/paging.c
> >>> @@ -613,7 +613,8 @@ void paging_log_dirty_range(struct domain *d,
> >>>  
> >>>      p2m_unlock(p2m);
> >>>  
> >>> -    flush_tlb_mask(d->dirty_cpumask);
> >>> +    flush_mask(d->dirty_cpumask, (!hap_enabled(d) ? FLUSH_TLB : 0) |
> >>> +                                 FLUSH_HVM_ASID_CORE);
> >>
> >> In cases where one case is assumed to be more likely than the other
> >> putting the more likely one first can be viewed as a mild hint to
> >> the compiler, and hence an extra ! may be warranted in an if() or
> >> a conditional expression. Here, however, I don't think we can
> >> really consider one case more likely than the other, and hence I'd
> >> suggest to avoid the !, flipping the other two expressions
> >> accordingly. I may take the liberty to adjust this while committing
> >> (if I'm to be the one).
> > 
> > That's fine, thanks. Somehow '!hap -> flush' was clearer in my mind.
> 
> Thinking about it with the other HVM-related changes in v9, shouldn't
> this then be
> 
>     flush_mask(d->dirty_cpumask, (hap_enabled(d) ? 0 : FLUSH_TLB) |
>                                  (is_hvm_domain(d) ? FLUSH_HVM_ASID_CORE : 0));
> 
> Or wait - the only caller lives in hap.c. As a result the FLUSH_TLB
> part can be dropped altogether. And I question the need of flushing
> guest TLBs - this is purely a p2m operation. I'll go look at the
> history of this function, but for now I think the call should be
> dropped (albeit then maybe better in a separate patch).

The ASID flush needs to stay unless it's moved into p2m_pt_set_entry,
as p2m_pt_set_entry itself doesn't perform any ASID flush and won't
work correctly.

I think it's safe to remove the TLB flush, as the code is only called
from HAP, and hence is not used by shadow (which is what would require
a plain TLB flush). The placement of this function seems misleading to
me, as it looks like it's used by both shadow and HAP. It might be
better to move it to hap.c if it's only to be used by HAP code.

Thanks, Roger.

