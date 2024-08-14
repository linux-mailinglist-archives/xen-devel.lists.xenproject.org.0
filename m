Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD243951F1F
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 17:53:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777495.1187632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seGJK-0000aI-00; Wed, 14 Aug 2024 15:53:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777495.1187632; Wed, 14 Aug 2024 15:53:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seGJJ-0000Xc-TY; Wed, 14 Aug 2024 15:53:17 +0000
Received: by outflank-mailman (input) for mailman id 777495;
 Wed, 14 Aug 2024 15:53:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NhoJ=PN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1seGJH-0000XU-TJ
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 15:53:15 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50e8761b-5a55-11ef-a505-bb4a2ccca743;
 Wed, 14 Aug 2024 17:53:14 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5a156557026so79583a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2024 08:53:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5beae5fa625sm553348a12.93.2024.08.14.08.53.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 08:53:13 -0700 (PDT)
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
X-Inumbo-ID: 50e8761b-5a55-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723650794; x=1724255594; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A2IeALN3Vrq3vvrJcYopiAMEOi+iZY1Mf62fXq4DCts=;
        b=fa5qcn+8MFjunQwA6OxTeUSlP2evgham8hOIAoxeiTG9E1o9LI4Ji26FBYw8P/B4gf
         Rowawv05Gk0S3T04gW3j4cFPT7P8XUMegD5EiBoKUSitVjYp1T7yEiAtaxNlD/5XQD0+
         2eFNImH7LLlKI1Iz9Y2QZi5vzNYUTkiMqrLuwFMXPoxtHA+EjHSc2IbwIqjhXDzQWO5x
         T0Fs1J34Y+35cvm1NHFbOBvWhHPEvh1WpHd1fr7BK3gnsfGkxBsSCzckhyEQMqp9Necw
         0chiYMMwl9BQ3j5ehJSRTXKDLZv+u88LSTZ3nkx++FxpA2MYho1BK5m8Aa32fJjt9B7f
         Btiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723650794; x=1724255594;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A2IeALN3Vrq3vvrJcYopiAMEOi+iZY1Mf62fXq4DCts=;
        b=uRDXo/nl8O5qZlLtPLk71Kqj0fvPKkLuuHi97cWPsCtA02HdiSClCa9NDFUpRPw2eI
         bJoIixgBuxEN8soZl7VbFkI+K2em3naBgjx0G/Gd0CbRi3sRRld20CoBIoPbWiTvYhWr
         720h7g06pQF+gXG3zlbXQOoUJXhYEcxZuOf63n6r4b9pI0Hv9hiKB2v/OHJwdpDiRxE5
         SWfHkU2+WyIvObF4vWs1IJeSyCZYzSdayHCT+YOIcGJGWv4+nYMbPIPXOkE7wzjZpQHv
         kz56PldxaGjIr+9DLWJJNZ3oBRWNoxY6472bihPQ5o9zIC7zHJ/t/n8gaAtqhKZf5H49
         vDmw==
X-Forwarded-Encrypted: i=1; AJvYcCW0/BQUJH8sZWGbMHon0BGcMdXhtE/J15i6qNj9PEh+9k6umd8mlik9FTsUiYU+Ly0pOseNjGfQntyfrm56tJi0YGsvdJM02+i6Ez2YMxc=
X-Gm-Message-State: AOJu0YxmdPaIJvHWyaQ5hHP3nKudUTCSomIXNduWKdbj2TogoBvf+zPZ
	iSqllEccvVQCe5bO4s0G7J3MIfBvUmu7nxYwg31gOXrake6ORExy5jk06eEuSA==
X-Google-Smtp-Source: AGHT+IG8pSUDu6nVhZUcf19kE/vFyNTJcWLuViHUe8M0v9g0B+jJaGlkaR4B01K01XxASFY+kE8YGA==
X-Received: by 2002:a05:6402:11c6:b0:5a3:27bd:e264 with SMTP id 4fb4d7f45d1cf-5bea1c7724amr2815632a12.9.1723650794217;
        Wed, 14 Aug 2024 08:53:14 -0700 (PDT)
