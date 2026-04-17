Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iM58Nrr/4Wna0QAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 11:39:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B7241965C
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 11:39:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1284113.1566018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDfeD-0005YP-Dr; Fri, 17 Apr 2026 09:38:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1284113.1566018; Fri, 17 Apr 2026 09:38:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDfeD-0005WP-Am; Fri, 17 Apr 2026 09:38:01 +0000
Received: by outflank-mailman (input) for mailman id 1284113;
 Fri, 17 Apr 2026 09:37:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wDfeB-0005WJ-Ss
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 09:37:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDfeB-008dQl-9K
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 11:37:59 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e1ff6d-2eae-0a2a0a5409dd-0a2a4504a354-34
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 11:37:59 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e1ff77-1dec-0a2a45040019-d155dd2ba5aa-3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 11:37:59 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-43d7a5e77b1so329061f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 02:37:59 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4cc375dsm2922700f8f.14.2026.04.17.02.37.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Apr 2026 02:37:57 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1776418679; x=1777023479; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=32a4vcSAxYl5lrfQpnuVVJuIBeF4Rh7aLydhWtC+Ve8=;
        b=G3fJUj+svFL+i60/+J5xg//82R1v+DPD+2loFLKceSlfCCd9TCJyUD+jHs2Reuh9Mu
         8xfke1Pk8EhDy+jYnAmU+Tjc5ZIXksssdtJP/cgH4K5YQJvtddT59hcDLLd9YM41OBfF
         /euRWupvI0PsMGFHpjhuV2BhVEdfEnOisygNWX1T7SFFXRPiMbtGNgX6e6pp2CTb/a6h
         Hn/2GrYr9oAf8wHKcerSNm7P8OXmUdxEuCHJAnICNQcFZjbctkX5vhrpbs4t+ZK1r5TQ
         kvugAj1x6u/+2MKB1ydUQLzaw3dj2amK3K/cWO9UHu9VwbyOviY1DiNIGU82yEhfqCZG
         /d4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776418679; x=1777023479;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=32a4vcSAxYl5lrfQpnuVVJuIBeF4Rh7aLydhWtC+Ve8=;
        b=duTVDVPlQyZ2K1/UfHzmY4AV7S3KRbbDIZDcjmuR5g7U+SZLds7LVmGMdYwyKnWi5M
         lQUb77+FnWwZOM62UsQdRkFdzXsuaryKHOqc6LixwWbxn+LO4fs5dvfJb7mkg/qBoS6H
         Okibl7zLYkV3HU9CxNOO5QSFGH3Or7r6SiqRjpp0RPFjb6FtTDiI3ZVAbXNuCc//620+
         06KoJ08YrfO6JydRPksVFr8AEulikyF+J0tlCv+HNvOwcz2On9WDxx7Q4YX/eg/aWsx9
         tW4EFupb0knbgUzy0lpoVEYzoqoV6DE4Lxv5eu6KhsA1XNxSMt6sNgjI5a4EntVvwSoF
         WGFw==
X-Forwarded-Encrypted: i=1; AFNElJ/JoW2F0ZUGFhhpdl9xGEXF5W1bEyzNma3ap2r6rcKEP5E8LQ5oIeLXEADh0CNzz09LszZDqMAwqgg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw9B0+1S6DZA4t1wiu7Qa+D1Vi+v9Qenh559gwZ6ZYC2/mba5kI
	7vtm3hwmTINM61x5LnULKjYHX63w31dljUkXx/TXrfT6fOcq+0YSXj4U
