Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C24BACAC74
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 12:31:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003154.1382621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM2Rp-0002Gh-Se; Mon, 02 Jun 2025 10:31:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003154.1382621; Mon, 02 Jun 2025 10:31:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM2Rp-0002Do-P1; Mon, 02 Jun 2025 10:31:17 +0000
Received: by outflank-mailman (input) for mailman id 1003154;
 Mon, 02 Jun 2025 10:31:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqnP=YR=arm.com=ryan.roberts@srs-se1.protection.inumbo.net>)
 id 1uM2Ro-0002CR-7w
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 10:31:16 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id b557793c-3f9c-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 12:31:14 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6EAD12FC;
 Mon,  2 Jun 2025 03:30:56 -0700 (PDT)
Received: from [10.57.95.206] (unknown [10.57.95.206])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C8B93F673;
 Mon,  2 Jun 2025 03:31:07 -0700 (PDT)
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
X-Inumbo-ID: b557793c-3f9c-11f0-a300-13f23c93f187
Message-ID: <23bd2cdf-768f-4053-9839-a0613a25de51@arm.com>
Date: Mon, 2 Jun 2025 11:31:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 0/6] Lazy mmu mode fixes and improvements
Content-Language: en-GB
To: Mike Rapoport <rppt@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Juergen Gross <jgross@suse.com>,
 Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 David Hildenbrand <david@redhat.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Alexei Starovoitov <ast@kernel.org>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
 linux-mm@kvack.org, Jann Horn <jannh@google.com>
References: <20250530140446.2387131-1-ryan.roberts@arm.com>
 <5b5d6352-9018-4658-b8fe-6eadaad46881@lucifer.local>
 <af9a96e1-064b-4627-bd34-e7e7e8a05452@arm.com> <aDqz7H-oBo35FRXe@kernel.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <aDqz7H-oBo35FRXe@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/05/2025 08:46, Mike Rapoport wrote:
> Hi Ryan,
> 
> On Fri, May 30, 2025 at 04:55:36PM +0100, Ryan Roberts wrote:
>> On 30/05/2025 15:47, Lorenzo Stoakes wrote:
>>> +cc Jann who is a specialist in all things page table-y and especially scary
>>> edge cases :)
>>>
>>> On Fri, May 30, 2025 at 03:04:38PM +0100, Ryan Roberts wrote:
>>>> Hi All,
>>>>
>>>> I recently added support for lazy mmu mode on arm64. The series is now in
>>>> Linus's tree so should be in v6.16-rc1. But during testing in linux-next we
>>>> found some ugly corners (unexpected nesting). I was able to fix those issues by
>>>> making the arm64 implementation more permissive (like the other arches). But
>>>> this is quite fragile IMHO. So I'd rather fix the root cause and ensure that
>>>> lazy mmu mode never nests, and more importantly, that code never makes pgtable
>>>> modifications expecting them to be immediate, not knowing that it's actually in
>>>> lazy mmu mode so the changes get deferred.
>>>
>>> When you say fragile, are you confident it _works_ but perhaps not quite as well
>>> as you want? Or are you concerned this might be broken upstream in any way?
>>
>> I'm confident that it _works_ for arm64 as it is, upstream. But if Dev's series
>> were to go in _without_ the lazy_mmu bracketting in some manner, then it would
>> be broken if the config includes CONFIG_DEBUG_PAGEALLOC.
>>
>> There's a lot more explanation in the later patches as to how it can be broken,
>> but for arm64, the situation is currently like this, because our implementation
>> of __change_memory_common() uses apply_to_page_range() which implicitly starts
>> an inner lazy_mmu_mode. We enter multiple times, but we exit one the first call
>> to exit. Everything works correctly but it's not optimal because C is no longer
>> deferred:
>>
>> arch_enter_lazy_mmu_mode()                        << outer lazy mmu region
>>   <do some pte changes (A)>
>>   alloc_pages()
>>     debug_pagealloc_map_pages()
>>       __kernel_map_pages()
>>         __change_memory_common()
>>           arch_enter_lazy_mmu_mode()              << inner lazy mmu region
>>             <change kernel pte to make valid (B)>
>>           arch_leave_lazy_mmu_mode()              << exit; complete A + B
>>     clear_page()
>>   <do some more pte changes (C)>                  << no longer in lazy mode
>> arch_leave_lazy_mmu_mode()                        << nop
>>
>> An alternative implementation would not add the nested lazy mmu mode, so we end
>> up with this:
>>
>> arch_enter_lazy_mmu_mode()                        << outer lazy mmu region
>>   <do some pte changes (A)>
>>   alloc_pages()
>>     debug_pagealloc_map_pages()
>>       __kernel_map_pages()
>>         __change_memory_common()
>>             <change kernel pte to make valid (B)> << deferred due to lazy mmu
>>     clear_page()                                  << BANG! B has not be actioned
>>   <do some more pte changes (C)>
>> arch_leave_lazy_mmu_mode()
>>
>> This is clearly a much worse outcome. It's not happening today but it could in
>> future. That's why I'm claiming it's fragile. It's much better (IMHO) to
>> disallow calling the page allocator when in lazy mmu mode.
> 
> First, I think it should be handled completely inside arch/arm64. Page
> allocation worked on lazy mmu mode on other architectures, no reason it
> should be changed because of the way arm64 implements lazy mmu.
> 
> Second, DEBUG_PAGEALLOC already implies that performance is bad, for it to
> be useful the kernel should be mapped with base pages and there's map/unmap
> for every page allocation so optimizing a few pte changes (C in your
> example) won't matter much.
> 
> If there's a potential correctness issue with Dev's patches, it should be
> dealt with as a part of those patches with the necessary updates of how
> lazy mmu is implemented on arm64 and used in pageattr.c.
> 
> And it seems to me that adding something along the lines below to
> __kernel_map_pages() would solve DEBUG_PAGEALLOC issue:
> 
> void __kernel_map_pages(struct page *page, int numpages, int enable)
> {
> 	unsigned long flags;
> 	bool lazy_mmu = false;
> 
> 	if (!can_set_direct_map())
> 		return;
> 
> 	flags = read_thread_flags();
> 	if (flags & BIT(TIF_LAZY_MMU))
> 		lazy_mmu = true;
> 
> 	set_memory_valid((unsigned long)page_address(page), numpages, enable);
> 
> 	if (lazy_mmu)
> 		set_thread_flag(TIF_LAZY_MMU);
> }

Hi Mike,

I've thought about this for a bit, and concluded that you are totally right.
This is a much smaller, arm64-contained patch. Sorry for the noise here, and
thanks for the suggestion.

Thanks,
Ryan


> 
>> Thanks,
>> Ryan
> 


