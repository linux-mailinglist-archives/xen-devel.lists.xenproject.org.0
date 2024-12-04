Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1099E4007
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2024 17:46:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848661.1263494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIsVR-00083U-Vb; Wed, 04 Dec 2024 16:45:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848661.1263494; Wed, 04 Dec 2024 16:45:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIsVR-00080x-Sx; Wed, 04 Dec 2024 16:45:41 +0000
Received: by outflank-mailman (input) for mailman id 848661;
 Wed, 04 Dec 2024 16:45:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fO+b=S5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tIsVQ-00080r-Nz
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2024 16:45:40 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3089a7f7-b25f-11ef-a0d4-8be0dac302b0;
 Wed, 04 Dec 2024 17:45:39 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1733330728970124.90999914480108;
 Wed, 4 Dec 2024 08:45:28 -0800 (PST)
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
X-Inumbo-ID: 3089a7f7-b25f-11ef-a0d4-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1733330731; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ih+JLt6WwtUUKccZlxJU04kb/xN7CF5dfbXvs0P4dsb3QzWKL7eO0/947oFTK49Gf2MREapois0FJm17G5/u4TVtd4CVPd7cwlWX/cAVpQy6AHOupvv4e0CLIjeSseXdHKrwxJq1COXJfjWpZBm5/ci2GhWgOtP/n8mQuWOElx0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733330731; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+3MltfeL075nxvUxpT+/pW7oy/jG3RGsnr1IUjpw0R0=; 
	b=IQ0n7DiQXlEClq4F0ZHGFZEUSQSG/xcI20icf0H0lO92YzRu2csfrZfhxWogT2MfsH0H/la+Ux3Qs+ILMtcvl3xZtFO0f3spw5MvqXup+x8Dy4TjOe0wA2SBsge2gWu0C6J0+wP88VQ58uFhJaYVWMKYwLLCpNyRFzh70EC4tQQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733330731;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=+3MltfeL075nxvUxpT+/pW7oy/jG3RGsnr1IUjpw0R0=;
	b=PT6PpZrkBJe7SaMbLy+f+ctgJfS8frR5eK30lWXWMC3O7EhFSlCIZdfVMIIHlpX/
	1GyaI5szVFxnRPHAUD+ruAktYdFWI3pM6IbpgxvSjUpthvy4kE/yWbKmh4cBATGAx5y
	O24f4dskllhznSpFQ1fluESXWrDkU7kV9NrljMEE=
Message-ID: <83e3b0a9-e0e6-4d36-a3ce-4687b1886733@apertussolutions.com>
Date: Wed, 4 Dec 2024 11:45:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/6] x86/boot: introduce domid field to struct
 boot_domain
To: Jan Beulich <jbeulich@suse.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241115131204.32135-1-dpsmith@apertussolutions.com>
 <20241115131204.32135-6-dpsmith@apertussolutions.com>
 <bfbd15eb-9888-4988-b9a1-8191a696a4c2@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <bfbd15eb-9888-4988-b9a1-8191a696a4c2@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 11/27/24 05:32, Jan Beulich wrote:
> On 15.11.2024 14:12, Daniel P. Smith wrote:
>> Add a domid field to struct boot_domain to hold the assigned domain id for the
>> domain. During initialization, ensure all instances of struct boot_domain have
>> the invalid domid to ensure that the domid must be set either by convention or
>> configuration.
> 
> I'm missing the "why" part here - after all ...

Which is part of why I rolled these over into the dom0 device tree 
series, as it will provide more context to its purpose. This field is 
used to store the value parsed in from the device tree. In dom0 device 
tree series, this commit could be merged with the commit that introduces 
the device tree parsing for domid to provide better context for the 
introduction of the structure element.

>> --- a/xen/arch/x86/include/asm/bootdomain.h
>> +++ b/xen/arch/x86/include/asm/bootdomain.h
>> @@ -12,6 +12,8 @@ struct boot_module;
>>   struct domain;
>>   
>>   struct boot_domain {
>> +    domid_t domid;
>> +
>>       struct boot_module *kernel;
>>       struct boot_module *ramdisk;
>>   
> 
> ... just out of context here there is struct domain *. I can only guess that
> the domain ID is needed for the time until the domain pointer was actually
> filled.

Correct, thus why it makes more sense to merge with the domid device 
tree parsing.

>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -339,6 +339,9 @@ static struct boot_info *__init multiboot_fill_boot_info(
>>       /* Variable 'i' should be one entry past the last module. */
>>       bi->mods[i].type = BOOTMOD_XEN;
>>   
>> +    for ( i = 0; i < MAX_NR_BOOTDOMS; i++ )
>> +        bi->domains[i].domid = DOMID_INVALID;
> 
> Generally I think ARRAY_SIZE() is better to use for loop boundaries. Yet
> then - why don't you statically initialize the array in xen_boot_info?

I indifferent with ARRAY_SIZE(), I will try and keep that in mind for 
future parts of the series. As for static init'ing, good point since we 
are already doing it with other fields, I can add this to it.

>> @@ -977,7 +980,6 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>>       };
>>       struct boot_domain *bd = &bi->domains[0];
>>       struct domain *d;
>> -    domid_t domid;
>>   
>>       if ( opt_dom0_pvh )
>>       {
>> @@ -993,15 +995,15 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>>           dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
>>   
>>       /* Create initial domain.  Not d0 for pvshim. */
>> -    domid = get_initial_domain_id();
>> -    d = domain_create(domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged);
>> +    bd->domid = get_initial_domain_id();
>> +    d = domain_create(bd->domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged);
>>       if ( IS_ERR(d) )
>> -        panic("Error creating d%u: %ld\n", domid, PTR_ERR(d));
>> +        panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
> 
> As to the comment at the top - this change alone certainly doesn't clarify
> the "why".

Agreed.

>>       init_dom0_cpuid_policy(d);
>>   
>>       if ( alloc_dom0_vcpu0(d) == NULL )
>> -        panic("Error creating d%uv0\n", domid);
>> +        panic("Error creating d%uv0\n", bd->domid);
> 
> Imo this would better use d->domain_id. And while touching it, %u would also
> want swapping for %d.

hmm, I was actually considering s/d%u/%pd/ and just pass in d, but was 
certain if there was an explicit reason it wasn't used before. If I am 
going to change it, would %pd not be more desired here?

v/r,
dps

