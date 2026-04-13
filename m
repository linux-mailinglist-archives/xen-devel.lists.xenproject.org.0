Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBDGLUm43Gn2VgkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 11:32:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 260B73E9E10
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 11:32:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1280980.1564054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCDet-00063k-SI; Mon, 13 Apr 2026 09:32:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1280980.1564054; Mon, 13 Apr 2026 09:32:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCDet-00061K-PZ; Mon, 13 Apr 2026 09:32:43 +0000
Received: by outflank-mailman (input) for mailman id 1280980;
 Mon, 13 Apr 2026 09:32:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wCDer-00061E-RM
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 09:32:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCDer-00Bp7w-3c
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 11:32:41 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69dcb834-5cb7-0a2a0a5109dd-0a2a4501df0a-42
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 11:32:41 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69dcb838-6fc9-0a2a45010019-d155dd2aede8-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 11:32:41 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-43cff5dafc3so3002955f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 02:32:41 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d7d5812dcsm1288164f8f.32.2026.04.13.02.32.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Apr 2026 02:32:39 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1776072760; x=1776677560; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WM9Oad0qIAdleqbNNdl+nWlHcDIIi8dfYb6hLo725bA=;
        b=ksKN2nk9oJRcRC4I0pdHCkXUkv/0LfPSS+xbqG/Olewxv3P5F5WHz5o0TgRyF3wG+R
         pHC6OI6rgPQRTj83CIz0u6CxCY+1FvbkK9phwPC8PPPMm7xreMUgXm89oL4kymPsHH85
         VTh128bdv0gVEuGYbgONb93+XLwo7COHQn1C2MGKct5AvoakI9Ih/yu3twfViCjxRlrA
         rOLAsNz6xX9Gd397t9upQxsACWNqIMg7RjIcP6FXEDzrZ03j2LJyvaZx+fzE3jc3Pe39
         OPYTG9wS/7UiIiIsEgVT50CTtp5pqFvkb64DRfeIgLlkI/qlaBLhpkiGBP9AlqrapI92
         A/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776072760; x=1776677560;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WM9Oad0qIAdleqbNNdl+nWlHcDIIi8dfYb6hLo725bA=;
        b=tIpMlcvdJr4VGFq2DC4Bky5hwoy424IviSmdwlB3pZGsyEjliupfJdCzSxvaPHA6HS
         yneRYaWBFx0y6VrAZ3UJRYEUmXyiVPAbfbDwOozztHPYQHy733zVX1550EUU7M9pTX4C
         x/xmGl+hcQ2SovNPDCsJz+S51t6pGii6PG0HJzIZ5Zd8Wq8hiOf4m1+TIA0RAGwMTeVN
         a8i1BC/alUcqIsQp4pwiARlKZWzshh1hK/wbcX35iN0wuWmKiatykQTNdmC3sewfisCt
         6f0XKHxZ3Dtzm+SDkQGtuuvddTfp+XTn8WQTnQ6z9lq7u5o44pVny6B4SNjU65Cus3Dp
         kl0g==
X-Forwarded-Encrypted: i=1; AFNElJ9HNA+gRmDDA43CFxLlOzlSyGOblnsLJ+cks6rlh1Z9Qs8iMfDCWfIiz93ZP7jpujlxcwTXny19T6w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwlHmeT14x5yX7YuYAAemgxAJeju2YOW3qLNWovUbCq6Ib8zzDy
	zJkQF/22Xl1vD1aj92GN4x3BBohJVASA5prVq4Ia0Djj0ZQm2TWzYXBv
X-Gm-Gg: AeBDies2BxoERyWIWKTIREpem/4M7pjbMkVK0EheuqbBqlSB+u763zqnrrnw4/tBZFC
	Kxyz5KVhv8byFS8Wneq+0A7Xf1qTiRbe8G3JWTUyRkgJKTEnh7YeUH3EqpefXywfGQVI1H/QSX6
	CA0rbM4aV8gIoirfEl5OsJFaNY9ac+GJfWprzhP87BcttHuY1EeL31c3Qu1Z3J0eQ/jx7YnuIZA
	M/qBlq4tLOGE4ScBGtLTTxxQIRkl4WkOoQbURxTAM1vpUfLA5TTPuJRJ4pn5LRIXo0rEhZHCfIl
	2OlLaciJ5oxN6J5PDLrfKBC7P0VacldPaGJi9VQHNOVgaKMk0K4TfCDYT3F+zsjPyQXH/xc8sSy
	zi8Sc2Dx/ORfM/nJmwX5IS2F5Q2xoFxwkHqIl2KobuPixwzAO4bQ8U4d6whCEUDL7xB8rZ1+udE
	VErDkru7oy36/Zes8OLYS53pPZa2pNuIRKXf6ODA20js+soJrl+95anCn41ncjLX6selU3WjhVU
	quKIY3jBh+9Zg==
