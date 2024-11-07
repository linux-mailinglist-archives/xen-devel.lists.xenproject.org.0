Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FB19BFAE4
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 01:47:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831449.1246754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8qg4-0005VZ-IV; Thu, 07 Nov 2024 00:47:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831449.1246754; Thu, 07 Nov 2024 00:47:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8qg4-0005Sq-FI; Thu, 07 Nov 2024 00:47:12 +0000
Received: by outflank-mailman (input) for mailman id 831449;
 Thu, 07 Nov 2024 00:47:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9PMW=SC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t8qg3-0005Sk-1U
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 00:47:11 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf28f4a2-9ca1-11ef-a0c6-8be0dac302b0;
 Thu, 07 Nov 2024 01:47:06 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1730940418659637.7451190722413;
 Wed, 6 Nov 2024 16:46:58 -0800 (PST)
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
X-Inumbo-ID: cf28f4a2-9ca1-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6ImNmMjhmNGEyLTljYTEtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTQwNDI2LjkwMjExOSwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1730940421; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BIa31vl2lcLCLd/utdfC7veNor/rTPbz9yldV0W+DgCxvTIvnrh2FTri7jTUfpD3HYmnmYDKqQb+oqhwhOa4mp70iX77q3mPtfgi7xc3WoHhNX8DwRPBV05gAGqms15W3UqscWlp3HcWp3myRRCfoUrfGpyXjH0s8YXkWKDevP8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730940421; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Aqqy5SY0lFUYcEMWg53q0eCqBfQW70PNqW77l3utW+U=; 
	b=agMOmDySitLlB3KU/X+gl4h6mtXfkZVbL+YeOl3eR36bPRj967bfIC1bBYZmtH8rW9kabrb652qoSGwRwDnV0+ud928pV7r/hI216YeKL4bIUKUOB2F5da7lBLHtg5rldcIjqvn6hm93ZEaXAnrr5Z98tFTgyRr337P6d+eKC0s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730940421;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Aqqy5SY0lFUYcEMWg53q0eCqBfQW70PNqW77l3utW+U=;
	b=Crw5WwO6dwFyVOaw0aG3XewzUXeOdBhxJAs+vQuJEXEac0EABBR8MIVc2G5INhCC
	3RZDWHxgPEc9bFpptsrmFIpgleFq+jec+CUvE9/r8loLxkjcGz2COVmhj04nCksMFpJ
	1G8GkoG6zeqX4lOZwrIbYLLSKzKWEbtcnZvKpC0o=
Message-ID: <599e55ba-b9d6-4fc9-bf59-ddd95b9a2482@apertussolutions.com>
Date: Wed, 6 Nov 2024 19:46:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] x86/boot: introduce module release
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
 <20241102172551.17233-5-dpsmith@apertussolutions.com>
 <773dbe75-d1d3-41ea-8ff7-c031e0e9a920@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <773dbe75-d1d3-41ea-8ff7-c031e0e9a920@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 11/6/24 17:16, Jason Andryuk wrote:
> On 2024-11-02 13:25, Daniel P. Smith wrote:
>> A precarious approach was used to release the pages used to hold a 
>> boot module.
>> The precariousness stemmed from the fact that in the case of PV dom0, the
>> initrd module pages may be either mapped or explicitly copied into the 
>> dom0
>> address space. So to handle this situation, the PV dom0 construction 
>> code will
>> set the size of the module to zero, relying on 
>> discard_initial_images() to skip
>> any modules with a size of zero.
>>
>> A function is introduced to release a module when it is no longer 
>> needed that
>> accepts a boolean parameter, free_mem, to indicate if the 
>> corresponding pages
>> can be freed. To track that a module has been released, the boot 
>> module flag
>> `released` is introduced.
>>
>> The previous release model was a free all at once except those of size 
>> zeros,
>> which would handle any unused modules passed. The new model is one of, 
>> free
>> consumed module after usage is complete, thus unconsumed modules do 
>> not have a
>> consumer to free them.
> 
> Slightly confusing.  Maybe just "The new model is to free modules after 
> they are consumed.  Thus unconsumed modules are not freed."

okay.

>> To address this, the discard_uknown_boot_modules() is
> 
> "unknown"

Ack

