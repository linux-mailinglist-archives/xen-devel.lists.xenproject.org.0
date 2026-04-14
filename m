Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEC9NIQH3mlRmQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 11:23:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0CA3F7D65
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 11:23:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1281510.1564398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCZz6-0003e5-I3; Tue, 14 Apr 2026 09:23:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281510.1564398; Tue, 14 Apr 2026 09:23:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCZz6-0003bl-FL; Tue, 14 Apr 2026 09:23:04 +0000
Received: by outflank-mailman (input) for mailman id 1281510;
 Tue, 14 Apr 2026 09:23:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wCZz4-0003bf-KI
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 09:23:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCZz4-008mOs-05
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 11:23:02 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69de076e-e002-0a2a0a5209dd-0a2a450b9aba-44
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 11:23:01 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69de0775-bca8-0a2a450b0019-d1558032d943-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 11:23:01 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4852b81c73aso50445035e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 02:23:01 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488ede1e050sm61093025e9.5.2026.04.14.02.23.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Apr 2026 02:23:00 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:Content-Language:References:Cc:To:Subject:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776158581; x=1776763381; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gyW1eNfX7+FHuCieG0wIqF5U3m34SVn5rEwevC5SNFQ=;
        b=mz5nbcFvR2ky6PaaPsNicNpO99AweKfZC7MF/aouf8jhZ2EMSyVVDPmjcdyUSXKBfA
         U0ddVKil1I/u+SOn4Nn7ivf/f5LC3wPITtC+i/Mxcv1HQuiuGaXQJ7/+HEi+ZsIyS3/C
         I8GR+9+LSk9EjG40iJ+ibulK9WaGKjumkSifJXr//VqmSEjm0L+QhXPYTFvWLrsrsYP5
         2Bmh3H5wBLpIsWqi3E4M2N+YZ+gI1un3EN0cyDXbq9isaDnXHtjIoPdyaLkojf2iowv5
         /lD/L8yYBaoAuyBlR4KXyixcROrNe0eFb5ZYuWcVEpPh4Wxg6UngS18JmU0neKN82ter
         Qw3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776158581; x=1776763381;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gyW1eNfX7+FHuCieG0wIqF5U3m34SVn5rEwevC5SNFQ=;
        b=YCOVRb8axZOdq9wVwpbEwmPyuYGlvZxF4pBCMuaO6Sq0HV1RtBSkK80meTHvoReWVO
         44330ivmxxogkoyucLkFwSSsrwfI2CuVaJ1h0E8cDrD4NCv//+e5wjK6TfJkO5tL9WgM
         jj5uhBZMAmsUBFt7CfFzh1/GADBXg2tE4fzztQLFf8h9HFtgvQDrtXY7uys8vqOwa0sQ
         OOoCz79LacXowMKTosfKXCvObxJ3rGxzehPLIEAIeGDeccTGeDS/eXuWdK7lli8ECNXf
         7vc2qtDy/0iZug/+ZkTOnVhY0j32mhLAV2KIZek9cANb25k9IJCWOFob0RDRLK+J+7ru
         /j6A==
X-Forwarded-Encrypted: i=1; AFNElJ/SAnPOCC8hpZPkC2q+pY98xY5kTU9rQxw83SVdvQp5Axk4jb7NB3Xd4ETCjNh8sjIOM/tPg5i+HGE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyQTglzXUfSy8u3avI+jFVCQIESgD9QAFSeBnlKwVG3pVRMqsaW
	TG4bCoALO53rpx7JkXIjyOEX/j1vTvXqiQRN/lNBFGALiLHtg0K/Yd3Q
