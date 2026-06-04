Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oTm0LatnIWqsFwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 13:55:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F3663F9DF
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 13:55:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=tJhb37yI;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1327728.1592524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV6ef-0006Mx-H6; Thu, 04 Jun 2026 11:54:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327728.1592524; Thu, 04 Jun 2026 11:54:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV6ef-0006KU-EC; Thu, 04 Jun 2026 11:54:33 +0000
Received: by outflank-mailman (input) for mailman id 1327728;
 Thu, 04 Jun 2026 11:54:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wV6ed-0006KO-TN
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 11:54:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV6ed-00F7Fz-20
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 13:54:31 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a216769-2eae-0a2a0a5409dd-0a2a45059cc8-16
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 13:54:31 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a216776-aaa8-0a2a45050019-d155802eb44c-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 13:54:30 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4908b92904fso7570575e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 04:54:30 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc39e024sm80912185e9.4.2026.06.04.04.54.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2026 04:54:29 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780574070; x=1781178870; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wH+PrgcTcjC8s6r2oeJayBlwe/5cQcfMAXoxh6DBpfk=;
        b=tJhb37yIFw1hB6ssJpA2+FEFbGhnsisuoY3sUu9iy2ccpO98wgCWLiMDiGb4djP7N2
         +1fyaZ0msdhyXsSllms/+3lEw9ImyhRNyZtqbl8rFXXTwRTvKdkBMm/jtbyuDpGNqff6
         gEqe+JcQobRxMFmzaezNZZ3KhP8k6Fvb49UofBe08NzNG4u2b8JgaBXkOpQBfeKCpAck
         72FcOSo1jGla36HRYQk1QiEGUrpJkW2ovaK6D71zOY63hLr8PmSvNiufD9IvoXnugeUy
         cLJzZDeu3gEPV2jrmg9jJqaHJWhKJnAqyqAsLmDKbI8MdASDVmj2XbAxQdP2A0+GJd+F
         Nyrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780574070; x=1781178870;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wH+PrgcTcjC8s6r2oeJayBlwe/5cQcfMAXoxh6DBpfk=;
        b=gjt3OpqfDwOxX/V1LLtLzK/Qk6VXnclVvz/CtcWbq6cFKDSInRlsko2dD8x/GpmIEC
         tYnGQHhJVag475Ys0p8+Dvgg5hWpWHHcUeWW98e+24+MtggQKED9/GN2FSswoZdD23wK
         k1iLoq48TsS2vURoO3r8xCazzoBUR3AqpbKNFFGGYnhDRTlRX0wieO/1CLszlJY56Us9
         1wiiO0hGEqrvY8W1F2JdknopOU7KDJg23uXWhIDRpssCMhQ4DTuPkzwxiHEdYfkOFHIp
         +dA7VhRml3FCFu8QdXB9theWuuoTZX7CGFOl2VXXZ6MsDZLo22wSP9dTVbfvRD9lK7Sp
         qMTA==
X-Forwarded-Encrypted: i=1; AFNElJ/LdXzE6WlBxVBuTyS/iu4Vdx2VR41KRlH8p+o6QOnx4TrVYAdcdfKVwHrcPsoEfQKCEmt41WmNpB8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxK94Tbi+kvankY4OuMqwFvgsl5/2eynga0e1yBg2H5FgXbfbyt
	NrLzXpo6QcbmOvYk45QiZu8/LecaMEtGcyP+p7YaSGKx9H6D+46M1sga
