Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FFB373B45
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 14:32:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123096.232198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leGhQ-0004HT-Bs; Wed, 05 May 2021 12:32:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123096.232198; Wed, 05 May 2021 12:32:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leGhQ-0004EU-8f; Wed, 05 May 2021 12:32:20 +0000
Received: by outflank-mailman (input) for mailman id 123096;
 Wed, 05 May 2021 12:32:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6083=KA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1leGhP-0004EO-8X
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 12:32:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 52543dc8-11d3-4eeb-91ec-108080ee5e04;
 Wed, 05 May 2021 12:32:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E8883AEAE;
 Wed,  5 May 2021 12:32:16 +0000 (UTC)
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
X-Inumbo-ID: 52543dc8-11d3-4eeb-91ec-108080ee5e04
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620217937; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z2Zmi7Dmv1izPbkG/dxF9mTnl00IZ8ICfAnjrADQxus=;
	b=AYkzYDWcbEXLtIcjTzBImlrh+oFPZ+VDYdUGBcFNeX+p7Bx4AEE8EKymrAqPlu/G7LhYKt
	lOq9ZIvGV+INJMwouAXyzhD6ubFsq7MBJrJdT4cPr3mFN7m1BsuyHZnDffvHL6f5SrkVfq
	A0UTELt2KehQ70ngVFGTQvMR8lJ5PQQ=
Subject: Re: [PATCH] libx86: Introduce x86_cpu_policy_calculate_compatible()
 with MSR_ARCH_CAPS handling
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210504213120.4179-1-andrew.cooper3@citrix.com>
 <28384167-fbd0-d3ff-c064-ee88f5891580@suse.com>
 <4def95ca-7488-09bf-19fa-d1fa0fa55427@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <64d4288b-badc-5a3a-894c-3fb3c4c31baa@suse.com>
Date: Wed, 5 May 2021 14:32:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <4def95ca-7488-09bf-19fa-d1fa0fa55427@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 05.05.2021 14:15, Andrew Cooper wrote:
> On 05/05/2021 07:39, Jan Beulich wrote:
>> On 04.05.2021 23:31, Andrew Cooper wrote:
>>> --- a/tools/tests/cpu-policy/test-cpu-policy.c
>>> +++ b/tools/tests/cpu-policy/test-cpu-policy.c
>>> @@ -775,6 +775,154 @@ static void test_is_compatible_failure(void)
>>>      }
>>>  }
>>>  
>>> +static void test_calculate_compatible_success(void)
>>> +{
>>> +    static struct test {
>>> +        const char *name;
>>> +        struct {
>>> +            struct cpuid_policy p;
>>> +            struct msr_policy m;
>>> +        } a, b, out;
>>> +    } tests[] = {
>>> +        {
>>> +            "arch_caps, b short max_leaf",
>>> +            .a = {
>>> +                .p.basic.max_leaf = 7,
>>> +                .p.feat.arch_caps = true,
>>> +                .m.arch_caps.rdcl_no = true,
>>> +            },
>>> +            .b = {
>>> +                .p.basic.max_leaf = 6,
>>> +                .p.feat.arch_caps = true,
>>> +                .m.arch_caps.rdcl_no = true,
>> Is this legitimate input in the first place?
> 
> I've been debating this for a long time, and have decided "yes".
> 
> We have the xend format, and libxl format, and
> 
> cpuid=["host:max_leaf=6"]
> 
> ought not to be rejected simply because it hasn't also gone and zeroed
> every higher piece of information as well.
> 
> In production, this function will be used once per host in the pool, and
> once more if any custom configuration is specified.
> 
> Requiring both inputs to be of the normal form isn't necessary for this
> to function correctly (and indeed, would only add extra overhead), but
> the eventual result will be cleaned/shrunk/etc as appropriate.

Makes sense to me.

>>> --- a/xen/lib/x86/policy.c
>>> +++ b/xen/lib/x86/policy.c
>>> @@ -29,6 +29,9 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
>>>      if ( ~host->msr->platform_info.raw & guest->msr->platform_info.raw )
>>>          FAIL_MSR(MSR_INTEL_PLATFORM_INFO);
>>>  
>>> +    if ( ~host->msr->arch_caps.raw & guest->msr->arch_caps.raw )
>>> +        FAIL_MSR(MSR_ARCH_CAPABILITIES);
>> Doesn't this need special treatment of RSBA, just like it needs specially
>> treating below?
> 
> No.  If RSBA is clear in 'host', then Xen doesn't know about it, and it
> cannot be set in the policy, and cannot be offered to guests.

How does this play together with the comment in
x86_cpu_policy_calculate_compatible() saying "accumulate"? If it's
clear in one policy because it has to be clear in the host's, how
can it be valid for it to get set there in the result, just because
it was set in the other input?

>>> @@ -43,6 +46,50 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
>>>      return ret;
>>>  }
>>>  
>>> +int x86_cpu_policy_calculate_compatible(const struct cpu_policy *a,
>>> +                                        const struct cpu_policy *b,
>>> +                                        struct cpu_policy *out,
>>> +                                        struct cpu_policy_errors *err)
>>> +{
>>> +    const struct cpuid_policy *ap = a->cpuid, *bp = b->cpuid;
>>> +    const struct msr_policy *am = a->msr, *bm = b->msr;
>>> +    struct cpuid_policy *cp = out->cpuid;
>>> +    struct msr_policy *mp = out->msr;
>> Hmm, okay - this would not work with my proposal in reply to your
>> other patch. The output would instead need to have pointers
>> allocated here then.
>>
>>> +    memset(cp, 0, sizeof(*cp));
>>> +    memset(mp, 0, sizeof(*mp));
>>> +
>>> +    cp->basic.max_leaf = min(ap->basic.max_leaf, bp->basic.max_leaf);
>> Any reason you don't do the same right away for the max extended
>> leaf?
> 
> I did the minimum for RSBA testing.  The line needs to be drawn somewhere.

I see. I was thinking that it would be nice if the various related
pieces could remain in sync (or at least new code not staying behind
what we already handle elsewhere), i.e. this one doing at least the
equivalent of what x86_cpu_policies_are_compatible() is currently
capable of dealing with. This, again, would make it easier to spot
all the places that need adjusting when something new is to be added.
But I'm not going to insist - this is largely your realm anyway.

Jan

