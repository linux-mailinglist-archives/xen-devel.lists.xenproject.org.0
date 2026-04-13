Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAsOFdUA3Wk3YwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 16:42:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF15C3ED696
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 16:42:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1281209.1564224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCIUN-0000BQ-UZ; Mon, 13 Apr 2026 14:42:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281209.1564224; Mon, 13 Apr 2026 14:42:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCIUN-00008n-Rk; Mon, 13 Apr 2026 14:42:11 +0000
Received: by outflank-mailman (input) for mailman id 1281209;
 Mon, 13 Apr 2026 14:42:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wCIUL-00008f-Oh
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 14:42:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCIUL-007xxU-0x
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 16:42:09 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69dd00b7-e002-0a2a0a5209dd-0a2a4503ab10-36
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 16:42:09 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69dd00c0-02b3-0a2a45030019-d155dd31ad4b-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 16:42:08 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-43cfd832155so3053691f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 07:42:08 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63e4f16bsm32154771f8f.26.2026.04.13.07.42.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Apr 2026 07:42:07 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1776091328; x=1776696128; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UWQxix9XwXVkNsiA1TuF2NjYBhksRbXlSi5koezn3RU=;
        b=OzB6k2www+iZsWBTDKg80WSwH5GLpU9HTKHPA5xdwE6cQNqII1lyt12NZQcYKkpk+t
         CLbB53aVzd4QGOIAFD49NLHws2CQROVZG/KIdYCBcbqqroZ/5Nzc6yUarOhAeGP6OaOP
         dZWchkiGYrFWQE5ESI3b+v1fIiMjGNHu+VNwOQKlcFYV2SyvqY3lW0JIK216w63cwaYE
         Rj/svC84A+tC05vgSjxp3W0xRYrne3+aPtarm0OirmcrYom+Vdk52ildx89ICpXJzeIY
         4kcAmd2n2JcwkrUGltkLA/2zEt9cYiYAUFFpmRU4n94CBxNCec3kDVla7Sz1QbyE/5R9
         +NYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776091328; x=1776696128;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UWQxix9XwXVkNsiA1TuF2NjYBhksRbXlSi5koezn3RU=;
        b=s+v/6kVCtteXmPXdb7fIde3diCXWxOV1actbP5BUxnXP2TfzsUIImdNrtJlcji0HS7
         lKXOZJmuoOKn/+2/lknbmS+FU6UIeCC+1SzYBZx5RycKSGb6b/j7tDZ1vq9aQ8xtd3I4
         crI9euPrGAJshZbrJhjcjWieQz2NOPo8/+89YbLncgAfJgnLAG9LxQJribbq7WyqsSkw
         uyMOCLWvv6djlf0mWyhL7Ni4MFPdzvtooYfC9u0mE54sJ0U+DcuR/5kyt0FEeOXCIxZF
         1YMGgh0FfYkk8lJvbiye2daJunoelIw3zMKc9YczVha99Wl+4gn7RX+xzglXOqdmvuGU
         rjrQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Zfe09FfOohgdEDJJHUDRlUZfpPHY/vZqDE9y/6bZlonVHocdyFfnqoGkuwJ2lhRj8dJ+5Y9oTvvI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxpiGiVEc9QyvurU7em5d/zJomW2jCLpK/zy7dnE26ma3akXmWA
	9sL7d3UmcZiGKZfdWinWz7017a5cpC4hwve3SqH1+6DGd3WylGcugEPN
X-Gm-Gg: AeBDies1gc2Rin6Dd/3Zav6HkD3SkOfXzKU00h/RCaskoPM37JPtQjFPfviayhYnbiI
	eioMgwsBQvR6olaSxBzwKNwBS61EUp83zhKgESxp3rv17rDoCJib2SLYOyEJ4Wpjwe8tNnQ03Qp
	JpJb1uKuqDcVgOdSG0DuDf3syyquMPbr3zAniJOTu43HPOC2WvX18UQe+NnS9ocQVbkvUTBDkUQ
	LsBZ6s8ab+ecS3TN7iIUO34DX7E+2i0M6bTxy9P1LRMir3sN64jfskGRUnTgzmLGEa03MXwXsFP
	DTjJVW4wqkPZvbG3WDcjL7NRt4RS9cRNM3LYonT0Xu0YB+Nl9yZsS5h1rf+87FAym0TrDc5Z1BV
	Z76IQf0FWM99inJ0VMNmiwRm/5jdj8uc8A5xDDtH4rvPpduVf2gd1Z4yGd3FHourpxLE8IW00nh
	w6MUfJAbwjOIBcqOdO5HsdxFnURifyEi5Gv+msFQ/tmxYfvFZEAI3dhfHxbU7SSY3zL4xnabo7T
	FY=
