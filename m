Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D61D18CE91D
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 19:16:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729670.1134874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAYWU-00071f-0M; Fri, 24 May 2024 17:16:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729670.1134874; Fri, 24 May 2024 17:16:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAYWT-0006zD-TH; Fri, 24 May 2024 17:16:05 +0000
Received: by outflank-mailman (input) for mailman id 729670;
 Fri, 24 May 2024 17:16:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=di0w=M3=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sAYWS-0006z4-6t
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 17:16:04 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c194d21-19f1-11ef-90a1-e314d9c70b13;
 Fri, 24 May 2024 19:16:02 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-35507dfe221so705819f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 10:16:02 -0700 (PDT)
Received: from [192.168.0.16] (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3557a1c9546sm2018171f8f.82.2024.05.24.10.16.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 May 2024 10:16:01 -0700 (PDT)
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
X-Inumbo-ID: 4c194d21-19f1-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1716570962; x=1717175762; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=brtySv79pi2/FIgEkDor3mhBZT1VVY0tx1m7DGmBBms=;
        b=jkLW+oMAQ/2UF4ZmxvfMeb5jRpXamoZnhqUIME7wsvzP03kxZdaN5LAleX/28Y/im3
         +oU0e7dsM1T7oiSMSGPopdVjQFsb0P6yNvPtLcxryXJi/jhdSuSW7K9jgcyi6QZVfubf
         ifUlPIhp34Padwg+CRxnPVeLaxYYyhFX8qU/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716570962; x=1717175762;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=brtySv79pi2/FIgEkDor3mhBZT1VVY0tx1m7DGmBBms=;
        b=PzRd+DwQdt70eSs4Tp/nAbrFU/rGK458RPGp4HrrkT9tTknBV7oQAxsYnVC7eBPr/X
         Er7QvjbD3KwnHh9zT2y+h264HLpFj+6jNxIcQwF1IXGoM5TJO883F7st5itWdB48imh0
         7LAQ0rBVVxzoPsYU9cHb0I8i8I8cgHX7UxouBQ2NtT9Zt7lP2aOcc5WKNgyKCJXLG7H9
         plqXaGMEORnqMOja/Ak9KQOigic5DZIuIFAe88PWaVkrB5TbXvPEgPJSRALU82s8xWBV
         KF6X24/ms4WJwv/R2N6QukbmdN3H5dOON2yP7BZeKlJ8nl4Nmbvc3q0v08ODbGxZPd10
         SDRg==
X-Gm-Message-State: AOJu0YwmFYL3gRWowAQJR9UMQbxTgbQtaBSNYA8LYQ8uyQymcTngXy9l
	ryXQj+EGm6tlrxQB2cC5SGKMkTeu//Hytz8t6KA0dJ0oQEio6drsQ3a8VMiGvgw=
X-Google-Smtp-Source: AGHT+IHW0IoZ1nORonOTuJonlGtmcvQfv0/kRvnBxKiSO/oRrLTkoFuUVGgYbXuvKEKvBiYPjnWfsA==
X-Received: by 2002:adf:e809:0:b0:34d:9161:2253 with SMTP id ffacd0b85a97d-355245dec55mr2687495f8f.12.1716570962107;
        Fri, 24 May 2024 10:16:02 -0700 (PDT)
Message-ID: <6e1c52a3-98d2-42e9-96b7-91010806cdf5@cloud.com>
Date: Fri, 24 May 2024 18:16:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] xen/x86: Synthesise domain topologies
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1715102098.git.alejandro.vallejo@cloud.com>
 <f51b54328a09c510c9320f1317c2da371ef16eb5.1715102098.git.alejandro.vallejo@cloud.com>
 <ZlBWtXkpkqzh1EWC@macbook>
