Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D52E960CA2
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 15:54:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784058.1193418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siwe3-0001rW-CH; Tue, 27 Aug 2024 13:54:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784058.1193418; Tue, 27 Aug 2024 13:54:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siwe3-0001pO-9X; Tue, 27 Aug 2024 13:54:03 +0000
Received: by outflank-mailman (input) for mailman id 784058;
 Tue, 27 Aug 2024 13:54:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tHc6=P2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1siwe1-0001pF-9i
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 13:54:01 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf3916da-647b-11ef-99a0-01e77a169b0f;
 Tue, 27 Aug 2024 15:53:59 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a86fa3dea99so1640166b.2
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 06:53:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c0bb471e32sm1020667a12.66.2024.08.27.06.53.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 06:53:58 -0700 (PDT)
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
X-Inumbo-ID: cf3916da-647b-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724766839; x=1725371639; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c1TVBydAj/sy7dIa9BDL2fBR6Qli5OMjIQG0E77B/ko=;
        b=daQnrGHBh3uMMo4HNKQVahhNqAI3nPeNdcj0UbuWP85xIXe2h6DKWvl5kbaB2+ycC4
         HUEL4c5p0c1JJq47YWLH3TrAqWj6BpeEWLqfMB3yFUniNzvvDI4Oc57nARkmDdniVzqT
         KyMx2coHhoV7p2psD3DKGN2vY0p/PMAJFFF9hh1zQcwRvzFF41g7+v9KklBqJSQjPLJD
         kEJa2buKGgxiZlOAx3/KcA7rQhlnrap7VVYDwfSn3HTKPVh0mGqbfIHL1edB9E27tQY5
         PcDBy2N4dC7A9B4EcytNnhc30CJiMvHBHIyPDWK1YumBX0I1tJUWgueeHJBkuCiBL41V
         B2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724766839; x=1725371639;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1TVBydAj/sy7dIa9BDL2fBR6Qli5OMjIQG0E77B/ko=;
        b=PZ3uBeN53rgRywjdX8wGHqs4sXh5fKJ+9hOjt7Y/weQNHQm/xSBLZpWG4zlVYNm6Mp
         2+o6IK2gHD0s+1hMspn9M/IylNMrG05x1sTc4uTZG/PJt8vMtXicqOGyPF0y76OiZtwZ
         TpZ6I8UhMf/KMewgIlNkUaFUcmYnS8ZM6n+gPQCZBxS7ZL0Lx2ym1SejdKdRTja70UsB
         ps2XTKUjvdLBWzOAlYn5UHHihDU65ZtIWUF9oCNQXGaHae4Sht/IxOWiTd8TWEbyix9D
         70uGP0TYYCeu5aPhKoSBxLVDBKYIZ9vDL2a+qVDDXm46+b53IppJXSzIfQrrQ9RvjC7R
         3hbg==
X-Gm-Message-State: AOJu0YyeJe6P+28V/ovTGKjwxOYwfa5/jWxEMiPeLpqgM8Klgy+B7jkh
	Or+u6A18gymh7NTtGLspv3NXG8Ux++MQk9TIR1POk2z0Sa/0wqvJvnlmqxEJgA==
X-Google-Smtp-Source: AGHT+IHH4CJLbYjel5WALUO98/Oy7Qm+OHNRQ9fEaAG4KQkZGCekfXl31iJ843JprZsDOBnHmjeEIQ==
X-Received: by 2002:a05:6402:5203:b0:5c0:ad36:284e with SMTP id 4fb4d7f45d1cf-5c0ad362ac8mr5693626a12.12.1724766838610;
        Tue, 27 Aug 2024 06:53:58 -0700 (PDT)
Message-ID: <ce7c0b2d-2245-40d4-93d7-0970d2f84033@suse.com>
Date: Tue, 27 Aug 2024 15:53:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] x86/dom0: disable SMAP for PV domain building only
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org
References: <20240827123949.24400-1-roger.pau@citrix.com>
 <734d41c3-709c-4286-8353-f5483b0987cb@citrix.com>
 <d939dffc-e8e3-40cf-8494-c03ae6978c90@suse.com>
 <4822571d-efe9-4cab-a016-70ee5f21c256@citrix.com>
 <Zs3Z7quUyCi4OuYb@macbook.local>
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
In-Reply-To: <Zs3Z7quUyCi4OuYb@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.08.2024 15:51, Roger Pau Monné wrote:
> On Tue, Aug 27, 2024 at 02:07:07PM +0100, Andrew Cooper wrote:
>> On 27/08/2024 2:04 pm, Jan Beulich wrote:
>>> On 27.08.2024 14:59, Andrew Cooper wrote:
>>>> On 27/08/2024 1:39 pm, Roger Pau Monne wrote:
>>>>> --- a/xen/arch/x86/dom0_build.c
>>>>> +++ b/xen/arch/x86/dom0_build.c
>>>>> @@ -612,7 +612,24 @@ int __init construct_dom0(struct domain *d, const module_t *image,
>>>>>      if ( is_hvm_domain(d) )
>>>>>          rc = dom0_construct_pvh(d, image, image_headroom, initrd, cmdline);
>>>>>      else if ( is_pv_domain(d) )
>>>>> +    {
>>>>> +        /*
>>>>> +         * Temporarily clear SMAP in CR4 to allow user-accesses in
>>>>> +         * construct_dom0().  This saves a large number of corner cases
>>>>> +         * interactions with copy_from_user().
>>>>> +         */
>>>>> +        if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
>>>>> +        {
>>>>> +            cr4_pv32_mask &= ~X86_CR4_SMAP;
>>>>> +            write_cr4(read_cr4() & ~X86_CR4_SMAP);
>>>>> +        }
>>>>>          rc = dom0_construct_pv(d, image, image_headroom, initrd, cmdline);
>>>>> +        if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
>>>>> +        {
>>>>> +            write_cr4(read_cr4() | X86_CR4_SMAP);
>>>>> +            cr4_pv32_mask |= X86_CR4_SMAP;
>>>>> +        }
>>>>> +    }
>>>> I hate to drag this on further still, but can this logic be move it into
>>>> dom0_construct_pv() itself, rather than here?
>>> Just to mention it: I'm fine with this in principle, as long as this won't
>>> mean a pile of new goto-s in dom0_construct_pv(). If a new wrapper was
>>> introduced (with the present function becoming static), I'd be okay.
>>
>> I'd be happy with that too.
>>
>> In fact, static helpers are probably best, seeing as we'll eventually
>> need real #ifdefary around the cr4_pv32_mask accesses.
> 
> Do you mean a static helper in dom0_build.c for enabling/disabling
> SMAP?

While that's how I understood Andrew's response, I'm not sure that'll buy
us very much. They'll both be used just once, and hence the amount of
#ifdef-ary is going to be the same as when the logic is kept in line.

Jan

