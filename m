Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEEA678BD2
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 00:10:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483338.749455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK5wv-0005cY-1k; Mon, 23 Jan 2023 23:10:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483338.749455; Mon, 23 Jan 2023 23:10:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK5wu-0005aq-Uh; Mon, 23 Jan 2023 23:10:00 +0000
Received: by outflank-mailman (input) for mailman id 483338;
 Mon, 23 Jan 2023 23:09:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pK5wt-0005Zo-Qo
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 23:09:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pK5ws-0006eN-KM; Mon, 23 Jan 2023 23:09:58 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pK5ws-0003Jp-E7; Mon, 23 Jan 2023 23:09:58 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=m30gMGbz86vHEQc32Ld/PoTqe7JIgGIPRBgxZGLecmU=; b=GvSjpHXojRJSWNHnVgAn/56D8a
	8w2poN6/O0Bhk6qhN/6rF0tqLE08gi6kmBJFy6SV6jhe8O7Bbuex0JzTo0Pp8pF7stEFCb6OUEQWU
	dqUzWNV4UOWDKDsh2QUEUAuYIfhm1Vhf+oLzpQWz5cKFhsuzctkPp3yopDaVdtz/jNBk=;
Message-ID: <92c4daa2-d841-3109-c1ec-4bdb088d6670@xen.org>
Date: Mon, 23 Jan 2023 23:09:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 22/22] xen/arm64: Allow the admin to enable/disable the
 directmap
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-23-julien@xen.org>
 <alpine.DEB.2.22.394.2301231437170.1978264@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2301231437170.1978264@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 23/01/2023 22:52, Stefano Stabellini wrote:
> On Fri, 16 Dec 2022, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Implement the same command line option as x86 to enable/disable the
>> directmap. By default this is kept enabled.
>>
>> Also modify setup_directmap_mappings() to populate the L0 entries
>> related to the directmap area.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> ----
>>      This patch is in an RFC state we need to decide what to do for arm32.
>>
>>      Also, this is moving code that was introduced in this series. So
>>      this will need to be fix in the next version (assuming Arm64 will
>>      be ready).
>>
>>      This was sent early as PoC to enable secret-free hypervisor
>>      on Arm64.
>> ---
>>   docs/misc/xen-command-line.pandoc   |  2 +-
>>   xen/arch/arm/include/asm/arm64/mm.h |  2 +-
>>   xen/arch/arm/include/asm/mm.h       | 12 +++++----
>>   xen/arch/arm/mm.c                   | 40 +++++++++++++++++++++++++++--
>>   xen/arch/arm/setup.c                |  1 +
>>   5 files changed, 48 insertions(+), 9 deletions(-)
>>
>> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
>> index a63e4612acac..948035286acc 100644
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -760,7 +760,7 @@ Specify the size of the console debug trace buffer. By specifying `cpu:`
>>   additionally a trace buffer of the specified size is allocated per cpu.
>>   The debug trace feature is only enabled in debugging builds of Xen.
>>   
>> -### directmap (x86)
>> +### directmap (arm64, x86)
>>   > `= <boolean>`
>>   
>>   > Default: `true`
>> diff --git a/xen/arch/arm/include/asm/arm64/mm.h b/xen/arch/arm/include/asm/arm64/mm.h
>> index aa2adac63189..8b5dcb091750 100644
>> --- a/xen/arch/arm/include/asm/arm64/mm.h
>> +++ b/xen/arch/arm/include/asm/arm64/mm.h
>> @@ -7,7 +7,7 @@
>>    */
>>   static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
>>   {
>> -    return true;
>> +    return opt_directmap;
>>   }
>>   
>>   #endif /* __ARM_ARM64_MM_H__ */
>> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
>> index d73abf1bf763..ef9ad3b366e3 100644
>> --- a/xen/arch/arm/include/asm/mm.h
>> +++ b/xen/arch/arm/include/asm/mm.h
>> @@ -9,6 +9,13 @@
>>   #include <public/xen.h>
>>   #include <xen/pdx.h>
>>   
>> +extern bool opt_directmap;
>> +
>> +static inline bool arch_has_directmap(void)
>> +{
>> +    return opt_directmap;
>> +}
>> +
>>   #if defined(CONFIG_ARM_32)
>>   # include <asm/arm32/mm.h>
>>   #elif defined(CONFIG_ARM_64)
>> @@ -411,11 +418,6 @@ static inline void page_set_xenheap_gfn(struct page_info *p, gfn_t gfn)
>>       } while ( (y = cmpxchg(&p->u.inuse.type_info, x, nx)) != x );
>>   }
>>   
>> -static inline bool arch_has_directmap(void)
>> -{
>> -    return true;
>> -}
>> -
>>   /* Helpers to allocate, map and unmap a Xen page-table */
>>   int create_xen_table(lpae_t *entry);
>>   lpae_t *xen_map_table(mfn_t mfn);
>> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>> index f5fb957554a5..925d81c450e8 100644
>> --- a/xen/arch/arm/mm.c
>> +++ b/xen/arch/arm/mm.c
>> @@ -15,6 +15,7 @@
>>   #include <xen/init.h>
>>   #include <xen/libfdt/libfdt.h>
>>   #include <xen/mm.h>
>> +#include <xen/param.h>
>>   #include <xen/pfn.h>
>>   #include <xen/pmap.h>
>>   #include <xen/sched.h>
>> @@ -131,6 +132,12 @@ vaddr_t directmap_virt_start __read_mostly;
>>   unsigned long directmap_base_pdx __read_mostly;
>>   #endif
>>   
>> +bool __ro_after_init opt_directmap = true;
>> +/* TODO: Decide what to do for arm32. */
>> +#ifdef CONFIG_ARM_64
>> +boolean_param("directmap", opt_directmap);
>> +#endif
>> +
>>   unsigned long frametable_base_pdx __read_mostly;
>>   unsigned long frametable_virt_end __read_mostly;
>>   
>> @@ -606,16 +613,27 @@ void __init setup_directmap_mappings(unsigned long base_mfn,
>>       directmap_virt_end = XENHEAP_VIRT_START + nr_mfns * PAGE_SIZE;
>>   }
>>   #else /* CONFIG_ARM_64 */
>> -/* Map the region in the directmap area. */
>> +/*
>> + * This either populate a valid fdirect map, or allocates empty L1 tables
> 
> fdirect/direct
> 
> 
>> + * and creates the L0 entries for the given region in the direct map
>> + * depending on arch_has_directmap().
>> + *
>> + * When directmap=no, we still need to populate empty L1 tables in the
>> + * directmap region. The reason is that the root page-table (i.e. L0)
>> + * is per-CPU and secondary CPUs will initialize their root page-table
>> + * based on the pCPU0 one. So L0 entries will be shared if they are
>> + * pre-populated. We also rely on the fact that L1 tables are never
>> + * freed.
> 
> You are saying that in case of directmap=no we are still creating empty
> L1 tables and L0 entries because secondary CPUs will need them when they
> initialize their root pagetables.
> 
> But why? Secondary CPUs will not be using the directmap either? Why do
> seconday CPUs need the empty L1 tables?

 From the cover letter,

"
The subject is probably a misnomer. The directmap is still present but
the RAM is not mapped by default. Instead, the region will still be used
to map pages allocate via alloc_xenheap_pages().

The advantage is the solution is simple (so IHMO good enough for been
merged as a tech preview). The disadvantage is the page allocator is not
trying to keep all the xenheap pages together. So we may end up to have
an increase of page table usage.

In the longer term, we should consider to remove the direct map
completely and switch to vmap(). The main problem with this approach
is it is frequent to use mfn_to_virt() in the code. So we would need
to cache the mapping (maybe in the struct page_info).
"

I can add summary in the commit message.

Cheers,

-- 
Julien Grall

