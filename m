Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F22ABAECD
	for <lists+xen-devel@lfdr.de>; Sun, 18 May 2025 10:30:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.988859.1373262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGZPd-00081K-P1; Sun, 18 May 2025 08:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 988859.1373262; Sun, 18 May 2025 08:30:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGZPd-0007zs-LF; Sun, 18 May 2025 08:30:25 +0000
Received: by outflank-mailman (input) for mailman id 988859;
 Sun, 18 May 2025 08:30:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GB/u=YC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uGZPb-0007zm-VN
 for xen-devel@lists.xenproject.org; Sun, 18 May 2025 08:30:23 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 567c57a9-33c2-11f0-9ffb-bf95429c2676;
 Sun, 18 May 2025 10:30:22 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a361b8a664so1952386f8f.3
 for <xen-devel@lists.xenproject.org>; Sun, 18 May 2025 01:30:21 -0700 (PDT)
Received: from [172.18.118.114] (ip-185-104-138-24.ptr.icomera.net.
 [185.104.138.24]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442fd59702asm95871195e9.39.2025.05.18.01.30.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 May 2025 01:30:20 -0700 (PDT)
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
X-Inumbo-ID: 567c57a9-33c2-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747557021; x=1748161821; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vh4rP+360fa3Iqy37r1ALzCeWzwynlR+9jflAyXt+Tw=;
        b=GJr7lQDxJJWRfIWvaY1SZmtbhi+eBWEppvmFax+iyUD0EYwCfOgF83MoPPQwtnql52
         K3xtuqL1N75k/01o+fgagFVgQOxrxbjVHZg2y2GMaM+v2rWAgM9h3vy2LwbKJlYdC2PB
         al7Gbjx1y4iQ7h6q2ZfQqzFMh3fZgCFip7Cb2PyZO5OxR3k8zUpx63DX1/f8zuzD1gYi
         D8zhi0WcY/phDs013N/bvca9VYACatWnuSG/kCE4rN1nWw8wJZ6yZYUQ98KJtuLWPohu
         Hqpdf9YE6xNWdLg5w506oPdfPYuzUKsgPREUYvZUEoySLj6eirVb+DGkwLr7S+wFXph4
         ljMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747557021; x=1748161821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vh4rP+360fa3Iqy37r1ALzCeWzwynlR+9jflAyXt+Tw=;
        b=rFDc3OkYKg27pkYujKKp1PDfR6J4uAIbvqx97Tp4UeTgvUZzo+b9iDuWkezLD8ViUK
         GCT7wpQGLkjZUddIfOXmdQ0RKViREe3ffKuDHmnXobVAMky+/Srp4XiU8omH2n2OmpRQ
         8fXpypyR7cvrqS50J9+VJVBzyv4QugBc2mOq2P8262UKdSTbtqH8phCTLWlviHdhQJu3
         MHisRj0c+jDZ6TAu0tKF20W6CkmdvSm7garfixf6FnBrAKX70brnsrPtOTDh+95/4mP5
         QAvtIAss7ukMCi5kb89oHK/Hb0b//a4gx5GHqh53mblamcPfJc7q9xYPXmxsjrAdhh84
         mXwQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3vjGcDoP6XzjIJLo7hKsGAgJdgOhDOQBZsijfVymgkZrgjefMBW3Uzqn96PuXga3S2EMKe99pNUc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YybM0C5e2YxX7Etbulp/3VLAj7SHa7dXMT9BE70pHm9sUbD8Mmx
	ekpgCIJqkXSmbBUEKnotZdl9JippUNskjOTtTWxQ+3TNyN1I70oOt95QCze4ZwHIkQ==
X-Gm-Gg: ASbGnctIq0WjbBxTUJ1zgHztKP2pcW2J5OciRRWODffVtVqN8CjpTnqac4K6kIz6Eb7
	gzem08XQ7nedeKkiF7aMTPXZZOhWt3U6f/WyqBGj751UFq+bAfORqq6NYleqMasze/JlpI/Vggr
	v10XV48TesVNYrywOnb3mEfEFzr3qSTVY5N/3hnGZU6th7dmvAVP8VteaCrZYvId6sfF/VV2wth
	e11nPidQXDW3WAnhqL5xkxKMCK8cg71ox1toxvnLMMk//kdok9zyq66o/KrczNM8fM5JTDUwtXd
	OhD5PNm/tc1x+lDZD0LFbY5QHDKtYx6L20YLE/7ytI0Q+kq4wGlLqM7Kl+U0UXCBjbBZKTkiYJt
	iApJFAp9qBppyXoQ5H1O/KKjj9/Gz1f24eik=
X-Google-Smtp-Source: AGHT+IHlcTN6AcT9ZeJRemXsHX5v5B3q0zlxC2LOR97S31OVh+WCBakJ8hYaW8qc0ucPnkS1zPayeQ==
X-Received: by 2002:a05:6000:2012:b0:3a0:7b07:157 with SMTP id ffacd0b85a97d-3a35c808b0fmr8098089f8f.9.1747557021093;
        Sun, 18 May 2025 01:30:21 -0700 (PDT)
Message-ID: <8fab4920-c03b-4eed-8bf0-474cdb094e4d@suse.com>
Date: Sun, 18 May 2025 10:30:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/16] xen/riscv: dt_processor_cpuid() implementation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
 <4e4b3a018e8dacbe85cc080d9209e2ba3cdf4330.1746530883.git.oleksii.kurochko@gmail.com>
 <df77a5c5-de45-4432-a86f-d120e9417d86@suse.com>
 <125e918d-7c0f-43dd-8ab9-c0e0bcbf640e@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <125e918d-7c0f-43dd-8ab9-c0e0bcbf640e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.05.2025 18:02, Oleksii Kurochko wrote:
