Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wUDJI+faO2r/eAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 15:25:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 081BC6BE951
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 15:25:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=eQJKd26n;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1344961.1603976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcNbw-0007fo-0H; Wed, 24 Jun 2026 13:25:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344961.1603976; Wed, 24 Jun 2026 13:25:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcNbv-0007dP-TI; Wed, 24 Jun 2026 13:25:47 +0000
Received: by outflank-mailman (input) for mailman id 1344961;
 Wed, 24 Jun 2026 13:25:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wcNbv-0007dE-2G
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 13:25:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcNbu-002A0t-Ex
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 15:25:46 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3bdaca-bab6-0a2a0a5309dd-0a2a4501be64-30
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 15:25:46 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3bdada-400f-0a2a45010019-d155dd2ebd61-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 15:25:46 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-45fe59255beso568975f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 06:25:46 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c22b73badsm6895220f8f.33.2026.06.24.06.25.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 06:25:45 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782307546; x=1782912346; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dhd5AR+o6SPmnDc+LG3qwRS67eaOB5FrjUXir+Zhzhg=;
        b=eQJKd26nufyhKeHxws6lhNZBv1ZC5iDD1IRCUVTfTWTLvAIcFwVmWSW+8HbiVcXV0g
         7y5zenW9TR9q9c7usijcozq2aV8oVyZ+Uzx8HCADgbA8InmTuiXVuAxLUI29vjrCzZOH
         Wpn4sah4ojdbugisiUtmyQ/gOAaYGGhjL1oFJO7ImwOFdMyII1a8vJGaWA7kCObsag51
         Dk3BYXATgQEsvaBirztoaqyjmY+bsGLy5BFyX2yFcd7eLYyVrNnSwopH3eyqSV/Z+8pG
         OsgBqRJ6GbD6ry3atpdbHakcCUcCmy0s7T3943jYkzz/ekTOespCFSu6UxLLj+fF8/ya
         f6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782307546; x=1782912346;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dhd5AR+o6SPmnDc+LG3qwRS67eaOB5FrjUXir+Zhzhg=;
        b=iyN7ZspmP5lJ1LJEyhGk/ZbdB34RPPRgZXhPWNWZy7hWbyIX1V//XQIO0+4WNacxqO
         qgxPgfrAuBXWYQ6LiPEW78L3t+1GpAGiexaXsEeAOfb8sNW/h2PI8D/R3hHWFQFRzHMC
         XTYrNBDM4l0Wyo3JmbUNoYghM+IE8fX1Sr0Q5Q1xsu/W+IpQKG2qXKiCM8nTtjr/VZRz
         EFQkYtM4peVDoxlnGLNrA8N/LBZ4Yp9u1VNN8rypVlf+O7yP/75KfM4TyAQxn1kO10r9
         ZUTxBnSsCxlwvUbx0/6ARpF7XB2DT4i6jHaVCdcQ1OaZGl/ghZp71lqbOsijetwW3asu
         GdXg==
X-Forwarded-Encrypted: i=1; AHgh+RoBmcCZDzuGlFF2/BqsLSljk3XEnI1G3dW8PN0tte9Jnb7JvcmVqQCh4dx64WnuUVky2sW/BThvofg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxSGdhRGBV2eYPAMAHpBgzUqjHpCwQaOmlZSWshahVdg0MbkSMI
	anBHuklfCEp2zlbHsnz7V5jE2MLHAwnbk0xaaT2ZQ5xd+ahd9n3xqZ3w
