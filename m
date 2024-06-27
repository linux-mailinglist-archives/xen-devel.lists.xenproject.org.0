Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FF791A9A2
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 16:47:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.750152.1158388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMqP5-0007Ek-En; Thu, 27 Jun 2024 14:47:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 750152.1158388; Thu, 27 Jun 2024 14:47:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMqP5-0007DD-C1; Thu, 27 Jun 2024 14:47:15 +0000
Received: by outflank-mailman (input) for mailman id 750152;
 Thu, 27 Jun 2024 14:47:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sMqP3-0007D7-50
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 14:47:13 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 226169a2-3494-11ef-b4bb-af5377834399;
 Thu, 27 Jun 2024 16:47:11 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-36743abace4so460720f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jun 2024 07:47:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1faac9aa593sm14069515ad.250.2024.06.27.07.47.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jun 2024 07:47:09 -0700 (PDT)
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
X-Inumbo-ID: 226169a2-3494-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719499630; x=1720104430; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ogChDBm2KQHAa6Elu0zQESiuNx1mGrCTNcCeJ40+IdI=;
        b=BffbzofZVV+COVLDUO2HkYHwpi5uvA8F0pi+PDEhsMtd2C7wDdpNjnZtFwRP4fZYei
         SKTrSd+yeyf8UclTVDS+ekU2GXs1D/koRGoRBqaFByY8T+YfcjydtkChIozzfGZ99A/M
         QlqL720CcPJ2ol3XTE81/zp7sseGkEA7x6jgtU1e7XuDM8cEgH3qEDG4gDkYT0uquZaq
         v7DL/gtTlq7BHDzbPjCzTedJTOzQnlCg8FVdehbfYzDtnTpDHADG2bE17PJmot/CozKI
         8gCu7U2+vxtFvjr6n77Wgt2Clmfn9AjIWmsvQosjg/3y7Qj5MonSpTV3QvqKkulkxUMe
         poaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719499630; x=1720104430;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ogChDBm2KQHAa6Elu0zQESiuNx1mGrCTNcCeJ40+IdI=;
        b=e0qK2Bmt2tnDn7tPczhm0GgVe5KhkvVdRqMfa0y7MlE7koGVve0A7zWbEjGKqKViDR
         EUXRhmFMsr/3nBwUALBtQ5NaJQkg05nrj0b3Cjifxk3rTcJ2RYDC761Q9+Dy9FYxBdV4
         4mwJGipLtyAwUJ3Sz74pSbe8qcdGNG5ykWO363r5JXNGwrdJT9dIYEobCnPytC3lZnbW
         z8YbGc/gesoxo350GkUtoPky/Cy7AOZguQf0D9EH4pT8xDpd7oxW+ub8SIRlUZh/py6Y
         UkuoSjG+A1EfbU5YTu0ZNRVNrlpRggursJ73UGZEfqSRq07cY43Q7lGIOJHLTluS5psa
         A1jQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZok+0MNUVW+KvdXMtACTH9BUNHI9AgA0TPcqRzk/MzDg9BNDmgZXzpLXmdYAuPPTWzKBRs9f2g9zV6dzxQniaj7nMZTXf59Tm19qlT1c=
X-Gm-Message-State: AOJu0YxgdO3+dKa23pfxDsbllrvdjzQ/EH/fJEuwTk1a40bMNiCM7whf
	yKbVMb6bQhNWpftGd+rZ+VV/0hOZLNw5+pFOwx+KIesXiJUNJce5adnWlbwndw==
X-Google-Smtp-Source: AGHT+IH0sIAEWiJIccZ8E2hiss/g1QsA9yS/YsGDxtfQb9gP3OFIDvyqiORaDbbl/f4JYUqmnoBZ7A==
X-Received: by 2002:a5d:50c5:0:b0:363:1c9d:d853 with SMTP id ffacd0b85a97d-36741930ba8mr1869438f8f.32.1719499630271;
        Thu, 27 Jun 2024 07:47:10 -0700 (PDT)
