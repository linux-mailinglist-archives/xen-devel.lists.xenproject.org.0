Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C528849593
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 09:42:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675692.1051055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWuXx-0004or-63; Mon, 05 Feb 2024 08:41:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675692.1051055; Mon, 05 Feb 2024 08:41:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWuXx-0004mg-3K; Mon, 05 Feb 2024 08:41:45 +0000
Received: by outflank-mailman (input) for mailman id 675692;
 Mon, 05 Feb 2024 08:41:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8/S5=JO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rWuXv-0004ma-Kj
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 08:41:43 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6299c523-c402-11ee-8a45-1f161083a0e0;
 Mon, 05 Feb 2024 09:41:42 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3392b12dd21so2289051f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 00:41:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 t10-20020adff04a000000b003392206c808sm7519516wro.105.2024.02.05.00.41.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 00:41:41 -0800 (PST)
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
X-Inumbo-ID: 6299c523-c402-11ee-8a45-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707122501; x=1707727301; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dq7SqYO12ah/UBh39KyW+qD89O7v4w0Laqr7DaGhVzQ=;
        b=gllH8eVL+r6WEzkSCinKYJp+/fj//UE//ibBjjztPxHvVtkEGLmFxOuB9GROkFNt7r
         PaD6VDVsz+JyoUst2zggDyq+KzGwVxRg8oAnFyRu9R1w2H9aCs7QUlz5sl63lmOEUYqJ
         BKcCz7O0FD/LvpUc2cUqCdTOuXP3pjvJqKdZEILgnqfu0iRZLU3gBTB4tDnSTD/6bBsr
         KBct5W/U/1bpeB9CuOyFj0AhZp6+i/LeuVTFBeZn7L7aS7pxXUyq3F/1IyGynIRAFpBe
         ltLSfGizK5pDuwuc70Y+PqZl+GHzP+sOctBc5ffD9SHhXNveUmKN1OAxoSTqUX8JilAp
         ZFdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707122501; x=1707727301;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dq7SqYO12ah/UBh39KyW+qD89O7v4w0Laqr7DaGhVzQ=;
        b=rgNRj5r1f93Hv8XDt/Hpl/ZZrTKZ/KnfoeN/R9e9LJ5g3XxGvaSh7ROOgI351lMJ3l
         MWhC6JHvf5YWeRC3Aub527+ELoJgZyyKwvxq1r9Aoj3CkaItnJ3umYfYwk7Dq4ur6NZG
         lxeCJvlSiqB8UigWbhIF+l2sUbpNjTrKYyg67Heia4AuC4Q8GU9PIxoE75QCH+J7PGNy
         MdHKhYmxIv7tjx3Y/0BSswywlvPfKYVFbwDQyzPxOayNTEnFPYf7Ps3wa+0BGSb4WlPH
         Syb2m1mGSX4bvlkWNjffv3g471AhbM02TWs5Fr4QnLFh2rAG2fVEUo6uXonS0u5odkVo
         ArJw==
X-Gm-Message-State: AOJu0YzTCfnw5MWoUKuUOfC8EFRSCAGHU7M4CAEuLEaFOGLroWuO7cUP
	AgkeBQtQ3vK1N1fMQb3EXqZseNKVPyXHYlNkDSv+oqPlrKf6WIX2LKW0MgaG7Q==
X-Google-Smtp-Source: AGHT+IERYNhqRBhYe/sSFOCCi7QhUyZ+694xveNPxlXhILfy6WXEMtaymLGCNP+C9+uB9m9n1CjYCQ==
X-Received: by 2002:adf:f8ca:0:b0:337:c4c2:8141 with SMTP id f10-20020adff8ca000000b00337c4c28141mr5276900wrq.35.1707122501412;
        Mon, 05 Feb 2024 00:41:41 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVeBzwgnU5fN02zEeBY2VKI5+MTkO0LCEVuDTqWE1JuUvLJkBMjmWdIK9AxU48GP4AgogkvVu2EQ+MomxoBuc9Nxw1xXs02VEvZ/dgd7mR8U3fmk0kn5eTy0PtVWl7wmCnhczT2lXPbjJRPH5QB7Yrn295t7evfa8NW5nkOQRbKLpHScwzWD7No+vJyZ8wNN0TNrz3baTcGBREuyGKkit1pYbe0GHGv94MAJrBkvVwt/qO8GvQnJXSHhLR8jw==
Message-ID: <52e2db77-88c4-47c5-85d7-34b0bb133b69@suse.com>
Date: Mon, 5 Feb 2024 09:41:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 4/9] x86/smp: move stack_base to cpu_data
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Krystian Hebel <krystian.hebel@3mdeb.com>, xen-devel@lists.xenproject.org
References: <cover.1699982111.git.krystian.hebel@3mdeb.com>
 <70e3b7c84a69a7ec52b3ed6314395165c281734c.1699982111.git.krystian.hebel@3mdeb.com>
 <d0fc568a-f54e-4480-a903-6407f4e3a5b6@xen.org>
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
In-Reply-To: <d0fc568a-f54e-4480-a903-6407f4e3a5b6@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.02.2024 19:24, Julien Grall wrote:
> On 14/11/2023 17:50, Krystian Hebel wrote:
>> This location is easier to access from assembly. Having it close to
>> other data required during initialization has also positive (although
>> rather small) impact on prefetching data from RAM.
> 
> I understand your goal but...
> 
>> --- a/xen/arch/x86/include/asm/cpufeature.h
>> +++ b/xen/arch/x86/include/asm/cpufeature.h
> 
> ... cpufeature.h feels a rather odd place for storing the stack. I am 
> not entirely sure where else to place. Andrew, Jan, Roger?