X-Received: by 2002:a5d:4b92:0:b0:43d:7ea8:62e6 with SMTP id ffacd0b85a97d-43d7ea86390mr134899f8f.46.1776091328040;
        Mon, 13 Apr 2026 07:42:08 -0700 (PDT)
Message-ID: <4b977410-8d24-41c3-9c83-7d95637ddea3@gmail.com>
Date: Mon, 13 Apr 2026 16:42:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v1 13/27] xen/riscv: add basic VGEIN management for AIA
 guests
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
 <f358325514c91c540e0edf992ca51414a1964fe0.1773157782.git.oleksii.kurochko@gmail.com>
 <09fed304-685c-46a9-9159-72baa1721224@suse.com>
Content-Language: en-US
In-Reply-To: <09fed304-685c-46a9-9159-72baa1721224@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1776091328-4251AC9A-0314A617/10/73395122804
X-purgate-type: spam
X-purgate-size: 11852
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: AF15C3ED696
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/2/26 12:03 PM, Jan Beulich wrote:
> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>> AIA provides a hardware-accelerated mechanism for delivering external
>> interrupts to domains via "guest interrupt files" located in IMSIC.
>> A single physical hart can implement multiple such files (up to GEILEN),
>> allowing several virtual harts to receive interrupts directly from hardware
> 
> Isn't use of such an optimization coming prematurely? Shouldn't this series
> focus on getting basic functionality in place?

At the moment, we don't support only APLIC for guest interrupts as it 
will require trap-and-emulation approach, so just from the start it was 
decided to go with APLIC+IMSIC (IMSIC here as it only one interrupt 
controller which exist and support VGEIN stuff at the momemnt) approach 
and then when it will be needed back to only the case when APLIC is 
supported.

Maybe, it was better to introduce in patch series where a lauching of 
domain actually happens.

Considering that you've already made a review, I prefer then to have 
this patch part of this patch series.

> 
>> --- a/xen/arch/riscv/aia.c
>> +++ b/xen/arch/riscv/aia.c
>> @@ -1,11 +1,24 @@
>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>   
>> +#include <xen/bitmap.h>
>>   #include <xen/errno.h>
>>   #include <xen/init.h>
>>   #include <xen/sections.h>
>> +#include <xen/sched.h>
>> +#include <xen/spinlock.h>
>>   #include <xen/types.h>
>> +#include <xen/xvmalloc.h>
>>   
>> +#include <asm/aia.h>
>>   #include <asm/cpufeature.h>
>> +#include <asm/csr.h>
>> +#include <asm/current.h>
>> +
>> +/*
>> + * Bitmap for each physical cpus to detect which VS (guest)
>> + * interrupt file id was used.
>> + */
>> +DEFINE_PER_CPU(struct vgein_bmp, vgein_bmp);
> 
> Why can this not be static? All management looks to be in this same file.

It could be, it couldn't be before when I have vgein/hgei interrupt 
handler in traps but after I decided to move it to aia.c, it looks like 
it is fine to make it static.

> 
>> @@ -14,12 +27,109 @@ bool aia_available(void)
>>       return is_aia_available;
>>   }
>>   
>> +int __init vgein_init(unsigned int cpu)
> 
> If this needs invoking once per CPU being brought up, it can't be __init.

Yes, it is going to be called inside the secondary CPU bring-up function.

__init sections are removed much later, after all CPUs are brought up, 
so it looks like that at the moment when secondary CPUs are being 
brought up, __init still exists and can be called.

> 
> Also - static?

It isn't static because it will be called inside the secondary CPU 
bring-up function.

