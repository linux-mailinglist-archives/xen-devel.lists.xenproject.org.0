Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4DECA7A9B
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 13:57:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178994.1502647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRVMH-0003XY-ON; Fri, 05 Dec 2025 12:56:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178994.1502647; Fri, 05 Dec 2025 12:56:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRVMH-0003VV-L8; Fri, 05 Dec 2025 12:56:25 +0000
Received: by outflank-mailman (input) for mailman id 1178994;
 Fri, 05 Dec 2025 12:56:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uphM=6L=arm.com=kevin.brodsky@srs-se1.protection.inumbo.net>)
 id 1vRVMG-0003VP-Ay
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 12:56:24 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id cd14bb28-d1d9-11f0-9d1b-b5c5bf9af7f9;
 Fri, 05 Dec 2025 13:56:23 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D48521575;
 Fri,  5 Dec 2025 04:56:14 -0800 (PST)
Received: from [10.44.160.68] (e126510-lin.lund.arm.com [10.44.160.68])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 903273F59E;
 Fri,  5 Dec 2025 04:56:14 -0800 (PST)
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
X-Inumbo-ID: cd14bb28-d1d9-11f0-9d1b-b5c5bf9af7f9
Message-ID: <89e76670-4a7b-46b6-ba55-d225dbb68cbd@arm.com>
Date: Fri, 5 Dec 2025 13:56:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/12] mm: enable lazy_mmu sections to nest
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, David Woodhouse <dwmw2@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251124132228.622678-1-kevin.brodsky@arm.com>
 <20251124132228.622678-9-kevin.brodsky@arm.com>
 <2dfd54d7-fe2a-4921-85ff-a581392a777a@arm.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <2dfd54d7-fe2a-4921-85ff-a581392a777a@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/12/2025 07:23, Anshuman Khandual wrote:
>> [...]
>>
>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> index 8ff6fdb4b13d..24fdb6f5c2e1 100644
>> --- a/include/linux/pgtable.h
>> +++ b/include/linux/pgtable.h
>> @@ -230,39 +230,140 @@ static inline int pmd_dirty(pmd_t pmd)
>>   * (In practice, for user PTE updates, the appropriate page table lock(s) are
>>   * held, but for kernel PTE updates, no lock is held). The mode is disabled in
>>   * interrupt context and calls to the lazy_mmu API have no effect.
>> - * Nesting is not permitted.
>> + *
>> + * The lazy MMU mode is enabled for a given block of code using:
>> + *
>> + *   lazy_mmu_mode_enable();
>> + *   <code>
>> + *   lazy_mmu_mode_disable();
>> + *
>> + * Nesting is permitted: <code> may itself use an enable()/disable() pair.
>> + * A nested call to enable() has no functional effect; however disable() causes
>> + * any batched architectural state to be flushed regardless of nesting. After a
> Just wondering if there is a method for these generic helpers to ensure that platform
> really does the required flushing on _disable() or the expected platform semantics is
> only described via this comment alone ?

From the generic layer's perspective, flushing means calling
arch_flush_lazy_mmu_mode(). Like the other arch_*_lazy_mmu_mode helpers,
the actual semantics is unspecified - an arch could choose not to do
anything on flush if that's not required for page table changes to be
visible. There is actually an example of this in the kpkeys page table
hardening series [1] (this isn't doing any batching so there is nothing
to flush either).

[1]
https://lore.kernel.org/linux-hardening/20250815085512.2182322-19-kevin.brodsky@arm.com/

>> + * call to disable(), the caller can therefore rely on all previous page table
>> + * modifications to have taken effect, but the lazy MMU mode may still be
>> + * enabled.
>> + *
>> + * In certain cases, it may be desirable to temporarily pause the lazy MMU mode.
>> + * This can be done using:
>> + *
>> + *   lazy_mmu_mode_pause();
>> + *   <code>
>> + *   lazy_mmu_mode_resume();
>> + *
>> + * pause() ensures that the mode is exited regardless of the nesting level;
>> + * resume() re-enters the mode at the same nesting level. Any call to the
>> + * lazy_mmu_mode_* API between those two calls has no effect. In particular,
>> + * this means that pause()/resume() pairs may nest.
>> + *
>> + * in_lazy_mmu_mode() can be used to check whether the lazy MMU mode is
>> + * currently enabled.
> Just wondering - could a corresponding test be included probably via KUNIT_TEST
> to ensure the above described semantics are being followed.

Checking that is_lazy_mmu_mode_active() returns the right value at
different call depths should be doable, yes. I suppose that could live
in some file under mm/tests/ (doesn't exist yet but that's the preferred
approach for KUnit tests).

- Kevin

