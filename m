Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jT15DxeKIWrCIQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 16:22:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D554640CCC
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 16:22:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=PKna+1K4;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1327933.1592617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV8wb-0001M4-Sc; Thu, 04 Jun 2026 14:21:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327933.1592617; Thu, 04 Jun 2026 14:21:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV8wb-0001JQ-Pl; Thu, 04 Jun 2026 14:21:13 +0000
Received: by outflank-mailman (input) for mailman id 1327933;
 Thu, 04 Jun 2026 14:21:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wV8wa-0001JK-UA
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 14:21:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV8wa-001lIp-0v
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 16:21:12 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a2189cb-5cb7-0a2a0a5109dd-0a2a450bc5b4-24
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 16:21:11 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a2189d7-212f-0a2a450b0019-d155dd34d14c-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 16:21:11 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-46019b190b6so617840f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 07:21:11 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f34413csm16365680f8f.21.2026.06.04.07.21.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2026 07:21:10 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780582871; x=1781187671; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FcH4qN9D31BjNUk/uOBK+MmqYSc/pf9UxEHjvzOWjcs=;
        b=PKna+1K45Qcgg+b3FCvYtb/sZUArlDxfjsyLvSFLH4G30DLYH2R4I1LtfI9oL1faAa
         cUI03IGNM7FOWtWAAbg0uy8mbK+pU8hNZsPCvd9Y4pihsgQQyl5JB2gOy2WFLc/GkInb
         VrVRB0gYWIM4tVPI5jlKL3Aw3aXpwx88P1ie5rttepDY25uaGH2Oq3wIpm572Saczzsm
         b752aBrKaDOpAoRiicBzvu2pORu58GiJwg4FHWbka4+OQYKxLHmAalbPDqQSeuKuahte
         wt+cvXRozwQEX3GWyz00t1m9KCnndCaspAL6mHwu86xQkjcU+8572WGKpSVnFtAbIbFw
         /ijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780582871; x=1781187671;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FcH4qN9D31BjNUk/uOBK+MmqYSc/pf9UxEHjvzOWjcs=;
        b=RknpMnuQ/j1esaY1ZSKy/CMdzBUvRXP4jDLPRPqnbHBaD3RPgMQqrxZJ4lfg4kLFP0
         gmcY4ALj1YkFlwfTAez+arPSHWXwWU4ZcraCMNpaKJ/+KaHrh1zwQfhPLtH4wg08tViO
         fg74y5qvbGyZjWBSK+sOGLMoI7tH1V/NlOn3dS2Abeze3XbXYSzO6qypZKtLKfk726+U
         hiXY3h4tbe86cr/bRPkL9IJNG+UDMv5Wk1u/iS6jxR3NwLuO7xAEvTtl4AsVsImTZoHJ
         Qj6HJF8eDlGXaURqkvdclfyfuBlgz6BewbYDM/0VzWxhPXqLZqhYBcuoJ9nU3BWLNzzB
         6tgQ==
X-Forwarded-Encrypted: i=1; AFNElJ+9OibzxHS8j/arHS/f747bwshEM/z4StiIYL+poJDbcnWxeOeD7z4AY5QSLhhAtN952Tx4o8izZyk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyG1k0PRda4nzoZERah389hePC3JO3AwH0rNNC10MVAIr6/j3Lu
	59w42s6SLKzCEoCRGFimWL4tPLjtunivDSnNa7bmVRtQpNUtLMtLsNEL
X-Gm-Gg: Acq92OGYiFIjMcafNS2EcMIy1qz4vG7XgsQyiXBcnWNzin2cC1BUZvLh5hpfbDvV675
	HCmfH1d8DFbKg9aSse6arlPDi66BZQDZfLAEFMRQD0LXTkmnKsw6+6Vv/1cxlN9rd6gwqq5/XWj
	WPveJRremGrBgxnz4CYnDhtJzI7fpk72Yb3HFRaQp9E6ZC9R+q0SfqM/R86gWIAr+eNYBv60VWC
	bGADp2JOI3j5CHOz9Wne/u3uoyOBZ3TfPNj35AoPqSOZU4a/hE5KzR4yY6JgEUetgRHtZWaagfu
	/b87XwbCrviaDnQ+MAV+sbxC5m6nc2W6cMTy61tC5AQE/O4TYf+pfOhOMC1AqS7tfMBm0gIh2x6
	D9xEvmscl2soS1ueVF1R8ptsKE7WiFrGZBAFSDfmyoDqL3kIikwsS8buOMQH+mxLSbRt3E6eGOp
	NcCL3L8yiN+DG4gVsVLbpIELOBq3zM+A6EkiM2qnsJW+ym6WDFmymCvDyo/3I/rKwOBK+IxYlC9
	eBz1RvriXrAh7X1
