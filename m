Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIxmAs9k72kIBAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 15:29:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A04904736AC
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 15:29:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1294870.1571577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHM1Q-0004TI-Iy; Mon, 27 Apr 2026 13:29:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1294870.1571577; Mon, 27 Apr 2026 13:29:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHM1Q-0004QZ-G9; Mon, 27 Apr 2026 13:29:12 +0000
Received: by outflank-mailman (input) for mailman id 1294870;
 Mon, 27 Apr 2026 13:29:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wHM1P-0004QT-IY
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 13:29:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHM1O-005ZsU-F4
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 15:29:10 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69ef649c-bab6-0a2a0a5309dd-0a2a450ac220-20
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 15:29:10 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69ef64a6-56b3-0a2a450a0019-d1558030ed48-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 15:29:10 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4891e86fabeso112233755e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 06:29:10 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4891c08faffsm1047785565e9.1.2026.04.27.06.29.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2026 06:29:09 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1777296550; x=1777901350; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mkGfo+UOjoxYzBSBmwgThgrWn/HwaxyASSA7oHIl8rs=;
        b=RJ/rS489KtqS+N+8oate2pHwOZjPsUoPkYor9xbIzWgMkpHcg9HUARCf6wZfYM2XHR
         64lj3rAERv8XXWOLLGePa2a5EzTafHI6lSy01AgFaivXtrm6AxKQajnXkEgP2knvwScF
         i1rNm0So4ZWI93eaCn4Hie7ZHfaIcaJ2Pgt6RrNqv1WV9A3SPcZteiBYfLctV0t425Vz
         XiLWE3CBSwqehVRZ/UDExCbXNX+w2L801OA8tsSJx4zWnpV00j+DALEt8vu/DGIAwzts
         9Yo5h9SxdnwEweXv1T7u1Qxxv9/a1s+9wV1WgAMrRPMzHJfrSKAy3twEpP8m09sjj7cT
         2enw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777296550; x=1777901350;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mkGfo+UOjoxYzBSBmwgThgrWn/HwaxyASSA7oHIl8rs=;
        b=g5iIOrDvOTx3Fy5jksLvjHFvdqxg8DBVDnSaTpTxgq0cIltPe11iQhl2ICAdeqA88a
         F4Bs7f/V2vw5onvDsoIW7tUZFL552TxFafFp3IPFRaYQO+QNiy7g4aLtpdiaFVxWyxH5
         PaI2mXRZdfRgtFxepnAyLUmBrESkbuAQck5JF/bDGYDJ9niEAlYt4Vco7SD+LMqIa7aJ
         ZbMVIwEddxtasyMdGvq6p0jD8Rk+z0X53IOOD94+vbrUftL7FpD2aA/Med0co6448sbs
         +ItpqYdY4uhYZTqgGXQn2f+GctTjpyelf5wxRv+sFiVde/j8UasYN8VKoxleyqDRyvDE
         Z9Cw==
X-Forwarded-Encrypted: i=1; AFNElJ/hBHWEPqXmUs9mrg60pImgnWGznTg09w3v6R0xhSz2nvmo8rNpXaM/zMkFu5efmuSoTkzeemTjNfg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzJGp8MYhZS7cc660aRXOAwbdyIIgEe2uJN9xwAnWcgfJWcMVbq
	oX1P2gTbSOOIYQ+U107+M8KJMDWq1prHq07GLsy5jpaLQnzLoJ/mZP+o
X-Gm-Gg: AeBDiesjJ+hYCOra/APdkschVlGR/H9wg3NRJj/YFNzra+YmRGx5ICqux3fp9EUqXUM
	G//HC7Rw9A08zMdNMl9eHXkje809f3lhbinEyB4hpmUvPuIzchtkJJH8pFcRyh7/WYdRK5b1g41
	A0NlN6HVGDeYmJf/nMTdXcMkuhDKg3R9+SQxDn/DaifQInMQN25307brZdryCQ9VBof8/pa+xbz
	L8Km+97FA34T0fzjxhaD9okbjKfYVxW6etvUFO182zhvzU2X4qvYOmfUBH4pO+mEJPmG3CYCN7T
	iPZlNcjyOtiVI9jpMyYG0ffiwK60x4p0SQIF/11nx8wvK8ZQbRHcHYl22027Z1o0X4L/GqfQyMI
	n+VKISvaiUZ2AD9pN6+Z7zXC4F5QvKMWW9Vrx0KNHDatlKGqBfAOXjZMCnHlIbzXogNWEGA+G4+
	YDfvhXJTRR/QDri70TAq5S7UddtgOaJazSAih0tq7ojTgzmb4VZGBeB3HREsN8w+EuBMJLJoxIb
	G5dE4y8GhC11w==
X-Received: by 2002:a05:600c:621a:b0:48a:592c:e642 with SMTP id 5b1f17b1804b1-48a592ce867mr349520855e9.18.1777296549386;
        Mon, 27 Apr 2026 06:29:09 -0700 (PDT)
Message-ID: <9a897425-f41d-4d9d-8108-5930f5e12185@gmail.com>
Date: Mon, 27 Apr 2026 15:29:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] xen: introduce CONFIG_HAS_DOMAIN_TYPE
To: "Orzel, Michal" <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1776957840.git.oleksii.kurochko@gmail.com>
 <fa2e255e53fe3aef2075ba8457be5fd4ba9156d1.1776957840.git.oleksii.kurochko@gmail.com>
 <71ae72eb-3424-4d41-afb7-9f1462e84aaf@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <71ae72eb-3424-4d41-afb7-9f1462e84aaf@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1777296550-46D708B7-D66F5448/10/73395122804
X-purgate-type: spam
X-purgate-size: 1032
X-Rspamd-Queue-Id: A04904736AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
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



On 4/27/26 11:21 AM, Orzel, Michal wrote:
> 
> 
> On 24-Apr-26 3:36 PM, Oleksii Kurochko wrote:
>> As domain type is part of common code now there is no any reason
> NIT: remove "any" after "no"
> 
>> to have architecture-specific set_domain_type() functions so
>> it is dropped.
>>
>> Change the guard around access of kinfo->type to CONFIG_HAS_DOMAIN_TYPE
>> for consistency. Also, drop and add some parentheses to be aligned
>> with the similar if() below.
>>
>> x86 with CONFIG_64BIT=y shouldn't use is_{32,64}bit_domain() as
>> x86 doesn't have support of CONFIG_HAS_DOMAIN_TYPE. Since x86_32 Xen no
>> longer builds, the fallback is currently only relevant for arm32.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> You don't seem to remove enum domain_type type from struct arch_domain which is
> now unused. With that removed:

Oh, right. I dropped it only from struct kernel_info. I will drop it.

> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Thanks.

~ Oleksii

