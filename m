Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F28CCCF57
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 18:26:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1190013.1510678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWHlA-0001sI-Gk; Thu, 18 Dec 2025 17:25:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1190013.1510678; Thu, 18 Dec 2025 17:25:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWHlA-0001pP-Di; Thu, 18 Dec 2025 17:25:52 +0000
Received: by outflank-mailman (input) for mailman id 1190013;
 Thu, 18 Dec 2025 17:25:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YG3a=6Y=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vWHl8-0001pJ-MS
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 17:25:50 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98741fdb-dc36-11f0-b15b-2bf370ae4941;
 Thu, 18 Dec 2025 18:25:49 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-64b7b737eddso671182a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Dec 2025 09:25:49 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8023465fbcsm287979566b.43.2025.12.18.09.25.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Dec 2025 09:25:48 -0800 (PST)
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
X-Inumbo-ID: 98741fdb-dc36-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766078749; x=1766683549; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lVMYe8biLOfqadpnxrKZq0Sh4LFOmZsedrt+maqnr/Q=;
        b=mK6XqHsdP2+nrJBaYR1RpBJyxdC7iU2D1L9jyydYSrrWthAsLnqFz3fRIIWgupuwck
         K2wc0mr6xkTo3NtLcGWDOwdSWH4hblsyQRbqxTjlpW+W5Ubr9THBz1EDXQVBmyk9bL/G
         pWBt8PtLX3Zgp0iKHL3gAvpPsUuhJoS+ezEoTwL2XHcb8Z2AitWqGovdVbaHNYf8oORD
         lunKmHhk8fK67C2fvRZCScJOV7IFzI2k2iMOd1yShT18yN7GnMCu6PAO5yhdOu0GqCPO
         79qBVZQhQlh17MJlF40qGBgj7n5kWwE6RwvWUwbwH+xD32UQsY7Ef4fpKhdo6e1Xnr3K
         +2TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766078749; x=1766683549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lVMYe8biLOfqadpnxrKZq0Sh4LFOmZsedrt+maqnr/Q=;
        b=Wa77hqTw3lpr7cYZvoWc9tLYMWtmLG6xU07cCrVyXtA3Uv7gtHHz2SMsj9N2wemL2g
         /UokHiSvE61UR+jBY/gzSUaVwrNKZCv4UMg+QrfCaV9QNj3gi259PJFn7Pvq69UnEFNO
         fiBRcETQveSvoXd5rekfliEOTXnKwbl3ooUnSiCc1nyNl+sMO05vwu7BrbfTUZRso2zY
         usCstxTjosj7EgzRXTLPVgA5VmO9L+TPrR5TZoC+7UuiH2j5niyAomHMj6+V8sShP2f7
         /BN5EJmWpoIJh6PdWAeB0pSU3D+2QMcq4UMzT07W6pupWdH/Pc2+3d2S9q8Cz7jwIRrs
         XWxg==
X-Forwarded-Encrypted: i=1; AJvYcCVXNwob27SSRTiSYEGqm/Va59sODA/343Uk9gp+NRW7YYDL/OsOa5Rkajy3T8ZFYHWbMuqAUUW8C2o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwwUt9xqe67OPkzTOpOJUsYKyHvEP19fa6NDn1av6/T6Ymf6D/z
	cvM457UtQl7o7YxaJo5b3z9BLTcwnO5YYy+ruV5U2MXqDGn2Y8O2sv/7
X-Gm-Gg: AY/fxX4rFF3WXCr6MKTR7zWh0rBJMoLOgkRMCd18s3si3+zFEmPh83nv6H8YYEQVLKr
	QFYxdjXbHvj1gRiVcJHdTFugm1twkVuy/JTZXcPFxhz+1VD3lUj/5WUpUTC3OabgLzojbZrhQ1H
	gBojoTLmSFUJdmWjfBcfXydIWCkfnwo/oHNJ1LjoowCFEHvNmy55MwzD5tUZWAcldzMC26J8vg1
	U8pB1n3MxVqh8220Dx/gdBoLYxg9q39ssQKYEjgA1X8mqa+iuETIXZ2n4jINfgvKp2ASxQruFly
	NFdDxJN1jyZJuMVFWjuAK+Ru6ZzChqr+wnp2bDS2qsBvLS47qaxCKNNQPRuhGEdxZAbbFC1n4AJ
	A1fVjmfOBTWayUG2XRj3+Dn/dsuVWkPVwz4q8F/yuGx7xWiCrc4lStIax5tg2z6Ks7rDczCPwPM
	NXSzjt6BbDxugRxfe3fAysj72xa2X8oyMeb8JPx5AD83IyTxchZftD0lR9oXj0+Je/xRjnwT/o/
	OY=
X-Google-Smtp-Source: AGHT+IEBKuCWv0bZqZGNl5yfTlVjX6b4eoFOq0Od2EVGrREgZkQefIkj6hmwLJUgyC15FBs+nYG89w==
X-Received: by 2002:a17:906:f584:b0:b76:ece6:2ca1 with SMTP id a640c23a62f3a-b80371f2941mr11028966b.57.1766078748593;
        Thu, 18 Dec 2025 09:25:48 -0800 (PST)
Message-ID: <4eec691b-6c81-4c9e-a9c1-00c81e51c691@gmail.com>
Date: Thu, 18 Dec 2025 18:25:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 17/19] xen/riscv: add support of page lookup by GFN
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1765879052.git.oleksii.kurochko@gmail.com>
 <4cef2922ff0fa82eb70e50c737cb00ef27ef13a3.1765879052.git.oleksii.kurochko@gmail.com>
 <9d4d89f1-81c1-4532-8646-c736ac56e7f3@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <9d4d89f1-81c1-4532-8646-c736ac56e7f3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/18/25 1:55 PM, Jan Beulich wrote:
> On 16.12.2025 17:55, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/p2m.c
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -1057,3 +1057,187 @@ int map_regions_p2mt(struct domain *d,
>>   
>>       return rc;
>>   }
>> +
>> +/*
>> + * p2m_get_entry() should always return the correct order value, even if an
>> + * entry is not present (i.e. the GFN is outside the range):
>> + *   [p2m->lowest_mapped_gfn, p2m->max_mapped_gfn]    (1)
>> + *
>> + * This ensures that callers of p2m_get_entry() can determine what range of
>> + * address space would be altered by a corresponding p2m_set_entry().
>> + * Also, it would help to avoid costly page walks for GFNs outside range (1).
>> + *
>> + * Therefore, this function returns true for GFNs outside range (1), and in
>> + * that case the corresponding level is returned via the level_out argument.
>> + * Otherwise, it returns false and p2m_get_entry() performs a page walk to
>> + * find the proper entry.
>> + */
>> +static bool check_outside_boundary(const struct p2m_domain *p2m, gfn_t gfn,
>> +                                   gfn_t boundary, bool is_lower,
>> +                                   unsigned int *level_out)
>> +{
>> +    unsigned int level = P2M_ROOT_LEVEL(p2m);
>> +    bool ret = false;
>> +
>> +    ASSERT(p2m);
>> +
>> +    if ( is_lower ? gfn_x(gfn) < gfn_x(boundary)
>> +                  : gfn_x(gfn) > gfn_x(boundary) )
>> +    {
>> +        for ( ; level; level-- )
>> +        {
>> +            unsigned long mask = BIT(P2M_GFN_LEVEL_SHIFT(level), UL) - 1;
>> +            unsigned long masked_gfn;
>> +
>> +            if ( is_lower )
>> +                masked_gfn = gfn_x(gfn) | mask;
>> +            else
>> +                masked_gfn = gfn_x(gfn) & ~mask;
>> +
>> +            if ( is_lower ? masked_gfn < gfn_x(boundary)
>> +                          : masked_gfn > gfn_x(boundary) )
>> +                break;
> Having two is_lower conditionals here is imo unhelpful. Likely the compiler
> would manage to fold them, but imo
>
>              if ( is_lower ? (gfn_x(gfn) | mask) < gfn_x(boundary)
>                            : (gfn_x(gfn) & ~mask) > gfn_x(boundary) )
>                  break;
>
> would be more clear to the reader as well. I'm not going to insist, though.

Agree, probably, it would be better to drop masked_gfn and merge is_lower conditionals.


>
>> +        }
>> +
>> +        ret = true;
>> +    }
>> +
>> +    if ( level_out )
>> +        *level_out = level;
>> +
>> +    return ret;
>> +}
>> +
>> +/*
>> + * Get the details of a given gfn.
>> + *
>> + * If the entry is present, the associated MFN, the p2m type of the mapping,
>> + * and the page order of the mapping in the page table (i.e., it could be a
>> + * superpage) will be returned.
>> + *
>> + * If the entry is not present, INVALID_MFN will be returned, page_order will
>> + * be set according to the order of the invalid range, and the type will be
>> + * p2m_invalid.
>> + */
>> +static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
>> +                           p2m_type_t *t,
>> +                           unsigned int *page_order)
>> +{
>> +    unsigned int level = 0;
>> +    pte_t entry, *table;
>> +    int rc;
>> +    mfn_t mfn = INVALID_MFN;
>> +    P2M_BUILD_LEVEL_OFFSETS(p2m, offsets, gfn_to_gaddr(gfn));
>> +
>> +    ASSERT(p2m_is_locked(p2m));
>> +
>> +    *t = p2m_invalid;
>> +
>> +    if ( gfn_x(gfn) > (BIT(PADDR_BITS - PAGE_SHIFT + 1, UL) - 1) )
>> +        return mfn;
> Since on all other error paths you set *page_order (as long as the pointer
> is non-NULL), shouldn't you do so here as well (to the order corresponding
> to the full [2nd-level] address space)?

It makes sense. I am thinking if something like would be fine:
   @@ -1123,7 +1117,7 @@ static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
                               p2m_type_t *t,
                               unsigned int *page_order)
    {
   -    unsigned int level = 0;
   +    unsigned int level = P2M_ROOT_LEVEL(p2m);
        pte_t entry, *table;
        int rc;
        mfn_t mfn = INVALID_MFN;
   @@ -1134,7 +1128,13 @@ static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
        *t = p2m_invalid;
    
        if ( gfn_x(gfn) > (BIT(PADDR_BITS - PAGE_SHIFT + 1, UL) - 1) )
   +    {
   +        if ( page_order )
   +            *page_order =
   +                P2M_LEVEL_ORDER(level + 1) + P2M_ROOT_EXTRA_BITS(p2m, level);
   +
            return mfn;
   +    }
    
        if ( check_outside_boundary(p2m, gfn, p2m->lowest_mapped_gfn, true,
                                    &level) )
   @@ -1152,7 +1152,6 @@ static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
        if ( !table )
        {
            ASSERT_UNREACHABLE();
   -        level = P2M_ROOT_LEVEL(p2m);
            goto out;
        }

Or it isn't the best one option to define page_order using "non-existing" level?

>
> Furthermore, is PADDR_BITS really the right basis? Don't things rather depend
> on the number of levels the 2nd-level page tables have for the given guest?

I think you are right, it depends on the number of levels the 2nd-level page tables
have for the given guest.


~ Oleksii


