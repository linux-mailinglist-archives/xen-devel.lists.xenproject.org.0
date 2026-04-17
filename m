Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEDDBQX34Wn50AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 11:01:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7642D419038
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 11:01:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1284062.1565992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDf54-0008VK-5X; Fri, 17 Apr 2026 09:01:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1284062.1565992; Fri, 17 Apr 2026 09:01:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDf54-0008SH-2a; Fri, 17 Apr 2026 09:01:42 +0000
Received: by outflank-mailman (input) for mailman id 1284062;
 Fri, 17 Apr 2026 09:01:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wDf52-0008SB-7U
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 09:01:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDf51-00GqDg-K7
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 11:01:39 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e1f6f2-bab6-0a2a0a5309dd-0a2a4502b6f2-6
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 11:01:39 +0200
Received: from [209.85.208.175] (helo=mail-lj1-f175.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e1f6f3-af86-0a2a45020019-d155d0afc420-3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 11:01:39 +0200
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-38e8292423fso3590111fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 02:01:39 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a4185ad0e7sm222358e87.12.2026.04.17.02.01.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Apr 2026 02:01:37 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1776416499; x=1777021299; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yyDOfGAP1XApDMdmzMdhEjnwoVw9GsVz1oYxoOc7im4=;
        b=KgN42AxeL0hQ+MVPY5bmZhJivIB/pFt3ha4oCbgJKBZI4M64c/+5SmAErVL84Naybz
         XxiDk97jHadeq314WeV7vQNH8iWvGPMDymvJbzrI96cUPym51gzj6k7Jw6RHvkAgiWJj
         lqu1esGuYLSsnSzmW+vMZExWfJRteV8xljdm+hjlfuXZLY1wPEjZbCPDHIftljh2xa6O
         heBWIxXS1RHDD/Imn5wLlCdDRa93VxUgIPx4hsLebkTUYaqHdlFQwe1Sjq2CHeoPZF3d
         0xOW4MMSmtRe6xyse5UOXg2MkmZaXrnq6i+gKQWy6bJ5Z7WVtLhY90kYiu0CCqhoMOYW
         ee0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776416499; x=1777021299;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yyDOfGAP1XApDMdmzMdhEjnwoVw9GsVz1oYxoOc7im4=;
        b=g23ji8D54jKdk4VuXHFgdxcOU5AJQNaZQ0k6dwdR5IAHG8uvjrAG/eSL2GzXdXjZtq
         hTBG7tqWLENBKPj67Rqd5GM3WhBebSB/foxgEGaU5zMJ4kWfrRKbF3ZrC5HHGcSm/FEO
         qIBc5F+oUdSQ7B/stBN8TEb+gb6AOaLmRb6YZJJ1yUdLzrFvGGMQg+Yk/dCfqijGiw6Y
         PRIU3h7+CaBvD3mTey0VzEvy+jx90vB9lmEQu0lQ4d4K9RSTRubQInMSzcZ1eTPdT11z
         wF5qjBEXsMoP810IP74dDoRq4DpT9rVGOp2tayWLUhH1/DIMbzuw6Rc9l+3buJbk8JzE
         SVbg==
X-Forwarded-Encrypted: i=1; AFNElJ9vAlx6+WZh7Z1fRa5OaHOm6iyE0G4vRqTSDjX8DiMYgRurqcFn0Azo/Bz/yK8frOZ66CGZs7p0QCc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzUSPFLL45pMMaHM1Dj79FqZL23HB4l0iF+9j2PrpeLWmEImxVX
	v2zSsQHt8WT7Un3HMmu1SrujnthwzkSa7jKwBt3KxYLiQwXmlLnpvZ6q
X-Gm-Gg: AeBDievv759hpdsXbzvKFh+TH4bKxU+RjCNEkp0/vk0oBiLy1HiALT33iJz9c7Sq5El
	MrIkemDEXEhNgMCD92BTlC2j7gCotg2aQgMMa4JMKP9D1hCaWcTnIVRXBjOZbnBnwlWAYFF7Bb0
	bdN3Cu6b7o8igCWP+yiqC7e54CXnVznsQxo/LBEqzW+GPCKVZHCRppxBS0Z6tojMHZPqc173OmY
	Yn2ep8WYxwYVtoK164TFLeeJHYxRGDMQ9xGH40XdpSC8t5KekAZQQdWs99HMMWufnpNJIhQcf/o
	2q/PGyqTOiunl8HeHiZNFfsLvKrubtyxn0KUcSaitHOb7RrgB4sWRBRbgHZP0gJVv7PgKrNDMww
	FL75hM1Fcut0aarRxFS6sKzIh4YO81L/0teT6rCqvwNFs3OQEfrTKuEPzdCGwmCFkp5Ln4wJ+Cd
	8jTpWgSQJdOFAspMRcO/kl9oC6r0qCpIgK9OFr+khM74ZUqYnNAEvB5P6jrEYW6s2veME9mo9HM
	TUeH3NIDyr35z9QLzkg+a0F
X-Received: by 2002:a05:6512:64ca:b0:5a4:176c:99ab with SMTP id 2adb3069b0e04-5a4176c99f7mr402192e87.4.1776416498271;
        Fri, 17 Apr 2026 02:01:38 -0700 (PDT)
Message-ID: <ac19fdeb-90fa-42bd-9041-7c2aaa5346d4@gmail.com>
Date: Fri, 17 Apr 2026 11:01:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 11/27] xen/riscv: create APLIC DT node for guest
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
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <462b5f7dbe4e5084a35fb869b59327c6c92d1fbf.1773157782.git.oleksii.kurochko@gmail.com>
 <362d1e3a-409c-40ab-8d2c-36dc30a04b88@suse.com>
 <9fd04b0f-3b04-4f1e-ac63-de0fca57d466@gmail.com>
 <7d022fea-0836-43b0-983d-5f7cb26a2e62@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <7d022fea-0836-43b0-983d-5f7cb26a2e62@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1776416499-8276A161-C00FA824/10/73395122804