> 
>> +{
>> +    struct vgein_bmp *vgein = &per_cpu(vgein_bmp, cpu);
>> +
>> +    csr_write(CSR_HGEIE, -1UL);
>> +    vgein->geilen = flsl(csr_read(CSR_HGEIE));
>> +    csr_write(CSR_HGEIE, 0);
>> +    if ( vgein->geilen )
>> +        vgein->geilen--;
> 
> I don't understand this. The "len" in "geilen" stands for "length", I suppose,
> i.e. the number of bits. Hmm, the spec itself is inconsistent: "The number of
> bits implemented in hgeip and hgeie for guest external interrupts is UNSPECIFIED
> and may be zero. This number is known as GEILEN." This may or may not include
> bit 0 (which is implemented, but r/o zero). Then saying "Hence, if GEILEN is
> nonzero, bits GEILEN:1 shall be writable in ..." suggests 0 isn't included, but
> that's not unambiguous.

But they explicitly wrote that: The least-significant bits are 
implemented first, apart from bit 0. So bit 0 is explicitly excluded.

> 
> Anyway, may I suggest
> 
>      vgein->geilen = flsl(csr_read(CSR_HGEIE) >> 1);
> 
> instead?

It would be really better.

> 
>> +    BUG_ON(!vgein->geilen);
> 
> You can return (an error, but see the respective remark on the earlier patch),
> no need to crash the system. That return may want to come after the printk()
> below, though.
> 
>> +    printk("cpu%d.geilen=%d\n", cpu, vgein->geilen);
> 
> As before - %u please with unsigned int.
> 
>> +    if ( !vgein->bmp )
> 
> Why would this check be needed?
> 
>> +    {
>> +        vgein->bmp = xvzalloc_array(unsigned long, BITS_TO_LONGS(vgein->geilen));
> 
> With the determination above, isn't BITS_TO_LONGS(vgein->geilen) ==
> BITS_PER_LONG in all cases? Surely you don't mean to runtime-allocate
> space for a single unsigned long? So I wonder is the dimension used
> is wrong.

Hm, I can't remember why I did so. You are right there is no any sense 
to allocate a single unsinged long in runtime...

> 
> If it isn't, dynamically allocating the owners array may be more
> useful, as (on RV64) occupies a fixed 512 bytes right now.

Agree, it make sense it will be much less memory if to allocate like:
     vgein->owners = xvzalloc_array(struct vcpu *, vgein->geilen);
     if ( !vgein->owners )
         return -ENOMEM;

as maximum value of vgein->geilen is 63.

> 
>> +        if ( !vgein->bmp )
>> +            return -ENOMEM;
>> +    }
>> +
>> +    spin_lock_init(&vgein->lock);
>> +
>> +    return 0;
>> +}
>> +
>>   int __init aia_init(void)
>>   {
>> +    int rc = 0;
>> +
>>       if ( !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ssaia) )
>>           return -ENODEV;
>>   
>> +    if ( (rc = vgein_init(0)) )
>> +        return rc;
>> +
>>       is_aia_available = true;
> 
> Ah, this answers a question of mine on the earlier patch: This boolean
> indicates more than just the extension being available. But why does
> the description there not simply say so? How am I as a reviewer supposed
> to know?

I relised that it is worse to mention that only when saw your reply in 
the earlier patch, I will update the commit message for convience.

