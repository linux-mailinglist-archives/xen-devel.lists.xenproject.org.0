Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 249A38B8DB7
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2024 18:06:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715346.1116902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2CSp-0007Th-SA; Wed, 01 May 2024 16:05:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715346.1116902; Wed, 01 May 2024 16:05:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2CSp-0007RU-Nz; Wed, 01 May 2024 16:05:47 +0000
Received: by outflank-mailman (input) for mailman id 715346;
 Wed, 01 May 2024 16:05:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PNhw=ME=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1s2CSo-0007RN-KQ
 for xen-devel@lists.xenproject.org; Wed, 01 May 2024 16:05:46 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa52170b-07d4-11ef-b4bb-af5377834399;
 Wed, 01 May 2024 18:05:44 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a58e787130fso158882366b.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 May 2024 09:05:44 -0700 (PDT)
Received: from [10.80.5.21] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 r20-20020a170906705400b00a555ef55ab5sm16453997ejj.218.2024.05.01.09.05.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 May 2024 09:05:43 -0700 (PDT)
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
X-Inumbo-ID: aa52170b-07d4-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1714579544; x=1715184344; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1z4icKP8G1xe0BAbmiBPb6FvSILe576zu9Ds2KIzx08=;
        b=D8mHWSsJNKSCWxisHYsHOGcfJxv2reDz67HbyTSHM1RqHijYuesUGNKoP2SF5CyYtR
         cvIsaBBHocE6YYm8BKI3iKrnlebxY8Zov7cKIxkO9uN45YSQnHltFtpQm0f6Hvw9WDkq
         XNGTDl7evXZxv1ezwN8F6tlMUl8TsIxhxhFng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714579544; x=1715184344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1z4icKP8G1xe0BAbmiBPb6FvSILe576zu9Ds2KIzx08=;
        b=myuxYV9t/DKs/IcAFNSZ65gn0eWKN4uetWuopnVCAY621A2mgzQA0oVM+OU630iYYG
         VMgzyRrvJm28I9dcBkspgAdbLknNLPCuFiiG42O5Ca2EAwdun8+Q2l+2asuZuB0rnbkf
         mc5SfX1N6iLH+o2Tmt4jqfpa9TezmIfB3w+G+Y5J6cPxEXFWeSt3Aq122PNQ1/Ivq/NO
         WKZUHM7crGtZ7g7yHk1rpTJY+l3PHiaHi7Yy7MRs1vkfGxB/jPnBaixvVMrZzQW/DuEp
         iago4PbzlBI8QWbM/7CmnSYX1J6L6R0E6hfW7CWqfW54J+mbT6TIIyd8q9g7Clts0Dth
         Gz1A==
X-Gm-Message-State: AOJu0YwTClb8zTGyWeBztsIG92Uh6wPj8FCCCJfDaBk5+RlejObv5RrE
	hL6WvZznA94Be7ZV8/6RLwjKHJ6JEWzu2VZ7zG46LMsUErkmo84Yba8iCrrXrNtQHaS190W2oHs
	I
X-Google-Smtp-Source: AGHT+IFWnklqpO3fZj1EcG0HvQHmDJCOgJsCjZKhqvzw/p0NzoBxCpsXVIjtEMNJbAPVyQBWUKKtFw==
X-Received: by 2002:a17:907:7788:b0:a59:2141:5b0d with SMTP id ky8-20020a170907778800b00a5921415b0dmr45596ejc.35.1714579543982;
        Wed, 01 May 2024 09:05:43 -0700 (PDT)
Message-ID: <4171847c-6475-48e8-9de2-9c21c8af45b9@cloud.com>
Date: Wed, 1 May 2024 17:05:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] xen/x86: Derive topologically correct x2APIC IDs from
 the policy
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20240109153834.4192-1-alejandro.vallejo@cloud.com>
 <20240109153834.4192-6-alejandro.vallejo@cloud.com>
 <Zfq3VVbEA4ljxllI@macbook>
Content-Language: en-GB
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <Zfq3VVbEA4ljxllI@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Ack and sure to everything on types, constness and variable names.

