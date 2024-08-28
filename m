Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDB0962525
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 12:44:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784670.1194050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjGA3-0001Cf-Iz; Wed, 28 Aug 2024 10:44:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784670.1194050; Wed, 28 Aug 2024 10:44:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjGA3-0001BC-GD; Wed, 28 Aug 2024 10:44:23 +0000
Received: by outflank-mailman (input) for mailman id 784670;
 Wed, 28 Aug 2024 10:44:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NRYu=P3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sjGA2-0001B6-3V
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 10:44:22 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b14acbc-652a-11ef-99a0-01e77a169b0f;
 Wed, 28 Aug 2024 12:44:20 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a86e5e9ff05so230633266b.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 03:44:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e549b1d9sm227466466b.48.2024.08.28.03.44.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2024 03:44:19 -0700 (PDT)
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
X-Inumbo-ID: 7b14acbc-652a-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724841859; x=1725446659; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iYXGgoUsTnz1IAsequLBskqm1HZ9svYx1885zpAfyto=;
        b=Y8D8wL2XxVWWdpg6wsZ3b6gDnO/SreEU5Sn0+XS/LCv4heqMamzMtRceQqZIzSvkIu
         dL66cLuj8ML7DKW9oik0FrXRGBGkh1Dc+9OT7bylV1FLASrwnm6VadTmVZFlbXcJIQXA
         t74MX1pzNCDcHbX7Qj+tIcz+2WhTEAfo4fS2w4Zcwp0dH2XzOE12gxtCBd4HzQArT+hu
         gaP3OC9NFvXJ6tmELMaUqK/7sP/W6x6s3mPwELnoT2/u6WlwJwj7FFK3GtO2MUiBU6/V
         YPAmdzIqUKxiftG3rPpZEX60RD0BVjxjmW14+gZk5X0qRJ0ja0OBPI72ZxykJ9r0AEFT
         M3Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724841859; x=1725446659;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iYXGgoUsTnz1IAsequLBskqm1HZ9svYx1885zpAfyto=;
        b=YwYfVrZnjRmzuSPfGRDSoa+LZgiYyGwq8LJcjeyiLG0erEcC65aG8EqRc7gAKbYnAv
         NBOgE6mfz6pHutY4zgwIqHuu4baBI++Ila4WRzqnu/nk1/junjYRjI4HIgyKQUKnCNFA
         1BplUNldYufmZ1b9cVg4ZV8y62hkDKaa556gkiUsJ5IaJWLjiIyiILR4eQJK2s6528+p
         yuCQKTnTfgauESMb+Zq/n9U2q2BYGeQh+dvlZW8JSqGZt3zI+a7vc0382oRwzOB1IbQd
         QFtW9sc2TLKXCvUcVdCLpIzsGJ87dj11QMNHMC3tXuu/Qqdzgbh5iJpoIgKC+GJLZQDN
         8RcA==
X-Forwarded-Encrypted: i=1; AJvYcCV1X8rFtuQhdkf+2NqGAsPewI4cp6C78ljWGH/aic+q6b4ZpMzJlNLjXV/fSjFX3B5IzWJHdFvuGPI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz7n4ujfENK9k52+pv1IxdLExbWvUlb0SeZcNdV2WPqhattkbhR
	T+3+aEuUkGRKi0+HVNSinSJ8ROpNrCpTexFrK7+Ed837x9qWEolOc6VFVRUU1Q==
X-Google-Smtp-Source: AGHT+IEPUDQyDdPexLqb48iBgp0fQbv5sq4+9dn1Wip0B/bhG65Wy2d3uTqvwO57jSSh+rWDizLd8g==
X-Received: by 2002:a17:907:7e93:b0:a80:f81c:fd75 with SMTP id a640c23a62f3a-a870a5d443amr132760866b.0.1724841859405;
        Wed, 28 Aug 2024 03:44:19 -0700 (PDT)
Message-ID: <3705f296-3b79-4bad-9bbc-0b86aaa41314@suse.com>
Date: Wed, 28 Aug 2024 12:44:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/7] xen/riscv: set up fixmap mappings
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1724256026.git.oleksii.kurochko@gmail.com>
 <57e892d5b2c526dd44b68d4976796a25c0feca20.1724256027.git.oleksii.kurochko@gmail.com>
 <4b9cfa7e-546a-4dbb-a3de-4267849be13a@suse.com>
 <9210aa20ebe892b9866309a7531398d446d0eef5.camel@gmail.com>
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
In-Reply-To: <9210aa20ebe892b9866309a7531398d446d0eef5.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.08.2024 11:53, oleksii.kurochko@gmail.com wrote:
> On Tue, 2024-08-27 at 12:29 +0200, Jan Beulich wrote:
>>>
>>> +
>>> +/*
>>> + * Direct access to xen_fixmap[] should only happen when {set,
>>> + * clear}_fixmap() is unusable (e.g. where we would end up to
>>> + * recursively call the helpers).
>>> + */
>>> +extern pte_t xen_fixmap[];
>>
>> I'm afraid I keep being irritated by the comment: What recursive use
>> of
>> helpers is being talked about here? I can't see anything recursive in
>> this
>> patch. If this starts happening with a subsequent patch, then you
>> have
>> two options: Move the declaration + comment there, or clarify in the
>> description (in enough detail) what this is about.
> This comment is added because of:
> ```
> void *__init pmap_map(mfn_t mfn)
>   ...
>        /*
>         * We cannot use set_fixmap() here. We use PMAP when the domain map
>         * page infrastructure is not yet initialized, so
>    map_pages_to_xen() called
>         * by set_fixmap() needs to map pages on demand, which then calls
>    pmap()
>         * again, resulting in a loop. Modify the PTEs directly instead.
>    The same
>         * is true for pmap_unmap().
>         */
>        arch_pmap_map(slot, mfn);
>    ...
> ```
> And it happens because set_fixmap() could be defined using generic PT
> helpers

As you say - could be. If I'm not mistaken no set_fixmap() implementation
exists even by the end of the series. Fundamentally I'd expect set_fixmap()
to (possibly) use xen_fixmap[] directly. That in turn ...

> so what will lead to recursive behaviour when when there is no
> direct map:

... would mean no recursion afaict. Hence why clarification is needed as
to what's going on here _and_ what's planned.

Jan

>    static pte_t *map_table(mfn_t mfn)
>    {
>        /*
>         * During early boot, map_domain_page() may be unusable. Use the
>         * PMAP to map temporarily a page-table.
>         */
>        if ( system_state == SYS_STATE_early_boot )
>            return pmap_map(mfn);
>        ...
>    }


