Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA959B29E4C
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 11:47:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1085821.1444095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unwSK-0005FZ-1Y; Mon, 18 Aug 2025 09:47:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1085821.1444095; Mon, 18 Aug 2025 09:47:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unwSJ-0005Cu-V2; Mon, 18 Aug 2025 09:47:07 +0000
Received: by outflank-mailman (input) for mailman id 1085821;
 Mon, 18 Aug 2025 09:47:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GLF1=26=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1unwSJ-0005Co-8a
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 09:47:07 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ce2cd29-7c18-11f0-a32a-13f23c93f187;
 Mon, 18 Aug 2025 11:47:06 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-45a1b0d231eso21228965e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 02:47:06 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a215c324esm76310885e9.2.2025.08.18.02.47.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 02:47:04 -0700 (PDT)
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
X-Inumbo-ID: 4ce2cd29-7c18-11f0-a32a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755510425; x=1756115225; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=j/MNnu/hMDSAULP+vzRIufVXXke7I2U7psw3JI0EXFU=;
        b=v2ylvsD5nWigljTtbVjdTLE5cKymQFIRqVycxOUiWW+amEDqpeti0Pq/OtO2XLV7ep
         RQy7HdqX7jMtESAX84auGPDqefR5BOUL/BqovjqfTtn54jDkUpL7t1EQh3XzkMiXQNF4
         aVOy/jPsKYhfF9G7+pZxshtt3cWPrgQMVarhQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755510425; x=1756115225;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j/MNnu/hMDSAULP+vzRIufVXXke7I2U7psw3JI0EXFU=;
        b=B2f3iHQ1bIC2w+QfV7OiqBgzXc6FI6jsUfLE4IUu3zj8769JylkrqBl6XHrGEeCGSG
         pHhxGNjkyMt/25LVO7jJT1jrw6uERN1wMLjqVbKHMcDOXN8nh9tQGb+Tm3sDtn1ZyO5R
         fhDalG7JCkFkqvCzCd/g2E1mUwdqodoc+z2ep/9GJQyV1TnLQlj2a6hlYfjkIA2dOgpN
         wLBY16KgWlQl1TtcLM1vYYBkl100vWpTeXevFdVANCcw8J3UnIZShZ+mZetAwi0OQkuZ
         3N21R3IS0okiyEtfJJ13qErFnnH6eRqMxPOlbq8NW8/58lxkb+kh1q56x1dkh4+WbNK7
         u8Xg==
X-Forwarded-Encrypted: i=1; AJvYcCUAa27xaSz6NAjlV2n30y3fG8pkKWxHOZCJoirCU48aAjb4sUWJaSg7viEvBH2iYyFgz6RcL+6Qkmk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxQKTD+O5wIyrFE/mQcNa0GIMJwAE38zWtCyAuNDHzvxJSqQLJ5
	rHU/23ATGGDkDL1QLoMA5JPNt7UrAibA2lwLXfwcTDX4LFJSlbnCMOWB0m3+5j+1pXU=
X-Gm-Gg: ASbGncslM+3+Bdi9kfUiojbwdaC1Y/ZRL2Cpgro12uuNhZivEDsZaEipha50yb/IN2f
	Z7n75UeQugUukHc8AcXv2S76b/umH7Aqc/CZ7fBJ0zX1FvFcp12+gRRld/FGRIVaTThcFmr7B6D
	uLWEY/zDM8WkSYnBw8avDzX26y2wnwK8dQKyJFN0fJVWFdy+EUpw1FkX7ue3ijYlAK/I9EUZiKr
	WB4j3Ify5g91tqL2j2RcVhBXnel6YbKW8p7f6OJaW6R+CPuto6Be6G+tDAW7ca3ijqqshLVYunj
	o1pT14mOmr0/NiVtUJPZqQ3ezxA7IujlRYqPQwDo0313Fzl32fhm+mXzURjsoS8fpbNmnDy/LdS
	OAtD5N6f/TYIJauLx9/jYv17ts0gUdwxPiSwvh07nf+Qzr+4Sc8kazt3KjZPz+l3XyQQB
