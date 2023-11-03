Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D94E7E05B5
	for <lists+xen-devel@lfdr.de>; Fri,  3 Nov 2023 16:45:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627233.978165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qywLa-0005WW-Hs; Fri, 03 Nov 2023 15:44:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627233.978165; Fri, 03 Nov 2023 15:44:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qywLa-0005U5-EF; Fri, 03 Nov 2023 15:44:34 +0000
Received: by outflank-mailman (input) for mailman id 627233;
 Fri, 03 Nov 2023 15:44:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=va+T=GQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qywLY-0005Tz-F6
 for xen-devel@lists.xenproject.org; Fri, 03 Nov 2023 15:44:32 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e11e0dbd-7a5f-11ee-98d8-6d05b1d4d9a1;
 Fri, 03 Nov 2023 16:44:31 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40837ebba42so14339085e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 03 Nov 2023 08:44:31 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-107-252.as13285.net. [92.26.107.252])
 by smtp.gmail.com with ESMTPSA id
 j28-20020a05600c1c1c00b003fe15ac0934sm6211931wms.1.2023.11.03.08.44.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Nov 2023 08:44:30 -0700 (PDT)
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
X-Inumbo-ID: e11e0dbd-7a5f-11ee-98d8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1699026271; x=1699631071; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=R8MvfRrJRSHNjMGe6FAfum5u6PJqLvR1bBU5o8D0Q3A=;
        b=b0Pr2rp0EBFfeIsAdMMl56A5qz1sidWZlA7GiHMHLpHi92sE1req7oC2vDIQbFHPzY
         YWZeb29ZjSRa+nOu6xASZsraU/z3lc0vdDT20yqruZMD/IDRy/HC1ESc0+aiZgoeH8rx
         Ca672uLqJZ7ii6FODb/p89ISMdoNw3y+PPTa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699026271; x=1699631071;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R8MvfRrJRSHNjMGe6FAfum5u6PJqLvR1bBU5o8D0Q3A=;
        b=ADnJbgJHbqcCQoJATFoucG9rLnZwkcR0Sw3nlBqN//Gfm5dVSUNEx8J0h5Wka8ghZE
         +zvClY6SJvFOwHBN9iaT55EL1H00a8gGBWOQMLOGXYlcZC3J1QPFzzkOlfw5inRVSK2v
         HrC5ZZeqM+jscdASH9fng7niNKrvhDCQntZS6imgCEnJjpZzfk9URgC9dS9WJrLssXns
         buuJ+iYI2nD1Xz0h6nMnXHikO0xTdvJfIAZNWIWAxqJ2As08LR4C31BzD6VS0rZBGR5S
         yei2R+mCo7HzbwuYovt7yOcwJSoz0GtdKBsyDwHxXBl43aLjr5uefRSeZH5pmg9WYlli
         g+OQ==
X-Gm-Message-State: AOJu0YyPQc5VVa7NIwkpUf9a6VOmo7Ah8EjiYOxD6qnfmCNGzkjHea8E
	4eqmCQrPDxgU5SVQsqyjQDP+uw==
X-Google-Smtp-Source: AGHT+IFY4AiCPvaG4UdukUBM1+C10YO5JpcDfa1IceSD9hfxiYbugdV0+v99DNnM8V67tkNQELp9oQ==
X-Received: by 2002:a05:600c:3041:b0:409:703c:b9b1 with SMTP id n1-20020a05600c304100b00409703cb9b1mr1696448wmh.40.1699026270776;
        Fri, 03 Nov 2023 08:44:30 -0700 (PDT)
Message-ID: <ce44f81a-5dae-4c24-9ed2-f3cdffb78129@citrix.com>
Date: Fri, 3 Nov 2023 15:44:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3] x86/x2apic: introduce a mixed physical/cluster mode
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20231103144537.90914-1-roger.pau@citrix.com>
 <93fc77ad-8696-4d83-b916-e47f883ac366@citrix.com> <ZUUS-fzShqxOs5IO@macbook>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZUUS-fzShqxOs5IO@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/11/2023 3:34 pm, Roger Pau Monné wrote:
> On Fri, Nov 03, 2023 at 03:10:18PM +0000, Andrew Cooper wrote:
>> On 03/11/2023 2:45 pm, Roger Pau Monne wrote:
>>> when sending those, as multiple CPUs can be targeted with a single ICR register
>>> write.
>>>
>>> A simple test calling flush_tlb_all() 10000 times in a tight loop on a 96 CPU
>>> box gives the following average figures:
>>>
>>> Physical mode: 26617931ns
>>> Mixed mode:    23865337ns
>>>
>>> So ~10% improvement versus plain Physical mode.  Note that Xen uses Cluster
>>> mode by default, and hence is already using the fastest way for IPI delivery at
>>> the cost of reducing the amount of vectors available system-wide.
>> 96 looks suspiciously like an Intel number.  In nothing else, you ought
>> to say which CPU is it, because microarchitecture matters.  By any
>> chance can we try this on one of the Bergamos, to give us a datapoint at
>> 512?
> Let me see if I can grab the only one that's not broken.
>
> Those figures are from an Intel IceLake IIRC.  Cluster mode is the
> default, so this change shouldn't effect the performance of builds
> that use the default settings.

"shouldn't" being the operative word.

You're presenting evidence to try and convince the reader that the
reasoning is correct.

Therefore, it is important to confirm your assumptions, and that means
measuring and reporting all 3.

Part of the analysis should say "we expected mixed and cluster to be the
same, and the results show that".

And obviously, if mixed and cluster are wildly different, then we take a
step back and think harder.
>>> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
>>> index eac77573bd75..cd9286f295e5 100644
>>> --- a/xen/arch/x86/Kconfig
>>> +++ b/xen/arch/x86/Kconfig
>>> @@ -228,11 +228,18 @@ config XEN_ALIGN_2M
>>>  
>>>  endchoice
>>>  
>>> -config X2APIC_PHYSICAL
>>> -	bool "x2APIC Physical Destination mode"
>>> +choice
>>> +	prompt "x2APIC Destination mode"
>> "x2APIC Driver default" is going to be more meaningful to a non-expert
>> reading this menu entry, IMO.
> I will leave the helps as-is.
Yeah, the help text is fine.  It's just the title itself.

>
>>> +};
>>> +
>>>  static int cf_check update_clusterinfo(
>>>      struct notifier_block *nfb, unsigned long action, void *hcpu)
>>>  {
>>> @@ -220,38 +248,56 @@ static struct notifier_block x2apic_cpu_nfb = {
>>>  static int8_t __initdata x2apic_phys = -1;
>>>  boolean_param("x2apic_phys", x2apic_phys);
>>>  
>>> +enum {
>>> +   unset, physical, cluster, mixed
>>> +} static __initdata x2apic_mode = unset;
>>> +
>>> +static int __init parse_x2apic_mode(const char *s)
>> cf_check
> I'm probably confused, but other users of custom_param() do have the
> cf_check attribute, see parse_spec_ctrl() for example.

Yes, and this function needs one but is missing it.

cf_check equates to "This function needs an ENDBR", which it does
because it's invoked by function pointer.

It likely doesn't expode on a CET-active machine because this logic runs
prior to turning CET-IBT on, and you'll only get a build error in the
buster-ibt pipeline which has a still-unupstreamed GCC patch.

~Andrew