> 
>> -    return 0;
>> +    return rc;
>> +}
>> +
>> +unsigned int vgein_assign(struct vcpu *v)
>> +{
>> +    unsigned int vgein_id;
>> +
> 
> Seemingly undue blank line.
> 
>> +    struct vgein_bmp *vgein_bmp = &per_cpu(vgein_bmp, v->processor);
>> +    unsigned long *bmp = vgein_bmp->bmp;
>> +    unsigned long flags;
>> +
>> +    spin_lock_irqsave(&vgein_bmp->lock, flags);
>> +    vgein_id = bitmap_weight(bmp, vgein_bmp->geilen);
> 
> How can the ID to use be the number of bits which are set? This only works
> if all set bits are contiguous at the bottom.

Oh, it is really wrong. find_first_zero_bit() should be instead or
vgein_id = find_next_zero_bit(bmp, vgein_bmp->geilen + 1, 1);

> 
>> +    /*
>> +     * All vCPU guest interrupt files are used and we don't support a case
>> +     * when number of vCPU on 1 pCPU is bigger then geilen.
>> +     */
> 
> This wants checking in vgein_init() then. CPUs (beyond the boot one)
> violating this should not be brought online.

It'll be nice. But we can't know how many vCPUs will be ran on pCPU when 
vgein_init() is executed.

> 
>> +    ASSERT(vgein_id < vgein_bmp->geilen);
> 
> What if not bit is available? By asserting, you assume the caller will not
> call here when no ID is available.

It is just a temporary ASSERT() (as we don't support software guest 
interrupt files) because in general it is fine if there is no bit 
available, it will just mean that that no physical hardware guest 
interrupt file is assigned to the virtual hart, and software-based 
emulation (a "software file") must be used to handle guest external 
interrupts.

Will it be better to return 0 now here and just don't create a vCPU
on ...

  Yet there is no caller of this function,
> so how can one verify whether this assertion is appropriate?

... the caller side when an assignment is expected to be happen?


> 
>> +    bitmap_set(bmp, vgein_id, 1);
> 
> __set_bit()?

I thought that it will be fine to use for bmp, bitmap_* functions(). 
__set_bit is what is called inside bitmap_set().


> 
>> +    spin_unlock_irqrestore(&vgein_bmp->lock, flags);
>> +
>> +    /*
>> +     * The vgein_id shouldn't be zero, as it will indicate that no guest
>> +     * external interrupt source is selected for VS-level external interrupts
>> +     * according to RISC-V priviliged spec:
>> +     *   8.2.1 Hypervisor Status Register (hstatus) in RISC-V priviliged spec:
> 
> Please avoid section numbers in such references. The section of this name
> in the version I'm looking at is 21.2.1.
> 
>> +     *   The VGEIN (Virtual Guest External Interrupt Number) field selects
>> +     *   a guest external interrupt source for VS-level external interrupts.
>> +     *   VGEIN is a WLRL field that must be able to hold values between zero
>> +     *   and the maximum guest external interrupt number (known as GEILEN),
>> +     *   inclusive.
>> +     *   When VGEIN=0, no guest external interrupt source is selected for
>> +     *   VS-level external interrupts.
>> +     */
>> +    vgein_id++;
> 
> Related to my comment regarding GEILEN, this shouldn't be necessary. Keep
> bits in their natural positions, and simply avoid using bit 0 (either by
> setting it during init and then never clearing it, or by starting the
> scan for clear bits at bit 1).
> 
>> +#ifdef VGEIN_DEBUG
>> +    printk("%s: %pv: vgein_id(%u), xen_cpu%d_bmp=%#lx\n",
>> +           __func__, v, vgein_id, v->processor, *bmp);
>> +#endif
>> +
>> +    vcpu_guest_cpu_user_regs(v)->hstatus &= ~HSTATUS_VGEIN;
>> +    vcpu_guest_cpu_user_regs(v)->hstatus |=
>> +        MASK_INSR(vgein_id, HSTATUS_VGEIN);
> 
> When is this function going to be invoked? (As before, not knowing this is
> one of the problems with introducing functions with no callers.)

vgein_assign() function is going to be invoked during the call of 
arch_vcpu_create().

I also thought to make vgein_assign() just work with vgein_id and just 
return vgein_id and fill v->hstatus on the caller side. It looks a 
little bit cleaner from some point of view.
It is still need to return vgein_id as it is needed for IMSIC's guest 
interrupt file address calculation.

> 
>> +    return vgein_id;
>> +}
>> +
>> +void vgein_release(struct vcpu *v, unsigned int vgen_id)
>> +{
>> +    unsigned long flags;
>> +
> 
> Another seemingly stray blank line.
> 
>> +    struct vgein_bmp *vgein_bmp = &per_cpu(vgein_bmp, v->processor);
>> +
>> +    spin_lock_irqsave(&vgein_bmp->lock, flags);
>> +    bitmap_clear(vgein_bmp->bmp, vgen_id - 1, 1);
> 
> __clear_bit()?
> 

The same as with bitmap_set() as ->bmp is bitmap I expect that 
bitmap_*() functions should be used. But just to avoid extra if() inside 
bitmap_clear(), I will use __clear_bit().

>> +    spin_unlock_irqrestore(&vgein_bmp->lock, flags);
>> +
>> +#ifdef VGEIN_DEBUG
>> +    printk("%s: vgein_id(%u), xen_cpu%d_bmp=%#lx\n",
>> +           __func__, vgen_id, v->processor, *vgein_bmp->bmp);
> 
> I can't spot a difference from the message in vgein_assign(). How is one
> to distinguish the two in a log?

By function name which is the first argument (__func__).

> 
>> --- a/xen/arch/riscv/include/asm/aia.h
>> +++ b/xen/arch/riscv/include/asm/aia.h
>> @@ -3,8 +3,26 @@
>>   #ifndef ASM__RISCV__AIA_H
>>   #define ASM__RISCV__AIA_H
>>   
>> +#include <xen/percpu.h>
>> +#include <xen/spinlock.h>
>> +
>> +struct vcpu;
>> +
>> +struct vgein_bmp {
> 
> What does the _bmp suffix indicate here? There's ...
> 
>> +    unsigned long *bmp;
> 
> ... a bitmap field, yes, but ...
> 
>> +    spinlock_t lock;
>> +    struct vcpu *owners[BITS_PER_LONG];
>> +    unsigned int geilen;
>> +};
> 
> ... the structure as a whole has quite a bit more.

Agree, there is no any sense for _bmp. It would be better to use _ctrl.

Also, I will move this struct to aia.c. Then it also make sense to 
rename vgein_vmp variable just to vgein.

Thanks.

~ Oleksii

