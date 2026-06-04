Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fwDWBphiIWoXFgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 13:33:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A00B63F74F
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 13:33:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=gvSe6INF;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1327717.1592515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV6KL-0002xe-W6; Thu, 04 Jun 2026 11:33:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327717.1592515; Thu, 04 Jun 2026 11:33:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV6KL-0002ut-T8; Thu, 04 Jun 2026 11:33:33 +0000
Received: by outflank-mailman (input) for mailman id 1327717;
 Thu, 04 Jun 2026 11:33:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wV6KK-0002un-IS
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 11:33:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV6KJ-006N34-Ow
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 13:33:31 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a216280-2eae-0a2a0a5409dd-0a2a450791e8-24
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 13:33:31 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a21628b-229c-0a2a45070019-d155dd2eb01b-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 13:33:31 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-45ef4223be7so363246f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 04:33:31 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4602cda363bsm2868733f8f.31.2026.06.04.04.33.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2026 04:33:30 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780572811; x=1781177611; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N+gjztpdbDuEQYm6BPrE2/oYBRaj5w9nj3M75JaqAe0=;
        b=gvSe6INFY/Z7O9VfYkzKORrKypix2/zVvAFEVewef/E53QhBjiwmLEm0KFO7qDinY3
         QQg2vFKdH0KenQR1XCW2Ilj1IUEcOApUbp/uojgahC9OXB4+U2wEbneU1uEz6i9BX8sK
         xPR56JzSzU9wOrFBUnOIQalzh3PIqTdxV/+3PcoRSDCdbTIWdtn3qQ5AjrMIBpyCZUuD
         1AcliKtIX66WzY28GvQC5HQGV0FZGpmiOr+ngWMcgFDwcMzw7vl/Jyx3XOMWMMjkNn9l
         YZewTPEZaOkdYUbGyu8WbwMt6URe9fhbRieOPL8aV/pYwc4q+TktwYx0jJbkhMVT8m1Z
         2Utg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780572811; x=1781177611;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N+gjztpdbDuEQYm6BPrE2/oYBRaj5w9nj3M75JaqAe0=;
        b=EGVLdhIkeC3RoVeULzxozlIwK3NkNSJXPoHqYP241NvIV2hy/xAXiuubNwOn/KVggu
         e1yVwYAeFSSN9oroXVk75Bl7b5cbYGpZHR0L8+tDljAatLlcfvCQOZVk7uIBFoASNtun
         /Sp7Xp6bTn/aH9kY3st07j0qSUUU0+vYzHkdRDUR3ZUo4wUW6eoxyDSAoKScG8x9vzaP
         2JaDlbU+23iW785Bz5sYfd+EjwCLpiZkUrLpjbt+7B4NffgiNkdGCPEtV/5juNLj7Rk+
         n76+myaY2M35Yqruu3ney6alxePwqvLF4/1Eps5qOnOtazBBHIrU6DgyNdJ2+K+pVGxx
         IiZw==
X-Forwarded-Encrypted: i=1; AFNElJ8qCaO+7e4rBqd2318dtnBEgDqwJfIRZWXxIpGpmtTSnn3fmmEvQYXlQlrepbqklSbUloxKaGNZigc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw8gTp8eqgxIbCjGVFUKffbL9irhmJl53eHlSt1oYNsBNJAKlYX
	yWvHbBb87G1j/3R8co6/ZyXZBhQRwAxITg6ZK8QaCwbOW+aBHXRXnOKI
