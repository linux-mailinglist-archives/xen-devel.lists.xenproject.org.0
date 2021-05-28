Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8583393D30
	for <lists+xen-devel@lfdr.de>; Fri, 28 May 2021 08:36:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133768.249204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmW5x-0006HX-Bu; Fri, 28 May 2021 06:35:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133768.249204; Fri, 28 May 2021 06:35:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmW5x-0006Fd-7Z; Fri, 28 May 2021 06:35:45 +0000
Received: by outflank-mailman (input) for mailman id 133768;
 Fri, 28 May 2021 06:35:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wdiM=KX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmW5v-0006FX-VD
 for xen-devel@lists.xenproject.org; Fri, 28 May 2021 06:35:44 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 238af3f9-f427-44db-843d-e5bf59d30e44;
 Fri, 28 May 2021 06:35:42 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 63456218B0;
 Fri, 28 May 2021 06:35:41 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 1D4BE11A98;
 Fri, 28 May 2021 06:35:41 +0000 (UTC)
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
X-Inumbo-ID: 238af3f9-f427-44db-843d-e5bf59d30e44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622183741; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VvIfXPA9lEsjZ+XzJdoKb/OSD7M9TWEcPYCqnEflyIM=;
	b=BLQ+QPjJqCZ0T3mSwnohIuXUIVFDsEjas8f3MUfY33P15KDOktrruHaYHxF1ruZjG2kXFU
	ibPktXeFLBJBHOja7yriz2uH/9KhhnVNh3uRpGmfH2RI+XlKMFcCQn8EdvSvbXYBKf7k6a
	DKAWQJOlWA6c/xRNFIG+UIfMdNkOLqI=
Subject: Re: [PATCH 04/13] cpufreq: Add Hardware P-State (HWP) driver
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <20210503192810.36084-1-jandryuk@gmail.com>
 <20210503192810.36084-5-jandryuk@gmail.com>
 <1747789a-ab6c-cdae-ed35-a6b81ac580a9@suse.com>
 <CAKf6xps4NuBxMpgCo_duWU1ZXB8x8B8uszb3uNyb6kABxUhNHA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2c3400e8-8236-8558-08e4-37c8b1494de7@suse.com>
Date: Fri, 28 May 2021 08:35:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CAKf6xps4NuBxMpgCo_duWU1ZXB8x8B8uszb3uNyb6kABxUhNHA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 27.05.2021 20:50, Jason Andryuk wrote:
> On Wed, May 26, 2021 at 11:00 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 03.05.2021 21:28, Jason Andryuk wrote:
>>> If HWP Energy_Performance_Preference isn't supported, the code falls
>>> back to IA32_ENERGY_PERF_BIAS.  Right now, we don't check
>>> CPUID.06H:ECX.SETBH[bit 3] before using that MSR.
>>
>> May I ask what problem there is doing so?
>>
>>>  The SDM reads like
>>> it'll be available, and I assume it was available by the time Skylake
>>> introduced HWP.
>>
>> The SDM documents the MSR's presence back to at least Nehalem, but ties
>> it to the CPUID bit even there.
> 
> Your point about inconsistent virtualized environments is something I
> hadn't considered.  I will add a check, but I will make hwp disable in
> that case.  While it could run just without an energy/performance
> preference, HWP doesn't seem useful in that scenario.

Makes sense. Of course I wouldn't expect hypervisors to populate much
of CPUID leaf 6 anyway, like is the case for Xen itself.

