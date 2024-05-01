Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E426E8B8ECA
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2024 19:08:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715371.1116931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2DQ4-0008DK-Pr; Wed, 01 May 2024 17:07:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715371.1116931; Wed, 01 May 2024 17:07:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2DQ4-0008BI-NA; Wed, 01 May 2024 17:07:00 +0000
Received: by outflank-mailman (input) for mailman id 715371;
 Wed, 01 May 2024 17:06:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PNhw=ME=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1s2DQ3-0008BC-Oc
 for xen-devel@lists.xenproject.org; Wed, 01 May 2024 17:06:59 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3834c156-07dd-11ef-909b-e314d9c70b13;
 Wed, 01 May 2024 19:06:58 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-57232e47a81so1633829a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 May 2024 10:06:58 -0700 (PDT)
Received: from [10.80.5.21] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 l12-20020a056402028c00b00572a0550acbsm1654878edv.55.2024.05.01.10.06.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 May 2024 10:06:57 -0700 (PDT)
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
X-Inumbo-ID: 3834c156-07dd-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1714583218; x=1715188018; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nNqOMSclx5ECvP0hOOQ73Nh6pW/CCOjh7lvZ0NrytSg=;
        b=RZLgo+ww2cNOywVaiUqdWRch6+f5zCo/xc+3nTiPuz0EFFZkBpm7Q/zT/QUvLXFJdl
         5pInjIGAr+EG2J9u7L7d8XpZCcls+dTQExzVE3lKfjG+9X2Vt7NRSIysBc/D8zQuy0P+
         ufQL2kwmMSDC+h8vjQi8qaNkk1/07eQ8+Xuas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714583218; x=1715188018;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nNqOMSclx5ECvP0hOOQ73Nh6pW/CCOjh7lvZ0NrytSg=;
        b=Ywirx4Zq1dyh2gtlDlbDw3g2SZRTkU8DwlZZtPu5mLqtNzvX2ZoTG7KYOT8N13wdK2
         ebndT8ijUVHJOx8UKErcW8CK5n1lsvUt0f2f6PCc+oFKSeQ+UHctUNx2EwTSF/iIwt6C
         d2YrzKIdjW8C7P4guNcfoieR2Jx+NzDMd9c77XZ+lKLnpTUGS9f1i16NYUOt5hKOwESt
         voIMBhILiniBsIluCFOtFdE1jNo/yWJVnx/3/uuLURAUYiZn5geIwEay1lu8r3MXEI82
         Oc2YxZfVSznJeyqT4QkYXtF29qWnr6dkuUM/OzX/9W6ZE54n9sxEKBAcpAWIZ5jxkVZY
         ERwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlvOCvBxnF+CquvwTJYxJ/rI8eleXS5M5clqAFwFkufMKZn0e7LbxbTLhdwzDcPNqVhKUIPNAJdqOuRLvpctumXXYpAsUOHh6vMXJfgKg=
X-Gm-Message-State: AOJu0Ywi9T6Vm9Elc9kjBMc4z6zNgMxokC67W5Xiyg96q2jXL1mAs1o/
	MRcGM1jdlRys4QoWMvgqa6REkk1tB1FtNg4rBfbPFZFA9cmUhlu1rFs+FSIJdBDMMytCv0znRHd
	7
X-Google-Smtp-Source: AGHT+IGFAHbJU6ILWShuMQKUwi7FfYahY3fNGQqnQWuCq6v8bmX5Vme45tP1I1BMn7xqiBC1T8pe+g==
X-Received: by 2002:a50:8ad6:0:b0:571:da40:22d9 with SMTP id k22-20020a508ad6000000b00571da4022d9mr200219edk.10.1714583217825;
        Wed, 01 May 2024 10:06:57 -0700 (PDT)
Message-ID: <e17b2cb1-1482-46e1-844f-22be23a7190a@cloud.com>
Date: Wed, 1 May 2024 18:06:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] xen/x86: Add topology generator
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240109153834.4192-1-alejandro.vallejo@cloud.com>
 <20240109153834.4192-7-alejandro.vallejo@cloud.com>
 <c3b4bacd-47c8-403c-ab5c-7a3adf39eeeb@suse.com>
