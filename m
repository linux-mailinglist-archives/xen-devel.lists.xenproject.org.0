Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HpzIOkH2WnolAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 16:23:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E072F3D89BD
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 16:23:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1279174.1563727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBClR-0005jj-FN; Fri, 10 Apr 2026 14:23:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1279174.1563727; Fri, 10 Apr 2026 14:23:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBClR-0005iK-Cf; Fri, 10 Apr 2026 14:23:17 +0000
Received: by outflank-mailman (input) for mailman id 1279174;
 Fri, 10 Apr 2026 14:23:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wBClP-0005iE-O9
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 14:23:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wBClO-00FyaB-MR
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 16:23:14 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d907d1-2eae-0a2a0a5409dd-0a2a4506dba0-2
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 16:23:14 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d907d2-0df0-0a2a45060019-d1558031d11b-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 16:23:14 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-488b00ed86fso22606755e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 07:23:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d5da1341sm23201545e9.8.2026.04.10.07.23.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Apr 2026 07:23:13 -0700 (PDT)
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
        d=suse.com; s=google; t=1775830994; x=1776435794; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rbBrMqDpPOSzSclTg2txkhJ927dGqzW5ss/kfGU5DVI=;
        b=QoI0bDS6081A8IVvh7D9Im/iZjNrFqaVySA9ZHCoZzP1vwdg3pVmyCIG+MvacPltDz
         D4kvaqQwR+lKR3cvHdrO7Xfn9pfwDPi7AEn5c9WhQcB5umUXkRVAo7dUI1xjSr6LQc/m
         bTsewabveUhFguIrRVFUX30wZoq/Bc8iDVrqgW+5AgMKVUTOK2DugykhnIqQdAZpYIMa
         /wZdwjCs1r2dnsqyLOfCR3SUSfsWMbdPcZHqy7ZYU1zwsgbmeLpvsD1BLAQNQ0u/ho4q
         NexkmTDHfXVt8sb5u+whnXUJqVREvFrMv358vFQX5keH+TxafxXGTimmJ1AJ2MT34/0v
         PBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775830994; x=1776435794;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbBrMqDpPOSzSclTg2txkhJ927dGqzW5ss/kfGU5DVI=;
        b=ebmHtCjYkzN4/eVqSF2GLHmlwg2jSqXFca0lWOwHcngN7KaygeCIctWu+6Q8y65Zyv
         d+vpdYAt9zXXVYLJVox3kS/n+F8OijYl7XLOVl+g8/9vZwEqwzCdb+Y/+ON27Fxh5Gbr
         7gUMXI5vX6LYOR21qfindK81EykoGJFGh8GWxK3BiNp/NYPYS3dt7zfPKemex0HF8jaS
         FaX5w9HnH9cav5vs0R3v7Cy9pfpayhnRsIp5cKMxi4dAxKaf3znP7dlS/aC4jWK49nws
         0zuEaauEFu+whweCYPBOqbcR5ucpXQMmubknZnYs0rFb09A2n7rSMRnCYumrJ5SBS9b7
         k4rA==
X-Forwarded-Encrypted: i=1; AJvYcCXy81WVGq6v/sVzMYFn3hZhF/NK1SCinkFGG3r3la8bxXnugp5q5BsALPYupZxF+LrYo8KhUnl6Bmk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzcj+q4MkFJm7CD/lj3OMj6KA7BGQ1x/MxHJ4138dKDjghkZFCE
	caH6T79NcakcjlhxIz6d+5WnD2OT2PMy3b7M2xEJNKss4tJOclUKalwgoVLWoOzUGg==
X-Gm-Gg: AeBDiesNjXRoXdZ0e1Ckjf12QkLGOLdPT2exKBqRFg6iOV7+yjbKlyIkiVPWHucvsjV
	HTO9PwAUxsS31t/GA87fSV6spjn9IPKhKWHcnZ8be7Z8fCyQRXDupNDfKd3gtHGw7Y+8KnSvGQk
	iPOwfJAJNP4YVo8JoOBOUojc+ASpOGKoOx9F6F8QHHbnH8O9fnN1/hl6tk3pM5XMwOBIDs4d4Nm
	43qTzxnRIFDixjnjM1+mH9Jwfecl8tCQcu6CZD6ZRJ+5ZdE44Xd8ZpYWYF8YTNZTe5BoJZDJAwJ
	jBomWb2VFiZe5vu77VxWQcoMKqwpUpvpaLF4qkbpP1Ukok2TOXnO8j5t26Vsj4yTTQ7ox8FAwYQ
	7XqnOflH44fvvZ35hDQM4/IYVmuXnJCrhbIwujHTicNbqtLZVzhuv9jzCezcXoDpofvmDu7P40R
	wNQnoCeWnY8MIZ/PzhU6hwLbG06z4nAsmR/PUMGefEPfeWTRu9n0bD6kjpPBt84T8Ly9O/kThyW
	hTXkWiRxT7rUdo=
