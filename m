Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D2A963BBE
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 08:36:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785481.1194931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjYlG-0003hb-0r; Thu, 29 Aug 2024 06:36:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785481.1194931; Thu, 29 Aug 2024 06:36:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjYlF-0003fC-U0; Thu, 29 Aug 2024 06:36:01 +0000
Received: by outflank-mailman (input) for mailman id 785481;
 Thu, 29 Aug 2024 06:36:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ImPG=P4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sjYlF-0003f6-AM
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 06:36:01 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3aab792-65d0-11ef-99a0-01e77a169b0f;
 Thu, 29 Aug 2024 08:35:58 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a86933829dcso28029966b.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 23:35:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a898900f243sm35276766b.69.2024.08.28.23.35.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2024 23:35:58 -0700 (PDT)
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
X-Inumbo-ID: f3aab792-65d0-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724913358; x=1725518158; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+YmzGokIl+z9bwdZt4rni8uT8RctknFP6bTn/Y3UWxY=;
        b=H+zyX+OkUMx3dKTPCvOuA5InJSk2GscvycbowJmDVjaS9M88bU6cD/6cwEGVZ6hI1U
         2EaKKpAmTYb1ZB3lyOcJIhqCCCCv3PtnbrLMvq9HXKX11ZJiiP0BcgS/jxjq0WtTttKl
         LbVJ6CEt6GW4waCKDt1CtuCyoQlLu6G1skDqkFKwKt6NmKu2/CYIkIjPHfz+Wc5/IkwX
         u03LFNngEKNuFxd+TqwIDixOslT8I65bdSmdLJkFcFBYE/Snon+H2hfM/Jy2CFkQwriF
         Zd2F8tcoj51IUfkn2m+2MKI6+zfRnIX4WeT3R4xlmTiB9VOKK08qASvuaNCIL3jTHLSd
         HZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724913358; x=1725518158;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+YmzGokIl+z9bwdZt4rni8uT8RctknFP6bTn/Y3UWxY=;
        b=iP6ySx2rpi3L8zFugFqjQJ48c/NCQViJ+2UZYHp70bYhKQCFjou6Yn0JWtJCEncTVa
         AeqWEo9LjhvMs/WMg2CHuYMT8MXc4oXljo1aZWDeMo/4xoVOVkL96WVZA6FTDpJWnz5J
         m4CE4PXlAN6X23q9u9HxJjJIC1Ugqy/QBpywERZb9U2w9yNRz4Dkx8vDzY03vTsrwSxV
         UQ1P5oHTk66zVN2DLPOAQ749fjyYdJBFoFqhqkeulOyDSXUG4iBpMsmp74Ii7iAudrAt
         Iu3d4F555FDrorcMFpawypAdov/KSOBLYv6TPgsn6A3eN/X88/segr1M8GXQrMzIIDzW
         nWNw==
X-Forwarded-Encrypted: i=1; AJvYcCVfgHMa7JGi5xlifx8jkOHUcFGeHP9UaHbm1xyLznFUPBL/TS5ltiq67cTTIvf+bR571lbCGexyEdU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YypZBUF++Azf3svTFowjCfnwHIPF59yRspQGJ7AgkHeVn+39aEs
	vYSzha2oayP5DZy/RW7k2c+Hk7/EsU42Qoxd5r006BzZeOXVTzRV7Jqca+POeg==
X-Google-Smtp-Source: AGHT+IHEWeLd19Cs+Fxu2ZQhIgb+i8G4gQ8mjy0YVYDib/wnAL/1rasdvSv3M0XQAsdR3pL+JB+n2w==
X-Received: by 2002:a17:907:9482:b0:a86:700f:93c1 with SMTP id a640c23a62f3a-a897face4cfmr136474366b.60.1724913358353;
        Wed, 28 Aug 2024 23:35:58 -0700 (PDT)
