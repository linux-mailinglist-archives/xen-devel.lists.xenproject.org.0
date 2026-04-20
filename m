Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBSyFCr/5WlEqAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 12:25:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A536F42955C
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 12:25:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1285612.1566602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEloZ-0001FF-2h; Mon, 20 Apr 2026 10:25:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1285612.1566602; Mon, 20 Apr 2026 10:25:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEloY-0001CY-WD; Mon, 20 Apr 2026 10:25:15 +0000
Received: by outflank-mailman (input) for mailman id 1285612;
 Mon, 20 Apr 2026 10:25:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wEloX-0001CS-Sx
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 10:25:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEloW-007tTu-MI
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 12:25:12 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e5ff06-e002-0a2a0a5209dd-0a2a4506ac7c-24
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 12:25:12 +0200
Received: from [209.85.167.47] (helo=mail-lf1-f47.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e5ff08-7371-0a2a45060019-d155a72fd143-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 12:25:12 +0200
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-5a283c44478so4906742e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 03:25:12 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a4187e7ddbsm2867306e87.63.2026.04.20.03.25.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2026 03:25:11 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1776680712; x=1777285512; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HunJ0W3Im8CxuSLAh4+aI4mvFMRRwa8Rq0IicFhGMUM=;
        b=ALYZV+A9+dbhHKVQDaRWqB+YGfTwLmfXgMqaJSfSQHRJJBwOnXg7JainA+e/ghFlHm
         x/Jx+7XCkk3vADXcsOIXQ2HPS5aqW7+mbw8pMd4PIh1gMHiNyoQgel/EDiBB40xKAX3W
         fPBq+RekgyRB+3qhytN83/lvAQvOcdrYCDp6DIdPdxiW6zDTs3nrJQxaB58xtzMjW0TZ
         y1kz6b+kweDOK5jS8ypPARRGeSuYr+1PYRITydPd9nVVqDZo5Ply5SiY1vqx/Qk7qEiI
         tXJVFpM/DYvjkbtNyZ2f/n1p3kzwyGAteSQB3XKNnPAB2j6RY2DEnQxOSs5VcMqIdIL5
         dI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776680712; x=1777285512;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HunJ0W3Im8CxuSLAh4+aI4mvFMRRwa8Rq0IicFhGMUM=;
        b=in6pd5Mhgwz43msdDaHlMwL2j74ZFhI80WmWTT30YsNrek7uSO1MWUsILirMHpPfTg
         XtU+epLSkHRvb3uWCCbG/XpDr53HQ//jL9K9sBxh8xH4+McRiRLZbsh3pr40xYDfYiBg
         rOypx61+ZB5omHqDzw2d1y4S+P8BKp/z0d/ONgms1nC+bsSlbEARGOMZnUrLa1m6ia1Z
         vTm3EDwivKlfxwCKyGXJlM9iQmIzijryO//YjEKUHBk71IhEUXm8aMpvi76mjcHRAcrC
         wg9pKO5x2ozT/FNExFWjCgsgZEX5WHfnNRuosW1tSq3F5AAwwOoDOWaGo+Y5A3AF0ryJ
         2b7Q==
X-Forwarded-Encrypted: i=1; AFNElJ8533+8J2gM2sl8xFaHw6+tKaZwDpw7EjZje4UgAMLiERbtMrGen92g/CEO85abG07lPiQeNGRTvf8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQ4bzPLsMEnGqZ3Q8eQ4gU5YZeWAD0JNp9j62g4olE4+D/gvMq
	uPnN22ZK4LnA57aRm35dhk9xvvGnzJ8WcR1RpR7AAxYDHjxZaHz9f0Xh
X-Gm-Gg: AeBDievgJkDrGvHCdHwTHT/89oDoe4kClEE0XxDOllMw85X+OBGuOkA9C29IE/PlYEB
	8lKR5dTFJdsTMWzyVUBjaEh0hQRbAPnfd32dUKlS7t2ytvoCVstmf0dOvxwvmhIe7mTo+5AzkHX
	0ExILNfeX6GlDyUcUZD6vx3cKHHTcd1utxCMfzjG8T+nEZZlWJwaSqgISJP0V9XltrD/+Cg8UXm
	AfAy1nDjIaYhKL5byi0TQ+lenI74TrkdsIEQ1u3L12f2vAYByGh8ZDE365UgyNx6KlBJhLTkoC7
	MvowHhQKhMmoZOvNXSSCbQDQ0P4pr3O3P3149svogCTaCk+P5hUVQ/cnnodPCGqDNJcBvIqhXPU
	9KAPFpzbplqOUZWm+n3p0qbnDvGf37u4VZEVK1SQ9SlWy4OxEu+uAI976ZVraWlu8upp+vAqi4G
	g7lWYbP7tdKfdSwOMBhcppctLllkj2wiymIfPH3GqUN/YX26Jxa+YxVlu9zi2FxdllD44DJvTlu
	+cJFZdsLCJx4A==
X-Received: by 2002:a05:6512:230b:b0:5a4:301:b92 with SMTP id 2adb3069b0e04-5a4172de459mr4693311e87.33.1776680711361;
        Mon, 20 Apr 2026 03:25:11 -0700 (PDT)
Message-ID: <c6bef180-5d54-4527-94ca-20ed9729d475@gmail.com>
Date: Mon, 20 Apr 2026 12:25:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 15/27] xen/riscv: add very early virtual APLIC (vAPLIC)
 initialization support
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
 <e8bcf5618a19fb44d4391410f2f67ffd98a96647.1773157782.git.oleksii.kurochko@gmail.com>
 <44cb3124-8972-4a0c-b785-64f2022f178b@suse.com>
 <a324161d-f8b4-47fe-b5ac-52df6060e45b@gmail.com>
 <da07da74-220a-4dbb-84fc-2e7aeb6b19df@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <da07da74-220a-4dbb-84fc-2e7aeb6b19df@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1776680712-52974D75-E698A01C/10/73395122804