On 20/03/2024 10:15, Roger Pau Monné wrote:
>> +        const char *name;
>> +        uint32_t vcpu_id;
>> +        uint32_t x2apic_id;
>> +        struct cpu_policy policy;
>> +    } tests[] = {
>> +        {
>> +            .name = "3v: 3 t/c, 8 c/s", .vcpu_id = 3, .x2apic_id = 1 << 2,
>> +            .policy = {
>> +                .x86_vendor = X86_VENDOR_AMD,
>> +                .topo.subleaf = {
>> +                    [0] = { .nr_logical = 3, .level = 0, .type = 1, .id_shift = 2, },
>> +                    [1] = { .nr_logical = 8, .level = 1, .type = 2, .id_shift = 5, },
>> +                },
> 
> Don't we need a helper that gets passed the number of cores per
> socket and threads per core and fills this up?
> 
> I would introduce this first, add a test for it, and then do this
> testing using the helper.

Funnily enough that's how I tested it initially. Alas, it felt silly to
put it where it will be linked against the hypervisor. I'm happy to put
it back there.

>> diff --git a/xen/lib/x86/policy.c b/xen/lib/x86/policy.c
>> index a3b24e6879..2a50bc076a 100644
>> --- a/xen/lib/x86/policy.c
>> +++ b/xen/lib/x86/policy.c
>> @@ -2,15 +2,78 @@
>>  
>>  #include <xen/lib/x86/cpu-policy.h>
>>  
>> -uint32_t x86_x2apic_id_from_vcpu_id(const struct cpu_policy *p, uint32_t vcpu_id)
>> +static uint32_t parts_per_higher_scoped_level(const struct cpu_policy *p, size_t lvl)
>>  {
>>      /*
>> -     * TODO: Derive x2APIC ID from the topology information inside `p`
>> -     *       rather than from vCPU ID. This bodge is a temporary measure
>> -     *       until all infra is in place to retrieve or derive the initial
>> -     *       x2APIC ID from migrated domains.
>> +     * `nr_logical` reported by Intel is the number of THREADS contained in
>> +     * the next topological scope. For example, assuming a system with 2
>> +     * threads/core and 3 cores/module in a fully symmetric topology,
>> +     * `nr_logical` at the core level will report 6. Because it's reporting
>> +     * the number of threads in a module.
>> +     *
>> +     * On AMD/Hygon, nr_logical is already normalized by the higher scoped
>> +     * level (cores/complex, etc) so we can return it as-is.
>>       */
>> -    return vcpu_id * 2;
>> +    if ( p->x86_vendor != X86_VENDOR_INTEL || !lvl )
>> +        return p->topo.subleaf[lvl].nr_logical;
>> +
>> +    return p->topo.subleaf[lvl].nr_logical / p->topo.subleaf[lvl - 1].nr_logical;
> 
> I think this is an optimization because we only have 2 levels,
> otherwise you would need a loop like:
> 
> unsigned int nr = p->topo.subleaf[lvl].nr_logical
> for ( unsigned int i; i < lvl; i++ )
>     nr /= p->topo.subleaf[i].nr_logical;
> 
> If that's the case I think we need a
> BUILD_BUG_ON(ARRAY_SIZE(p->topo.subleaf) > 1);

It's not meant to be. That division should still hold for leaves 0x1f
and e26 where the level count typically exceeds 2. From the SDM.

```
Bits 15-00: The number of logical processors across all instances of
this domain within the next higherscoped domain. (For example, in a
processor socket/package comprising “M” dies of “N” cores each, where
each core has “L” logical processors, the “die” domain sub-leaf value of
this field would be M*N*L.) This number reflects configuration as
shipped by Intel. Note, software must not use this field to enumerate
processor topology*.
```

So. If level1 has nr_logical=X*Y and level2 has nr_logical=X*Y*Z then
dividing the latter by the former gives you Z, which is the number of
lvl1-parts for a single instance of lvl2 (i.e: cores/package, or whatever).

Unless I'm missing something?

Cheers,
Alejandro