Message-ID: <84476add-72a3-46c0-84a8-aeb91307ff22@suse.com>
Date: Thu, 29 Aug 2024 08:35:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] x86/vmx: Rewrite vmx_sync_pir_to_irr() to be more
 efficient
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240827135746.1908070-1-andrew.cooper3@citrix.com>
 <20240827135746.1908070-5-andrew.cooper3@citrix.com>
 <d022a5b1-c0ca-4399-b972-b01d834a95ec@suse.com>
 <cb2609f0-ed06-40ab-9983-9dad59c589d9@citrix.com>
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
In-Reply-To: <cb2609f0-ed06-40ab-9983-9dad59c589d9@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.08.2024 20:08, Andrew Cooper wrote:
> On 28/08/2024 10:19 am, Jan Beulich wrote:
>> On 27.08.2024 15:57, Andrew Cooper wrote:
>>> There are two issues.  First, pi_test_and_clear_on() pulls the cache-line to
>>> the CPU and dirties it even if there's nothing outstanding, but the final
>>> for_each_set_bit() is O(256) when O(8) would do,
>> Nit: That's bitmap_for_each() now, I think. And again ...
>>
>>> and would avoid multiple
>>> atomic updates to the same IRR word.
>>>
>>> Rewrite it from scratch, explaining what's going on at each step.
>>>
>>> Bloat-o-meter reports 177 -> 145 (net -32), but the better aspect is the
>>> removal calls to __find_{first,next}_bit() hidden behind for_each_set_bit().
>> ... here, and no underscore prefixes on the two find functions.
> 
> Yes, and fixed.
> 
>>
>>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>>> @@ -2317,18 +2317,72 @@ static void cf_check vmx_deliver_posted_intr(struct vcpu *v, u8 vector)
>>>  
>>>  static void cf_check vmx_sync_pir_to_irr(struct vcpu *v)
>>>  {
>>> -    struct vlapic *vlapic = vcpu_vlapic(v);
>>> -    unsigned int group, i;
>>> -    DECLARE_BITMAP(pending_intr, X86_NR_VECTORS);
>>> +    struct pi_desc *desc = &v->arch.hvm.vmx.pi_desc;
>>> +    union {
>>> +        uint64_t _64[X86_NR_VECTORS / (sizeof(uint64_t) * 8)];
>> Using unsigned long here would imo be better, as that's what matches
>> struct pi_desc's DECLARE_BITMAP().
> 
> Why?  It was also the primary contribution to particularly-bad code
> generation in this function.

I answered the "why" already: Because of you copying from something ...

>>> +        uint32_t _32[X86_NR_VECTORS / (sizeof(uint32_t) * 8)];
>>> +    } vec;
>>> +    uint32_t *irr;
>>> +    bool on;
>>>  
>>> -    if ( !pi_test_and_clear_on(&v->arch.hvm.vmx.pi_desc) )
>>> +    /*
>>> +     * The PIR is a contended cacheline which bounces between the CPU(s) and
>>> +     * IOMMU(s).  An IOMMU updates the entire PIR atomically, but we can't
>>> +     * express the same on the CPU side, so care has to be taken.
>>> +     *
>>> +     * First, do a plain read of ON.  If the PIR hasn't been modified, this
>>> +     * will keep the cacheline Shared and not pull it Excusive on the current
>>> +     * CPU.
>>> +     */
>>> +    if ( !pi_test_on(desc) )
>>>          return;
>>>  
>>> -    for ( group = 0; group < ARRAY_SIZE(pending_intr); group++ )
>>> -        pending_intr[group] = pi_get_pir(&v->arch.hvm.vmx.pi_desc, group);
>>> +    /*
>>> +     * Second, if the plain read said that ON was set, we must clear it with
>>> +     * an atomic action.  This will bring the cachline to Exclusive on the
>> Nit (from my spell checker): cacheline.
>>
>>> +     * current CPU.
>>> +     *
>>> +     * This should always succeed because noone else should be playing with
>>> +     * the PIR behind our back, but assert so just in case.
>>> +     */
>>> +    on = pi_test_and_clear_on(desc);
>>> +    ASSERT(on);
>>> +
>>> +    /*
>>> +     * The cacheline is now Exclusive on the current CPU, and because ON was
>> "is" is pretty ambitious. We can only hope it (still) is.
> 
> I can't think of a clearer way of saying this.  "will have become
> Exclusive" perhaps, but this is getting into some subtle tense gymnastics.
> 
>>> +     * get it back again.
>>> +     */
>>> +    for ( unsigned int i = 0; i < ARRAY_SIZE(vec._64); ++i )
>>> +        vec._64[i] = xchg(&desc->pir[i], 0);

... that is the result of DECLARE_BITMAP(), i.e. an array of unsigned longs.
If you make that part of the new union unsigned long[] too, you'll have code
which is bitness-independent (i.e. would also have worked correctly in 32-bit
Xen, and would work correctly in hypothetical 128-bit Xen). I don't think the
array _type_ was "the primary contribution to particularly-bad code
generation in this function"; it was how that bitmap was used.

Jan

