Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEDD940D38
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 11:18:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767394.1177993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYiyg-0005fe-AA; Tue, 30 Jul 2024 09:17:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767394.1177993; Tue, 30 Jul 2024 09:17:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYiyg-0005cj-5V; Tue, 30 Jul 2024 09:17:06 +0000
Received: by outflank-mailman (input) for mailman id 767394;
 Tue, 30 Jul 2024 09:17:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hr/k=O6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sYiye-0005cd-WF
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 09:17:05 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7be2efca-4e54-11ef-bc01-fd08da9f4363;
 Tue, 30 Jul 2024 11:17:03 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a7a843bef98so455958366b.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2024 02:17:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad91005sm620135866b.173.2024.07.30.02.17.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 02:17:02 -0700 (PDT)
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
X-Inumbo-ID: 7be2efca-4e54-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722331023; x=1722935823; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yHmWRPVefvQZOxK9cNEe0eeQo8mZO5QUbojAkpjJSEo=;
        b=AYBltkps/tRNk8nBZgaRsQ27GaFPHrDpfNYG6/rN+JlR9MnfEsYKDHxDrpvY3//6vG
         squ8ENuUqxOSYvVOONyJgiXGhNzrrQaxm7iap5X+D9gMwYkvqLrBYLvIiUqgvHq2GtKk
         E/1nbSofLgLRWXZGzWVEDbIunTYy9T62HMXL49pfxK/jUiPyfr2XQ6g1BhVnwNZz7GaG
         uV+ZetbYj+DMdXsaRxVpX2Gb6TNVNXkl9BUozpeaQokVt/GJQmaiGrdiQJK8F71XgQGm
         WpmYEwesv8So6h6GQCHLFqIo0l2WM09s8tEfYQFMfFXV4WUL1VpxbeQ4vlgr/RIDTPsI
         d7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722331023; x=1722935823;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHmWRPVefvQZOxK9cNEe0eeQo8mZO5QUbojAkpjJSEo=;
        b=adPLX42WSTcj1vMrrkLXvGC2ICfQYeoR/Q7rSfeGYl6qo1Fa6XcUwvLE9duyGFUgZc
         Sur7mN+8y9uFVekenCX7FVIhnXeaiCqtIxXl8R5Rp8i8WuS+xrcd7ivZcoOa4JyuNgd0
         joWDMRPLlYnZBWXrkZ7QdS3wFfhSGR7sQ7DqBPUAxSwxwYE6+1k3eK9BkqgiFdqk2EMY
         LmwL8Lrh+jz6QcICZ7pLDQiQ3AvJ/AegXhhYXgghsAI7aDh4S2AKOoS9BjsLxDKO1FNe
         LMXMFo31cZ1JObGHqxHTLcdKE8nfcGz7NFqME58cibeB24cnjnpVZZKM5LuVQYpfDbyo
         tbBg==
X-Forwarded-Encrypted: i=1; AJvYcCXHoAypRuYnj9S9ID9h9Jas5INl6mVXrtOG1g5vqyCWPna4nY+TO3ZxuJrkO+QqCY7ShDjSnLxoc7Nzuk/0Dl1MsRVK/8veekBmSbFK3Kw=
X-Gm-Message-State: AOJu0YwOCq5IKGlAnh5ivJQtn68e9GnsAnmGSKBJ83maLQ+36f9mofUH
	yTxJTHmt1trK81eXyZmuDbd7aLrx96vkIA484+tcrTCn3Bw9e3kXVKBi05ZJ6g==
X-Google-Smtp-Source: AGHT+IEpg7z6U1tPbfK0/HwebaaWHU9o6Yv9741Q0D3EG6AizGqpcc5GgHh+ejJgfPTrldLAOC1BVQ==
X-Received: by 2002:a17:907:971f:b0:a7a:83f8:cfd2 with SMTP id a640c23a62f3a-a7d40043eaemr786615666b.17.1722331023034;
        Tue, 30 Jul 2024 02:17:03 -0700 (PDT)