X-Google-Smtp-Source: AGHT+IEODAeiC9Rms1J/h0+U278Och1Q2kIohmSa8o6zcUHFjsoPjx8PxE8EiPecMGU3o0zLygfrhg==
X-Received: by 2002:a05:600c:354b:b0:456:eb9:5236 with SMTP id 5b1f17b1804b1-45a21808b2bmr104653435e9.15.1755510425364;
        Mon, 18 Aug 2025 02:47:05 -0700 (PDT)
Message-ID: <17fd42cf-ce42-4757-afce-0b7c4d13de25@citrix.com>
Date: Mon, 18 Aug 2025 10:47:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/22] x86/traps: Enable FRED when requested
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-23-andrew.cooper3@citrix.com>
 <1d6494f6-fbef-436f-a379-a98e02b20710@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1d6494f6-fbef-436f-a379-a98e02b20710@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/08/2025 10:35 am, Jan Beulich wrote:
> On 08.08.2025 22:23, Andrew Cooper wrote:
>> With the shadow stack and exception handling adjustements in place, we can now
>> activate FRED when appropriate.  Note that opt_fred is still disabled by
>> default.
>>
>> Introduce init_fred() to set up all the MSRs relevant for FRED.  FRED uses
>> MSR_STAR (entries from Ring3 only), and MSR_FRED_SSP_SL0 aliases MSR_PL0_SSP
>> when CET-SS is active.  Otherwise, they're all new MSRs.
>>
>> With init_fred() existing, load_system_tables() and legacy_syscall_init()
>> should only be used when setting up IDT delivery.  Insert ASSERT()s to this
>> effect, and adjust the various *_init() functions to make this property true.
>>
>> Per the documentation, ap_early_traps_init() is responsible for switching off
>> the boot GDT, which needs doing even in FRED mode.
>>
>> Finally, set CR4.FRED in {bsp,ap}_early_traps_init().
> Probably you've done that already, but these last two paragraphs will need
> updating following patch 08 v1.1.

It's on my list, but not done yet.

>
>> Xen can now boot in FRED mode up until starting a PV guest, where it faults
>> because IRET is not permitted to change privilege.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks, but I fear this patch has changed too much.  I'll take a
decision when I've cleaned up the integration of the PV work.

>
>> @@ -274,6 +279,44 @@ static void __init init_ler(void)
>>      setup_force_cpu_cap(X86_FEATURE_XEN_LBR);
>>  }
>>  
>> +/*
>> + * Set up all MSRs relevant for FRED event delivery.
>> + *
>> + * Xen does not use any of the optional config in MSR_FRED_CONFIG, so all that
>> + * is needed is the entrypoint.
>> + *
>> + * Because FRED always provides a good stack, NMI and #DB do not need any
>> + * special treatment.  Only #DF needs another stack level, and #MC for the
>> + * offchance that Xen's main stack suffers an uncorrectable error.
>> + *
>> + * FRED reuses MSR_STAR to provide the segment selector values to load on
>> + * entry from Ring3.  Entry from Ring0 leave %cs and %ss unmodified.
>> + */
>> +static void init_fred(void)
>> +{
>> +    unsigned long stack_top = get_stack_bottom() & ~(STACK_SIZE - 1);
>> +
>> +    ASSERT(opt_fred == 1);
>> +
>> +    wrmsrns(MSR_STAR, XEN_MSR_STAR);
>> +    wrmsrns(MSR_FRED_CONFIG, (unsigned long)entry_FRED_R3);
>> +
>> +    wrmsrns(MSR_FRED_RSP_SL0, (unsigned long)(&get_cpu_info()->_fred + 1));
>> +    wrmsrns(MSR_FRED_RSP_SL1, 0);
> In the event of a bug somewhere causing this slot to be accessed, is the
> wrapping behavior well-defined, resulting in an attempt to write to the
> top end of VA space? (Then again, if the wrapping itself caused a fault,
> the overall effect would be largely the same - in many cases #DF.)

The wrapping is well defined - like other cases, it goes to the top of
address space, but that's owned by PV guests.  SMAP ought to mitigate
what would otherwise be a priv-esc.

With IDT, we poisoned the unused pointers with non-canonical addresses,
but that's not possible here, as they're MSRs and checked at this point,
rather than when they're used.

I suspect the best we can do is reuse the #DB or NMI stacks, and
intentionally reverse the regular and shadow stack pointers, meaning
that any attempt to use SL1 will hit a guard page and escalate to #DF.

~Andrew

