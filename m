Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CTROl7Z4GlymgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 14:43:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 439C440E57B
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 14:43:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283353.1565608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDM3O-0001Sl-UG; Thu, 16 Apr 2026 12:42:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283353.1565608; Thu, 16 Apr 2026 12:42:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDM3O-0001Pi-RG; Thu, 16 Apr 2026 12:42:42 +0000
Received: by outflank-mailman (input) for mailman id 1283353;
 Thu, 16 Apr 2026 12:42:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wDM3M-0001Pc-Vi
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 12:42:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDM3L-0010mU-Sq
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 14:42:39 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e0d930-bab6-0a2a0a5309dd-0a2a450ae2d8-38
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 14:42:39 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e0d93f-56b3-0a2a450a0019-d1558031b1f4-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 14:42:39 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4888375f735so79319245e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 05:42:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488f5818d70sm85572595e9.4.2026.04.16.05.42.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 05:42:38 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776343359; x=1776948159; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=USu/+LOPn8sXbq7XMENtWJaw1hDBemDmdviQ/wN4M3g=;
        b=TQCNYStRnk/UEppDapTmP5zO3a2axXYAQH6iUffsHAMNLyUbKwSHnsDNPWN/fD+809
         F8XyYEPF6lOvcYycOn8uAADBcDmpBFBnEa3sasfU2zAmyAYmWtiA01Qpwf7OL33V23m8
         +h+ohwPdgN9Twxe/xDCZRZ6Y+jGiJkZw6TAN/L4aXWfCuJACTIo3wearh2mRf7qcvcb8
         qQpdATQ21x9jXqoxzXam356IWVObLfLZ5YilSgsjuwMiLJF/PxaKkYg2N3fJxw4P0HWR
         NsQekpUWmL8Zq0eAoRRT94CLgzLzC7PLpCRz4R04ACXoT7BO2d2leAh6kIknv1UmZuqd
         BmHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776343359; x=1776948159;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=USu/+LOPn8sXbq7XMENtWJaw1hDBemDmdviQ/wN4M3g=;
        b=N9YiAXCXS1vBXrQZOkNiiUpQWFQR8UAqfCP5hnTNPP8Sb5qo+6+BZrkLFbOPfxhIhB
         rkaH/fQfqnLBOltGl95LiFvwu+mCyEsbo8IPTx7ya+LmKJCcN2FaAkNJCDdcwyUFI8jX
         h8WokPgRM8iI4yEPEfZ+lo1063tJzl8Qcz+1/btndoi55MkoTjTbUcJuBHekvCt6VqSl
         r5VwR3CJrU4xfaH11x66NIMDeUC+NyJiZXBZTJCISXq30E67YBImjZF5FxQ91aaR2iVD
         nXnftiu5Y+9gyqDbMwBB4e/UmeFo6+WQW3UP8/2JLG765Tw2VUa87mfw4Ze3zQxieN+f
         QUUQ==
X-Forwarded-Encrypted: i=1; AFNElJ/JYQhHyUAzX71dgH+HTI/ayknytofUfngz40W58aHNwn109YKB0rB71mAHFulzJE8pBj64SGSXi/I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyOlRKijVpqNoUNbzfdNr0zjjXdxAk/mvC+9irgb4sgpf255c7h
	z4lBgzMrUeThdcM3POm+rrU57+DzUxPUzCifBmBsPC6NuVVvDzgV34Xw3BzU9HLpfw==
X-Gm-Gg: AeBDietcszea2Xjs+Zyedc/O7shig5uF8uqPrK4D771KtXfHhAZoyh0j/thf6E+UGEA
	orEhEdT00CUvJySJ/tp+EOm2ZdW4PZeG4c7DGa7/F52bonJz3nDbg+WEkTUMCEpljwBzKMv3kFR
	1aafFmnRNb6jO2p1NjVzBTyGMNyTqP2z+hE+UjcLetik6xfUAsGWt4vMPtncJkXHiBpwLfRUqPd
	+dbTvRmEPWjhwNgie/imUSPPTAs6tlLpHIcJE7qCra/w9PymdZZHoMCBdaIxX7NC1YUtcvSnv2m
	CnlS2RRFHOejF+xdaY4zYJogeCts188VNUabJZq83gkiL3shzWrwmSVkECh/IsmgC97Z4uI2TQn
	DPHzCILPcMxY0lGkr3sAp6JL1o+owgD+2sD3KetESb0/QzaLoXM+5LBXgSF87Kan6+4onOE71JR
	SJQhBduDyD/xoyfBmDDe2EJYA0SiZav67Vh+FxJcKMScMPSLbiCVSuPIKBqkbNKX1+KRdHy8JnL
	3tz1uFukcpKaUKjHOijdc0gtZhonBXiqZdg
X-Received: by 2002:a05:600c:c08e:b0:480:3ad0:93bf with SMTP id 5b1f17b1804b1-488d6864d41mr250459315e9.24.1776343358940;
        Thu, 16 Apr 2026 05:42:38 -0700 (PDT)