Message-ID: <a5275491-f28c-427c-bd15-34dd27ff8cb9@suse.com>
Date: Thu, 27 Jun 2024 16:47:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC for-4.20 v1 1/1] x86/hvm: Introduce Xen-wide ASID Allocator
To: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 george.dunlap@citrix.com, xen-devel@lists.xenproject.org
References: <cover.1716551380.git.vaishali.thakkar@vates.tech>
 <f15042aa7953d986b6dbd4dc1512024ba6362420.1716551380.git.vaishali.thakkar@vates.tech>
 <c18dbed6-07ac-4ce6-a5e4-4a72cbac3e12@suse.com>
 <2c843753-d27b-43cd-907e-851109890cc3@vates.tech>
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
In-Reply-To: <2c843753-d27b-43cd-907e-851109890cc3@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.06.2024 15:41, Vaishali Thakkar wrote:
> On 6/13/24 1:04 PM, Jan Beulich wrote:
>> On 24.05.2024 14:31, Vaishali Thakkar wrote:
>>> -void hvm_asid_flush_core(void)
>>> +void hvm_asid_flush_all(void)
>>>   {
>>> -    struct hvm_asid_data *data = &this_cpu(hvm_asid_data);
>>> +    struct hvm_asid_data *data = &asid_data;
>>>   
>>> -    if ( data->disabled )
>>> +    if ( data->disabled)
>>>           return;
>>>   
>>> -    if ( likely(++data->core_asid_generation != 0) )
>>> +    if ( likely(++data->asid_generation != 0) )
>>>           return;
>>>   
>>>       /*
>>> -     * ASID generations are 64 bit.  Overflow of generations never happens.
>>> -     * For safety, we simply disable ASIDs, so correctness is established; it
>>> -     * only runs a bit slower.
>>> -     */
>>> +    * ASID generations are 64 bit.  Overflow of generations never happens.
>>> +    * For safety, we simply disable ASIDs, so correctness is established; it
>>> +    * only runs a bit slower.
>>> +    */
>>
>> Please don't screw up indentation; this comment was well-formed before. What
>> I question is whether, with the ultimate purpose in mind, the comment actually
>> will continue to be correct. We can't simply disable ASIDs when we have SEV
>> VMs running, can we?
> 
> You're right about SEV VMs. But wouldn't we still want to have a way to 
> disable ASIDs when there are no SEV VMs are running?

Possibly. Yet that still would render this comment stale in the common case,
as the way it's written it suggests simply disabling ASIDs on the fly is an
okay thing to do.

>>> +        c = &cpu_data[cpu];
>>> +        /* Check for erratum #170, and leave ASIDs disabled if it's present. */
>>> +        if ( !cpu_has_amd_erratum(c, AMD_ERRATUM_170) )
>>> +            nasids += cpuid_ebx(0x8000000aU);
>>
>> Why += ? Don't you mean to establish the minimum across all CPUs? Which would
>> be assuming there might be an asymmetry, which generally we assume there
>> isn't.
>> And if you invoke CPUID, you'll need to do so on the very CPU, not many times
>> in a row on the BSP.
> 
> Hmm, I'm not sure if I understand your point completely. Just to clarify, 
> do you mean even if it's assumed that asymmetry is not there, we should 
> find and establish min ASID count across all online CPUs and ensure that 
> CPUID instruction is executed on the respective CPU?

No, I mean that
- if we assume there may be asymmetry, CPUID will need invoking once on
  every CPU (including ones later being hot-onlined),
- if we assume no asymmetry, there's no need for accumulation.

>>> --- a/xen/arch/x86/mm/hap/hap.c
>>> +++ b/xen/arch/x86/mm/hap/hap.c
>>> @@ -739,13 +739,13 @@ static bool cf_check flush_tlb(const unsigned long *vcpu_bitmap)
>>>           if ( !flush_vcpu(v, vcpu_bitmap) )
>>>               continue;
>>>   
>>> -        hvm_asid_flush_vcpu(v);
>>> -
>>>           cpu = read_atomic(&v->dirty_cpu);
>>>           if ( cpu != this_cpu && is_vcpu_dirty_cpu(cpu) && v->is_running )
>>>               __cpumask_set_cpu(cpu, mask);
>>>       }
>>>   
>>> +    hvm_asid_flush_domain(d);
>>
>> Hmm, that's potentially much more flushing than is needed here. There
>> surely wants to be a wait to flush at a granularity smaller than the
>> entire domain. (Likely applies elsewhere as well.)
> 
> I see, does it mean we still need a way to flush at the vcpu level in the
> case of HAP?

For correctness it's not really "need", but for performance I'm pretty sure
it's going to be "want".

Jan

