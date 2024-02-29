Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A58AB86C9EF
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 14:14:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687078.1069899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfgEd-0008Bv-TO; Thu, 29 Feb 2024 13:14:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687078.1069899; Thu, 29 Feb 2024 13:14:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfgEd-0008A4-QZ; Thu, 29 Feb 2024 13:14:03 +0000
Received: by outflank-mailman (input) for mailman id 687078;
 Thu, 29 Feb 2024 13:14:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kPQN=KG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rfgEc-00089y-Fd
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 13:14:02 +0000
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [2607:f8b0:4864:20::f30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6750bbc3-d704-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 14:14:01 +0100 (CET)
Received: by mail-qv1-xf30.google.com with SMTP id
 6a1803df08f44-68f41af71ebso6129136d6.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 05:14:01 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 lx12-20020a0562145f0c00b0068fef90f4cesm716527qvb.99.2024.02.29.05.13.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 05:13:59 -0800 (PST)
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
X-Inumbo-ID: 6750bbc3-d704-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709212440; x=1709817240; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ZP/l18B1Z6kSWg8B7up6I1124bGIubuSaBLfSxaWMc=;
        b=fFV/XYyBzdKAs87dwx/K2xoUi2jXCcLLA9LfPiynz7hkf/r6BGlXlk8BnqjMQ85aLn
         kpinpW/nahDd7ori4vOnBncqYN0tWOnUamJhuoMrva4BiFEO0qLP4SzbxmCTzvk45yk2
         uRh8LcnJMl/lg5rTRyFtlGGlE1pj18jciDYnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709212440; x=1709817240;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ZP/l18B1Z6kSWg8B7up6I1124bGIubuSaBLfSxaWMc=;
        b=SW9iqgnHaU/hLeYjyfXcmqEzKU9o96hSV+8N13ctPM2QxyVRkRFoD1d4OacAHFvQmx
         wUtwG/Kc7oMnJCHn9tqCyZWy1FmDcjKCSWfIpLsIK1XRmP7Y/DEXU2iol9FN36WDIOvv
         9WCUfgrwyjGCT6lxtZ5sYKWOg9D1eVlX/RzsxwRuvjNpCL+071G7iccBzfqDO7PHJFjg
         K413QbmKPzhbXXTF6Y6if78a8UHqV1ylm+Ds+HbDB+/Q07AbbNuChb1ECK47qUsV0/jR
         qb3VUDepRi/BEQcIRAIP2CjjvfpGpAx5IsROnpE+ewfkwa0y2XvQj+5JSftiJQBFi85V
         GZPA==
X-Gm-Message-State: AOJu0Yw2/phLQwE7a1Xfu1mV0OlCtewJv2rjFsFuGGcbuNotqOP6+Phe
	ZiQnpbfG/4zUpx8P6+gMf7b1+k/nYB+YM4KNUATQ7T0EfBtviIw2otCIfwOkhPM=
X-Google-Smtp-Source: AGHT+IFsDo+XLzrg0BFPXr09FpCao10hokXFJkFI0RdFI3TPcO/FB93pS0Af0SyRT+UOgAHpnfsGEQ==
X-Received: by 2002:a05:6214:4959:b0:68f:3dce:7b94 with SMTP id pe25-20020a056214495900b0068f3dce7b94mr2330660qvb.4.1709212440311;
        Thu, 29 Feb 2024 05:14:00 -0800 (PST)
Message-ID: <e5225318-9914-4264-90ec-b7e8c2c0d6e3@citrix.com>
Date: Thu, 29 Feb 2024 13:13:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpu-policy: Fix x2APIC visibility for PV guests
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
References: <20240229104304.2478614-1-andrew.cooper3@citrix.com>
 <ZeBw96VzCVeF0-6T@macbook>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZeBw96VzCVeF0-6T@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/02/2024 11:56 am, Roger Pau Monné wrote:
> On Thu, Feb 29, 2024 at 10:43:04AM +0000, Andrew Cooper wrote:
>> Right now, the host x2APIC setting filters into the PV max and default
>> policies, yet PV guests cannot set MSR_APIC_BASE.EXTD or access any of the
>> x2APIC MSR range.  Therefore they absolutely shouldn't see the x2APIC bit.
>>
>> Linux has workarounds for the collateral damage caused by this leakage; it
>> unconditionally filters out the x2APIC CPUID bit, and EXTD when reading
>> MSR_APIC_BASE.
>>
>> Hide the x2APIC bit in the PV default policy, but for compatibility, tolerate
>> incoming VMs which already saw the bit.  This is logic from before the
>> default/max split in Xen 4.14 which wasn't correctly adjusted at the time.
>>
>> Update the annotation from !A to !S which slightly better describes that it
>> doesn't really exist in PV guests.  HVM guests, for which x2APIC can be
>> emulated completely, already has it unconditionally set in the max policy.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>>
>> This wants backporting as far as people can tollerate, but it's really not
>> obvious which commit in 4.14 should be referenced in a Fixes: tag.
> Oh, so we didn't use to expose x2APIC in Xen < 4.14 for PV at all?

We did conditionally expose x2APIC to PV guests prior to that.

What we didn't have in Xen < 4.14 was a split between max and default
policies.  Everything before 4.14 is far harder to reason about.

>
> I think this need mentioning in the commit message, as it's not clear
> whether x2APIC has always been advertised to guests.
>
> If it's indeed only Xen 4.14 that started exposing the flag, it's IMO
> less dangerous to stop exposing it.  My main concern would be OSes
> having grow some dependency on it, and us no longer exposing it
> causing collateral damage (which would be an OS bug anyway).

As I said, Linux explicitly self-hides the cap, because at one point it
tried turning x2APIC on and got unhappy at getting a #GP back.

Juergen may remember better.  IIRC it was fallout from making WRMSR not
always-silently-safe.AFAICT NetBSD doesn't explode because it's
x2APIC-enablement logic is inside #ifndef XENPV.
>> ---
>>  xen/arch/x86/cpu-policy.c                   | 19 +++++++++++++++++--
>>  xen/include/public/arch-x86/cpufeatureset.h |  2 +-
>>  2 files changed, 18 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
>> index 10079c26ae24..a0205672428d 100644
>> --- a/xen/arch/x86/cpu-policy.c
>> +++ b/xen/arch/x86/cpu-policy.c
>> @@ -534,6 +534,14 @@ static void __init calculate_pv_max_policy(void)
>>      *p = host_cpu_policy;
>>      x86_cpu_policy_to_featureset(p, fs);
>>  
>> +    /*
>> +     * Xen at the time of writing (Feb 2024, 4.19 dev cycle) used to leak the
>> +     * host x2APIC capability into PV guests, but never supported the guest
>> +     * trying to turn x2APIC mode on.  Tolerate an incoming VM which saw the
>> +     * x2APIC CPUID bit.
>> +     */
>> +    __set_bit(X86_FEATURE_X2APIC, fs);
>> +
>>      for ( i = 0; i < ARRAY_SIZE(fs); ++i )
>>          fs[i] &= pv_max_featuremask[i];
>>  
>> @@ -566,6 +574,14 @@ static void __init calculate_pv_def_policy(void)
>>      *p = pv_max_cpu_policy;
>>      x86_cpu_policy_to_featureset(p, fs);
>>  
>> +    /*
>> +     * PV guests have never been able to use x2APIC mode, but at the time of
>> +     * writing (Feb 2024, 4.19 dev cycle), the host value used to leak into
>> +     * guests.  Hide it by default so new guests don't get mislead into
>> +     * thinking that they can use x2APIC.
>> +     */
>> +    __clear_bit(X86_FEATURE_X2APIC, fs);
> IIRC if you use the 'S' tag it won't be added to the default PV policy
> already, so there should be nothing to clear?  pv_def_featuremask
> shouldn't contain the bit in the first place.

Bah.  That means there's a bug visible in context.  Serves me right for
last minute clean-up...

I need to set the bit after applying pv_max_featuremask[].

~Andrew

