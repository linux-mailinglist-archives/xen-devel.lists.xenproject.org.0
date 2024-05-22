Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F356B8CC3EF
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 17:16:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727760.1132425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9ngQ-0004Fm-Qj; Wed, 22 May 2024 15:15:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727760.1132425; Wed, 22 May 2024 15:15:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9ngQ-0004Dv-MY; Wed, 22 May 2024 15:15:14 +0000
Received: by outflank-mailman (input) for mailman id 727760;
 Wed, 22 May 2024 15:15:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eEN6=MZ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1s9ngP-0003wy-8r
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 15:15:13 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15410651-184e-11ef-b4bb-af5377834399;
 Wed, 22 May 2024 17:15:11 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-34f0e55787aso4013910f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 May 2024 08:15:11 -0700 (PDT)
Received: from [192.168.0.16] (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-354db76acafsm1864576f8f.49.2024.05.22.08.15.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 May 2024 08:15:10 -0700 (PDT)
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
X-Inumbo-ID: 15410651-184e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1716390911; x=1716995711; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kK3dRrXrwVNPXE4+0A/1KWYbPmGy2JdF5u4c4yDy9s4=;
        b=F5+Fies9vkolU8Q7W7A0cXxkxZaFFM1LOlH73VoqFVytxPtEk3NeO6Aa8eGCuv1Oj3
         KLzj1JNV8EkZ9+IE2RiLWXTHfc00fzzb/I+W1rHvXfjrafKJ2mh2DzWiWUaP3kjsGbTX
         v522lZUZh+nPB9xZoC2fmUgYd6QZtFXGQoZak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716390911; x=1716995711;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kK3dRrXrwVNPXE4+0A/1KWYbPmGy2JdF5u4c4yDy9s4=;
        b=hoLOchSaUwjZxnDadbIhChEmeoYybx84DdDUzD3k25EbmrwzOUpmoFo/c9vbkJEqGA
         r/ELbiiB0qz4eiS3jhROpL+7nxJ+JeYQ9USmnCkZPm4VlT/WzU0Er73+lwT+b6+VATlO
         OUftw4IKgL4EpVW3kl2nVUzGvPSDcZ6DQflAU4rSM4nl/OyB0vx5P5DLTlkFjZL8+t3X
         lgP/mdLYDEvSDuM1mXFT9MmJPcBUea3iCvVutOB7d6m+GNfudVCzsW4D1xzjMLkRdJPs
         fk3Yjclik4SIUlunr6at66eyjYRkA/2KFciCHBBKnaxmG8FmH1m3M/Gm/NrhE9O7KL6q
         02gQ==
X-Gm-Message-State: AOJu0Yynm2fFcgqWfI9uFe59ORPh7Z+zsEq8AFOZhtT5g7rjb4JKSWuT
	6KEEECKs7nohiLsxFnAhujMpVPkv4NTSxXZpza+inSFf9QA2OwZi1dlyyYLt91k=
X-Google-Smtp-Source: AGHT+IG9GddBwM5c5CCKKh8vIp9biDptjqXlZAk9WQ+OyCsyroo+12gATRP4E15F30O4WDlyURbPxA==
X-Received: by 2002:adf:f104:0:b0:34d:8d88:7c53 with SMTP id ffacd0b85a97d-354d8bd1408mr1705577f8f.0.1716390910943;
        Wed, 22 May 2024 08:15:10 -0700 (PDT)
Message-ID: <974bfbc6-97f6-4afa-978c-562448042d4a@cloud.com>
Date: Wed, 22 May 2024 16:15:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] tools/xg: Clean up xend-style overrides for CPU
 policies
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>
References: <cover.1715954111.git.alejandro.vallejo@cloud.com>
 <d397ec0de4138e32feeb910f3401a6568a75035e.1715954111.git.alejandro.vallejo@cloud.com>
 <Zktl8zRt1kue5vA6@macbook>
Content-Language: en-GB
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <Zktl8zRt1kue5vA6@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/05/2024 16:02, Roger Pau Monné wrote:
>> -
>>  static int xc_msr_policy(xc_interface *xch, domid_t domid,
>> -                         const struct xc_msr *msr)
>> +                         const struct xc_msr *msr,
>> +                         xc_cpu_policy_t *host,
>> +                         xc_cpu_policy_t *def,
> 
> host and def should likely be const?

I tried, but I can't. All policies go through find_msr(), which takes a
non-const policy, and must be non-const because it's also used for the
cur policy.

I did the next best thing (I think) by const-ifying the result of
find_msr inside the loop for host and def. Same thing on the cpuid function.

>> -    if ( rc )
>> -    {
>> -        PERROR("Failed to obtain host policy");
>> -        rc = -errno;
>> -        goto out;
>> -    }
>> +    if ( !msrs )
> 
> Does this build?  Where is 'msrs' defined in this context?  The
> function parameter is 'msr' AFAICT.

Ugh. I fixed that while adjusting it for testing within XenServer and
then neglected to make the change in the actual for-upstream patches.

You're right.

> 
>> +        return 0;
> 
> Should we also check for host, def, cur != NULL also?

It's already done by the caller, but can do out of paranoia; returning
-EINVAL.

>> @@ -583,14 +436,16 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
>>      int rc;
>>      bool hvm;
>>      xc_domaininfo_t di;
>> -    struct xc_cpu_policy *p = xc_cpu_policy_init();
>> -    unsigned int i, nr_leaves = ARRAY_SIZE(p->leaves), nr_msrs = 0;
>> -    uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
>> -    uint32_t host_featureset[FEATURESET_NR_ENTRIES] = {};
>> -    uint32_t len = ARRAY_SIZE(host_featureset);
>>  
>> -    if ( !p )
>> -        return -ENOMEM;
>> +    struct xc_cpu_policy *host = xc_cpu_policy_init();
>> +    struct xc_cpu_policy *def = xc_cpu_policy_init();
> 
> I would be helpful to have some kind of mechanism to allocate + init a
> policy at the same time, so that the resulting object could be made
> const here.  (Not that you need to do it in this patch).

That would seem sensible, but we'd also need a way to clone it to avoid
repeating hypercalls when they aren't required. I had a patch that did
that, but was quite complicated for other reasons. I might get back to
it at some point now that per-vCPU policies don't seem to be required.

>> @@ -695,24 +542,24 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
>>                   !(dfs = x86_cpu_policy_lookup_deep_deps(b)) )
>>                  continue;
>>  
>> -            for ( i = 0; i < ARRAY_SIZE(disabled_features); ++i )
>> +            for ( size_t i = 0; i < ARRAY_SIZE(disabled_features); ++i )
> 
> All this loop index type changes could be done as a separate patch,
> you are not even touching the surrounding lines.  It adds a lot of
> churn to this patch for no reason IMO.

I got carried away. Let me revert that. I still want to get rid of all
those overscoped indices, but this is not the patch for it.

>> @@ -772,49 +619,45 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
>>               * apic_id_size values greater than 7.  Limit the value to
>>               * 7 for now.
>>               */
>> -            if ( p->policy.extd.nc < 0x7f )
>> +            if ( cur->policy.extd.nc < 0x7f )
>>              {
>> -                if ( p->policy.extd.apic_id_size != 0 && p->policy.extd.apic_id_size < 0x7 )
>> -                    p->policy.extd.apic_id_size++;
>> +                if ( cur->policy.extd.apic_id_size != 0 && cur->policy.extd.apic_id_size < 0x7 )
> 
> I would split the line while there, it's overly long.

Ack

> 
> Thanks, Roger.

Cheers,
Alejandro

