Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B045B20560
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 12:32:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077249.1438322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulPos-0001Ox-LD; Mon, 11 Aug 2025 10:31:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077249.1438322; Mon, 11 Aug 2025 10:31:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulPos-0001Mb-He; Mon, 11 Aug 2025 10:31:58 +0000
Received: by outflank-mailman (input) for mailman id 1077249;
 Mon, 11 Aug 2025 10:31:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ku41=2X=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ulPor-0001MS-Cm
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 10:31:57 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66846272-769e-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 12:31:54 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-af95b919093so613436966b.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 03:31:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a21e44csm1979783366b.113.2025.08.11.03.31.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 03:31:53 -0700 (PDT)
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
X-Inumbo-ID: 66846272-769e-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754908314; x=1755513114; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CcECooaoX2K3eYcUs8dHALXgGv0tdfmv1BNxzXjhzFo=;
        b=ZXf9nYdoWCrbVDPPiWi0DxInlLXcsZAzFqrk8gm/fpu8pg6sg2ravd0KWUhqF1spxW
         GScr7vjZpQ0FXCjusC7Y1UtIhjion9MIgiShNyq0JhpVTDZvnaRKKBA6nAI+JlynbZnY
         9lBBfLYgzwOwTBI5QVe1+rXgnK+wNoyiH8GlLxW724UhGyrm6/noO6GMu5BnwuIq7l3W
         xX3N2P8kqgQggLC5dcI935vdswGoaeRylXMZCsL+YwRdvgPPs7RK216cLo74MAlRnHmr
         v7u5iC/PWk56gPWGTJroJgUsPWA/ZFY1XT0Y7KCD11LK3cURQQ6CfCweouOrK6nZp8Zw
         3meQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754908314; x=1755513114;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CcECooaoX2K3eYcUs8dHALXgGv0tdfmv1BNxzXjhzFo=;
        b=EekcGo2/zKdwzUcg4LUU7kIN4UyzopuReG1Kr0kYp+YbHY897bNa63W6NyI8j+dgUW
         uEq4Q3c6qYs8t5R2e4TpLq9OXLBi8dMYNzdqGeoD+tLA85AV4uYw6Zm4tswVvJyUZ0wD
         k/w41wKTI1+xcGMSnIVj9zrNliQ0pCT7aFx0yFRj8rL0mVzmc6WUQakkQX/1O31sTbd2
         S9DOP79FeDlqu0DUMqlsz/wAGFImEljB4LzX0onf4rei9bZL0IJs9NIUXCzfzmFYvtce
         So1T9NQ3mKUGfQN/hCW+7rBiSNlRU8GEhsHVz/8H5UcDINoHS266izSQQj3EYEkKGjWZ
         b/FA==
X-Forwarded-Encrypted: i=1; AJvYcCUqhAWYx8DUVuNL9BpUBl2PFx4dgyFUROPeqHLaXdbqKDmtsKacCQEerQsi7BSWO2c/dlS1RfGRn/A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxUq2Pg5oeRi3PtD2hpIGqyrgsNvPOYHzQSG41HDPHTCKOjQ/2X
	YspaFkagH4FjA4ifi48slOoyTbIBeJTN4/cYpynB3tdZ7B/KlJq8gN0YVraWJL7zcg==
X-Gm-Gg: ASbGncszlNo+jYht1QHAeNUhVAQVDqTXM5/Mp4doM7ECsPoOy4niPuo/e38YtsfgoGP
	xMriUn9UcxGoGwZ5vSzc75yyxRG27V/BEt3k/1pD/Q+3FdCEH6UPhKn9o56oBwtpAFSEMqC8Uyp
	vBWRq29HtNiir4H8Zv1TXbGXAPH6GVA3JOboL/XTIdex/Yn+1fGQpcTgUeYasQe3WKFZhpwZxlb
	aluBI2nbRGwkU3riemAe2rBqj5FC2RIC9+aaMmsHMQObRRRbAsKe+2ERpScwvWwfvrPLRg1/WMx
	7wzmYjH+AI6SG4tZhfkSIHqBY6wAeh6mGcybsA9H2mj9Mspm1UzzAf78VBBrTQk5tJmPnQFJBJ4
	qvwbP/yjLpK3d+1j47M6nIM6v3mw8V6NiSZmeX/hpdswbuLjitJh7nIC93rWQaRMbi8GjkLSpFM
	D7/m+NZtA=
X-Google-Smtp-Source: AGHT+IEyssErcQyDK8UUnso3kpYdejaQTfW3cPNsLubyTKDxeMrQPeNKTo11wfspe81LuYiZs5xufg==
X-Received: by 2002:a17:907:e90:b0:ae3:5e70:330d with SMTP id a640c23a62f3a-af9c640ea1bmr1166439066b.12.1754908314008;
        Mon, 11 Aug 2025 03:31:54 -0700 (PDT)
Message-ID: <5af38bf6-ec55-45e1-9367-9479c2f9b298@suse.com>
Date: Mon, 11 Aug 2025 12:31:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RFC x86/msr: Use WRMSRNS $imm when available
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808222013.1071291-1-andrew.cooper3@citrix.com>
 <e81bc459-347c-4eb9-8f8e-ada25fe8966f@suse.com>
 <0d78dd8e-af92-4b29-9706-e08c2c06ee89@citrix.com>
 <d6b13991-e158-4232-8850-44c0b027edbb@suse.com>
 <a8cf2ecc-ec39-4e6e-8279-e49cdd2c6d38@citrix.com>
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
In-Reply-To: <a8cf2ecc-ec39-4e6e-8279-e49cdd2c6d38@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.08.2025 12:16, Andrew Cooper wrote:
> On 11/08/2025 11:06 am, Jan Beulich wrote:
>> On 11.08.2025 11:50, Andrew Cooper wrote:
>>> On 11/08/2025 9:16 am, Jan Beulich wrote:
>>>> On 09.08.2025 00:20, Andrew Cooper wrote:
>>>>> +        "mov %%rax, %%rdx\n\t"
>>>>> +        "shr $32, %%rdx\n\t"
>>>>> +        ".byte 0x0f,0x01,0xc6", X86_FEATURE_WRMSRNS,
>>>>> +
>>>>> +        [msr] "i" (msr), "a" (val) : "rcx", "rdx");
>>>>         [msr] "i" (msr), "a" (val), "c" (msr) : "rdx");
>>>>
>>>> allowing the compiler to actually know what's put in %ecx? That'll make
>>>> original and 2nd replacement code 10 bytes, better balancing with the 9
>>>> bytes of the 1st replacement. And I'd guess that the potentially dead
>>>> MOV to %ecx would be hidden in the noise as well.
>>> I considered that, but what can the compiler do as a result of knowing %ecx?
>> For example ...
>>
>>> That said, we do need an RDMSR form (which I desperately want to make
>>> foo = rdmsr(MSR_BAR) but my cleanup series from 2019 got nowhere), and
>>> in a read+write case I suppose the compiler could deduplicate the setup
>>> of %ecx.
>> ... this. But also simply to use a good pattern (exposing as much as possible
>> to the compiler), so there are more good instances of code for future cloning
>> from. (In size-optimizing builds, the compiler could further favor ADD/SUB
>> over MOV when the two MSRs accessed are relatively close together.)
> 
> I have seen the compiler do this in the past, but couldn't reproduce it
> for this work.
> 
> We specifically do not want any conversion to ADD/SUB, because that
> takes our "close to a nop" and makes it no so.

Imo when size optimizing, size matters and "close-to-a-NOP" doesn't (as much).

Jan