X-Received: by 2002:adf:ffcb:0:b0:45e:f381:cd8c with SMTP id ffacd0b85a97d-46021959c5bmr9419907f8f.30.1780582871128;
        Thu, 04 Jun 2026 07:21:11 -0700 (PDT)
Message-ID: <f4d899ba-8a27-48dd-a724-55557b345647@gmail.com>
Date: Thu, 4 Jun 2026 16:21:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/26] xen/riscv: generate IMSIC DT node for guest
 domains
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <19d30d3c34a6ac9aeb668e1fc56301620b177db0.1778250616.git.oleksii.kurochko@gmail.com>
 <3da2f796-4dc7-408a-9ec9-f0e8bb02b1a9@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <3da2f796-4dc7-408a-9ec9-f0e8bb02b1a9@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1780582871-20A7EF3B-11003ED1/10/73395122804
X-purgate-type: spam
X-purgate-size: 6086
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8D554640CCC



On 6/3/26 5:21 PM, Jan Beulich wrote:
> On 08.05.2026 16:43, Oleksii Kurochko wrote:
>> Guests using the IMSIC interrupt controller require a corresponding
>> Device Tree description.
>>
>> Add support for generating an IMSIC node when building the guest DT.
>> This allows guests to discover and use the IMSIC interrupt controller.
>>
>> Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>> Changes in v2:
>>   - s/imsic_make_reg_property/guest_imsic_make_reg_property.
>>   - s/imsic_set_interrupt_extended_prop/guest_imsic_set_interrupt_extended_prop.
>>   - Use initalizer for regs[] array in imsic_make_reg_property().
>>   - Move buf[] insde the for() loop.
>>   - Correct check of returned phandle.
>>   - Drop local variable len.
>>   - /s/XVFREE/xvfree in imsic_set_interrupt_extended_prop().
>>   - Drop initializer for local variable data.
>>   - s/uint32_t/unsinged int for pos and cpu in imsic_set_interrupt_extended_prop().
>>   - Drop next_phandle as it is now in common code.
>>   - Introduce vcpu_imsic_deinit.
>>   - Refactor vimsic_make_domu_dt_node() to avoid usage of host IMSIC dt node.
>> ---
>>   xen/arch/riscv/imsic.c                    | 127 +++++++++++++++++++++-
>>   xen/arch/riscv/include/asm/guest-layout.h |   2 +
>>   2 files changed, 128 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
>> index ceea6778d9dc..19cbacdf96e1 100644
>> --- a/xen/arch/riscv/imsic.c
>> +++ b/xen/arch/riscv/imsic.c
>> @@ -13,9 +13,12 @@
>>   #include <xen/const.h>
>>   #include <xen/cpumask.h>
>>   #include <xen/device_tree.h>
>> +#include <xen/domain.h>
>>   #include <xen/errno.h>
>> +#include <xen/fdt-domain-build.h>
>>   #include <xen/fdt-kernel.h>
>>   #include <xen/init.h>
>> +#include <xen/libfdt/libfdt.h>
>>   #include <xen/macros.h>
>>   #include <xen/sched.h>
>>   #include <xen/smp.h>
>> @@ -35,6 +38,11 @@ static struct imsic_config imsic_cfg = {
>>       .lock = SPIN_LOCK_UNLOCKED,
>>   };
>>   
>> +static unsigned int __ro_after_init guest_num_msis;
> 
> How come this is __ro_after_init, when it's ...
> 
>> @@ -291,6 +299,11 @@ static int imsic_parse_node(const struct dt_device_node *node,
>>           return -ENOENT;
>>       }
>>   
>> +    if ( dt_property_read_u32(node, "riscv,num-guest-ids", &tmp) )
>> +        guest_num_msis = tmp;
>> +    else
>> +        guest_num_msis = imsic_cfg.nr_ids;
> 
> ... written by a non-__init function?

