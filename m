Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOTqHH894mmB3wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 16:02:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D316B41BD77
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 16:02:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1284407.1566205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDjlS-0004q6-HM; Fri, 17 Apr 2026 14:01:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1284407.1566205; Fri, 17 Apr 2026 14:01:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDjlS-0004ne-Ej; Fri, 17 Apr 2026 14:01:46 +0000
Received: by outflank-mailman (input) for mailman id 1284407;
 Fri, 17 Apr 2026 14:01:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wDjlR-0004nY-EX
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 14:01:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDjlN-0053g5-O5
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 16:01:41 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e23d42-5cb7-0a2a0a5109dd-0a2a450ae8d2-8
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 16:01:41 +0200
Received: from [209.85.208.182] (helo=mail-lj1-f182.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e23d45-56b3-0a2a450a0019-d155d0b6c85e-3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 16:01:41 +0200
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-38e936caafeso7222371fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 07:01:41 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a4185ad0fdsm429034e87.13.2026.04.17.07.01.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Apr 2026 07:01:39 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1776434501; x=1777039301; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DkB1ZnGOLjWczTds94+U6czeecT8tjbLUdOEwf1nF+I=;
        b=VnMVFSioCVD2l9wHFD648zdH2ASszqjvCv+g9VzW6WA/CZmDWoUtAVfkcIvBcvxbYQ
         s1j+LBx6ufEaUWBtU10cM8AyiJNAOMXsZxWkKKMBSfP7+mHWCzQvu3CWkhtLOq3JTzW6
         sWCs/jtigqU53QhYhE7Vb5oNOKgs2K6l6ikA20UoCxnoYe9K+ELXleW1cvsrNqDCiq/W
         yhlWgnA2ERUs8avYnWlzohO8ri69S1QfCo12Po1KQ23/zP2oOXun6MgrxkMNa9rYoCJM
         6xr147x+sQUo4gWZhZkMfgNugCaebG59n8Ng/vi2GMt13HrMcLCbZf67jm+6ICqnhAWd
         NFvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776434501; x=1777039301;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DkB1ZnGOLjWczTds94+U6czeecT8tjbLUdOEwf1nF+I=;
        b=fscUa50KGQFgWRI5dQQGzTJZ+fQQRA6oowM5QxTkajDmjF5RfZTJFQpecyVr4a/w4l
         JzJxuqvYBDw/X2Oz2laIXFSD0tyGqFr9YLj2HM2SimLMcgzUwrWu1+kaHzbOEM37mRtJ
         FoQua0jspucZ/Nqk8qs2Uu3O3az3yYJQPY5dhR2pVo05Pexd0vxBPgt4iIBJxh1fo/l/
         ovlhoHPLgGCtpC07/ci8d/IE0Ok+B4gwdSti436kf9v5EcKcHmNFWAsLgSFDiEVlr1ll
         3mL9+U/MhwvqTm9S8MYmIz8ypxPh3HJZYh2zNLZK1r6Hz7jFb2cfWnlM+rO9+rcWGeT4
         VnDA==
X-Forwarded-Encrypted: i=1; AFNElJ9mgx3FrLbCrjclvFC9OUKMYLaybqxoDwC0EGzvYcn293kdE3L03MFgU+1+7ECgnpxu/cbYQL8AxSM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxfianL4IavsTGHwJhmyaYduVhgcb9Nu5C5jbuIM6d/XWGADfOO
	YEz+iQcE5RTKnStV8P+83bZHwksk571eieqCf/wRIX3bjoA9iefPIb/Y
X-Gm-Gg: AeBDieu0DYXXjWuGM23gUrP2hUjPVu1lYTBgofdCqz2E/4lzd9OyMy0cK367ABI5e8N
	q3WXFwO6ylhP+pj4kDZndsLhYiCcy5rUv+eNC+8dhG3CHNapeVB+Q9STty5LSVSwyuUvQzCWVt/
	fem23TbsLqbV8wJ7GH0H3xlS8pIkDVDIi/H42GsUhlZkE2d15KnpZlwbDcLO16bYBfHjZoj0Hhf
	1yXSBijStWttQtul3cJcKPvXRN0PzLYdtb/U5oCo2ufvrbmjfdd1tIQdjt3peLSBFpua9XYFCfm
	v8TGA9Nvj/AG0GcnDK60V74jnFW2CVBeZQgQ1DKNUNwZZjaypb//MjOMhjMShHIgJ/geUJ4Rbkb
	mvregK2rFJZIt5y2fWKcwC4MfQswuggRL6ATsh+PWhL+WJbmDzeAOujVWDdQONiLXQmPYbchvch
	DJN6s8DRBysn9DGVTdl4O1Fs10oykyjP0ZVyeqEktsS+sFVg+NZ94EIGfpvLARwCBbD6yN0pepP
	Noz0xsvFNSkERQSX5AjjMfl
X-Received: by 2002:a05:6512:1592:b0:5a4:4cc:7a52 with SMTP id 2adb3069b0e04-5a4172ca4ddmr1085423e87.17.1776434499926;
        Fri, 17 Apr 2026 07:01:39 -0700 (PDT)
Message-ID: <a46589de-e2d8-42bc-bdf9-8ac4fcbdcd7b@gmail.com>
Date: Fri, 17 Apr 2026 16:01:38 +0200
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
 <ca52ad3b-d14d-478b-bf6d-2835f79fa257@gmail.com>
 <747744f8-44e8-4d87-871f-1c2f49a0fcc0@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <747744f8-44e8-4d87-871f-1c2f49a0fcc0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1776434501-47F798B7-5B5101C8/10/73395122804
X-purgate-type: spam
X-purgate-size: 4234
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
X-Rspamd-Queue-Id: D316B41BD77
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/17/26 3:50 PM, Jan Beulich wrote:
> On 17.04.2026 10:10, Oleksii Kurochko wrote:
>> On 4/16/26 1:42 PM, Jan Beulich wrote:
>>> On 10.04.2026 17:40, Oleksii Kurochko wrote:
>>>> On 4/1/26 5:05 PM, Jan Beulich wrote:
>>>>> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>>>>>> Guests using the IMSIC interrupt controller require a corresponding
>>>>>> Device Tree description. Add support for generating an IMSIC node when
>>>>>> building the guest DT.
>>>>>>
>>>>>> Keep a reference to the host IMSIC DT node and reuse its compatible
>>>>>> property while constructing the guest-visible node.
>>>>>
>>>>> Again raises a migration concern. Presumably a guest would then be able
>>>>> to migrate only to other hosts with the same compatible property.
>>>>
>>>> Right, but I don't think we can do too much and it is the simplest
>>>> approach just to migrate to hosts with the same compatible property.
>>>>
>>>> If you concern is about DTS property then for IMSIC it will be always
>>>> riscv,imsics according to the RISC-V DT spec. (IIRC, the only other
>>>> option could be qemu,riscv). Actually, I can just hard code
>>>> "riscv,imsic" explicitly instead of re-using of host name.
>>>>
>>>> If your concern is that we will migrate to a host which doesn't support
>>>> IMSIC at all then we should or (a) don't migrate to such host or (b)
>>>> provide an emulation of IMSIC. And option (b) would be terrible from at
>>>> least performance point of view.
>>>
>>> That would all be only a secondary concern - in an IMSIC is needed right
>>> now, so be it. My primary concern is with inheriting the host IMSIC's
>>> properties.
>> Could we do really something better?
>>
>> At the moment, the following properties are inhereted:
>> node name -> not an issue at all, it is just a name of the node and
>> generally doesn't matter what it is in the matter of DTB generation as
>> phandle number of this node will be used as pointer to this node, not
>> the name. If it would be better I can hard code just "imsic".
>>
>> compatible -> also, not a big issue. According to current DT RISC-V
>> bindings it could be just "riscv,imsic". But then I have the question
>> what if one day someone will come up with own implementation of IMSIC
>> then "riscv,own-imsic" will be in host DTB and so I expect that guest
>> DTB should have it as this h/w expects to use specifically OWN-IMSIC
>> driver. So it seems okay to copy compatible from host DTB. Yes, if
>> migration will happen where just "riscv,imsic" is supported then it
>> can't be easily migrated to such h/w and its okay. But generally I
>> expect that compatible will always riscv,imsic.
>>
>> riscv,num-ids -> generally, it could be any number from [63, 2047], but
>> it seems like there is no any sense if put a value bigger then
>> guest-num-ids=min(riscv,num-ids, riscv,num-guest-ids) for guest as h/w
>> can't support more then that. At the same time I don't see too much
>> sense to tell a guest that it supports less then guest-num-ids. What is
>> the problem to give a guest a maximum that IMSIC could provide? With
>> migration, of course, it will be an issue if new host will support
>> different number of riscv,num-ids but I don't know what we can do better
>> then just avoid migration to such hosts if old-num-ids > new-num-ids
>> without significant performance drop.
> 
> This is exactly why an admin may want to limit what a guest gets to
> see / use.

Would it be better then provide a separate define for riscv, num-ids and 
use it here? Maybe here it makes sense to re-use already provided by DT 
binding property:
   riscv,num-guest-ids:
     $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 63
     maximum: 2047
     description:
       Number of interrupt identities are supported by IMSIC guest 
interrupt
       file. When not specified it is assumed to be same as specified by the
       riscv,num-ids property.
And if riscv,num-guest-ids the use some predefined in define value?

Does it make sense then provide the similar defines for compatible and 
node name or for that properties it would be okay to re-use what host 
DTB IMSIC node provides?

~ Oleksii

