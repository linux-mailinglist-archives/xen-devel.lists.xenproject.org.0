Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 803A8A25F75
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 17:03:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880760.1290841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1teyug-0000w4-Og; Mon, 03 Feb 2025 16:03:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880760.1290841; Mon, 03 Feb 2025 16:03:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1teyug-0000tJ-LY; Mon, 03 Feb 2025 16:03:06 +0000
Received: by outflank-mailman (input) for mailman id 880760;
 Mon, 03 Feb 2025 16:03:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LRcK=U2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1teyuf-0000tD-V7
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 16:03:05 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a1fa5d7-e248-11ef-a0e7-8be0dac302b0;
 Mon, 03 Feb 2025 17:03:05 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5d3d14336f0so7131128a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 08:03:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e4a0000dsm774296466b.89.2025.02.03.08.03.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 08:03:03 -0800 (PST)
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
X-Inumbo-ID: 5a1fa5d7-e248-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738598584; x=1739203384; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Dg0BVn6ObJh6ehAKTYDruNyZR7C6Ncwoot0elU3yM1s=;
        b=dZhiDWmn8ApASz0SbrwUcCY8DMBgWfdm6YFEcMvdnNTs4dlwoi0Kr496opOVjja5V5
         ZQgfn0heFbXecWmoaHlCVZnWf3loYsIDpNfhSNRd3r9QxRDqb53pqM0et/3+Tk0uUF9H
         d54F9hTq86oJmJw35NPpfrqB2Cft0Zc4Z7CK2NFgAA3pWWPrW6OGL3hOw/JZT/0DqMhU
         B/ZvDLNrbRazu8NAc+G16vpQ3KjL/Hph/YKs+eQhNvhtf0MhScFMU1pmyVdJeVk3pQ8O
         zRRStsqOVYuR4T9h0paAr6hGtNS3POreizRSm8XWBTWbXzFNvw1NZRQKDn9kvw6hanAf
         +ekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738598584; x=1739203384;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dg0BVn6ObJh6ehAKTYDruNyZR7C6Ncwoot0elU3yM1s=;
        b=H6k2fETYQLdQvQY3YSxx4EIZqlsbCilsXT8KZ0KaIhuNruQUktnBVuYLMzLjda/FMp
         VAYm9DfhdU4gQa5S7VQtvymoOSNG5syLwfNXyLV6dTDFPHb1L7Ry25xM3WUp4Vtc35fl
         i1C7OORziRCigG8GKzYUUzob0V94W5Z7gus+wiUA1Wni9okAqL2h8a4FqCibu7rQbPDi
         fuIx67CC+IWasroviffqw8Q9eH+w1+PcP2hXnWyk2ATK9pfzfT83oK9kYwDDpHx7Bjnp
         b4lrnLGblwXX6pyFvyo8SRGWad/VsULJlceUhUubxd9g5IpoL4TaL51BuvXFNunYJ8Kv
         B1hA==
X-Forwarded-Encrypted: i=1; AJvYcCWooU5xmVquSMCQWB3vSQio1sKQhOUmdMLtVslU5zJhYh6UJR4JgeDKJetccR6R+gWXrCVuzlLS0Xo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxleegXhu2/Kdht5esIu8CDRcf3VeGrTKCzRbP1VQVI9h4WE2RE
	SqHul7i5OT3q+UuYs5eFp/8FxLnUxmqlxiRu6Nw6dAmKpQTuwfV7eIyCLVjjKnDM/m85ns1wysg
	=
X-Gm-Gg: ASbGncujiAp/P9amxX4eyL+ymS04Zt82QzIlgVLLvlTUmBuEBlBtex+/McjRMfR/6rt
	z9221nDa9eE6/JHPj3dx+twtR7ALK/jBb6lbh83yi9qV9exQ8QfRn/2MyUtExbvVP+ubhQ+qJew
	rVuV+3osMvQCgc13c3BuCITjHhQc8NyjdIi+GBn+e9AJmPAE/KWjdh3sBCwUbWy/FE/mIb0RZZ6
	Go53umQ84WErkaQIZPQQ1kEzBPP+s/cFqNuDvC7OgATQqBB/eQbwF2jKO8W40+N+ksnJx+CFevn
	7msa9rFIV2IOxgY3UfEhFemkahFiQDxT4/gkdwjsD6V3T1McIDvitwJImeBgPl42SIpDqXSe5LJ
	/
