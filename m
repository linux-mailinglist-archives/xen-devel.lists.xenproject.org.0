Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B789990460
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 15:31:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810427.1223135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swiOF-0006BD-9h; Fri, 04 Oct 2024 13:30:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810427.1223135; Fri, 04 Oct 2024 13:30:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swiOF-00068a-5x; Fri, 04 Oct 2024 13:30:39 +0000
Received: by outflank-mailman (input) for mailman id 810427;
 Fri, 04 Oct 2024 13:30:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E5lv=RA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1swiOD-00068U-Eh
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 13:30:37 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6c5c6ff-8254-11ef-a0bb-8be0dac302b0;
 Fri, 04 Oct 2024 15:30:36 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5c5bca59416so2652747a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Oct 2024 06:30:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99103b32a5sm225399066b.116.2024.10.04.06.30.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Oct 2024 06:30:35 -0700 (PDT)
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
X-Inumbo-ID: d6c5c6ff-8254-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728048636; x=1728653436; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YwIcegFr/Hgl+Vvby2yaxfMkwwieGzjpd6JyM7YrrQw=;
        b=UJaWpY/3PmuPWzWXXsZmI7h8RcA7PlBow4Xlusqb8K8DpNOeDpwza8ksOuOOPcfoMF
         91hfJlpIjlM6V5IPXbTdm0v42gCjAJCGAfi32Z/lCJeq/M0QAnmkibVJkD90eVNWvEiP
         eLbIP1M7c7pi05P8LNXOQEZLymc9Tz9s69xaXlsiMUQxnRVfXUDPuU/oW0RehOHAaJI4
         96seKTudEr5YQS8iAPwmrieOB9P8Z6Y+M9OvxOO1xY5uqa5PzXTD+p4ReZgoBQUKqeAA
         VHDzqKl9jhAtK8MzAvhh5C1NvAVImYeM5bqdpwD7GHZ7YpIvNGCjvl19I6ekUiNeZPw3
         NKvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728048636; x=1728653436;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YwIcegFr/Hgl+Vvby2yaxfMkwwieGzjpd6JyM7YrrQw=;
        b=PEplUTYUuA48e4mJ3kwTIOnRSccFB0suvTAYvNtdt43L+T+UgKLTzotvs1L8D1e0Pz
         LWepWDGHFO8yNS6c7dAdy0OJA32JUwAUSwtFsX0tSYMKNu3dAMsnkBI6k1jsw5No32R2
         B/eKfvx8jdRI5OlgCR/0I0/uvDcRtVN1WHrnEPM5Y9K1LOkwYIHV7q01ml7U2HOZyRW2
         fk3TbKPwVv3nlrYO1Qa13uCILsgirp5F9vOOEa5JVdXIv/IjZ74cmLQwwU/fq5s2Nnrz
         U3mInNXKlCB8r4Kbaoly1K5xYJyRKG0mqrlqCTWg2os97za/tSPb3JD+dD5ZoHCeyofh
         eezw==
X-Gm-Message-State: AOJu0YwN4KUIcKKvMAuTq1i2Tvp4LtQSNocc7pUejSNee9jWaOBj0arL
	ICyLi+KOHBfEry1YtCvuhegEQT/W2IEz/q1TesBMK1eonMbzHlBSpNhQfPxVbQ==
X-Google-Smtp-Source: AGHT+IE80U/+x2gpWafCYFREavOJXX2T7E9+0suHloix01noKeU41Bo8d+6UOf3zm8ZidJqxWMLOhQ==
X-Received: by 2002:a17:907:6d1b:b0:a90:34bf:844 with SMTP id a640c23a62f3a-a991c00f5e6mr270165466b.59.1728048635775;
        Fri, 04 Oct 2024 06:30:35 -0700 (PDT)
Message-ID: <36069df2-64ec-4f0e-908e-d0128630daea@suse.com>
Date: Fri, 4 Oct 2024 15:30:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 1/3] x86/hvm: introduce config option for ACPI PM
 timer
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>
References: <cover.1728032664.git.Sergiy_Kibrik@epam.com>
 <3ef3724e21b196edd277c94598ebe6624813ede4.1728032664.git.Sergiy_Kibrik@epam.com>
 <Zv_pHR8gUrcHQU5I@macbook.local>
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
In-Reply-To: <Zv_pHR8gUrcHQU5I@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.10.2024 15:09, Roger Pau Monné wrote:
> On Fri, Oct 04, 2024 at 12:31:50PM +0300, Sergiy Kibrik wrote:
>> --- a/xen/arch/x86/include/asm/domain.h
>> +++ b/xen/arch/x86/include/asm/domain.h
>> @@ -496,7 +496,8 @@ struct arch_domain
>>  
>>  #define has_vlapic(d)      (!!((d)->arch.emulation_flags & X86_EMU_LAPIC))
>>  #define has_vhpet(d)       (!!((d)->arch.emulation_flags & X86_EMU_HPET))
>> -#define has_vpm(d)         (!!((d)->arch.emulation_flags & X86_EMU_PM))
>> +#define has_vpm(d)         (IS_ENABLED(CONFIG_X86_PMTIMER) && \
>> +                            !!((d)->arch.emulation_flags & X86_EMU_PM))
> 
> Do you really need the IS_ENABLED() here?  If you modify
> emulation_flags_ok() to reject the flag if not available it won't be
> possible for any domain to have it set.

With the IS_ENABLED() the only other approach to have the compiler DCE any
code left unreachable would be to #define X86_EMU_PM to 0 in that case. I
guess I'd slightly prefer that alternative, but otherwise the approach used
here would still be wanted imo.

Jan

