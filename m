Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F11C88FE24
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 12:34:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698905.1091152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpo08-00032j-4a; Thu, 28 Mar 2024 11:32:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698905.1091152; Thu, 28 Mar 2024 11:32:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpo08-0002za-1S; Thu, 28 Mar 2024 11:32:56 +0000
Received: by outflank-mailman (input) for mailman id 698905;
 Thu, 28 Mar 2024 11:32:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JFXD=LC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rpo06-0002zU-PO
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 11:32:54 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9033886-ecf6-11ee-a1ef-f123f15fe8a2;
 Thu, 28 Mar 2024 12:32:51 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-56890b533aaso901253a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 04:32:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l9-20020a1709060cc900b00a4e24d259edsm413099ejh.167.2024.03.28.04.32.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Mar 2024 04:32:50 -0700 (PDT)
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
X-Inumbo-ID: e9033886-ecf6-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711625571; x=1712230371; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mc0h9f0K/2shyA9sWjQ3nCZxeX81aLSuNsQsMDqREjw=;
        b=cQNAFdIOckLiDA3XvmofMbQnL6pZjNDy830/Ud7PgVD3f0vx3WQUfB8zkHSN9xJ4k2
         DL3A+zhEDgmeJpsxBtaA4DPMQRCDSBehyfHRrSfGclnVuY5HkTc3TuAZzUJn0YBjJtwm
         1vCIwjTmVfcJJMVAXVKXn+xf0AJT1rdayjFflPOkrYScnPd0wG0ViJiMWK3swnKY/8fr
         pzFDR/66H+pBUkSO0LeCqjPGQeslGkecBNn6WY5j239aiF7VouI3i8VKFxts0xuivlsY
         bXTCPEheg0ynI01HEVwk6CXtYZodTaQo7vTcsGmAp8gZUnRnTpVBZwQedO7UtXTDjbGh
         mdug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711625571; x=1712230371;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mc0h9f0K/2shyA9sWjQ3nCZxeX81aLSuNsQsMDqREjw=;
        b=gJE2Uniy6uZy1vbgxzzgktfF+GHLmyD72t1KkQKeCwVbV2RhNvbimn4OqwWblyITCz
         fkcBvPNpr65X2/9TrmiI65z5GIPuskt3lYaOdzJX3X9jRIF2xQnVan9PnxX5Dts6c2tq
         wgU6qyGT8q6sqvXRvuBcAVhDBVHJmu6t7hVC6jqQZoj785aP8ZQmJZwTupbOFQHAiqca
         Z9dvdg3UkQMgie1Sdflph4eS2vqvj18wccNy1voS2Eehfd9Wfr1LfFtv3sSqMKAJ9E/6
         9liCvk7sHnbDN9Avd7807Q0O15+SrAuBPuf3laH6MOnqtqBFG5B1wPN2FjEx7C0KCy6y
         iu/g==
X-Forwarded-Encrypted: i=1; AJvYcCXa5FHBzEYAGwCMY1Y0D4Y/TR7oa3/5uMisCseFrxDJCXVuOxQX+9J3cUo8QaL1zKtG3JHKm/yuVdsr4oES5t/KNyTlgSddmzchqoru2Y0=
X-Gm-Message-State: AOJu0YwXbUpFDalhWkvcsrPzyv80wpJXUS0NWrjcWABIl/9H2L9E8I2d
	GT1KijJ34GJdWL8Rjyov4NWj3Evw0nxG9VOaL7Y1i0y0KLhyEV06lYdGaTIP8g==
X-Google-Smtp-Source: AGHT+IHS7XTsSs+vocQa08jv86unV24jngOn6ugiyRpDWpiD9t1RhyihTgS6EYRH+/ymozTQP22zhA==
X-Received: by 2002:a17:906:e255:b0:a4e:2269:bc21 with SMTP id gq21-20020a170906e25500b00a4e2269bc21mr953247ejb.1.1711625570622;
        Thu, 28 Mar 2024 04:32:50 -0700 (PDT)
