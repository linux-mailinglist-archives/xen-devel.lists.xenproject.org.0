Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IxNNjDr4WmKzgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 10:11:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 585934186DE
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 10:11:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1284018.1565960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDeHq-0001Fq-0h; Fri, 17 Apr 2026 08:10:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1284018.1565960; Fri, 17 Apr 2026 08:10:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDeHp-0001Cq-UB; Fri, 17 Apr 2026 08:10:49 +0000
Received: by outflank-mailman (input) for mailman id 1284018;
 Fri, 17 Apr 2026 08:10:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wDeHo-0001Ck-L7
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 08:10:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDeHn-003lTk-Ak
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 10:10:47 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e1eafd-bab6-0a2a0a5309dd-0a2a45018e9c-24
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 10:10:47 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e1eb07-c1f2-0a2a45010019-d155802bcc01-3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 10:10:47 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-488971db0fdso4266725e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 01:10:47 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc1c01cfsm26569925e9.10.2026.04.17.01.10.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Apr 2026 01:10:46 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1776413447; x=1777018247; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EQNaVOTpeCicYGJpF1kHlv2eAUBaL3KLjz9ACLSqR8U=;
        b=FLjbQECel6AXRP9lMlq6tHmvTCTBpvMWHPRaiX1Vq0YaVqWqFB2xHUNROt/RZVXEvU
         JLivBLH9uRHGr/ciQa7jvMQCYt+sj2jebiISPIfiEpH7aswBzF/djfweSaLOWswOeKEx
         ySg8ZwByxjIvzFA1iDJfEm/G6yGcULFKpZZpuEJ8PTmeM4/hlz8w9thXSeag+r/Q1wSb
         fJmWnTF2atMEUUt+gMwQT6D5u2eIi/uxFKtILZ2fS9va1NCsl6xdQJZCn1CQ3X+V2zhz
         gzvJeVOBGyXxvDwU10XGy7jSorQ99KsUygA9U/08bocaQw0Zh//04OGoSbYY8+ECANeS
         XUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776413447; x=1777018247;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EQNaVOTpeCicYGJpF1kHlv2eAUBaL3KLjz9ACLSqR8U=;
        b=gRH/8mT4wmxofxKe4gY77RmgrEBDfvm1TzEAiRAQkauoyfE7WTi7zYXiUZiYhz6fx3
         qzyhYtw3Vacl97rVMFL6Gh3lJitIqO30gfT27ZpodaVFMkcxdYjXWqVgdoA4mrdSE3j7
         tYvM4EnjYVOQqCt7Wx/8DFNB1JtHQ89vFaYbziBgOqj4UmIeeUt+cEwN62jJ7mChkI+C
         nG6MkZJSBpnEtgP5rTCNQp0X6A+FL7IjyE8bgGihsbF1pYtTNn66BL2BEPLelxtBjyiq
         s4NXcMO+2Lp3bfOIrEN8ONWkTY4rO1O42P6u3dOZH681duQsU2bvUqSTvQNJ4yT9TT9N
         7ZnA==
X-Forwarded-Encrypted: i=1; AFNElJ8nVqnAQOBx/CA4CWgfHsoFLlypwtEvJLYMVMi2cHNC9PYwwn8neUPx5hTWyl9uUQliueagls5gxv4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyMfFwSZXfSOMY9M4+6GVe+5r6+ECyhhj3c/4+7y4MTpbHvYgM9
	nMFVT/MX4/9opSwl3a3JcnWoBOZwfo1TZEjAXYOKJsyyJOix4eLIQNyn
X-Gm-Gg: AeBDiesgx+tBC0GL4zOgWnxb9i0DdbW6g5SktETDvzlHjMfPZcmMS0T3rKb0bLDCLny
	I103l+AAlSNbjCK9Bw3vQzKSUxVbxke1kSdqgDg7kreWLBdk6ga8jsqQHNUZ6w4kdsYGDcu6Hhg
	Y3jzj1K9JLa0Qns5+lEfmNuXxxtEJbCtPr3YUvokt7wJIpyKzUioG2c+oVlyg+SYbF2p2ZWA9rk
	7Y1wclX1iJgOgu8nc2gAt4273xG+hi8ZVoxBHGOLK+hpzfpcHpO6CaSwOajVYytlkx2gkKE+WiL
	SGDmcUtcuksCKs1zRpXLX870+x4ztS03YWXjMKnIeuLCjy5wFg0gG6oA4+L07vtMl0z96rFyqlW
	NvZjvrFi/hACK90EscIcDXSz45s+gnFtYrljP+WnbLHGEkSzM+9IA11qYg+FwkZk4FNpL4cDjw9
	y+vD2GZl7V09uaS3rmvVSjTn8wcNi2RHCYoV1/FBmXHOyDFikxBkbuzoPDJOmKWEAvrdaDWZLNO
	ZcRqLMAirSUmg==