X-Received: by 2002:a05:6000:2586:b0:43d:1c7a:8b59 with SMTP id ffacd0b85a97d-43d642ea4c9mr17877055f8f.40.1776072760286;
        Mon, 13 Apr 2026 02:32:40 -0700 (PDT)
Message-ID: <e1be0f4d-5090-4f2c-a05b-30b9ed6e1490@gmail.com>
Date: Mon, 13 Apr 2026 11:32:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 12/27] xen/riscv: introduce aia_init() and
 aia_available()
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
 <74f15b1db86139b36b721ef9d12b998fe4f0f348.1773157782.git.oleksii.kurochko@gmail.com>
 <8393b8fe-6ba9-439c-ae15-a84409d0976d@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <8393b8fe-6ba9-439c-ae15-a84409d0976d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1776072761-164F6185-0D05EFC0/10/73395122804
X-purgate-type: spam
X-purgate-size: 2823
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
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
X-Rspamd-Queue-Id: 260B73E9E10
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/2/26 11:00 AM, Jan Beulich wrote:
> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>> aia_init() is going to contain all the stuff related to AIA initialization.
>> At the moment, it is just Check if SSAIA extension is available and if yes
>> set is_aia_available to true.
> 
> And (future) users of aia_available() can't directly call
> riscv_isa_extension_available()? Nor can aia_available() be a convenience
> wrapper around that call? It's only ...
> 
>> --- /dev/null
>> +++ b/xen/arch/riscv/aia.c
>> @@ -0,0 +1,25 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#include <xen/errno.h>
>> +#include <xen/init.h>
>> +#include <xen/sections.h>
>> +#include <xen/types.h>
>> +
>> +#include <asm/cpufeature.h>
>> +
>> +static bool __ro_after_init is_aia_available;
> 
> ... a boolean, yes, but still.

My purpose was to have a variable which represent that AIA is 
initialized properly. Maybe, it makes sense to rename this variable to 
is_aia_inited.

The idea is that in future patches VGEIN will be also initialized in 
aia_init() and if wasn't initialized properly then just keep 
is_aia_availabe be set to false and in such case we will have that 
is_aia_available != riscv_isa_extension_available(NULL, 
RISCV_ISA_EXT_ssaia).

Note that regarding VGEIN it is arguable that it should be initialized 
as generally it could be that there is no VGEIN what means that h/w 
assisted guest interrupt files aren't available and s/w one should be 
used. But s/w guest interrupt files aren't supported.
So I mean that with the current implementation if VGEIN isn't 
initialized I will tell that AIA isn't available what generally isn't 
quite true.

> 
>> +bool aia_available(void)
>> +{
>> +    return is_aia_available;
>> +}
>> +
>> +int __init aia_init(void)
>> +{
>> +    if ( !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ssaia) )
>> +        return -ENODEV;
>> +
>> +    is_aia_available = true;
>> +
>> +    return 0;
>> +}
> 
> Why the return value, when ...
> 
>> --- a/xen/arch/riscv/intc.c
>> +++ b/xen/arch/riscv/intc.c
>> @@ -8,6 +8,7 @@
>>   #include <xen/lib.h>
>>   #include <xen/spinlock.h>
>>   
>> +#include <asm/aia.h>
>>   #include <asm/intc.h>
>>   
>>   static const struct intc_hw_operations *__ro_after_init intc_hw_ops;
>> @@ -27,6 +28,8 @@ void __init intc_preinit(void)
>>   
>>   void __init intc_init(void)
>>   {
>> +    aia_init();
> 
> ... the sole caller doesn't care?

Good point. I think it should return nothing as probably it is just 
another interrupt controller (PLIC) is going to be used.

Also, I thought if aia_init() should be called inside at the start of 
aplic_preinit(). It looks a little bit incorrect as APLIC is just a part 
of AIA spec...

Thanks.

~ Oleksii

