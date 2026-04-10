Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uN3XAK0C2WmnlAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 16:01:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 518FE3D86BD
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 16:01:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1279129.1563701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBCPK-0002Ju-GW; Fri, 10 Apr 2026 14:00:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1279129.1563701; Fri, 10 Apr 2026 14:00:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBCPK-0002I2-DY; Fri, 10 Apr 2026 14:00:26 +0000
Received: by outflank-mailman (input) for mailman id 1279129;
 Fri, 10 Apr 2026 14:00:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wBCPI-0002Hw-T6
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 14:00:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wBCPI-0095An-8y
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 16:00:24 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d90272-bab6-0a2a0a5309dd-0a2a45028cb4-26
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 16:00:24 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d90278-42fa-0a2a45020019-d1558034e1b6-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 16:00:24 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-488a8ca4aadso23410335e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 07:00:24 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d67a46bdsm35000555e9.3.2026.04.10.07.00.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Apr 2026 07:00:22 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1775829624; x=1776434424; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=56gHCA88cH9uzv5u26JdrmCuPf30+MO+8oW1FGaiZMc=;
        b=hfeN0x2CCJ/MjRRaMSuFgcuOO5nOl9IQUWlA7IwptglNZdY/dH8trODTMpII+H/UKr
         HtJYDC9hd1V/IavCVQcnU8gloJuVLqZrQRpI1wiDxYb/ukDEL7PAU1wt1dx2tVd1V3+l
         nZfvMvZAjFjUQpN/jBSEyn6GszUOdhqznNYsee6SWmaec6HtAZf8DkVNL3DNVtfmyKar
         NGUPASsZ9U/jz3fkFnEEM0JM0WlLz4OLAbcY1rI5MOknv49lXHj7NukGyAA7J4KUEXjg
         QWHFVXrQY9QFRMLMklX67GDd80JwSGXPz7XX9pPmejYHSS/OUm+mGh2flk3E/svcjqkL
         lsXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775829624; x=1776434424;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=56gHCA88cH9uzv5u26JdrmCuPf30+MO+8oW1FGaiZMc=;
        b=rhH6k7+jgRDLen0aBWUHvB3onMGcINccXO3F6GArifTZwKeVehVbA7XiJDgW4mxDG5
         B/e4CgUK63hFTt1l3nG2q1n1TTbIEfgOkuQA5dHy5WDDKVIIdEmeV75s2W28M3HzA0Lq
         xhoc4KkcvrGRu+buw1RDOFvnVA3ZvAIWFsIitpj3SIso8S0y6faiQnnnPUuo+ivzzj90
         5l9Cec+78uBCy9mkIjSpK3cvODLbyFMqveEi7Zvprn7tEWLmtT28xRUVRw9b0YYIDsax
         t1WfSQ5lhihZChk12u5O7+zeMBwLrU1+d4nYqDJrVATNUsyYeWllhooFh6hFIEYtob3G
         +D6w==
X-Forwarded-Encrypted: i=1; AJvYcCXmEo6n5+SWGqZ1IpYq1BmtUCiQgXFvpCMAxzeRUBmfGJRSI1PVzzBSKlFQJT+hAtFTqzVnHpqKv+Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwB0OQpf59y3z/mdgzVsYwmNo1q1Wge6NCoatYzRhtBc40jFQEc
	ziRgQLUgqUueP+IqyRo0/LuOC2R4uxxOZctlXiE05ojrNtOpQK/IQNoH
X-Gm-Gg: AeBDietyN2WQJggy8UdVmujqqoRvzNoD/1902iggrMZ9TtheXHs5OOI0hIrTz8abIz6
	ZIqu4wMMULomsfkgeF2SIfojWM3dvpKXyPsAVmQJFdMrvLfxCzEoY60DE+C7OOQB4ehTduZkzRo
	IMwTXMBFaQyxYpBP3J03npw7IPwP1XgKILygfzJQeZ8WCm/8vNg07Jxp8Y0093sfzclGOTwr0/2
	9HqYOSvPBtDodXr4J+yL6ZQR6OGiq3VlceMiK60l47zQwnv+A1WiYmSCGF4x2sep3G+cps/XMjH
	9eWuR1IaIb3Jjz6EEdHf3hy6iPBYJrsGxzZiq/aY/a4ZYqAgCquNKlvRvtVItcs5tW7+IxIPDwu
	apSHJIMQEJ7IyEoeAw7NYpycpcWKBKyEp54vJfi4YkerSupI72KHzOsmhS7R8AXtbIbz+trbrhX
	w8kXZYAMvgeKC5lRGmGYr3fuTcP5hamb2mYk1DObq2wmnNPvlsJ5Txr2ojaaGf3dNSkheyy+2kr
	yg=