X-Received: by 2002:a05:600d:1c:b0:488:ba5f:984f with SMTP id 5b1f17b1804b1-488fb746d8amr19136085e9.6.1776413446606;
        Fri, 17 Apr 2026 01:10:46 -0700 (PDT)
Message-ID: <ca52ad3b-d14d-478b-bf6d-2835f79fa257@gmail.com>
Date: Fri, 17 Apr 2026 10:10:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 10/27] xen/riscv: generate IMSIC DT node for guest
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
 <8154eae081d14da89f27bad581270cc5bba6ccfc.1773157782.git.oleksii.kurochko@gmail.com>
 <93e8407e-cff0-42cc-8cfd-2d82f536a886@suse.com>
 <b2c8e859-a91a-469f-b674-0942d240f0d9@gmail.com>
 <953a4d7a-95a0-4a11-b236-efdf21eb125c@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <953a4d7a-95a0-4a11-b236-efdf21eb125c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1776413447-BDC64FF4-2791083B/10/73395122804
X-purgate-type: spam
X-purgate-size: 3269
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
X-Rspamd-Queue-Id: 585934186DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/16/26 1:42 PM, Jan Beulich wrote:
> On 10.04.2026 17:40, Oleksii Kurochko wrote:
>> On 4/1/26 5:05 PM, Jan Beulich wrote:
>>> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>>>> Guests using the IMSIC interrupt controller require a corresponding
>>>> Device Tree description. Add support for generating an IMSIC node when
>>>> building the guest DT.
>>>>
>>>> Keep a reference to the host IMSIC DT node and reuse its compatible
>>>> property while constructing the guest-visible node.
>>>
>>> Again raises a migration concern. Presumably a guest would then be able
>>> to migrate only to other hosts with the same compatible property.
>>
>> Right, but I don't think we can do too much and it is the simplest
>> approach just to migrate to hosts with the same compatible property.
>>
>> If you concern is about DTS property then for IMSIC it will be always
>> riscv,imsics according to the RISC-V DT spec. (IIRC, the only other
>> option could be qemu,riscv). Actually, I can just hard code
>> "riscv,imsic" explicitly instead of re-using of host name.
>>
>> If your concern is that we will migrate to a host which doesn't support
>> IMSIC at all then we should or (a) don't migrate to such host or (b)
>> provide an emulation of IMSIC. And option (b) would be terrible from at
>> least performance point of view.
> 
> That would all be only a secondary concern - in an IMSIC is needed right
> now, so be it. My primary concern is with inheriting the host IMSIC's
> properties.
Could we do really something better?

At the moment, the following properties are inhereted:
node name -> not an issue at all, it is just a name of the node and 
generally doesn't matter what it is in the matter of DTB generation as 
phandle number of this node will be used as pointer to this node, not 
the name. If it would be better I can hard code just "imsic".

compatible -> also, not a big issue. According to current DT RISC-V 
bindings it could be just "riscv,imsic". But then I have the question 
what if one day someone will come up with own implementation of IMSIC 
then "riscv,own-imsic" will be in host DTB and so I expect that guest 
DTB should have it as this h/w expects to use specifically OWN-IMSIC 
driver. So it seems okay to copy compatible from host DTB. Yes, if 
migration will happen where just "riscv,imsic" is supported then it 
can't be easily migrated to such h/w and its okay. But generally I 
expect that compatible will always riscv,imsic.

riscv,num-ids -> generally, it could be any number from [63, 2047], but 
it seems like there is no any sense if put a value bigger then 
guest-num-ids=min(riscv,num-ids, riscv,num-guest-ids) for guest as h/w 
can't support more then that. At the same time I don't see too much 
sense to tell a guest that it supports less then guest-num-ids. What is 
the problem to give a guest a maximum that IMSIC could provide? With 
migration, of course, it will be an issue if new host will support 
different number of riscv,num-ids but I don't know what we can do better 
then just avoid migration to such hosts if old-num-ids > new-num-ids 
without significant performance drop.

As an summary it is okay IMO to re-use these host properties.

~ Oleksii



