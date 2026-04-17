Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBTyCmFD4mlh4AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 16:27:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F6F41C070
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 16:27:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1284446.1566233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDkAB-0000lr-0l; Fri, 17 Apr 2026 14:27:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1284446.1566233; Fri, 17 Apr 2026 14:27:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDkAA-0000iz-TW; Fri, 17 Apr 2026 14:27:18 +0000
Received: by outflank-mailman (input) for mailman id 1284446;
 Fri, 17 Apr 2026 14:27:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wDkA8-0000it-Nq
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 14:27:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDkA8-0057ZA-4a
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 16:27:16 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e2433c-5cb7-0a2a0a5109dd-0a2a4502a9d0-4
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 16:27:16 +0200
Received: from [209.85.167.50] (helo=mail-lf1-f50.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e24343-af86-0a2a45020019-d155a732cc4c-3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 16:27:16 +0200
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-59dea72099eso724393e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 07:27:15 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a4187e1131sm447699e87.42.2026.04.17.07.27.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Apr 2026 07:27:14 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1776436035; x=1777040835; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TBJo4n/ahWECnPclffoqwrKpqNOobUosJR4S0ORDXvI=;
        b=fGX2APZ7w6ZBoxGMWH4v7xdla4Kz4lz8TkF7OcA9Xbi/H+4312BlKjsRKgvUxgLh5k
         MkUiK5+RGpCotBWjY5PjRDpTQq8YCqn7wWGmbzbuIdz3peB4UAtUDpopLVlnQUlORRcG
         dQuler0cIrCO36ZYWxSpsnMgzsjhJlyJWmoDejJuJKLiu/x4cBajB48ETGFv+OdVOaoh
         OqbW5842APCrPzBRKrBGso6DR8desZLqvStb8XA92p7ZAWBx9w7VHM9qW61lNOlrAouI
         vC7nMguaPIqh3HD8nFiyH9OmyK+XOtinlq1y3YbLTSX/VJDc0w2ycGCzH2JhAuhDoRru
         m2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776436035; x=1777040835;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TBJo4n/ahWECnPclffoqwrKpqNOobUosJR4S0ORDXvI=;
        b=LhdIa8kKg5Yzc7x8rJFju6Dfw6Cwe8YlCsWFjKp2U2t0rOH/osoV/SFvgimKynPvur
         yrYdf2zamSBf26Uu2bcKQvKIjA5tSx/GDTNHAI4CDXl3B98FTmEgFZm3TtbynYlgJego
         JRZjwUHE27A9ZIgUn0clya/Wubow56AQXtNBrUP1DEMfgSD85I3OmgIgQNBSWwpMZdgg
         jvrLD4HdF9C5in9HXo2fTOO/fTxawBb5/W2BB49nXFRAyvYMASRGYvyoHmwDFsJJQ1dK
         2UnN4Kh2LhEKsJdp2AHPP9Sc9A6omaMy9PU+iwpsVcZzJU4X0WDtQaCc8l6nVcAYP5uL
         tgNA==
X-Forwarded-Encrypted: i=1; AFNElJ8/Sq+1bDCnPsYAjtDsl81jU/Hd5hE8fRqPxSa/UeXYuZ/vR9bXPMvAZQuRHKpxMjZfLBjNeXlRC4M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwTZ1/7qzXBJ1dO7XiA4zyJT52WThHyd2inPM4dE8EMGiq1klWL
	HmhNQJWeMdSh8Uf8BvfVsJbvdZTpgEw4RVwXdqZ0C1GOcXHak0EZcJFA
X-Gm-Gg: AeBDievjXMkUUZB+lEDOiVsSpVKBVzOliTeim9xEKbjAo5zLrs1Mmhawc7uyL/4mR3w
	tGFPLOTuJuzOgdlTk5SoFtE8JRMhDKOWV7z8HOIKUieagBaL1W0h8KDmJ+JHlubLg+0ZOaAnYaM
	60stkhEjV2a9UqaDfsfonK2ds6Njqh3KbSqPNLRQ/ARs1naEKwzWvfLbNEkEp1VArPzGTamwQ8b
	0rOeNIHsPwurbAAJSSJfKFUDyVkoeX/vnTHRP56bXWalLebKslZ5L//srKp4Yc9vE0PxDghwSkC
	TtGDFSZ/aR5/8XYgLXVDHWitTVHrCjI7Xn1fGk0IcFF089xjSBICG00Z4cB40Npx5YgGbZ6W/nE
	iDT5ScR7j+pvcgOXHBFwW577g9Uzk6aB3uZKoyL0bJOeXDQa+kjdt6khrOUc2yFQ4oVfJiS6Cl8
	9NjxFn5hF3OmI9YadmdSGLRvH83n3sqRkgCOrvz36FpyHK1dR8oqxov9JF/ierMipn83svmUUgw
	Yv7nd5Crvt5dQ==
X-Received: by 2002:a05:6512:12c2:b0:5a2:836a:ca47 with SMTP id 2adb3069b0e04-5a4172daaf5mr1118176e87.20.1776436034911;
        Fri, 17 Apr 2026 07:27:14 -0700 (PDT)
Message-ID: <4dfb488c-38cf-40b6-9d3b-85f2e9f90c42@gmail.com>
Date: Fri, 17 Apr 2026 16:27:13 +0200
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
 <ac19fdeb-90fa-42bd-9041-7c2aaa5346d4@gmail.com>
 <a578a32e-4cf3-4c61-b834-da2831c9a9bd@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <a578a32e-4cf3-4c61-b834-da2831c9a9bd@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1776436036-82374161-4E8DAE3B/10/73395122804
X-purgate-type: spam
X-purgate-size: 4504
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B0F6F41C070
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/17/26 3:53 PM, Jan Beulich wrote:
> On 17.04.2026 11:01, Oleksii Kurochko wrote:
>>
>>
>> On 4/16/26 1:49 PM, Jan Beulich wrote:
>>> On 13.04.2026 10:43, Oleksii Kurochko wrote:
>>>> On 4/1/26 5:16 PM, Jan Beulich wrote:
>>>>> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>>>>>> +    res = fdt_property(fdt, "#interrupt-cells", data, len);
>>>>>> +    if ( res )
>>>>>> +        return res;
>>>>>
>>>>> So host properties are again directly handed through to the guest?
>>>>
>>>> I am not sure that it can be different from what host has.
>>>>
>>>>> Shouldn't the number of interrupts (aiui that's the "number of cells"
>>>>> here) a guest gets be independent from the host it runs one?
>>>>
>>>> The #interrupt-cells property specifies how many 32-bit values (cells)
>>>> are used to encode a single interrupt specifier when referencing this
>>>> interrupt controller from another device node.
>>>> In this APLIC schema, it's fixed at const: 2, meaning every interrupt
>>>> reference requires exactly two cells — typically:
>>>>
>>>> Cell 1 — the interrupt source number (which of the riscv,num-sources
>>>> wired inputs)
>>>> Cell 2 — the interrupt type/trigger flags (e.g. edge vs. level, active
>>>> high/low)
>>>
>>> So what if #interrupt-cells is 3 in the DT Xen is handed? If Xen can
>>> cope, should that value really also be handed through to guests?
>>
>> I would say that it depends on what cell 3 will represent. But likely it
>> will be needed to hand it to the guest.
>>
>>>
>>>>>> +    regs = dt_get_property(aplic_node, "reg", &len);
>>>>>> +    if ( !regs )
>>>>>> +    {
>>>>>> +        printk("%s: Can't find 'reg' property\n", aplic_node->full_name);
>>>>>> +        return -FDT_ERR_XEN(ENOENT);
>>>>>> +    }
>>>>>> +
>>>>>> +    res = fdt_property(fdt, "reg", regs, len);
>>>>>> +    if ( res )
>>>>>> +        return res;
>>>>>> +
>>>>>> +    data = dt_get_property(aplic_node, "riscv,num-sources", &len);
>>>>>> +    if ( !data )
>>>>>> +    {
>>>>>> +        printk("%s: Can't find 'riscv,num-sources' property\n",
>>>>>> +                aplic_node->full_name);
>>>>>> +        return -FDT_ERR_XEN(ENOENT);
>>>>>> +    }
>>>>>> +
>>>>>> +    res = fdt_property(fdt, "riscv,num-sources", data, len);
>>>>>> +    if ( res )
>>>>>> +        return res;
>>>>>
>>>>> Or maybe this is the number of interrupts?
>>>>
>>>> This is the total count of hardware interrupt lines wired into this
>>>> APLIC domain.
>>>>
>>>> It could be independent from the host it runs one but looking at the
>>>> possible range [1,1023] for this property if we will put for a guest
>>>> lets say 22 but new host support only 20 when we will be in a trouble
>>>> anyway.
>>>
>>> Correct. But if you had some hosts with 1024 and some with 256, how
>>> would you bring up a guest on the former to later be able to migrate
>>> it to one of the latter when guests inherit the count from the host?
>>
>> It will be impossible to do that without emulation,
> 
> It's not quite clear to me why this would be.

if migration happens from the host with 256 to the host with 1024 the 
some interrupt remapping/multiplixing might be needed. But I am not 
consider this as a good option...

> 
>> so I expect it will
>> be easier to simply forbid migration to such a host.
>>
>> Basically, it is just a game of numbers. We could try to estimate how
>> many interrupts are needed for the guest, or for simplicity use some
>> hard-coded number (say 128 or 256, something “pretty small”). Will it
>> resolve the migration issue? Partially yes, but not fully, as there
>> could always be cases where the new host’s number of sources is lower
>> than our hard-coded “small guest value.” So having a smaller value will
>> likely help on average and will allow to support more h/w migration to
>> which could happen, but the migration issue will still be present.
> 
> An admin, knowing the capabilities of all hosts in a pool, can suitably
> limit guests intended to move among hosts. No migration issue at all.

... this one option is much better. I will introduce define for now in 
vaplic.h header or maybe just inside this function to hard-code this 
amount of interrupts supported by guest vAPLIC for now.

But in future it make sense to introduce property in host APLIC node 
something like riscv,num-guest-sources as IMSIC has for interrupt 
identites (riscv,num-guest-ids).

~ Oleksii

