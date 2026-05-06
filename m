Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOvMAoPx+ml1UgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 09:45:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D474D75C7
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 09:45:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301233.1575538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKWwB-0007TA-1K; Wed, 06 May 2026 07:44:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301233.1575538; Wed, 06 May 2026 07:44:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKWwA-0007Qd-Uc; Wed, 06 May 2026 07:44:54 +0000
Received: by outflank-mailman (input) for mailman id 1301233;
 Wed, 06 May 2026 07:44:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wKWw8-0007QX-WE
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 07:44:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKWw7-008Xqc-S1
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 09:44:51 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69faf173-2eae-0a2a0a5409dd-0a2a4502b3fc-0
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 09:44:51 +0200
Received: from [209.85.218.46] (helo=mail-ej1-f46.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69faf173-af86-0a2a45020019-d155da2ec48a-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 09:44:51 +0200
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-b8f9568e074so917106266b.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 00:44:51 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bc55ecffad3sm49090966b.46.2026.05.06.00.44.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 00:44:50 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778053491; x=1778658291; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QkoEEvXZ0nd9/OFXBMW0XbitQDRY2IA2LH/1rm9+raY=;
        b=kEg+yzantVl9dT7tjwETxnVpo/AYi5DJgyO/3Tjao+C0dylTIxrdA+RNVUIJOPs6sd
         xElIHqaudqsHVZ76GaVJomEnW5/T7OW37N6LNuaWnUJsbJUOdlLs0odqGjuqg2D37NI7
         DSQlISWS406rlT+7SnEEuCOLPxZ2v/pzjZVhwr6RhC0MYESUmSxEZbvb5www5gQb0v5b
         hp8U0r19cpYUuq6iQyLwtnO9Vftyl1AkXjt+JaqB+/b4IGKaosK9XYlw3Q4ZsT7HeTBC
         4v4o9qLtKB0GjJ4sqgzigiVIJeMDyvuCQYA+hOI6tv/qA8bEDd1A2Nk7Bdc6Z0auovbU
         cqQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778053491; x=1778658291;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QkoEEvXZ0nd9/OFXBMW0XbitQDRY2IA2LH/1rm9+raY=;
        b=glKMjsNnkJmKN2H/9GHT7exfI9uc0PJ1qE1OkvYL9qmP+OkgF1xtfdwZzB6K3Y3Rtv
         gNTUuzYY/26HjGP6hDknG+DunuyiNWnk9jQgtAgEhSA9enjnSwjPz6UgwYireqlztfTY
         BsgRUCCxgf+1mnHWz60kZR9/NqNhyRkmfnbbDgwfgm5qFRKnT0mYZvdRXpkDWm5Wq+1K
         g90su3NIde0katojNThDupP/gq6pEDguz/qiA+QpNaPrbK3qcLdE0tVg6/OBsE2Pl2Xm
         1i9H3UIgzr3eOoSCMtSHB/OGhPHU6j3dSOsJGU4HIHQa5ein2TXas2yxJur9npsTsIDd
         AvUg==
X-Forwarded-Encrypted: i=1; AFNElJ/XR6iyXJ6c+IKGuHy+dFS376bB32IdyNTwa/VpAuhV7Ocu73wrA47IUYppEn8/HxG8kMtjTNDLYok=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyGikZjtQlsVKmhergNc6RVJdcbN3bX15fyC3pNmYYgXG9oYSb0
	gHvMeDXU1/vExAxHTYEDIjXkS4+Wjc4pq185ehblwgp/j5Smpgv3T+H+
X-Gm-Gg: AeBDieuyD75O55WUIsCld2xsPn4x7PhiqcB4EYgZfONM9VVLo7WRnpa3DMJeVeyHyxg
	4IaAqP1xdW8O8bXvK3Dl+t0TzbKR5AUHCNnfLUlEPdFQySCUJizqA1BgjDbhS0U9R9BJpgKWd89
	MymKgHTPWWywbXHC1nAK7hnNaDWLqKu7sgsiLNIBGCzJPiJ6TdI61Mn7FDqZ2beJTWCtB3X/XYY
	D+L7djLzqlqnqKicndXnzN1rQ9nGdegzm57JY70r3QRgPxr8fEu+4HlEwFACAeGR6cpozddC66c
	SS4FuVjU+21z1IbCN7p8PnzceRX6S9sCeMfOwyQkdGpHhGpOMi9cmUX5H66277J9S7Uq/hfJu/b
	GVj5P+rSFN/wLjaHgnalBkCcsD//g4hQ+df8kiaXOqF5fwljeIiKDEJr0rRP3tqVvpqlrHtgCKU
	9fE8iZzg9TGbH91W8IgAAHUIkufNxjELYYpvZ7QNlz2FFH/Ifrp3xkUMnvzbMWYddHFsxDWx4Ua
	VsY9rd3iE9dSA==
X-Received: by 2002:a17:907:2685:b0:bb5:8532:af4b with SMTP id a640c23a62f3a-bc56e40f24amr84274666b.26.1778053490996;
        Wed, 06 May 2026 00:44:50 -0700 (PDT)
Message-ID: <2ec5eec1-0a7d-445f-9d96-99b3070afeb1@gmail.com>
Date: Wed, 6 May 2026 09:44:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] xen: introduce CONFIG_HAS_DOMAIN_TYPE
To: Jan Beulich <jbeulich@suse.com>, Michal Orzel <michal.orzel@amd.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1777296786.git.oleksii.kurochko@gmail.com>
 <7c91e1a705e1046be4af1c5671a8d91cf3557013.1777296786.git.oleksii.kurochko@gmail.com>
 <5daeb8f7-cf0f-4ea7-a686-93df36b43a30@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <5daeb8f7-cf0f-4ea7-a686-93df36b43a30@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1778053491-80B78161-F99BE298/10/73395122804