__ro_after_init should be dropped. I will use __read_mostly instead.

  Plus are you again inheriting a host
> property into guests without saying why?

Based on the discussion for similar place around vAPLIC code in the 
previous patch I will add here or the comment why or introduce 
VIMISC_NR_IDS and use it instead.

> 
>> @@ -524,8 +537,120 @@ int __init imsic_init(const struct dt_device_node *node)
>>       return rc;
>>   }
>>   
>> +static int __init guest_imsic_make_reg_property(struct domain *d, void *fdt)
> 
> Same question again as to __init throughout here.

 From Arm code I understood that libxl creates the interrupt controller 
node in userspace before handing the FDT to Xen so this and related 
functions won't be called by userspace.

And for dom0's it is a separate *_make_hdwom_dt_node() (took it from Arm 
code base) which can expose the real hardware MMIO regions to dom0 
(since dom0 may need direct hardware access - if it isn't strict 
requirement then the current one way to create node could be re-used).

So if for dom0/hwdom it should be created separate node then we will 
have similar separate function for IMSIC node here and then it looks 
fine to keep __init.

> 
>> +{
>> +    paddr_t base_addr = GUEST_IMSIC_S_BASE;
> 
> So you make a local variable for a constant, ...
> 
>> +    __be32 regs[4] = {
>> +        cpu_to_be32(base_addr >> 32),
>> +        cpu_to_be32(base_addr),
>> +        cpu_to_be32((IMSIC_MMIO_PAGE_SZ * d->max_vcpus) >> 32),
>> +        cpu_to_be32(IMSIC_MMIO_PAGE_SZ * d->max_vcpus),
> 
> ... but this non-constant expression is spelled out twice.

I will use instead of base_addr GUEST_IMSIC_S_BASE directly and 
introduce local variable for:
   paddr_t size = IMSIC_MMIO_PAGE_SZ * d->max_vcpus;

> 
>> +static int __init guest_imsic_set_interrupt_extended_prop(struct domain *d,
>> +                                                          void *fdt)
>> +{
>> +    unsigned int cpu, pos = 0;
>> +    uint32_t phandle;
>> +    uint32_t *irq_ext;
> 
> Doesn't this want to be __be32, seeing ...
> 
>> +    int res;
>> +
>> +    irq_ext = xvzalloc_array(uint32_t, d->max_vcpus * 2);
>> +    if ( !irq_ext )
>> +        return -ENOMEM;
>> +
>> +    for ( cpu = 0; cpu < d->max_vcpus; cpu++ )
>> +    {
>> +        char buf[64];
>> +
>> +        snprintf(buf, sizeof(buf), "/cpus/cpu@%u/interrupt-controller", cpu);
>> +        phandle = fdt_get_phandle(fdt, fdt_path_offset(fdt, buf));
>> +
>> +        if ( !phandle )
>> +        {
>> +            res = -ENODEV;
>> +            goto out;
>> +        }
>> +
>> +        irq_ext[pos++] = cpu_to_be32(phandle);
>> +        irq_ext[pos++] = cpu_to_be32(IRQ_S_EXT);
> 
> ... this?

Agree, __be32 should be added for definition of irq_ext.

> 
> Also, just like "buf", "phandle" can be local to this loop's body.
> 
>> --- a/xen/arch/riscv/include/asm/guest-layout.h
>> +++ b/xen/arch/riscv/include/asm/guest-layout.h
>> @@ -5,6 +5,8 @@
>>   
>>   #define GUEST_APLIC_S_BASE 0xd000000
>>   
>> +#define GUEST_IMSIC_S_BASE 0x28000000
>> +
>>   #define GUEST_RAM_BANKS   2
> 
> Is this going to become an unannotated collection of (seemingly) random
> numbers?

Could you please clarify what kind of annotation you would expect to see 
here? It's just an address, which is typically used for IMSIC by QEMU, 
so I chose the same notation for the guest address as well.

Thanks.

~ Oleksii

