Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C972A2A703
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 12:11:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882743.1292842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfzmX-0007GZ-3D; Thu, 06 Feb 2025 11:10:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882743.1292842; Thu, 06 Feb 2025 11:10:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfzmW-0007DW-WF; Thu, 06 Feb 2025 11:10:53 +0000
Received: by outflank-mailman (input) for mailman id 882743;
 Thu, 06 Feb 2025 11:10:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TFaJ=U5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tfzmV-0007DQ-8C
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 11:10:51 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05873c71-e47b-11ef-a073-877d107080fb;
 Thu, 06 Feb 2025 12:10:49 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5dccc90a52eso1506317a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Feb 2025 03:10:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dcf1b80fb0sm703034a12.39.2025.02.06.03.10.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 03:10:48 -0800 (PST)
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
X-Inumbo-ID: 05873c71-e47b-11ef-a073-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738840249; x=1739445049; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uxuShCLXfOYr5np+2rY9F3QXqSeqnDkF8Z9rJIeg458=;
        b=Ii1mOGKeEHSgEcUnERwqynQw23gIlJhGWLY26+w2choNJEME6SkKrUNy4T5KP6Pfz2
         vdEPUh1vLe+agWIktjSK7bt5b00WfLO6Xqq3nQ6ctuD1sRyGpsfdt3M5Kamw9huPD9f0
         N0KYam5ZkRaAao7jcnjBV9kqx54zJV5SPyOiT/PQDAaCmZpsVNRGuwy+73Sr3KgOjNQf
         aJOW+4oi9cS1dFqUtWArKlntP6GHTLIT1KWCIqkf/QPbuCTj6wbW4b/hX+qOTE8hHHip
         7UN9TFtKokkx+lyvdN5tb3Dt8kYewMCa9rHQVVgFyvvAAxWzmruWkfZlS6bOuzf4hXL6
         ZRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738840249; x=1739445049;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uxuShCLXfOYr5np+2rY9F3QXqSeqnDkF8Z9rJIeg458=;
        b=hY3BWVs+ElmqVhUq0Tycil6NuFmbpcuzQtPO8oUxkTHbMT2ojbQj793uAgGfXqDns9
         X4JbFmLAhA92nhW+zxCdIXDCsZH8x+m+qt8Ee+1XI85UKKIb9vn3ixu7lawnkKrt9R5u
         Yd5DMUwELFjFqWoKWuMvUKt+OsTvOsrOnz2bLK3+dodbAefkZg+aFyjzBg/yyKOGosDn
         ElIUG+DltcRS4riW6HbF4bFONhYr4hgIiEVp5xjmbdHzZ+F04g3/lORwW+c7yBvBpY5+
         dUmpzUS6F49W1RndaID6wb3vujAS4Tos9YZCR170L+nYykE5eiz1UWXgYZ6ds9rygefI
         xsPg==
X-Forwarded-Encrypted: i=1; AJvYcCXgQ1ypF7AWC3Vsa3LVceect145aXQzaxyfeiAQaCRWJQvAXhO7aiWES59U8OgjuHCxXFPL4q1jzBs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzOTQjAFs0extC0oHeg/3Lh2dAia90FYY/VABldBWurC87otdUX
	XQsLecxtf4R7JdNlJgXl8JT6vUMlmGQThku0Amh+p83TtDwyUslrXWD7oiinbQ==
X-Gm-Gg: ASbGnctfXeZDAmM2ODzdY1WHoOkLSyn8o/WB2FwarqaJNLnEjTk4vadOFKuC8nQlKTa
	DS5HOfs6hcpKdv1xKGnNCyiWbJeAOYolhd4dh3PlGIq4JMv0GVCv0fLD7MwB/J/nARXuaSFarGN
	WlxWVcP11d6RHxTPlSHvyqb5u4XFGhx3Po0Ofb3YMe21I8c7E3v1RWkTbnw+s2QcAZ0LkWqmrb4
	o2jk4sdU24Joj26Cz9HzhSZdel5IeO1IOPZaHNRqOG3OLwCl8MZURAgZ7KigjpJc+ak7q6TWcuW
	hkbUOtGhjNnWjf9bfC/uZuQ+lUX9AeFr/HeKIxDlkkn0iPv/KmNNyrHZMwGr7xGGlrvBD83UJVY
	z
