Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E96F2A31243
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 17:59:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885784.1295586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thtbe-0003Y8-JM; Tue, 11 Feb 2025 16:59:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885784.1295586; Tue, 11 Feb 2025 16:59:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thtbe-0003WO-FY; Tue, 11 Feb 2025 16:59:30 +0000
Received: by outflank-mailman (input) for mailman id 885784;
 Tue, 11 Feb 2025 16:59:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hVvi=VC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1thtbd-0003WI-8J
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 16:59:29 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 868e9efe-e899-11ef-a075-877d107080fb;
 Tue, 11 Feb 2025 17:59:16 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5de3c29ebaeso7072279a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 08:59:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5de525f35b7sm7645044a12.53.2025.02.11.08.59.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2025 08:59:14 -0800 (PST)
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
X-Inumbo-ID: 868e9efe-e899-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739293155; x=1739897955; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UFtCCseT9ZuSN+w/4VJdWHADAqu8GLy8ymRf81z7L4w=;
        b=UnRV46LiXucknxpVE/oafC1ZzAtIZg+RYxyt9l2whDl6PpjHqWR15yioNfZgrfkuk6
         sLn9WcnS/Zun1sU1xcFl1gea+nNar3AK54qc4h86po9bFwe/GpFKy2dPzCIqDeOwXsq5
         1XFo1WcHJcmPsmycsXm9f/m+X6cdH8xfriMCpWD5zHEY41utpp38OPLiRiUBkMLSvTbL
         RoZwiPUduFUCZ2xPC/Z4QzlkT/sm+28lkUiavQAfVUvosO6xWJxTYHgDrbCGoP5Q8Uxk
         eU33QmuiQZmCTLSJ82csPLupl9uH2v0nsy924l64mJAn3qDvrok1FIr5DB9T03Ym+iVQ
         kwhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739293155; x=1739897955;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFtCCseT9ZuSN+w/4VJdWHADAqu8GLy8ymRf81z7L4w=;
        b=YtZrgs6J/GNB2zrUzsO7kRZhtgRArcIoCLAheiPwfn42knX4x+BenMEvoQ5eVl7wmJ
         x/ft3t0VUttsGLaIa+ogqKPqKitbf13DS16ya2HmodIfkO0A7GsprXCiKp0Mzn4vkAyq
         dmb5jydobIIf8q3A9GldHdG1r4b0L5TmJHS4A6edZ2GhLg5v7rfAD6Q2oWoC9JHr7O+s
         R6cC0MWZgprPavXSrX8K516nb66XSOv7pWi7AlOKgDRMzG16kInfrd+ngd0BaLSv19IF
         11nWHzspMxwd7yhuDGak9E/S3yvyHk1gJlR9XMbhFmlkmbSuZernGB9U+NcO5WgqbisX
         +pMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfop6yS4fneqL1Hu+c4h3KqALaKpRPmZHcpQ943V8Rro/debKf6yrgbYW68avI4Yv3CXvFMjU5il8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwYYnJp6HbUOoINvrAGBiRckJwk2b6JYNLOMTNhxSA8OdkkO1zH
	0OLrIeI0s4lIk7LX7ki0EFeQ/53iffa/0yAbGf+3otpfU3KA1PbSBskKK/QDPQ==
X-Gm-Gg: ASbGncvDs4l0DyDz3LPOKOkVsoDBIgynsxAI693kkkErSNrQozjYSjDsNibcGyt8POw
	pCnaYhGA94Ca74YWs6GBId9qKj6zLeitedMLfEbwhL2Spj+lcHSsQ/ey2u3XUQyebbJZyBIio9H
	ifr63syNd1FyfY0toCPjlsMt32H99aJiEmcZFz9v8bO6m67kFkh/qTfdIN+XavdzQeBazcAPAGj
	pN/X/8SXR3LnYx/n+2tJNQ7K4MjbK63Fpml0SzHYCf4ijEE3c2lUHe/8SRjsl45y8zx7n7kWciW
	9s4jRUZY3u9kowVlWmQZcnpmXb6hk2bpjN+XTcKCmzJ08WTzHMUE+Skv9Ms/H/Dsm9a8M8azhaL
	6
X-Google-Smtp-Source: AGHT+IFrz71Hm8TXfphTbSvx1KyVWCFZLl5AvnVLZCVZdWm2SecZIzRJqztmDAiYI4MFWgp0+qgYpA==
X-Received: by 2002:a05:6402:380e:b0:5d3:ce7f:abee with SMTP id 4fb4d7f45d1cf-5de450734abmr18965235a12.25.1739293155207;
        Tue, 11 Feb 2025 08:59:15 -0800 (PST)
