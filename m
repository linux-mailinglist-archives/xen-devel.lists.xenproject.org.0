Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C81D01B0DDE
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 16:06:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQX3L-0003tl-9z; Mon, 20 Apr 2020 14:05:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=z/8R=6E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jQX3J-0003tg-2h
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 14:05:37 +0000
X-Inumbo-ID: 01724392-8310-11ea-9e09-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 01724392-8310-11ea-9e09-bc764e2007e4;
 Mon, 20 Apr 2020 14:05:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 638B9AEA2;
 Mon, 20 Apr 2020 14:05:34 +0000 (UTC)
Subject: Re: [PATCH 1/3] x86/pv: Options to disable and/or compile out 32bit
 PV support
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200417155004.16806-1-andrew.cooper3@citrix.com>
 <20200417155004.16806-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5dc9dbd9-fbeb-46ef-4d4e-7916c3219bb3@suse.com>
Date: Mon, 20 Apr 2020 16:05:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200417155004.16806-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17.04.2020 17:50, Andrew Cooper wrote:
> This is the start of some performance and security-hardening improvements,
> based on the fact that 32bit PV guests are few and far between these days.
> 
> Ring1 is full or architectural corner cases, such as counting as supervisor

... full of ...

> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1694,7 +1694,17 @@ The following resources are available:
>      CDP, one COS will corespond two CBMs other than one with CAT, due to the
>      sum of CBMs is fixed, that means actual `cos_max` in use will automatically
>      reduce to half when CDP is enabled.
> -	
> +
> +### pv
> +    = List of [ 32=<bool> ]
> +
> +    Applicability: x86
> +
> +Controls for aspects of PV guest support.
> +
> +*   The `32` boolean controls whether 32bit PV guests can be created.  It
> +    defaults to `true`, and is ignored when `CONFIG_PV32` is compiled out.

Rather than ignoring in the way you do, how about ...

> --- a/xen/arch/x86/pv/domain.c
> +++ b/xen/arch/x86/pv/domain.c
> @@ -16,6 +16,39 @@
>  #include <asm/pv/domain.h>
>  #include <asm/shadow.h>
>  
> +#ifdef CONFIG_PV32
> +int8_t __read_mostly opt_pv32 = -1;
> +#endif
> +
> +static int parse_pv(const char *s)
> +{
> +    const char *ss;
> +    int val, rc = 0;
> +
> +    do {
> +        ss = strchr(s, ',');
> +        if ( !ss )
> +            ss = strchr(s, '\0');
> +
> +        if ( (val = parse_boolean("32", s, ss)) >= 0 )
> +        {
> +#ifdef CONFIG_PV32
> +            opt_pv32 = val;
> +#else
> +            printk(XENLOG_INFO
> +                   "CONFIG_PV32 disabled - ignoring 'pv=32' setting\n");
> +#endif
> +        }

... moving the #ifdef ahead of the if(), and the #endif here (may
want converting to "else if" with a placeholder if(0) for this
purpose), with the separate printk() dropped? I'm in particular
concerned that we may gain a large number of such printk()s over
time, if we added them in such cases. See parse_iommu_param() for
how I'd prefer things to look like in the long run.

Jan

