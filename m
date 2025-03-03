Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CEBA4BBEE
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 11:22:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900137.1308058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp2wE-0006Jz-Ue; Mon, 03 Mar 2025 10:22:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900137.1308058; Mon, 03 Mar 2025 10:22:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp2wE-0006IK-Qu; Mon, 03 Mar 2025 10:22:18 +0000
Received: by outflank-mailman (input) for mailman id 900137;
 Mon, 03 Mar 2025 10:22:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jm5g=VW=arm.com=ryan.roberts@srs-se1.protection.inumbo.net>)
 id 1tp2wD-0006IE-MR
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 10:22:17 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 5db8801e-f819-11ef-9898-31a8f345e629;
 Mon, 03 Mar 2025 11:22:10 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F08EC12FC;
 Mon,  3 Mar 2025 02:22:23 -0800 (PST)
Received: from [10.1.26.155] (XHFQ2J9959.cambridge.arm.com [10.1.26.155])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7EC963F66E;
 Mon,  3 Mar 2025 02:22:07 -0800 (PST)
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
X-Inumbo-ID: 5db8801e-f819-11ef-9898-31a8f345e629
Message-ID: <1ff509c7-187b-4e43-b266-db8ada33b9a2@arm.com>
Date: Mon, 3 Mar 2025 10:22:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] mm: Fix lazy mmu docs and usage
Content-Language: en-GB
To: David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-mm@kvack.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20250302145555.3236789-1-ryan.roberts@arm.com>
 <20250302145555.3236789-2-ryan.roberts@arm.com>
 <5418a661-dbd0-46e9-8ef7-b1c5a34acce3@redhat.com>
 <a9e21c14-d390-4119-ad93-b23e6ccbac15@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <a9e21c14-d390-4119-ad93-b23e6ccbac15@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/03/2025 08:52, David Hildenbrand wrote:
> On 03.03.25 09:49, David Hildenbrand wrote:
>> On 02.03.25 15:55, Ryan Roberts wrote:
>>> The docs, implementations and use of arch_[enter|leave]_lazy_mmu_mode()
>>> is a bit of a mess (to put it politely). There are a number of issues
>>> related to nesting of lazy mmu regions and confusion over whether the
>>> task, when in a lazy mmu region, is preemptible or not. Fix all the
>>> issues relating to the core-mm. Follow up commits will fix the
>>> arch-specific implementations. 3 arches implement lazy mmu; powerpc,
>>> sparc and x86.
>>>
>>> When arch_[enter|leave]_lazy_mmu_mode() was first introduced by commit
>>> 6606c3e0da53 ("[PATCH] paravirt: lazy mmu mode hooks.patch"), it was
>>> expected that lazy mmu regions would never nest and that the appropriate
>>> page table lock(s) would be held while in the region, thus ensuring the
>>> region is non-preemptible. Additionally lazy mmu regions were only used
>>> during manipulation of user mappings.
>>>
>>> Commit 38e0edb15bd0 ("mm/apply_to_range: call pte function with lazy
>>> updates") started invoking the lazy mmu mode in apply_to_pte_range(),
>>> which is used for both user and kernel mappings. For kernel mappings the
>>> region is no longer protected by any lock so there is no longer any
>>> guarantee about non-preemptibility. Additionally, for RT configs, the
>>> holding the PTL only implies no CPU migration, it doesn't prevent
>>> preemption.
>>>
>>> Commit bcc6cc832573 ("mm: add default definition of set_ptes()") added
>>> arch_[enter|leave]_lazy_mmu_mode() to the default implementation of
>>> set_ptes(), used by x86. So after this commit, lazy mmu regions can be
>>> nested. Additionally commit 1a10a44dfc1d ("sparc64: implement the new
>>> page table range API") and commit 9fee28baa601 ("powerpc: implement the
>>> new page table range API") did the same for the sparc and powerpc
>>> set_ptes() overrides.
>>>
>>> powerpc couldn't deal with preemption so avoids it in commit
>>> b9ef323ea168 ("powerpc/64s: Disable preemption in hash lazy mmu mode"),
>>> which explicitly disables preemption for the whole region in its
>>> implementation. x86 can support preemption (or at least it could until
>>> it tried to add support nesting; more on this below). Sparc looks to be
>>> totally broken in the face of preemption, as far as I can tell.
>>>
>>> powewrpc can't deal with nesting, so avoids it in commit 47b8def9358c
>>> ("powerpc/mm: Avoid calling arch_enter/leave_lazy_mmu() in set_ptes"),
>>> which removes the lazy mmu calls from its implementation of set_ptes().
>>> x86 attempted to support nesting in commit 49147beb0ccb ("x86/xen: allow
>>> nesting of same lazy mode") but as far as I can tell, this breaks its
>>> support for preemption.
>>>
>>> In short, it's all a mess; the semantics for
>>> arch_[enter|leave]_lazy_mmu_mode() are not clearly defined and as a
>>> result the implementations all have different expectations, sticking
>>> plasters and bugs.
>>>
>>> arm64 is aiming to start using these hooks, so let's clean everything up
>>> before adding an arm64 implementation. Update the documentation to state
>>> that lazy mmu regions can never be nested, must not be called in
>>> interrupt context and preemption may or may not be enabled for the
>>> duration of the region.
>>>
>>> Additionally, update the way arch_[enter|leave]_lazy_mmu_mode() is
>>> called in pagemap_scan_pmd_entry() to follow the normal pattern of
>>> holding the ptl for user space mappings. As a result the scope is
>>> reduced to only the pte table, but that's where most of the performance
>>> win is. While I believe there wasn't technically a bug here, the
>>> original scope made it easier to accidentally nest or, worse,
>>> accidentally call something like kmap() which would expect an immediate
>>> mode pte modification but it would end up deferred.
>>>
>>> arch-specific fixes to conform to the new spec will proceed this one.
>>>
>>> These issues were spotted by code review and I have no evidence of
>>> issues being reported in the wild.
>>>
>>
>> All looking good to me!
>>
>> Acked-by: David Hildenbrand <david@redhat.com>
>>
> 
> ... but I do wonder if the set_ptes change should be split from the pagemap change.

So set_ptes + docs changes in one patch, and pagemap change in another? I can do
that.

I didn't actually cc stable on these, I'm wondering if I should do that? Perhaps
for all patches except the pagemap change?

Thanks for the quick review!

