Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zFgJBmgJUWpS+QIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 17:02:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABB373C039
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 17:01:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Dl8WtNSw;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1359502.1613041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiCir-0007du-Kd; Fri, 10 Jul 2026 15:01:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1359502.1613041; Fri, 10 Jul 2026 15:01:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiCir-0007ba-Hy; Fri, 10 Jul 2026 15:01:01 +0000
Received: by outflank-mailman (input) for mailman id 1359502;
 Fri, 10 Jul 2026 15:01:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wiCiq-0007bK-9l
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 15:01:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wiCip-007Hbx-Md
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 17:00:59 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a51092b-bab6-0a2a0a5309dd-0a2a450bd0aa-0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 17:00:59 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a51092b-b7da-0a2a450b0019-d155802abccf-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 17:00:59 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4921eed3fa2so9497045e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 08:00:59 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493f2d88698sm67298035e9.1.2026.07.10.08.00.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 08:00:58 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783695659; x=1784300459; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ASZFLEiCq3bS1od9JjrVbFlMmYuiu8FfWoiWG6rMDqk=;
        b=Dl8WtNSw9gDONYFi3aF8OvcYIMZPWqryjd78QDfMBCHNOf6s5JZ3hJcQmBz6B3ckcC
         Qf2hb0fnX/6g/PHnX1NFGAFhcgDUQXgDDGIjawO2TrXIfLutfY5Dk7BfGnMwjEt92Ger
         fzKvHqIs+CyfbhHsauGGXodb8JWBLW9MMn1qzcrVfLJblq52yKOBuAupn5eB+mr4R/1E
         8q4W2TEAOlAk+rqCOfiz7ilCSmQjfANlUYL1qwtCbmWGDy9YUFait5al8zy9zf1jA3Di
         /r9JIbxE1oqy5GnLONCeRW/wnoelymbO1q9mapz210AlDrEoKS5UmFXIMfMHSR4ZIiPi
         0zFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783695659; x=1784300459;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ASZFLEiCq3bS1od9JjrVbFlMmYuiu8FfWoiWG6rMDqk=;
        b=X/MXVwnRiCTFntx6hdCgp8NisOp3VMd5riFgx+pYFU7qqJjKoMapQ03a0E2l2eDurs
         5SPtzw57K0GZvH1d+l+MEhFAjSIY1GWfVrK2YmyvmSKi/MlS73XDpX/a/W3j054/Augi
         F/P0/+vedd7yDivLPpmSBf1WTTrn28emT3bZ3ihwjPwDk3QKcdgjlvz1Gz3sEQEj0kUV
         7D0UuL/4a56eERtolmhY9PxhHzMy8ThQvqRLGJaYEESnECSFt6kL1ztKdpVxY+/lkRHH
         BoRco8t+DFyTBtyUqhT7jOlsODYAHiWEWE8swLCcJxZoP7TNfrPzimd+JYjMv/1cV2bi
         vB8Q==
X-Forwarded-Encrypted: i=1; AHgh+RpoKKfC/ZTy9PL9P4YgoK7EYl1pBALXVGuCbuzr9ye9SfFueXx8OwQRI/r9czWYpoukbVJBuA1/VmI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyqp4XNYZYeRAd4WfsSKdS8RlzznlJyTnVORJtD0Pb41O2Q2Pvt
	OXvGav3SrKdZOOS6sVH7S4dFufD5cMS08k+7dgjv8xti6Ojmit2q1XSF
X-Gm-Gg: AfdE7cls1KkLxUn+c7k976Wau8rPf3An0q5pzg6aIiYtxAvN5d+oqKfn5BgBSFh8EWk
	zxvix/yjKrAfgEs5saQ+coTB0lN6bMHYJXuQXYx/aQs9/JpLT112Ie9TXAf7Hd3GunYCKOgxc37
	v7HSXkEldAd0qgy42ZZ87T0HRe424e54pDC2dgwRqSSOIrn7WJin0O3oui8WFr0bZcV5JNRUPBA
	KP3fKF6Xo1kVyK6HivaiXnnsHXsLb6tR8Ip3668wS2mbhASKJlLZrVxIsPuWoeQLlJO/ChXXaxA
	1g6ovB/OcDcZhT+6H5sgBB63YYgK87SE9wF0ZZNKH6eDcoElcA1naNfRPiBx9yc+HdAKpwc3XIn
	4hgmkRBB09tIgAC6jvGre/Gtnvb1sxoNddvc7deSe2dMihxIkRdwjAOUVZ4VosUV4i93y/T5bJ7
	bqtoWJ28i2UBKxmdf+rLNdXdjPIQa+4HQTreAuXAF0CZovvojENNvsa9wnyTu8FMQAy54=