X-Gm-Gg: AfdE7cmVAGa3lFickqnxw7Znzk7/qaCJaBU9j1T/siXRHk1I4VIXoLTcIlwaD0rjWgA
	yOHUyGbAGnn40lwVSu/9hzIcA3pKTeGeaSBg0JZ1XtnXtWUqGEhEcezWAoVVTdQZNLprxj3cIiy
	xsCKg2N9QDhh7svEZyc2si3lyV3528o6uNng/tG3EzHfzyUHC4nLrbcjYWl5AEq72b5oVjwq+jM
	emz/09YQzt2WeXZy9ZU+lkR2A0CEoTkdYj6DnWlceJAvYaHuc7a4wY1yJpZ96uMl3JjamWdrndE
	zdEHE2eOTqntQTEUvt4YehXXG9nspubEVjmlgKKqvZgZkdCnCy6gKf2HA/JbSdld7lLjYdTWFof
	CttC+CmVs1OKyaW7snlMMaGNFqDc0AGfabIY0kAUjw7CNZziqlzWsXkWZgjXsA3n6w/eWZjCPCn
	gUoCm7dbgHYufZktj2cUkc+rP16o42mOM3MsyquFGMSykz8gnl5cQ9ZE8AAjn/pczVH27soHfQI
	TF6NQ==
X-Received: by 2002:a05:6000:29d8:b0:465:5627:79d5 with SMTP id ffacd0b85a97d-46adadd21a8mr8260953f8f.24.1782307545751;
        Wed, 24 Jun 2026 06:25:45 -0700 (PDT)
Message-ID: <d5c76501-a3eb-40b0-bf14-1e26505c74c6@gmail.com>
Date: Wed, 24 Jun 2026 15:25:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/23] xen/riscv: generate IMSIC DT node for guest
 domains
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
 <18938bb8845fa91315e320f88d17147592aba51c.1781693963.git.oleksii.kurochko@gmail.com>
 <424912f9-5a2d-4c68-a25e-8fd5547011c6@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <424912f9-5a2d-4c68-a25e-8fd5547011c6@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1782307546-82EC71E0-16B7C844/10/73395122804
X-purgate-type: spam
X-purgate-size: 6684
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[microchip.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,wdc.com,gmail.com,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,microchip.com:email];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: 081BC6BE951



On 6/22/26 5:12 PM, Jan Beulich wrote:
> On 17.06.2026 13:17, Oleksii Kurochko wrote:
>> Guests using the IMSIC interrupt controller require a corresponding
>> Device Tree description.
>>
>> Add support for generating an IMSIC node when building the guest DT.
>> This allows guests to discover and use the IMSIC interrupt controller.
>>
>> The value choosen for GUEST_IMSIC_S_BASE is an address which is typically
>> used for IMSIC and QEMU.
>>
>> DT-building functions are marked __init because domain creation happens at
>> boot time, before the init sections are freed. In a typical deployment
>> libxl creates the interrupt controller node in userspace and hands the
>> complete FDT to Xen, so these functions are only called during early
>> domain construction.
>>
>> Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>> Changes in v3:
>>   - s/__ro_after_init/__read_mostly for guest_num_msis.
>>   - Use IMSIC_MAX_ID as default for guest_num_msis instead of imsic_cfg.nr_ids.
>>   - Drop base_addr local variable in guest_imsic_make_reg_property(); use
>>     GUEST_IMSIC_S_BASE directly and introduce size to avoid spelling
>>     IMSIC_MMIO_PAGE_SZ * d->max_vcpus twice.
>>   - Change irq_ext type from uint32_t * to __be32 * in
>>     guest_imsic_set_interrupt_extended_prop().
>>   - Move phandle declaration into the loop body.
>>   - Extend commit message to explain why __init is used for DT-building
>>     functions: libxl creates the interrupt controller node before handing
>>     the FDT to Xen, so these functions are only invoked during boot-time
>>     domain construction.
>>   - Re-order patch before APLIC DT node creation patch.
>>   - Update commit message.
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
>> ---
>>   ...asic-VGEIN-management-for-AIA-guests.patch | 273 ++++++++++++++++++
> 
> What is this doing here?

Accidentally added to the patch, I will drop it.

