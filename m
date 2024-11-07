Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6D29BFB35
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 02:14:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831497.1246824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8r64-00049X-VD; Thu, 07 Nov 2024 01:14:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831497.1246824; Thu, 07 Nov 2024 01:14:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8r64-000473-SR; Thu, 07 Nov 2024 01:14:04 +0000
Received: by outflank-mailman (input) for mailman id 831497;
 Thu, 07 Nov 2024 01:14:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9PMW=SC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t8r62-00046x-Pm
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 01:14:02 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90e3cb6e-9ca5-11ef-a0c6-8be0dac302b0;
 Thu, 07 Nov 2024 02:14:00 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1730942032804316.4659053353964;
 Wed, 6 Nov 2024 17:13:52 -0800 (PST)
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
X-Inumbo-ID: 90e3cb6e-9ca5-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6IjkwZTNjYjZlLTljYTUtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTQyMDQwLjU3NDMyNywic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1730942035; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=a2RyTlskiuueu3mMb7uEzxMvbCKqEGZEnaxRAVxrUQMR20DBZsk5dl7dv/9NiuaJXbU8/l+GCFUOZ1MCZZq3jkXK2DyzW6hDtuM2vrpt/L+bIFnpmsWcA8453KZDwOtUQZ1VBbycAIQQsm4fHB1zip9EM/dWr3KetOp+0g5qrwQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730942035; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HqMJazsdIFaJ4mH78mQUuSonJ1WjNlhBuGlyCpIY5k4=; 
	b=VGoE5bvehaWq4sZS0wcCBnUwjjexayKup9PzuMGPCrvSUkrboAy4QBmPObIHj2mQnAcj/Vcx/tKKZSaUZ2Dyt/Fq70msiFNGRHmzb/XxAAdbokRT6q+BGQf9D9CWLJE9Qbua7fLocQTJrTWH8Sf/xHaqCJTmG5hnrQJIa0m12A0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730942035;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=HqMJazsdIFaJ4mH78mQUuSonJ1WjNlhBuGlyCpIY5k4=;
	b=cSd/PV10fmxzQl3my2A/0LiKGq+uL2DQ1PF+nVOkS6LHoDYiVfVsUuE3o2vA6UAP
	iJ5XT8lIGsJ5+P8lYHHJWzXmRf7CfNnejZqGjgmK7pTHimxeKSC3oChUi02pebzlUyZ
	gmqYMGu+DsltmvKa6chG+C+WOP5vpEaufnfQZhb0=
Message-ID: <53b8f7c6-3e02-4f5d-a0bd-25becdd0fcc7@apertussolutions.com>
Date: Wed, 6 Nov 2024 20:13:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/12] x86/boot: convert domain construction to use boot
 info
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
 <20241102172551.17233-9-dpsmith@apertussolutions.com>
 <2c1849f0-90f0-4e76-b8f9-c925522fc2e5@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <2c1849f0-90f0-4e76-b8f9-c925522fc2e5@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 11/6/24 19:43, Andrew Cooper wrote:
> On 02/11/2024 5:25 pm, Daniel P. Smith wrote:
>> @@ -1301,16 +1302,25 @@ static void __hwdom_init pvh_setup_mmcfg(struct domain *d)
>>       }
>>   }
>>   
>> -int __init dom0_construct_pvh(struct domain *d, const module_t *image,
>> -                              unsigned long image_headroom,
>> -                              module_t *initrd,
>> -                              const char *cmdline)
>> +int __init dom0_construct_pvh(struct boot_info *bi, struct domain *d)
>>   {
>>       paddr_t entry, start_info;
>> +    struct boot_module *image;
>> +    struct boot_module *initrd = NULL;
>>       int rc;
>>   
>>       printk(XENLOG_INFO "*** Building a PVH Dom%d ***\n", d->domain_id);
>>   
>> +    rc = first_boot_module_index(bi, BOOTMOD_KERNEL);
>> +    if ( unlikely(rc < 0 || rc > bi->nr_modules) )
>> +        panic("Missing kernel boot module for %pd construction\n", d);
> 
> Just noticed while experimenting.  The upper bound (for the error case)
> should be >= because nothing good can come of being handed the Xen module.

Ack.

>> +
>> +    image = &bi->mods[rc];
>> +
>> +    rc = first_boot_module_index(bi, BOOTMOD_RAMDISK);
>> +    if ( rc > 0 || rc < bi->nr_modules )
>> +        initrd = &bi->mods[rc];
> 
> This range check is tautologically true.  You want && instead of ||.
> 
> Same elsewhere, although this goes away when the variable is unsigned
> (and we remove assumptions about the dom0 kernel's index).

Ack.

v/r,
dps


