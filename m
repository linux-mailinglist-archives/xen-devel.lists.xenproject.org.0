Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0E9BC367C
	for <lists+xen-devel@lfdr.de>; Wed, 08 Oct 2025 07:57:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139303.1474719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6NAC-0003Cx-89; Wed, 08 Oct 2025 05:56:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139303.1474719; Wed, 08 Oct 2025 05:56:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6NAC-0003Aw-54; Wed, 08 Oct 2025 05:56:36 +0000
Received: by outflank-mailman (input) for mailman id 1139303;
 Wed, 08 Oct 2025 05:56:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eGu8=4R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v6NAA-0003Aq-Ij
 for xen-devel@lists.xenproject.org; Wed, 08 Oct 2025 05:56:34 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8814e48a-a40b-11f0-9809-7dc792cee155;
 Wed, 08 Oct 2025 07:56:28 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b48d8deaef9so1028330566b.2
 for <xen-devel@lists.xenproject.org>; Tue, 07 Oct 2025 22:56:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4865a83482sm1573379366b.26.2025.10.07.22.56.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 22:56:27 -0700 (PDT)
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
X-Inumbo-ID: 8814e48a-a40b-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759902988; x=1760507788; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PvXMiP7cnbM98dDqnm6ko0s7QPpIAuPOAO402v1bsRg=;
        b=KOY1ffIB94SyNWx0jrGnxnOtXoIK8LyP51PYq2d2sYuGBrif3ENM5xAwPTE+SKPzlG
         nzcDCRuQOfqQWPLdrf4zrqbG5J4JwcTeNZ/MFfM+EAI1gSIsZnxiDF0D/0r+5b1Txrsj
         vsh1b2Orychs4apzhp2fjtG8jzzISYELMN3FwLcJefeZSzt3Lj17IbDGcoWt3HrbzlBu
         S4yPII/zyx4BC/bct+uQ3M8++32fVqOSMjECzp/mBJv5b0wlP1B2K2rGwjZ4nBGnn9j1
         e6u3pTx0x9VfJN69ImO3kzeDiRNtu/Gf1qw7zmTkjomqpjFfvCdsLlOuFTsYMlzswvwX
         +NGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759902988; x=1760507788;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PvXMiP7cnbM98dDqnm6ko0s7QPpIAuPOAO402v1bsRg=;
        b=nYoQ6ygz8MnNnpqKZYo+sAiRCTvJilx468amCVopp4CHsbaTITYiv6qk17O50MvgAR
         p79EQ626pKxwcRRw9betgt2mAHKW1Idro9yCC48Ch3OfeRD0rxSQqAdZmIW1OBaBU/h4
         kc7avk6R3mEg+kgPb4u0H2xSZ9Lh0TO4ab2sFOQn4CPPmSk/4hWalYaq2XMzJPtcNSSs
         LlDbmc9f3QMXf2fC9QRdLX1atnum7Z4NgLtWC4lmFvbhKkIbZrhaH0ESGrlGNHSoHCsM
         VRWShfzjNJOileSjNAEMGsjZ0U0fSGoR88vtVrUvVjVt9z3HuZa/77h24PAv23sNo/GI
         okvA==
X-Forwarded-Encrypted: i=1; AJvYcCWTsX8gXWzGczMWl9S2TUeupE7oR87lSKYFHEtZH6tiIb/z5yjwkzaIe8sF6JbgwZ6yyUHAYiNBxbo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzCa3SmI/AMetlHjBONaA8hl5zsDDgNwQnlnIXHExh51wFbBdt5
	35NFOA4TiXAk3eWoXboVvErWfg1TdTrXaF9zIthU0oAODHi3n7mumFdvrtYevxDYvA==
