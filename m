Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7/wRGh3BVGqVEgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 12:42:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC1E749EC6
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 12:42:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=q9QaPMnM;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1361606.1613786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjE6e-0006IE-Hd; Mon, 13 Jul 2026 10:41:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1361606.1613786; Mon, 13 Jul 2026 10:41:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjE6e-0006Fp-EJ; Mon, 13 Jul 2026 10:41:48 +0000
Received: by outflank-mailman (input) for mailman id 1361606;
 Mon, 13 Jul 2026 10:41:47 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wjE6d-0006Fj-AH
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 10:41:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjE6c-0071XM-5y
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 12:41:46 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a54c0b7-e002-0a2a0a5209dd-0a2a450385ce-42
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 12:41:46 +0200
Received: from [209.85.167.45] (helo=mail-lf1-f45.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a54c0e9-f2d2-0a2a45030019-d155a72da404-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 12:41:45 +0200
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5b01910b499so2495892e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 03:41:45 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5b01ca4a1bfsm2798773e87.6.2026.07.13.03.41.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2026 03:41:44 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783939305; x=1784544105; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eCinO4eSOFZGZxYxDonfbBTDYhb7nlzenq687+QCLQ0=;
        b=q9QaPMnM8AGit9wnbaLCMDTAbeGiTtrjl81gUR4WAeTCzYH5R82xB0BED6YpgJMwz0
         Q7v9z+U+/aHcGQDWRP0687d5UDsVyxJ1MqeLg77jJXpzheXywF3yHqK0LKIV5MNRnA8d
         HjVmyc/yRJ2Y8UFs/XnoWQiqTmk3vBu7knoaXsVzYoVbx27Ka61UJEDIjWm9xy1L5sgN
         LRUmqjVbfFCLQ6+sQS+rwAD30/G/6+et61qy4WJ3hwKM3duoWCUe2ChOixh7Dt5k0nCT
         cEHhtGwcPOU9F9OM+0rWo0n1TRgICwpIWKkPcNWeLTlmUdZ5RVhLjYho2P4pkZ34tKOJ
         Lu/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783939305; x=1784544105;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eCinO4eSOFZGZxYxDonfbBTDYhb7nlzenq687+QCLQ0=;
        b=AvNuAOeaI+ewho7djrM+60LOJYGngxNYRZlsdlmIR6mBmXWrFLyjwtuK5diN/wUNba
         flb+kSu1kmZxG8M03U9HSvrdOpb4KL5Gt4rKg5mUihXjByvTmqP/A+D0yX6Z2AZ5Unys
         EkmpyVGKnvDaJ/PBYk91R4rp1NXi894fT6mrfK4thfuilJ0XpB45eqkO2oFwxSKsH3D8
         b9zSBJ54Ih+diGCA+K+asb5yAEcmQja/c+ZfddA1Sf20D09wzNHg4SffoJxMaxjoky7E
         5mnUOteI2U7YQUTNmy/zYuIb38dHyfQcWYHFuvLYJ7SquSRN+TjDdGz2vpLi1hzYak3e
         7JDg==
X-Forwarded-Encrypted: i=1; AHgh+RqGZNDQ4G4PGagELl+JD5uD0/MV5RJbtd5avoG/jzViGFYlIkwjGNa/X8ysBf7IlCVn6VwCS/3V+tw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyxYT8HzLCCKAlpKPvy+xuarPpOjXi8ojTHri1VwCQB+bbFwfqH
	SBV/tRn2BeV/edtqMGO9ZH1tdHHGcaAzL/aKzl+x+UIva/YtCocive4j
X-Gm-Gg: AfdE7clgNpoIy38SYHFpDwJ6hcCCOWVXVIwD+j64KMwK2Wkfs31qdcej3p17g1eiMsS
	qB/IYBDNtwbX5T9ri47cNh2joJsRMWWU5M/uf1wG/hkx7zQc3D2enJR5umVf3/5WkTu6/4UPLmJ
	SWYhDlSM2em2TI9dDkNIY78jj8qbeJpII2GqlWKJpdxbxUJiq4bq5vFTZ4dSxwhpFb7qjWE31Ol
	6AlFVf4Z7HYIuSihOqw2OsewW0kH/1ZsBsHr56MAbj/q1H+b8iKgM7PbQ0LdXcX43V+azS01aWW
	fcgzTpJFceiHV9MIZ9tSL8y8XPaaSQtEqBhe8g3W0tJ5TC4qN6eK657K64dlN26Zh7JZwhqRWC0
	sDVPcCnVVh1sAmisWY+9Wrq3E/tc/06g5uKU3hQeK3wU7afA4ORSuJA4IgeDWykkxos/PukeHYx
	O3jo5xuQrsgfTC5+pth2IyNs/m/QiMsPZ4A5MSm0hLOyxPYfu+Cqzudc+ao6FnMG5xCGY=
X-Received: by 2002:ac2:5b5a:0:b0:5ae:9be8:1ad7 with SMTP id 2adb3069b0e04-5b01c437315mr1660418e87.18.1783939304431;
        Mon, 13 Jul 2026 03:41:44 -0700 (PDT)
Message-ID: <edb627bb-1f22-48dd-b6ef-8c7621227161@gmail.com>
Date: Mon, 13 Jul 2026 12:41:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 19/26] xen/riscv: generate IMSIC DT node for guest
 domains
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
 <7af5bcc9ef818926f02244f5d566541da06a0a16.1783331040.git.oleksii.kurochko@gmail.com>
 <1649e30f-f470-40d9-a4a5-4189df18dd07@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1649e30f-f470-40d9-a4a5-4189df18dd07@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1783939305-C1359CF4-2DFDC9AE/10/73395122804
