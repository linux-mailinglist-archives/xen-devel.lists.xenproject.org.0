Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BQGAsYW3mlBmwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 12:28:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9F93F8AD2
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 12:28:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1281564.1564426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCazF-0003pb-LL; Tue, 14 Apr 2026 10:27:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281564.1564426; Tue, 14 Apr 2026 10:27:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCazF-0003mj-IS; Tue, 14 Apr 2026 10:27:17 +0000
Received: by outflank-mailman (input) for mailman id 1281564;
 Tue, 14 Apr 2026 10:27:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wCazE-0003lX-5v
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 10:27:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCazC-002Cy5-NK
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 12:27:14 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69de167d-bab6-0a2a0a5309dd-0a2a4506a812-26
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 12:27:14 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69de1682-0df0-0a2a45060019-d155802ee594-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 12:27:14 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso52278555e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 03:27:14 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488ede15694sm63957855e9.3.2026.04.14.03.27.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Apr 2026 03:27:13 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1776162434; x=1776767234; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Soy1YtMmw4vyXzarneePUgAcchK40/FeKLITTrphjhw=;
        b=U8ail76H78PcW4ypBXIboZ0zpJbW7CCaCneLzZ+uBGR5Pl/V0NV0ZgFygRxY5RZZ1a
         +klr6nbkzpIooWQrAP0bslCH/PgGKs0f1eTR9OIu0ZdYmA4lLLRoDAcQWBNy0EUGSx94
         gb9XP0H6qQS34mBDEOkASkeeOV0p4Iws0VAs3gBQomHHtZZ2+pr/B4LRTJHljv9ZkSn2
         injZWvTK+WrPTj89cnfIQxI0UXtnMjzFiaRg6n4OTBpFt3Eu5mzDpTvXbrq96FKBQ599
         YlMcskkFF1d+NYmONoUzOnm4rVbAJWI30WkUzYSbPJ5X/4TE1F5C7K0hyA6Lm5E7C/Dd
         NMjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776162434; x=1776767234;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Soy1YtMmw4vyXzarneePUgAcchK40/FeKLITTrphjhw=;
        b=HxdoEbFBpdPRLI4O7fAECG5jzQ0e8mFEfUSjVzfC4AvQ6phaKuyk78CWrxnCJVTCK9
         JYYhA8dq8E/T7XyqMPrQUWBuvt8W3IRQAKOStgIbZ2W2DOEMOhCVXXo9RdktJXKSNy2e
         Rm6xh5G4GD1623yupCEcQozjzWPJ36mTaknTSabzBsnTww9N5YJh90BGb01ncXwXXjUz
         vCpRKKlTbvyLf6Ew/zIwg2HCeyXLdJFlSoAzHZaea3Xi0ohWLVErI77atbwchOpn8duW
         YigWhU01mZ5CIGkieipN4e4mbclzHVzGXNgXj+RKDKeetfo/Eij+7nyIqYxFtupshAGF
         uOOw==
X-Forwarded-Encrypted: i=1; AFNElJ9Yn/nC0V3/PQ/HMUBYoO8D4Bm//368VO2o+gVgod17dPVEaMJNMqSWSYs/djUUBaqqQyNlhGAjO5c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxSe/4dZEey1F3ouL+cwtj+ylsoyho9IaXiaYnG7+X8fdqY2WxP
	Q9Fl45myHZ7JiF1rxqyG4J/FTj3YMNe8eJlJld8a+JID3nkTTob9wAPm
