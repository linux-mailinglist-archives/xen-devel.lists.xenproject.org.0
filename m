Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDFD9BFB24
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 02:07:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831485.1246804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8qzL-0001sD-3V; Thu, 07 Nov 2024 01:07:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831485.1246804; Thu, 07 Nov 2024 01:07:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8qzK-0001oc-VR; Thu, 07 Nov 2024 01:07:06 +0000
Received: by outflank-mailman (input) for mailman id 831485;
 Thu, 07 Nov 2024 01:07:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9PMW=SC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t8qzJ-0001oW-Ik
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 01:07:05 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97b8916e-9ca4-11ef-a0c6-8be0dac302b0;
 Thu, 07 Nov 2024 02:07:02 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1730941616407266.6232332402303;
 Wed, 6 Nov 2024 17:06:56 -0800 (PST)
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
X-Inumbo-ID: 97b8916e-9ca4-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijk3Yjg5MTZlLTljYTQtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTQxNjIyLjU0ODU5Miwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1730941618; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=U7HgF1CT2o83+FmkGSj0s2Q6h0xDrPwfaJy3jHRMolVIjDbdugEkMoIyzYgJru8Ifb7PGMWGAi4Ywd5zz+b2jmrVWHAOQrzZy4gSFN/sYS2QI0QnU1ajVp1m4GgUzz71bJjBrTMW0jVN+p/drhSkMOHAED6pgB7yMZXxAkeXc38=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730941618; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Dbk+5d/FlhMxRV1tnu5hGilEWvSzCcp3K/5SzS8X99s=; 
	b=mlCZ/8Mc9HQgyH2EogIu8excdjxBm+/bC2XgsIDFaieYz8ok/rDpxa13NUzxthHDAInoFJLYL+JruXzHHBei95T112kdbxloVcB65wx1KITihV4we3TMTBFpc4Zar5aD4dfb4XWut69DrEM1BTrzvJ9ag+u1xaAG3Gmn+6Ue+Y4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730941618;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Dbk+5d/FlhMxRV1tnu5hGilEWvSzCcp3K/5SzS8X99s=;
	b=UBoK5OsUZFrJD8fiGeZdkU8IMm2UVVEOqwVpcpGJ97VnL3s+RsSsgB53kRHdem27
	NRkaAmm+qgJHdOLmY18Mz2g6ttFR17UQC2LWgCRI1ZsPOMK+NgrPp82vFnI+652LPUF
	TUQRsQFBO00c8hBlC/tA1deWtTEAyMeq7mCcyrK0=
Message-ID: <cac68929-62cd-4c27-875b-bf1cb2e1e766@apertussolutions.com>
Date: Wed, 6 Nov 2024 20:06:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/12] x86/boot: convert domain construction to use boot
 info
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
 <20241102172551.17233-9-dpsmith@apertussolutions.com>
 <990c8955-ae4a-449f-a40c-7c15faf61154@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <990c8955-ae4a-449f-a40c-7c15faf61154@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 11/6/24 18:06, Jason Andryuk wrote:
> On 2024-11-02 13:25, Daniel P. Smith wrote:
>> With all the components used to construct dom0 encapsulated in struct 
>> boot_info
>> and struct boot_module, it is no longer necessary to pass all them as
>> parameters down the domain construction call chain. Change the 
>> parameter list
>> to pass the struct boot_info instance and the struct domain reference.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>> Changes since v5:
>> - renamed from "x86/boot: convert create_dom0 to use boot info"
>>
>> Changes since v5:
>> - change headroom back to unsigned long
>> - make mod_idx unsigned int
>> ---
>>   xen/arch/x86/dom0_build.c             |  9 ++--
>>   xen/arch/x86/hvm/dom0_build.c         | 49 +++++++++++++---------
>>   xen/arch/x86/include/asm/dom0_build.h | 13 ++----
>>   xen/arch/x86/include/asm/setup.h      |  7 ++--
>>   xen/arch/x86/pv/dom0_build.c          | 59 ++++++++++++++++-----------
>>   xen/arch/x86/setup.c                  | 33 ++++++++-------
>>   6 files changed, 95 insertions(+), 75 deletions(-)
>>
> 
>> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/ 
>> dom0_build.c
>> index a4ac262db463..cd97f94a168a 100644
>> --- a/xen/arch/x86/hvm/dom0_build.c
>> +++ b/xen/arch/x86/hvm/dom0_build.c
> 
>> @@ -1301,16 +1302,25 @@ static void __hwdom_init 
>> pvh_setup_mmcfg(struct domain *d)
>>       }
>>   }
>> -int __init dom0_construct_pvh(struct domain *d, const module_t *image,
>> -                              unsigned long image_headroom,
>> -                              module_t *initrd,
>> -                              const char *cmdline)
>> +int __init dom0_construct_pvh(struct boot_info *bi, struct domain *d)
>>   {
>>       paddr_t entry, start_info;
>> +    struct boot_module *image;
>> +    struct boot_module *initrd = NULL;
>>       int rc;
>>       printk(XENLOG_INFO "*** Building a PVH Dom%d ***\n", d->domain_id);
>> +    rc = first_boot_module_index(bi, BOOTMOD_KERNEL);
>> +    if ( unlikely(rc < 0 || rc > bi->nr_modules) )
> 
> Here and ...
> 
>> +        panic("Missing kernel boot module for %pd construction\n", d);
>> +
>> +    image = &bi->mods[rc];
>> +
>> +    rc = first_boot_module_index(bi, BOOTMOD_RAMDISK);
>> +    if ( rc > 0 || rc < bi->nr_modules )
> 
> ... here.  Can we just check rc < bi->nr_modules for validity?  Valid 
> modules are 0...nr_modules and not found is MAX_NR_BOOTMODS + 1.  It 
> eliminates these unecessary double checks.  This would apply to 04/12 
> "x86/boot: introduce module release" as well.

Please see my response to Andy's response.


>> @@ -613,7 +630,7 @@ static int __init dom0_construct(struct domain *d,
>>           initrd_pfn = vinitrd_start ?
>>                        (vinitrd_start - v_start) >> PAGE_SHIFT :
>>                        domain_tot_pages(d);
>> -        initrd_mfn = mfn = initrd->mod_start;
>> +        initrd_mfn = mfn = initrd->mod->mod_start;
> 
> MISRA doesn't like these assignment chains?

Ugh, correct. Regression, not sure why, from previous review.

>>           count = PFN_UP(initrd_len);
>>           if ( d->arch.physaddr_bitsize &&
>>                ((mfn + count - 1) >> (d->arch.physaddr_bitsize - 
>> PAGE_SHIFT)) )
>> @@ -628,17 +645,17 @@ static int __init dom0_construct(struct domain *d,
>>                       free_domheap_pages(page, order);
>>                       page += 1UL << order;
>>                   }
>> -            memcpy(page_to_virt(page), mfn_to_virt(initrd->mod_start),
>> +            memcpy(page_to_virt(page), mfn_to_virt(initrd->mod- 
>> >mod_start),
>>                      initrd_len);
>> -            release_module(initrd, true);
>> -            initrd->mod_start = initrd_mfn = mfn_x(page_to_mfn(page));
>> +            release_boot_module(initrd, true);
>> +            initrd->mod->mod_start = initrd_mfn = 
>> mfn_x(page_to_mfn(page));
> 
> Assignment chain here.

Ack.

v/r,
dps