X-Gm-Gg: ASbGnctCyTYScgwnUuhM10rUkO2ZGOD/IMNOF5fQy9e1bFvPnPfwcJAFNQWRFvrsg1P
	T3dnbf4iH3F2PR6ZdEi2bi6juIq0KiiWbd4vov8aE4/9FzJ8rXVAm2EQIoxI96aWmldh0McWhhr
	zSPWv6rt7YmZDmbqIW10MAOXJhvR3Gl5Q86v66enu62B4sKp3M5l9Gt/OdrrsfIh4KFnzenF7zc
	pzYtvrpkHQRNy9AtnH+7jYAyYjuK771+gFf0rm2HIuYek4V54MXAXkkj+hU0+u6erjYCUZNFW1S
	Ri91J0TzHYgp7ThO5Mqjd0RV9uFhfYLG5LGnDB3P+J/M+QsAkBwsyXZEu/LXZ3zOFwjyF3tAqJh
	nUsqJZvlOT7CGIdIitqsj5pV2ABN4vKl9dnlT4u3NacWvSn2SqSKHyJ18T3LhNigcW1Y7JsDFpq
	p2LJpj8sEY1OLbsLS14ckv0uSkkqfb9q+LFacgkGws+3eVpxN7Z9th
X-Google-Smtp-Source: AGHT+IE3zJmfEe/mrO4dRw/EOqq83YU0/2v8C1UFmSAy3iTy8qD4XsHXOSO59CnRNmwNje+OdTt3ng==
X-Received: by 2002:a17:907:72cf:b0:b04:61aa:6adc with SMTP id a640c23a62f3a-b50aa69e311mr221785466b.7.1759902987895;
        Tue, 07 Oct 2025 22:56:27 -0700 (PDT)
Message-ID: <b241871b-0b86-497b-afb5-86a0aa9813ce@suse.com>
Date: Wed, 8 Oct 2025 07:56:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86: guard synthetic feature and bug enumerators
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8ecbf8b7-91fe-4f9e-9542-7ec22b6a47bb@suse.com>
 <48dcc0e0-2772-49b9-9383-5bf69f922053@suse.com>
 <1439ec29-4319-43d0-b4ff-0eb5bfe9405b@amd.com>
 <c9d04edf-4801-46c7-ae6d-8479ef985972@suse.com>
 <057c91eb-c6c3-4e00-bf2f-6611181ebfd7@amd.com>
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
In-Reply-To: <057c91eb-c6c3-4e00-bf2f-6611181ebfd7@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.10.2025 21:38, Jason Andryuk wrote:
> On 2025-10-07 08:22, Jan Beulich wrote:
>> On 30.09.2025 01:36, Jason Andryuk wrote:
>>> On 2025-09-25 06:48, Jan Beulich wrote:
>>>> --- a/xen/arch/x86/include/asm/spec_ctrl.h
>>>> +++ b/xen/arch/x86/include/asm/spec_ctrl.h
>>>> @@ -73,7 +73,7 @@ static always_inline void spec_ctrl_new_
>>>>    
>>>>        /* (ab)use alternative_input() to specify clobbers. */
>>>>        alternative_input("", "DO_OVERWRITE_RSB xu=%=", X86_BUG_IBPB_NO_RET,
>>>> -                      : "rax", "rcx");
>>>> +                      "i" (0) : "rax", "rcx");
>>>
>>> "i" (0) is to work around the trailing comma in alternative_input() and
>>> does nothing?
>>
>> Yes. If more such "uses" appeared, we may want to introduce some kind of
>> abstraction.
> 
> Thanks for confirming.
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks.

> Though I also wondered if just #define X86_BUG_MAX/X86_SYNTH_MAX 
> combined with a BUILD_BUG_ON might be good enough.  Your approach avoids 
> the extra define but is more complicated.  Anyway, just a thought.

How would that end up simplifying things? IOW what would the BUILD_BUG_ON()
look like that you're thinking about? After all X86_{SYNTH,BUG}_MAX aren't
meaningfully different from X86_NR_{SYNTH,BUG}.

Jan

