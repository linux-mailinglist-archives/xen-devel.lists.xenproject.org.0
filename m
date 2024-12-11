Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5960F9ED456
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 19:02:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855217.1268221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLR2U-000839-9j; Wed, 11 Dec 2024 18:02:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855217.1268221; Wed, 11 Dec 2024 18:02:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLR2U-000810-61; Wed, 11 Dec 2024 18:02:22 +0000
Received: by outflank-mailman (input) for mailman id 855217;
 Wed, 11 Dec 2024 18:02:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lbUB=TE=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tLR2S-0007v6-BS
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 18:02:20 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f6589ec-b7ea-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 19:02:19 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1733940131887442.562450053406;
 Wed, 11 Dec 2024 10:02:11 -0800 (PST)
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
X-Inumbo-ID: 0f6589ec-b7ea-11ef-a0d5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1733940134; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cLb54D+K610+OOP8NztLm8oHUXh7WGG8bqJx80S7L6Yg/sLBRfiBcrx2Z9WBRfVChYE1QNqFuFairNPwR3REZ80I+JcIjcT0DsDxaKFMubcNeD1AX28em+M5ZQ35y2tB4Ngq1RwIQ48bp6wELNdKEJZrTe/yAVqjuMXd6Cc5DPo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733940134; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6tzOCB89aUMmzBNvnrv96m1H59rEhkXoYmeGsgmxwq8=; 
	b=P3x++HkO5+FzxFFA9caBeyH0sKVyJ7ayxAEaZeQVQzcLSBMBisKMVbFrig229fEXIoGS19QPXM5SAirzVD+FuKpv8Rl42M/82OQPI2qa6FPJzkzSlsMRH9WuyiGLxdvwP2ocsMuyBeppMJG+k2jXGa6g08NexKWXVCiHE27jMmI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733940134;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=6tzOCB89aUMmzBNvnrv96m1H59rEhkXoYmeGsgmxwq8=;
	b=abftf6WMbpdBGczyjkTvu1Scpf3hhei3IFtp0kHwzSNHjsAKlFDXx7wwAuj/LB4A
	w4jvfshHcSJqbuUd7ynnke2Mx3frzhXDerK2LpOxn1dnf+RiBIDWyKE4ZKIe5s8nBmI
	fM9pm4NmHQJmqGyigA/sGp3pqVyyNUcU9fcmvKzw=
Message-ID: <0e68ddfe-6736-4abe-b139-acd80a4bdedc@apertussolutions.com>
Date: Wed, 11 Dec 2024 13:02:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/15] x86/hyperlaunch: add memory parsing to domain
 config
To: Jan Beulich <jbeulich@suse.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-14-dpsmith@apertussolutions.com>
 <e01af196-9f6d-4fde-a118-2875744d5865@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <e01af196-9f6d-4fde-a118-2875744d5865@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 12/2/24 07:14, Jan Beulich wrote:
> On 23.11.2024 19:20, Daniel P. Smith wrote:
>> @@ -160,6 +161,42 @@ static int __init process_domain_node(
>>               else
>>                   printk("PV\n");
>>           }
>> +        if ( match_fdt_property(fdt, prop, "memory" ) )
>> +        {
>> +            uint64_t kb;
>> +            if ( fdt_prop_as_u64(prop, &kb) != 0 )
>> +            {
>> +                printk("  failed processing memory for domain %s\n",
>> +                       name == NULL ? "unknown" : name);
>> +                return -EINVAL;
>> +            }
>> +            bd->mem_pages = PFN_DOWN(kb * SZ_1K);
>> +            printk("  memory: %ld\n", bd->mem_pages << PAGE_SHIFT);
>> +        }
>> +        if ( match_fdt_property(fdt, prop, "mem-min" ) )
>> +        {
>> +            uint64_t kb;
>> +            if ( fdt_prop_as_u64(prop, &kb) != 0 )
>> +            {
>> +                printk("  failed processing memory for domain %s\n",
>> +                       name == NULL ? "unknown" : name);
>> +                return -EINVAL;
>> +            }
>> +            bd->min_pages = PFN_DOWN(kb * SZ_1K);
>> +            printk("  min memory: %ld\n", bd->min_pages << PAGE_SHIFT);
>> +        }
>> +        if ( match_fdt_property(fdt, prop, "mem-max" ) )
>> +        {
>> +            uint64_t kb;
>> +            if ( fdt_prop_as_u64(prop, &kb) != 0 )
>> +            {
>> +                printk("  failed processing memory for domain %s\n",
>> +                       name == NULL ? "unknown" : name);
>> +                return -EINVAL;
>> +            }
>> +            bd->max_pages = PFN_DOWN(kb * SZ_1K);
>> +            printk("  max memory: %ld\n", bd->max_pages << PAGE_SHIFT);
>> +        }
> 
> Since the values logged are all multiples of 1k, why make reading the logs
> more complicated by logging byte-granular values? I instead wonder whether
> converting to more coarse grained values (leaving, say, between 4 and 6
> significant digits while using kb, Mb, Gb, etc) wouldn't be yet better.

Sure we can make it report in a friendlier format. To support dynamic 
sizing, is there already an existing formatter, I would hate to 
re-invent the wheel on this, or I could just statically report in kb.

v/r,
dps


