Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC42DC06312
	for <lists+xen-devel@lfdr.de>; Fri, 24 Oct 2025 14:14:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1150109.1481371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCGg2-0006DR-Od; Fri, 24 Oct 2025 12:13:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1150109.1481371; Fri, 24 Oct 2025 12:13:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCGg2-0006BI-Li; Fri, 24 Oct 2025 12:13:50 +0000
Received: by outflank-mailman (input) for mailman id 1150109;
 Fri, 24 Oct 2025 12:13:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rNzd=5B=arm.com=kevin.brodsky@srs-se1.protection.inumbo.net>)
 id 1vCGg1-0006BC-7B
 for xen-devel@lists.xenproject.org; Fri, 24 Oct 2025 12:13:49 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id e43b3c96-b0d2-11f0-9d16-b5c5bf9af7f9;
 Fri, 24 Oct 2025 14:13:47 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5EA231515;
 Fri, 24 Oct 2025 05:13:38 -0700 (PDT)
Received: from [10.44.160.74] (e126510-lin.lund.arm.com [10.44.160.74])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C2833F66E;
 Fri, 24 Oct 2025 05:13:38 -0700 (PDT)
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
X-Inumbo-ID: e43b3c96-b0d2-11f0-9d16-b5c5bf9af7f9
Message-ID: <390e41ae-4b66-40c1-935f-7a1794ba0b71@arm.com>
Date: Fri, 24 Oct 2025 14:13:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/13] mm: introduce generic lazy_mmu helpers
To: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
 <20251015082727.2395128-7-kevin.brodsky@arm.com>
 <73b274b7-f419-4e2e-8620-d557bac30dc2@redhat.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <73b274b7-f419-4e2e-8620-d557bac30dc2@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/10/2025 21:52, David Hildenbrand wrote:
> On 15.10.25 10:27, Kevin Brodsky wrote:
>> [...]
>>
>> * madvise_*_pte_range() call arch_leave() in multiple paths, some
>>    followed by an immediate exit/rescheduling and some followed by a
>>    conditional exit. These functions assume that they are called
>>    with lazy MMU disabled and we cannot simply use pause()/resume()
>>    to address that. This patch leaves the situation unchanged by
>>    calling enable()/disable() in all cases.
>
> I'm confused, the function simply does
>
> (a) enables lazy mmu
> (b) does something on the page table
> (c) disables lazy mmu
> (d) does something expensive (split folio -> take sleepable locks,
>     flushes tlb)
> (e) go to (a)

That step is conditional: we exit right away if pte_offset_map_lock()
fails. The fundamental issue is that pause() must always be matched with
resume(), but as those functions look today there is no situation where
a pause() would always be matched with a resume().

Alternatively it should be possible to pause(), unconditionally resume()
after the expensive operations are done and then leave() right away in
case of failure. It requires restructuring and might look a bit strange,
but can be done if you think it's justified.

>
> Why would we use enable/disable instead?
>
>>
>> * x86/Xen is currently the only case where explicit handling is
>>    required for lazy MMU when context-switching. This is purely an
>>    implementation detail and using the generic lazy_mmu_mode_*
>>    functions would cause trouble when nesting support is introduced,
>>    because the generic functions must be called from the current task.
>>    For that reason we still use arch_leave() and arch_enter() there.
>
> How does this interact with patch #11? 

It is a requirement for patch 11, in fact. If we called disable() when
switching out a task, then lazy_mmu_state.enabled would (most likely) be
false when scheduling it again.

By calling the arch_* helpers when context-switching, we ensure
lazy_mmu_state remains unchanged. This is consistent with what happens
on all other architectures (which don't do anything about lazy_mmu when
context-switching). lazy_mmu_state is the lazy MMU status *when the task
is scheduled*, and should be preserved on a context-switch.

>
>>
>> Note: x86 calls arch_flush_lazy_mmu_mode() unconditionally in a few
>> places, but only defines it if PARAVIRT_XXL is selected, and we are
>> removing the fallback in <linux/pgtable.h>. Add a new fallback
>> definition to <asm/pgtable.h> to keep things building.
>
> I can see a call in __kernel_map_pages() and
> arch_kmap_local_post_map()/arch_kmap_local_post_unmap().
>
> I guess that is ... harmless/irrelevant in the context of this series?

It should be. arch_flush_lazy_mmu_mode() was only used by x86 before
this series; we're adding new calls to it from the generic layer, but
existing x86 calls shouldn't be affected.

- Kevin

