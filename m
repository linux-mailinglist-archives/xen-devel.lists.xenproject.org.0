Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 184681FACE7
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 11:41:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jl85P-000498-Mh; Tue, 16 Jun 2020 09:40:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LuhO=75=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jl85O-000490-Lo
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 09:40:54 +0000
X-Inumbo-ID: 78b69c1a-afb5-11ea-bca7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78b69c1a-afb5-11ea-bca7-bc764e2007e4;
 Tue, 16 Jun 2020 09:40:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 349B1AFA8;
 Tue, 16 Jun 2020 09:40:57 +0000 (UTC)
Subject: Re: [PATCH 8/9] x86/cpuid: Introduce missing feature adjustment in
 calculate_pv_def_policy()
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200615141532.1927-1-andrew.cooper3@citrix.com>
 <20200615141532.1927-9-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9e27fb33-91d3-1a20-c956-24a0e0f28764@suse.com>
Date: Tue, 16 Jun 2020 11:40:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200615141532.1927-9-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15.06.2020 16:15, Andrew Cooper wrote:
> This was an accidental asymmetry with the HVM side.
> 
> No change in behaviour at this point.
> 
> Fixes: 83b387382 ("x86/cpuid: Introduce and use default CPUID policies")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with a remark:

> --- a/xen/arch/x86/cpuid.c
> +++ b/xen/arch/x86/cpuid.c
> @@ -402,6 +402,8 @@ static void __init calculate_pv_def_policy(void)
>      for ( i = 0; i < ARRAY_SIZE(pv_featureset); ++i )
>          pv_featureset[i] &= pv_def_featuremask[i];
>  
> +    guest_common_feature_adjustments(pv_featureset);
> +
>      sanitise_featureset(pv_featureset);
>      cpuid_featureset_to_policy(pv_featureset, p);
>      recalculate_xstate(p);

These four calls are common to all three callers of the function.
Perhaps them going out of sync would be less likely if all four
called the same helper to carry out these four steps?

Jan

