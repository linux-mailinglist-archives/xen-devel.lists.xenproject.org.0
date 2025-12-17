Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D54CC6F3D
	for <lists+xen-devel@lfdr.de>; Wed, 17 Dec 2025 11:02:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188679.1509797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVoLr-0006Rl-DR; Wed, 17 Dec 2025 10:01:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188679.1509797; Wed, 17 Dec 2025 10:01:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVoLr-0006QH-AK; Wed, 17 Dec 2025 10:01:47 +0000
Received: by outflank-mailman (input) for mailman id 1188679;
 Wed, 17 Dec 2025 10:01:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2tmK=6X=arm.com=ryan.roberts@srs-se1.protection.inumbo.net>)
 id 1vVoLp-0006PP-QZ
 for xen-devel@lists.xenproject.org; Wed, 17 Dec 2025 10:01:45 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 61bdd709-db2f-11f0-9cce-f158ae23cfc8;
 Wed, 17 Dec 2025 11:01:40 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 326E314BF;
 Wed, 17 Dec 2025 02:01:32 -0800 (PST)
Received: from [10.57.91.77] (unknown [10.57.91.77])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B4ADE3F73B;
 Wed, 17 Dec 2025 02:01:32 -0800 (PST)
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
X-Inumbo-ID: 61bdd709-db2f-11f0-9cce-f158ae23cfc8
Message-ID: <ca0da7fd-245c-4d52-8f4d-f8fce4717494@arm.com>
Date: Wed, 17 Dec 2025 10:01:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 14/14] mm: Add basic tests for lazy_mmu
Content-Language: en-GB
To: Kevin Brodsky <kevin.brodsky@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
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
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251215150323.2218608-1-kevin.brodsky@arm.com>
 <20251215150323.2218608-15-kevin.brodsky@arm.com>
 <20251216201403.4647a4f9861d3122ee9e90d7@linux-foundation.org>
 <f9550d22-8810-4145-aaa8-48961f6ea35e@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <f9550d22-8810-4145-aaa8-48961f6ea35e@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/12/2025 09:26, Kevin Brodsky wrote:
> On 17/12/2025 05:14, Andrew Morton wrote:
>> On Mon, 15 Dec 2025 15:03:23 +0000 Kevin Brodsky <kevin.brodsky@arm.com> wrote:
>>
>>> Add basic KUnit tests for the generic aspects of the lazy MMU mode:
>>> ensure that it appears active when it should, depending on how
>>> enable/disable and pause/resume pairs are nested.
>> I needed this for powerpc allmodconfig;
>>
>> --- a/arch/powerpc/mm/book3s64/hash_tlb.c~mm-add-basic-tests-for-lazy_mmu-fix
>> +++ a/arch/powerpc/mm/book3s64/hash_tlb.c
>> @@ -30,6 +30,7 @@
>>  #include <trace/events/thp.h>
>>  
>>  DEFINE_PER_CPU(struct ppc64_tlb_batch, ppc64_tlb_batch);
>> +EXPORT_SYMBOL_GPL(ppc64_tlb_batch);
>>  
>>  /*
>>   * A linux PTE was changed and the corresponding hash table entry
>> @@ -154,6 +155,7 @@ void __flush_tlb_pending(struct ppc64_tl
>>  		flush_hash_range(i, local);
>>  	batch->index = 0;
>>  }
>> +EXPORT_SYMBOL_GPL(__flush_tlb_pending);
>>  
>>  void hash__tlb_flush(struct mmu_gather *tlb)
>>  {
>> _
> 
> Oh indeed I hadn't considered that arch_{enter,leave}_lazy_mmu_mode()
> refer to those symbols on powerpc... Maybe a bit overkill to export
> those just for a test module, but I'm not sure there's a good
> alternative. Forcing LAZY_MMU_MODE_KUNIT_TEST=y is ugly as it would also
> force KUNIT=y. Alternatively we could depend on !PPC, not pretty either.

Does EXPORT_SYMBOL_IF_KUNIT() help?

> 
> - Kevin