X-purgate-type: spam
X-purgate-size: 3473
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[mailman];
	TAGGED_FROM(0.00)[];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:query timed out];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7642D419038
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/16/26 1:49 PM, Jan Beulich wrote:
> On 13.04.2026 10:43, Oleksii Kurochko wrote:
>> On 4/1/26 5:16 PM, Jan Beulich wrote:
>>> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>>>> +    res = fdt_property(fdt, "#interrupt-cells", data, len);
>>>> +    if ( res )
>>>> +        return res;
>>>
>>> So host properties are again directly handed through to the guest?
>>
>> I am not sure that it can be different from what host has.
>>
>>> Shouldn't the number of interrupts (aiui that's the "number of cells"
>>> here) a guest gets be independent from the host it runs one?
>>
>> The #interrupt-cells property specifies how many 32-bit values (cells)
>> are used to encode a single interrupt specifier when referencing this
>> interrupt controller from another device node.
>> In this APLIC schema, it's fixed at const: 2, meaning every interrupt
>> reference requires exactly two cells — typically:
>>
>> Cell 1 — the interrupt source number (which of the riscv,num-sources
>> wired inputs)
>> Cell 2 — the interrupt type/trigger flags (e.g. edge vs. level, active
>> high/low)
> 
> So what if #interrupt-cells is 3 in the DT Xen is handed? If Xen can
> cope, should that value really also be handed through to guests?

I would say that it depends on what cell 3 will represent. But likely it 
will be needed to hand it to the guest.

> 
>>>> +    regs = dt_get_property(aplic_node, "reg", &len);
>>>> +    if ( !regs )
>>>> +    {
>>>> +        printk("%s: Can't find 'reg' property\n", aplic_node->full_name);
>>>> +        return -FDT_ERR_XEN(ENOENT);
>>>> +    }
>>>> +
>>>> +    res = fdt_property(fdt, "reg", regs, len);
>>>> +    if ( res )
>>>> +        return res;
>>>> +
>>>> +    data = dt_get_property(aplic_node, "riscv,num-sources", &len);
>>>> +    if ( !data )
>>>> +    {
>>>> +        printk("%s: Can't find 'riscv,num-sources' property\n",
>>>> +                aplic_node->full_name);
>>>> +        return -FDT_ERR_XEN(ENOENT);
>>>> +    }
>>>> +
>>>> +    res = fdt_property(fdt, "riscv,num-sources", data, len);
>>>> +    if ( res )
>>>> +        return res;
>>>
>>> Or maybe this is the number of interrupts?
>>
>> This is the total count of hardware interrupt lines wired into this
>> APLIC domain.
>>
>> It could be independent from the host it runs one but looking at the
>> possible range [1,1023] for this property if we will put for a guest
>> lets say 22 but new host support only 20 when we will be in a trouble
>> anyway.
> 
> Correct. But if you had some hosts with 1024 and some with 256, how
> would you bring up a guest on the former to later be able to migrate
> it to one of the latter when guests inherit the count from the host?

It will be impossible to do that without emulation, so I expect it will 
be easier to simply forbid migration to such a host.

Basically, it is just a game of numbers. We could try to estimate how 
many interrupts are needed for the guest, or for simplicity use some 
hard-coded number (say 128 or 256, something “pretty small”). Will it 
resolve the migration issue? Partially yes, but not fully, as there 
could always be cases where the new host’s number of sources is lower 
than our hard-coded “small guest value.” So having a smaller value will 
likely help on average and will allow to support more h/w migration to 
which could happen, but the migration issue will still be present.

~ Oleksii