Message-ID: <7befbc91-6d0a-47cc-8fe5-509b90e55103@suse.com>
Date: Tue, 11 Feb 2025 17:59:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.21 v5] xen/riscv: identify specific ISA supported by
 cpu
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <39eacdb6312988fb746e3dff7e29db2f9fcef614.1738958635.git.oleksii.kurochko@gmail.com>
 <18030e36-ac28-42e0-9bcb-2457c0281273@suse.com>
 <279e70a8-ad09-46bc-a1f9-7aa6707d3974@gmail.com>
 <417b456f-77b9-4e8f-9641-2ac8e2fb9cda@suse.com>
 <cf11e1a6-6b89-4eca-b13c-d8b9b81262e4@gmail.com>
 <6e6ac5b5-82ad-4bf0-bbd8-55dd075cf268@suse.com>
 <bdc0a943-45f3-41fc-902e-b6fe0e12965b@gmail.com>
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
In-Reply-To: <bdc0a943-45f3-41fc-902e-b6fe0e12965b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.02.2025 17:50, Oleksii Kurochko wrote:
> On 2/11/25 4:47 PM, Jan Beulich wrote:
>> On 11.02.2025 16:28, Oleksii Kurochko wrote:
>>> On 2/11/25 11:01 AM, Jan Beulich wrote:
>>>> On 11.02.2025 10:53, Oleksii Kurochko wrote:
>>>>> On 2/10/25 5:19 PM, Jan Beulich wrote:
>>>>>> On 07.02.2025 21:07, Oleksii Kurochko wrote:
>>>>>>> +/*
>>>>>>> + * The canonical order of ISA extension names in the ISA string is defined in
>>>>>>> + * chapter 27 of the unprivileged specification.
>>>>>>> + *
>>>>>>> + * The specification uses vague wording, such as should, when it comes to
>>>>>>> + * ordering, so for our purposes the following rules apply:
>>>>>>> + *
>>>>>>> + * 1. All multi-letter extensions must be separated from other extensions by an
>>>>>>> + *    underscore.
>>>>>>> + *
>>>>>>> + * 2. Additional standard extensions (starting with 'Z') must be sorted after
>>>>>>> + *    single-letter extensions and before any higher-privileged extensions.
>>>>>>> + *
>>>>>>> + * 3. The first letter following the 'Z' conventionally indicates the most
>>>>>>> + *    closely related alphabetical extension category, IMAFDQLCBKJTPVH.
>>>>>>> + *    If multiple 'Z' extensions are named, they must be ordered first by
>>>>>>> + *    category, then alphabetically within a category.
>>>>>>> + *
>>>>>>> + * 4. Standard supervisor-level extensions (starting with 'S') must be listed
>>>>>>> + *    after standard unprivileged extensions.  If multiple supervisor-level
>>>>>>> + *    extensions are listed, they must be ordered alphabetically.
>>>>>>> + *
>>>>>>> + * 5. Standard machine-level extensions (starting with 'Zxm') must be listed
>>>>>>> + *    after any lower-privileged, standard extensions.  If multiple
>>>>>>> + *    machine-level extensions are listed, they must be ordered
>>>>>>> + *    alphabetically.
>>>>>>> + *
>>>>>>> + * 6. Non-standard extensions (starting with 'X') must be listed after all
>>>>>>> + *    standard extensions. If multiple non-standard extensions are listed, they
>>>>>>> + *    must be ordered alphabetically.
>>>>>>> + *
>>>>>>> + * An example string following the order is:
>>>>>>> + *    rv64imadc_zifoo_zigoo_zafoo_sbar_scar_zxmbaz_xqux_xrux
>>>>>>> + *
>>>>>>> + * New entries to this struct should follow the ordering rules described above.
>>>>>>> + *
>>>>>>> + * Extension name must be all lowercase (according to device-tree binding)
>>>>>>> + * and strncmp() is used in match_isa_ext() to compare extension names instead
>>>>>>> + * of strncasecmp().
>>>>>>> + */
>>>>>>> +const struct riscv_isa_ext_data __initconst riscv_isa_ext[] = {
>>>>>>> +    RISCV_ISA_EXT_DATA(i, RISCV_ISA_EXT_i),
>>>>>>> +    RISCV_ISA_EXT_DATA(m, RISCV_ISA_EXT_m),
>>>>>>> +    RISCV_ISA_EXT_DATA(a, RISCV_ISA_EXT_a),
>>>>>>> +    RISCV_ISA_EXT_DATA(f, RISCV_ISA_EXT_f),
>>>>>>> +    RISCV_ISA_EXT_DATA(d, RISCV_ISA_EXT_d),
>>>>>>> +    RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
>>>>>>> +    RISCV_ISA_EXT_DATA(c, RISCV_ISA_EXT_c),
>>>>>>> +    RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
>>>>>>> +    RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
>>>>>>> +    RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
>>>>>>> +    RISCV_ISA_EXT_DATA(zifencei, RISCV_ISA_EXT_ZIFENCEI),
>>>>>>> +    RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
>>>>>>> +    RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
>>>>>>> +    RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
>>>>>>> +    RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
>>>>>>> +    RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
>>>>>>> +};
>>>>>>> +
>>>>>>> +static const struct riscv_isa_ext_data __initconst required_extensions[] = {
>>>>>>> +    RISCV_ISA_EXT_DATA(i, RISCV_ISA_EXT_i),
>>>>>>> +    RISCV_ISA_EXT_DATA(m, RISCV_ISA_EXT_m),
>>>>>>> +    RISCV_ISA_EXT_DATA(a, RISCV_ISA_EXT_a),
>>>>>>> +    RISCV_ISA_EXT_DATA(f, RISCV_ISA_EXT_f),
>>>>>>> +    RISCV_ISA_EXT_DATA(d, RISCV_ISA_EXT_d),
>>>>>> Why would these last four (Zifencei below) not be included in #ifdef
>>>>>> CONFIG_RISCV_ISA_RV64G, just like ...
>>>>>>
>>>>>>> +#ifdef CONFIG_RISCV_ISA_C
>>>>>>> +    RISCV_ISA_EXT_DATA(c, RISCV_ISA_EXT_c),
>>>>>>> +#endif
>>>>>> .. this one is?
>>>>> I'm not sure if it was the best decision, but I did it this way because
>>>>> I believe other bitnesses (32, 128) will also need G. So, I left them
>>>>> without|#ifdef| to avoid adding|#ifdef CONFIG_RV{32,128}G| in the future.
>>>> That's fine, but then imo RISCV_ISA_RV64G ought to be dropped, and we use
>>>> G unconditionally. Whether that's a good move I don't know. I could
>>>> imagine embedded use cases which want to run an very simple processors.
>>>>
>>>>> I also spent some time considering whether 'f' and 'd' are necessary
>>>>> for Xen. In the end, I decided that if they aren't needed for Xen,
>>>>> it might be better not to use "G" for compilation and instead explicitly
>>>>> specify "ima". But it will be better to do as a separate patch (if it
>>>>> makes sense).
>>>> That's certainly an option; use of floating point registers / insns will
>>>> need suppressing one way or another anyway, sooner or later. And yes, I
>>>> agree this wants to be a separate change. Even their relative order is
>>>> not important, as long as things remain consistent at any point in time.
>>> Actually, I think that we should drop 'f' and 'd' from required_extensions[]
>>> array as they aren't really needed for Xen. Or make them conditional just to
>>> be sure that if "G" was used for compilation and the code with using of them
>>> was generated then they are really supported by a h/w.
>> As said, that's okay. But as also said you then need to also keep the
>> compiler from potentially using F or D insns / registers.
>>
>>> Regarding #ifdef-ing with RISCV_ISA_RV64G, I think that we have to keep them
>>> mentioned unconditionally as 'i', 'm', 'a', 'zicsr' and 'zifencei' which are
>>> part of 'G' as all of them are needed by Xen to work.
>> Yet then why do we have CONFIG_RISCV_ISA_RV64G?
> 
> Several reasons come to my mind:
> 1. We still need to specify the architecture's bitness (rv32, rv64, etc.) in|march|.

Of course.

> 2. It was more convenient to write just "G" instead of "ima_zicsr_zifencei".

Convenience can only matter when correctness isn't affected. Allowing
floating point registers to be used (when they're not aliases of the
integer ones) can end in crashes or even data corruption.

> Perhaps it would be better to have separate configs (similar to what Linux uses):
> |1. ||riscv-march-$(CONFIG_ARCH_RV32I) := rv32ima 2. 
> riscv-march-$(CONFIG_ARCH_RV64I) := rv64ima 3. riscv-march-$(CONFIG_FPU) 
> := $(riscv-march-y)fd |
> 
> For now, we can skip option 3 until|CONFIG_FPU| is actually needed.
> 
> Introduce only options 1 and 2, probably reusing|CONFIG_RISCV_32| and|CONFIG_RISCV_64|:
> 1.|riscv-march-$(CONFIG_RISCV_32) := rv32ima 
> 2.riscv-march-$(CONFIG_RISCV_64) := rv64ima |
> 
> Then, explicitly add|_zicsr| and|_zifencei|:
> |||riscv-march-y := $(riscv-march-y)_zicsr_zifencei|

Sounds reasonable, albeit the formatting of your email was somewhat screwed,
hampering readability (which may well be an effect of the MUI I'm using).

Jan