X-purgate-type: spam
X-purgate-size: 4305
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,wdc.com,gmail.com,citrix.com,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RECEIVED_SPAMHAUS_PBL(0.00)[109.243.144.234:received];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DNSWL_BLOCKED(0.00)[192.237.175.120:from,194.145.224.20:received,209.85.167.45:received,10.42.69.3:received,109.243.144.234:received];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[194.145.224.20:received,209.85.167.45:received,10.42.69.3:received];
	DWL_DNSWL_BLOCKED(0.00)[gmail.com:dkim];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9AC1E749EC6



On 7/9/26 5:49 PM, Jan Beulich wrote:
> On 06.07.2026 17:58, Oleksii Kurochko wrote:
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
>> @@ -34,6 +38,21 @@ static struct imsic_config imsic_cfg = {
>>       .lock = SPIN_LOCK_UNLOCKED,
>>   };
>>   
>> +/*
>> + * Number of MSIs available to a guest. Determined by the host interrupt
>> + * controller, so it is identical for every domain -- hence a single global
>> + * rather than a per-domain value.
>> + */
>> +static unsigned int __ro_after_init guest_num_msis;
>> +
>> +#define GUEST_IMSIC_COMPATIBLE "riscv,imsics"
>> +
>> +/*
>> + * Value is inspired by what QEMU is using for riscv,num-ids property for IMSIC
>> + * node.
>> + */
>> +#define GUEST_IMSIC_MAX_MSIS 255
> 
> #define GUEST_IMSIC_MAX_MSIS 255U
> 
> to avoid ...
> 
>> @@ -285,6 +304,13 @@ static int imsic_parse_node(const struct dt_device_node *node,
>>           return -ENOENT;
>>       }
>>   
>> +    if ( dt_property_read_u32(node, "riscv,num-guest-ids", &tmp) )
>> +        guest_num_msis = tmp;
>> +    else
>> +        guest_num_msis = IMSIC_MAX_ID;
>> +
>> +    guest_num_msis = min(GUEST_IMSIC_MAX_MSIS + 0U, guest_num_msis);
> 
> ... the "+ 0U" here?

Good point. I'll apply.

> 
> As to the use of IMSIC_MAX_ID - why not use GUEST_IMSIC_MAX_MSIS right away?
> Overall perhaps
> 
>      if ( dt_property_read_u32(node, "riscv,num-guest-ids", &tmp) )
>          guest_num_msis = min(GUEST_IMSIC_MAX_MSIS, tmp);
>      else
>          guest_num_msis = GUEST_IMSIC_MAX_MSIS;
> 
> ?

Agree, it would be better.

> 
>> @@ -522,3 +548,119 @@ int __init imsic_init(const struct dt_device_node *node)
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
>> +        snprintf(buf, ARRAY_SIZE(buf), "/cpus/cpu@%u/interrupt-controller", cpu);
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
>> +    char vimsic_name[32];
>> +    unsigned int vimsic_phandle;
>> +    res = snprintf(vimsic_name, sizeof(vimsic_name), "/soc/imsic@%lx",
>> +                   GUEST_IMSIC_S_BASE);
> 
> Blank line please between declaration(s) and statement(s). Also the revlog
> claims you switched to ARRAY_SIZE() everywhere, when really you didn't.

I will do that next patch series version.

Thanks.

~ Oleksii