Content-Language: en-GB
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <c3b4bacd-47c8-403c-ab5c-7a3adf39eeeb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/03/2024 17:02, Jan Beulich wrote:
> On 09.01.2024 16:38, Alejandro Vallejo wrote:
>> --- a/tools/include/xenguest.h
>> +++ b/tools/include/xenguest.h
>> @@ -843,5 +843,20 @@ enum xc_static_cpu_featuremask {
>>      XC_FEATUREMASK_HVM_HAP_DEF,
>>  };
>>  const uint32_t *xc_get_static_cpu_featuremask(enum xc_static_cpu_featuremask);
>> +
>> +/**
>> + * Synthesise topology information in `p` given high-level constraints
>> + *
>> + * Topology is given in various fields accross several leaves, some of
>> + * which are vendor-specific. This function uses the policy itself to
>> + * derive such leaves from threads/core and cores/package.
>> + *
>> + * @param p                   CPU policy of the domain.
>> + * @param threads_per_core    threads/core. Doesn't need to be a power of 2.
>> + * @param cores_per_package   cores/package. Doesn't need to be a power of 2.
>> + */
>> +void xc_topo_from_parts(struct cpu_policy *p,
>> +                        uint32_t threads_per_core, uint32_t cores_per_pkg);
> 
> Do we really want to constrain things to just two (or in fact any fixed number
> of) levels? Iirc on AMD there already can be up to 4.

For the time being, I think we should keep it simple(ish).

Leaf 0xb is always 2 levels, and it implicitly defines the offset into
the x2APIC ID for the 3rd level (the package, or the die). This approach
can be used for a long time before we need to expose anything else. It
can already be used for exposing multi-socket configurations, but it's
not properly wired to xl.

I suspect we won't have a need to expose more complicated topologies
until hetero systems are more common, and by that time the generator
will need tweaking anyway.

> 
>> @@ -1028,3 +976,89 @@ bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
>>  
>>      return false;
>>  }
>> +
>> +static uint32_t order(uint32_t n)
>> +{
>> +    return 32 - __builtin_clz(n);
>> +}
> 
> This isn't really portable. __builtin_clz() takes an unsigned int, which may
> in principle be wider than 32 bits. I also can't see a reason for the
> function to have a fixed-width return type. Perhaps

Sure to unsigned int. I'll s/CHAR_BIT/8/ as that's mandated by POSIX
already.

> 
> static unsigned int order(unsigned int n)
> {
>     return sizeof(n) * CHAR_BIT - __builtin_clz(n);
> }
> 
> ?
> 
>> +void xc_topo_from_parts(struct cpu_policy *p,
>> +                        uint32_t threads_per_core, uint32_t cores_per_pkg)
>> +{
>> +    uint32_t threads_per_pkg = threads_per_core * cores_per_pkg;
>> +    uint32_t apic_id_size;
>> +
>> +    if ( p->basic.max_leaf < 0xb )
>> +        p->basic.max_leaf = 0xb;
>> +
>> +    memset(p->topo.raw, 0, sizeof(p->topo.raw));
>> +
>> +    /* thread level */
>> +    p->topo.subleaf[0].nr_logical = threads_per_core;
>> +    p->topo.subleaf[0].id_shift = 0;
>> +    p->topo.subleaf[0].level = 0;
>> +    p->topo.subleaf[0].type = 1;
>> +    if ( threads_per_core > 1 )
>> +        p->topo.subleaf[0].id_shift = order(threads_per_core - 1);
>> +
>> +    /* core level */
>> +    p->topo.subleaf[1].nr_logical = cores_per_pkg;
>> +    if ( p->x86_vendor == X86_VENDOR_INTEL )
>> +        p->topo.subleaf[1].nr_logical = threads_per_pkg;
> 
> Same concern as in the other patch regarding "== Intel".
> 

Can you please articulate the concern?

>> +    p->topo.subleaf[1].id_shift = p->topo.subleaf[0].id_shift;
>> +    p->topo.subleaf[1].level = 1;
>> +    p->topo.subleaf[1].type = 2;
>> +    if ( cores_per_pkg > 1 )
>> +        p->topo.subleaf[1].id_shift += order(cores_per_pkg - 1);
> 
> Don't you want to return an error when any of the X_per_Y values is 0?

I'd rather not.

The checks on input parameters should be done wherever the inputs are
taken from. Currently the call site passes threads_per_core=1 and
cores_per_pkg=1+max_vcpus, so it's all guaranteed to work out.

Once it comes from xl, libxl should be in charge of the validations.
Furthermore there's validations the function simply cannot do (nor
should it) in its current form, like checking that...

    max_vcpus == threads_per_core * cores_per_pkg * n_pkgs.

