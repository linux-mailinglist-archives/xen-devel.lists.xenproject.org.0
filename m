Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A80F47EFF46
	for <lists+xen-devel@lfdr.de>; Sat, 18 Nov 2023 12:35:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635678.991590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4JaN-0006yU-Br; Sat, 18 Nov 2023 11:34:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635678.991590; Sat, 18 Nov 2023 11:34:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4JaN-0006wa-90; Sat, 18 Nov 2023 11:34:03 +0000
Received: by outflank-mailman (input) for mailman id 635678;
 Sat, 18 Nov 2023 11:34:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BpU/=G7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r4JaL-0006wE-AG
 for xen-devel@lists.xenproject.org; Sat, 18 Nov 2023 11:34:01 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c5ea2ce-8606-11ee-9b0e-b553b5be7939;
 Sat, 18 Nov 2023 12:33:58 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9e62ab773f1so396751266b.0
 for <xen-devel@lists.xenproject.org>; Sat, 18 Nov 2023 03:33:57 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-107-252.as13285.net. [92.26.107.252])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a170906230200b009fb1fc8c405sm341966eja.179.2023.11.18.03.33.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Nov 2023 03:33:56 -0800 (PST)
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
X-Inumbo-ID: 5c5ea2ce-8606-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700307237; x=1700912037; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eVMK8+9Ti4sdXtchR56vwhKUrulyxbrfLvmIGV36RPw=;
        b=mQ3/SUhZy23dP3N1888kCItrmYH4wHZ/oJbXVoiCMxsCQ2ptqZ+eE7yrr/FUsg/Dgd
         Ox2qoTqdxxM/LYtdRqmXBrlab2V8mdow6kdUPTM9hu+KS66Fe1/KGz46zCBkq4GLaa+4
         /q6Xl/v6Yr5mFfVNySvYv+ahfCCi6i5d8xSMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700307237; x=1700912037;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eVMK8+9Ti4sdXtchR56vwhKUrulyxbrfLvmIGV36RPw=;
        b=V/zurvJGJd8tGS7G0g40cqqhXUna3Nou8spokdsapq5Sb0yoxpDpHIiDIrf1+79ar+
         S4+SAACYdWarq5ZGy+kSTjCjmD0mD7F4vQFcWNzAkJZxx7D/3L3I5eVF6jtvtA7gT4zi
         KTo8DSVg8cTU4ODb1QhAv/lxlTduNk/f2E7yHUmiHaI5HCb/1XaYHQNg8RLCXy27lEST
         3odyDbk8nU7oaMhzaa89YBNMbqwMuKLRRfJS1+fWIYhstsPeQjRti2b3clExHeSmdaUH
         nh3wtxjeaUy2TaR9K1yp4qHjf9r20j+Wp+GgNWPLYSVQXViPGJHR7O5UYjEzhJpu+I/p
         9U8Q==
X-Gm-Message-State: AOJu0YwfDTZiOjWEASGJ9JKvsBNcLkIQBRbCqd5s3w6FZSYYnSXAPQqR
	lhXU8Is0GcdlfY5pnCN3mQnWnA==
X-Google-Smtp-Source: AGHT+IFcqMzf/6hVVglbtLGqRg/+PrcXZKXkD1HfLAe5x1Gy8V+ffRgI4QeNg8GI64cJVuOK/5z7UQ==
X-Received: by 2002:a17:907:3da8:b0:9dd:6664:1a3a with SMTP id he40-20020a1709073da800b009dd66641a3amr1915608ejc.51.1700307236791;
        Sat, 18 Nov 2023 03:33:56 -0800 (PST)
Message-ID: <81f6bbd5-0487-461a-af1a-dbb6ead47cab@citrix.com>
Date: Sat, 18 Nov 2023 11:33:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/x2apic: introduce a mixed physical/cluster mode
Content-Language: en-GB
To: Elliott Mitchell <ehem+xen@m5p.com>, Henry Wang <Henry.Wang@arm.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Neowutran <xen@neowutran.ovh>
References: <20231024135150.49232-1-roger.pau@citrix.com>
 <ZT/Cs+MsBPibcc9D@mattapan.m5p.com> <ZT_LWjKgQxOE9lpj@macbook>
 <ZUqRfgAmzJRImW4O@mattapan.m5p.com>
 <hqj6xjxb7r5lb52biejbzzue2jth3rcth3bouadya4jwarll4l@oswerq2ejbli>
 <ZVgp0wshHg3ZQ/Md@mattapan.m5p.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZVgp0wshHg3ZQ/Md@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/11/2023 3:04 am, Elliott Mitchell wrote:
> On Fri, Nov 17, 2023 at 11:12:37AM +0100, Neowutran wrote:
>> On 2023-11-07 11:11, Elliott Mitchell wrote:
>>> On Mon, Oct 30, 2023 at 04:27:22PM +01
>>>> On Mon, Oct 30, 2023 at 07:50:27AM -0700, Elliott Mitchell wrote:
>>>>> On Tue, Oct 24, 2023 at 03:51:50PM +0200, Roger Pau Monne wrote:
>>>>>> diff --git a/xen/arch/x86/genapic/x2apic.c b/xen/arch/x86/genapic/x2apic.c
>>>>>> index 707deef98c27..15632cc7332e 100644
>>>>>> --- a/xen/arch/x86/genapic/x2apic.c
>>>>>> +++ b/xen/arch/x86/genapic/x2apic.c
>>>>>> @@ -220,38 +239,56 @@ static struct notifier_block x2apic_cpu_nfb = {
>>>>>>  static int8_t __initdata x2apic_phys = -1;
>>>>>>  boolean_param("x2apic_phys", x2apic_phys);
>>>>>>  
>>>>>> +enum {
>>>>>> +   unset, physical, cluster, mixed
>>>>>> +} static __initdata x2apic_mode = unset;
>>>>>> +
>>>>>> +static int __init parse_x2apic_mode(const char *s)
>>>>>> +{
>>>>>> +    if ( !cmdline_strcmp(s, "physical") )
>>>>>> +        x2apic_mode = physical;
>>>>>> +    else if ( !cmdline_strcmp(s, "cluster") )
>>>>>> +        x2apic_mode = cluster;
>>>>>> +    else if ( !cmdline_strcmp(s, "mixed") )
>>>>>> +   
>>>>>> +    else
>>>>>> +        return EINVAL;
>>>>>> +
>>>>>> +    return 0;
>>>>>> +}
>>>>>> +custom_param("x2apic-mode", parse_x2apic_mode);
>>>>>> +
>>>>>>  const struct genapic *__init apic_x2apic_probe(void)
>>>>>>  {
>>>>>> -    if ( x2apic_phys < 0 )
>>>>>> +    /* x2apic-mode option has preference over x2apic_phys. */
>>>>>> +    if ( x2apic_phys >= 0 && x2apic_mode == unset )
>>>>>> +        x2apic_mode = x2apic_phys ? physical : cluster;
>>>>>> +
>>>>>> +    if ( x2apic_mode == unset )
>>>>>>      {
>>>>>> -        /*
>>>>>> -         * Force physical mode if there's no (full) interrupt remapping support:
>>>>>> -         * The ID in clustered mode requires a 32 bit destination field due to
>>>>>> -         * the usage of the high 16 bits to hold the cluster ID.
>>>>>> -         */
>>>>>> -        x2apic_phys = iommu_intremap != iommu_intremap_full ||
>>>>>> -                      (acpi_gbl_FADT.flags & ACPI_FADT_APIC_PHYSICAL) ||
>>>>>> -        
>>>>>> -    }
>>>>>> -    else if ( !x2apic_phys )
>>>>>> -        switch ( iommu_intremap )
>>>>>> +        if ( acpi_gbl_FADT.flags & ACPI_FADT_APIC_PHYSICAL )
>>>>>>          {
>>>>> Could this explain the issues with recent AMD processors/motherboards?
>>>>>
>>>>> Mainly the firmware had been setting this flag, but Xen was previously
>>>>> ignoring it?
>>>> No, not unless you pass {no-}x2apic_phys={false,0} on the Xen command
>>>> line to force logical (clustered) destination mode.
>>>>
>>>>> As such Xen had been attempting to use cluster mode on an
>>>>> x2APIC where that mode was broken for physical interrupts?
>>>> No, not realy, x2apic_phys was already forced to true if
>>>> acpi_gbl_FADT.flags & ACPI_FADT_APIC_PHYSICAL is set on the FADT (I
>>>> just delete that line in this same chunk and move it here).
>>> Okay, that was from a quick look at the patch.  Given the symptoms and
>>> workaround with recent AMD motherboards, this looked
>>>
>>> In that case it might be a bug in what AMD is providing to motherboard
>>> manufacturers.  Mainly this bit MUST be set, but AMD's implementation
>>> leaves it unset.
>>>
>>> Could also be if the setup is done correctly the bit can be cleared, but
>>> multiple motherboard manufacturers are breaking this.  Perhaps the steps
>>> are fragile and AMD needed to provide better guidance.
>>>
>>>
>>> Neowutran, are you still setup to and interested in doing
>>> experimentation/testing with Xen on your AMD computer?  Would you be up
>>> for trying the patch here:
>>>
>>> https://lore.kernel.org/xen-devel/20231106142739.19650-1-roger.pau@citrix.com/raw
>>>
>>> I have a suspicion this *might* fix the x2APIC issue everyone has been
>>> seeing.
>>>
>>> How plausible would it be to release this as a bugfix/workaround on 4.17?
>>> I'm expecting a "no", but figured I should ask given how widespread the
>>> issue is.
>> I just applied the patch on my setup ( https://lore.kernel.org/xen-devel/20231106142739.19650-1-roger.pau@citrix.com/raw ) 
>> It seems to fix the x2APIC issue I was having. 
>>
>> I only did some quick tests: 
>>
>> I tried all the differents values in my bios for the X2APIC settings. 
>> Now the system successfully boot in all the cases, without needing
>> manual override of the x2apic_phys/x2apic_mode parameter in boot commandline .
> In light of this issue effecting a large number of people with recent
> hardware, I formally request the patch
> "x86/x2apic: introduce a mixed physical/cluster mode" be considered for
> backport release on the 4.17 and 4.18 branches.
>
> (I'm unsure whether it is realistic for a 4.17 update, but I figure I
> should ask)

This is an unreasonable ask.

I believe you when you say there is (or at least was) an x2apic bug (or
bugs), but not once did you provide the logging requested, nor engage
usefully with us in debugging.

And despite this, we (Roger, Jan and myself) found, fixed and backported
3 x2apic bugs.

Now you come along guessing alone at x2apic in a patch name that it
fixes your problem, on a patch which is not a bugfix - it's a
performance optimisation.


Neowutran, thankyou for looking into the patch, but I'm afraid that
doesn't confirm that this patch fixed an issue either.  If it really did
make a difference, then you'll see a difference in behaviour using each
of the 3 new x2apic-mode= options.

Please could you take your single up-to-date build of Xen, put the BIOS
settings back to whatever was causing you problems originally, and
describe what happens when booting each of
x2apic-mode={physical,cluster,mixed}?

Thankyou,

~Andrew