> 
>> --- a/xen/arch/riscv/imsic.c
>> +++ b/xen/arch/riscv/imsic.c
>> @@ -13,8 +13,12 @@
>>   #include <xen/const.h>
>>   #include <xen/cpumask.h>
>>   #include <xen/device_tree.h>
>> +#include <xen/domain.h>
>>   #include <xen/errno.h>
>> +#include <xen/fdt-domain-build.h>
>> +#include <xen/fdt-kernel.h>
>>   #include <xen/init.h>
>> +#include <xen/libfdt/libfdt.h>
>>   #include <xen/macros.h>
>>   #include <xen/sched.h>
>>   #include <xen/smp.h>
>> @@ -36,6 +40,11 @@ static struct imsic_config imsic_cfg = {
>>       .lock = SPIN_LOCK_UNLOCKED,
>>   };
>>   
>> +static unsigned int __read_mostly guest_num_msis;
> 
> This being host dependent and hence the same for all guests likely also
> warrants a comment.

Agree, I will add the comment:

/*
  * Number of MSIs available to a guest. Determined by the host
  * interrupt controller, so it is identical for every domain — hence
  * a single global rather than a per-domain value.
  */
+ static unsigned int __read_mostly guest_num_msis;

> 
>> @@ -521,3 +535,121 @@ int __init imsic_init(const struct dt_device_node *node)
>>   
>>       return rc;
>>   }
>> +
>> +static int __init guest_imsic_make_reg_property(struct domain *d, void *fdt)
>> +{
>> +    paddr_t size = IMSIC_MMIO_PAGE_SZ * d->max_vcpus;
>> +    __be32 regs[4] = {
>> +        cpu_to_be32(GUEST_IMSIC_S_BASE >> 32),
>> +        cpu_to_be32(GUEST_IMSIC_S_BASE),
>> +        cpu_to_be32(size >> 32),
>> +        cpu_to_be32(size),
>> +    };
>> +
>> +    return fdt_property(fdt, "reg", regs, sizeof(regs));
>> +}
>> +
>> +static int __init guest_imsic_set_interrupt_extended_prop(struct domain *d,
>> +                                                          void *fdt)
>> +{
>> +    unsigned int cpu, pos = 0;
>> +    __be32 *irq_ext;
>> +    int res;
>> +
>> +    irq_ext = xvzalloc_array(__be32, d->max_vcpus * 2);
>> +    if ( !irq_ext )
>> +        return -ENOMEM;
>> +
>> +    for ( cpu = 0; cpu < d->max_vcpus; cpu++ )
>> +    {
>> +        char buf[64];
>> +        uint32_t phandle;
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
>> +    }
>> +
>> +    res = fdt_property(fdt, "interrupts-extended", irq_ext,
>> +                       d->max_vcpus * 2 * sizeof(*irq_ext));
>> +
>> + out:
>> +    xvfree(irq_ext);
>> +
>> +    return res;
>> +}
>> +
>> +int __init vimsic_make_domu_dt_node(struct kernel_info *kinfo,
>> +                                    unsigned int *phandle)
>> +{
>> +    int res;
>> +    void *fdt = kinfo->fdt;
>> +    char vimsic_name[128];
> 
> Isn't this excessive? You need space for ...
> 
>> +    unsigned int vimsic_phandle;
>> +    unsigned int num_msis = min(GUEST_IMSIC_NUM_MSIS + 0U, guest_num_msis);
>> +
>> +    res = snprintf(vimsic_name, sizeof(vimsic_name), "/soc/imsic@%lx",
> 
> ... up to 11 + 16 + 1 characters. So 32 will do, to make it a "nice" number.

Agree, 128 is too much and 32 will be more then enough.

> 
>> --- a/xen/arch/riscv/include/asm/guest-layout.h
>> +++ b/xen/arch/riscv/include/asm/guest-layout.h
>> @@ -3,6 +3,8 @@
>>   
>>   #include <public/xen.h>
>>   
>> +#define GUEST_IMSIC_S_BASE __ULL(0x28000000)
> 
> May I remind you of my request to not leave entirely arbitrary (and seemingly
> random) numbers uncommented?

Then I misunderstood you I added the a sentence to commit message:
   The value choosen for GUEST_IMSIC_S_BASE is an address which is 
typically used for IMSIC and QEMU.

I will put the simialar comment before defintion of GUEST_IMSIC_S_BASE.

Thanks.

~ Oleksii

