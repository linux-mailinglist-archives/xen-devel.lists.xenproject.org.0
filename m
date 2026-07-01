Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id U0PvKZLxRGrf3goAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 12:53:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C22696EC650
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 12:53:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=IGSdwTtF;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1349739.1607394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wesYa-00056b-J0; Wed, 01 Jul 2026 10:52:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349739.1607394; Wed, 01 Jul 2026 10:52:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wesYa-00054h-GF; Wed, 01 Jul 2026 10:52:40 +0000
Received: by outflank-mailman (input) for mailman id 1349739;
 Wed, 01 Jul 2026 10:52:39 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wesYZ-00054b-31
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 10:52:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wesYY-008DJG-Fv
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 12:52:38 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a44f176-e002-0a2a0a5209dd-0a2a4501ba36-0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 12:52:38 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a44f176-400f-0a2a45010019-d1558035b871-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 12:52:38 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-493c2b3dc8bso2449635e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 03:52:38 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47566fe448dsm16010183f8f.27.2026.07.01.03.52.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2026 03:52:37 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782903158; x=1783507958; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZcE6jBxr6nihgfqAzS4ZqpmQQYuTZk3PkpqYA/Nt5TU=;
        b=IGSdwTtF9RLZgaPaPA+2hvfZl8+1xHTv4uLZFzv4w9C86CyHd3OVI3ZxWw9hAXnEtl
         Tt+WLD1PmjkLVpoMjcngffWRgul2v5o2ntLNv3+bBkYvpMLnfmOp4IbdDr2Oonh2hQsa
         qlY6PZQ2XvGJZxhxH1b+KH36SFarmvYUJAUvIHsSmBILrd2+kVs32PDUTQfuT2HYu3TN
         7p1m/XbuveKkeeS78djaSQ3wcOJun5NxaIkx13RVVhqjLJJQE4byA0C9f7WkxebCLgdh
         nn3CUKLhLiSwEANYmJLoah7SeQ7OdYlXhILK1o4MvzXVKh1QIdXJ/qZ9Hw6D/Azqho/X
         OzcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782903158; x=1783507958;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZcE6jBxr6nihgfqAzS4ZqpmQQYuTZk3PkpqYA/Nt5TU=;
        b=TNNJwY6fXsyiXHwPidV3DAM5ca/WbBXfscltyoHlNZYqe5XuXVtOY+7UAPtvpJS8sG
         vB5LmNStwjT93UJIdieWUvqgZJyuSkPTMIwcRCy/TM9YarI5+QnTzLz/uxDxovPc5WBz
         lUPTZMAbq5JpR+gmamxzUxikyKYsFfsMB8CeD6JEf88T0aAlC/rRUAK/M2QVG/8fSO95
         cRjsNHLUFCohaAWv+C+KtuczY8U5YaXYIhJmM0rTToy1gyyOuncHcxQ71x8owaWra4/x
         M+SVW3CaUXMgSHx/OwHSXtREcdL7IXpEQiLquWV7pJIg2XJUOd0CNnzc21i9iD58cIxG
         gBwA==
X-Forwarded-Encrypted: i=1; AFNElJ9tqEh5zw/uTUvObD8lUBmRrTcynVsipsoM3QBinjPVmyVZ6SQ7Px+m9kGWKqWO0G4qM5LPYr0FXmA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy0tbuMUF+S/c0p/mY9L0a5bKAmZ91xWFxnVi51mcM/LL+MNCjJ
	rH6N/8nwJdaPkLqUVN4qVNtLxyywpFntS0AvXnAhfzoNeM6BhYyylLuO
X-Gm-Gg: AfdE7ckbzunoEc/qEZ+pcSn+NMO0pde7QjHN+2riRkYsOpvBDMgo4cnIau1OukvFp/2
	di4lzaqmhTo2H2pd1i2x9eJWHT+NMmWkewD3p7YRAyyuSBLLTLsdPN7tZmxNJ319ipXRtVppJtR
	U4RloBa9UPrDTv+sYXMHmkzSK5HANUXjF9GdIosTsv7fNgGlOiw8PZ4Hj+J8ioqtEo7v4lnjUgL
	wmrcyKSAqSgoFgJi11cVCJm0YGFKwNS3OlEDsbMYWjJHJ7/+/xuQVkBBzbFyENtWnywqoIduEuE
	sFFN7F5mKTh0tfESjlk5eealw7Bl3xZLA1n8d/41dK2clAolkD5qYWjQtU+qlx6P9e972yTEgbP
	pgA/PTmcpTV6HjpjjPKLIweyi1AkCbbgfMtx8LCXWqWn7wfpO89BCKY8sN7ajoqEhQAMJYyAaKk
	EPX0+tBNoey3OS3tLhxzLMWSDvniISncNidQYGAhexnxVBSTC7hDjQNDVEuVQ9cfImirU=
X-Received: by 2002:a05:600d:c:b0:493:8391:919a with SMTP id 5b1f17b1804b1-493c2b433dbmr16095845e9.16.1782903157864;
        Wed, 01 Jul 2026 03:52:37 -0700 (PDT)
Message-ID: <05173913-e6e0-4602-a75d-96ce134bd2ec@gmail.com>
Date: Wed, 1 Jul 2026 12:52:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 18/25] xen/riscv: introduce (de)initialization helpers
 for vINTC
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
 <ac0b9a985afc35023822150062b4f14f5a583bea.1782487661.git.oleksii.kurochko@gmail.com>
 <109135cb-7ad6-49f4-88c7-49ffb33e0068@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <109135cb-7ad6-49f4-88c7-49ffb33e0068@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1782903158-826C31E0-C7E57116/10/73395122804
X-purgate-type: spam
X-purgate-size: 1234
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: C22696EC650



On 6/29/26 5:07 PM, Jan Beulich wrote:
> On 26.06.2026 17:46, Oleksii Kurochko wrote:
>> Add common helpers domain_vintc_init() and domain_vintc_deinit() to
>> allocate and deallocate a virtual interrupt controller (vINTC)
>> structure and initialize basic virtual interrupt controller registers.
>>
>> domain_vintc_deinit() isn't called at the moment as arch_domain_destroy()
>> is implemented as stub at the moment.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> with one more suggestion:
> 
>> @@ -83,3 +84,37 @@ int __init make_intc_domU_node(struct kernel_info *kinfo)
>>   
>>       return vintc->init_ops->make_domu_dt_node(kinfo);
>>   }
>> +
>> +int domain_vintc_init(struct domain *d)
>> +{
>> +    int ret = -EOPNOTSUPP;
>> +    const enum intc_variant variant = intc_hw_ops->info->hw_variant;
>> +
>> +    switch ( variant )
>> +    {
>> +    case INTC_APLIC:
>> +        ret = domain_vaplic_init(d);
>> +        break;
>> +
>> +    default:
>> +        printk("vintc (variant:%d) isn't implemented\n", variant);
> 
> printk_once() maybe?

It makes sense. I will apply your suggestions.

~ Oleksii