X-Gm-Gg: AeBDietIWmRw5o445rabJAW2sFGasiKfIyv3RZhdR5AZFhj1N1vJNcAmsPJp3UN7p0e
	i4pNkEKIvi3OfeG+mNbH8xA2780Tx8NlmrOyS4PDRjj7olTtgTdc/H6hPv349xBLx/6lHj2Eb55
	/6Bm2jUTmtaCOwSACcRCrkRe+CyRz/+t9tOwiOKMoECw4bQz2lbYDrU2aeanJRfyaRznKeN1+U6
	VEkK9/L5QFsvcL+M/ZXZAL/+0H7Zs53AOj/uShILVoOiqjfiLJt360h8oJK1/QtqrZiFIkL78HE
	ebT34snp7aKIOrkS9cRzqycp9KrZmcl4/c6bncxvP1q8OFQqSSJYQyfH0xckyWjG6xa1iizO+t9
	513BeyM22tgShQDM8g7gC2bMyeR4542VYkt5bUdObCCf61Yhyu5D0qiJZjOpRCEBKFncEoyoqQ0
	ghUOJcg1Yg7sktJb6lZ+0PDTD2+5HmhCK+RV/bzFar46YoUQlVSykQ6VBXjLgxbHwb7MW9Pirmp
	fZ4O6zKqvuLOQ==
X-Received: by 2002:a05:600c:4f56:b0:480:690e:f14a with SMTP id 5b1f17b1804b1-488d68765fcmr253833985e9.14.1776162433894;
        Tue, 14 Apr 2026 03:27:13 -0700 (PDT)