Message-ID: <b6dff112-4e7d-4f6c-8594-40cd98b05696@suse.com>
Date: Thu, 28 Mar 2024 12:32:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] svm/nestedsvm: Introduce nested capabilities bit
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
References: <20240313122454.965566-1-george.dunlap@cloud.com>
 <20240313122454.965566-4-george.dunlap@cloud.com>
 <7a5b3ec3-c122-479a-b714-529e150bf4c0@suse.com>
 <CA+zSX=ZE6uLf12o3WDUpNuZ6Kost=JEfWH0HugGqD43QGPsJ1A@mail.gmail.com>
 <f4f33db5-a49d-4706-8b55-cfcad916e8cb@suse.com>
 <CA+zSX=ZUfcL-HA_ygLxHkuvmWUu4hdk36Cc+CZPwfsK5akNUSA@mail.gmail.com>
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
In-Reply-To: <CA+zSX=ZUfcL-HA_ygLxHkuvmWUu4hdk36Cc+CZPwfsK5akNUSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.03.2024 11:57, George Dunlap wrote:
> On Thu, Mar 28, 2024 at 6:44 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>> --- a/xen/arch/x86/hvm/nestedhvm.c
>>>>> +++ b/xen/arch/x86/hvm/nestedhvm.c
>>>>> @@ -150,6 +150,16 @@ static int __init cf_check nestedhvm_setup(void)
>>>>>      __clear_bit(0x80, shadow_io_bitmap[0]);
>>>>>      __clear_bit(0xed, shadow_io_bitmap[1]);
>>>>>
>>>>> +    /*
>>>>> +     * NB this must be called after all command-line processing has been
>>>>> +     * done, so that if (for example) HAP is disabled, nested virt is
>>>>> +     * disabled as well.
>>>>> +     */
>>>>> +    if ( cpu_has_vmx )
>>>>> +        start_nested_vmx(&hvm_funcs);
>>>>> +    else if ( cpu_has_svm )
>>>>> +        start_nested_svm(&hvm_funcs);
>>>>
>>>> Instead of passing the pointer, couldn't you have the functions return
>>>> bool, and then set hvm_funcs.caps.nested_virt from that? Passing that
>>>> pointer looks somewhat odd to me.
>>>
>>> For one, it makes start_nested_XXX symmetric to start_XXX, which also
>>> has access to the full hvm_funcs structure (albeit in the former case
>>> because it's creating the structure).
>>
>> This last aspect is the crucial aspect: start{svm,vmx}() are indeed quite
>> special because of this. Everywhere else we have accessor helpers when
>> hvm_funcs needs consulting, e.g. ...
>>
>>>  For two, both of them need to read caps.hap.
>>
>> ... caps _reads_ would want using (an) accessor(s), too.
>>
>>>  For three, it's just more flexible -- there may be
>>> future things that we want to modify in the start_nested_*()
>>> functions.  If we did as you suggest, and then added (say)
>>> caps.nested_virt_needs_hap, then we'd either need to add a second
>>> function, or refactor it to look like this.
>>
>> Right, I can see this as an argument when taking, as you do, speculation
>> on future needs into account. Albeit I'm then inclined to say that even
>> such modifications may better be done through accessor helpers.
> 
> Why access it through accessor helpers?
> 
> I consider that it's the SVM and VMX "construction/setup" code
> respectively which "own" hvm_funcs (as evidenced by the fact that they
> create the structures and then return them); and I consider the
> start_nested_{vmx/svm} to be a part of the same code; so I consider it
> valid for them to have direct access to the structure.

That's one way of looking at it, yes. However, to me neither SVM nor VMX
code directly fiddle with hvm_funcs in the way you describe it. Instead
they return a pointer to their respective instances of struct
hvm_function_table. If the nested startup code would similarly alter
private struct instances of some sort, all would be fine.

May I suggest that you grep for hvm_funcs in what is there right now. You'll
find solely vmcs.c having a few uses of .caps, which likely are wrong (as in:
layering violations), too.

That said I can accept that the situation is slightly different here, when
generic code passes a pointer to the nested startup functions. To me at
least it still feels layering-violation-ish.

Jan

