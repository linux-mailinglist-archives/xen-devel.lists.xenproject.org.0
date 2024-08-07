Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC63C94A70E
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2024 13:37:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773447.1183884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbeyx-0000GM-Vl; Wed, 07 Aug 2024 11:37:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773447.1183884; Wed, 07 Aug 2024 11:37:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbeyx-0000DK-SV; Wed, 07 Aug 2024 11:37:31 +0000
Received: by outflank-mailman (input) for mailman id 773447;
 Wed, 07 Aug 2024 11:37:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sbeyw-0000DE-3x
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2024 11:37:30 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d3d9b1a-54b1-11ef-bc04-fd08da9f4363;
 Wed, 07 Aug 2024 13:37:29 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a7a8553db90so187562766b.2
 for <xen-devel@lists.xenproject.org>; Wed, 07 Aug 2024 04:37:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9d45447sm633017766b.100.2024.08.07.04.37.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Aug 2024 04:37:28 -0700 (PDT)
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
X-Inumbo-ID: 6d3d9b1a-54b1-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723030648; x=1723635448; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BPmDtebTkY8GF7r3U38egw0uGT3CRuirbDX68D+VpEs=;
        b=Z8ejTEEwakAg3Q3UbL0J7bsaW/QvYlDYFwqvOkIginVMg4aPrQ3CSDZqwyS9KmC4FF
         RCNFZDPrOmB87OYI6XmMk4FRzDVBjZ0Yp7J4dHLBDndXQ+UdjIbx7T1fj6fqZcLD7WQC
         0Owx/D0TmXRjGtsxwKQJM95U879r+eq4VLh6hQywVTHuNgVaMG0HzbYZQHflvVwu+rY2
         kc86pGhZcbwGNI6iRu2eUb3yl3M6mTFf8c4yHm71MoIXvEyvk6UAC78DqM7dZB5LhKe3
         xdeCPU3SAwuq5zGmK7GEZH1nvVP4/PAzo1h3sbSGOWusBvoIycAiuigveli19AMuPykA
         R/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723030648; x=1723635448;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPmDtebTkY8GF7r3U38egw0uGT3CRuirbDX68D+VpEs=;
        b=reXfROxLWGgup3124IdmeieRy8e4tBuEJ50QTVihlcRnvm+nqkkaBCbtmgQbgssXIv
         MDAk7Poi9KPs5LM18ZdPTVpsi/FkGKLa4M1SaJn+4QZcJR+w+VsOhLLklR7zjNBN8IPw
         Bb2oX9iJwjBFfZ3ujRez8HJbuXUWmcpdpj7e9+J/uRVB3RQshpjfwtN3cVO/3K0iLujL
         T9L/UVuCAV1VNNK8+uyb5gSjOfkgD2B28mYiaCFSO3Kk9jtBqP3il4kLJsEMotOMc16b
         8ZiVjRJ1VjGlS4QGH5gf2IKhjfGRNzIeVr7bh8gLln8q4suv0UJSxehmojvZZYzpvsWt
         OKYA==
X-Forwarded-Encrypted: i=1; AJvYcCXUZNEI72vMZBoWDJorhgEY4TU6wehEyyqNFuQSJcvoVI3A7d4eKTVz0DoQRKKeziZmvoUk22XHoVBJL5fJQKI9qd7Sf7Mw9fnmtYS5Ctw=
X-Gm-Message-State: AOJu0YwAvzW+FCIrEaIXk0X9rlZQZR+P2a/tHEqBtnRSVpI+gHRZ4kav
	wt7DE1S+LXJYcjamrNr2RlodlI5af+FIOd+mD4+hSCbjJloJS0xP8B5CxXqy1g==
X-Google-Smtp-Source: AGHT+IGFAez5XeXpy23b5XINS82uokeaVqDPzuD1VXch/0Tg4K2nviJmCSrPiIk/1FzD4aT+ETkE+g==
X-Received: by 2002:a17:907:d92:b0:a77:c583:4f78 with SMTP id a640c23a62f3a-a7dc4fee5f7mr1665439166b.39.1723030648401;
        Wed, 07 Aug 2024 04:37:28 -0700 (PDT)
Message-ID: <8c882970-c640-4fde-b939-c3838c3a474e@suse.com>
Date: Wed, 7 Aug 2024 13:37:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/9] xen/riscv: introduce and init SBI RFENCE extension
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
 <fb2d24731f870378d79077be39b1bc19cc655327.1721834549.git.oleksii.kurochko@gmail.com>
 <49d3a181-0830-4f55-83a4-c6c9fd54eb17@suse.com>
 <b7433d25bb3ca7a0f4e54f561b450b5724fb46dc.camel@gmail.com>
 <97554cbe-7009-4bc9-8205-7a9e0f29aad0@suse.com>
 <62165b298cd214d6aab5b5edcc68c2edc97b88d9.camel@gmail.com>
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
In-Reply-To: <62165b298cd214d6aab5b5edcc68c2edc97b88d9.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.08.2024 13:29, oleksii.kurochko@gmail.com wrote:
> On Tue, 2024-07-30 at 11:17 +0200, Jan Beulich wrote:
>>>>> +
>>>>> +static void sbi_cpumask_to_hartmask(const struct cpumask
>>>>> *cmask,
>>>>> +                 struct cpumask *hmask)
>>>>
>>>> I doubt it is valud to re-use struct cpumask for hart maps.
>>> Why not? Would it be better to use unsigned long *hmask?
>>
>> It's not only better, but imo a requirement. Unless there's a
>> guarantee
>> by the spec that hart IDs for any subset of harts are sequential and
>> starting from 0, you just can't assume they fall in the [0,NR_CPUS)
>> or
>> really [0,nr_cpu_ids) range. Yet without that you simply can't
>> (ab)use
>> struct cpumask (and btw it wants to be cpumask_t everywhere).
>>
>> You may want to take a look at struct physid_mask that we have on x86
>> for the equivalent purpose.
> Could you please explain me why factor 4 is used in defintion of
> MAX_APICS and why 256 ( is it a maximum number of APIC IDs can be
> supported in the system? ):
>   #define MAX_APICS     MAX(256, 4 * NR_CPUS)

Both numbers are pretty arbitrary, I suppose. APIC IDs need not be
contiguous, which is what the multiplication by 4 is trying to cover
for. Plus on old (non-x2APIC) systems APIC IDs are only 8 bits wide,
and allowing for all possible values in that case is cheap enough -
hence the 256.

Jan

