Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B56377A4B07
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 16:21:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604094.941309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiF7G-0002cB-HW; Mon, 18 Sep 2023 14:20:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604094.941309; Mon, 18 Sep 2023 14:20:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiF7G-0002Zw-Ek; Mon, 18 Sep 2023 14:20:46 +0000
Received: by outflank-mailman (input) for mailman id 604094;
 Mon, 18 Sep 2023 14:20:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ngl4=FC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qiF7E-0002Zq-Hl
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 14:20:44 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ca7f052-562e-11ee-9b0d-b553b5be7939;
 Mon, 18 Sep 2023 16:20:42 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3214d4ecd39so1110931f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Sep 2023 07:20:42 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 f13-20020a5d568d000000b0031fd849e797sm12632678wrv.105.2023.09.18.07.20.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Sep 2023 07:20:41 -0700 (PDT)
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
X-Inumbo-ID: 8ca7f052-562e-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1695046842; x=1695651642; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1tvnMSfJQ0y/S7NaF2xcO4uXI/f0UBKn80Bbhm57+Ds=;
        b=ab1Z1Fu0wkT1eP+80CBkI+VkwCTwIXIBqgKyBer80Gcj+N1b+iiTH7m6Jn0/0s4wbe
         eHDG9Vc/BDEGCLYh/OlPrF405kfoCUMAIC7heF07HbX4ht9VZXJMzA1ZbC59Uz1/6CA5
         U0og4Ka9uafQzISj0Ka7IfDXJ38EAP80FwTuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695046842; x=1695651642;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1tvnMSfJQ0y/S7NaF2xcO4uXI/f0UBKn80Bbhm57+Ds=;
        b=AdYCDed1U0CSGy7/MuqZ4vbwY4/4Wh6hndFTW7nQqERgxj/gNlMbYdkXuJxuW8CZQC
         n0DyUJaExErsv9BgnY3QxYdnA9mZk1FPbm/mvqoGklwKQ4/EUoVT0yBtYM9OkHjo/3+K
         JUKObVseXHCgDHVVVp98B2wE9FjlhI98hpD01s/08FF2LysLDkw3UUmH5wMG3JhattiR
         wW2cgpumJ7giSIEYkRdG+s+BPxxLbM8lA9YYITkNvMaKaVrOjfzY1iQP11E3liqGDv7W
         29JHx1+Z1XwGzoO71dH+b3lfrq10NNmvBTdBd3upbtheql+7nuTjS53DOvXMeE5dct0y
         bTQQ==
X-Gm-Message-State: AOJu0Yyh6Aviwy/qA4eGPTfk4q/QV2wqFEavtJCuLVWXpLVr9sTsbtyB
	66NkqbiAbZ2gERP8Uv+mBY+z6w==
X-Google-Smtp-Source: AGHT+IE8lziHllWZxVCf7MtcsN5GAO5vu+kT675UKHzUnhzswe39wIaAArp2ntNMYiTJ9RfUCf/FRA==
X-Received: by 2002:a5d:6309:0:b0:313:f463:9d40 with SMTP id i9-20020a5d6309000000b00313f4639d40mr6746009wru.65.1695046841830;
        Mon, 18 Sep 2023 07:20:41 -0700 (PDT)
Message-ID: <a29c7623-631e-e104-d7d6-2bf97af0bebf@citrix.com>
Date: Mon, 18 Sep 2023 15:20:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 9/9] x86/spec-ctrl: Mitigate the Zen1 DIV leakge
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230915150038.602577-1-andrew.cooper3@citrix.com>
 <20230915150038.602577-10-andrew.cooper3@citrix.com>
 <13289cc3-c419-0625-06c9-e7ffd79f9890@suse.com>
In-Reply-To: <13289cc3-c419-0625-06c9-e7ffd79f9890@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/09/2023 12:15 pm, Jan Beulich wrote:
> On 15.09.2023 17:00, Andrew Cooper wrote:
>> In the Zen1 microarchitecure, there is one divider in the pipeline which
>> services uops from both threads.  In the case of #DE, the latched result from
>> the previous DIV to execute will be forwarded speculatively.
>>
>> This is an interesting covert channel that allows two threads to communicate
>> without any system calls.  In also allows userspace to obtain the result of
>> the most recent DIV instruction executed (even speculatively) in the core,
>> which can be from a higher privilege context.
>>
>> Scrub the result from the divider by executing a non-faulting divide.  This
>> needs performing on the exit-to-guest paths, and ist_exit-to-Xen.
>>
>> This is XSA-439 / CVE-2023-20588.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
> Nevertheless I would have hoped you add at least a sentence on the alternatives
> patching of the IST path. Hitting #MC while patching is possible, after all
> (yes, you will tell me that #MC is almost certainly fatal to the system anyway,
> but still).

I'll see what I can do.

>
>> @@ -955,6 +960,46 @@ static void __init srso_calculations(bool hw_smt_enabled)
>>          setup_force_cpu_cap(X86_FEATURE_SRSO_NO);
>>  }
>>  
>> +/*
>> + * The Div leakage issue is specific to the AMD Zen1 microarchitecure.
>> + *
>> + * However, there's no $FOO_NO bit defined, so if we're virtualised we have no
>> + * hope of spotting the case where we might move to vulnerable hardware.  We
>> + * also can't make any useful conclusion about SMT-ness.
>> + *
>> + * Don't check the hypervisor bit, so at least we do the safe thing when
>> + * booting on something that looks like a Zen1 CPU.
>> + */
>> +static bool __init has_div_vuln(void)
>> +{
>> +    if ( !(boot_cpu_data.x86_vendor &
>> +           (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
>> +        return false;
>> +
>> +    if ( (boot_cpu_data.x86 != 0x17 && boot_cpu_data.x86 != 0x18) ||
>> +         !is_zen1_uarch() )
>> +        return false;
>> +
>> +    return true;
>> +}
> Just to mention it - personally I consider
>
>     ...
>     if ( ... )
>         return true;
>
>     return false;
> }
>
> a minor anti-pattern, as a sole return imo makes more clear what's going on.

Well yes, here is an area where we disagree.

It's the same as trailing commas on lists, or "| 0)" for bitmaps for
making a smaller delta for future changes.

> In a case like this, where you intentionally split return paths anyway, I'd
> then go with
>
> static bool __init has_div_vuln(void)
> {
>     if ( !(boot_cpu_data.x86_vendor &
>            (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
>         return false;
>
>     if ( boot_cpu_data.x86 != 0x17 && boot_cpu_data.x86 != 0x18 )
>         return false;
>
>     return is_zen1_uarch();
> }

I'll swap to this because there is no realistic chance of the logic
chain needing to expand.

~Andrew