X-Gm-Gg: Acq92OEfhP2LoX2/UQPpO7lgIxAHnInhaVQ+SGI3EW/YvWpdttkD6PBbCu+nPa6CA2u
	EE7/pYOU7Zfclu9Vjz8rugjxDKv7TNiguUkv9fIgi14YTnfdmNsnljt5ZjxW3+QnNpClHuwz5t1
	lKFGelN/kBX0ckCALctAC29oVLQ6Ct1sllZ5Ock03uhPE9uJ0EgBltVSbtwlu3r18g824Yt2oTl
	Y0qFBO3tkeBCWVQiaFNUSbxtJUL+hn0a5D6bpzqfNQtwFW8IwA6BcZVMtsILNALTYYWRBONDtOj
	rO3863KpCUJ3lQvhKOsbNb7g5w3bs28WZGQAaJqjVZwXwwRI6UyGg3n4UD7OGy0TUNh5nx5HVIw
	DPnU2CvgzDAGsD/vMdtMevWK0d/LIan8Z9RtmPg3z6wRvqpBkos038+0mEGcdiY/joPgKatCBZl
	eBdT5POahBTgdWrgtekOpDlrcWbVT8KcQSsLjsFyPXFn+6nmxT+ZI+0xQqjIzk5Y5UTFJNO3J1W
	MubofWxjsVl04SM
X-Received: by 2002:a05:600c:4fd5:b0:490:b02d:1529 with SMTP id 5b1f17b1804b1-490b5eb6644mr124267875e9.6.1780574070150;
        Thu, 04 Jun 2026 04:54:30 -0700 (PDT)
Message-ID: <4631cb18-d735-4494-92ec-9b06c637a2c0@gmail.com>
Date: Thu, 4 Jun 2026 13:54:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/26] xen/riscv: create APLIC DT node for guest
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
 <d1377f3e2381a6428b558b54f47db342d0cd5503.1778250616.git.oleksii.kurochko@gmail.com>
 <76856d69-2f52-4804-92bf-ee9343230c2c@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <76856d69-2f52-4804-92bf-ee9343230c2c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1780574071-DA374443-3226CE46/10/73395122804
X-purgate-type: spam
X-purgate-size: 5493
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: 18F3663F9DF



On 6/3/26 5:10 PM, Jan Beulich wrote:
> On 08.05.2026 16:43, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/imsic.c
>> +++ b/xen/arch/riscv/imsic.c
>> @@ -14,6 +14,7 @@
>>   #include <xen/cpumask.h>
>>   #include <xen/device_tree.h>
>>   #include <xen/errno.h>
>> +#include <xen/fdt-kernel.h>
>>   #include <xen/init.h>
>>   #include <xen/macros.h>
>>   #include <xen/sched.h>
>> @@ -522,3 +523,9 @@ int __init imsic_init(const struct dt_device_node *node)
>>   
>>       return rc;
>>   }
>> +
>> +int __init vimsic_make_domu_dt_node(struct kernel_info *kinfo,
>> +                                    unsigned int *phandle)
>> +{
>> +    return -EOPNOTSUPP;
>> +}
> 
> This, I assume, is going to be filled properly by the next patch.

Yes as it was mentioned in the commit message. Actually here considering 
that this function isn't static I can just re-order patches and drop 
part of commit message in the current patch.