Message-ID: <97554cbe-7009-4bc9-8205-7a9e0f29aad0@suse.com>
Date: Tue, 30 Jul 2024 11:17:01 +0200
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
In-Reply-To: <b7433d25bb3ca7a0f4e54f561b450b5724fb46dc.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.07.2024 10:44, oleksii.kurochko@gmail.com wrote:
> On Mon, 2024-07-29 at 17:52 +0200, Jan Beulich wrote:
>> On 24.07.2024 17:31, Oleksii Kurochko wrote:
>>
>>
>>> +/*
>>> + * Send SFENCE_VMA to a set of target HARTs.
>>> + *
>>> + * @param hart_mask mask representing set of target HARTs
>>> + * @param start virtual address start
>>> + * @param size virtual address size
>>
>> Are these really virtual addresses, not somehow a bias and a number
>> of bits (CPUs) or elements? From the rest of the patch I can't deduce
>> what these two parameters express.
> According to SBI doc start is an virtual address:
> https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/src/ext-rfence.adoc?plain=1#L44

Oh, so these are describing the VA range to be flushed. Okay.

> and hart_mask is:
> • unsigned long hart_mask is a scalar bit-vector containing hartids

Biased by hart_mask_base in the actual SBI call.

>>> + */
>>> +void sbi_remote_sfence_vma(const unsigned long *hart_mask,
>>
>> Maybe better hart_mask[]? It's not clear to me though what the upper
>> bound of the array is.
> Theoretically it is ULONGMAX but we don't looking more then
> CONFIG_NR_CPUS.

See my comment elsewhere about possibly sparse numbering of hart IDs.

>>> +
>>> +static void sbi_cpumask_to_hartmask(const struct cpumask *cmask,
>>> +                 struct cpumask *hmask)
>>
>> I doubt it is valud to re-use struct cpumask for hart maps.
> Why not? Would it be better to use unsigned long *hmask?

It's not only better, but imo a requirement. Unless there's a guarantee
by the spec that hart IDs for any subset of harts are sequential and
starting from 0, you just can't assume they fall in the [0,NR_CPUS) or
really [0,nr_cpu_ids) range. Yet without that you simply can't (ab)use
struct cpumask (and btw it wants to be cpumask_t everywhere).

You may want to take a look at struct physid_mask that we have on x86
for the equivalent purpose.

>>> +{
>>> +    u32 cpu;
>>
>> uint32_t or yet better unsigned int please.
>>
>>> +    unsigned long hart = INVALID_HARTID;
>>> +
>>> +    if (!cmask || !hmask)
>>> +        return;
>>> +
>>> +    cpumask_clear(hmask);
>>> +    for_each_cpu(cpu, cmask)
>>> +    {
>>> +        if ( CONFIG_NR_CPUS <= cpu )
>>> +        {
>>> +            printk(XENLOG_ERR "SBI: invalid hart=%lu for
>>> cpu=%d\n",
>>
>> %u for the CPU please.
>>
>>> +                     hart, cpu);
>>
>> "hart" wasn't set yet and hence is invalid or at least misleading to
>> log.
> That why it will print INVALID_HARTID which user will identify as
> invalid hartid.
> Do you mean that there is no any sense to message "invalid hart=%lu" as
> it is obviously invalid?

Yes. Plus the problem in this case isn't that there's no hart ID, but
that the CPU ID is out of range. That's what the message wants to say.
If such a check and message are necessary in the first place. I don't
think we have anything like that on x86. And for_each_cpu() also can't
possibly produce any ID at or beyond nr_cpu_ids, where nr_cpu_ids <=
NR_CPUS.

>>> +            continue;
>>
>>
>> Can you really sensibly continue in such a case?
> I think yes, the worst thing we will have is that the "bad" CPU won't
> be used.
> But it might be better to switch to BUG_ON() as if we are inised the
> "if CONFIG_NR_CPUS <= cpu" then it could tell us that something went
> wrong.

Again - your problem here isn't the range of "cpu". What you instead
want to check is ...

>>> +        }
>>> +
>>> +        hart = cpuid_to_hartid_map(pcpu_info[cpu].processor_id);

the hart ID that you get back. If that's INVALID_HARTID, you're in
fact in trouble.

>> What does "_map" in the function/macro name signify?
> It is interconnections/correllation between Xen's CPU id and Hart's id.

Well. What the function does internally is consult the map. Yet that's
not relevant to any caller? They only care about the translation from
one ID space to the other? No matter whether a map, radix tree, rbtree,
or what not is used behind the scenes?

Jan