X-Google-Smtp-Source: AGHT+IEiqcYzthIMWUF1ifz7zxhDxJNFWw75Tk+WTfBE1G6dFQShvua6pGuaGXYJLo57QJOyaDlC2Q==
X-Received: by 2002:a05:6402:40d6:b0:5cf:bb9e:cca7 with SMTP id 4fb4d7f45d1cf-5dcdb7770c8mr7580120a12.28.1738840249068;
        Thu, 06 Feb 2025 03:10:49 -0800 (PST)
Message-ID: <4f16a3b9-3759-4bea-89cd-361b492e0133@suse.com>
Date: Thu, 6 Feb 2025 12:10:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4-21 v4] xen/riscv: identify specific ISA supported by
 cpu
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <a63c60c7a97a2b361e3a41f57bed61c0c9a0a89f.1738653407.git.oleksii.kurochko@gmail.com>
 <ab7077b3-6bef-4025-9389-345a345a141c@suse.com>
 <6c9baf46-bc0b-49a7-9cdd-bebb0fc71ee7@gmail.com>
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
In-Reply-To: <6c9baf46-bc0b-49a7-9cdd-bebb0fc71ee7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.02.2025 20:00, Oleksii Kurochko wrote:
> On 2/4/25 12:47 PM, Jan Beulich wrote:
>> On 04.02.2025 08:20, Oleksii Kurochko wrote:
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
>>> +# error "unsupported RISC-V bitness"
>>> +#endif
>>> +
>>> +    isa += 4;
>>> +
>>> +    while ( *isa )
>>> +    {
>>> +        const char *ext = isa++;
>>> +        const char *ext_end = isa;
>>> +        bool ext_err = false;
>>> +
>>> +        switch ( *ext )
>>> +        {
>>> +        case 'x':
>>> +            printk_once("Vendor extensions are ignored in riscv,isa\n");
>>> +            /*
>>> +             * To skip an extension, we find its end.
>>> +             * As multi-letter extensions must be split from other multi-letter
>>> +             * extensions with an "_", the end of a multi-letter extension will
>>> +             * either be the null character or the "_" at the start of the next
>>> +             * multi-letter extension.
>>> +             */
>>> +            for ( ; *isa && *isa != '_'; ++isa )
>>> +                ;
>>> +            ext_err = true;
>>> +            break;
>> I was wondering why ext_end isn't updated here. Looks like that's because
>> ext_err is set to true, and the checking below the switch looks at ext_err
>> first. That's technically fine, but - to me at least - a little confusing.
>> Could setting ext_end to NULL take the role of ext_err? For the code here
>> this would then immediately clarify why ext_end isn't otherwise maintained.
>> (The "err" in the name is also somewhat odd: The log message above says
>> "ignored", and that's what the code below also does. There's nothing
>> error-ish in here; in fact there may be nothing wrong about the specific
>> vendor extension we're ignoring.)
> 
> IIUC, your suggestion is to use instead of "ext_err = true" -> "ext_end = NULL".

Yes.

>>> +        case 's':
>>> +            /*
>>> +             * Workaround for invalid single-letter 's' & 'u' (QEMU):
>>> +             *   Before QEMU 7.1 it was an issue with misa to ISA string
>>> +             *   conversion:
>>> +             *https://patchwork.kernel.org/project/qemu-devel/patch/dee09d708405075420b29115c1e9e87910b8da55.1648270894.git.research_trasio@irq.a4lg.com/#24792587
>>> +             *   Additional details of the workaround on Linux kernel side:
>>> +             *https://lore.kernel.org/linux-riscv/ae93358e-e117-b43d-faad-772c529f846c@irq.a4lg.com/#t
>>> +             *
>>> +             * No need to set the bit in riscv_isa as 's' & 'u' are
>>> +             * not valid ISA extensions. It works unless the first
>>> +             * multi-letter extension in the ISA string begins with
>>> +             * "Su" and is not prefixed with an underscore.
>>> +             */
>>> +            if ( ext[-1] != '_' && ext[1] == 'u' )
>>> +            {
>>> +                ++isa;
>>> +                ext_err = true;
>>> +                break;
>>> +            }
>>> +            fallthrough;
>>> +        case 'z':
>>> +            /*
>>> +             * Before attempting to parse the extension itself, we find its end.
>>> +             * As multi-letter extensions must be split from other multi-letter
>>> +             * extensions with an "_", the end of a multi-letter extension will
>>> +             * either be the null character or the "_" at the start of the next
>>> +             * multi-letter extension.
>>> +             *
>>> +             * Next, as the extensions version is currently ignored, we
>>> +             * eliminate that portion. This is done by parsing backwards from
>>> +             * the end of the extension, removing any numbers. This may be a
>>> +             * major or minor number however, so the process is repeated if a
>>> +             * minor number was found.
>>> +             *
>>> +             * ext_end is intended to represent the first character *after* the
>>> +             * name portion of an extension, but will be decremented to the last
>>> +             * character itself while eliminating the extensions version number.
>>> +             * A simple re-increment solves this problem.
>>> +             */
>>> +            for ( ; *isa && *isa != '_'; ++isa )
>>> +                if ( unlikely(!isalnum(*isa)) )
>>> +                    ext_err = true;
>>> +
>>> +            ext_end = isa;
>>> +            if ( unlikely(ext_err) )
>>> +                break;
>> This, otoh, is an error. Which probably shouldn't go silently.
> 
> It is actually not an error, what it means that if version is mentioned or not, so
> (1) rv32..._zbb_zbc
> (2) rv32..._zbb1p2_zbc
> 
> For (1), ext_err = true and it means that version isn't mentioned for _zbb and after it
> immediately another extension name is going, so there is no any sense in ignoring (or parsing) version
> numbers.
> For (2), ext_err = false (because it ends on number ) so we have to ignore (or parse) version nubmers.

I don't follow. Why would ext_err be true for (1)? That's a well-formed
specifier, isn't it? rv32..._zbb.zbc (with the last dot meaning a literal
one, unlike the earlier ...) is an example of what would cause ext_err to
be true.

>>> +        default:
>>> +            /*
>>> +             * Things are a little easier for single-letter extensions, as they
>>> +             * are parsed forwards.
>>> +             *
>>> +             * After checking that our starting position is valid, we need to
>>> +             * ensure that, when isa was incremented at the start of the loop,
>>> +             * that it arrived at the start of the next extension.
>>> +             *
>>> +             * If we are already on a non-digit, there is nothing to do. Either
>>> +             * we have a multi-letter extension's _, or the start of an
>>> +             * extension.
>>> +             *
>>> +             * Otherwise we have found the current extension's major version
>>> +             * number. Parse past it, and a subsequent p/minor version number
>>> +             * if present. The `p` extension must not appear immediately after
>>> +             * a number, so there is no fear of missing it.
>>> +             */
>>> +            if ( unlikely(!isalpha(*ext)) )
>>> +            {
>>> +                ext_err = true;
>>> +                break;
>>> +            }
>> Like above this also looks to be a situation that maybe better would be
>> left go entirely silently. I even wonder whether you can safely continue
>> the parsing in that case: How do you know whether what follows is indeed
>> the start of an extension name?
> 
> Lets consider examples:
> (1) riscv,isa=im
> (2) riscv,isa=i1p2m
> (3) riscv,isa=i1m
> 
> (4) riscv,isa=i1_m1
> 
> Note: Underscores "_" may be used to separate ISA extensions to improve readability
> and to provide disambiguation, e.g., "RV32I2_M2_A2".
> 
> (1) isa="i" so ext = "m" => no minor and major version between "i" and "m" => `ext` contains the name
>      of the next extension name, thereby we will break a loop and go for parsing of the next extension
>      which is "m" in this example
> (2) isa="i" => ext="1" => algorithm will go further and will just skip minor and major version for
>      this extension (1p2 => 1.2 version of extension "i")
> (3) just the same as (2) but will stop earlier as minor version isn't set.
> 
> Note: having "_" is legal from specification point of view, but it is illegal to use it between single letter
>        extension from device tree binding point of view.
> (4) just the same as (2) and (3) but using "_" separator, so the if above will just skip "_" and the next
>      after "_" is an extension name again.
> 
> Considering that "_" is illegal from device tree point of view between single letter extensions we should have
> ASSERT(*ext != "_") and then only cases (1) - (3) will be possible to have.
> Probably it also will make a sense to have an array with legal single letter extensions and check that *ext is
> in this array.
> 
> Interesting that device tree binding doesn't cover this case:
> ```
> Because the "P" extension for Packed SIMD can be confused for the decimal point in a version number,
> it must be preceded by an underscore if it follows a number. For example, "rv32i2p2" means version
> 2.2 of RV32I, whereas "rv32i2_p2" means version 2.0 of RV32I with version 2.0 of the P extension.
> ```
> if I correctly interpreted the pattern:pattern:^rv(?:64|32)imaf?d?q?c?b?k?j?p?v?h?(?:[hsxz](?:[0-9a-z])+)?(?:_[hsxz](?:[0-9a-z])+)*$
> And it also doesn't support versions for single letter extensions.
> So "rv32i2_m2_a2" or with using "p" is impossible?
> Then riscv_isa_parse_string() could be simplified ( probably when it was implemented in Linux kernel they don't have the binding for riscv,isa and they
> just tried to follow RISC-V specification ) for the case of single letter extensions (or just keep it as is to be in sync with Linux kernel).

All fine, but what about e.g.

(5) riscv,isa=i?m1

>>> +static void __init riscv_fill_hwcap_from_isa_string(void)
>>> +{
>>> +    const struct dt_device_node *cpus = dt_find_node_by_path("/cpus");
>>> +    const struct dt_device_node *cpu;
>>> +
>>> +    if ( !cpus )
>>> +    {
>>> +        printk("Missing /cpus node in the device tree?\n");
>>> +        return;
>>> +    }
>>> +
>>> +    dt_for_each_child_node(cpus, cpu)
>>> +    {
>>> +        DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
>>> +        const char *isa;
>>> +        unsigned long cpuid;
>>> +
>>> +        if ( !dt_device_type_is_equal(cpu, "cpu") )
>>> +            continue;
>>> +
>>> +        if ( dt_get_cpuid_from_node(cpu, &cpuid) < 0 )
>>> +            continue;
>>> +
>>> +        if ( dt_property_read_string(cpu, "riscv,isa", &isa) )
>>> +        {
>>> +            printk("Unable to find \"riscv,isa\" devicetree entry "
>>> +                   "for DT's cpu%ld node\n", cpuid);
>>> +            continue;
>>> +        }
>>> +
>>> +        for ( unsigned int i = 0; (isa[i] != '\0'); i++ )
>>> +            if ( !isdigit(isa[i]) && (isa[i] != '_') && !islower(isa[i]) )
>>> +                panic("According to DT binding riscv,isa must be lowercase\n");
>>> +
>>> +        riscv_isa_parse_string(isa, this_isa);
>>> +
>>> +        /*
>>> +         * In the unpriv. spec is mentioned:
>>> +         *   A RISC-V ISA is defined as a base integer ISA, which must be
>>> +         *   present in any implementation, plus optional extensions to
>>> +         *   the base ISA.
>>> +         * What means that isa should contain, at least, I or E thereby
>>> +         * this_isa can't be empty too.
>>> +         *
>>> +         * Ensure that this_isa is not empty, so riscv_isa won't be empty
>>> +         * during initialization. This prevents ending up with extensions
>>> +         * not supported by one of the CPUs.
>>> +         */
>>> +        ASSERT(!bitmap_empty(this_isa, RISCV_ISA_EXT_MAX));
>> This is again an assertion on input we consume. Afaict it would actually
>> trigger not only on all kinds of invalid inputs, but on something valid
>> like "rv32e".
> 
> In the case of "rv32e" I think it is fine that it will be asserted as in riscv_isa_ext[] we don't
> have 'E' extension and thereby riscv_isa_ext[] should be updated properly.

Of course, but that still doesn't want to be by way of ASSERT()ing.

> Could you please explain me again what is wrong with having ASSERT() itself for input we consume? If to change that
> to 'if ()' would it be better? Or it should be just moved to riscv_isa_parse_string() where this bitmap is filled?

It's very simple: For internal state we maintain, use assertions to check
assumptions you make. For input we get, use other error checking (which may
be panic(), where no better option exists).

Jan

