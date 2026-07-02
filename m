Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fiymJ+QzRmrTLgsAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 11:48:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 036A66F57B4
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 11:48:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Vw7Kr+JV;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1351539.1608701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfE1l-0005gw-79; Thu, 02 Jul 2026 09:48:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351539.1608701; Thu, 02 Jul 2026 09:48:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfE1l-0005f5-4P; Thu, 02 Jul 2026 09:48:13 +0000
Received: by outflank-mailman (input) for mailman id 1351539;
 Thu, 02 Jul 2026 09:48:11 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wfE1j-0005cU-KE
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 09:48:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfE1i-006vJd-OL
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 11:48:10 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4633d1-e002-0a2a0a5209dd-0a2a450781e6-32
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 11:48:10 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4633da-9c8e-0a2a45070019-d1558035a9ee-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 11:48:10 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-493c1950518so1949025e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 02:48:10 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493c63ba971sm52031435e9.13.2026.07.02.02.48.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2026 02:48:09 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782985690; x=1783590490; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5cW6F1nZ+lIxLmSGu2x1m1g9gMm5tD08o7NGRsN9T1E=;
        b=Vw7Kr+JVAKumtsZzDbXf3XG8LaVJIuWDAc17vMfhub3qMc6cK5XJVsm8sJdkei844u
         dlsN7qKAdc6KFCxSKbmcP9uircaPwOMEyXxFp0p6ZmrcwiBKmGGy+plD3HH+yLRhW2et
         nxUIifvpSykN9S/z76G+fQgqnrhCno3dWNC2la+fSsQsmLKmCoq+o5pWKOsg9gyiy+fv
         uG9DZMK8I9BjpYNyByjQqkqwobLewAy+f5wY58jsr0Z3kBKy9KeTxCboPTYwZ0AmIPe8
         P8a52yuHmwgnoxgpdcxX4gZJCFkay+3F/ctCAbQvGsrEbixgs61m8Uf/yJADrFmEhglo
         xRDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985690; x=1783590490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5cW6F1nZ+lIxLmSGu2x1m1g9gMm5tD08o7NGRsN9T1E=;
        b=f06NAK9zKXuA9oeCFOYmr1H/DKb7OGToIsy8WeIUjRxYx9vBn5Vjw2Qq+hf4BVZrbV
         M/a5WgJijzZl6LHyi460gJgbXjjfcrpVK33cqdpZjFQF7hq6Yi1VBQf3lUn90hG/ItEf
         9Gd+8xKu/Hja+txyrA5Sqwu63sge33E5cUtfn8QpTyG3dGb9ps2uMX67shFWojqGnsTy
         UR0RHCMmew/q2JqnKu6FN037mkfuHykyVGaRjcvqsZSaDxsaCKS4KL44qbt30sHdCFoe
         JrN1rAMrPpCOdbIqMvjsr6WU929o8YqyidlbH9I2EcVZiWovoihNfQTIP6a3JaWw676n
         FEsw==
X-Forwarded-Encrypted: i=1; AHgh+Rr6Py9Rxmpi7zrMaZ070L27PTa3IQWA8oK1TJA9c8U7XJHycYlU7OLkn6RZZtAp2dG/h5q6yoeM6BM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwRE9J5krDrLxUqo5Ru46bpvqYItIl0ttRb9xY0qeHWiVJLQjUs
	pvMlAUCYaPY2H14eeb2a6FCX3TtsNi3uaZePtgbZmZX5L8Njsjv8YguH
X-Gm-Gg: AfdE7clvYyLtFLVYUzab5XHbW2baGOoPwp/HsDTbrcN/d1Pd+PQizYdhEZ0hU1/qtll
	n8QIokWY8y0OZ6JbqUiLc9wvgUVrp1nK1bvK1FQon8oqmo8iugDV8l7ZJgoW3ovvMHm1uYdmFp4
	sU6TbnhA5RUJtOMaCPDE1CJ6IoS2rlkJ310ssDwb8Aoq2d7lGtJVspegs5jbamh6jOB+1uDcCWX
	1+GZuVbO/hz8haM2QKc/Q4jVIhflQ3N+7mHKCfLV7+JiekLpOC8lK2vr5JOqPOas9+wgOEfjSAC
	y401lNf5ATOSKe799kLFixDIBG5/tHlzZTNGyhNlRlZeERfu4/108q+AYK/0AyV4I1+VwwWTT2Z
	DwF68/eidIdpsPoGO6aQUtR2DcxeBckJd8iB81nQ4gPCUAoxa8yQkUlwuE5QxA1A4glqgPwK5aw
	FbSIzJ8yQ8u/sXR4B2WsarAlwJRRg+P17+E8VP+nqMLjCCTk4IkfEfg8QfSwTA0hLSvnbrnvxp0
	P4/Bw==