X-Google-Smtp-Source: AGHT+IH11Ol32XwlSoNcoQbGBnxcKcyzoMqOpHlnamYz6zSYVERp1ViPOvSzJ3wvAmvY4Oq06CFWyw==
X-Received: by 2002:a17:906:7952:b0:aa6:8d51:8fdb with SMTP id a640c23a62f3a-ab6cfccb96emr1874073666b.19.1738598584178;
        Mon, 03 Feb 2025 08:03:04 -0800 (PST)
Message-ID: <99a1a2f6-12d7-4a4e-a776-05d6b960cf1d@suse.com>
Date: Mon, 3 Feb 2025 17:03:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/riscv: identify specific ISA supported by cpu
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <ddf678bb829003b2c4a0a85166a29b61e75bcea9.1737643226.git.oleksii.kurochko@gmail.com>
 <e51b0425-568a-4a4b-b240-a5276a017a70@suse.com>
 <4ee4c8c8-b392-4c0a-8173-624d661409f4@gmail.com>
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
In-Reply-To: <4ee4c8c8-b392-4c0a-8173-624d661409f4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.02.2025 16:05, Oleksii Kurochko wrote:
> On 1/27/25 3:47 PM, Jan Beulich wrote:
>>> +static bool is_lowercase_extension_name(const char *str)
>>> +{
>>> +    /*
>>> +     * `str` could contain full riscv,isa string from device tree so one
>>> +     * of the stop condionitions is checking for '_' as extensions are
>>> +     * separated by '_'.
>>> +     */
>>> +    for ( unsigned int i = 0; (str[i] != '\0') && (str[i] != '_'); i++ )
>>> +        if ( !islower(str[i]) )
>>> +            return false;
>>> +
>>> +    return true;
>>> +}
>>> +
>>> +static void __init match_isa_ext(const char *name, const char *name_end,
>>> +                                 unsigned long *bitmap)
>>> +{
>>> +    const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
>>> +
>>> +    for ( unsigned int i = 0; i < riscv_isa_ext_count; i++ )
>>> +    {
>>> +        const struct riscv_isa_ext_data *ext = &riscv_isa_ext[i];
>>> +
>>> +        /*
>>> +         * `name` (according to device tree binding) and
>>> +         * `ext->name` (according to initialization of riscv_isa_ext[]
>>> +         * elements) must be all in lowercase.
>>> +         *
>>> +         * Just to be sure that it is true, ASSERT() is added.
>>> +         */
>>> +        ASSERT(is_lowercase_extension_name(name) &&
>>> +               is_lowercase_extension_name(ext->name));
>> More general remark: While asserting on ext->name is okay, for it being
>> our own data, asserting on data coming from the outside is generally not
>> correct. For now I'm not going to insist on this being changed, but
>> sooner or later it will want revisiting
> 
> IIUC it would be better to leave ASSERT(is_lowercase_extension_name(ext->name)) in match_isa_ext()
> and put ASSERT(is_lowercase_extension_name(ext) in riscv_isa_parse_string() before match_isa_ext()
> is called:
>    static int __init riscv_isa_parse_string(const char *isa,
>                                             unsigned long *out_bitmap)
>    {
>      ...
>      while ( *isa )
>      {
>        const char *ext = isa++;
>      ...
>      ASSERT(is_lowercase_extension_name(ext));
>      match_isa_ext(ext, ext_end, out_bitmap);
>    }
> 
> Is my understanding correct?

That depends on the origin of the incoming "isa". Considering the function
wants to parse it, I'd expect it still comes from DT. In which case
asserting on it is wrong; anything may come from there, and nothing should
cause assertion failures. Recall that assertions are checks of _our own
internal state_ only.

>>> +static int __init riscv_isa_parse_string(const char *isa,
>>> +                                         unsigned long *out_bitmap)
>>> +{
>>> +    if ( (isa[0] != 'r') && (isa[1] != 'v') )
>>> +        return -EINVAL;
>>> +
>>> +#if defined(CONFIG_RISCV_32)
>>> +    if ( isa[2] != '3' && isa[3] != '2' )
>>> +        return -EINVAL;
>>> +#elif defined(CONFIG_RISCV_64)
>>> +    if ( isa[2] != '6' && isa[3] != '4' )
>>> +        return -EINVAL;
>>> +#else
>>> +    #error "unsupported RISC-V bitness"
>> Nit: We generally like to have the # in the first column, and - if
>> so desired - blank padding afterwards.
> 
> Should it be done only when "#if defined" used inside function or blank padding is needed only in
> case when "#if defined" is used and, for example, for "#ifdef" such padding isn't needed?

I fear I don't understand the question; I see no connection to #ifdef vs
#if defined(). Any blanks after # are generally up to the author's taste
(unless the result is really unwieldy), as we have no style rule for that.
There are pros and cons towards the use of such padding.

Jan