X-Received: by 2002:a05:600c:1391:b0:487:5c0:671f with SMTP id 5b1f17b1804b1-488d67e6a48mr46106395e9.9.1775829623205;
        Fri, 10 Apr 2026 07:00:23 -0700 (PDT)
Message-ID: <4fb7dc0a-9e29-46c0-86d0-f7ef17501a72@gmail.com>
Date: Fri, 10 Apr 2026 16:00:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 09/27] xen/riscv: implement make_intc_domU_node()
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
 <7a7f1430090eaf50cc3bff25e894c13404bffad5.1773157782.git.oleksii.kurochko@gmail.com>
 <9b3cd2ba-869b-4757-8bcd-51abad61b9f9@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <9b3cd2ba-869b-4757-8bcd-51abad61b9f9@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1775829624-46725CD1-87EA7BF1/10/73395122804
X-purgate-type: spam
X-purgate-size: 2456
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
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
X-Rspamd-Queue-Id: 518FE3D86BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/1/26 4:38 PM, Jan Beulich wrote:
> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/dom0less-build.c
>> +++ b/xen/arch/riscv/dom0less-build.c
>> @@ -3,6 +3,15 @@
>>   #include <xen/fdt-kernel.h>
>>   #include <xen/init.h>
>>   
>> +#include <asm/intc.h>
>> +
>> +int __init make_intc_domU_node(struct kernel_info *kinfo)
>> +{
>> +    intc_make_domu_dt_node(kinfo);
>> +
>> +    return 0;
>> +}
> 
> Is this wrapper really needed? Can't what's intc_make_domu_dt_node() right
> now become make_intc_domU_node()?

With current implementation no as intc_hw_ops used inside 
intc_make_domu_dt_node() is declared as static.

But I can introduce:

enum intc_version intc_hw_version(void)
{
    return intc_hw_ops->info->hw_version;
}

and the in make_intc_domU_node() just use switch/case to call interrupt 
controller specific functions.

Would it be better? It will also help to ...

> 
>> @@ -41,6 +41,10 @@ struct intc_hw_operations {
>>   
>>       /* handle external interrupt */
>>       void (*handle_interrupt)(struct cpu_user_regs *regs);
>> +
>> +    /* Create interrupt controller node for domain */
>> +    int (*make_dom_dt_node)(const struct kernel_info *kinfo,
>> +                            const struct dt_device_node *intc);
> 
> An __init-only hook is somewhat risky, just to mention it. In IOMMU code
> besides struct iommu_ops we have struct iommu_init_ops, just to give an
> example of where the same could have been the case.

.. not introduce hooks in this structure which won't exist after init.

> 
>> --- a/xen/arch/riscv/intc.c
>> +++ b/xen/arch/riscv/intc.c
>> @@ -67,3 +67,11 @@ void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority)
>>       intc_set_irq_type(desc, desc->arch.type);
>>       intc_set_irq_priority(desc, priority);
>>   }
>> +
>> +int __init intc_make_domu_dt_node(const struct kernel_info *kinfo)
>> +{
>> +    if ( intc_hw_ops && intc_hw_ops->make_dom_dt_node )
>> +        return intc_hw_ops->make_dom_dt_node(kinfo, intc_hw_ops->info->node);
>> +
>> +    return -ENOSYS;
> 
> How do you justify this choice of return value? This isn't even a hypercall
> handler.

That make_dom_dt_node() isn't provided by interrupt controller, so isn't 
supported or as it mentioned in the comment "not implemented in 
public/errno.h:
   XEN_ERRNO(ENOSYS,	38)	/* Function not implemented */

~ Oleksii

