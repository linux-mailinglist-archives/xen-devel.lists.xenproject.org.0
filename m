Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mO1KB9lG5mk+uAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 17:31:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3A142E41E
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 17:31:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286257.1567359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEqat-0006Lz-KX; Mon, 20 Apr 2026 15:31:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286257.1567359; Mon, 20 Apr 2026 15:31:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEqat-0006Jj-HP; Mon, 20 Apr 2026 15:31:27 +0000
Received: by outflank-mailman (input) for mailman id 1286257;
 Mon, 20 Apr 2026 15:31:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wEqas-0006Jd-FY
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 15:31:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEqar-004Loq-SS
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 17:31:25 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e646bc-5cb7-0a2a0a5109dd-0a2a450b804c-28
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 17:31:25 +0200
Received: from [209.85.167.45] (helo=mail-lf1-f45.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e646cc-212f-0a2a450b0019-d155a72db453-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 17:31:24 +0200
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5a2c9c5ff87so3911448e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 08:31:24 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a4185bc361sm3017934e87.32.2026.04.20.08.31.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2026 08:31:23 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1776699084; x=1777303884; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1gsn2fGUbxj/GyR8As0n22UpdKesWNO+TEi8vIw1i5s=;
        b=hWOgxveAvx5pIYzqKDC1UAfe1z69X6xU7PGeOMRnGfP68soPr7YajJ3yd0NNSPSyHY
         /u6x+LkENXXffIa/vRRo/b9UuR+F4Qk1YQbmDu87Dv8DLnz16RMd0FnJ2V2/u34q0T62
         +ncYg3cIqDnGLsKLMUdTdaozhZG9A88TmNA+T+PqkX5FSiMhA9JVBOSGGX3rIfMWrBsq
         vLmx4/FWIWkS7pPjayilJNIrJ6CzeWgXDpe+VEKsQh7CoYRZ6IWuUE7vnM/m809QzjOj
         4aMuUaqo2eTOtYMlb64nNIJMEQQJqZaZ3qGPxmMmS54u3esMoiwSNONLcEE0vO810hjU
         PE8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776699084; x=1777303884;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1gsn2fGUbxj/GyR8As0n22UpdKesWNO+TEi8vIw1i5s=;
        b=EWPHujPU9daAUoSf5nPENgPFRoTaZQxaJ08jdVm3UXq2MRP6xjjpY3GK/2YOZrXaN/
         SxPe94BFPSvUGYRpVZu+5KBo9NZatBs9lN2H7WKoRdGHD9nZQ+k4ln/h1vSpwW8bro0G
         YiBgu/aoCQzXvzP7q90jj6V0RcYWhCKexBkP8QiUcupHqjTa1aBFSCr8H2CRBZcvHZep
         +RqX+d0ygZw3XQKjTrlbA6cKkzXxD0ECxzLI5ay1FAOVWP5C8ZXsmpqkftAnTH90nH1x
         vTxF+Fs6UVT19v1teBThtUFg8cFT7IrqEMK6fQ0myHqJbXPPwgmWziQeMig02va9tO3N
         LGxg==
X-Forwarded-Encrypted: i=1; AFNElJ8Z7t/AqnXufse9+H+cDyLx3eKXTysSNiwzKQMoWtCVgLi3wBqBAmwIRc4JKqkRHnlpIefBr2QmfVo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyHNPohB67h0NnVc5IIBE705HtEK4npBQeIxAs9eZUj0iCls6m+
	lyistn3EHlmR20AqOuvdinf0Ntc3OrSqQJbW6rPIOYVf0VGn1R0Qe+D0
X-Gm-Gg: AeBDievIygYzXQ+oMKC4Bb2cIWZc7dWvcTIIBjmm12jnnzDCNqANKh1x4bIzq0QtSxC
	IUNG0zZWkpZ2KMEms1WcX09H0Wk9Eik8XUPf1iybLpdyjF5C9hC7i7LowTiPTaWljBraweDf/mR
	PKQW5gD9SIrLxgOJoxQ0TYHxDo069ViNC7b8eD2WNwuIcTyXUTIoskHjDGrvopwVXT0YlbMfWsb
	uyAkb14bgA6MkdcfVgKMBhqCt6m0if/BH1ZFs2KaIBGZCkPXPahxLRWTnyUGcJfrUvWOm0+b4YQ
	H+NVluREQndeDDWW1aJhVCexregwD8y55ONkL/45hooQLjJf6POf8aG3gSuOmgGJMajtatKYvPP
	9E5hzjpB7kgC/EpWRLCY5oce08yegnW9gHpDJbH2AUmqQLLm6L+hm0Z13ARg+x4gWYOm5QL/jS4
	1Me942+f2irJAbALSwMYLTCH24FrVk1RQxEmKGJOeGVcrp7/QgqewkqU6MYgBCAxAvhgxPLAvqQ
	p5Uh+4tuA5oAg==
X-Received: by 2002:a05:6512:3b91:b0:5a4:9a7:7e66 with SMTP id 2adb3069b0e04-5a4172faa04mr5449547e87.45.1776699083601;
        Mon, 20 Apr 2026 08:31:23 -0700 (PDT)
Message-ID: <6042263f-49e5-4139-978f-38cb10769c0e@gmail.com>
Date: Mon, 20 Apr 2026 17:31:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 16/27] xen/riscv: implement IRQ mapping for device
 passthrough
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
 <10654a6c38fa929b5fdf6f214badfe4f60fe78d4.1773157782.git.oleksii.kurochko@gmail.com>
 <8a8a2afd-6f53-4f45-b8c8-fb34a6fbb970@suse.com>
 <f099b925-0ea9-43a7-b760-f70f343a4d7c@gmail.com>
 <a7a4e8c9-d053-4ca7-ac9c-f43ddccf9151@suse.com>
 <00fa439d-0327-4c0c-960d-a810820a6e83@gmail.com>
 <09a260ca-5a98-461d-9f57-d298a483d3d6@suse.com>
 <7c059a67-3f3f-4633-aebb-939aa9ac7955@gmail.com>
 <0ccf093f-cc2a-4729-bf8f-b39bf73fd202@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <0ccf093f-cc2a-4729-bf8f-b39bf73fd202@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1776699084-7D76AF3B-389658C6/10/73395122804
