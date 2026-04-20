Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eXLlB5AQ5mlrrAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 13:40:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D877429FC2
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 13:39:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1285679.1566797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEmyG-0003Fv-6Z; Mon, 20 Apr 2026 11:39:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1285679.1566797; Mon, 20 Apr 2026 11:39:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEmyG-0003DN-3E; Mon, 20 Apr 2026 11:39:20 +0000
Received: by outflank-mailman (input) for mailman id 1285679;
 Mon, 20 Apr 2026 11:39:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wEmyD-0003DH-SE
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 11:39:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEmyC-008Anl-PA
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 13:39:16 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e61064-5cb7-0a2a0a5109dd-0a2a4504a77e-0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 13:39:16 +0200
Received: from [209.85.167.42] (helo=mail-lf1-f42.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e61064-1dec-0a2a45040019-d155a72aec71-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 13:39:16 +0200
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5a3d1561e38so2480556e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 04:39:16 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a41abceab0sm2582324e87.61.2026.04.20.04.39.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2026 04:39:15 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1776685156; x=1777289956; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C7WH5RB37VbaOAQsw1+nhyAoELWOLdDaJV5kjaGDq/s=;
        b=PaF/nUVqmovTlPcHW82rHfF8YF3/ODVF4EVIbgJQPQe8wYj4oEYVaYF92Gg7GHguis
         MKD1RkX/o963JLuUDzAhGkXBuBfMBYS9CozVmr39DxmVqioNeD1YFDGwVFP3FZ4ki0ui
         44tfZVskRVysOjkYWr2eZDSJImb3C+5Mg11vXLpMDEj6NjWmZmiAC6e+oknzkEPEy1vl
         QgnrEE1Qe5228Erj43zLdL0ZMTaRjX1mHjnaBK5kP6CHC8G5LAWkePR8Kd5CtQ7ZDkT1
         ScHXO1ucTqG9uZyw2GhicKLfB85+MEZq5sBVkuTH0WWIACZ41pRPJ6aaAOfRb9cbMBj2
         7LNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776685156; x=1777289956;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C7WH5RB37VbaOAQsw1+nhyAoELWOLdDaJV5kjaGDq/s=;
        b=Bjoi7Qjc7NI1LywP2bkpdEZJlZJ3TJQFdKa5FtpWpxebY7cdQe6XbayO/RujOevJbZ
         UyJYNnAf7GwEggNBl3eLY2IFA1LpzMIZRvUc5tTZGg84OzH/cyZgyGB38qpw24tRQydk
         BQktnhgAm169LcoOx5KMnHYIOTqApeRiDTLYgcsoZNZ9uICcQwSbv4MUjygK5ptafhMI
         pUM8XQQWFOmeO/oLNbj/gU/hRImEyRj6nfSN6Beq06RNOroY33e1OO/Ndymng9KmczrE
         ncDWeKYp608oFn82jq/SPKE9oltZSLEheTZTVYnvoj6IpFQEPOZgCDfd0sRpTtCyQThR
         djMw==
X-Forwarded-Encrypted: i=1; AFNElJ+xs0uJ4EuWSSPzjpZbGkiSRSw1gr9Cu5ynfBsNTd08aXPw6MgHzhC9wXCfciGOVgj1LPiWX3v9pTs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YynHa/MSN+jzs9y63jBFN45hxijmBvXMTJELS9w0YmPk+DiQ11e
	SXTilMQ4QzoMe4DpXePdr2p3mX3P6h6HAA3zCELXXxm0cIyxfdMaXsyf
X-Gm-Gg: AeBDietkX2j37JGYsbgJTxSLtDBESl8WbvuuZxGr+SJj/eDa6ySxJ4jR5hsfUuwwD4D
	8R1b7Z2KT9peH9yy4fI6H3Jqxltz+cC6583VFMS7B9idejzWLtW+rm1tRk76pNNejJeS/wdx+35
	MPi7AKmJDzxhqPJqejXrihRzjiltcRn9oGsfwOZ1VhywnnBT78peaeiBUa3xvVvkySAAx6pSiB7
	wLNZXo3JipmkgOdI4YRCDTl0DH7dYM9aUupaPWEaT6EpSZUEG7Xb8tP7RFcEVwQWIGpCfw0+Hsv
	Ksact+C7vuyM3mv5astQ3Gw2/rQZ5yG+UTA7ulwguOYNH8vw0NF2BLFRbYxdg6ZK5XtKFYvDo6E
	cS+2AQlWvd35yunn+QGgubyIWuiOBwePJsiuzAB7xCoUk6bV+LBjOt+vYpdtSt5bpzhy4SE+aBq
	/PgZ7f+m0kvMu0PfExRri87qSkQ9yfRAR4ZLCcU3SGSm8od0GkPEx3aZ/qDDhgxpQgMQ390qUWU
	psBNdcgcUmSbQ==
X-Received: by 2002:a05:6512:ace:b0:5a2:c914:8af7 with SMTP id 2adb3069b0e04-5a4172bb914mr3998047e87.5.1776685155446;
        Mon, 20 Apr 2026 04:39:15 -0700 (PDT)
Message-ID: <00fa439d-0327-4c0c-960d-a810820a6e83@gmail.com>
Date: Mon, 20 Apr 2026 13:39:13 +0200
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <a7a4e8c9-d053-4ca7-ac9c-f43ddccf9151@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1776685156-30C473FF-7E1304AF/10/73395122804
X-purgate-type: spam
X-purgate-size: 9356
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
X-Rspamd-Queue-Id: 6D877429FC2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/16/26 2:51 PM, Jan Beulich wrote:
> On 14.04.2026 13:29, Oleksii Kurochko wrote:
>> On 4/2/26 2:22 PM, Jan Beulich wrote:
>>> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>>>> --- a/xen/arch/riscv/include/asm/setup.h
>>>> +++ b/xen/arch/riscv/include/asm/setup.h
>>>> @@ -5,6 +5,10 @@
>>>>    
>>>>    #include <xen/types.h>
>>>>    
>>>> +struct domain;
>>>> +struct dt_device_node;
>>>> +struct rangeset;
>>>> +
>>>>    #define max_init_domid (0)
>>>>    
>>>>    void setup_mm(void);
>>>> @@ -13,6 +17,19 @@ void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
>>>>    
>>>>    void init_csr_masks(void);
>>>>    
>>>> +/* TODO: move somewhere to common header? */
>>>
>>> Counter question: Why ...
>>>
>>>> +/*
>>>> + * Retrieves the interrupts configuration from a device tree node and maps
>>>> + * those interrupts to the target domain.
>>>> + *
>>>> + * Returns:
>>>> + *   < 0 error
>>>> + *   0   success
>>>> + */
>>>> +int map_device_irqs_to_domain(struct domain *d, struct dt_device_node *dev,
>>>> +                              bool need_mapping,
>>>> +                              struct rangeset *irq_ranges);
>>>
>>> ... is this not an inline function, when ...
>>>
>>>> --- a/xen/arch/riscv/intc.c
>>>> +++ b/xen/arch/riscv/intc.c
>>>> @@ -79,3 +79,11 @@ int __init intc_make_domu_dt_node(const struct kernel_info *kinfo)
>>>>    
>>>>        return -ENOSYS;
>>>>    }
>>>> +
>>>> +int map_device_irqs_to_domain(struct domain *d, struct dt_device_node *dev,
>>>> +                              bool need_mapping,
>>>> +                              struct rangeset *irq_ranges)
>>>> +{
>>>> +    return d->arch.vintc->ops->map_device_irqs_to_domain(d, dev, need_mapping,
>>>> +                                                         irq_ranges);
>>>> +}
>>>
>>> ... it's merely a wrapper around an indirect function call? And then the
>>> function isn't used anywhere anyway.
>>
>> It is used by dom0less common code and it is a wrapper because Arm has
>> different implementation and Arm doesn't have
>> map_device_irqs_to_domain() in its virtual interrupt controller operations.
> 
> But the question wasn't why this is a wrapper, but why this wrapper isn't an
> inline function.

