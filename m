Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33655A357B9
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 08:18:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888390.1297752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tipxd-0004RD-O8; Fri, 14 Feb 2025 07:18:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888390.1297752; Fri, 14 Feb 2025 07:18:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tipxd-0004Oe-LL; Fri, 14 Feb 2025 07:18:05 +0000
Received: by outflank-mailman (input) for mailman id 888390;
 Fri, 14 Feb 2025 07:18:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PTsb=VF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tipxc-0004OY-6s
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 07:18:04 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d421ab1e-eaa3-11ef-9aa4-95dc52dad729;
 Fri, 14 Feb 2025 08:18:03 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ab7f9d87b96so263270866b.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2025 23:18:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba530a34edsm285762066b.0.2025.02.13.23.18.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 23:18:02 -0800 (PST)
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
X-Inumbo-ID: d421ab1e-eaa3-11ef-9aa4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739517483; x=1740122283; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FcfnmALDWBSdRTH0D3LIJY3zsVXIKafpZ+hgDxWmemY=;
        b=OGqCtIu0dWaSBpDQzkf7vtGBewpG17Mju/xPt00BewNojiz6foiU2Fes3z0c5p76U/
         x9b+2s6vj44bkRDziG69t91yMv2nnheE2AIFkoI2V9IdBMPkha0mR/5JCQkUsaV1Yh+W
         auSkgQ4TwCgxt+adHKa86HuCOMibRt2BEqqo8CB4MnK7isoNBc1sLDo0TPmbxoJurUoR
         VF9RyeOIxaE/wP6Y/RZ7sLjKXw1PuisIlKQhZQZgmxX+HZ5C8kj/A+1AfN9aCH/6qBLG
         kMGzDe8T05gVRIdd6a4dVMkp86y/BK/iZgZKAg8VBT1wkcf3jk3E3VcCF/LQ2DlCfLtO
         19gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739517483; x=1740122283;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FcfnmALDWBSdRTH0D3LIJY3zsVXIKafpZ+hgDxWmemY=;
        b=ciqgMqwxr4lB9XQSt4MDqE//gY//D2TcCTso4nYYdlwwnRbIp3ohqsefT27JQHR/Lm
         OMZEJuVZmXFztPZ1lbFE3RyD379y8beOfjq0NXauaRJagzkpWDSWnMFCmh/IlPoikO39
         ZAcjNC/jtohupANdnGBfr3C7ZvosUlSWj79ic8/ttEAHnnmAisymLHCLs1eDUU8URocY
         QAMy6u2uixBQm1/JoaQSGcTtJGBgeWJHH/zCCqQYOT3dxjOGJkAiHwog8cbl1PMl/ZFI
         CRjyG3iSh6Znx0Q/iPndNEXvzJ8p4eysZ8Cs1HY0P6CegvnNQN1zHKvGPbfUsR98WgeF
         JWMA==
X-Forwarded-Encrypted: i=1; AJvYcCVXy8s4JEmqDxZ27xOhjz86Es5xcbpVNGZccluDIeHrC8lbGoGoEdHEPbNRJ7ERG6s5VxtRVbqY2Yw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxs6nqUqfAvsG1/HJpTHQVR0Ey0TUvXWE4W6R/bR06qkYGm8Ei9
	gO2T/nXL1jcSkVDwibU7Uc4BjxAUBcTCqauXvGxvPqmuemPN1gwBZwLEBTEH4w==
X-Gm-Gg: ASbGncte0AZmPa/iOpULX3jdnEXA0G/0oF9kjLii/6qEbbZ0Gu6tgxI4m3E4xrEXuI9
	J6JhKll7rgxUj492DoIHJrNqNiuTyAxr/mi7YB9KOMSc721oP9IP3pIP8o4v6PopjHopoZDesxN
	ru9NGIxLLnU8vwyIg19R4+REXhmgg8lgppF7rznw7IVMPqU5nA6Qzpbg9XBjvr2T3n9DF+IqPEV
	Cw9OTtMww46tVmAEAdxPXcIGz6RzH9Dzn/nEnaAdmnCsXc3Nb1ARZ2Rjt1uND38mHGrLEENc/UH
	fgq5stseWk4sei+f3mu0WmN1PuNfUJykrWAJQNkJkPLK4Gb2I0lFx4i2dYRahboWMZskTIzV78d
	S
X-Google-Smtp-Source: AGHT+IHinrEAIeEFbj0vTx3BjI+wcHYQSF448LVo5JCvBZ3x7wAkTHXGz2PereM8h3LMJ74yIl58rg==
X-Received: by 2002:a17:906:ee87:b0:ab7:d77b:43a3 with SMTP id a640c23a62f3a-ab7f33f6df6mr908224766b.32.1739517482653;
        Thu, 13 Feb 2025 23:18:02 -0800 (PST)
