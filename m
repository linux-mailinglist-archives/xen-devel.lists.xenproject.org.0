Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 522CB1B0353
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 09:45:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQR7S-0002NH-EG; Mon, 20 Apr 2020 07:45:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2FAk=6E=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jQR7R-0002NB-1c
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 07:45:29 +0000
X-Inumbo-ID: e6aba1c8-82da-11ea-b4f4-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e6aba1c8-82da-11ea-b4f4-bc764e2007e4;
 Mon, 20 Apr 2020 07:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587368727;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BRYZeONaMRXa/u7Cz/2ild+p3hGKgptGPtrN/V9uopo=;
 b=Qc5BVfgzP/Ag+D/lmctevZhPc3meHv08gu8cavpLGT02s18szGAAqG7K
 LU85WiFT7Nwd/YgaSUX6Flqa+Zbo5KZsqX5H/q8Jch9MdGu+TBfNJhMrX
 mks+ktkd0WZkNFnqnNy54ag6jZ7OMbEF4ESm/S/+InkqyzaNQb3XdGaka s=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
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
IronPort-SDR: 0DNPrjBKtvkqMlm6iJXIDkQdq9w2Q1vjnQKl/DaIUzLht6PIrj9xFNBGCwi2lnFdgvFoWiNJaA
 BWf7vSxIAWd3wvJgiLlS2cq5P4wtsBAUVDUFzZQ0G0nGE2Xztvdf+fMvSAlb7NCz81Zxmwd/zo
 9gJUDd2mObvQLJNmmw5h/mPl1Fpw9t6FHL0hpSBc+p/H/hZlLrfAW+4RF6GT8NQGlcwReVbkwR
 YDDqDYjprFG4tfywTq6YB1VWrawHiM2LcZ/Yff9fX1fLNqXCN9Qxkhs8OLPz2orJvyrtAd1c9R
 IRY=
X-SBRS: 2.7
X-MesageID: 16596890
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,406,1580792400"; d="scan'208";a="16596890"
Date: Mon, 20 Apr 2020 09:45:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Subject: Re: [PATCH v15 1/3] mem_sharing: don't reset vCPU info page during
 fork reset
Message-ID: <20200420074516.GQ28601@Air-de-Roger>
References: <cover.1587142844.git.tamas.lengyel@intel.com>
 <ef0f91fd4c49c623dda09a1774392d2f2a99ae35.1587142844.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <ef0f91fd4c49c623dda09a1774392d2f2a99ae35.1587142844.git.tamas.lengyel@intel.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Apr 17, 2020 at 10:06:31AM -0700, Tamas K Lengyel wrote:
> When a forked VM is being reset while having vm_events active, re-copying the
> vCPU info page can lead to events being lost. This seems to only affect a
> subset of events (interrupts), while not others (cpuid, MTF, EPT) thus it was

I'm slightly lost by the sentence, is the guest or the hypervisor
the one losing events?

Ie: interrupts are events from a guest PoV, but cpuid or EPT is not
something that triggers events that are injected to the guest. I think
the commit message needs clarification.

> not discovered beforehand. Only copying vCPU info page contents during initial
> fork fixes the problem.

Hm, I'm not sure I understand why this is causing issues. When you
reset a fork you should reset the vcpu info page, or else event masks would
be in a wrong state?

> 
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> ---
>  xen/arch/x86/mm/mem_sharing.c | 50 +++++++++++++++++------------------
>  1 file changed, 25 insertions(+), 25 deletions(-)
> 
> diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
> index e572e9e39d..4b31a8b8f6 100644
> --- a/xen/arch/x86/mm/mem_sharing.c
> +++ b/xen/arch/x86/mm/mem_sharing.c
> @@ -1534,28 +1534,6 @@ int mem_sharing_fork_page(struct domain *d, gfn_t gfn, bool unsharing)
>                            p2m->default_access, -1);
>  }
>  
> -static int bring_up_vcpus(struct domain *cd, struct domain *d)
> -{
> -    unsigned int i;
> -    int ret = -EINVAL;
> -
> -    if ( d->max_vcpus != cd->max_vcpus ||
> -        (ret = cpupool_move_domain(cd, d->cpupool)) )
> -        return ret;
> -
> -    for ( i = 0; i < cd->max_vcpus; i++ )
> -    {
> -        if ( !d->vcpu[i] || cd->vcpu[i] )
> -            continue;
> -
> -        if ( !vcpu_create(cd, i) )
> -            return -EINVAL;
> -    }
> -
> -    domain_update_node_affinity(cd);
> -    return 0;
> -}
> -
>  static int copy_vcpu_settings(struct domain *cd, const struct domain *d)
>  {
>      unsigned int i;
> @@ -1614,6 +1592,31 @@ static int copy_vcpu_settings(struct domain *cd, const struct domain *d)
>      return 0;
>  }
>  
> +static int bring_up_vcpus(struct domain *cd, struct domain *d)
> +{
> +    unsigned int i;
> +    int ret = -EINVAL;
> +
> +    if ( d->max_vcpus != cd->max_vcpus ||
> +        (ret = cpupool_move_domain(cd, d->cpupool)) )
> +        return ret;
> +
> +    for ( i = 0; i < cd->max_vcpus; i++ )
> +    {
> +        if ( !d->vcpu[i] || cd->vcpu[i] )
> +            continue;
> +
> +        if ( !vcpu_create(cd, i) )
> +            return -EINVAL;
> +    }
> +
> +    if ( (ret = copy_vcpu_settings(cd, d)) )
> +        return ret;
> +
> +    domain_update_node_affinity(cd);
> +    return 0;
> +}

I would prefer the code movement to be in a different patch: it makes
it more difficult to spot non-functional changes being made while
moving the function around.

Thanks, Roger.