X-Received: by 2002:a05:600c:6211:b0:493:c064:316f with SMTP id 5b1f17b1804b1-493c594ebedmr23053715e9.3.1782985689888;
        Thu, 02 Jul 2026 02:48:09 -0700 (PDT)
Message-ID: <fc4625d3-c027-41f5-9aea-00f229316b30@gmail.com>
Date: Thu, 2 Jul 2026 11:48:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 25/25] xen/riscv: add initial dom0less infrastructure
 support
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
 <a6950e8dc2706c351fe6b0622602d34ecef133b7.1782487661.git.oleksii.kurochko@gmail.com>
 <131fc20c-1353-49fc-8f77-1ca13628ff17@suse.com>
 <c7aff2d8-14a7-4921-93d4-67228d871074@gmail.com>
 <2e3d404f-8716-4d0f-b739-d1e842b5a07c@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <2e3d404f-8716-4d0f-b739-d1e842b5a07c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1782985690-7CB2B25E-50C81BD2/10/73395122804
X-purgate-type: spam
X-purgate-size: 2675
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,wdc.com,gmail.com,citrix.com,amd.com,xen.org,kernel.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 036A66F57B4



On 7/2/26 8:41 AM, Jan Beulich wrote:
> On 01.07.2026 17:24, Oleksii Kurochko wrote:
>> On 6/30/26 9:28 AM, Jan Beulich wrote:
>>> On 26.06.2026 17:46, Oleksii Kurochko wrote:
>>>> --- a/xen/arch/riscv/include/asm/guest-layout.h
>>>> +++ b/xen/arch/riscv/include/asm/guest-layout.h
>>>> @@ -32,4 +32,16 @@
>>>>    #define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE, GUEST_RAM1_BASE }
>>>>    #define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE, GUEST_RAM1_SIZE }
>>>>    
>>>> +/*
>>>> + * The guest magic region holds Xen-reserved pages mapped into the guest's
>>>> + * physical address space (shared info, grant table, etc.). The only real
>>>> + * constraint is that the GUEST_MAGIC_SIZE-byte region must not overlap
>>>> + * guest RAM (the GUEST_RAMx banks) or the emulated device regions defined
>>>> + * above; the exact base is otherwise arbitrary. Here it is placed in the
>>>> + * unused gap below GUEST_RAM0_BASE (0x80000000), but a hole after a RAM
>>>> + * bank would work equally well.
>>>> + */
>>>> +#define GUEST_MAGIC_BASE  _UL(0x79000000)
>>>> +#define GUEST_MAGIC_SIZE  _UL(0x01000000)
>>>
>>> ... while 16Mb may seem a lot, it feels pretty little for 64-bit guests.
>>> Even in just Sv39 mode they have ample VA space to map a bigger region.
>>> (As iirc indicated before, a static upper bound looks questionable to me
>>> anyway.)
>>
>> I think the comment should be updated as for grants will be separate region.
>>
>> For all others, it looks like 16MB is more then enough. For example, Arm
>> has only 4 used pages (CONSOLE=0, XENSTORE=1, MEMACCESS=2, VUART=3).
> 
> Then the question goes the other way around: Why 16Mb? Won't e.g. 2Mb
> suffice?

I don't see any technical reason to have 16 Mb on Arm, IMO it could be 
shrunk to what you suggested (I will do that for RISC-V).

~ Oleksii

> 
>> So will you be okay with reworking of the comment to:
>> /*
>>    * The guest magic region holds the Xen-reserved pages mapped into the
>>    * guest's physical address space. The only real constraint on
>>    * GUEST_MAGIC_BASE/SIZE is that the region must not overlap guest RAM
>>    * (the GUEST_RAMx banks) or the emulated device regions defined above;
>>    * the exact base is otherwise arbitrary. Here it is placed in the
>> unused gap
>>    * below GUEST_RAM0_BASE (0x80000000), but a hole after a RAM bank
>> would work
>>    * equally well.
>>    */
>>
>> And add to the commit message that:
>> ```
>> A separate region for grant tables will be introduced at the same time
>> as the introduction of the grant table for RISC-V.
>> ```
> 
> That's quite a bit better, yes.
> 
> Jan