X-purgate-type: spam
X-purgate-size: 6069
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
X-Rspamd-Queue-Id: A536F42955C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/16/26 2:42 PM, Jan Beulich wrote:
> On 14.04.2026 12:27, Oleksii Kurochko wrote:
>> On 4/2/26 1:58 PM, Jan Beulich wrote:
>>> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>>>> @@ -47,6 +48,19 @@ struct intc_hw_operations {
>>>>                                const struct dt_device_node *intc);
>>>>    };
>>>> +
>>>> +struct vintc {
>>>> +    const struct intc_info *info;
>>>
>>> Isn't this referencing a physical INTC's structure? Why would the virtual
>>> one's properties have to match that of the physical one?
>>
>> It is because of how vAPLIC emulation load and store is working.
> 
> Thank you very much. This fully explains things, the more that of course
> emulation of loads and stores comes earlier in this series. Oleksii,
> really, please.

Sorry for that. Let me add some extra details where I think that pointer 
to physical APLIC regs are needed.

When APLIC tries to access TARGET register it is necessary to update 
real APLIC as inside this register it is coded information about Hart 
index, Guest Index (guest interrupt file id) and EIID (External 
Interrupt Identity). So to do that vintc should have access to physical 
APLIC registers.

The similar things I expected to be with some of other register, for 
example, that one which are stands for turning on/of interrupts (SETIE, 
CLRIE). If vAPLIC is requesting an enablement of an interrupt then I 
expect that correspondent physical APLIC register should be updated too 
as otherwise how then device interrupt will start to occur. So again it
is needed a pointer to physical APLIC to access these registers.

Does it make sense at least a little bit now?

> 
>>>> --- /dev/null
>>>> +++ b/xen/arch/riscv/vaplic.c
>>>> @@ -0,0 +1,74 @@
>>>> +/* SPDX-License-Identifier: MIT */
>>>> +/*
>>>> + * xen/arch/riscv/vaplic.c
>>>> + *
>>>> + * Virtual RISC-V Advanced Platform-Level Interrupt Controller support
>>>> + *
>>>> + * Copyright (c) Microchip.
>>>> + * Copyright (c) Vates
>>>> + */
>>>> +
>>>> +#include <xen/errno.h>
>>>> +#include <xen/sched.h>
>>>> +#include <xen/xvmalloc.h>
>>>> +
>>>> +#include <asm/aia.h>
>>>> +#include <asm/imsic.h>
>>>> +#include <asm/intc.h>
>>>> +#include <asm/vaplic.h>
>>>> +
>>>> +#include "aplic-priv.h"
>>>> +
>>>> +static int __init cf_check vcpu_vaplic_init(struct vcpu *v)
>>>> +{
>>>> +    int rc = 0;
>>>> +
>>>> +    rc = vcpu_imsic_init(v);
>>>> +    if ( rc )
>>>> +        return rc;
>>>> +
>>>> +    imsic_set_guest_file_id(v, vgein_assign(v));
>>>
>>> And vgein_assign() can't fail? (Rhetorical question - of course it can. That
>>> function shouldn't assert that it can fine a valid ID.)
>>
>> Technically it can't fail (except some bug of course), this function
>> should in general return 0 (when there aren't left h/w IDs)
> 
> Which is "failure".
> 
>> or something > 0 (when there are some h/w IDs).
> 
> Which is "success".
> 
>> ASSERT() inside it was added only
>> because of ...
>>
>>> But then - aren't you limiting the number of vCPU-s a host can handle by the
>>> number vgein IDs?
>>
>> ... At the moment, I am limiting because S/W interrutps guest files
>> (IDs) aren't supported.
> 
> As before - return error codes when errors occur.

I will return error code on the caller side of vgein_assign() if it 
returns 0.


> 
>>>> +static struct vintc * __init vaplic_alloc(void)
>>>> +{
>>>> +    struct vaplic *v = NULL;
>>>
>>> Onve again - why the initializer? In fact, ...
>>>
>>>> +    v = xvzalloc(struct vaplic);
>>>
>>> ... this could be the initializer.
>>
>> Sure, I will use it as initializer.
>>
>>>
>>>> +    if ( !v )
>>>> +        return NULL;
>>>> +
>>>> +    return &v->base;
>>>> +}
>>>
>>> If you returned and ...
>>>
>>>> +int __init domain_vaplic_init(struct domain *d)
>>>> +{
>>>> +    int ret = 0;
>>>> +
>>>> +    d->arch.vintc = vaplic_alloc();
>>>
>>> ... stored struct vaplic *, the slightly odd to_vaplic() macro wouldn't
>>> be needed.
>>
>> vaplic_alloc() return struct vintc *,
> 
> Which is what I'm putting under question. Why would a function of this name
> return anything else than struct vaplic *?

Agree, this function could return struct vaplic *. I will do that.

> 
>> which is then used by to_vaplic()
>> to get struct vaplic *.
> 
> And which is what I'm saying can be avoided.

'struct vintc *vintc;' is still needed in arch_domain struct as it is 
needed to call vintc->ops->... in the case like during vCPU creation:
     if ( (rc = v->domain->arch.vintc->ops->vcpu_init(v)) )
         goto fail;

And then if 'struct vintc *vintc;' is still present in arch_domain 
struct to_vaplic() is still needed in domain_vaplic_deinit(struct domain 
*d) function
to get struct vaplic *. (All it is true for other vAPLIC functions which 
take as an argument struct domain).

> 
>>>> +    if ( !d->arch.vintc )
>>>> +    {
>>>> +        ret = -ENOMEM;
>>>> +        goto fail;
>>>
>>> Nit: goto when simply return could be used.
>>>
>>>> +    }
>>>> +
>>>> +    d->arch.vintc->ops = &vaplic_ops;
>>>
>>> Are other kinds of ops structures going to appear? If not, why the extra
>>> indirection?
>>
>> At the moment, no I don't see any other kinds of ops struct. It was just
>> convenient way to group them and then easier to initialize them - just
>> one assignment instead of addinng a separate line in domain_vaplic_init().
> 
> Maybe I wasn't as clear as I should have been: Why the indirection when it
> doesn't abstract anything? I.e. why the "ops" field in the first place,
> when everyone could access the global (until such time that abstraction
> becomes necessary)?

It isn't really needed now. I can just embed ops into vintc explicitly 
without grouping them into structure.

Except the case if we want to have 'vintc_ops *ops;' field in 
arch_domain structure and separately 'void *vintc;' (which futhure could 
be casted to struct vaplic *) to drop fully to_vaplic() macros.

~ Oleksii

