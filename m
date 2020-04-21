Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 924DC1B1E88
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 08:02:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQlza-0007s5-JH; Tue, 21 Apr 2020 06:02:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OiHr=6F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jQlzZ-0007s0-3y
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 06:02:45 +0000
X-Inumbo-ID: b52ead3c-8395-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b52ead3c-8395-11ea-b58d-bc764e2007e4;
 Tue, 21 Apr 2020 06:02:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B733CAC53;
 Tue, 21 Apr 2020 06:02:38 +0000 (UTC)
Subject: Re: [PATCH 1/3] x86/pv: Options to disable and/or compile out 32bit
 PV support
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200417155004.16806-1-andrew.cooper3@citrix.com>
 <20200417155004.16806-2-andrew.cooper3@citrix.com>
 <5dc9dbd9-fbeb-46ef-4d4e-7916c3219bb3@suse.com>
 <4e732f90-1d5f-7ae5-0f02-6b313a381df7@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6b4e5b50-51f7-566f-2a18-4bb5f4f43d59@suse.com>
Date: Tue, 21 Apr 2020 08:02:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <4e732f90-1d5f-7ae5-0f02-6b313a381df7@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 20.04.2020 20:05, Andrew Cooper wrote:
> On 20/04/2020 15:05, Jan Beulich wrote:
>> On 17.04.2020 17:50, Andrew Cooper wrote:
>>> This is the start of some performance and security-hardening improvements,
>>> based on the fact that 32bit PV guests are few and far between these days.
>>>
>>> Ring1 is full or architectural corner cases, such as counting as supervisor
>> ... full of ...
>>
>>> --- a/docs/misc/xen-command-line.pandoc
>>> +++ b/docs/misc/xen-command-line.pandoc
>>> @@ -1694,7 +1694,17 @@ The following resources are available:
>>>      CDP, one COS will corespond two CBMs other than one with CAT, due to the
>>>      sum of CBMs is fixed, that means actual `cos_max` in use will automatically
>>>      reduce to half when CDP is enabled.
>>> -	
>>> +
>>> +### pv
>>> +    = List of [ 32=<bool> ]
>>> +
>>> +    Applicability: x86
>>> +
>>> +Controls for aspects of PV guest support.
>>> +
>>> +*   The `32` boolean controls whether 32bit PV guests can be created.  It
>>> +    defaults to `true`, and is ignored when `CONFIG_PV32` is compiled out.
>> Rather than ignoring in the way you do, how about ...
>>
>>> --- a/xen/arch/x86/pv/domain.c
>>> +++ b/xen/arch/x86/pv/domain.c
>>> @@ -16,6 +16,39 @@
>>>  #include <asm/pv/domain.h>
>>>  #include <asm/shadow.h>
>>>  
>>> +#ifdef CONFIG_PV32
>>> +int8_t __read_mostly opt_pv32 = -1;
>>> +#endif
>>> +
>>> +static int parse_pv(const char *s)
>>> +{
>>> +    const char *ss;
>>> +    int val, rc = 0;
>>> +
>>> +    do {
>>> +        ss = strchr(s, ',');
>>> +        if ( !ss )
>>> +            ss = strchr(s, '\0');
>>> +
>>> +        if ( (val = parse_boolean("32", s, ss)) >= 0 )
>>> +        {
>>> +#ifdef CONFIG_PV32
>>> +            opt_pv32 = val;
>>> +#else
>>> +            printk(XENLOG_INFO
>>> +                   "CONFIG_PV32 disabled - ignoring 'pv=32' setting\n");
>>> +#endif
>>> +        }
>> ... moving the #ifdef ahead of the if(), and the #endif here (may
>> want converting to "else if" with a placeholder if(0) for this
>> purpose), with the separate printk() dropped?
> 
> In this specific case, it would be even more awkward as there is no use
> of val outside of the ifdef.

True, but can be dealt with in the body of the suggested placeholder
if(0).

>> I'm in particular
>> concerned that we may gain a large number of such printk()s over
>> time, if we added them in such cases.
> 
> The printk() was a bit of an afterthought, but deliberately avoiding the
> -EINVAL path was specifically not.
> 
> In the case that the user tries to use `pv=no-32` without CONFIG_PV32,
> they should see something other than
> 
> (XEN) parameter "pv=no-32" unknown!

Why - to this specific build of Xen the parameter is unknown.

> I don't think overloading the return value is a clever move, because
> then every parse function has to take care of ensuring that -EOPNOTSUPP
> (or ENODEV?) never clobbers -EINVAL.

I didn't suggest overloading the return value. Instead I
specifically want this to go the -EINVAL path.

> We could have a generic helper which looks like:
> 
> static inline void ignored_param(const char *cfg, const char *name,
> const char *s, const char *ss)
> {
>     printk(XENLOG_INFO "%s disabled - ignoring '%s=%*.s' setting\n",
> cfg, name, s, (int)(ss - s));
> }
> 
> which at least would keep all the users consistent.

Further bloating the binary with (almost) useless string literals.
I'd specifically like to avoid this.

>> See parse_iommu_param() for
>> how I'd prefer things to look like in the long run.
> 
> I'm aware of that, just as you are aware of my specific dislike for the
> ifndefs, which make the logic opaque and hard to follow.

A matter of taste and/or perception, I guess, but yes, I'm aware.
I don't recall a suggestion (from you or anyone else) as to a good
alternative, though. What I'd like to achieve is that command line
options valid only in certain configurations get similar treatment
no matter by whom they were added. It doesn't need to be my way of
handling, but I'm pretty convinced that consistency especially in
such "user interface" aspects is very desirable goal.

Jan

