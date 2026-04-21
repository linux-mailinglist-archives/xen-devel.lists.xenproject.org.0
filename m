Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCMcCYJl52nx7gEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 13:54:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7199B43A523
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 13:54:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288914.1569149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF9fk-0000UG-2Y; Tue, 21 Apr 2026 11:53:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288914.1569149; Tue, 21 Apr 2026 11:53:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF9fj-0000So-Uk; Tue, 21 Apr 2026 11:53:43 +0000
Received: by outflank-mailman (input) for mailman id 1288914;
 Tue, 21 Apr 2026 11:53:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wF9fi-0000Si-Ca
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 11:53:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF9fh-007J4d-Aa
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 13:53:41 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e7653d-bab6-0a2a0a5309dd-0a2a4509e0da-30
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 13:53:41 +0200
Received: from [209.85.167.47] (helo=mail-lf1-f47.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e76544-2497-0a2a45090019-d155a72fa57e-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 13:53:41 +0200
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-5a415fd6bceso4579889e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 04:53:41 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a4187e12e0sm3618031e87.51.2026.04.21.04.53.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 04:53:39 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776772420; x=1777377220; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GnI1w8VHFLuYA/q/nQKT8b1hWlYdiduy2GEHg/0m0UQ=;
        b=rfLp1CSjPVQVTF8X5dhZ9ywCLG7BwPPS0j/Sr1CfK47QWRECzH10X48dCyc4Z4rp0I
         2g3zZ0ymuF6MYSCLQ9v/eEvGB/OtcKFBLwZXDMk4UBy4mCbR+02ec7CXZrgg0ILwwa7f
         uL2XLCzZj9w5Dxr0rZHuT59ygz24yJ/s2J5kkBmSXZjZRPSPHkbLt7FH0HyfBnOTm2ZN
         K9JgJ88CtaWI/V5C1gY4gqWrPB0cZrdPtZQ4Q9dNknf+2zhSr6nkd1zOXKzGdKksgY2w
         uZLYwDipNRIEiGO63hVFHsY+GECIEuH4IBQ5nSXzayqSoHLqT2Ql5GJJg8iPF5siQbdk
         lNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776772420; x=1777377220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GnI1w8VHFLuYA/q/nQKT8b1hWlYdiduy2GEHg/0m0UQ=;
        b=KcwfHJXTSMJZbCIJwZEdviAmeP5BCSUZBd74jcIsCM+Z7q53MXHhFck2nLU0Z7Ppt4
         uoqB+geK/THuD/1D2ewjfDVLzT5s5Fkirp/cM+f/Q68b2pbUp+vCUeDsqQIEvy1jF9rN
         wtAEu6369sbznzs1b9Muit6I7Ydj/V9e/qfRVWMHWFAPHpdKaAenB9mowmja27aoHLB5
         2s3mDFOZcMTM0lGAV3LVZMWhtYnQwHsRSVkg8zFTXaoSJ6r0Y0ozErYnvo9WFqMMUIHL
         wn80Dax4FLgp2LXUhJyCnLzzkgtf++4Zr0m3i1dPJ0b623JjtVtJAiDzDSfuKUFUVVf9
         941A==
X-Forwarded-Encrypted: i=1; AFNElJ+VCM7S2/7zET2P7+ASXOi+E2qW8WXaYhkEzNYYe9AcvZP1+N66z6lu6dQl6dKLhKNZW1tMQwkU+B8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzwgj5N8MtEXQswLO5Zwt8WMdemETnvxrWA7SqBb/RqdFT6fkmP
	uKVHWdt915PI7j5zgiZ+AyqvEYAO7FdtUpdubMHrmgWk1DWMoaSVsuTP
X-Gm-Gg: AeBDietYNtURUmBZIL6btMkOH9A3myRbHhkG0Qfi44BvI94SCv1aOc4CdI42iCQokxt
	7q4knPGGanlkuFNTNal2jH3PbiKgmx++A5b+IKBSdb3c1rZuh9Zglq2pA7FfLVo+ODphEt56s1Z
	Rjl4uz1qQMQ9q9DScWicl2k9+rZ0rWzDbnTLX9LRVUjVKDZjB/YN1aedjMjWBtEQ6RRH1+EVlwd
	odIQQMlexowp76aFFAMfwq+kaxyh+WRTUvPfeKPu0lXgtgOMBZnhMlRMZzVW6DDQTtz3dTALZKh
	gXuhoo6Zsa93LJtziXO7SxySUOBy9FDh5idSJHGsUXVE2cgCH07x5glmxi6kJC3NYq0u9mXv7kt
	MNebgCmujSf4pG4ypzxUgoFkfY4VBrjqYOlkoxjL9I7pgy8X2A9TAK+gUKOM3OllZR6agbPOpJR
	OCayH+eEveviTWJ1wJ8J2hbxevFLRyF1sS4QNCLIRplqOLK0IJfdgbMIsbcp+EHYMNCQWZ2PADt
	b31tiJrXrmO8g==
X-Received: by 2002:a05:6512:3c99:b0:5a4:1b6:dd31 with SMTP id 2adb3069b0e04-5a417299948mr4954946e87.13.1776772420041;
        Tue, 21 Apr 2026 04:53:40 -0700 (PDT)
Message-ID: <62fe5597-4230-48d1-8b3d-35715fc824c8@gmail.com>
Date: Tue, 21 Apr 2026 13:53:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] xen: introduce CONFIG_HAS_DOMAIN_TYPE
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <cover.1776340422.git.oleksii.kurochko@gmail.com>
 <e5ffcdecb0ca3c87b46965449601ff20116fecc0.1776340422.git.oleksii.kurochko@gmail.com>
 <f5c7006d-a6ed-4c92-962b-d5f4b27a5c6d@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f5c7006d-a6ed-4c92-962b-d5f4b27a5c6d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1776772421-48CADA53-2664506C/10/73395122804