Content-Language: en-GB
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <ZlBWtXkpkqzh1EWC@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/05/2024 09:58, Roger Pau Monné wrote:
> On Wed, May 08, 2024 at 01:39:27PM +0100, Alejandro Vallejo wrote:
>> Expose sensible topologies in leaf 0xb. At the moment it synthesises non-HT
>> systems, in line with the previous code intent.
>>
>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>> ---
>> v2:
>>   * Zap the topology leaves of (pv/hvm)_(def/max)_policy rather than the host policy
>> ---
>>  tools/libs/guest/xg_cpuid_x86.c | 62 +++++----------------------------
>>  xen/arch/x86/cpu-policy.c       |  9 +++--
>>  2 files changed, 15 insertions(+), 56 deletions(-)
>>
>> diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
>> index 4453178100ad..8170769dbe43 100644
>> --- a/tools/libs/guest/xg_cpuid_x86.c
>> +++ b/tools/libs/guest/xg_cpuid_x86.c
>> @@ -584,7 +584,7 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
>>      bool hvm;
>>      xc_domaininfo_t di;
>>      struct xc_cpu_policy *p = xc_cpu_policy_init();
>> -    unsigned int i, nr_leaves = ARRAY_SIZE(p->leaves), nr_msrs = 0;
>> +    unsigned int nr_leaves = ARRAY_SIZE(p->leaves), nr_msrs = 0;
>>      uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
>>      uint32_t host_featureset[FEATURESET_NR_ENTRIES] = {};
>>      uint32_t len = ARRAY_SIZE(host_featureset);
>> @@ -727,59 +727,15 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
>>      }
>>      else
>>      {
>> -        /*
>> -         * Topology for HVM guests is entirely controlled by Xen.  For now, we
>> -         * hardcode APIC_ID = vcpu_id * 2 to give the illusion of no SMT.
>> -         */
>> -        p->policy.basic.htt = true;
>> -        p->policy.extd.cmp_legacy = false;
>> -
>> -        /*
>> -         * Leaf 1 EBX[23:16] is Maximum Logical Processors Per Package.
>> -         * Update to reflect vLAPIC_ID = vCPU_ID * 2, but make sure to avoid
>> -         * overflow.
>> -         */
>> -        if ( !p->policy.basic.lppp )
>> -            p->policy.basic.lppp = 2;
>> -        else if ( !(p->policy.basic.lppp & 0x80) )
>> -            p->policy.basic.lppp *= 2;
>> -
>> -        switch ( p->policy.x86_vendor )
>> +        /* TODO: Expose the ability to choose a custom topology for HVM/PVH */
>> +        unsigned int threads_per_core = 1;
>> +        unsigned int cores_per_pkg = di.max_vcpu_id + 1;
> 
> Newline.

ack

> 
>> +        rc = x86_topo_from_parts(&p->policy, threads_per_core, cores_per_pkg);
> 
> I assume this generates the same topology as the current code, or will
> the population of the leaves be different in some way?
> 

The current code does not populate 0xb. This generates a topology
consistent with the existing INTENDED topology. The actual APIC IDs will
be different though (because there's no skipping of odd values).

All the dance in patch 1 was to make this migrate-safe. The x2apic ID is
stored in the lapic hidden regs so differences with previous behaviour
don't matter.

IOW, The differences are:
  * 0xb is exposed, whereas previously it wasn't
  * APIC IDs are compacted such that new_apicid=old_apicid/2
  * There's also a cleanup of the murkier paths to put the right core
    counts in the right leaves (whereas previously it was bonkers)

>> +        if ( rc )
>>          {
>> -        case X86_VENDOR_INTEL:
>> -            for ( i = 0; (p->policy.cache.subleaf[i].type &&
>> -                          i < ARRAY_SIZE(p->policy.cache.raw)); ++i )
>> -            {
>> -                p->policy.cache.subleaf[i].cores_per_package =
>> -                    (p->policy.cache.subleaf[i].cores_per_package << 1) | 1;
>> -                p->policy.cache.subleaf[i].threads_per_cache = 0;
>> -            }
>> -            break;
>> -
>> -        case X86_VENDOR_AMD:
>> -        case X86_VENDOR_HYGON:
>> -            /*
>> -             * Leaf 0x80000008 ECX[15:12] is ApicIdCoreSize.
>> -             * Leaf 0x80000008 ECX[7:0] is NumberOfCores (minus one).
>> -             * Update to reflect vLAPIC_ID = vCPU_ID * 2.  But avoid
>> -             * - overflow,
>> -             * - going out of sync with leaf 1 EBX[23:16],
>> -             * - incrementing ApicIdCoreSize when it's zero (which changes the
>> -             *   meaning of bits 7:0).
>> -             *
>> -             * UPDATE: I addition to avoiding overflow, some
>> -             * proprietary operating systems have trouble with
>> -             * apic_id_size values greater than 7.  Limit the value to
>> -             * 7 for now.
>> -             */
>> -            if ( p->policy.extd.nc < 0x7f )
>> -            {
>> -                if ( p->policy.extd.apic_id_size != 0 && p->policy.extd.apic_id_size < 0x7 )
>> -                    p->policy.extd.apic_id_size++;
>> -
>> -                p->policy.extd.nc = (p->policy.extd.nc << 1) | 1;
>> -            }
>> -            break;
>> +            ERROR("Failed to generate topology: t/c=%u c/p=%u",
>> +                  threads_per_core, cores_per_pkg);
> 
> Could you also print the error code?

Sure

> 
>> +            goto out;
>>          }
>>      }
>>  
>> diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
>> index 4b6d96276399..0ad871732ba0 100644
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
>> @@ -621,6 +618,9 @@ static void __init calculate_pv_max_policy(void)
>>      recalculate_xstate(p);
>>  
>>      p->extd.raw[0xa] = EMPTY_LEAF; /* No SVM for PV guests. */
>> +
>> +    /* Wipe host topology. Toolstack is expected to synthesise a sensible one */
>> +    memset(p->topo.raw, 0, sizeof(p->topo.raw));
>>  }
>>  
>>  static void __init calculate_pv_def_policy(void)
>> @@ -773,6 +773,9 @@ static void __init calculate_hvm_max_policy(void)
>>  
>>      /* It's always possible to emulate CPUID faulting for HVM guests */
>>      p->platform_info.cpuid_faulting = true;
>> +
>> +    /* Wipe host topology. Toolstack is expected to synthesise a sensible one */
> 
> Line length.
> 
> /* Wipe host topology.  Populated by toolstack. */
> 
> Would be OK IMO.

Ack

> 
> Thanks, Roger.
>> +    memset(p->topo.raw, 0, sizeof(p->topo.raw));
> 
> Note that currently the host policy also gets the topology leaves
> cleared, is it intended to not clear them anymore after this change?
> 
> (as you only clear the leaves for the guest {max,def} policies)
> 
> Thanks, Roger.

It was like that originally in v1, I changed in v2 as part of feedback
from Jan.

Cheers,
Alejandro