Message-ID: <959f33b6-3649-45b3-8f31-ec494e60fd80@suse.com>
Date: Wed, 14 Aug 2024 17:53:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] xen/riscv: introduce and initialize SBI RFENCE
 extension
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1723214540.git.oleksii.kurochko@gmail.com>
 <1a863d06866f86761d23e6da3f4a6ee58c474473.1723214540.git.oleksii.kurochko@gmail.com>
 <77ff59d1-b158-4603-bdbd-67c079ce87c9@suse.com>
 <34cbaff323d9619f8d4cb1d2b8ed12584037ee0d.camel@gmail.com>
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
In-Reply-To: <34cbaff323d9619f8d4cb1d2b8ed12584037ee0d.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.08.2024 17:41, oleksii.kurochko@gmail.com wrote:
> On Tue, 2024-08-13 at 11:34 +0200, Jan Beulich wrote:
>> On 09.08.2024 18:19, Oleksii Kurochko wrote:
>>> +static unsigned long sbi_major_version(void)
>>> +{
>>> +    return (sbi_spec_version >> SBI_SPEC_VERSION_MAJOR_SHIFT) &
>>> +        SBI_SPEC_VERSION_MAJOR_MASK;
>>> +}
>>
>> Can you use MASK_EXTR() here, allowing to even drop the separate
>> SBI_SPEC_VERSION_MAJOR_SHIFT?
> I am not sure that:
> (sbi_spec_version >> SBI_SPEC_VERSION_MAJOR_SHIFT) & 
> SBI_SPEC_VERSION_MAJOR_MASK == MASK_EXTR(sbi_spec_version,
> SBI_SPEC_VERSION_MAJOR_MASK)

How come you're not sure? That's precisely what MASK_EXTR() is for.

>>> +static long sbi_ext_base_func(long fid)
>>> +{
>>> +    struct sbiret ret;
>>> +
>>> +    ret = sbi_ecall(SBI_EXT_BASE, fid, 0, 0, 0, 0, 0, 0);
>>> +    if ( !ret.error )
>>> +        return ret.value;
>>> +    else
>>> +        return ret.error;
>>
>> With the folding of two distinct values, how is the caller going to
>> tell failure from success?
> By checking if the return value is < 0.
> According to the SBI spec [
> https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/src/binary-encoding.adoc?plain=1#L32
> ] ret.error can be or 0 ( which means success ) or something < 0 if it
> was a failure.

Right. And what if ret.error was 0, but ret.value was negative?

>>> +int sbi_remote_sfence_vma(cpumask_t *cpu_mask,
>>> +                          unsigned long start_addr,
>>> +                          unsigned long size)
>>> +{
>>> +    return __sbi_rfence(SBI_EXT_RFENCE_REMOTE_SFENCE_VMA,
>>> +                        cpu_mask, start_addr, size, 0, 0);
>>
>> No check (not even an assertion) here for __sbi_rfence still being
>> NULL?
> I thought that it would be enough to have BUG_ON() in sbi_init() but
> then probably would be better to update the message inside BUG_ON():
>    int __init sbi_init(void)
>    {
>    ....
>    
>        if ( !sbi_has_rfence() )
>        {
>            BUG_ON("At the moment flush_xen_tlb_range_va() uses SBI rfence
>    to "
>                   "flush TLB for all CPUS!");

I never really liked this kind of BUG_ON(). I leave it uncommented in
code which clearly is only temporary. Plus imo such BUG_ON()s want to
be next to where the risk is, i.e. in this case ahead of the possible
NULL deref. Then again, without PV guests and without anything mapped
at VA 0, you'll crash cleanly anyway. So perhaps my request to add a
check went too far.

Jan

