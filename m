Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F279CF299
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 18:16:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837926.1253842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBzvb-0004rz-Sy; Fri, 15 Nov 2024 17:16:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837926.1253842; Fri, 15 Nov 2024 17:16:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBzvb-0004qV-Pl; Fri, 15 Nov 2024 17:16:15 +0000
Received: by outflank-mailman (input) for mailman id 837926;
 Fri, 15 Nov 2024 17:16:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=54cC=SK=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tBzva-0004qK-A7
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 17:16:14 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e291299-a375-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 18:16:10 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1731690963219973.3767882444106;
 Fri, 15 Nov 2024 09:16:03 -0800 (PST)
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
X-Inumbo-ID: 4e291299-a375-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6IjRlMjkxMjk5LWEzNzUtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjkwOTcxLjAyNjI5NCwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1731690965; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EACVwoOOopQ76kVL/fSNKTo8yabb0NLNmEqHXvSe8qWPt3fKyEHjjHY/1DBASmlUiy7If5aDZ0lmzTZLl44tnIzwewJQ+PSWIdu4efiJiW0hf7p+7/TTcdDUrPQmCUfN1vtRkYsnu5uv2X6lozBQQqfRHpNneL7Ez8kUzUEtgME=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1731690965; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qbUVhWFYzl5YVjRa9lwYSVegewF6XUziWfyz3WPfjcY=; 
	b=TDGqPmGC5TuMe0pJt2/xlLvrFLClgQbKpeZNMMwKfsEMb4O/xvD/tn5H6wK0vk2Cf/6+XBbpHv6US4x1eAY5Z5LCcXSj+i2eiZbXzKL13U31nX96N2qoaJiw47m6ETKPF/8mTIuMHkIpYJdgWlMOcIsoLocEN++jsYl7ICvUksA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1731690965;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=qbUVhWFYzl5YVjRa9lwYSVegewF6XUziWfyz3WPfjcY=;
	b=cJbHIXErM3shvUuMOE1IMSR6IKcuzLB0rk/fOOdVdCi55XUQ0UwZ6XAmGMLkv755
	Clohmoyc8aK85j1k2BlLt/UkcYHgJfHLMnABe+jx3R3KMphAjoKpexinZmvGHqcMUph
	m1Ov5HSHT95bdrgnjHTWYqHDeQP9PdZr7eYVfBIE=
Message-ID: <3f61cc43-c29a-40e0-ac40-4f273fd4461e@apertussolutions.com>
Date: Fri, 15 Nov 2024 12:16:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/6] x86/boot: introduce module release
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241115131204.32135-1-dpsmith@apertussolutions.com>
 <20241115131204.32135-3-dpsmith@apertussolutions.com>
 <374d2387-6f8c-4a2b-a979-7066675dd247@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <374d2387-6f8c-4a2b-a979-7066675dd247@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 11/15/24 11:50, Jason Andryuk wrote:
> On 2024-11-15 08:12, Daniel P. Smith wrote:
>> A precarious approach was used to release the pages used to hold a 
>> boot module.
>> The precariousness stemmed from the fact that in the case of PV dom0, the
>> initrd module pages may be either mapped or copied into the dom0 
>> address space.
>> In the former case, the PV dom0 construction code will set the size of 
>> the
>> module to zero, relying on discard_initial_images() to skip any 
>> modules with a
>> size of zero. In the latter case, the pages are freed by the PV dom0
>> construction code. This freeing of pages is done so that in either 
>> case, the
>> initrd variable can be reused for tracking the initrd location in dom0 
>> memory
>> through the remaining dom0 construction code.
>>
>> To encapsulate the logical action of releasing a boot module, the 
>> function
>> release_boot_module() is introduced along with the `released` flag 
>> added to
>> boot module. The boot module flag `released` allows the tracking of 
>> when a boot
>> module has been released by release_boot_module().
>>
>> As part of adopting release_boot_module() the function 
>> discard_initial_images()
>> is renamed to free_boot_modules(), a name that better reflects the 
>> functions
>> actions.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>> Changes since v8:
>> - completely reworked the commit
>>    - switch backed to a releasing all but pv initrd approach
>>    - renamed discard_initial_images to free_boot_modules
>> ---
>>   xen/arch/x86/hvm/dom0_build.c       |  2 +-
>>   xen/arch/x86/include/asm/bootinfo.h |  2 ++
>>   xen/arch/x86/include/asm/setup.h    |  4 +++-
>>   xen/arch/x86/pv/dom0_build.c        | 27 +++++++++++++--------------
>>   xen/arch/x86/setup.c                | 27 +++++++++++++++------------
>>   5 files changed, 34 insertions(+), 28 deletions(-)
>>
>> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/ 
>> dom0_build.c
>> index d1bdf1b14601..d1410e1a02b0 100644
>> --- a/xen/arch/x86/hvm/dom0_build.c
>> +++ b/xen/arch/x86/hvm/dom0_build.c
>> @@ -755,7 +755,7 @@ static int __init pvh_load_kernel(
>>       }
>>       /* Free temporary buffers. */
>> -    discard_initial_images();
>> +    free_boot_modules();
> 
> This...
> 
>>       if ( cmdline != NULL )
>>       {
> 
>> diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
>> index 6be3d7745fab..2580162f3df4 100644
>> --- a/xen/arch/x86/pv/dom0_build.c
>> +++ b/xen/arch/x86/pv/dom0_build.c
> 
>> @@ -875,7 +874,7 @@ static int __init dom0_construct(struct boot_info 
>> *bi, struct domain *d)
>>       }
>>       /* Free temporary buffers. */
>> -    discard_initial_images();
>> +    free_boot_modules();
> 
> ...and this.  I think Andrew requested/suggested moving to a single 
> free_boot_modules call:
>      They're both right at the end of construction, so it would
>      make far more sense for __start_xen() to do this after
>      create_dom0().   That also avoids needing to export the function.

I wanted to do this and had it written this way. Then I started testing 
it and the pvhshim test failed due to not enough ram to build the domU 
inside pvshim. I started splitting this commit to see where it broke the 
test case, and for an unknown reason, replacing these two calls with a 
single call in __start_xen() just after create_dom0() is the cause. 
Instead of trying to tear apart the construction logic to determine why, 
I backed this part of the change out for the time being.

>>       /* Set up start info area. */
>>       si = (start_info_t *)vstartinfo_start;
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index 495e90a7e132..0bda1326a485 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
> 
>> +void __init free_boot_modules(void)
>>   {
>>       struct boot_info *bi = &xen_boot_info;
>>       unsigned int i;
>>       for ( i = 0; i < bi->nr_modules; ++i )
>>       {
>> -        uint64_t start = pfn_to_paddr(bi->mods[i].mod->mod_start);
>> -        uint64_t size  = bi->mods[i].mod->mod_end;
>> -
>> -        /*
>> -         * Sometimes the initrd is mapped, rather than copied, into 
>> dom0.
>> -         * Size being 0 is how we're instructed to leave the module 
>> alone.
>> -         */
>> -        if ( size == 0 )
>> +        if ( bi->mods[i].released )
>>               continue;
>> -        init_domheap_pages(start, start + PAGE_ALIGN(size));
>> +        release_boot_module(&bi->mods[i]);
>>       }
>> -
>> -    bi->nr_modules = 0;
> 
> IIUC, zero-ing here was a safety feature to ensure boot modules could 
> not be used after this point.  Should it be retained?

The released flag displaced the need for this, but I realized it would 
make it stronger if in bootstrap_map_bm() we add a check that the 
released flag is not set before mapping. I think this is a stronger 
approach without loosing information like the number of boot modules 
were passed.

v/r,
dps