X-Received: by 2002:a05:600c:4d98:b0:493:e583:7053 with SMTP id 5b1f17b1804b1-493e68f5905mr72897575e9.35.1783695658949;
        Fri, 10 Jul 2026 08:00:58 -0700 (PDT)
Message-ID: <79e5b29d-b107-4176-b8e8-bacf4c4059cd@gmail.com>
Date: Fri, 10 Jul 2026 17:00:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/26] xen/riscv: introduce guest riscv,isa string
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1783331040.git.oleksii.kurochko@gmail.com>
 <dc486923b5313c64cf383575d25c58c9af9e5eae.1783331040.git.oleksii.kurochko@gmail.com>
 <2f26c623-e577-44bb-8163-f52b97496d05@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <2f26c623-e577-44bb-8163-f52b97496d05@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1783695659-A21CE9ED-BF4BC9BE/10/73395122804
X-purgate-type: spam
X-purgate-size: 6082
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,wdc.com,gmail.com,citrix.com,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:query timed out];
	RCVD_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2ABB373C039



On 7/9/26 3:05 PM, Jan Beulich wrote:
> On 06.07.2026 17:57, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/cpufeature.c
>> +++ b/xen/arch/riscv/cpufeature.c
>> @@ -14,6 +14,7 @@
>>   #include <xen/errno.h>
>>   #include <xen/init.h>
>>   #include <xen/lib.h>
>> +#include <xen/sched.h>
>>   #include <xen/sections.h>
>>   
>>   #include <asm/cpufeature.h>
>> @@ -34,6 +35,19 @@ struct riscv_isa_ext_data {
>>       .name = #ext_name,                          \
>>   }
>>   
>> +struct riscv_isa_ext_entry {
>> +    unsigned int id;
>> +    const char *name;
>> +    bool guest_supported;
>> +};
>> +
>> +#define RISCV_ISA_EXT_ENTRY(ext_name, guest_supp)       \
>> +{                                                       \
>> +    .id              = RISCV_ISA_EXT_ ## ext_name,      \
>> +    .name            = #ext_name,                       \
>> +    .guest_supported = guest_supp,                      \
>> +}
>> +
>>   /* Host ISA bitmap */
>>   static __ro_after_init DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX);
>>   
>> @@ -120,29 +134,30 @@ static int __init dt_get_cpuid_from_node(const struct dt_device_node *cpu,
>>    * and strncmp() is used in match_isa_ext() to compare extension names instead
>>    * of strncasecmp().
>>    */
>> -const struct riscv_isa_ext_data __initconst riscv_isa_ext[] = {
> 
> I realize it has been this way before, but ...
> 
>> -    RISCV_ISA_EXT_DATA(i),
>> -    RISCV_ISA_EXT_DATA(m),
>> -    RISCV_ISA_EXT_DATA(a),
>> -    RISCV_ISA_EXT_DATA(f),
>> -    RISCV_ISA_EXT_DATA(d),
>> -    RISCV_ISA_EXT_DATA(q),
>> -    RISCV_ISA_EXT_DATA(c),
>> -    RISCV_ISA_EXT_DATA(h),
>> -    RISCV_ISA_EXT_DATA(zicntr),
>> -    RISCV_ISA_EXT_DATA(zicsr),
>> -    RISCV_ISA_EXT_DATA(zifencei),
>> -    RISCV_ISA_EXT_DATA(zihintpause),
>> -    RISCV_ISA_EXT_DATA(zihpm),
>> -    RISCV_ISA_EXT_DATA(zba),
>> -    RISCV_ISA_EXT_DATA(zbb),
>> -    RISCV_ISA_EXT_DATA(zbs),
>> -    RISCV_ISA_EXT_DATA(smaia),
>> -    RISCV_ISA_EXT_DATA(smstateen),
>> -    RISCV_ISA_EXT_DATA(ssaia),
>> -    RISCV_ISA_EXT_DATA(sstc),
>> -    RISCV_ISA_EXT_DATA(svade),
>> -    RISCV_ISA_EXT_DATA(svpbmt),
>> +const struct riscv_isa_ext_entry riscv_isa_ext[] = {
> 
> ... is there a reason for this to be non-static? Its type (struct
> riscv_isa_ext_entry) is local to this file, and I also can't spot any
> declaration elsewhere.

I checked downstream changes and it also local to cpufeature.c file so 
it should be static.

> 
>> @@ -480,6 +495,74 @@ bool riscv_isa_extension_available(const unsigned long *isa_bitmap,
>>       return test_bit(id, isa_bitmap);
>>   }
>>   
>> +int build_guest_isa_str(char *buf, size_t size,
>> +                        const unsigned long *isa_bitmap)
>> +{
>> +    char *p = buf;
>> +    size_t left = size;
>> +    int total;
>> +
>> +#if defined(CONFIG_RISCV_32)
>> +    total = snprintf(p, left, "rv32");
>> +#elif defined(CONFIG_RISCV_64)
>> +    total = snprintf(p, left, "rv64");
>> +#else
>> +# error "Unsupported RISC-V bitness"
>> +#endif
> 
> For the longer-term future of this, passing in const struct domain * may
> help.

pointer to const struct domain looks really better I chnage prototype of 
build_guest_isa_str().

> 
>> +    if ( total < 0 )
>> +        return total;
>> +
>> +    if ( buf )
>> +    {
>> +        if ( (size_t)total >= left )
>> +            return -ENOSPC;
>> +
>> +        p += total;
>> +        left -= total;
>> +    }
>> +
>> +    for ( unsigned int i = 0; i < ARRAY_SIZE(riscv_isa_ext); i++ )
>> +    {
>> +        const struct riscv_isa_ext_entry *ext = &riscv_isa_ext[i];
>> +        int ret;
>> +
>> +        if ( !riscv_isa_extension_available(isa_bitmap, ext->id) )
>> +            continue;
>> +
>> +        ret = snprintf(p, left, "%s%s",
>> +                       ext->id >= RISCV_ISA_EXT_BASE ? "_" : "",
>> +                       ext->name);
>> +        if ( ret < 0 )
>> +            return ret;
>> +
>> +        total += ret;
>> +
>> +        if ( buf )
>> +        {
>> +            if ( (size_t)ret >= left )
>> +                return -ENOSPC;
>> +
>> +            p += ret;
>> +            left -= ret;
>> +        }
>> +    }
>> +
>> +    return total;
>> +}
>> +
>> +void init_guest_isa(struct domain *d)
>> +{
>> +    for ( unsigned int i = 0; i < ARRAY_SIZE(riscv_isa_ext); i++ )
>> +    {
>> +        const struct riscv_isa_ext_entry *ext = &riscv_isa_ext[i];
>> +
>> +        if ( ext->guest_supported &&
>> +             riscv_isa_extension_available(NULL, ext->id) )
>> +            __set_bit(ext->id, d->arch.isa);
>> +    }
>> +}
> 
> Right now what this function does is dependent on only global variables.
> IOW each guest gets the same bitmap. Is this going to change soon?

At the moment, we don't have a use case where domain has unique bitmap. 
But IIRC correctly we agreed that generally it is good idea to have isa 
bitmap per domain and let the use to chose.

  Else
> why not calculate that bitmap once, taking the same shortcut as you take
> elsewhere for the time being?

static __ro_after_init DECLARE_BITMAP(guest_isa, RISCV_ISA_EXT_MAX);

/* called once from riscv_fill_hwcap() or similar */
void __init init_guest_isa_mask(void)
{
     for ( unsigned int i = 0; i < ARRAY_SIZE(riscv_isa_ext); i++ )
         if ( riscv_isa_ext[i].guest_supported &&
              riscv_isa_extension_available(NULL, riscv_isa_ext[i].id) )
             __set_bit(riscv_isa_ext[i].id, guest_isa);
}

void init_guest_isa(struct domain *d)   /* called per-domain */
{
     bitmap_copy(d->arch.isa, guest_isa, RISCV_ISA_EXT_MAX);
}

Do you mean something like that?

  Then allowing riscv_isa_ext[] to remain
> __initconst (should really have been __initconstrel).

I think you explained me already why but I forgot. Could you please 
remind me again why __initconstrel should be here? Is it because of 
pointers used inside struct riscv_isa_ext_entry?

Thanks.

~ Oleksii

