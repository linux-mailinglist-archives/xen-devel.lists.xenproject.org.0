Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D5B79E49F
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 12:11:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601162.937097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgMqN-00063S-Vb; Wed, 13 Sep 2023 10:11:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601162.937097; Wed, 13 Sep 2023 10:11:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgMqN-00061Y-Sj; Wed, 13 Sep 2023 10:11:35 +0000
Received: by outflank-mailman (input) for mailman id 601162;
 Wed, 13 Sep 2023 10:11:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VJSs=E5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qgMqM-00061S-CJ
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 10:11:34 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea13f538-521d-11ee-8786-cb3800f73035;
 Wed, 13 Sep 2023 12:11:33 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-31dca134c83so6688857f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 13 Sep 2023 03:11:33 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 t15-20020adff04f000000b0031434c08bb7sm15028074wro.105.2023.09.13.03.11.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Sep 2023 03:11:32 -0700 (PDT)
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
X-Inumbo-ID: ea13f538-521d-11ee-8786-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694599892; x=1695204692; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GGgyci124H8hidEcnFo2r9YAeq+z/nN9ybuqnCCcg8I=;
        b=jJMoIvrmlOhWWnwN33C45sQuSz0sF4L1xFYvbskRMfBp/a5u0sqGMBAmGEgy3ADUln
         LGbErX4wZM/zGFloIBP0LC1yaiYOYcJmqXINH1rquEJI4bFNG7mpmSC3dVVOcEU+yqG9
         I53YduLIKnUZYVHCCBXtXC8gg1D4rl9EoMGnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694599892; x=1695204692;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GGgyci124H8hidEcnFo2r9YAeq+z/nN9ybuqnCCcg8I=;
        b=dyOGFBjGlMmFkrARcypbNiKvZwHe3tS/3DKuC0BpFmZunTf3as42McwBQnyl0jlbr7
         p8SiE8Jtx/J0VoJVOZAcoyVtsq6/lYm8x76BtoYuV8t/9ClWGxAS5aVYE3G308SaboYo
         Sxr1szcZt+1QMfmvJfRc8fdqxnVLG06istOUenojbbxUdlFUCWfwHxPgRhBmZsdBqzIS
         45xFeRh3x/skF+PZ+PlJ320y7V8IX4ZAqfOFnP2ohmgNU7FrPC46s7yfdthM1p/x+Y6t
         1W65yrGKOA55IMPfMdj3+iuzzZw827sQh5eklk0vMxWZ8hQeUSyCDyeRnS937Sf8YWmn
         CQ7A==
X-Gm-Message-State: AOJu0YwZf2HrSA7zBY1hnePsUDoepI/uqKhRyJla5pdXtLGcjLkwi6We
	KIKpnT/T4RektzHDLELpngBwfg==
X-Google-Smtp-Source: AGHT+IE9jI98Etvv0Q/L8W2UsIGOJxDBuDGWChRK9AHW/+RsHrUPCobZBfe2JlL1cbS+3nm/uOPung==
X-Received: by 2002:a05:6000:11d1:b0:315:8f4f:81b8 with SMTP id i17-20020a05600011d100b003158f4f81b8mr1762144wrx.50.1694599892496;
        Wed, 13 Sep 2023 03:11:32 -0700 (PDT)
Message-ID: <793b37dd-5eb6-f69b-e86d-bcc1ed388561@citrix.com>
Date: Wed, 13 Sep 2023 11:11:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/amd: do not expose HWCR.TscFreqSel to guests
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, solene@openbsd.org,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Demi Marie Obenour <demi@invisiblethingslab.com>
References: <20230912162305.34339-1-roger.pau@citrix.com>
 <fc91c802-5f71-4ec9-8c11-68fd2c4ae672@citrix.com>
 <989ebefa-42f1-cac7-e2d3-f4bcd1e4b662@citrix.com>
 <ZQFt-7x90QWL_Rmi@MacBook-MacBook-Pro-de-Roger.local>
