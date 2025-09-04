Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A60BB440F1
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 17:48:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1110490.1459670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuCBg-0005Fr-M7; Thu, 04 Sep 2025 15:47:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1110490.1459670; Thu, 04 Sep 2025 15:47:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuCBg-0005Dh-Ig; Thu, 04 Sep 2025 15:47:48 +0000
Received: by outflank-mailman (input) for mailman id 1110490;
 Thu, 04 Sep 2025 15:47:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DBMC=3P=arm.com=kevin.brodsky@srs-se1.protection.inumbo.net>)
 id 1uuCBe-0005Db-MX
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 15:47:46 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 7f742829-89a6-11f0-9d12-b5c5bf9af7f9;
 Thu, 04 Sep 2025 17:47:44 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F682339;
 Thu,  4 Sep 2025 08:47:35 -0700 (PDT)
Received: from [10.57.59.221] (unknown [10.57.59.221])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1309D3F6A8;
 Thu,  4 Sep 2025 08:47:35 -0700 (PDT)
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
X-Inumbo-ID: 7f742829-89a6-11f0-9d12-b5c5bf9af7f9
Message-ID: <af6ea636-a5cb-4b78-aae0-ff7e7caa5e5d@arm.com>
Date: Thu, 4 Sep 2025 17:47:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] mm: introduce local state for lazy_mmu sections
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20250904125736.3918646-1-kevin.brodsky@arm.com>
 <20250904125736.3918646-3-kevin.brodsky@arm.com>
 <aLmq+dwZV9dyTYuq@e129823.arm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <aLmq+dwZV9dyTYuq@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/09/2025 17:06, Yeoreum Yun wrote:
> Hi Kevin,
>
> [...]
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> ---
>>  arch/arm64/include/asm/pgtable.h              | 10 +++++++---
>>  .../include/asm/book3s/64/tlbflush-hash.h     |  9 ++++++---
>>  arch/powerpc/mm/book3s64/hash_tlb.c           | 10 ++++++----
>>  arch/powerpc/mm/book3s64/subpage_prot.c       |  5 +++--
>>  arch/sparc/include/asm/tlbflush_64.h          |  5 +++--
>>  arch/sparc/mm/tlb.c                           |  6 ++++--
>>  arch/x86/include/asm/paravirt.h               |  6 ++++--
>>  arch/x86/include/asm/paravirt_types.h         |  2 ++
>>  arch/x86/xen/enlighten_pv.c                   |  2 +-
>>  arch/x86/xen/mmu_pv.c                         |  2 +-
>>  fs/proc/task_mmu.c                            |  5 +++--
>>  include/linux/mm_types.h                      |  3 +++
>>  include/linux/pgtable.h                       |  6 ++++--
>>  mm/madvise.c                                  | 20 ++++++++++---------
>>  mm/memory.c                                   | 20 +++++++++++--------
>>  mm/migrate_device.c                           |  5 +++--
>>  mm/mprotect.c                                 |  5 +++--
>>  mm/mremap.c                                   |  5 +++--
>>  mm/vmalloc.c                                  | 15 ++++++++------
>>  mm/vmscan.c                                   | 15 ++++++++------
>>  20 files changed, 97 insertions(+), 59 deletions(-)
> I think you miss the mm/kasan/shadow.c

Ah yes that's because my series is based on v6.17-rc4 but [1] isn't in
mainline yet. I'll rebase v2 on top of mm-stable.

[1]
https://lore.kernel.org/all/0d2efb7ddddbff6b288fbffeeb10166e90771718.1755528662.git.agordeev@linux.ibm.com/

> But here, the usage is like:
>
> static int kasan_populate_vmalloc_pte()
> {
> 	...
> 	arch_leave_lazy_mmu_mode();
> 	...
> 	arch_enter_lazy_mmu_mode();
> 	...
> }
>
> Might be you can call the arch_leave_lazy_mmu_mode() with LAZY_MMU_DEFAULT
> in here since I think kasan_populate_vmalloc_pte() wouldn't be called
> nestly.

In fact in that case it doesn't matter if the section is nested or not.
We're already assuming that lazy_mmu is enabled, and we want to fully
disable it so that PTE operations take effect immediately. For that to
happen we must call arch_leave_lazy_mmu_mode(LAZY_MMU_DEFAULT). We will
then re-enable lazy_mmu, and the next call to leave() will do the right
thing whether it is nested or not.

It's worth nothing the same situation occurs in xen_flush_lazy_mmu() and
this patch handles it in the way I've just described.

I'll take care of that in v2, thanks for the heads-up!

- Kevin

