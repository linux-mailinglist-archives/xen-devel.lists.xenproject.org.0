Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6EBAC93DA
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 18:46:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001413.1381576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL2rb-00028T-CR; Fri, 30 May 2025 16:45:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001413.1381576; Fri, 30 May 2025 16:45:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL2rb-00025z-9p; Fri, 30 May 2025 16:45:47 +0000
Received: by outflank-mailman (input) for mailman id 1001413;
 Fri, 30 May 2025 16:45:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m5RA=YO=arm.com=ryan.roberts@srs-se1.protection.inumbo.net>)
 id 1uL2rZ-00025t-Pk
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 16:45:45 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 84799d89-3d75-11f0-b894-0df219b8e170;
 Fri, 30 May 2025 18:45:39 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 366C71692;
 Fri, 30 May 2025 09:45:22 -0700 (PDT)
Received: from [10.57.95.14] (unknown [10.57.95.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC2B43F673;
 Fri, 30 May 2025 09:45:32 -0700 (PDT)
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
X-Inumbo-ID: 84799d89-3d75-11f0-b894-0df219b8e170
Message-ID: <d183b3ff-ab61-4dc4-98c8-7ab9c1f6a4aa@arm.com>
Date: Fri, 30 May 2025 17:45:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 1/6] fs/proc/task_mmu: Fix pte update and tlb
 maintenance ordering in pagemap_scan_pmd_entry()
Content-Language: en-GB
To: Jann Horn <jannh@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
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
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Alexei Starovoitov <ast@kernel.org>, Andrey Ryabinin
 <ryabinin.a.a@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, virtualization@lists.linux.dev,
 xen-devel@lists.xenproject.org, linux-mm@kvack.org,
 Andy Lutomirski <luto@kernel.org>
References: <20250530140446.2387131-1-ryan.roberts@arm.com>
 <20250530140446.2387131-2-ryan.roberts@arm.com>
 <CAG48ez2k6ZmM-335EQjXeL6OtKzuOjVPWQDuJ75ww9Z6NMeg5w@mail.gmail.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <CAG48ez2k6ZmM-335EQjXeL6OtKzuOjVPWQDuJ75ww9Z6NMeg5w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/05/2025 17:26, Jann Horn wrote:
> On Fri, May 30, 2025 at 4:04 PM Ryan Roberts <ryan.roberts@arm.com> wrote:
>> pagemap_scan_pmd_entry() was previously modifying ptes while in lazy mmu
>> mode, then performing tlb maintenance for the modified ptes, then
>> leaving lazy mmu mode. But any pte modifications during lazy mmu mode
>> may be deferred until arch_leave_lazy_mmu_mode(), inverting the required
>> ordering between pte modificaiton and tlb maintenance.
>>
>> Let's fix that by leaving mmu mode, forcing all the pte updates to be
>> actioned, before doing the tlb maintenance.
>>
>> This is a theorectical bug discovered during code review.
>>
>> Fixes: 52526ca7fdb9 ("fs/proc/task_mmu: implement IOCTL to get and optionally clear info about PTEs")
> 
> Hmm... isn't lazy mmu mode supposed to also delay TLB flushes, and
> preserve the ordering of PTE modifications and TLB flushes?
> 
> Looking at the existing implementations of lazy MMU:
> 
>  - In Xen PV implementation of lazy MMU, I see that TLB flush
> hypercalls are delayed as well (xen_flush_tlb(),
> xen_flush_tlb_one_user() and xen_flush_tlb_multi() all use
> xen_mc_issue(XEN_LAZY_MMU) which delays issuing if lazymmu is active).
>  - The sparc version also seems to delay TLB flushes, and sparc's
> arch_leave_lazy_mmu_mode() seems to do TLB flushes via
> flush_tlb_pending() if necessary.
>  - powerpc's arch_leave_lazy_mmu_mode() also seems to do TLB flushes.
> 
> Am I missing something?

I doubt it. I suspect this was just my misunderstanding then. I hadn't
appreciated that lazy mmu is also guarranteed to maintain flush ordering; it's
chronically under-documented. Sorry for the noise here. On that basis, I expect
the first 2 patches can definitely be dropped.

> 
> If arm64 requires different semantics compared to all existing
> implementations and doesn't delay TLB flushes for lazy mmu mode, I
> think the "Fixes" tag should point to your addition of lazy mmu
> support for arm64.

arm64 doesn't require different semantics. arm64 is using lazy mmu in a very
limited manner and it can already tolerate the current code.

I just spotted this during code review and was trying to be a good citizen.
Thanks for setting me straight!

Thanks,
Ryan

> 
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>> ---
>>  fs/proc/task_mmu.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
>> index 994cde10e3f4..361f3ffd9a0c 100644
>> --- a/fs/proc/task_mmu.c
>> +++ b/fs/proc/task_mmu.c
>> @@ -2557,10 +2557,9 @@ static int pagemap_scan_pmd_entry(pmd_t *pmd, unsigned long start,
>>         }
>>
>>  flush_and_return:
>> +       arch_leave_lazy_mmu_mode();
>>         if (flush_end)
>>                 flush_tlb_range(vma, start, addr);
>> -
>> -       arch_leave_lazy_mmu_mode();
> 
> I think this ordering was probably intentional, because doing it this
> way around allows Xen PV to avoid one more hypercall, because the TLB
> flush can be batched together with the page table changes?
> 
> 
>>         pte_unmap_unlock(start_pte, ptl);
>>
>>         cond_resched();
>> --
>> 2.43.0
>>


