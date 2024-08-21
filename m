Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5468995A214
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2024 17:57:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781281.1190830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgnhA-00015T-RH; Wed, 21 Aug 2024 15:56:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781281.1190830; Wed, 21 Aug 2024 15:56:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgnhA-00012l-Nk; Wed, 21 Aug 2024 15:56:24 +0000
Received: by outflank-mailman (input) for mailman id 781281;
 Wed, 21 Aug 2024 15:56:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YIGS=PU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sgnh9-00010L-6s
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2024 15:56:23 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8b83bb6-5fd5-11ef-a508-bb4a2ccca743;
 Wed, 21 Aug 2024 17:56:21 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5bed05c0a2fso6160931a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Aug 2024 08:56:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bf004c2ebfsm3374250a12.1.2024.08.21.08.56.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Aug 2024 08:56:20 -0700 (PDT)
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
X-Inumbo-ID: e8b83bb6-5fd5-11ef-a508-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724255780; x=1724860580; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=v6Je+ckLJh+97f6fcsR2eoHRYR3UlvxLGUbwrJdcHGc=;
        b=BEbPRNxVUJ84eG1XO+K6ymym9z23zxQfMVuKmFkZEBPjzVpFGnoPjFxNitzx0EVT4N
         xrIgmx7Odpeoa2sqW9PXDB7tL8HiPPoiKefs0Mc/Q0JN/17xS+upADdB87u4pGSsfWis
         COj/6RzYgBumO0nOLeer9ldTpwLhy93CAMH+D6Iz9Y1Y6Z6Aj+WhSqF0YGS/ZLcH5WP/
         qbAteYUuCi3Rl4khYUQd0Av3vCa/Ebn5R87zN++tohMOJD4qChTzYrd2+c2M+E6ZheMB
         zTuRBDzPMdpGfpTUQdqG3ycIw9naSrVFYjsBlsHKRwHqx40OBZZ/Vkr+0t/qoEbIDZp4
         UFDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724255780; x=1724860580;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v6Je+ckLJh+97f6fcsR2eoHRYR3UlvxLGUbwrJdcHGc=;
        b=TIJZYFfznVnmXJ+QHweiHFfpHrZTGf/jKYDCTtTazwEH7yvdrDnYBkx2vfxR7ujric
         1rzRh5qwRfQKOreyoJ9s9xxs6heT5tvPXGYqFHieyPYPtieEp8/YzO4N6oE2Xqcvb2Xp
         0L6/MaA0fejmSszHOmZInrXTHf3Lg28ZvSTBRG3203gcTN2E/BjbDXUeZSVuyuPeppCu
         O3WjaHWPo/BWIIrtkzkuFTAC3562UR7vOcTEpI5webzQGjJFbIGU24ZVG2dWywhbW1SW
         4qwp3T8seMRCB5pflOpypOx0ak8vYuDwlCikuYLRyd4hjYaYC7L+v55yu8usCJxSZyUL
         sINQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrXjXL32dQvYPPO8yNWGI0/1NsyyhMOT17Ur6TpvcSX65KgQuAlWCo/Opn/B7pNBVI87SB3SfhTsc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw/0ZjFIyu5i23DXZ7mWl0Rhw3/9ejlC5zRr8qWTYtQcSvfvyen
	4S56wUgLAdujkOgItHdto2kNj3+aBdIPRZszzJ25DjzpcWP/g15idZOKvTsbtw==
X-Google-Smtp-Source: AGHT+IHv3t8qEHow6YhTaET4P26rR/ZuBQne1Q8NL7u9z74n7cBNxOjBT50Aq7cICkf/t5SdJM3Zig==
X-Received: by 2002:a05:6402:34d5:b0:5be:fbce:939e with SMTP id 4fb4d7f45d1cf-5bf1efb58c0mr2420221a12.0.1724255780311;
        Wed, 21 Aug 2024 08:56:20 -0700 (PDT)
Message-ID: <bece14e4-61b9-4f6a-891d-4761821dfde7@suse.com>
Date: Wed, 21 Aug 2024 17:56:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul: convert op_bytes/opc checks in SIMD emulation
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bfc9722a-cb6d-45d0-9351-ddfcd0bbb2e0@suse.com>
 <e96daf14-f1ea-4590-baab-62be50f8d54b@citrix.com>
 <02bf330d-83bc-4fcd-9a1e-a3f1228d2873@suse.com>
 <672e8b2b-2bd6-4099-bbf6-67c39f23cca5@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <672e8b2b-2bd6-4099-bbf6-67c39f23cca5@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.08.2024 17:10, Andrew Cooper wrote:
> On 21/08/2024 4:03 pm, Jan Beulich wrote:
>> On 21.08.2024 15:37, Andrew Cooper wrote:
>>> I think it would be helpful to at least note the fuzzing aspect in the
>>> commit message.
>> I've added "This way even for insns not covered by the test harness
>> fuzzers will have a chance of noticing issues, should any still exist
>> or new ones be introduced" to the 2nd paragraph.
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

>>>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
>>>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
>>>> @@ -8114,13 +8114,13 @@ x86_emulate(
>>>>      }
>>>>      else if ( state->simd_size != simd_none )
>>>>      {
>>>> -        generate_exception_if(!op_bytes, X86_EXC_UD);
>>>>          generate_exception_if((vex.opcx && (d & TwoOp) &&
>>>>                                 (vex.reg != 0xf || (evex_encoded() && !evex.RX))),
>>>>                                X86_EXC_UD);
>>>>  
>>>> -        if ( !opc )
>>>> -            BUG();
>>>> +        EXPECT(op_bytes);
>>>> +        EXPECT(opc);
>>> This is the only BUG() in x86_emulate.c, and it's right to get rid of it
>>> IMO.
>>>
>>> Therefore, we should have a hunk removing it from
>>> tools/tests/x86_emulator/x86-emulate.h too, which will prevent
>>> reintroduction.
>>>
>>> Maybe even undef BUG somewhere in x86_emulate/private.h?
>> Both of these actions can only be taken if the other BUG() in decode.c
>> also goes away. But yes, what you suggest is probably the best course of
>> action. I guess I'll do that in yet another patch, though.
> 
> Is that BUG() local to your tree?  I cant see it in staging.

I first thought it would be when you mentioned you found only one, but it's
been there for a long time[1], in VEX/EVEX prefix decoding. With a comment
added by you[2].

Jan

[1] https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=11c35f84b53622c429071049b830bb9b7a880eff
[2] https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=933acddf74213f77a5adbb2c10ccd3f72634d456

