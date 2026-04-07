Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPq8OGTG1GlbxQcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 10:55:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B323AB941
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 10:55:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274541.1560637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA2CZ-0001bW-Cy; Tue, 07 Apr 2026 08:54:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274541.1560637; Tue, 07 Apr 2026 08:54:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA2CZ-0001ab-91; Tue, 07 Apr 2026 08:54:27 +0000
Received: by outflank-mailman (input) for mailman id 1274541;
 Tue, 07 Apr 2026 08:54:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wA2CX-0001ZD-Ff
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 08:54:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA2CW-000tH1-CW
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 10:54:24 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d4c63b-5cb7-0a2a0a5109dd-0a2a4504c308-34
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 10:54:24 +0200
Received: from [209.85.218.46] (helo=mail-ej1-f46.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d4c640-bb33-0a2a45040019-d155da2ec88f-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 10:54:24 +0200
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-b9c755b2cdeso494134966b.2
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 01:54:24 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9c3c99ec5dsm543904166b.15.2026.04.07.01.54.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2026 01:54:22 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1775552064; x=1776156864; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YlUfWcQ7FTA6B0/8S+TGV7D3p/4B+5XCrO/ub4Jh2Vs=;
        b=paoXeurZV+CouOOvbVxK7jok+1x1wQZ6t8tuBruw1YJ7ZxfLQsAsqeTkOIFWTT+k7q
         9UCGmGUth7mm88AfKbeuSUoH/C4aLtL5qX5ibhhozfcY1HycmUW04Qoy3F325pQzMCuq
         Tk64QJJKvTolmUbtE95xakgJdUV8PCaGfwNynbSoCqq7Eqh0GWy+QGfCQJUUbeQ3q7Us
         G4TbEXIFE0Z+sX90vLQg2m2NO3eF191eC7pHC+Vz2ld5so3pBC44P5hxLR+hw63yghIy
         EGdp1Xdo+IseNGYnA3ycd+GKejc1QqINxskA6jwOSLN547lzXaMAD5QinRxA2SA5KpXd
         OR3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775552064; x=1776156864;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YlUfWcQ7FTA6B0/8S+TGV7D3p/4B+5XCrO/ub4Jh2Vs=;
        b=T8q9RcktDT/5XE8vDH91kOKv30oMwOHT/aBXkDtap4cjb+qgj0qS0Et93/3mO4TcgC
         8IaXHpQRQ3oG5tOJ9GgjQpvkOIDAmN7s7b3OSINtyZhqCupBhRuVepog69XSNDkeezYy
         n4dcgrxTq0RmCD/D0ZYNb4Sj8BmxRvk9ITzPO6bkYiz46EFGLbSNtdWyl4IJ9gcb4av/
         F3HM4VIFkQ30+6lRGGDAykqZU4eyEtOBdbh/3oi5iHdhDVkNEtx9U3XGiK2QGfaTWQlW
         dWIB5UEkQV8p+LeqEwEYAzARWCWHR52zzQ5AdckX0wW9P1hYQSYWOr4XNqEdsRlVeLgD
         cLGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqoALe9wpj6Ik9Ir8y2P8bm8Dj5QAJPNK9CdP6pLUUMMij5LFvNU/Rj9M7naXZn6RbOVKBF+uSHkk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwnN8qGENo6Ih7MY14N0/ELJfSqoTU4sHWeTNINkoVOjntvJ8uF
	IIpJNaeeB6oGWGXJE4JO2+Yk9YDj/aI2fvIRdE10ARaob4MwnrSPtK6u
X-Gm-Gg: AeBDievH9D9JD9muxXDjpCm0ybtkRJiVs8WdbEq67Fxp5EQNLcWviklstk6idF/72LL
	RHmaGvWCV9nMZYoceuJaNj6L2bDp/87Z+KW5Q87TChq8NOAt7HehvVXrTiKGzk25MYuGdAkUKHZ
	AN2yyVpl1LKtYwhAALAwgZimpn7UjQyklB+R+jrzcGMZewCWTEu537nT+irjIc+f849NBGbgqNw
	XfCm8yWV3Tunu4jvTnMecaOm4Vn7+aKXcmo7VZBjXH35/Bwm42/31yIxzsb/+URk8yR6EbU7qvM
	cZlr4HTISzqrh6G4esYdKm67jvl5T7Hxi9QBwbXTPVSAu6PvAN7kwi8PcpHWO1omqiNvCqWL8Li
	hjDzT1UzaCWAgCaPjQQUJmx6DaXDFJsDDIVp9FImq8qEoNFiXs4yOIkam/iQNAcdIJeOGESg1ZY
	2m4FV0nlgFzsXE8AixHybs63T6iQQjYAJsBK8Kvt46W789Bhoglq5iKqJ7c1xP7fbHDKYETjv0L
	SsLt8G8aQnyjQ==
X-Received: by 2002:a17:907:3f90:b0:b9b:207c:f7af with SMTP id a640c23a62f3a-b9c679f3b83mr807071666b.42.1775552063361;
        Tue, 07 Apr 2026 01:54:23 -0700 (PDT)
Message-ID: <538d86ca-2a87-4d22-bdd6-ecee3f89cead@gmail.com>
Date: Tue, 7 Apr 2026 10:54:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] xen/riscv: add definition of guest RAM banks
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1774281309.git.oleksii.kurochko@gmail.com>
 <8278256f3d270b456d19cb9891b89b88a46548a5.1774281309.git.oleksii.kurochko@gmail.com>
 <1a3a316e-f0ea-4514-95d6-9813d6d5ca76@suse.com>
 <691be850-9145-4bbf-a897-d10a0193b730@gmail.com>
 <dfd2a666-f3a5-4d88-b034-438f8fbb85ba@suse.com>
 <2bae9e12-8f71-4ff0-b077-bfb4215e5e14@gmail.com>
 <ffd3a7cd-8c47-4a9b-864a-26a053b5b7d2@suse.com>
 <bc5a9826-c1ff-43b2-a3d1-1a4862301aea@gmail.com>
 <0e37083a-42ab-4c99-83fc-b77f519394b9@suse.com>
 <912263a2-8dff-414e-bea4-64428ce2ec36@gmail.com>
 <4a1f7cfb-df74-4083-a681-f79911da10e1@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <4a1f7cfb-df74-4083-a681-f79911da10e1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1775552064-33F3651B-3E6D2920/10/73395122804