Message-ID: <c82e1088-f789-43d4-a56e-72d0d1d1c170@suse.com>
Date: Fri, 14 Feb 2025 08:18:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: struct mctelem_cookie missing definition
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <alpine.DEB.2.22.394.2502121721490.619090@ubuntu-linux-20-04-desktop>
 <1823d604-aa29-4828-a954-b8a08fbdbda7@citrix.com>
 <alpine.DEB.2.22.394.2502121738440.619090@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2502121800190.619090@ubuntu-linux-20-04-desktop>
 <eccc2a63-9678-4675-8a7b-7c8e94206cb8@suse.com>
 <alpine.DEB.2.22.394.2502131326440.619090@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2502131326440.619090@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.02.2025 22:47, Stefano Stabellini wrote:
> On Thu, 13 Feb 2025, Jan Beulich wrote:
>> On 13.02.2025 03:00, Stefano Stabellini wrote:
>>> On Wed, 12 Feb 2025, Stefano Stabellini wrote:
>>>> On Thu, 13 Feb 2025, Andrew Cooper wrote:
>>>>> On 13/02/2025 1:25 am, Stefano Stabellini wrote:
>>>>>> Hi all,
>>>>>>
>>>>>> I am looking through the few remaining MISRA violations that we have
>>>>>> left.  One of them is R11.2:
>>>>>>
>>>>>> https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/hardware/xen/ECLAIR_normal/staging/X86_64/9118578464/PROJECT.ecd;/by_service/MC3A2.R11.2.html#{%22select%22:true,%22selection%22:{%22hiddenAreaKinds%22:[],%22hiddenSubareaKinds%22:[],%22show%22:false,%22selector%22:{%22enabled%22:true,%22negated%22:true,%22kind%22:0,%22domain%22:%22kind%22,%22inputs%22:[{%22enabled%22:true,%22text%22:%22violation%22}]}}}
>>>>>>
>>>>>> Specifically, mctelem_cookie_t is a pointer to incomplete type and
>>>>>> therefore COOKIE2MCTE triggers a "conversion between a pointer to an
>>>>>> incomplete type and any other type".
>>>>>>
>>>>>> mctelem_cookie_t is defined as:
>>>>>>
>>>>>> typedef struct mctelem_cookie *mctelem_cookie_t;
>>>>>>
>>>>>> I am looking through the code and I genuinely cannot find the definition
>>>>>> of struct mctelem_cookie.
>>>>>>
>>>>>> If mctelem_cookie_t is only used as a pointer, wouldn't it make more
>>>>>> sense to do:
>>>>>>
>>>>>> typedef struct mctelem_ent *mctelem_cookie_t;
>>>>>>
>>>>>> ?
>>>>>>
>>>>>> What am I missing?
>>>>>
>>>>> Nothing.  Or perhaps the twisted thinking of the original author.
>>>>>
>>>>> It is genuinely a pointer type (== known size) which you can't deference
>>>>> (because there is no definition), and can only operate on by casting to
>>>>> an integer.  Except the code also requires it to be a uint64_t which is
>>>>> why there's some fun disabling of relevant hypercalls for compat guests.
>>>>>
>>>>> If someone could find the time to file it in /dev/null and replace it
>>>>> with literally anything else, I'd be very thankful.
>>>>
>>>> Are you OK with typedefing mctelem_cookie_t to uint64_t instead?
>>>
>>> I confirm that the following resolves the MISRA violations
>>>
>>> diff --git a/xen/arch/x86/cpu/mcheck/mctelem.h b/xen/arch/x86/cpu/mcheck/mctelem.h
>>> index f4c5ff848d..2ccd490e5d 100644
>>> --- a/xen/arch/x86/cpu/mcheck/mctelem.h
>>> +++ b/xen/arch/x86/cpu/mcheck/mctelem.h
>>> @@ -52,7 +52,7 @@
>>>   * the element from the processing list.
>>>   */
>>>  
>>> -typedef struct mctelem_cookie *mctelem_cookie_t;
>>> +typedef uint64_t *mctelem_cookie_t;
>>
>> Yet that makes it possible to de-reference the pointer. Which, as Andrew
>> explained, is intended to be impossible. If this could be properly
>> replaced (not exactly what Andrew indicated by "file it in /dev/null"),
>> fine. Truly purging the code (i.e. as Andrew suggests) may still be an
>> option, with appropriate justification. But simply adjusting the type
>> and then moving on is too little, imo. Even if you used void * (to make
>> de-referencing impossible) I'd view it as largely papering over an issue;
>> then converting to other pointers (without explicit cast, and hence
>> without making apparent the badness of doing so) would become possible.
> 
> What about converting to uintptr_t (not a pointer)?

That'll lose type checking the compiler does. A type-safe wrapper struct
(like we have for mfn_t and alike in debug builds) may do.

Jan