Got you, it could be really inline.

> 
>>>> +int vaplic_map_device_irqs_to_domain(struct domain *d,
>>>> +                                     struct dt_device_node *dev,
>>>> +                                     bool need_mapping,
>>>> +                                     struct rangeset *irq_ranges)
>>>> +{
>>>> +    unsigned int i, nirq;
>>>> +    int res, irq;
>>>> +    struct dt_raw_irq rirq;
>>>> +    uint32_t *auth_irq_bmp = d->arch.vintc->private;
>>>> +    unsigned int reg_num;
>>>> +
>>>> +    nirq = dt_number_of_irq(dev);
>>>> +
>>>> +    /* Give permission and map IRQs */
>>>> +    for ( i = 0; i < nirq; i++ )
>>>> +    {
>>>> +        res = dt_device_get_raw_irq(dev, i, &rirq);
>>>> +        if ( res )
>>>> +        {
>>>> +            printk(XENLOG_ERR "Unable to retrieve irq %u for %s\n",
>>>> +                   i, dt_node_full_name(dev));
>>>> +            return res;
>>>> +        }
>>>> +
>>>> +        /*
>>>> +         * Don't map IRQ that have no physical meaning
>>>> +         * ie: IRQ whose controller is not APLIC/IMSIC/PLIC.
>>>> +         */
>>>> +        if ( rirq.controller != dt_interrupt_controller )
>>>> +        {
>>>> +            dt_dprintk("irq %u not connected to primary controller."
>>>> +                       "Connected to %s\n", i,
>>>> +                       dt_node_full_name(rirq.controller));
>>>> +            continue;
>>>> +        }
>>>> +
>>>> +        irq = platform_get_irq(dev, i);
>>>> +        if ( irq < 0 )
>>>> +        {
>>>> +            printk("Unable to get irq %u for %s\n", i, dt_node_full_name(dev));
>>>> +            return irq;
>>>> +        }
>>>> +
>>>> +        res = irq_permit_access(d, irq);
>>>> +        if ( res )
>>>> +        {
>>>> +            printk(XENLOG_ERR "Unable to permit to %pd access to IRQ %u\n", d,
>>>> +                   irq);
>>>
>>> This time the other way around: %d please with plain int. (Again at least
>>> once further down.)
>>>
>>>> +            return res;
>>>> +        }
>>>> +
>>>> +        reg_num = irq / APLIC_NUM_REGS;
>>>> +
>>>> +        if ( is_irq_shared_among_domains(d, irq) )
>>>> +        {
>>>> +            printk("%s: Shared IRQ isn't supported\n", __func__);
>>>> +            return -EINVAL;
>>>> +        }
>>>> +
>>>> +        auth_irq_bmp[reg_num] |= BIT(irq % APLIC_NUM_REGS, U);
>>>
>>> ... all of this leaves me with the impression that IRQ numbering isn't really
>>> virtualized. IRQs are merely split into groups, one group per domain (and
>>> maybe some unused). How are you going to fit in truly virtual IRQs?
>>
>> What do you mean by truly virtual IRQs?
> 
> Ones where no aspects are represented by any piece of hardware.
> 
>> I can't totally agree that the current approach isn't use virtual IRQs,
>> yes, they are 1:1 mapped but on the other side Xen is responsible to
>> give an IRQ number for guest's device and Xen is responsible that guest
>> isn't trying to reach IRQ which not belongs to it.
> 
> In a non-virtualized environment I expect IRQs are going to be "sparse"
> (i.e. with perhaps large blocks of items used elsewhere). If you had
> proper translation of IRQ numbers, the same could be true for your
> guests.

Partial FDT, which is used to tell which device be passthroughed to 
guest, is using physical IRQ number (which I am just considering for 
simplicity to be 1:1 mapped to virtual IRQ number). So if we have the 
following configuration:
   Physical (bare-metal) IRQ layout is sparse:
     IRQ 5  → UART -> domU0
     IRQ 23 → Ethernet -> domU1
     IRQ 47 → PCIe -> domU0
     IRQ 100 → Storage -> domU1
(gaps everywhere, driven by hardware wiring)

For such configuration we will have for each domain auth_irq_bmp[] which 
contains:
  IRQ 5 and IRQ47 for domU0
and
  IRQ 23 and IRQ 100 for domU1

And here vIRQ5 = pIRQ5, vIRQ47 = pIRQ47 and so on. auth_irq_bmp just 
transform xIRQ number to bit position which it will have in real APLIC 
register. Just as an example, lets take vIRQ5 and vIRQ47.

As reading or writing register setie[k] reads or potentially modifies 
the enable bits for interrupt sources k × 32 through k × 32 + 31. For an 
implemented interrupt source i within that range, the enable bit for 
source i corresponds with register bit (i mod 32).
So for:
  - vIRQ5 == pIRQ5 we have to set bit 5 in setie[0]
  - vIRQ47 == pIRQ47 we have to set bit 15 in setie[1]

Probably it was not the best idea to declare auth_irq_bmp as it will 
look in h/w and maybe just 'bool auth_irq_bmp[1024]' would be more clearer.

So irqs number are still stay "sparsed" in guest.

> 
>>>> +        dt_dprintk("  - IRQ: %u\n", irq);
>>>> +
>>>> +        if ( irq_ranges )
>>>> +        {
>>>> +            res = rangeset_add_singleton(irq_ranges, irq);
>>>> +            if ( res )
>>>> +                return res;
>>>> +        }
>>>
>>> What is irq_ranges?
>>
>> IIUC based on Arm code irq_ranges is an optional output accumulator, the
>> caller allocates and passes it in when it needs to track which IRQs were
>> mapped (overlay use case), or passes NULL when that tracking is not needed.
>>
>> I added here as map_device_irqs_to_domain() is called from the common
>> code and so maybe one day someone will decide to pass irq_ranges to this
>> functions. At the moment, for RISC-V it is the only one user of
>> map_device_irqs_to_domain() and it passes NULL.
> 
> Simply assert then that it's NULL?

Won't BUG_ON() be better here as it BUG_ON() macros is always defined 
and doesn't matter if release or debug build are used.

Or maybe you meant:
  if ( irq_ranges )
      assert_failed("irq_ranges arg isn't supported\n");

> 
>>>> @@ -34,6 +142,7 @@ static int __init cf_check vcpu_vaplic_init(struct vcpu *v)
>>>>    
>>>>    static const struct vintc_ops vaplic_ops = {
>>>>        .vcpu_init = vcpu_vaplic_init,
>>>> +    .map_device_irqs_to_domain = vaplic_map_device_irqs_to_domain,
>>>>    };
>>>
>>> What about the inverse function, needed for domain cleanup?
>>
>> I planned to add it when it will be really needed. At the momemnt, I
>> don't have such use cases.
> 
> I.e. if any domain needs re-starting, the entire system needs rebooting?
> Recall that "dom0less" is slightly misleading a name, as it only allows
> there to not be a Dom0. One can be there, and hence re-starting a crashed
> domain ought to be possible. For that, you need to correctly clean up
> after the crashed one.

I haven't investigated yet what will be code path to do a reboot or 
re-start crashed domain but based on an implementation of 
vaplic_map_device_irqs_to_domain() as nothing is allocated there and 
filling of auth_irq_bmp[] is happening there which will stay the same 
after reboot if it is just re-used or it will be allocated new one if 
crashed domain will just recreate this domain from scratch. So it seems 
like it is enough to have only map_device_irqs_to_domain().

~ Oleksii