Message-ID: <da07da74-220a-4dbb-84fc-2e7aeb6b19df@suse.com>
Date: Thu, 16 Apr 2026 14:42:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 15/27] xen/riscv: add very early virtual APLIC (vAPLIC)
 initialization support
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <a324161d-f8b4-47fe-b5ac-52df6060e45b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1776343359-445648B7-8D279A63/0/0
X-purgate-type: clean
X-purgate-size: 4284
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 439C440E57B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 14.04.2026 12:27, Oleksii Kurochko wrote:
> On 4/2/26 1:58 PM, Jan Beulich wrote:
>> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>>> @@ -47,6 +48,19 @@ struct intc_hw_operations {
>>>                               const struct dt_device_node *intc);
>>>   };
>>> +
>>> +struct vintc {
>>> +    const struct intc_info *info;
>>
>> Isn't this referencing a physical INTC's structure? Why would the virtual
>> one's properties have to match that of the physical one?
> 
> It is because of how vAPLIC emulation load and store is working.

Thank you very much. This fully explains things, the more that of course
emulation of loads and stores comes earlier in this series. Oleksii,
really, please.

>>> +struct vaplic {
>>> +    struct vintc base;
>>
>> How does "base" fit with the type of the field?
> 
> The field name base is a idiom for embedding a "base class" struct as 
> the first member, enabling a form of inheritance.
> 
> Any suggestion how to rename it better?

vintc?

>>> --- /dev/null
>>> +++ b/xen/arch/riscv/vaplic.c
>>> @@ -0,0 +1,74 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * xen/arch/riscv/vaplic.c
>>> + *
>>> + * Virtual RISC-V Advanced Platform-Level Interrupt Controller support
>>> + *
>>> + * Copyright (c) Microchip.
>>> + * Copyright (c) Vates
>>> + */
>>> +
>>> +#include <xen/errno.h>
>>> +#include <xen/sched.h>
>>> +#include <xen/xvmalloc.h>
>>> +
>>> +#include <asm/aia.h>
>>> +#include <asm/imsic.h>
>>> +#include <asm/intc.h>
>>> +#include <asm/vaplic.h>
>>> +
>>> +#include "aplic-priv.h"
>>> +
>>> +static int __init cf_check vcpu_vaplic_init(struct vcpu *v)
>>> +{
>>> +    int rc = 0;
>>> +
>>> +    rc = vcpu_imsic_init(v);
>>> +    if ( rc )
>>> +        return rc;
>>> +
>>> +    imsic_set_guest_file_id(v, vgein_assign(v));
>>
>> And vgein_assign() can't fail? (Rhetorical question - of course it can. That
>> function shouldn't assert that it can fine a valid ID.)
> 
> Technically it can't fail (except some bug of course), this function 
> should in general return 0 (when there aren't left h/w IDs)

Which is "failure".

> or something > 0 (when there are some h/w IDs).

Which is "success".

> ASSERT() inside it was added only 
> because of ...
> 
>> But then - aren't you limiting the number of vCPU-s a host can handle by the
>> number vgein IDs?
> 
> ... At the moment, I am limiting because S/W interrutps guest files 
> (IDs) aren't supported.

As before - return error codes when errors occur.

>>> +static struct vintc * __init vaplic_alloc(void)
>>> +{
>>> +    struct vaplic *v = NULL;
>>
>> Onve again - why the initializer? In fact, ...
>>
>>> +    v = xvzalloc(struct vaplic);
>>
>> ... this could be the initializer.
> 
> Sure, I will use it as initializer.
> 
>>
>>> +    if ( !v )
>>> +        return NULL;
>>> +
>>> +    return &v->base;
>>> +}
>>
>> If you returned and ...
>>
>>> +int __init domain_vaplic_init(struct domain *d)
>>> +{
>>> +    int ret = 0;
>>> +
>>> +    d->arch.vintc = vaplic_alloc();
>>
>> ... stored struct vaplic *, the slightly odd to_vaplic() macro wouldn't
>> be needed.
> 
> vaplic_alloc() return struct vintc *,

Which is what I'm putting under question. Why would a function of this name
return anything else than struct vaplic *?

> which is then used by to_vaplic() 
> to get struct vaplic *.

And which is what I'm saying can be avoided.

>>> +    if ( !d->arch.vintc )
>>> +    {
>>> +        ret = -ENOMEM;
>>> +        goto fail;
>>
>> Nit: goto when simply return could be used.
>>
>>> +    }
>>> +
>>> +    d->arch.vintc->ops = &vaplic_ops;
>>
>> Are other kinds of ops structures going to appear? If not, why the extra
>> indirection?
> 
> At the moment, no I don't see any other kinds of ops struct. It was just 
> convenient way to group them and then easier to initialize them - just 
> one assignment instead of addinng a separate line in domain_vaplic_init().

Maybe I wasn't as clear as I should have been: Why the indirection when it
doesn't abstract anything? I.e. why the "ops" field in the first place,
when everyone could access the global (until such time that abstraction
becomes necessary)?

Jan