X-Received: by 2002:a05:600c:a416:b0:488:7f69:4abf with SMTP id 5b1f17b1804b1-488d67f946bmr31832635e9.12.1775830993779;
        Fri, 10 Apr 2026 07:23:13 -0700 (PDT)
Message-ID: <981dabd5-7508-437a-b654-666ffa04b6a0@suse.com>
Date: Fri, 10 Apr 2026 16:23:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 09/27] xen/riscv: implement make_intc_domU_node()
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
 <7a7f1430090eaf50cc3bff25e894c13404bffad5.1773157782.git.oleksii.kurochko@gmail.com>
 <9b3cd2ba-869b-4757-8bcd-51abad61b9f9@suse.com>
 <4fb7dc0a-9e29-46c0-86d0-f7ef17501a72@gmail.com>
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
In-Reply-To: <4fb7dc0a-9e29-46c0-86d0-f7ef17501a72@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1775830994-AEB333D8-3A23452D/0/0
X-purgate-type: clean
X-purgate-size: 2901
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
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E072F3D89BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.04.2026 16:00, Oleksii Kurochko wrote:
> On 4/1/26 4:38 PM, Jan Beulich wrote:
>> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/dom0less-build.c
>>> +++ b/xen/arch/riscv/dom0less-build.c
>>> @@ -3,6 +3,15 @@
>>>   #include <xen/fdt-kernel.h>
>>>   #include <xen/init.h>
>>>   
>>> +#include <asm/intc.h>
>>> +
>>> +int __init make_intc_domU_node(struct kernel_info *kinfo)
>>> +{
>>> +    intc_make_domu_dt_node(kinfo);
>>> +
>>> +    return 0;
>>> +}
>>
>> Is this wrapper really needed? Can't what's intc_make_domu_dt_node() right
>> now become make_intc_domU_node()?
> 
> With current implementation no as intc_hw_ops used inside 
> intc_make_domu_dt_node() is declared as static.

How does that matter if you simply rename intc_make_domu_dt_node()?

> But I can introduce:
> 
> enum intc_version intc_hw_version(void)
> {
>     return intc_hw_ops->info->hw_version;
> }
> 
> and the in make_intc_domU_node() just use switch/case to call interrupt 
> controller specific functions.
> 
> Would it be better? It will also help to ...
> 
>>
>>> @@ -41,6 +41,10 @@ struct intc_hw_operations {
>>>   
>>>       /* handle external interrupt */
>>>       void (*handle_interrupt)(struct cpu_user_regs *regs);
>>> +
>>> +    /* Create interrupt controller node for domain */
>>> +    int (*make_dom_dt_node)(const struct kernel_info *kinfo,
>>> +                            const struct dt_device_node *intc);
>>
>> An __init-only hook is somewhat risky, just to mention it. In IOMMU code
>> besides struct iommu_ops we have struct iommu_init_ops, just to give an
>> example of where the same could have been the case.
> 
> .. not introduce hooks in this structure which won't exist after init.

That would be nice (as already said).

>>> --- a/xen/arch/riscv/intc.c
>>> +++ b/xen/arch/riscv/intc.c
>>> @@ -67,3 +67,11 @@ void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority)
>>>       intc_set_irq_type(desc, desc->arch.type);
>>>       intc_set_irq_priority(desc, priority);
>>>   }
>>> +
>>> +int __init intc_make_domu_dt_node(const struct kernel_info *kinfo)
>>> +{
>>> +    if ( intc_hw_ops && intc_hw_ops->make_dom_dt_node )
>>> +        return intc_hw_ops->make_dom_dt_node(kinfo, intc_hw_ops->info->node);
>>> +
>>> +    return -ENOSYS;
>>
>> How do you justify this choice of return value? This isn't even a hypercall
>> handler.
> 
> That make_dom_dt_node() isn't provided by interrupt controller, so isn't 
> supported or as it mentioned in the comment "not implemented in 
> public/errno.h:
>    XEN_ERRNO(ENOSYS,	38)	/* Function not implemented */

"Function" as in "system call function" (normally; for us: "hypercall function").
ENOSYS really has a pretty narrow range of valid uses (according to my reading).
EOPNOTSUPP is the more generic alternative.

Jan