X-purgate-type: spam
X-purgate-size: 7430
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
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7C3A142E41E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/20/26 5:21 PM, Jan Beulich wrote:
> On 20.04.2026 16:34, Oleksii Kurochko wrote:
>>
>>
>> On 4/20/26 3:45 PM, Jan Beulich wrote:
>>> On 20.04.2026 13:39, Oleksii Kurochko wrote:
>>>> On 4/16/26 2:51 PM, Jan Beulich wrote:
>>>>> On 14.04.2026 13:29, Oleksii Kurochko wrote:
>>>>>> On 4/2/26 2:22 PM, Jan Beulich wrote:
>>>>>>> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>>>>>>>> +int vaplic_map_device_irqs_to_domain(struct domain *d,
>>>>>>>> +                                     struct dt_device_node *dev,
>>>>>>>> +                                     bool need_mapping,
>>>>>>>> +                                     struct rangeset *irq_ranges)
>>>>>>>> +{
>>>>>>>> +    unsigned int i, nirq;
>>>>>>>> +    int res, irq;
>>>>>>>> +    struct dt_raw_irq rirq;
>>>>>>>> +    uint32_t *auth_irq_bmp = d->arch.vintc->private;
>>>>>>>> +    unsigned int reg_num;
>>>>>>>> +
>>>>>>>> +    nirq = dt_number_of_irq(dev);
>>>>>>>> +
>>>>>>>> +    /* Give permission and map IRQs */
>>>>>>>> +    for ( i = 0; i < nirq; i++ )
>>>>>>>> +    {
>>>>>>>> +        res = dt_device_get_raw_irq(dev, i, &rirq);
>>>>>>>> +        if ( res )
>>>>>>>> +        {
>>>>>>>> +            printk(XENLOG_ERR "Unable to retrieve irq %u for %s\n",
>>>>>>>> +                   i, dt_node_full_name(dev));
>>>>>>>> +            return res;
>>>>>>>> +        }
>>>>>>>> +
>>>>>>>> +        /*
>>>>>>>> +         * Don't map IRQ that have no physical meaning
>>>>>>>> +         * ie: IRQ whose controller is not APLIC/IMSIC/PLIC.
>>>>>>>> +         */
>>>>>>>> +        if ( rirq.controller != dt_interrupt_controller )
>>>>>>>> +        {
>>>>>>>> +            dt_dprintk("irq %u not connected to primary controller."
>>>>>>>> +                       "Connected to %s\n", i,
>>>>>>>> +                       dt_node_full_name(rirq.controller));
>>>>>>>> +            continue;
>>>>>>>> +        }
>>>>>>>> +
>>>>>>>> +        irq = platform_get_irq(dev, i);
>>>>>>>> +        if ( irq < 0 )
>>>>>>>> +        {
>>>>>>>> +            printk("Unable to get irq %u for %s\n", i, dt_node_full_name(dev));
>>>>>>>> +            return irq;
>>>>>>>> +        }
>>>>>>>> +
>>>>>>>> +        res = irq_permit_access(d, irq);
>>>>>>>> +        if ( res )
>>>>>>>> +        {
>>>>>>>> +            printk(XENLOG_ERR "Unable to permit to %pd access to IRQ %u\n", d,
>>>>>>>> +                   irq);
>>>>>>> This time the other way around: %d please with plain int. (Again at least
>>>>>>> once further down.)
>>>>>>>
>>>>>>>> +            return res;
>>>>>>>> +        }
>>>>>>>> +
>>>>>>>> +        reg_num = irq / APLIC_NUM_REGS;
>>>>>>>> +
>>>>>>>> +        if ( is_irq_shared_among_domains(d, irq) )
>>>>>>>> +        {
>>>>>>>> +            printk("%s: Shared IRQ isn't supported\n", __func__);
>>>>>>>> +            return -EINVAL;
>>>>>>>> +        }
>>>>>>>> +
>>>>>>>> +        auth_irq_bmp[reg_num] |= BIT(irq % APLIC_NUM_REGS, U);
>>>>>>> ... all of this leaves me with the impression that IRQ numbering isn't really
>>>>>>> virtualized. IRQs are merely split into groups, one group per domain (and
>>>>>>> maybe some unused). How are you going to fit in truly virtual IRQs?
>>>>>> What do you mean by truly virtual IRQs?
>>>>> Ones where no aspects are represented by any piece of hardware.
>>>>>
>>>>>> I can't totally agree that the current approach isn't use virtual IRQs,
>>>>>> yes, they are 1:1 mapped but on the other side Xen is responsible to
>>>>>> give an IRQ number for guest's device and Xen is responsible that guest
>>>>>> isn't trying to reach IRQ which not belongs to it.
>>>>> In a non-virtualized environment I expect IRQs are going to be "sparse"
>>>>> (i.e. with perhaps large blocks of items used elsewhere). If you had
>>>>> proper translation of IRQ numbers, the same could be true for your
>>>>> guests.
>>>> Partial FDT, which is used to tell which device be passthroughed to
>>>> guest, is using physical IRQ number (which I am just considering for
>>>> simplicity to be 1:1 mapped to virtual IRQ number). So if we have the
>>>> following configuration:
>>>>      Physical (bare-metal) IRQ layout is sparse:
>>>>        IRQ 5  → UART -> domU0
>>>>        IRQ 23 → Ethernet -> domU1
>>>>        IRQ 47 → PCIe -> domU0
>>>>        IRQ 100 → Storage -> domU1
>>>> (gaps everywhere, driven by hardware wiring)
>>>>
>>>> For such configuration we will have for each domain auth_irq_bmp[] which
>>>> contains:
>>>>     IRQ 5 and IRQ47 for domU0
>>>> and
>>>>     IRQ 23 and IRQ 100 for domU1
>>>>
>>>> And here vIRQ5 = pIRQ5, vIRQ47 = pIRQ47 and so on. auth_irq_bmp just
>>>> transform xIRQ number to bit position which it will have in real APLIC
>>>> register. Just as an example, lets take vIRQ5 and vIRQ47.
>>>>
>>>> As reading or writing register setie[k] reads or potentially modifies
>>>> the enable bits for interrupt sources k × 32 through k × 32 + 31. For an
>>>> implemented interrupt source i within that range, the enable bit for
>>>> source i corresponds with register bit (i mod 32).
>>>> So for:
>>>>     - vIRQ5 == pIRQ5 we have to set bit 5 in setie[0]
>>>>     - vIRQ47 == pIRQ47 we have to set bit 15 in setie[1]
>>>>
>>>> Probably it was not the best idea to declare auth_irq_bmp as it will
>>>> look in h/w and maybe just 'bool auth_irq_bmp[1024]' would be more clearer.
>>>>
>>>> So irqs number are still stay "sparsed" in guest.
>>> Well, twice (or more) as sparse in the example you give, compared to the
>>> host.
>>
>> Just to be sure that I fully understand your concern here.
>>
>> The difference between xIRQ5 and xIRQ47 is 42 bits (if for 1 irq we are
>> using 1 bit) which leads to that we have somewhere allocated 48 bit
>> bitmap where only two bits will be set, all others will be zero.
> 
> Why 48-bit bitmap? As you inherit the property from the host, it'll be e.g.
> 1024 bits. Compared to the host, each guest will have yet fewer bits set in
> there.

48-bit bitmap specifically in this example because IRQ47 is the highest 
mentioned here, so if we won't compress zeros between IRQ0-4 and IRQ6-46 
it will be needed 48-bit to cover IRQs from IRQ0 to IRQ47. I thought 
about that as it seems like I misunderstood what you mean by "sparsed in 
guest" and the way how I have to deal with that.

> 
>> Instead it would be better to have to do mapping: pIRQ5 -> vIRQ1, pIRQ47
>> ->vIRQ2, right?
> 
> Which specific mapping I don't care very much. There may also be conventions
> to adhere to (on x86 for example there are).

If just bitmap is okay here ... then I am okay with using it.

> 
>> If yes, won't we still store somewhere this mapping? it seems like
>> having 'unsigned int auth_irq_bmp[1024]' is a good option where index
>> will be vIRQ number and 'unsigned int' will be pIRQ number. But at the
>> moment I think that we could go with 1:1 IRQ number mapping and then
>> have 'bool auth_irq_bmp[1024]' will be more then enough and will safe
>> some memory.
> 
> Well, if using 1:1 mapping was clearly identified as "for the time being",
> then that might be acceptable (for the time being).
> 
> As to you (again) suggesting "bool auth_irq_bmp[1024]" - why would you use
> an array of bool-s when a bitmap can do the same in 1/8th of the space?

... just bitmap will better.

Thanks.

~ Oleksii

