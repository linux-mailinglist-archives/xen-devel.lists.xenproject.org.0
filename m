Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7045B9ECC95
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 13:50:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854776.1267894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLMA8-0000RT-5w; Wed, 11 Dec 2024 12:49:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854776.1267894; Wed, 11 Dec 2024 12:49:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLMA8-0000PN-2y; Wed, 11 Dec 2024 12:49:56 +0000
Received: by outflank-mailman (input) for mailman id 854776;
 Wed, 11 Dec 2024 12:49:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lbUB=TE=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tLMA6-0000PF-R4
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 12:49:54 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69536bbd-b7be-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 13:49:52 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1733921385340942.4450878369379;
 Wed, 11 Dec 2024 04:49:45 -0800 (PST)
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
X-Inumbo-ID: 69536bbd-b7be-11ef-a0d5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1733921387; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QmGQxh8A+hpECqzG4Rgrp+hLqIvAtC+hCt+skPtGEOVzCYrNpL4xKVMdtYhRQ5oxEiSvmItsoyI8lmFYenPciaitH4ert1LchoM2aCGvQFentuNQOIjwSl3OcoZPU2GGsrIqwHp6U6kjM5whneDR8N68RTwIWv3hrKm0drudYvc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733921387; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kK0++IHAxwDlZnYWDMNx2hSGO3o1dKumlrnPUHek3ZM=; 
	b=L2TresWJl26OzM+AkMB2qc0E/1A15AsRL8OY7qKHv7TRKsJNko8MnjWdUj+28RM1FEPwHyI9/88+jj1Xuvqaa1Q0yvhwHB0XVyTc70nDfye9a+l90W8X56PWSYbcIuJs7rfFsBC/19uD9flXK060T04JZW28MdxO7n+gYnKqEKE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733921387;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=kK0++IHAxwDlZnYWDMNx2hSGO3o1dKumlrnPUHek3ZM=;
	b=tyv57vFnTZBJUDGL2DfugYh8wa+o0yRZvQmkLUz3JHsF2kYARfW3ilaS2rCS4WBA
	G6ywCoD4niacKoU4f/byvI+DsjrJoQ+lrSIXU0XvNhZASOOenXMQt8ToNRh+2RWOBTe
	fHsycak8C3ZaAO/uJJs+PrHP0+3UIm+DVn1Iws+s=
Message-ID: <819cab1c-a7b7-4898-9f6b-bd383b7cbd31@apertussolutions.com>
Date: Wed, 11 Dec 2024 07:49:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/15] x86/hyperlaunch: initial support for hyperlaunch
 device tree
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-8-dpsmith@apertussolutions.com>
 <6843e4c8-1b72-4b3f-be45-1854051dbd40@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <6843e4c8-1b72-4b3f-be45-1854051dbd40@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 11/25/24 15:11, Jason Andryuk wrote:
> On 2024-11-23 13:20, Daniel P. Smith wrote:
>> Add the ability to detect both a formal hyperlaunch device tree or a 
>> dom0less
>> device tree. If the hyperlaunch device tree is found, then count the 
>> number of
>> domain entries, reporting if more than one is found.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   xen/arch/x86/domain_builder/core.c  | 14 +++++++
>>   xen/arch/x86/domain_builder/fdt.c   | 64 ++++++++++++++++++++++++++++-
>>   xen/arch/x86/domain_builder/fdt.h   |  5 +++
>>   xen/arch/x86/include/asm/bootinfo.h |  1 +
>>   4 files changed, 83 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/x86/domain_builder/core.c b/xen/arch/x86/ 
>> domain_builder/core.c
>> index 211359895d84..a80f3711c306 100644
>> --- a/xen/arch/x86/domain_builder/core.c
>> +++ b/xen/arch/x86/domain_builder/core.c
>> @@ -40,7 +40,21 @@ void __init builder_init(struct boot_info *bi)
>>                      ret);
>>               bi->hyperlaunch_enabled = false;
>>           }
>> +    }
>> +
>> +    if ( bi->hyperlaunch_enabled )
>> +    {
>> +        int ret;
>> +
>> +        printk(XENLOG_INFO "Hyperlauch configuration:\n");
> 
> Hyperlaunch

Ack.

>> +        if ( (ret = walk_hyperlaunch_fdt(bi)) < 0 )
>> +        {
>> +            printk(XENLOG_INFO "  walk of device tree failed (%d)\n", 
>> ret);
>> +            bi->hyperlaunch_enabled = false;
>> +            return;
>> +        }
>> +        printk(XENLOG_INFO "  Number of domains: %d\n", bi->nr_domains);
>>       }
>>   }
>> diff --git a/xen/arch/x86/domain_builder/fdt.c b/xen/arch/x86/ 
>> domain_builder/fdt.c
>> index 3f9dda8c34c3..ff1ba58b6907 100644
>> --- a/xen/arch/x86/domain_builder/fdt.c
>> +++ b/xen/arch/x86/domain_builder/fdt.c
> 
>> +int __init walk_hyperlaunch_fdt(struct boot_info *bi)
>> +{
>> +    int ret = 0, hv_node, node;
>> +    void *fdt = bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_IDX]);
>> +
>> +    if ( unlikely(!fdt) )
>> +        return -EINVAL;
>> +
>> +    hv_node = find_hyperlaunch_node(fdt);
>> +    if ( hv_node < 0 )
>> +    {
>> +        ret = hv_node;
>> +        goto err_out;
>> +    }
>> +
>> +    fdt_for_each_subnode(node, fdt, hv_node)
>> +    {
>> +        ret = fdt_node_check_compatible(fdt, node, "xen,domain");
>> +        if ( ret == 0 )
>> +            bi->nr_domains++;
>> +    }
>> +
>> +    /* Until multi-domain construction is added, throw an error */
>> +    if ( !bi->nr_domains || bi->nr_domains > 1 )
>> +        printk(XENLOG_ERR "Hyperlaunch only supports dom0 
>> construction\n");
> 
> You continue execution - is that intended?  It'll take the next module 
> as the kernel and try to boot?  Would you rather panic?

Yes, it was intended, and as of this commit, it will use the next module 
as the kernel. That is the boot convention at this point. In this 
scenario, the system was given a valid HL device tree that happen to 
have multiple domains defined in it. At this point in the series, a 
domain definition literally has zero effect on the boot process, so 
there is no reason to panic.

v/r,
dps