X-Gm-Gg: AeBDievpj8AhxH98ukhPUN2hwyNCx9oYT7TbxmVK1tzkwF9sL2p7qA32Iv76Opofd+e
	7AtbQPu5PiZVLvavRTD7SL7EFdEdLcV7o1PsobpEpWDrkpg4kj9VYY4kx1yI6xrHC878iw+jI3m
	sPa3Hk/reQnhRZUUksZ21TeNsTvVoHB7jF82mwrcgxcQ01dMnm44Z5c0CYvSFukxqk2vf274GwV
	Wm+mDBcXlsYIcRn16LL0dhm1yydYj52dkDCkjpav4ug903YdYcYKvrK5mQRmPdZxOg98ymASOv7
	KgfbARTmfEy5Vr3oJKleq1ogW/RxVU6+3IndCz9GNAvQV0HLUImeSgMOLPjUlqgK2cObj7CrVHP
	Su0EeVxVecc9vJFotgAWwg1rBKJwzGG0Ew02OcE6pMf7ufPtPm00Vub4zWSwb6xTJx4FhK1MALb
	7LavmqKEE9F5SYAw2a/WTze7x7wNXYZgewm1on4ExGJDcxNVdCf9uhL1VfBLwsc3aUbDmeap/It
	3nb33mfDHd89GDUhRtAv2e4
X-Received: by 2002:a05:600c:8b38:b0:488:be58:bb77 with SMTP id 5b1f17b1804b1-488d6890ee3mr206590465e9.30.1776158581098;
        Tue, 14 Apr 2026 02:23:01 -0700 (PDT)
Message-ID: <2f555a8b-d058-41ca-80f8-ce3dc08edfbe@gmail.com>
Date: Tue, 14 Apr 2026 11:22:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v1 14/27] xen/riscv: introduce per-vCPU IMSIC state
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <8196fa8f000e384af697a44cb3d50ece966e82a7.1773157782.git.oleksii.kurochko@gmail.com>
 <1f5e262d-da1f-49a2-8e89-87fb714e51bf@suse.com>
Content-Language: en-US
In-Reply-To: <1f5e262d-da1f-49a2-8e89-87fb714e51bf@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1776158581-F67C42A1-C14602A6/10/73395122804
X-purgate-type: spam
X-purgate-size: 5476
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3A0CA3F7D65
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/2/26 1:31 PM, Jan Beulich wrote:
> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>> Each vCPU interacting with the IMSIC requires state to track the
>> associated guest interrupt file and its backing context.
>>
>> Introduce a per-vCPU structure to hold IMSIC-related state, including
>> the guest interrupt file identifier and the CPU providing the backing
>> VS-file. Access to the guest file identifier is protected by a lock.
>>
>> Initialize this structure during vCPU setup and store it in arch_vcpu.
>> The initial state marks the VS-file as software-backed until it becomes
>> associated with a physical CPU.
>>
>> Add helpers to retrieve and update the guest interrupt file identifier.
> 
> Yet again a functions with no callers.

They will be called in follow-up patches.


> 
>> --- a/xen/arch/riscv/imsic.c
>> +++ b/xen/arch/riscv/imsic.c
>> @@ -59,6 +59,29 @@ do {                            \
>>       csr_clear(CSR_SIREG, v);    \
>>   } while (0)
>>   
>> +unsigned int vcpu_guest_file_id(const struct vcpu *v)
>> +{
>> +    struct imsic_state *imsic_state = v->arch.imsic_state;
>> +    unsigned long flags;
>> +    unsigned int vsfile_id;
>> +
>> +    read_lock_irqsave(&imsic_state->vsfile_lock, flags);
>> +    vsfile_id = imsic_state->guest_file_id;
>> +    read_unlock_irqrestore(&imsic_state->vsfile_lock, flags);
> 
> What purpose does this locking have? Already ...
> 
>> +    return vsfile_id;
> 
> ... here the value can be stale, if indeed there is a chance of races.
> Did you perhaps mean to use ACCESS_ONCE() here and where the value is
> set?

ACCESS_ONCE() isn't guarantee only compiler re-ordering (as basically it 
is just volatile-related stuff inisde the macros)?

