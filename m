Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6AA9ED1D2
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 17:31:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854999.1268054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLPcX-00074X-N0; Wed, 11 Dec 2024 16:31:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854999.1268054; Wed, 11 Dec 2024 16:31:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLPcX-000728-KT; Wed, 11 Dec 2024 16:31:29 +0000
Received: by outflank-mailman (input) for mailman id 854999;
 Wed, 11 Dec 2024 16:31:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lbUB=TE=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tLPcV-000722-U4
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 16:31:27 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5cb2b010-b7dd-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 17:31:25 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1733934674116550.6665648094927;
 Wed, 11 Dec 2024 08:31:14 -0800 (PST)
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
X-Inumbo-ID: 5cb2b010-b7dd-11ef-a0d5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1733934678; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hI2lXc/6Fpg/yNSiQdrgDkyVg4tJ5U1PVq6wJnc4YfmJ7NiFtgQQ3rJvqFutJo3JTXfzDMV92QG2/nQ2uT7fP670cPI/fApqRRilVNopsvVExpw1/YM6dnKUj4mDVRaX4dv7a3HTqRQIn3J77kDYafF64bO+bzu2DPHU7kC+J5E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733934678; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Olq2bonr4k+ZwG6WegzbYkZheckvZONs+NRQZPix5e8=; 
	b=FVcKkX9/qcp+dvLTP8jrFZFsgRLUlm4PYE/AsoY2NSFdXzvvSWwq/iTL4ZJB73GFSTaLL77sA1RGk/JzFkQxzP6VkrpDmKzKAm+T9G7Ak6rgMwHAOcRjZPYzpIPlxgrDNHsGNUG8svrotalKkiFDNPHZ2sXBkzSyWmkYJ8ZpXuI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733934678;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Olq2bonr4k+ZwG6WegzbYkZheckvZONs+NRQZPix5e8=;
	b=mPZW5Wf+dmFcO+TxaThk4puXLf8ZF/IJ5pIMzfX/EpPizQ84RFRnWo12atklCOS0
	Q5cHVbd4Nvdn0en/r1NwVZPofkaCKt+oiJSmpQtiKEv5YAx5toq4zYnEfNW/jxcZotG
	FOGBlWIdV0nHwhNNIEKTdfbjysfSLtP/2kAK83oE=
Message-ID: <593d78d7-93fd-47a1-86f6-30ef8a9b23d1@apertussolutions.com>
Date: Wed, 11 Dec 2024 11:31:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/15] x86/hyperlaunch: specify dom0 mode with device tree
To: Jan Beulich <jbeulich@suse.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-13-dpsmith@apertussolutions.com>
 <5dc478be-7b8a-4966-8889-d4d40bda8770@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <5dc478be-7b8a-4966-8889-d4d40bda8770@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 12/2/24 07:05, Jan Beulich wrote:
> On 23.11.2024 19:20, Daniel P. Smith wrote:
>> --- a/xen/arch/x86/domain_builder/fdt.c
>> +++ b/xen/arch/x86/domain_builder/fdt.c
>> @@ -141,6 +141,25 @@ static int __init process_domain_node(
>>               bd->domid = (domid_t)val;
>>               printk("  domid: %d\n", bd->domid);
>>           }
>> +        if ( match_fdt_property(fdt, prop, "mode" ) )
>> +        {
>> +            if ( fdt_prop_as_u32(prop, &bd->mode) != 0 )
>> +            {
>> +                printk("  failed processing mode for domain %s\n",
>> +                       name == NULL ? "unknown" : name);
>> +                return -EINVAL;
>> +            }
>> +
>> +            printk("  mode: ");
>> +            if ( !(bd->mode & BUILD_MODE_PARAVIRT) ) {
> 
> Nit: Brace placement.

Ack.

>> +                if ( bd->mode & BUILD_MODE_ENABLE_DM )
>> +                    printk("HVM\n");
>> +                else
>> +                    printk("PVH\n");
>> +            }
>> +            else
>> +                printk("PV\n");
>> +        }
>>       }
>>   
>>       fdt_for_each_subnode(node, fdt, dom_node)
>> --- a/xen/arch/x86/include/asm/bootdomain.h
>> +++ b/xen/arch/x86/include/asm/bootdomain.h
>> @@ -18,6 +18,12 @@ struct boot_domain {
>>   
>>       domid_t domid;
>>   
>> +                                          /* On     | Off    */
>> +#define BUILD_MODE_PARAVIRT      (1 << 0) /* PV     | PVH/HVM */
>> +#define BUILD_MODE_ENABLE_DM     (1 << 1) /* HVM    | PVH     */
>> +#define BUILD_MODE_LONG          (1 << 2) /* 64 BIT | 32 BIT  */
> 
> This last one isn't used anywhere, is it?

Hmm, I may have lost this when AMD asked for PVH to be done this cycle. 
It should still be used to allow for 32bit PV dom0, will get this added in.

>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1006,7 +1006,8 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>>       struct boot_domain *bd = &bi->domains[0];
>>       struct domain *d;
>>   
>> -    if ( opt_dom0_pvh )
>> +    if ( opt_dom0_pvh ||
>> +         (bi->hyperlaunch_enabled && !(bd->mode & BUILD_MODE_PARAVIRT)) )
>>       {
>>           dom0_cfg.flags |= (XEN_DOMCTL_CDF_hvm |
>>                              ((hvm_hap_supported() && !opt_dom0_shadow) ?
> 
> What about BUILD_MODE_ENABLE_DM?

Good point, a goal for HL was to enable building and booting with 
separate hwdom and ctldom.

v/r,
dps


