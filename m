Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86213A2600C
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 17:31:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880851.1290941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tezLu-0001fQ-Uh; Mon, 03 Feb 2025 16:31:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880851.1290941; Mon, 03 Feb 2025 16:31:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tezLu-0001cg-Qp; Mon, 03 Feb 2025 16:31:14 +0000
Received: by outflank-mailman (input) for mailman id 880851;
 Mon, 03 Feb 2025 16:31:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LRcK=U2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tezLt-0001bQ-I3
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 16:31:13 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 479e74ee-e24c-11ef-a0e7-8be0dac302b0;
 Mon, 03 Feb 2025 17:31:12 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5d0d32cd31aso6588209a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 08:31:12 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e47ceb47sm777354366b.42.2025.02.03.08.31.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 08:31:10 -0800 (PST)
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
X-Inumbo-ID: 479e74ee-e24c-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738600271; x=1739205071; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A+DkwE7AiU1AA9jrMmFuAjztWO1rbekuEF+coC0hFXc=;
        b=bAon/K3xjovBFsOn4sntmp02Rf7Km8QYsrwJXdtWN9KwSx2zuKrNAJ/DM17WERzRVx
         l5W+OS2H+Q0BPEHMnLt03xxQK5t8G+TXHTBfkXykCQlAdZP6muds6Wlm30MdMagsvigz
         xM4H89fIB2t0PB7yJJl+ZeqdbG6A66e+kmyxHPnJ01n1U1C0n25SFSAUA3eWpkfqizuz
         7O01V8vC6Iv3gZ9IrqSNcdwUldu0w6y6b3dIRzxsFPTsz9B4e1AnkfflkmfYD0DqngIC
         e9U6HeU1Psxf4eabCsYbHoPNQFUUqQqiGYMKCBeYxgtEwNYNSvP7ntDMFoXm5UgkjCNj
         oqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600271; x=1739205071;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A+DkwE7AiU1AA9jrMmFuAjztWO1rbekuEF+coC0hFXc=;
        b=s13YgdZiHrUFDPL5diKsfVkWMt0rZAN2NsgLegSOcq5HbHGF1jJ/Cxz+NDbJa2Hggb
         4rOdppL2whLTLG89ha/Lq5Fl2kyyfF0NlkshiiGmi6tD5E7nZkZerAOlpsJCITVpIckc
         r7u5qulTSjTOkGroL5aWEvwR+e1ciQ3JMypmi8/rkyzhSTi3QhUJmygq39SUbLq+3+9I
         JOJlqEiNG5vulV5t+jzW5HT/Lm1Om2LPEElASfnZS/Cv/T9PtHQbUYkUih/yU94cE97v
         MUXboh0qmtnFx43f273a3IH8+lXBs5t6I4OGa4t17bs5cqCItsshNBFbD+M9tiLvxLHi
         JCVA==
X-Forwarded-Encrypted: i=1; AJvYcCWh55IxTMKVpQkCdVHg7mlv4O9Q51n5N4SCAVgPML+So6CFTMT8WEYvzzAgHyNFyV/39wpl/ABufwg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxBhpt+DlWsmOKof0sVnfjj9Ho64NaWlRefNbtl1ZRv8zR/fu3t
	tTvZXPBQTmerf2f5TocaqF7bmBX4j3CNtBrsv/pCCJAp18Qp/gDheyfzhdVPtg==
X-Gm-Gg: ASbGncsi0CS1ARQyGjLB3kKgffo3b7vD/Il0AM0PvmZzlrIJp62UWYWF0Gmha/ANPZA
	zgFFEf356tsFJM8AouRZuI7HJL9AVb3JlTouMbewFIO/hGDUS6UOVC175zvJfgJHjSX6tO/qkz3
	ciaKihF+7K7DnjeT2fRUBdnKpQjVzuwb5WGdXqSJ1vXk0z3un4ct44zGO1Pe07KJjuSzpPEfMa1
	XcfQq4WI7xog8dNVExB3XbyPKp4qgABX05ca+GbPpVsAXSfEOesXOl77qe6WtsB3FJY64q898lA
	Me8nYFJaSawLbMJt0Zl5ePvR9t+U76tiIgOF9ZjtfbxNVcmOvsjbM4hzpeLofSIy1oxp3mqeNAf
	2