X-purgate-type: spam
X-purgate-size: 6360
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7199B43A523
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/20/26 10:22 AM, Jan Beulich wrote:
> On 16.04.2026 16:21, Oleksii Kurochko wrote:
>> As domain type is part of common code now there is no any reason
>> to have architecture-specific set_domain_type() functions so
>> it is dropped.
>>
>> The CONFIG_ARM_64 guard in xen/arch/arm/domain_build.c is intentionally
>> left unchanged: it is ARM-specific code, and ARM_64 selects
>> HAS_DOMAIN_TYPE, so the semantics are identical.
> 
> Still I think it would better be updated, for consistency's sake.

I can update that. Just tried to keep changes smaller.

> 
>> x86 with CONFIG_64BIT=y shouldn't use is_{32,64}bit_domain() as
>> x86 doesn't have support of CONFIG_HAS_DOMAIN_TYPE. For x86_32
>> it is fine to follow generic is_{32,64}_bit_domain() implementations.
> 
> As Michal has also alluded to, the use of x86_32 here needs some further
> qualification, as Xen hasn't been possible to be built for that target
> for many years. Quite possibly you mean guest type there, but then it's
> unclear why you would restrict the explanation to 32-bit guests.

I suggested to rephrase that part to: "Since x86_32 Xen no longer 
builds, the fallback is currently only relevant for arm32."

> 
>> Generally it probably would be better to introduce CONFIG_32BIT
>> and use it to define is_{32,64}bit_domain() as if one day
>> CONFIG_128BIT will be introduced is_{32,64}bit_domain() will be
>> defined incorrectly but considering that CONFIG_64BIT is maximum
>> supported bitness it is fine to define in this way.
> 
> Many things will need adjustment for a future CONFIG_128BIT. Imo this
> kind of statement doesn't belong in a patch description; it could be a
> post-commit-message remark.

I will drop that part of the message.

> 
>> --- a/xen/arch/Kconfig
>> +++ b/xen/arch/Kconfig
>> @@ -1,6 +1,9 @@
>>   config 64BIT
>>   	bool
>>   
>> +config HAS_DOMAIN_TYPE
>> +	bool
>> +
>>   config PHYS_ADDR_T_32
>>   	bool
> 
> Why here rather than where the bulk of the other HAS_* are?

Because it is a little arch-specific now as not all arch-s support it.

I can move it to xen/common/Kconfig.