> 
>> --- a/xen/arch/riscv/vaplic.c
>> +++ b/xen/arch/riscv/vaplic.c
>> @@ -9,6 +9,8 @@
>>    */
>>   
>>   #include <xen/errno.h>
>> +#include <xen/fdt-kernel.h>
>> +#include <xen/libfdt/libfdt.h>
>>   #include <xen/sched.h>
>>   #include <xen/xvmalloc.h>
>>   
>> @@ -19,8 +21,11 @@
>>   
>>   #include "aplic-priv.h"
>>   
>> +#define VAPLIC_COMPATIBLE "riscv,aplic"
>>   #define VAPLIC_NUM_SOURCES 96
>>   
>> +#define FDT_VAPLIC_INT_CELLS 2
>> +
>>   static int cf_check vcpu_vaplic_init(struct vcpu *v)
>>   {
>>       int rc = 0;
>> @@ -47,6 +52,73 @@ static int cf_check vcpu_vaplic_init(struct vcpu *v)
>>       return rc;
>>   }
>>   
>> +static int __init cf_check vaplic_make_domu_dt_node(struct kernel_info *kinfo)
> 
> Again - why __init here and ...
> 
>> +{
>> +    int res = 0;
>> +    void *fdt = kinfo->fdt;
>> +    unsigned int msi_parent_phandle;
>> +    char vaplic_name[128];
>> +    paddr_t aplic_addr = GUEST_APLIC_S_BASE;
>> +    paddr_t aplic_size = APLIC_SIZE(kinfo->bd.d->max_vcpus);
>> +    const __be32 reg[] = {
>> +        cpu_to_be32(aplic_addr >> 32),
>> +        cpu_to_be32(aplic_addr),
>> +        cpu_to_be32(aplic_size >> 32),
>> +        cpu_to_be32(aplic_size),
>> +    };
>> +    struct vintc *vintc = kinfo->bd.d->arch.vintc;
>> +
>> +    res = snprintf(vaplic_name, sizeof(vaplic_name), "/soc/aplic@%x",
>> +                   GUEST_APLIC_S_BASE);
>> +    if ( res >= sizeof(vaplic_name) )
>> +    {
>> +        dprintk(XENLOG_DEBUG, "vaplic name is truncated\n");
>> +        return -ENOBUFS;
>> +    }
>> +
>> +    res = vimsic_make_domu_dt_node(kinfo, &msi_parent_phandle);
>> +    if ( res )
>> +        return res;
>> +
>> +    res = fdt_begin_node(fdt, vaplic_name);
>> +    if ( res )
>> +        return res;
>> +
>> +    res = fdt_property_cell(fdt, "#interrupt-cells", FDT_VAPLIC_INT_CELLS);
>> +    if ( res )
>> +        return res;
>> +
>> +    res = fdt_property(fdt, "reg", reg, sizeof(reg));
>> +    if ( res )
>> +        return res;
>> +
>> +    res = fdt_property_cell(fdt, "riscv,num-sources", vintc->irq_nums);
>> +    if ( res )
>> +        return res;
>> +
>> +    res = fdt_property(fdt, "interrupt-controller", NULL, 0);
>> +    if ( res )
>> +        return res;
>> +
>> +    res = fdt_property_string(fdt, "compatible", VAPLIC_COMPATIBLE);
>> +    if ( res )
>> +        return res;
>> +
>> +    res = fdt_property_cell(fdt, "msi-parent", msi_parent_phandle);
>> +    if ( res )
>> +        return res;
>> +
>> +    res = fdt_property_cell(fdt, "phandle", kinfo->phandle_intc);
>> +    if ( res )
>> +        return res;
>> +
>> +    return fdt_end_node(fdt);
>> +}
>> +
>> +static const struct vintc_init_ops __initdata init_ops = {
> 
> ... __initdata here? If you really want to have the option of moving
> domain creation stuff to .init.* when only dom0less is configured,
> then a proper abstraction is needed, along the lines of
> init_or_livepatch.

It was marked as __init and __initdata, respectively, because I had the 
dom0less use case in mind, where all domains are created during boot. In 
that scenario, vaplic_make_domu_dt_node() would not be reused, so the 
associated memory could be freed afterwards.

In the case of Dom0 with the xl toolstack, I assume the toolstack will 
create the node for the guest domain. For Dom0, however, I am not sure 
whether we can reuse the current implementation as-is. As it is written 
now, I assume that properties such as aplic_addr, reg, and compatible 
should be reused from the host, right?
If that is not a requirement for Dom0, then __init and __initdata could 
be removed (and possibly init_ops as well).

> 
>> @@ -60,13 +132,14 @@ int __init domain_vaplic_init(struct domain *d)
>>   
>>       d->arch.vintc = &vaplic->vintc;
>>       d->arch.vintc->ops = &vintc_ops;
>> +    d->arch.vintc->init_ops = &init_ops;
>>   
>> -    vaplic->regs.domaincfg = APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM;
>> +    vaplic->regs.domaincfg = APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM |
>> +                             APLIC_DOMAINCFG_RO80;
> 
> This looks unrelated. I don't mind it being done here, but then it
> wants mentioning in the description. Or maybe I simply don't understand
> what this is about.

Right, it shouldn't be here. It would be better to move to [PATCH v2 
14/26] xen/riscv: add very early virtual APLIC (vAPLIC) initialization 
support.

Thanks.

~ Oleksii