X-purgate-type: spam
X-purgate-size: 3719
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 44B323AB941
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/7/26 8:23 AM, Jan Beulich wrote:
> On 06.04.2026 17:43, Oleksii Kurochko wrote:
>>
>>
>> On 4/1/26 5:10 PM, Jan Beulich wrote:
>>> On 01.04.2026 16:53, Oleksii Kurochko wrote:
>>>>
>>>>
>>>> On 4/1/26 4:22 PM, Jan Beulich wrote:
>>>>> On 01.04.2026 15:57, Oleksii Kurochko wrote:
>>>>>> On 4/1/26 8:17 AM, Jan Beulich wrote:
>>>>>>> On 31.03.2026 18:14, Oleksii Kurochko wrote:
>>>>>>>> On 3/30/26 5:51 PM, Jan Beulich wrote:
>>>>>>>>> On 23.03.2026 17:29, Oleksii Kurochko wrote:
>>>>>>>>>> The dom0less solution uses defined RAM banks as compile-time constants,
>>>>>>>>>> so introduce macros to describe guest RAM banks.
>>>>>>>>>>
>>>>>>>>>> The reason for 2 banks is that there is typically always a use case for
>>>>>>>>>> low memory under 4 GB, but the bank under 4 GB ends up being small because
>>>>>>>>>> there are other things under 4 GB it can conflict with (interrupt
>>>>>>>>>> controller, PCI BARs, etc.).
>>>>>>>>> Fixed layouts like the one you suggest come with (potentially severe)
>>>>>>>>> downsides. For example, what if more than 2Gb of MMIO space are needed
>>>>>>>>> for non-64-bit BARs?
>>>>>>>> It looks where usually RAM on RISC-V boards start, so I expect that 2gb
>>>>>>>> before RAM start is enough for MMIO space.
>>>>>>> Likely in the common case. Board designers aren't constrained by this,
>>>>>>> though (aiui). Whereas you set in stone a single, fixed layout.
>>>>>>>
>>>>>>> Arm maintainers - since a similar fixed layout is used there iirc,
>>>>>>> could you chime in here, please?
>>>>>>>
>>>>>>>> Answering your question it will be an issue or it will also use some
>>>>>>>> space before banks, no?
>>>>>>> I fear I don't understand what you're trying to tell me.
>>>>>> I meant that there is also some space between banks and pretty big which
>>>>>> could be used for MMIO which could be used for non-64-bit BARs.
>>>>> I don't follow: Bank 0 extends to 4G. There's no space above it, below
>>>>> bank 1, which could be use for non-64-bit BARs.
>>>>
>>>> So we have two banks:
>>>> bank[0] -> [0x80000000, 0x100000000)
>>>> bank[1] -> [0x0200000000, 10000000000)
>>>>
>>>> So i think we have some space between them [0x100000000, 0x0200000000)
>>>> -> 4gb to be used for non-64-bit BARs.
>>>
>>> But a non-64-bit BAR need to be assigned an address below 0x100000000?
>>
>> Right, I had in mind that RV32 uses for guest Sv32x4 which could
>> translate 34-bit GPA into 34-bit MPA and automatically applied that to
>> 32-bit BAR...
>>
>> I can keep first 4gb for MMIO purpose and start bank[0] at 4gb as 34 MPA
>> address space is more then enough to cover reserved 2gb of bank[0] after
>> 4gb.
> 
> Yet having no memory below 4G won't work for guests wanting to run in bare
> mode? Don't guests even start up in bare mode (and hence 32-bit ones need
> to have some of their memory below 4G in all cases)?

I thought about such use case but decided that no one will want to run 
guest in bare mode and that is why we have:
     if ( max_gstage_mode.mode == HGATP_MODE_OFF )
         panic("Xen expects that G-stage won't be Bare mode\n");

Probably it is wrong assumption and we really want to support Bare mode 
for guest too. Let me know if I have to drop the panic above...

Then it isn't clear what will be the best layout for the current 
limitation that guest RAM should be compile-time constant for dom0less 
solution.
It looks to me that giving 2gb reserved for MMIO and 2gb for guest RAM 
is fair enough.
As an option 3gb for MMIO and 1gb for guest RAM will be enough as only 
Bare model will have such small amount of RAM, for other modes part of 
bank[1] could be used.

~ Oleksii