Well, without having looked at the patch/series itself yet, I can only
say that if struct cpuinfo_x86 really is the place to put this
information, then it's unavoidable to have the field added in this
header. That said, it certainly feels like an abuse - there's nothing
in common with other (collected) data in this structure. "Easier to
access from assembly" may be a fair reason, but then I'd expect the
downsides of alternatives to be discussed explicitly. For example, a
simple new array might be as "easily" accessible from assembly.

>> @@ -37,6 +37,7 @@ struct cpuinfo_x86 {
>>       unsigned int phys_proc_id;         /* package ID of each logical CPU */
>>       unsigned int cpu_core_id;          /* core ID of each logical CPU */
>>       unsigned int compute_unit_id;      /* AMD compute unit ID of each logical CPU */
>> +    void *stack_base;
> 
> AFAICT, this means there will be a padding before stack_base and ...
> 
>>       unsigned short x86_clflush_size;
> 
> ... another one here. Is there any particular reason the new field 
> wasn't added at the end?

With ...

>>   } __cacheline_aligned;

... this I'm not exactly sure this is a problem right now (there may
be ample padding space anyway, yet I didn't go count). But I agree
with your comment in principle.

>> --- a/xen/arch/x86/smpboot.c
>> +++ b/xen/arch/x86/smpboot.c
>> @@ -75,13 +75,15 @@ static enum cpu_state {
>>   } cpu_state;
>>   #define set_cpu_state(state) do { smp_mb(); cpu_state = (state); } while (0)
>>   
>> -void *stack_base[NR_CPUS];
>> -
>>   void initialize_cpu_data(unsigned int cpu)
>>   {
>>       uint32_t apicid = cpu_physical_id(cpu);
>> +    void *stack = cpu_data[cpu].stack_base;
>> +
>>       cpu_data[cpu] = boot_cpu_data;
>> +
>>       cpu_physical_id(cpu) = apicid;
>> +    cpu_data[cpu].stack_base = stack;
>>   }
>>   
>>   static bool smp_store_cpu_info(unsigned int id)
>> @@ -579,8 +581,6 @@ static int do_boot_cpu(int apicid, int cpu)
>>           printk("Booting processor %d/%d eip %lx\n",
>>                  cpu, apicid, start_eip);
>>   
>> -    stack_start = stack_base[cpu] + STACK_SIZE - sizeof(struct cpu_info);
>> -
> 
> You remove this line because I can't quite figure out where stack_start 
> is now set. This is used...

This line sets a global variable, which ...

>> @@ -856,7 +856,7 @@ int setup_cpu_root_pgt(unsigned int cpu)
>>   
>>       /* Install direct map page table entries for stack, IDT, and TSS. */
>>       for ( off = rc = 0; !rc && off < STACK_SIZE; off += PAGE_SIZE )
>> -        rc = clone_mapping(__va(__pa(stack_base[cpu])) + off, rpt);
>> +        rc = clone_mapping(__va(__pa(cpu_data[cpu].stack_base)) + off, rpt);
>>   
>>       if ( !rc )
>>           rc = clone_mapping(idt_tables[cpu], rpt);
>> @@ -1007,10 +1007,10 @@ static void cpu_smpboot_free(unsigned int cpu, bool remove)
>>           FREE_XENHEAP_PAGE(per_cpu(gdt, cpu));
>>           FREE_XENHEAP_PAGE(idt_tables[cpu]);
>>   
>> -        if ( stack_base[cpu] )
>> +        if ( cpu_data[cpu].stack_base )
>>           {
>> -            memguard_unguard_stack(stack_base[cpu]);
>> -            FREE_XENHEAP_PAGES(stack_base[cpu], STACK_ORDER);
>> +            memguard_unguard_stack(cpu_data[cpu].stack_base);
>> +            FREE_XENHEAP_PAGES(cpu_data[cpu].stack_base, STACK_ORDER);
>>           }
>>       }
>>   }
>> @@ -1044,11 +1044,11 @@ static int cpu_smpboot_alloc(unsigned int cpu)
>>       if ( node != NUMA_NO_NODE )
>>           memflags = MEMF_node(node);
>>   
>> -    if ( stack_base[cpu] == NULL &&
>> -         (stack_base[cpu] = cpu_alloc_stack(cpu)) == NULL )
>> +    if ( cpu_data[cpu].stack_base == NULL &&
>> +         (cpu_data[cpu].stack_base = cpu_alloc_stack(cpu)) == NULL )
>>               goto out;
>>   
>> -    info = get_cpu_info_from_stack((unsigned long)stack_base[cpu]);
>> +    info = get_cpu_info_from_stack((unsigned long)cpu_data[cpu].stack_base);
> 
> ... here.

... pretty clearly is not used here (anymore). Instead I'd raise the
question of what the remaining purpose of that variable then is.
Looking through updates this patch alone makes to use sites of
stack_start, it's unclear whether the use from assembly code has gone
away already - brief checking suggests it hasn't.

Jan