Generally, I think that that guest_file_id is needed to be updated only 
during migration of vCPU from one pCPU to another and I expect that 
during this migration vCPU isn't active, so no one will want to read 
imsic_state->guest_file_id. But on the other hand, there is:
   bool imsic_has_interrupt(const struct vcpu *vcpu)
   {
   ...
     /*
      * The IMSIC SW-file directly injects interrupt via hvip so
      * only check for interrupt when IMSIC VS-file is being used.
      */

     read_lock_irqsave(&imsic_state->vsfile_lock, flags);
     if ( imsic_state->vsfile_pcpu != NR_CPUS )
         ret = !!(csr_read(CSR_HGEIP) & BIT(imsic_state->guest_file_id, 
UL));
     read_unlock_irqrestore(&imsic_state->vsfile_lock, flags);
   ...
   }
which I think could be called in parallel with with migration, so then 
still lock are needed.

> 
>> @@ -315,6 +338,25 @@ static int imsic_parse_node(const struct dt_device_node *node,
>>       return 0;
>>   }
>>   
>> +int __init vcpu_imsic_init(struct vcpu *v)
> 
> __init for a function involved in setting up a vCPU?

Yes, it will be used during creationg of a vCPU.

> 
>> +{
>> +    struct imsic_state *imsic_state;
>> +
>> +    /* Allocate IMSIC context */
>> +    imsic_state = xvzalloc(struct imsic_state);
>> +    if ( !imsic_state )
>> +        return -ENOMEM;
>> +
>> +    v->arch.imsic_state = imsic_state;
>> +
>> +    /* Setup IMSIC context  */
>> +    rwlock_init(&imsic_state->vsfile_lock);
>> +
>> +    imsic_state->guest_file_id = imsic_state->vsfile_pcpu = NR_CPUS;
> 
> Iirc Misra dislikes such double assignments, so better avoid them right away.
> (As per a comment at the bottom this may need splitting anyway.)
> 
>> --- a/xen/arch/riscv/include/asm/domain.h
>> +++ b/xen/arch/riscv/include/asm/domain.h
>> @@ -52,6 +52,8 @@ struct arch_vcpu {
>>   
>>       struct vtimer vtimer;
>>   
>> +    struct imsic_state *imsic_state;
> 
> Just like it's "vtimer", perhaps also "vimsic_state" for both the field
> and the struct tag?

Makes sense. Lets rename this field and tag.

> 
>> @@ -64,8 +65,20 @@ struct imsic_config {
>>       spinlock_t lock;
>>   };
>>   
>> +struct imsic_state {
>> +    /* IMSIC VS-file */
>> +    rwlock_t vsfile_lock;
>> +    unsigned int guest_file_id;
>> +    /*
>> +     * (vsfile_pcpu >= 0) => h/w IMSIC VS-file
>> +     * (vsfile_pcpu == NR_CPUS) => s/w IMSIC SW-file
>> +     */
>> +    unsigned long vsfile_pcpu;
> 
> And why unsigned long, when unsigned int will do (as about everywhere else
> for CPU numbers)? That'll also shrink the structure size by 8 bytes.

Originally, IIRC mhartid register is unsigned long, so potentially we 
could have amount of pCPU up to what fit into unsigned long.

But know I see that AIA limits amount of pCPUs to 16,384 harts. So we 
could really use unsigned int here.

> 
> As to the comment - as per vcpu_imsic_init() NR_CPUS also has some special
> meaning for guest_file_id, yet there's no comment there. How do file ID and
> NR_CPUS fit together anyway?

Agree, it looks incorrect. I tried to avoid introduction of "#define 
GIELEN_MAX 64".
As an option I can use UINT_MAX as init value for guest_file_id or even 
better just use 0 as it basically means that SW-file should be used.

The idea is that if s/w IMSIC SW-file is used that it doesn't sit on any 
pCPU, so we should have some marker to show that and NR_CPUS should be fine.

As a result guest_file_id should be init-ed with 0 (and it will be by 
default as xvzalloc() is used for allocation) and ->vsfile_pcpu inits 
with NR_CPUS. Also, I will add a comment above guest_file_id.

Thanks.

~ Oleksii