> 
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -1178,7 +1178,7 @@ int __init make_cpus_node(const struct domain *d, struct kernel_info *kinfo)
>>       /* Keep the compiler happy with -Og */
>>       bool clock_valid = false;
>>       uint64_t mpidr_aff;
>> -    void *fdt = kinfo;
>> +    void *fdt = kinfo->fdt;
>>   
>>       dt_dprintk("Create cpus node\n");
>>   
>> @@ -1774,13 +1774,13 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
>>   
>>   #ifdef CONFIG_ARM_64
>>       /* if aarch32 mode is not supported at EL1 do not allow 32-bit domain */
>> -    if ( !(cpu_has_el1_32) && kinfo->arch.type == DOMAIN_32BIT )
>> +    if ( !(cpu_has_el1_32) && kinfo->type == DOMAIN_32BIT )
> 
> I'm not an Arm maintainer; if I was, I'd ask for the stray parentheses to be
> dropped on this occasion.

They could be dropped. Should be then it mentioned in commit message?

> 
>> @@ -1896,7 +1896,7 @@ int __init construct_hwdom(struct kernel_info *kinfo,
>>   
>>   #ifdef CONFIG_ARM_64
>>       /* type must be set before allocate_memory */
>> -    d->arch.type = kinfo->arch.type;
>> +    d->type = kinfo->type;
>>   #endif
> 
> I wonder why this doesn't use set_domain_type() (see also below).

I assume that domain_build.c could be used for both dom0 and dom0less 
but set_domain_type() was used for dom0less. But generally I think it 
shouldn't be a problem to re-use it in construct_hwdom().

If it is fine to ...


> 
>> --- a/xen/common/device-tree/dom0less-build.c
>> +++ b/xen/common/device-tree/dom0less-build.c
>> @@ -809,7 +809,10 @@ static int __init construct_domU(struct kernel_info *kinfo,
>>       if ( rc < 0 )
>>           return rc;
>>   
>> -    set_domain_type(d, kinfo);
>> +#ifdef CONFIG_HAS_DOMAIN_TYPE
>> +    /* type must be set before allocate memory */
> 
> Nit: Comment style.
> 
>> +    d->type = kinfo->type;
>> +#endif
> 
> Imo it would be preferable to retain set_domain_type(), to avoid #ifdef-ary
> here and in construct_hwdom(). Of course its implementation would need to
> move. Couldn't it be ...
> 
>> --- a/xen/include/xen/dom0less-build.h
>> +++ b/xen/include/xen/dom0less-build.h
>> @@ -57,8 +57,6 @@ int init_vuart(struct domain *d, struct kernel_info *kinfo,
>>   int make_intc_domU_node(struct kernel_info *kinfo);
>>   int make_arch_nodes(struct kernel_info *kinfo);
>>   
>> -void set_domain_type(struct domain *d, struct kernel_info *kinfo);
> 
> ... an inline function here?

... move set_domain_type() to <xen/fdt-domain-build.h> then it would be 
fine for me to have the following implementation:

static void inline set_domain_type(struct domain *d, struct kernel_info 
*kinfo)
{
#ifdef CONFIG_HAS_DOMAIN
     /* type must be set before allocate memory */
     d->arch.type = kinfo->arch.type;
#endif
}

and re-use it everywhere it is needed.

> 
>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -668,6 +668,10 @@ struct domain
>>       struct page_info *pending_scrub;
>>       unsigned int pending_scrub_order;
>>       unsigned int pending_scrub_index;
>> +
>> +#ifdef CONFIG_HAS_DOMAIN_TYPE
>> +    enum domain_type type;
>> +#endif
>>   } __aligned(PAGE_SIZE);
> 
> I'm not quite happy with all new fields getting put at the bottom, when
> better options may exist. If the enum was a packed one, it could go next
> to domain_id (where 16 bits of padding presently exist). The five *_pages
> fields also have a padding field following them (unless MEM_SHARING !=
> MEM_PAGING).

Just to be sure that I understand correctly what you meant:

enum __attribute__((packed)) domain_type {
     DOMAIN_32BIT,
     DOMAIN_64BIT,
};

struct domain
{
     domid_t          domain_id;

#ifdef CONFIG_HAS_DOMAIN_TYPE
     enum domain_type type;
#endif
  ....

It is what you suggested?

I thought that it make sense only for struct and unions to remove 
padding between members.

Maybe do you mean just declare type member as uint16_t or even uint8_t, 
place it after domain_id and and keep the enum as symbolic constants?

Thanks.

~ Oleksii

