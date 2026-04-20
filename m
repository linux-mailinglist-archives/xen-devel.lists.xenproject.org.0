Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFneBaU55ml6tgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 16:35:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A9842D368
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 16:35:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286170.1567278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEpiB-00026T-KY; Mon, 20 Apr 2026 14:34:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286170.1567278; Mon, 20 Apr 2026 14:34:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEpiB-000253-Hp; Mon, 20 Apr 2026 14:34:55 +0000
Received: by outflank-mailman (input) for mailman id 1286170;
 Mon, 20 Apr 2026 14:34:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wEpiA-00024x-Ft
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 14:34:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEpi9-000SbR-Dr
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 16:34:53 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e63987-bab6-0a2a0a5309dd-0a2a450ccf6c-20
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 16:34:53 +0200
Received: from [209.85.208.170] (helo=mail-lj1-f170.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e6398d-62f1-0a2a450c0019-d155d0aac876-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 16:34:53 +0200
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-38e936caafeso31291361fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 07:34:53 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38ecb6f0b4csm24136611fa.25.2026.04.20.07.34.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2026 07:34:51 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1776695692; x=1777300492; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yGerrtdiKfKE1Lf1Wj24fpjgZCYfn5lyPyZwqwWoSbU=;
        b=K6VI0/UixtQlQhdvIUxe7fECVVMw/6fSv6JaA5SaOQSD2buXStoVE6J0J1+nJbTVB1
         Jvb8jDSc2CfDXymYkc88GfUDRv2Z8iHekIDUhy1MMOuNnQq1nwkODNN4XtYRij+vJLMR
         GXPh6FEUCAuQ98gnwEU/PO6HUXmJ34NDYuRklbYoZRgaIJkEVIhT/5hmIudw58d+qCE9
         RzFpcuaLnQNsdby6UFh2cDhgyraoaHdr7Lit+PRy3NXyVqnYToSBfuUxO4vEVPQxPQ40
         miQHGJff7LtgemjdOa3rmvR/j9NevJ/Sw9obLyNP8nKOl0hDHtyR39rXtayqBHjpDRfM
         PV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776695692; x=1777300492;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yGerrtdiKfKE1Lf1Wj24fpjgZCYfn5lyPyZwqwWoSbU=;
        b=NmlwThb5ahXg+GhDG6280M4qMMlytfMeg04kZ02JbZWNiJlvmvYFQOrjlZ8mHLsthY
         yKOQwUZZ9Z1Yo2wBhmR2BU+AHMHROFv1LKp0X7WCH3eLJlwANc1VNVnjIEljs6FcmsgH
         zdtomniElGW2xEMCNbOKNi3Gx7pMGcPOw0Mm2Tbox0cUgwnGicIIGVRTbM4YjIa7VPht
         6xLE9GR0/tyILKWzMCfs41xbLq2LKt9S8VCpUvm2ndtj6Loibcpb5Y6aGTsnoPX5LYju
         06plsfSbOSm8+N0vJ4YPRxJhZz31/Hs0InHH3BP3i6yo1An8Qv5sNfCsq6CZRXV5JhpG
         h+qA==
X-Forwarded-Encrypted: i=1; AFNElJ8NUWbBQLkrvPGLhG0M0jdjAfokwIlsrQrECPQMYOSskwazOC1T0wY629IGuqHvj0Z3U4LRiy5Qh+8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxFPSI2CVrIAErn6d/jcO+zilLy5/my5pKmIY0rHwvVqtbqafY+
	dtwU4W4G+DUJofRXgfN2Mx4CUXhQN15tds/DIPJa9LDrIm2DTxacFRGU
X-Gm-Gg: AeBDievy3NZFbdcl79Ll6oTTUSElcpA439fNB1hAxVdmvEG9P0LW2rVCRio1eHETgIv
	SNpVPtUgDhTFlyMmMEM3IisjR1Ew4Vg7jZQPle9O8kwA/bT3C65E0x0J7i5/k72ctIDZJ0KPjf/
	dyToQprVb4t71rwuIjhhIlFnt4dFx/pGjBPd6BTmC8uKhVobWjgdxlhujEJ6jZ2o6+Ijv9ht5zM
	g8pM5h0Ax1z7XXOTWFJepoc+JtTvmLDELbbzIwZfEtu0VJ171JaXts3vowIPfNIeObWzwqN13Tc
	2oFhCwbGNlLDARFuy43z+836r9ta2KvFnbAkxTrgSnTW+mGkOkYrZJRHq15ElCIvLUT65hZQQCe
	ZKKW5yMOB8VncPXMYD35XB44BQ1LuW2JWpE/axKIROMvxrnAST83IZGJw80TaP4hvYACOw8CFW7
	dcWQGyu2tuIaZjVOxcufME6JGDcYpRIm2XrAmxornVUou7E5jgTitKZvhDtFPsA4+MKSbJGEUo9
	PBr3KXb95WhgA==
X-Received: by 2002:a05:651c:b27:b0:38e:ac6:a50f with SMTP id 38308e7fff4ca-38ec7830e46mr46683641fa.10.1776695692202;
        Mon, 20 Apr 2026 07:34:52 -0700 (PDT)
Message-ID: <7c059a67-3f3f-4633-aebb-939aa9ac7955@gmail.com>
Date: Mon, 20 Apr 2026 16:34:50 +0200
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <09a260ca-5a98-461d-9f57-d298a483d3d6@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1776695693-6F370CF5-EC2E2962/10/73395122804
X-purgate-type: spam
X-purgate-size: 5993
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
	NEURAL_HAM(-0.00)[-1.000];
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
X-Rspamd-Queue-Id: 78A9842D368
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/20/26 3:45 PM, Jan Beulich wrote:
> On 20.04.2026 13:39, Oleksii Kurochko wrote:
>> On 4/16/26 2:51 PM, Jan Beulich wrote:
>>> On 14.04.2026 13:29, Oleksii Kurochko wrote:
>>>> On 4/2/26 2:22 PM, Jan Beulich wrote:
>>>>> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>>>>>> +int vaplic_map_device_irqs_to_domain(struct domain *d,
>>>>>> +                                     struct dt_device_node *dev,
>>>>>> +                                     bool need_mapping,
>>>>>> +                                     struct rangeset *irq_ranges)
>>>>>> +{
>>>>>> +    unsigned int i, nirq;
>>>>>> +    int res, irq;
>>>>>> +    struct dt_raw_irq rirq;
>>>>>> +    uint32_t *auth_irq_bmp = d->arch.vintc->private;
>>>>>> +    unsigned int reg_num;
>>>>>> +
>>>>>> +    nirq = dt_number_of_irq(dev);
>>>>>> +
>>>>>> +    /* Give permission and map IRQs */
>>>>>> +    for ( i = 0; i < nirq; i++ )
>>>>>> +    {
>>>>>> +        res = dt_device_get_raw_irq(dev, i, &rirq);
>>>>>> +        if ( res )
>>>>>> +        {
>>>>>> +            printk(XENLOG_ERR "Unable to retrieve irq %u for %s\n",
>>>>>> +                   i, dt_node_full_name(dev));
>>>>>> +            return res;
>>>>>> +        }
>>>>>> +
>>>>>> +        /*
>>>>>> +         * Don't map IRQ that have no physical meaning
>>>>>> +         * ie: IRQ whose controller is not APLIC/IMSIC/PLIC.
>>>>>> +         */
>>>>>> +        if ( rirq.controller != dt_interrupt_controller )
>>>>>> +        {
>>>>>> +            dt_dprintk("irq %u not connected to primary controller."
>>>>>> +                       "Connected to %s\n", i,
>>>>>> +                       dt_node_full_name(rirq.controller));
>>>>>> +            continue;
>>>>>> +        }
>>>>>> +
>>>>>> +        irq = platform_get_irq(dev, i);
>>>>>> +        if ( irq < 0 )
>>>>>> +        {
>>>>>> +            printk("Unable to get irq %u for %s\n", i, dt_node_full_name(dev));
>>>>>> +            return irq;
>>>>>> +        }
>>>>>> +
>>>>>> +        res = irq_permit_access(d, irq);
>>>>>> +        if ( res )
>>>>>> +        {
>>>>>> +            printk(XENLOG_ERR "Unable to permit to %pd access to IRQ %u\n", d,
>>>>>> +                   irq);
>>>>> This time the other way around: %d please with plain int. (Again at least
>>>>> once further down.)
>>>>>
>>>>>> +            return res;
>>>>>> +        }
>>>>>> +
>>>>>> +        reg_num = irq / APLIC_NUM_REGS;
>>>>>> +
>>>>>> +        if ( is_irq_shared_among_domains(d, irq) )
>>>>>> +        {
>>>>>> +            printk("%s: Shared IRQ isn't supported\n", __func__);
>>>>>> +            return -EINVAL;
>>>>>> +        }
>>>>>> +
>>>>>> +        auth_irq_bmp[reg_num] |= BIT(irq % APLIC_NUM_REGS, U);
>>>>> ... all of this leaves me with the impression that IRQ numbering isn't really
>>>>> virtualized. IRQs are merely split into groups, one group per domain (and
>>>>> maybe some unused). How are you going to fit in truly virtual IRQs?
>>>> What do you mean by truly virtual IRQs?
>>> Ones where no aspects are represented by any piece of hardware.
>>>
>>>> I can't totally agree that the current approach isn't use virtual IRQs,
>>>> yes, they are 1:1 mapped but on the other side Xen is responsible to
>>>> give an IRQ number for guest's device and Xen is responsible that guest
>>>> isn't trying to reach IRQ which not belongs to it.
>>> In a non-virtualized environment I expect IRQs are going to be "sparse"
>>> (i.e. with perhaps large blocks of items used elsewhere). If you had
>>> proper translation of IRQ numbers, the same could be true for your
>>> guests.
>> Partial FDT, which is used to tell which device be passthroughed to
>> guest, is using physical IRQ number (which I am just considering for
>> simplicity to be 1:1 mapped to virtual IRQ number). So if we have the
>> following configuration:
>>     Physical (bare-metal) IRQ layout is sparse:
>>       IRQ 5  → UART -> domU0
>>       IRQ 23 → Ethernet -> domU1
>>       IRQ 47 → PCIe -> domU0
>>       IRQ 100 → Storage -> domU1
>> (gaps everywhere, driven by hardware wiring)
>>
>> For such configuration we will have for each domain auth_irq_bmp[] which
>> contains:
>>    IRQ 5 and IRQ47 for domU0
>> and
>>    IRQ 23 and IRQ 100 for domU1
>>
>> And here vIRQ5 = pIRQ5, vIRQ47 = pIRQ47 and so on. auth_irq_bmp just
>> transform xIRQ number to bit position which it will have in real APLIC
>> register. Just as an example, lets take vIRQ5 and vIRQ47.
>>
>> As reading or writing register setie[k] reads or potentially modifies
>> the enable bits for interrupt sources k × 32 through k × 32 + 31. For an
>> implemented interrupt source i within that range, the enable bit for
>> source i corresponds with register bit (i mod 32).
>> So for:
>>    - vIRQ5 == pIRQ5 we have to set bit 5 in setie[0]
>>    - vIRQ47 == pIRQ47 we have to set bit 15 in setie[1]
>>
>> Probably it was not the best idea to declare auth_irq_bmp as it will
>> look in h/w and maybe just 'bool auth_irq_bmp[1024]' would be more clearer.
>>
>> So irqs number are still stay "sparsed" in guest.
> Well, twice (or more) as sparse in the example you give, compared to the
> host.

Just to be sure that I fully understand your concern here.

The difference between xIRQ5 and xIRQ47 is 42 bits (if for 1 irq we are 
using 1 bit) which leads to that we have somewhere allocated 48 bit 
bitmap where only two bits will be set, all others will be zero.
Instead it would be better to have to do mapping: pIRQ5 -> vIRQ1, pIRQ47 
->vIRQ2, right?
If yes, won't we still store somewhere this mapping? it seems like 
having 'unsigned int auth_irq_bmp[1024]' is a good option where index 
will be vIRQ number and 'unsigned int' will be pIRQ number. But at the 
moment I think that we could go with 1:1 IRQ number mapping and then 
have 'bool auth_irq_bmp[1024]' will be more then enough and will safe 
some memory.

~ Oleksii