X-Gm-Gg: AeBDievR9imkAWPnGZ71NJfvqce2M6RvBn9zR6OpZBQpbsvy+2pda6xkwlDEDZ+/bxS
	04wE5X5H1g05nWBTElMLVz5cKmsLukZkC9CHDkZ02upPTzKx2M3VkqrndxVieoiTqi+x9j+T82l
	uG2QpLBs9FFw9PXWSshHv/nNSDcg15J+SS7b/bYwlyPD3fAj/hHvR6EfkOHZ1YPUBruO12nDngb
	A3MJXnop853i+VELaKTisV9nUV6AzUkMWTXPoHBW95hb5Jb4KFhI5DEOQbqATRnLx3UKTyCaPZC
	6fgJmVQhctjvEdnuyFsm9/FiKgqdoVNBVyADSrQSx6vB78j1B+n2EpKeL7UFss6Pohc2ib9X3qR
	MVk96pp1xRRB4TmmmyHuPao5jp/XQV/6thOBwYsJChgkvXgjTSmk2StBCFx2uNRJKNRMlE6gQj5
	J8qad9aH0Q5klCrmNo4vzglkpCdLaELMImuc+Poj402cB4HZw3Wbe7piYXyh8bvowjUjraevLhu
	ETPwq7o3aoXjA==
X-Received: by 2002:a05:6000:290c:b0:43d:772d:2b61 with SMTP id ffacd0b85a97d-43fe4073831mr2838295f8f.15.1776418678327;
        Fri, 17 Apr 2026 02:37:58 -0700 (PDT)
Message-ID: <e25edd0c-5ea5-4b0d-9d6d-a137fdd2b6f8@gmail.com>
Date: Fri, 17 Apr 2026 11:37:56 +0200
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
 <e1be0f4d-5090-4f2c-a05b-30b9ed6e1490@gmail.com>
 <5c47f23b-6f51-41e1-b8a4-83f80882d97b@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <5c47f23b-6f51-41e1-b8a4-83f80882d97b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1776418679-3224E3FF-587D6248/10/73395122804
X-purgate-type: spam
X-purgate-size: 2620
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
X-Rspamd-Queue-Id: 79B7241965C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/16/26 2:06 PM, Jan Beulich wrote:
> On 13.04.2026 11:32, Oleksii Kurochko wrote:
>> On 4/2/26 11:00 AM, Jan Beulich wrote:
>>> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>>>> aia_init() is going to contain all the stuff related to AIA initialization.
>>>> At the moment, it is just Check if SSAIA extension is available and if yes
>>>> set is_aia_available to true.
>>>
>>> And (future) users of aia_available() can't directly call
>>> riscv_isa_extension_available()? Nor can aia_available() be a convenience
>>> wrapper around that call? It's only ...
>>>
>>>> --- /dev/null
>>>> +++ b/xen/arch/riscv/aia.c
>>>> @@ -0,0 +1,25 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>> +
>>>> +#include <xen/errno.h>
>>>> +#include <xen/init.h>
>>>> +#include <xen/sections.h>
>>>> +#include <xen/types.h>
>>>> +
>>>> +#include <asm/cpufeature.h>
>>>> +
>>>> +static bool __ro_after_init is_aia_available;
>>>
>>> ... a boolean, yes, but still.
>>
>> My purpose was to have a variable which represent that AIA is
>> initialized properly. Maybe, it makes sense to rename this variable to
>> is_aia_inited.
> 
> I'm generally having trouble with the non-word "inited". How about
> "aia_usable"? Fits ...
> 
>> The idea is that in future patches VGEIN will be also initialized in
>> aia_init() and if wasn't initialized properly then just keep
>> is_aia_availabe be set to false and in such case we will have that
>> is_aia_available != riscv_isa_extension_available(NULL,
>> RISCV_ISA_EXT_ssaia).
> 
> ... this as well. And ...
> 
>> Note that regarding VGEIN it is arguable that it should be initialized
>> as generally it could be that there is no VGEIN what means that h/w
>> assisted guest interrupt files aren't available and s/w one should be
>> used. But s/w guest interrupt files aren't supported.
>> So I mean that with the current implementation if VGEIN isn't
>> initialized I will tell that AIA isn't available what generally isn't
>> quite true.
> 
> ... this. Question of course if what aia_usable (or whatever its name)
> being set to false means to Xen's own operation. If Xen would still work
> okay (without being able to create guests), perhaps the name may want to
> be "aia_guest_usable" or some such. I.e. as I said on a number of
> occasions: A variable wants to be named to accurately express its
> purpose, without the name growing excessively long.

aia_usable sounds good to me.

It covers also the case if AIA isn't expected to be used as h/w uses 
non-AIA-compliant interrupt controller, for example, PLIC.

~ Oleksii