X-purgate-type: spam
X-purgate-size: 3034
X-Rspamd-Queue-Id: 54D474D75C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:michal.orzel@amd.com,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]



On 5/4/26 2:21 PM, Jan Beulich wrote:
> On 27.04.2026 17:34, Oleksii Kurochko wrote:
>> As domain type is part of common code now there is no any reason
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
>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 
> In principle:
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> 
> However, still a few remarks:
> 
>> --- a/xen/include/xen/domain.h
>> +++ b/xen/include/xen/domain.h
>> @@ -13,6 +13,19 @@ struct guest_area {
>>       void *map;
>>   };
>>   
>> +#ifdef CONFIG_HAS_DOMAIN_TYPE
>> +enum __packed domain_type {
>> +    DOMAIN_32BIT,
>> +    DOMAIN_64BIT,
>> +};
>> +#define is_32bit_domain(d) ((d)->type == DOMAIN_32BIT)
>> +#define is_64bit_domain(d) ((d)->type == DOMAIN_64BIT)
>> +#elif !defined(CONFIG_64BIT)
>> +/* At the moment on 32-bit-only platforms all domains are 32-bit. */
>> +#define is_32bit_domain(d) (true)
>> +#define is_64bit_domain(d) (false)
> 
> I think it would be nice if the excess parentheses were dropped from here.
> 
>> --- a/xen/include/xen/fdt-domain-build.h
>> +++ b/xen/include/xen/fdt-domain-build.h
>> @@ -7,6 +7,7 @@
>>   #include <xen/device_tree.h>
>>   #include <xen/fdt-kernel.h>
>>   #include <xen/mm.h>
>> +#include <xen/sched.h>
>>   #include <xen/types.h>
>>   
>>   struct domain;
>> @@ -69,6 +70,14 @@ static inline uint32_t alloc_phandle(struct kernel_info *kinfo)
>>       return kinfo->next_phandle >= GUEST_PHANDLE_GIC ? 0 : kinfo->next_phandle++;
>>   }
>>   
>> +static inline void set_domain_type(struct domain *d, struct kernel_info *kinfo)
> 
> Pointer-to-const for the 2nd parameter?

I will apply this comment and comment above.

> 
>> +{
>> +#ifdef CONFIG_HAS_DOMAIN_TYPE
>> +    /* Type must be set before allocate memory */
> 
> This comment would be more prominent if it lived outside of the #ifdef,
> perhaps (read on) ahead of the function. I wonder though why it's only
> a comment, and not e.g. an assertion. If an assertion was possible to
> add, the comment would want to live next to it. Without an assertion
> putting it ahead of the function may be better.
> 
> Depending on how far to go, changes could be made while committing, or a
> proper v5 may want submitting.

I think that instead of comment or just after comment the following 
could be added:
   ASSERT(!domain_tot_pages(d));

Jan, Michal, do you see any concern with that ASSERT() or I could add it 
and keep your Ack-by and R-by.

Thanks.

~ Oleksii