> 
> On 5/15/25 9:56 AM, Jan Beulich wrote:
>> (adding Bertrand as the one further DT maintainer, for a respective question
>> below)
>>
>> On 06.05.2025 18:51, Oleksii Kurochko wrote:
>>> Implements dt_processor_hartid()
>> There's no such function (anymore).
>>
>>> to get the hart ID of the given
>>> device tree node and do some checks if CPU is available and given device
>>> tree node has proper riscv,isa property.
>>>
>>> As a helper function dt_get_cpuid() is introduced to deal specifically
>>> with reg propery of a CPU device node.
>>>
>>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>>> ---
>>> Changes in V2:
>>>   - s/of_get_cpu_hwid()/dt_get_cpu_id().
>>>   - Update prototype of dt_get_cpu_hwid(), use pointer-to-const for cpun arg.
>>>   - Add empty line before last return in dt_get_cpu_hwid().
>>>   - s/riscv_of_processor_hartid/dt_processor_cpuid().
>>>   - Use pointer-to_const for node argument of dt_processor_cpuid().
>>>   - Use for hart_id unsigned long type as according to the spec for RV128
>>>     mhartid register will be 128 bit long.
>>>   - Update commit message and subject.
>>>   - use 'CPU' instead of 'HART'.
>> Was this is good move? What is returned ...
>>
>>> --- a/xen/arch/riscv/include/asm/smp.h
>>> +++ b/xen/arch/riscv/include/asm/smp.h
>>> @@ -26,6 +26,9 @@ static inline void set_cpuid_to_hartid(unsigned long cpuid,
>>>   
>>>   void setup_tp(unsigned int cpuid);
>>>   
>>> +struct dt_device_node;
>>> +int dt_processor_cpuid(const struct dt_device_node *node, unsigned long *cpuid);
>> ... here isn't a number in Xen's CPU numbering space. From earlier discussions I'm
>> not sure it's a hart ID either, so it may need further clarification (and I'd
>> expect RISC-V to have suitable terminology to tell apart the different entities).
> 
>  From device tree point of view (https://www.kernel.org/doc/Documentation/devicetree/bindings/riscv/cpus.txt)
> it is just hart which is defined as a hardware execution context, which contains all the state mandated by
> the RISC-V ISA: a PC and some registers.
> And also based on this for DT binding:
>    For example, my Intel laptop is
>    described as having one socket with two cores, each of which has two hyper
>    threads.  Therefore this system has four harts.
> They are using just harts and in DT it will look like 4 node with a number in reg property which they
> call hart. So from DT point of view hartid is pretty fine to use.
> 
>  From specification point of view (https://riscv.github.io/riscv-isa-manual/snapshot/unprivileged/#_risc_v_hardware_platform_terminology):
>    A RISC-V hardware platform can contain one or more RISC-V-compatible processing cores together
>    with other non-RISC-V-compatible cores, fixed-function accelerators, various physical memory
>    structures, I/O devices, and an interconnect structure to allow the components to communicate.
> 
>    A component is termed a core if it contains an independent instruction fetch unit. A RISC-V-
>    compatible core might support multiple RISC-V-compatible hardware threads, or harts, through
>    multithreading.
> and (https://riscv.github.io/riscv-isa-manual/snapshot/unprivileged/#_risc_v_software_execution_environments_and_harts):
>    From the perspective of software running in a given execution environment, a hart is a resource that
>    autonomously fetches and executes RISC-V instructions within that execution environment. In this
>    respect, a hart behaves like a hardware thread resource even if time-multiplexed onto real hardware by
>    the execution environment. Some EEIs support the creation and destruction of additional harts, for
>    example, via environment calls to fork new harts.
> 
> DT's CPU node should be refer to core plus hardware thread (or threads in case of multithreading)
> in reg property to be close to the spec(?) but basically in DT they IMO just describe what in the sepc
> is called an independent instruction fetch unit.
> 
> I still think that it is fine just to use hart_id. If to be close more to a spec the unit_id(?)
> but it is more confusing IMO with what is use in RISC-V's DT binding.

Based on what you quoted above I think "hart ID" is indeed appropriate here.

>>> +/*
>>> + * Returns the cpuid of the given device tree node, or -ENODEV if the node
>>> + * isn't an enabled and valid RISC-V hart node.
>>> + */
>>> +int dt_processor_cpuid(const struct dt_device_node *node, unsigned long *cpuid)
>>> +{
>>> +    const char *isa;
>>> +
>>> +    if ( !dt_device_is_compatible(node, "riscv") )
>>> +    {
>>> +        printk("Found incompatible CPU\n");
>>> +        return -ENODEV;
>>> +    }
>>> +
>>> +    *cpuid = dt_get_cpuid(node);
>>> +    if ( *cpuid == ~0UL )
>>> +    {
>>> +        printk("Found CPU without CPU ID\n");
>>> +        return -ENODEV;
>>> +    }
>>> +
>>> +    if ( !dt_device_is_available(node))
>>> +    {
>>> +        printk("CPU with cpuid=%lu is not available\n", *cpuid);
>>> +        return -ENODEV;
>>> +    }
>>> +
>>> +    if ( dt_property_read_string(node, "riscv,isa", &isa) )
>>> +    {
>>> +        printk("CPU with cpuid=%lu has no \"riscv,isa\" property\n", *cpuid);
>>> +        return -ENODEV;
>>> +    }
>>> +
>>> +    if ( isa[0] != 'r' || isa[1] != 'v' )
>>> +    {
>>> +        printk("CPU with cpuid=%lu has an invalid ISA of \"%s\"\n", *cpuid, isa);
>>> +        return -ENODEV;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>> I view it as unhelpful that all errors result in -ENODEV. Yes, there are log
>> messages for all of the cases, but surely there are errno values better
>> representing the individual failure reasons?
> 
> I will update that to:
> 
> @@ -46,6 +46,7 @@ static unsigned long dt_get_cpuid(const struct dt_device_node *cpun)
>   int dt_processor_cpuid(const struct dt_device_node *node, unsigned long *cpuid)
>   {
>       const char *isa;
> +    int ret;
>   
>       if ( !dt_device_is_compatible(node, "riscv") )
>       {
> @@ -57,7 +58,7 @@ int dt_processor_cpuid(const struct dt_device_node *node, unsigned long *cpuid)
>       if ( *cpuid == ~0UL )
>       {
>           printk("Found CPU without CPU ID\n");
> -        return -ENODEV;
> +        return -EINVAL;

EINVAL is the most commonly used error code; I'd therefore recommend to
avoid its use unless it is indeed properly describing the situation
(invalid argument, i.e. invalid value _passed in_). Here ENODATA might
be a suitable replacement, for example.

Jan

>       }
>   
>       if ( !dt_device_is_available(node))
> @@ -66,16 +67,16 @@ int dt_processor_cpuid(const struct dt_device_node *node, unsigned long *cpuid)
>           return -ENODEV;
>       }
>   
> -    if ( dt_property_read_string(node, "riscv,isa", &isa) )
> +    if ( (ret = dt_property_read_string(node, "riscv,isa", &isa)) )
>       {
>           printk("CPU with cpuid=%lu has no \"riscv,isa\" property\n", *cpuid);
> -        return -ENODEV;
> +        return ret;
>       }
>   
>       if ( isa[0] != 'r' || isa[1] != 'v' )
>       {
>           printk("CPU with cpuid=%lu has an invalid ISA of \"%s\"\n", *cpuid, isa);
> -        return -ENODEV;
> +        return -EINVAL;
>       }
>   
>       return 0;
> 
> I think it's better now.
> 
> Thanks.
> 
> ~ Oleksii
> 