In-Reply-To: <ZQFt-7x90QWL_Rmi@MacBook-MacBook-Pro-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/09/2023 9:08 am, Roger Pau Monné wrote:
> On Tue, Sep 12, 2023 at 05:36:53PM +0100, Andrew Cooper wrote:
>> On 12/09/2023 5:35 pm, Andrew Cooper wrote:
>>> On 12/09/2023 5:23 pm, Roger Pau Monne wrote:
>>>> OpenBSD will attempt to unconditionally access PSTATE0 if HWCR.TscFreqSel is
>>>> set, and will also attempt to unconditionally access HWCR if the TSC is
>>>> reported as Invariant.
>>>>
>>>> The reasoning for exposing HWCR.TscFreqSel was to avoid Linux from printing a
>>>> (bogus) warning message, but doing so at the cost of OpenBSD not booting is not
>>>> a suitable solution.
>>>>
>>>> In order to fix expose an empty HWCR.
>>> At first I was thinking a straight up revert, but AMD's CPUID Faulting
>>> is an architectural bit in here so it's worth keeping the register around.
>>>
>>>> Fixes: 14b95b3b8546 ('x86/AMD: expose HWCR.TscFreqSel to guests')
>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>> ---
>>>> Not sure whether we want to expose something when is_cpufreq_controller() is
>>>> true, seeing as there's a special wrmsr handler for the same MSR in that case.
>>>> Likely should be done for PV only, but also likely quite bogus.
>>>>
>>>> Missing reported by as the issue came from the QubesOS tracker.
>>> Well - we can at least have a:
>>>
>>> Link: https://github.com/QubesOS/qubes-issues/issues/8502
>>>
>>> in the commit message, and it's probably worth asking Solène / Marek
>>> (both CC'd) if they want a Reported-by tag.
>>>
>>>> ---
>>>>  xen/arch/x86/msr.c | 8 ++++++--
>>>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
>>>> index 3f0450259cdf..964d500ff8a1 100644
>>>> --- a/xen/arch/x86/msr.c
>>>> +++ b/xen/arch/x86/msr.c
>>>> @@ -240,8 +240,12 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>>>>      case MSR_K8_HWCR:
>>>>          if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
>>>>              goto gp_fault;
>>>> -        *val = get_cpu_family(cp->basic.raw_fms, NULL, NULL) >= 0x10
>>>> -               ? K8_HWCR_TSC_FREQ_SEL : 0;
>>>> +        /*
>>>> +         * OpenBSD 7.3 accesses HWCR unconditionally if the TSC is reported as
>>>> +         * Invariant.  Do not set TSC_FREQ_SEL as that would trigger OpenBSD to
>>>> +         * also poke at PSTATE0.
>>>> +         */
>>> While this is true, the justification for removing this is because
>>> TSC_FREQ_SEL is a model specific bit, not an architectural bit in HWCR.
>>>
>>> Also because it's addition without writing into the migration stream was
>>> bogus irrespective of the specifics of the bit.
>>>
>>> I'm still of the opinion that it's buggy for OpenBSD to be looking at
>>> model specific bits when virtualised, but given my latest reading of the
>>> AMD manuals, I think OpenBSD *is* well behaved looking at PSTATE0 if it
>>> can see TSC_FREQ_SEL.
>>>
>>> In some theoretical future where the toolstack better understands MSRs
>>> and (non)migratable VMs (which is the QubesOS usecase), then it would in
>>> principle be fine to construct a VM which can see the host TSC_FREQ_SEL
>>> and PSTATE* values.
>>>
>>> Preferably with an adjusted comment, Reviewed-by: Andrew Cooper
>>> <andrew.cooper3@citrix.com>
>> Sorry - I meant to be clearer here.  I'd suggest just deleting the
>> comment and leaving an unconditional return of 0 (which will become
>> conditional when we wire up CPUID Faulting).
>>
>> MSR_HWCR *is* an architectural MSR on any 64bit AMD system, so shouldn't
>> fault.
> Hm, I think it's worth to at least keep a note that if TSC_FREQ_SEL is
> exposed PSTATE0 must also be exposed to prevent OpenBSD 7.3 from
> panicking.

But there's nothing OpenBSD 7.3 specific about it.

Any software which sees this bit is permitted (expected even) to edit
the pstate registers.


You know why it's called frequency select?  Because firmware is supposed
to program the systemwide frequency/voltage to the user's request for
whether the system wants to run cooler, or be overclocked.


Putting OpenBSD 7.3 in the commit message is absolutely relevant to why
we're making this change now, but it's not relevant to why we have
concluded that TSC_FREQ_SEL is bogus to expose to guests.

~Andrew

