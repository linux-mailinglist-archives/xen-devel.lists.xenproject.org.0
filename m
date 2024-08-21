Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE22795A0D6
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2024 17:04:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781225.1190770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgms8-0005zh-O9; Wed, 21 Aug 2024 15:03:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781225.1190770; Wed, 21 Aug 2024 15:03:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgms8-0005y5-Ki; Wed, 21 Aug 2024 15:03:40 +0000
Received: by outflank-mailman (input) for mailman id 781225;
 Wed, 21 Aug 2024 15:03:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YIGS=PU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sgms7-0005xz-Dv
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2024 15:03:39 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b17b725-5fce-11ef-8776-851b0ebba9a2;
 Wed, 21 Aug 2024 17:03:37 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a7ab5fc975dso698444366b.1
 for <xen-devel@lists.xenproject.org>; Wed, 21 Aug 2024 08:03:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8682319f00sm41022566b.53.2024.08.21.08.03.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Aug 2024 08:03:36 -0700 (PDT)
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
X-Inumbo-ID: 8b17b725-5fce-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724252617; x=1724857417; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=J/GKRsusI7WeAOn5ZHjsof1xxc38co7wfdy34jubHPM=;
        b=c85ERlOXeKFzx2gZq3pppcdT1AgxK3+s6fdHLqBG8V0lk0XV0Lgqq6DANReYjliLXs
         21jtul5u814SZRm/wMvKYklPa5CFe/77cm1l3ozPFbG4NvQykhWvGIqqe0xT3K3XbvdP
         Ve+9PAp/vkPImRCUeXIkQSQ3K2DlHIIdUN8JeX/k1j6aXJYhuqSMcl1NtZWBe8P6/MRr
         o9GfFHCWjuzmad+8A/21EP+buc/042LF0sEvPK07Zbq8QCMlNHc0CGaocOth8gWub4mO
         eL3QyalQ7sSbMGYgHQkac0aC+8h2W0fD1nnt5waJ3J6AT/iNvb2KQg/uWTq45TaPxTur
         HCcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724252617; x=1724857417;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J/GKRsusI7WeAOn5ZHjsof1xxc38co7wfdy34jubHPM=;
        b=jltEnQOzfgl5dvUsFzHxcP3129iv3oJ5m3kLSXnnCgcFsKAzBiXXCFFG5hUsXqsceN
         uh5J/yHZTorqaKubahCQgEA4tuN727agDGh/X2k5SZ0WeGaSIE0v1TXIWOL88+gmDlrV
         CUzPBoCPwahcInOtrS101BGf6SHQ4s8KwjZfrg0eCPz083lMel5/LIla/4gjJn0CwudP
         GHkq76jo3pVdgOQKw/G8h9++elgEGQlYkW0hgk25Uux38SSnEe2QtUdfH3BkfkhjFKwc
         DGWw9pMlPT8VZii0YESbF8fLz8F8wcGUdTzQcO6/kazQBNx3YUb51C8cREImq0YfUIm/
         LAjw==
X-Forwarded-Encrypted: i=1; AJvYcCUWtldz7v0j183XMdx67U4NpmwZq1mIIKP8wJAXY998YRqi0SgoRxTnGPbnQa7BXAEEqPwUhgL4B+g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxvZiT1/PxspChXBTstNlGU0oXO4/tya8h8TOsPe+RLk79Q8cQu
	yqA4JCbr4HXH/C5PNUYW08/C0W83LbuJzC6L7sSq8jWiAEE/IEei8YrU2bnXEg==
X-Google-Smtp-Source: AGHT+IGmY+ucV6rp6W5V39i36W1o2dycNHM1I3QipyrPp/TjsZaBH+eg2gldxdKaXk7iUIpGqfD1Sw==
X-Received: by 2002:a17:907:9716:b0:a7a:adac:57d5 with SMTP id a640c23a62f3a-a866f2f794dmr183860966b.18.1724252616564;
        Wed, 21 Aug 2024 08:03:36 -0700 (PDT)
Message-ID: <02bf330d-83bc-4fcd-9a1e-a3f1228d2873@suse.com>
Date: Wed, 21 Aug 2024 17:03:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul: convert op_bytes/opc checks in SIMD emulation
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bfc9722a-cb6d-45d0-9351-ddfcd0bbb2e0@suse.com>
 <e96daf14-f1ea-4590-baab-62be50f8d54b@citrix.com>
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
In-Reply-To: <e96daf14-f1ea-4590-baab-62be50f8d54b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.08.2024 15:37, Andrew Cooper wrote:
> On 21/08/2024 2:30 pm, Jan Beulich wrote:
>> Delivering #UD for an internal shortcoming of the emulator isn't quite
>> right. Similarly BUG() is bigger a hammer than needed.
>>
>> Switch to using EXPECT() instead.
>>
>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> To confirm, this is ASSERT_UNREACHABLE() (which fuzzing will now notice
> as an error), and unhandleable in release builds (which ultimately ends
> up in #UD)?

Yes, at least mostly. What exactly UNHANDLEABLE converts to depends on
the use site, I think.

> I think it would be helpful to at least note the fuzzing aspect in the
> commit message.

I've added "This way even for insns not covered by the test harness
fuzzers will have a chance of noticing issues, should any still exist
or new ones be introduced" to the 2nd paragraph.

>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
>> @@ -8114,13 +8114,13 @@ x86_emulate(
>>      }
>>      else if ( state->simd_size != simd_none )
>>      {
>> -        generate_exception_if(!op_bytes, X86_EXC_UD);
>>          generate_exception_if((vex.opcx && (d & TwoOp) &&
>>                                 (vex.reg != 0xf || (evex_encoded() && !evex.RX))),
>>                                X86_EXC_UD);
>>  
>> -        if ( !opc )
>> -            BUG();
>> +        EXPECT(op_bytes);
>> +        EXPECT(opc);
> 
> This is the only BUG() in x86_emulate.c, and it's right to get rid of it
> IMO.
> 
> Therefore, we should have a hunk removing it from
> tools/tests/x86_emulator/x86-emulate.h too, which will prevent
> reintroduction.
> 
> Maybe even undef BUG somewhere in x86_emulate/private.h?

Both of these actions can only be taken if the other BUG() in decode.c
also goes away. But yes, what you suggest is probably the best course of
action. I guess I'll do that in yet another patch, though.

Jan