> 
>> +    apic_id_size = p->topo.subleaf[1].id_shift;
>> +
>> +    /*
>> +     * Contrary to what the name might seem to imply. HTT is an enabler for
>> +     * SMP and there's no harm in setting it even with a single vCPU.
>> +     */
>> +    p->basic.htt = true;
>> +
>> +    p->basic.lppp = 0xff;
>> +    if ( threads_per_pkg < 0xff )
>> +        p->basic.lppp = threads_per_pkg;
>> +
>> +    switch ( p->x86_vendor )
>> +    {
>> +        case X86_VENDOR_INTEL:
>> +            struct cpuid_cache_leaf *sl = p->cache.subleaf;
>> +            for ( size_t i = 0; sl->type &&
>> +                                i < ARRAY_SIZE(p->cache.raw); i++, sl++ )
>> +            {
>> +                sl->cores_per_package = cores_per_pkg - 1;
>> +                sl->threads_per_cache = threads_per_core - 1;
> 
> IOW the names in struct cpuid_cache_leaf aren't quite correct.

Because of the - 1, you mean? If anything our name is marginally clearer
than the SDM description. It goes on to say "Add one to the return value
to get the result" in a [**] note, so it's not something we made up.

Xen: threads_per_cache => SDM: Maximum number of addressable IDs for
logical processors sharing this cache

Xen: cores_per_package => SDM: Maximum number of addressable IDs for
processor cores in the physical package

> 
>> +                if ( sl->type == 3 /* unified cache */ )
>> +                    sl->threads_per_cache = threads_per_pkg - 1;
>> +            }
>> +            break;
>> +
>> +        case X86_VENDOR_AMD:
>> +        case X86_VENDOR_HYGON:
>> +            /* Expose p->basic.lppp */
>> +            p->extd.cmp_legacy = true;
>> +
>> +            /* Clip NC to the maximum value it can hold */
>> +            p->extd.nc = 0xff;
>> +            if ( threads_per_pkg <= 0xff )
>> +                p->extd.nc = threads_per_pkg - 1;
>> +
>> +            /* TODO: Expose leaf e1E */
>> +            p->extd.topoext = false;
>> +
>> +            /*
>> +             * Clip APIC ID to 8, as that's what high core-count machines do
> 
> Nit: "... to 8 bits, ..."

ack

> 
>> +             *
>> +             * That what AMD EPYC 9654 does with >256 CPUs
>> +             */
>> +            p->extd.apic_id_size = 8;
>> +            if ( apic_id_size < 8 )
>> +                p->extd.apic_id_size = apic_id_size;
> 
> Use min(), with apic_id_size's type suitably adjusted?

ack

> 
>> --- a/xen/arch/x86/cpu-policy.c
>> +++ b/xen/arch/x86/cpu-policy.c
>> @@ -278,9 +278,6 @@ static void recalculate_misc(struct cpu_policy *p)
>>  
>>      p->basic.raw[0x8] = EMPTY_LEAF;
>>  
>> -    /* TODO: Rework topology logic. */
>> -    memset(p->topo.raw, 0, sizeof(p->topo.raw));
>> -
>>      p->basic.raw[0xc] = EMPTY_LEAF;
>>  
>>      p->extd.e1d &= ~CPUID_COMMON_1D_FEATURES;
>> @@ -387,6 +384,9 @@ static void __init calculate_host_policy(void)
>>      recalculate_xstate(p);
>>      recalculate_misc(p);
>>  
>> +    /* Wipe host topology. Toolstack is expected to synthesise a sensible one */
>> +    memset(p->topo.raw, 0, sizeof(p->topo.raw));
> 
> I don't think this should be zapped from the host policy. It wants zapping
> from the guest ones instead, imo. The host policy may (will) want using in
> Xen itself, and hence it should reflect reality.
> 
> Jan

Shouldn't Xen be checking its own cached state from the raw policy
instead? My understanding was that to a first approximation the host
policy is a template for guest creation. It already has a bunch of
overrides that don't match the real hardware configuration.

Cheers,
Alejandro


