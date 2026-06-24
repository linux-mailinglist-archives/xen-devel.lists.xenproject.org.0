Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TOZxLU7BO2odcQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 13:36:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4456BDB34
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 13:36:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="A/ISGBiy";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1344839.1603868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcLuD-0005Kj-CL; Wed, 24 Jun 2026 11:36:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344839.1603868; Wed, 24 Jun 2026 11:36:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcLuD-0005Jn-9D; Wed, 24 Jun 2026 11:36:33 +0000
Received: by outflank-mailman (input) for mailman id 1344839;
 Wed, 24 Jun 2026 11:36:31 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wcLuB-0005Jh-3d
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 11:36:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcLuA-0027xt-GR
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 13:36:30 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3bc130-e002-0a2a0a5209dd-0a2a450ab512-42
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 13:36:30 +0200
Received: from [209.85.208.170] (helo=mail-lj1-f170.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3bc13e-e40e-0a2a450a0019-d155d0aaecf8-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 13:36:30 +0200
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-39669bcaadfso7881081fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 04:36:30 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3999b182bb4sm34423541fa.34.2026.06.24.04.36.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 04:36:29 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782300990; x=1782905790; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3MzG+8HKfV4uLO40eP8RGOWtuXM4TAPEWaVM9IFRjjo=;
        b=A/ISGBiyzSC0WEHFiSTzO/UCBShAx9vRCAFyX1zX56DBS1bVxgHDL50DLb4yb1vM8G
         5FeAX83oeVwWMNeKnItrks+qIgI51I7eRPP08Hsww7pZNPMlo74Q6x3OtFgCdb6WYXPd
         u7+4fPRXsVVOZMPatxnMQhJZU94Vz20raagsGXwxQj5RZ8wRSpNXFSZvxOtD0ERFcXzf
         jfTo2DKWLxSFXEf89gaeAwv6LkIFRmj4mjma/SNXRGj1eA5iqQYx3kXVD2kDKv9reFdi
         ZcuKbK7dl/qPIixgZSdWg65Sy7TZoWTQpYYERSsqCrNi3yo2kruff2ZEb7EC1UhAYeXd
         nx/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782300990; x=1782905790;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3MzG+8HKfV4uLO40eP8RGOWtuXM4TAPEWaVM9IFRjjo=;
        b=rE/Str98l+DCfZ2ibh5ujL8ekipGLYNLLKxHgMuWWCLsH6BzPcJS0pNS8mYrmGvB9a
         70Ov04sBBKzbiEzIkPVLSnvIxmUiu1dWr0RYVqXJrBPtrcTWRo8HS+5ywYln/fCMYfsh
         zww9Fe0MbE9aRvDopH4IfcWSYwBS4YQsyfNxpSQrvCbgrqxjnAKSUqHeY8d5ec0xBMoz
         TK5E7U4h7NeUYY+b7Ywc/DOasF7t6Uxsu9MvhKoT5IVUjANxstdK/6EZaT4sORkSb0qN
         dqZXNs5tosCvzBnx3lTJERYr8NZwXke4gHTH1w9LTU0w0WlBIjKbBaNCPwfgDIPsqoaM
         RhQQ==
X-Forwarded-Encrypted: i=1; AHgh+RrviSyZbgUQcCKkzD3/MEPiVd7UdZ14ER7zWZZlrxDCC/LUaMNX7BqS+ZpNpta1VjoqCz40/566P54=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxuSGiDoI3919ie0Znt85qwVm2FVqupfSG8QQHsAbtDyfqEhqj8
	6k5zUaQ5HhAKh5E3XKH3U1cDCKtrsQzI4qjeHxUI6LDJ6iwZfYkYqMgv
X-Gm-Gg: AfdE7cml3j3zphNRKLXhHal8jav3YR8sIfKyUpJ5l9kQz7dk5Ts8zdhPE9CZ9ENkYRv
	m598HKP/7HHiHkBO2VY8dOSm4IJ/7oYnIZ/4O8Ey+F8gJcFu6VPGDxwUmmywrhUTdbYkPmpkTiA
	dXCXynemNGLRJrmTwxVhPOamxvSHvqadnzlJv+zY0wthuvpdqm9Pihxip0RmngGRGAb+CiP0zHd
	lWgFYlyWOAAsaS/F8PejzkGKFpIcQRN/QWsIr6m5QZMBmJdwWAbyMhuJeX0//9jlCvM/cR3qFB8
	zbOde1Uwa0bfmkHxoskgIkHefAfQs24MnZGGHMs7lMXuVJbsGwjQO308m7Yw3JyDh0eGvWnbjLx
	CkF/sFYWiXfd/zuasSrJJcnjGlLqNiydzKK6VhFmxf0nmMJyl0VpJJlYHX+GcI00mSvxbUXkhsq
	l8bn2BFZnUQ6yagpm027ypdCepoDsXjrH8JQVriMXOIZtVWr2B3iAgz8dqcC90S5TKo8k=
X-Received: by 2002:a2e:be22:0:b0:396:9967:cd69 with SMTP id 38308e7fff4ca-39aba1822b8mr7799321fa.13.1782300989575;
        Wed, 24 Jun 2026 04:36:29 -0700 (PDT)
Message-ID: <67d9ecf0-27d2-49ac-9186-6c7469921cf9@gmail.com>
Date: Wed, 24 Jun 2026 13:36:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/23] xen/riscv: implement make_intc_domU_node()
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
 <7b40037c2d0cce84f9e65d7c4a58ec773f7e49d0.1781693963.git.oleksii.kurochko@gmail.com>
 <fe4e5c8b-eceb-460d-8727-790d7750e170@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <fe4e5c8b-eceb-460d-8727-790d7750e170@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1782300990-CFD33DDE-2927552A/10/73395122804
X-purgate-type: spam
X-purgate-size: 1326
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email];
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
X-Rspamd-Queue-Id: 1C4456BDB34



On 6/22/26 4:34 PM, Jan Beulich wrote:
> On 17.06.2026 13:17, Oleksii Kurochko wrote:
>> Introduce a RISC-V specific function to create an interrupt controller
>> Device Tree node for DomU domains during dom0less build.
>>
>> Add make_intc_domU_node() to the dom0less build path and wire it to
>> a new generic helper, intc_make_domu_dt_node(), which delegates DT
>> node creation to the active interrupt controller implementation via
>> vintc_init_ops.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> with ...
> 
>> --- a/xen/arch/riscv/intc.c
>> +++ b/xen/arch/riscv/intc.c
>> @@ -3,6 +3,7 @@
>>   #include <xen/acpi.h>
>>   #include <xen/bug.h>
>>   #include <xen/device_tree.h>
>> +#include <xen/fdt-kernel.h>
>>   #include <xen/init.h>
>>   #include <xen/irq.h>
>>   #include <xen/lib.h>
>> @@ -72,3 +73,10 @@ void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority)
>>       intc_set_irq_type(desc, desc->arch.type);
>>       intc_set_irq_priority(desc, priority);
>>   }
>> +
>> +int __init make_intc_domU_node(struct kernel_info *kinfo)
>> +{
>> +    struct vintc *vintc = kinfo->bd.d->arch.vintc;
> 
> ... this also becoming pointer-to-const.
> 

I will add const.

~ Oleksii