Message-ID: <a324161d-f8b4-47fe-b5ac-52df6060e45b@gmail.com>
Date: Tue, 14 Apr 2026 12:27:11 +0200
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <44cb3124-8972-4a0c-b785-64f2022f178b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1776162434-65A543D8-5155CBAE/10/73395122804
X-purgate-type: spam
X-purgate-size: 5930
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
	NEURAL_HAM(-0.00)[-0.999];
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
X-Rspamd-Queue-Id: 5D9F93F8AD2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/2/26 1:58 PM, Jan Beulich wrote:
> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>> @@ -47,6 +48,19 @@ struct intc_hw_operations {
>>                               const struct dt_device_node *intc);
>>   };
>> +
>> +struct vintc {
>> +    const struct intc_info *info;
> 
> Isn't this referencing a physical INTC's structure? Why would the virtual
> one's properties have to match that of the physical one?

It is because of how vAPLIC emulation load and store is working.

> 
>> --- /dev/null
>> +++ b/xen/arch/riscv/include/asm/vaplic.h
>> @@ -0,0 +1,36 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * xen/arch/riscv/vaplic.c
>> + *
>> + * Virtual RISC-V Advanced Platform-Level Interrupt Controller support
>> + *
>> + * Copyright (c) Microchip.
>> + */
>> +
>> +#ifndef ASM__RISCV__VAPLIC_H
>> +#define ASM__RISCV__VAPLIC_H
>> +
>> +#include <xen/kernel.h>
>> +#include <xen/types.h>
>> +
>> +#include <asm/intc.h>
>> +
>> +struct domain;
>> +
>> +#define to_vaplic(v) container_of(v, struct vaplic, base)
> 
> I'm confused here, maybe first of all because of the use of v. v is our
> common identified for struct vcpu * instances. Using it in a macro like
> this one suggests a struct vcpu * needs passing into the macro. Yet from
> the two uses of the macro that doesn't look to be the case.

v it is stale name when vpalic() was per vCPU. (what looks incorrect as 
on real h/w APLIC isn't belongs to one pCPU).

> 
> Perhaps best to have a struct domain * passed into here?

struct domain * will be better.

> 
>> +struct vaplic_regs {
>> +    uint32_t domaincfg;
>> +    uint32_t smsiaddrcfg;
>> +    uint32_t smsiaddrcfgh;
> 
> The latter two aren't used, and generally I'd expect a h-suffixed field to
> exist only for RV32. (The un-suffixed field then would need to be unsigned
> long, of course.)

It should be a part of another patch. I will drop them for now.

> 
>> +};
>> +
>> +struct vaplic {
>> +    struct vintc base;
> 
> How does "base" fit with the type of the field?

The field name base is a idiom for embedding a "base class" struct as 
the first member, enabling a form of inheritance.

Any suggestion how to rename it better?

> 
>> --- a/xen/arch/riscv/intc.c
>> +++ b/xen/arch/riscv/intc.c
>> @@ -6,6 +6,7 @@
>>   #include <xen/init.h>
>>   #include <xen/irq.h>
>>   #include <xen/lib.h>
>> +#include <xen/sched.h>
>>   #include <xen/spinlock.h>
> 
> Why is this change needed all of the sudden?

Incorrect rebase. I will drop that.

> 
>> --- /dev/null
>> +++ b/xen/arch/riscv/vaplic.c
>> @@ -0,0 +1,74 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * xen/arch/riscv/vaplic.c
>> + *
>> + * Virtual RISC-V Advanced Platform-Level Interrupt Controller support
>> + *
>> + * Copyright (c) Microchip.
>> + * Copyright (c) Vates
>> + */
>> +
>> +#include <xen/errno.h>
>> +#include <xen/sched.h>
>> +#include <xen/xvmalloc.h>
>> +
>> +#include <asm/aia.h>
>> +#include <asm/imsic.h>
>> +#include <asm/intc.h>
>> +#include <asm/vaplic.h>
>> +
>> +#include "aplic-priv.h"
>> +
>> +static int __init cf_check vcpu_vaplic_init(struct vcpu *v)
>> +{
>> +    int rc = 0;
>> +
>> +    rc = vcpu_imsic_init(v);
>> +    if ( rc )
>> +        return rc;
>> +
>> +    imsic_set_guest_file_id(v, vgein_assign(v));
> 
> And vgein_assign() can't fail? (Rhetorical question - of course it can. That
> function shouldn't assert that it can fine a valid ID.)

Technically it can't fail (except some bug of course), this function 
should in general return 0 (when there aren't left h/w IDs) or something 
 > 0 (when there are some h/w IDs). ASSERT() inside it was added only 
because of ...

> 
> But then - aren't you limiting the number of vCPU-s a host can handle by the
> number vgein IDs?

... At the moment, I am limiting because S/W interrutps guest files 
(IDs) aren't supported.

> 
>> +    return rc;
>> +}
>> +
>> +static const struct vintc_ops vaplic_ops = {
>> +    .vcpu_init = vcpu_vaplic_init,
>> +};
>> +
>> +static struct vintc * __init vaplic_alloc(void)
>> +{
>> +    struct vaplic *v = NULL;
> 
> Onve again - why the initializer? In fact, ...
> 
>> +    v = xvzalloc(struct vaplic);
> 
> ... this could be the initializer.

Sure, I will use it as initializer.

> 
>> +    if ( !v )
>> +        return NULL;
>> +
>> +    return &v->base;
>> +}
> 
> If you returned and ...
> 
>> +int __init domain_vaplic_init(struct domain *d)
>> +{
>> +    int ret = 0;
>> +
>> +    d->arch.vintc = vaplic_alloc();
> 
> ... stored struct vaplic *, the slightly odd to_vaplic() macro wouldn't
> be needed.

vaplic_alloc() return struct vintc *, which is then used by to_vaplic() 
to get struct vaplic *.

> 
>> +    if ( !d->arch.vintc )
>> +    {
>> +        ret = -ENOMEM;
>> +        goto fail;
> 
> Nit: goto when simply return could be used.
> 
>> +    }
>> +
>> +    d->arch.vintc->ops = &vaplic_ops;
> 
> Are other kinds of ops structures going to appear? If not, why the extra
> indirection?

At the moment, no I don't see any other kinds of ops struct. It was just 
convenient way to group them and then easier to initialize them - just 
one assignment instead of addinng a separate line in domain_vaplic_init().

> 
>> +    to_vaplic(d->arch.vintc)->regs.domaincfg =
>> +        APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM;
>> +
>> + fail:
>> +    return ret;
>> +}
>> +
>> +void __init domain_vaplic_deinit(struct domain *d)
>> +{
>> +    struct vaplic *vaplic = to_vaplic(d->arch.vintc);
>> +
>> +    XVFREE(vaplic);
> 
> If this cleared the struct domain field, then yes. But the way it is, just
> xvfree() will suffice. (Re-work following other remarks may want it to
> become XVFREE() again, though.)

Agree, it could be xvfree() for now.

Thanks.

~ Oleksii