>>> +    hwp_verbose("HWP: FAST_IA32_HWP_REQUEST %ssupported\n",
>>> +                eax & CPUID6_EAX_FAST_HWP_MSR ? "" : "not ");
>>> +    if ( eax & CPUID6_EAX_FAST_HWP_MSR )
>>> +    {
>>> +        if ( rdmsr_safe(MSR_FAST_UNCORE_MSRS_CAPABILITY, val) )
>>> +            hwp_err("error rdmsr_safe(MSR_FAST_UNCORE_MSRS_CAPABILITY)\n");
>>> +
>>> +        hwp_verbose("HWP: MSR_FAST_UNCORE_MSRS_CAPABILITY: %016lx\n", val);
>>
>> Missing "else" above here?
> 
> Are unbalanced braces acceptable or must they be balanced?  Is this acceptable:
> if ()
>   one;
> else {
>   two;
>   three;
> }

Yes, it is. But I don't see how the question relates to my comment.
All that needs to go in the else's body is the hwp_verbose().

>>> +static void hdc_set_pkg_hdc_ctl(bool val)
>>> +{
>>> +    uint64_t msr;
>>> +
>>> +    if ( rdmsr_safe(MSR_IA32_PKG_HDC_CTL, msr) )
>>> +    {
>>> +        hwp_err("error rdmsr_safe(MSR_IA32_PKG_HDC_CTL)\n");
>>
>> I'm not convinced of the need of having such log messages after
>> failed rdmsr/wrmsr, but I'm definitely against them getting logged
>> unconditionally. In verbose mode, maybe.
> 
> We should not fail the rdmsr if our earlier cpuid check passed.  So in
> that respect these messages can be removed.  The benefit here is that
> you can see which MSR failed.  If you relied on extable_fixup, you
> would have to cross reference manually.  How will administors know if
> hwp isn't working properly there are no messages?

This same question would go for various other MSR accesses which
might fail, but which aren't accompanied by an explicit log message.
I wouldn't mind a single summary message reporting if e.g. HWP
setup failed. More detailed analysis of such would be more of a
developer's than an administrator's job then anyway.

> For HWP in general, the SDM says to check CPUID for the availability
> of MSRs.  Therefore rdmsr/wrmsr shouldn't fail.  During development, I
> saw wrmsr failures when with "Valid Maximum" and other "Valid" bits
> set.  I think that was because I hadn't set up the Package Request
> MSR.  That has been fixed by not using those bits.  Anyway,
> rdmsr/wrmsr shouldn't fail, so how much code should be put into
> checking for those failures which shouldn't happen?

If there's any risk of accesses causing a fault, using *msr_safe()
is of course the right choice. Beyond that you will need to consider
what the consequences are. Sadly this needs doing on every single
case individually. See "Handling unexpected conditions" section of
./CODING_STYLE for guidelines (even if the specific constructs
aren't in use here).

>>> +        return;
>>> +    }
>>> +
>>> +    msr = val ? IA32_PKG_HDC_CTL_HDC_PKG_Enable : 0;
>>
>> If you don't use the prior value, why did you read it? But I
>> think you really mean to set/clear just bot 0.
> 
> During development I printed the initial values .  I removed the
> printing before submission but not the reading.
> 
> In the SDM, It says "Bits 63:1 are reserved and must be zero", so I
> intended to only write 0 or 1.  Below, you remark on not discarding
> reserved bits. So you want all of these to be read-modify-write
> operations?

Yes, this is the only way to be forward compatible.

>>> +static void hdc_set_pm_ctl1(bool val)
>>> +{
>>> +    uint64_t msr;
>>> +
>>> +    if ( rdmsr_safe(MSR_IA32_PM_CTL1, msr) )
>>> +    {
>>> +        hwp_err("error rdmsr_safe(MSR_IA32_PM_CTL1)\n");
>>> +
>>> +        return;
>>> +    }
>>> +
>>> +    msr = val ? IA32_PM_CTL1_HDC_Allow_Block : 0;
>>
>> Same here then, and ...
>>
>>> +static void hwp_fast_uncore_msrs_ctl(bool val)
>>> +{
>>> +    uint64_t msr;
>>> +
>>> +    if ( rdmsr_safe(MSR_FAST_UNCORE_MSRS_CTL, msr) )
>>> +        hwp_err("error rdmsr_safe(MSR_FAST_UNCORE_MSRS_CTL)\n");
>>> +
>>> +    msr = val;
>>
>> ... here (where you imply bit 0 instead of using a proper
>> constant).
>>
>> Also for all three functions I'm not convinced their names are
>> in good sync with their parameters being boolean.
> 
> Would you prefer something named closer to the bit names like:
> hdc_set_pkg_hdc_ctl -> hdc_set_pkg_enable
> hdc_set_pm_ctl1 -> hdc_set_allow_block
> hwp_fast_uncore_msrs_ctl -> hwp_fast_request_enable

My primary request is for function name, purpose, and parameter(s)
to be in line. So e.g. if you left the parameters as boolean, then
I think your suggested name changes make sense. Alternatively you
could make the functions e.g. be full register updating ones, with
suitable parameters, which could be a mask-to-set and mask-to-clear.

>>> +static void hwp_read_capabilities(void *info)
>>> +{
>>> +    struct cpufreq_policy *policy = info;
>>> +    struct hwp_drv_data *data = hwp_drv_data[policy->cpu];
>>> +
>>> +    if ( rdmsr_safe(MSR_IA32_HWP_CAPABILITIES, data->hwp_caps) )
>>> +    {
>>> +        hwp_err("CPU%u: error rdmsr_safe(MSR_IA32_HWP_CAPABILITIES)\n",
>>> +                policy->cpu);
>>> +
>>> +        return;
>>> +    }
>>> +
>>> +    if ( rdmsr_safe(MSR_IA32_HWP_REQUEST, data->curr_req.raw) )
>>> +    {
>>> +        hwp_err("CPU%u: error rdmsr_safe(MSR_IA32_HWP_REQUEST)\n", policy->cpu);
>>> +
>>> +        return;
>>> +    }
>>> +}
>>
>> This function doesn't indicate failure to its caller(s), so am I
>> to understand that failure to read either ofthe MSRs is actually
>> benign to the driver?
> 
> They really shouldn't fail since the CPUID check passed during
> initialization.  If you can't read/write MSRs, something is broken and
> the driver cannot function.  The machine would still run, but HWP
> would be uncontrollable.  How much care should be given to
> "impossible" situations?

See above. The main point is to avoid crashing. In the specific
case here I think you could simply drop both the log messages and
the early return, assuming the caller can deal fine with the zero
value(s) that rdmsr_safe() will substitute for the MSR value(s).
Bailing early, otoh, calls for handing back an error indicator
imo.

>>> +static void hwp_write_request(void *info)
>>> +{
>>> +    struct cpufreq_policy *policy = info;
>>> +    struct hwp_drv_data *data = hwp_drv_data[policy->cpu];
>>> +    union hwp_request hwp_req = data->curr_req;
>>> +
>>> +    BUILD_BUG_ON(sizeof(union hwp_request) != sizeof(uint64_t));
>>
>> ITYM
>>
>>     BUILD_BUG_ON(sizeof(hwp_req) != sizeof(hwp_req.raw));
>>
>> here?
> 
> Originally, I wanted this to live next to the union definition.
> However, BUILD_BUG_ON needs to live in a function, so I placed it here
> where it is used.
> 
> I'd prefer
>     BUILD_BUG_ON(sizeof(hwp_req) != sizeof(uint64_t))
> 
> to make the comparison to 64bit, the size of the MSR, explicit.

Well, then "raw" could still be wrong in principle, but it is the
whole point of having "raw" to have it match MSR size. So while I
could live with your alternative, I continue to think my suggestion
is the more appropriate form of the check.

>>> +    policy->governor = &hwp_cpufreq_governor;
>>> +
>>> +    data = xzalloc(typeof(*data));
>>
>> Commonly we specify the type explicitly in such cases, rather than using
>> typeof(). I will admit though that I'm not entirely certain which one's
>> better. But consistency across the code base is perhaps preferable for
>> the time being.
> 
> I thought typeof(*data) is always preferable since it will always be
> the matching type.  I can change it, but I feel like it's a step
> backwards.

There's exactly one similar use in the entire code base. The original
idea with xmalloc() was that one would explicitly specify the intended
type, such that without looking elsewhere one can see what exactly is
to be allocated. One could further rely on the compiler warning if
there was a disagreement between declaration and assignment.

If instead we were to use typeof() everywhere, there's be a fair
amount of redundancy between the LHS of the assignment and the operand
of typeof(), which would call for eliminating (by abstracting away).

>>> +    if ( feature_hwp_energy_perf )
>>> +        data->energy_perf = 0x80;
>>> +    else
>>> +        data->energy_perf = 7;
>>
>> Where's this 7 coming from? (You do mention the 0x80 at least in the
>> description.)
> 
> When HWP energy performance preference is unavailable, it falls back
> to IA32_ENERGY_PERF_BIAS with a 0-15 range.  Per the SDM Vol3 14.3.4,
> "A value of 7 roughly translates into a hint to balance performance
> with energy consumption."  I will add a comment.

Actually, as per a comment on a later patch, I'm instead expecting
you to add a #define, the name of which will serve as comment.

Jan