X-Google-Smtp-Source: AGHT+IG+NMWseO6kFpsBr1qeLqI5FYLMDSIGMK7CXOGD3Wj70ELEGm/TdemtlIDJuhUK7BkAgWNn3w==
X-Received: by 2002:a05:6402:2390:b0:5dc:71f6:9725 with SMTP id 4fb4d7f45d1cf-5dc71f698d6mr35131017a12.27.1738600271346;
        Mon, 03 Feb 2025 08:31:11 -0800 (PST)
Message-ID: <78a30e0b-5d79-4451-8fdc-99dfc7485b7d@suse.com>
Date: Mon, 3 Feb 2025 17:31:09 +0100
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
 <99a1a2f6-12d7-4a4e-a776-05d6b960cf1d@suse.com>
 <f9c4166a-4d96-46af-adf0-1c91fe50e249@gmail.com>
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
In-Reply-To: <f9c4166a-4d96-46af-adf0-1c91fe50e249@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.02.2025 17:24, Oleksii Kurochko wrote:
> On 2/3/25 5:03 PM, Jan Beulich wrote:
>> On 03.02.2025 16:05, Oleksii Kurochko wrote:
>>> On 1/27/25 3:47 PM, Jan Beulich wrote:
>>>>> +static bool is_lowercase_extension_name(const char *str)
>>>>> +{
>>>>> +    /*
>>>>> +     * `str` could contain full riscv,isa string from device tree so one
>>>>> +     * of the stop condionitions is checking for '_' as extensions are
>>>>> +     * separated by '_'.
>>>>> +     */
>>>>> +    for ( unsigned int i = 0; (str[i] != '\0') && (str[i] != '_'); i++ )
>>>>> +        if ( !islower(str[i]) )
>>>>> +            return false;
>>>>> +
>>>>> +    return true;
>>>>> +}
>>>>> +
>>>>> +static void __init match_isa_ext(const char *name, const char *name_end,
>>>>> +                                 unsigned long *bitmap)
>>>>> +{
>>>>> +    const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
>>>>> +
>>>>> +    for ( unsigned int i = 0; i < riscv_isa_ext_count; i++ )
>>>>> +    {
>>>>> +        const struct riscv_isa_ext_data *ext = &riscv_isa_ext[i];
>>>>> +
>>>>> +        /*
>>>>> +         * `name` (according to device tree binding) and
>>>>> +         * `ext->name` (according to initialization of riscv_isa_ext[]
>>>>> +         * elements) must be all in lowercase.
>>>>> +         *
>>>>> +         * Just to be sure that it is true, ASSERT() is added.
>>>>> +         */
>>>>> +        ASSERT(is_lowercase_extension_name(name) &&
>>>>> +               is_lowercase_extension_name(ext->name));
>>>> More general remark: While asserting on ext->name is okay, for it being
>>>> our own data, asserting on data coming from the outside is generally not
>>>> correct. For now I'm not going to insist on this being changed, but
>>>> sooner or later it will want revisiting
>>> IIUC it would be better to leave ASSERT(is_lowercase_extension_name(ext->name)) in match_isa_ext()
>>> and put ASSERT(is_lowercase_extension_name(ext) in riscv_isa_parse_string() before match_isa_ext()
>>> is called:
>>>     static int __init riscv_isa_parse_string(const char *isa,
>>>                                              unsigned long *out_bitmap)
>>>     {
>>>       ...
>>>       while ( *isa )
>>>       {
>>>         const char *ext = isa++;
>>>       ...
>>>       ASSERT(is_lowercase_extension_name(ext));
>>>       match_isa_ext(ext, ext_end, out_bitmap);
>>>     }
>>>
>>> Is my understanding correct?
>> That depends on the origin of the incoming "isa". Considering the function
>> wants to parse it, I'd expect it still comes from DT. In which case
>> asserting on it is wrong; anything may come from there, and nothing should
>> cause assertion failures. Recall that assertions are checks of _our own
>> internal state_ only.
> 
> But based on the device tree binding (https://elixir.bootlin.com/linux/v6.13.1/source/Documentation/devicetree/bindings/riscv/extensions.yaml#L47 <https://elixir.bootlin.com/linux/v6.13.1/source/Documentation/devicetree/bindings/riscv/extensions.yaml#L47> ),
> not anything should come from DT for the riscv,isa string; only lowercase letters are allowed.
> I am not sure if it makes sense to double-check if riscv,isa is correct, as my expectation (which I haven’t checked yet) is that the DTS will
> be validated during compilation.
> 
> Does it make sense to double check what was put in DT's riscv,isa?

I think so. Just not by way of an assertion.

Jan

