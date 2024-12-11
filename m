Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE4C9EC2B4
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 04:02:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.853678.1267066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLCyh-0001oA-5I; Wed, 11 Dec 2024 03:01:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 853678.1267066; Wed, 11 Dec 2024 03:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLCyh-0001mX-2a; Wed, 11 Dec 2024 03:01:31 +0000
Received: by outflank-mailman (input) for mailman id 853678;
 Wed, 11 Dec 2024 03:01:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lbUB=TE=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tLCyf-0001mL-RH
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 03:01:29 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 366a2a6b-b76c-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 04:01:28 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 173388608040281.05351460689235;
 Tue, 10 Dec 2024 19:01:20 -0800 (PST)
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
X-Inumbo-ID: 366a2a6b-b76c-11ef-a0d5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1733886082; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VMMjOSTRr2vvppv2ZbRLUfLWUuvNfg9lyxQn20QN1d24SJhGWzsyl+LQ/FQer6D4+MbdasxdFLhAhzChNw3Wk5hjBSun6p33Rb8i1QPT4aFlqvHPooEfyWBNVl/ysomyc78/NXNAhLrgHFpJlCrtEecmsle1Eke3076w7WbLLxA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733886082; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yB8V84d+Bxgzr5yKILVDci8Mq4G8EyFx1FSObp71k5Q=; 
	b=bPbuVN/RA9Cv4bBdBy+prxr3dkYHGEhtIL5aUvrwVrvcRYBqVuUqpBbOF2lGLdNRbZB622ElL4VZ8zNLsvu/8IXPBBjcZcR7Hdk40FIOQ74buIvlWcrQUr7L6Oo9LfbWfX7SAPLP5Aie4bcJQxv32Ea2NtrtWysORIJ/YtXKi3w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733886082;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=yB8V84d+Bxgzr5yKILVDci8Mq4G8EyFx1FSObp71k5Q=;
	b=okk4ofrrSmi9BJKWXhMpJKWjhVntnrphgZ0B2koHpot5DIVt6k5oZJMgYR7RhLm8
	k281oJN9cixGgB30YxPTpftOpCvQ98x8I+hrd9wfUtx0MoDfYDTasnLc4gZZyv+eios
	zOe5ez6dUyUqNhm5CTE54crv+L9/lDWSuq5jHElc=
Message-ID: <5deb8f9f-75bb-43b9-98c3-1b5e02076e61@apertussolutions.com>
Date: Tue, 10 Dec 2024 22:01:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/15] x86/boot: add cmdline to struct boot_domain
To: Jan Beulich <jbeulich@suse.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-4-dpsmith@apertussolutions.com>
 <43ce0519-5717-4d59-922d-10dc2c663747@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <43ce0519-5717-4d59-922d-10dc2c663747@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 12/2/24 04:49, Jan Beulich wrote:
> On 23.11.2024 19:20, Daniel P. Smith wrote:
>> --- a/xen/arch/x86/hvm/dom0_build.c
>> +++ b/xen/arch/x86/hvm/dom0_build.c
>> @@ -644,9 +644,11 @@ static bool __init check_and_adjust_load_address(
>>   }
>>   
>>   static int __init pvh_load_kernel(
>> -    struct domain *d, struct boot_module *image, struct boot_module *initrd,
>> -    paddr_t *entry, paddr_t *start_info_addr)
>> +    struct boot_domain *bd, paddr_t *entry, paddr_t *start_info_addr)
>>   {
>> +    struct domain *d = bd->d;
>> +    struct boot_module *image = bd->kernel;
>> +    struct boot_module *initrd = bd->ramdisk;
>>       void *image_base = bootstrap_map_bm(image);
>>       void *image_start = image_base + image->headroom;
>>       unsigned long image_len = image->size;
>> @@ -1304,14 +1306,12 @@ static void __hwdom_init pvh_setup_mmcfg(struct domain *d)
>>   int __init dom0_construct_pvh(struct boot_domain *bd)
>>   {
>>       paddr_t entry, start_info;
>> -    struct boot_module *image = bd->kernel;
>> -    struct boot_module *initrd = bd->ramdisk;
>>       struct domain *d = bd->d;
>>       int rc;
>>   
>>       printk(XENLOG_INFO "*** Building a PVH Dom%d ***\n", d->domain_id);
>>   
>> -    if ( image == NULL )
>> +    if ( bd->kernel == NULL )
>>           panic("Missing kernel boot module for %pd construction\n", d);
>>   
>>       if ( is_hardware_domain(d) )
>> @@ -1351,7 +1351,7 @@ int __init dom0_construct_pvh(struct boot_domain *bd)
>>           return rc;
>>       }
>>   
>> -    rc = pvh_load_kernel(d, image, initrd, &entry, &start_info);
>> +    rc = pvh_load_kernel(bd, &entry, &start_info);
>>       if ( rc )
>>       {
>>           printk("Failed to load Dom0 kernel\n");
> 
> None of this looks command line related - do these changes rather belong into
> patch 1?

Hmmm, yah, it looks like it. This must have been a cherry-pick artifact 
that I missed when updating these commits on top of the version from the 
boot module reviews. I will review and move/drop the chunks.

v/r,
dps