>> introduced and called after the last module identification occurs, 
>> initrd, to
>> free the pages of any boot modules that are identified as not being 
>> released.
>> After domain construction completes, all modules should be freed. A 
>> walk of the
>> boot modules is added after domain construction to validate and notify 
>> if a
>> module is found not to have been released.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>> Changes since v7:
>> - This is a new approach as an alternative to the `consumed` flag.
>> ---
>>   xen/arch/x86/cpu/microcode/core.c   |  4 ++
>>   xen/arch/x86/hvm/dom0_build.c       |  7 ++--
>>   xen/arch/x86/include/asm/bootinfo.h |  2 +
>>   xen/arch/x86/include/asm/setup.h    |  3 +-
>>   xen/arch/x86/pv/dom0_build.c        | 20 ++--------
>>   xen/arch/x86/setup.c                | 57 +++++++++++++++++++++++------
>>   xen/xsm/xsm_core.c                  |  5 +++
>>   7 files changed, 67 insertions(+), 31 deletions(-)
>>
> 
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index d061ece0541f..e6d2d25fd038 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -341,27 +341,55 @@ unsigned long __init 
>> initial_images_nrpages(nodeid_t node)
>>       return nr;
>>   }
>> -void __init discard_initial_images(void) /* a.k.a. Free boot modules */
>> +void __init release_boot_module(struct boot_module *bm, bool free_mem)
>> +{
>> +    uint64_t start = pfn_to_paddr(bm->mod->mod_start);
>> +    uint64_t size  = bm->mod->mod_end;
>> +
>> +    if ( bm->released )
>> +    {
>> +        printk(XENLOG_WARNING "Attempt second release boot module of 
>> type %d\n",
>> +               bm->type);
>> +        return;
>> +    }
>> +
>> +    if ( free_mem )
>> +        init_domheap_pages(start, start + PAGE_ALIGN(size));
>> +
>> +    bm->released = true;
>> +}
>> +
>> +void __init release_module(const module_t *m, bool free_mem)
>>   {
>>       struct boot_info *bi = &xen_boot_info;
>>       unsigned int i;
>> -    for ( i = 0; i < bi->nr_modules; ++i )
>> +    for ( i = 0; i < bi->nr_modules; i++ )
>>       {
>> -        uint64_t start = pfn_to_paddr(bi->mods[i].mod->mod_start);
>> -        uint64_t size  = bi->mods[i].mod->mod_end;
>> +        if ( bi->mods[i].mod == m )
>> +            release_boot_module(&bi->mods[i], free_mem);
>> +    }
>> +}
>> -        /*
>> -         * Sometimes the initrd is mapped, rather than copied, into 
>> dom0.
>> -         * Size being 0 is how we're instructed to leave the module 
>> alone.
>> -         */
>> -        if ( size == 0 )
>> +static void __init discard_unknown_boot_modules(void)
>> +{
>> +    struct boot_info *bi = &xen_boot_info;
>> +    unsigned int i, count = 0;
>> +
>> +    for_each_boot_module_by_type(i, bi, BOOTMOD_UNKNOWN)
> 
> for_each_boot_module_by_type ( i, bi, BOOTMOD_UNKNOWN )
> 
> To match style from 74af2d98276d ("x86/boot: eliminate module_map")

Ack.

>> +    {
>> +        struct boot_module *bm = &bi->mods[i];
>> +
>> +        if ( bm == NULL || bm->released )
>>               continue;
>> -        init_domheap_pages(start, start + PAGE_ALIGN(size));
>> +        release_boot_module(bm, true);
>> +        count++;
>>       }
>> -    bi->nr_modules = 0;
>> +    if ( count )
>> +        printk(XENLOG_DEBUG "Releasing pages for uknown boot module 
>> %d\n",
> 
> "unknown".  Since the operation already happened, maybe "Released pages 
> for %d unknown boot modules"?  I'm not sure of the value of that 
> message.  It would be more informative to provide the module index and 
> maybe a page count.  The index would at least point to which module is 
> unused.

Ack to unknown.

Can adjust the phrasing, the question is there a desire to have a 
message for every boot module freed. Guess I could do a single log line 
split across multiple printks, Thinking about the case where someone 
tried to abuse the interface by loading a bunch of unused modules.

>> +               count);
>>   }
>>   static void __init init_idle_domain(void)
>> @@ -2111,6 +2139,8 @@ void asmlinkage __init noreturn __start_xen(void)
>>                      initrdidx);
>>       }
>> +    discard_unknown_boot_modules();
>> +
>>       /*
>>        * We're going to setup domain0 using the module(s) that we 
>> stashed safely
>>        * above our heap. The second module, if present, is an initrd 
>> ramdisk.
>> @@ -2122,6 +2152,11 @@ void asmlinkage __init noreturn __start_xen(void)
>>       if ( !dom0 )
>>           panic("Could not set up DOM0 guest OS\n");
>> +    /* Check and warn if any modules did not get released */
>> +    for ( i = 0; i < bi->nr_modules; i++ )
>> +        if ( !bi->mods[i].released )
>> +            printk(XENLOG_ERR "Boot module %d not released, memory 
>> leaked", i);
>> +
> 
> Why not release the memory here instead of leaking it?

Because you don't know if it was mapped or consumed.

> I feel like the corner case of mapping the dom0 initrd is leading to 
> this manual approach or releasing modules individually.  That logic then 
> has to be spread around.  discard_initial_images() kept the logic 
> centralized.  Maybe just replace the mod_end == 0 special case with a 
> "don't release me" flag that is checked in discard_initial_images()?

That is what started me at the options to deal with it. The two I came 
up with was a flag and this approach. Weighing the pros/cons of the two, 
the deciding factor is when multi-domain construction is introduced. 
With multi-domain with a large number of domains, a balance has to be 
struck between holding all the kernels and ramdisks in memory plus being 
able to allocate the desired amount of memory for each domain. Perhaps a 
balance can be struck, with a discard_consumed_boot_modules() that walks 
the boot module list, and discard the ones consumed. While only dom0 can 
be constructed, it would be called once after create_dom0 call returns 
(per Andy's suggestion in response to this comment). An expansion on 
this could be that instead of using a free flag, use a ref count that is 
incremented as it is claimed and the decremented when it has been consumed.

v/r,
dps


