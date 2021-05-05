Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E703373506
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 08:40:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122800.231629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leBCC-0004O8-I4; Wed, 05 May 2021 06:39:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122800.231629; Wed, 05 May 2021 06:39:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leBCC-0004MH-F2; Wed, 05 May 2021 06:39:44 +0000
Received: by outflank-mailman (input) for mailman id 122800;
 Wed, 05 May 2021 06:39:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6083=KA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1leBCA-0004MB-Q3
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 06:39:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 169ad996-15c0-48fc-aedc-2436081af118;
 Wed, 05 May 2021 06:39:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E5647AEFE;
 Wed,  5 May 2021 06:39:40 +0000 (UTC)
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
X-Inumbo-ID: 169ad996-15c0-48fc-aedc-2436081af118
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620196781; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CHD5V8bhN/m1JC1gKBf/BeAqVoy9fPW1pdj/Ey6MlXY=;
	b=ssXbijVH91b65Yqovz303z1luVbREDJmrFIpFS3LRAPUeQMyNdv1yzHk9uAiAU7cKXRYpi
	UcFWEJ+Ks2nvq1MLI7/BdD7UJO1csABsZEhn+yMSykFX6QXF3YNiSZ/27UzxKNHblYUs5c
	UPj1jmXt7vMmJ5oQ+zT8YwwS49Uy+jU=
Subject: Re: [PATCH] libx86: Introduce x86_cpu_policy_calculate_compatible()
 with MSR_ARCH_CAPS handling
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210504213120.4179-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <28384167-fbd0-d3ff-c064-ee88f5891580@suse.com>
Date: Wed, 5 May 2021 08:39:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210504213120.4179-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04.05.2021 23:31, Andrew Cooper wrote:
> --- a/tools/include/xen-tools/libs.h
> +++ b/tools/include/xen-tools/libs.h
> @@ -63,4 +63,9 @@
>  #define ROUNDUP(_x,_w) (((unsigned long)(_x)+(1UL<<(_w))-1) & ~((1UL<<(_w))-1))
>  #endif
>  
> +#ifndef _AC
> +#define __AC(X, Y)   (X ## Y)
> +#define _AC(X, Y)    __AC(X, Y)
> +#endif

Somewhere in Roger's recent / pending work I recall he moved these
from somewhere, instead of adding new instances.

> --- a/tools/tests/cpu-policy/test-cpu-policy.c
> +++ b/tools/tests/cpu-policy/test-cpu-policy.c
> @@ -775,6 +775,154 @@ static void test_is_compatible_failure(void)
>      }
>  }
>  
> +static void test_calculate_compatible_success(void)
> +{
> +    static struct test {
> +        const char *name;
> +        struct {
> +            struct cpuid_policy p;
> +            struct msr_policy m;
> +        } a, b, out;
> +    } tests[] = {
> +        {
> +            "arch_caps, b short max_leaf",
> +            .a = {
> +                .p.basic.max_leaf = 7,
> +                .p.feat.arch_caps = true,
> +                .m.arch_caps.rdcl_no = true,
> +            },
> +            .b = {
> +                .p.basic.max_leaf = 6,
> +                .p.feat.arch_caps = true,
> +                .m.arch_caps.rdcl_no = true,

Is this legitimate input in the first place?

> --- a/xen/lib/x86/policy.c
> +++ b/xen/lib/x86/policy.c
> @@ -29,6 +29,9 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
>      if ( ~host->msr->platform_info.raw & guest->msr->platform_info.raw )
>          FAIL_MSR(MSR_INTEL_PLATFORM_INFO);
>  
> +    if ( ~host->msr->arch_caps.raw & guest->msr->arch_caps.raw )
> +        FAIL_MSR(MSR_ARCH_CAPABILITIES);

Doesn't this need special treatment of RSBA, just like it needs specially
treating below?

> @@ -43,6 +46,50 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
>      return ret;
>  }
>  
> +int x86_cpu_policy_calculate_compatible(const struct cpu_policy *a,
> +                                        const struct cpu_policy *b,
> +                                        struct cpu_policy *out,
> +                                        struct cpu_policy_errors *err)
> +{
> +    const struct cpuid_policy *ap = a->cpuid, *bp = b->cpuid;
> +    const struct msr_policy *am = a->msr, *bm = b->msr;
> +    struct cpuid_policy *cp = out->cpuid;
> +    struct msr_policy *mp = out->msr;

Hmm, okay - this would not work with my proposal in reply to your
other patch. The output would instead need to have pointers
allocated here then.

> +    memset(cp, 0, sizeof(*cp));
> +    memset(mp, 0, sizeof(*mp));
> +
> +    cp->basic.max_leaf = min(ap->basic.max_leaf, bp->basic.max_leaf);

Any reason you don't do the same right away for the max extended
leaf?

Jan

