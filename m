Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5F22D1A06
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 20:53:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46975.83182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmMYx-0007u5-QP; Mon, 07 Dec 2020 19:52:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46975.83182; Mon, 07 Dec 2020 19:52:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmMYx-0007tg-N9; Mon, 07 Dec 2020 19:52:47 +0000
Received: by outflank-mailman (input) for mailman id 46975;
 Mon, 07 Dec 2020 19:52:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=exIY=FL=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kmMYw-0007tb-CS
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 19:52:46 +0000
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d1e08ff-4389-4e5a-9dcd-69000875d004;
 Mon, 07 Dec 2020 19:52:45 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id y16so16404094ljk.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Dec 2020 11:52:45 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id q23sm569246lfo.278.2020.12.07.11.52.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 11:52:43 -0800 (PST)
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
X-Inumbo-ID: 1d1e08ff-4389-4e5a-9dcd-69000875d004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=vWT48cVrnZI5gtATTM2YkZ0QmJVC2e6rTy/UJQbYmPY=;
        b=HnVupPQmXmQdpWXmW8R3X6DNGnYz7hxO0B7EtMdw8PzIAeW5W9jbOdc1+zm5h6wRHq
         C/UWP4IjCwZrJlrhU767mXc2JGh9Wmz9690k0g220T1VNl3qrfoADRmjnEQuXxBxAbIp
         yTHVzry7CB92bnnP7Pd6pkE+pZKjqr6uayyEjOxIyPOawFeDLhBquBJ3dYHq4B41pnOM
         kc4E+lou1oQ59k9/u/HgkqsnyUgCi+mf7PuMsvLBwVotqt2hzlxCRGRJIexfWiq5/onK
         +QRb8AnrUSGVOp4XLeJUzcY6HfWw0gaOpnenzzrH2Yp5QJSRJiQcKalsOmpYO1BBByLN
         z+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=vWT48cVrnZI5gtATTM2YkZ0QmJVC2e6rTy/UJQbYmPY=;
        b=bEk8IXqYzDwL8n29N3a8LRdP1u13HtIqnYrtvA9ZRi9NptAD4pgRt6JB088kc/CBbx
         e5a/9aiO5DwZB7E40Ji4tz8hsmtF4M4UnyTCFD8DiJk5AuqslDbJ/JfDYGbAHt3w4dmR
         nTPP0CwPk5uEpg3TtL/rVt6Ber7W5IYrYEigVgtxVsDmHvxSNX0tHcmP6gnjc0+uhTsb
         cipQKihZEMmFbBrgPKqA0U456RWUFhRF/tszoj6i7XtUQ3XlE8DKj915a089hPvziYN5
         GVB8kk61DGYs74Zm/u3MivjcrT8NpzVKLZT9I00Zv0uQLdpy7SOAxIyGfnCeGQWxxAdu
         ojCA==
X-Gm-Message-State: AOAM532Z6o074WtOIBzNIl2G/SM2k13zd65IA6Af4bQVAAytppPb3UgN
	O2sVlRreTlKo/t8xByWOgIY2NdtGNyvdZQ==
X-Google-Smtp-Source: ABdhPJxkWalchd4pid70bGfIyUozTCiDn8jUgASfLLKee/UqfhIJQyxy8HIL7AE068nRDHEHGtl3bg==
X-Received: by 2002:a05:651c:1033:: with SMTP id w19mr9535774ljm.55.1607370764153;
        Mon, 07 Dec 2020 11:52:44 -0800 (PST)
Subject: Re: [PATCH V3 08/23] xen/ioreq: Move x86's ioreq_server to struct
 domain
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-9-git-send-email-olekstysh@gmail.com>
 <5b5011b7-5b8f-79cd-d8dc-c276ba1f9e37@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <b04fc121-37bf-8dd1-4204-e6732b98afc3@gmail.com>
Date: Mon, 7 Dec 2020 21:52:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5b5011b7-5b8f-79cd-d8dc-c276ba1f9e37@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 07.12.20 14:04, Jan Beulich wrote:

Hi Jan

> On 30.11.2020 11:31, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> The IOREQ is a common feature now and this struct will be used
>> on Arm as is. Move it to common struct domain. This also
>> significantly reduces the layering violation in the common code
>> (*arch.hvm* usage).
>>
>> We don't move ioreq_gfn since it is not used in the common code
>> (the "legacy" mechanism is x86 specific).
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Applicable parts
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thank you.


> yet with a question, but maybe more to Paul than to you:
>
>> --- a/xen/include/asm-x86/hvm/domain.h
>> +++ b/xen/include/asm-x86/hvm/domain.h
>> @@ -63,8 +63,6 @@ struct hvm_pi_ops {
>>       void (*vcpu_block)(struct vcpu *);
>>   };
>>   
>> -#define MAX_NR_IOREQ_SERVERS 8
>> -
>>   struct hvm_domain {
>>       /* Guest page range used for non-default ioreq servers */
>>       struct {
>> @@ -73,12 +71,6 @@ struct hvm_domain {
>>           unsigned long legacy_mask; /* indexed by HVM param number */
>>       } ioreq_gfn;
>>   
>> -    /* Lock protects all other values in the sub-struct and the default */
>> -    struct {
>> -        spinlock_t              lock;
>> -        struct ioreq_server *server[MAX_NR_IOREQ_SERVERS];
>> -    } ioreq_server;
>> -
>>       /* Cached CF8 for guest PCI config cycles */
>>       uint32_t                pci_cf8;
>>   
>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -316,6 +316,8 @@ struct sched_unit {
>>   
>>   struct evtchn_port_ops;
>>   
>> +#define MAX_NR_IOREQ_SERVERS 8
>> +
>>   struct domain
>>   {
>>       domid_t          domain_id;
>> @@ -523,6 +525,14 @@ struct domain
>>       /* Argo interdomain communication support */
>>       struct argo_domain *argo;
>>   #endif
>> +
>> +#ifdef CONFIG_IOREQ_SERVER
>> +    /* Lock protects all other values in the sub-struct and the default */
>> +    struct {
>> +        spinlock_t              lock;
>> +        struct ioreq_server     *server[MAX_NR_IOREQ_SERVERS];
>> +    } ioreq_server;
>> +#endif
> The comment gets merely moved, but what "default" does it talk about?
> Is this a stale part which would better be dropped at this occasion?

I saw Paul's answer, will drop stale part.


-- 
Regards,

Oleksandr Tyshchenko


