Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D97989ECE6D
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 15:20:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854836.1267934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLNZ8-0000IV-DG; Wed, 11 Dec 2024 14:19:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854836.1267934; Wed, 11 Dec 2024 14:19:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLNZ8-0000GD-AV; Wed, 11 Dec 2024 14:19:50 +0000
Received: by outflank-mailman (input) for mailman id 854836;
 Wed, 11 Dec 2024 14:19:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lbUB=TE=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tLNZ6-0000G7-Oc
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 14:19:48 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8d96aba-b7ca-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 15:19:47 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1733926779863348.3438017134732;
 Wed, 11 Dec 2024 06:19:39 -0800 (PST)
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
X-Inumbo-ID: f8d96aba-b7ca-11ef-a0d5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1733926781; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AGDApV+s5XYq8WBtDCHZkkpxMwiI+Urp/Rm1OFgVcgdwDV1GhNHBl0MaZETJGMjDS7EKCqLrApWwYq9lNXt57+zayz2AcoMMt3FMxtbuV+rOJvZLDB8aRkAeKvafPLJQ1ltgrXo0FLLh5DPeSVXTfezP74/i+Y/xftxNFRZ9xo0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733926781; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=M7nuzwWoGz53YA2QOgeNmV/5BGs45A7H+bZyTd1aieQ=; 
	b=j3Q8uoQoL7oZhBTG2kR5B4TVMT4g0RL9Lny8stMtPfLFDK1aLfKlZOvvbPW+nqV97FKsqqibZUwaekqelCo71VzfZ9W55D9r1ImIS7PAl//kWjP/eKHaWV3CN5qoVwmUL3KgNgGDdLs0/2tqdCXFStwNBt1daytt8RFhW38/k/8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733926781;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=M7nuzwWoGz53YA2QOgeNmV/5BGs45A7H+bZyTd1aieQ=;
	b=SCLlvxyJZcaNSNY1WOK6NILY/F6Xx1LOhguxDJ1QrV6OhC5db8kJFF8oKjqt01YV
	cBaRNyoMg9+5JYmUy7z7lFnG0LGJELq1vPVITvCS94evGApPoTzCHUCWAbNNSFAHolZ
	5UA993u+juNji953vl34qFJ0duagYLwJmUsDhUAQ=
Message-ID: <6d36dacc-a5ae-460d-806c-55e1365b9533@apertussolutions.com>
Date: Wed, 11 Dec 2024 09:19:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/15] x86/hyperlaunch: locate dom0 kernel with
 hyperlaunch
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-9-dpsmith@apertussolutions.com>
 <eb6812c4-fde1-408c-87eb-138a6d5f981c@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <eb6812c4-fde1-408c-87eb-138a6d5f981c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 11/25/24 17:54, Jason Andryuk wrote:
> On 2024-11-23 13:20, Daniel P. Smith wrote:
>> Look for a subnode of type `multiboot,kernel` within a domain node. If 
>> found,
>> process the reg property for the MB1 module index. If the bootargs 
>> property is
>> present and there was not an MB1 string, then use the command line 
>> from the
>> device tree definition.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
>> diff --git a/xen/arch/x86/domain_builder/core.c b/xen/arch/x86/ 
>> domain_builder/core.c
>> index a80f3711c306..9335f3a9ebef 100644
>> --- a/xen/arch/x86/domain_builder/core.c
>> +++ b/xen/arch/x86/domain_builder/core.c
>> @@ -56,6 +56,18 @@ void __init builder_init(struct boot_info *bi)
>>           printk(XENLOG_INFO "  Number of domains: %d\n", bi- 
>> >nr_domains);
>>       }
>> +    else
>> +    {
>> +        int i;
>> +
>> +        /* Find first unknown boot module to use as Dom0 kernel */
>> +        printk("Falling back to using first boot module as dom0\n");
>> +        i = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
>> +        bi->mods[i].type = BOOTMOD_KERNEL;
>> +        bi->domains[0].kernel = &bi->mods[i];
>> +        bi->nr_domains = 1;
>> +    }
>> +
> 
> extra newline.

ack.

>>   }
>>   /*
>> diff --git a/xen/arch/x86/domain_builder/fdt.c b/xen/arch/x86/ 
>> domain_builder/fdt.c
>> index ff1ba58b6907..6bf1c4a297fe 100644
>> --- a/xen/arch/x86/domain_builder/fdt.c
>> +++ b/xen/arch/x86/domain_builder/fdt.c
> 
>> +static int __init process_domain_node(
>> +    struct boot_info *bi, void *fdt, int dom_node)
>> +{
>> +    int node;
>> +    struct boot_domain *bd = &bi->domains[bi->nr_domains];
>> +    const char *name = fdt_get_name(fdt, dom_node, NULL);
> 
> const char *name = fdt_get_name(fdt, dom_node, NULL) ?: "unknown";
> 
> to avoid...

Sure.

>> +    int address_size = fdt_address_cells(fdt, dom_node);
>> +    int size_size = fdt_size_cells(fdt, dom_node);
>> +
>> +    if ( address_size < 0 || size_size < 0 )
>> +    {
>> +        printk("  failed processing #address or #size for domain %s)\n",
>> +               name == NULL ? "unknown" : name);
> 
> ...all this duplication in the following patches.
> 
>> +        return -EINVAL;
>> +    }
>> +
>> +    fdt_for_each_subnode(node, fdt, dom_node)
>> +    {
>> +        if ( fdt_node_check_compatible(fdt, node, "multiboot,kernel") 
>> == 0 )
> 
> I thought you were going to use "module,kernel" and "module,index" as 
> u32s for multiboot2?

Per our discussion, I will update appropriately.

v/r,
dps