X-Gm-Gg: Acq92OEaW4GKsS9SFkY6w0g6kcCFCdk2VJs8XCLIuJjuRLlP5gAbtoLH/xQQnGne0wu
	bO4zSeS3axA2aPnZd+8wqEZS9Hv8PHRtjTN6/l4NAVzqrLRIeo/7ax+ArfMaRwrjekKjqSSHHZP
	yOQgx2+fMWHx0XjUca5wrv+Ufh1wo1TQ8tuSLncdwCJcj/O4ZVXHzX++hbY1ULWrv2pcpK7hUd1
	TnWbhzw0H8sSxTMLE4eej7plMEg492AR363kxJXtYyLJGk390h3BI4j3WHavrKI6KeLTRNXgt6m
	whNVS6W4UxDBXqgHmm9UL8hJrPe2r3ROszKFfQ3R1M41heaMwSi0mWXOCzmiDcuBeGwhPxJAOUD
	lc1SeQxByF5s40KXCil9Lgv1WMfOCaFj+kcWsspnHDnho4kvOqYe73I6vYrXkAuPE4h8eDgauwA
	1U5/VCvG0aS4KUQteJ1cAE18Ig42kjpA+cCqj5+8jtrPnzLIvLPzb0gXryNxNcBoFdyhFQjdqDm
	+vLcku0gtNeTt9F
X-Received: by 2002:adf:f104:0:b0:45e:edc8:d440 with SMTP id ffacd0b85a97d-46021782782mr8546681f8f.1.1780572810988;
        Thu, 04 Jun 2026 04:33:30 -0700 (PDT)
Message-ID: <003f5317-7669-484f-8095-4e48eedc102d@gmail.com>
Date: Thu, 4 Jun 2026 13:33:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/26] xen/riscv: introduce (de)initialization helpers
 for vINTC
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <fc5560cd49a2b952ce7724c23e41da3368833d9f.1778250616.git.oleksii.kurochko@gmail.com>
 <b95f7093-9ae8-4461-95d5-3c4b8a69c62d@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <b95f7093-9ae8-4461-95d5-3c4b8a69c62d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1780572811-2976AC48-BF94D0D0/10/73395122804
X-purgate-type: spam
X-purgate-size: 1960
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: 6A00B63F74F



On 6/3/26 5:00 PM, Jan Beulich wrote:
> On 08.05.2026 16:43, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/intc.c
>> +++ b/xen/arch/riscv/intc.c
>> @@ -11,6 +11,7 @@
>>   
>>   #include <asm/aia.h>
>>   #include <asm/intc.h>
>> +#include <asm/vaplic.h>
>>   
>>   static const struct intc_hw_operations *__ro_after_init intc_hw_ops;
>>   
>> @@ -94,3 +95,38 @@ int __init make_intc_domU_node(struct kernel_info *kinfo)
>>   
>>       return -EOPNOTSUPP;
>>   }
>> +
>> +int domain_vintc_init(struct domain *d)
>> +{
>> +    int ret = -EOPNOTSUPP;
>> +    const enum intc_version ver = intc_hw_ops->info->hw_version;
> 
> Again - why would what the underlying hardware has control what all domains
> get?

If host uses AIA (APLIC/IMSIC) compatible controller then guest should 
use virtual AIA compatible controller, shouldn't it?

I don't think that it is a case when host uses PLIC interrupt controller 
but guests are going to use virtual APLIC.

> 
>> +    switch ( ver )
>> +    {
>> +    case INTC_APLIC:
>> +        ret = domain_vaplic_init(d);
>> +        break;
>> +
>> +    default:
>> +        printk("vintc (ver:%d) isn't implemented\n", ver);
> 
> If we take this path for whatever reason, ...
> 
>> +        break;
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +void domain_vintc_deinit(struct domain *d)
>> +{
>> +    const enum intc_version ver = intc_hw_ops->info->hw_version;
>> +
>> +    switch ( ver )
>> +    {
>> +    case INTC_APLIC:
>> +        domain_vaplic_deinit(d);
>> +        break;
>> +
>> +    default:
>> +        printk("vintc (ver:%d) isn't implemented\n", ver);
> 
> ... we're also going to take this path (very quickly afterwards), just to
> get the same message twice without it being clear why it appears twice.

I missed to add printk("%s: ...", __func__, ...). I will update 
correspondingly if we will follow this way.

Thanks.

~ Oleksii

