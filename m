Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE04BA88414
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 16:11:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950355.1346708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4KXE-0000XF-P7; Mon, 14 Apr 2025 14:11:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950355.1346708; Mon, 14 Apr 2025 14:11:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4KXE-0000VE-Ln; Mon, 14 Apr 2025 14:11:40 +0000
Received: by outflank-mailman (input) for mailman id 950355;
 Mon, 14 Apr 2025 14:11:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nQQY=XA=arm.com=ryan.roberts@srs-se1.protection.inumbo.net>)
 id 1u4KXD-0000V8-Ik
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 14:11:39 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 60aa1aaf-193a-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 16:11:37 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13DDB1007;
 Mon, 14 Apr 2025 07:11:35 -0700 (PDT)
Received: from [10.57.86.225] (unknown [10.57.86.225])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B3583F59E;
 Mon, 14 Apr 2025 07:11:32 -0700 (PDT)
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
X-Inumbo-ID: 60aa1aaf-193a-11f0-9eae-5ba50f476ded
Message-ID: <0eae5a1a-70fe-49ab-bd3e-565dcd4e97cf@arm.com>
Date: Mon, 14 Apr 2025 15:11:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Fix lazy mmu mode
Content-Language: en-GB
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <20250303141542.3371656-1-ryan.roberts@arm.com>
 <912c7a32-b39c-494f-a29c-4865cd92aeba@agordeev.local>
 <5b0609c9-95ee-4e48-bb6d-98f57c5d2c31@arm.com>
 <Z/0V9r6rjEjSH3fh@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <Z/0V9r6rjEjSH3fh@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/04/2025 15:04, Alexander Gordeev wrote:
> On Mon, Apr 14, 2025 at 02:22:53PM +0100, Ryan Roberts wrote:
>> On 10/04/2025 17:07, Alexander Gordeev wrote:
>>>> I'm planning to implement lazy mmu mode for arm64 to optimize vmalloc. As part
>>>> of that, I will extend lazy mmu mode to cover kernel mappings in vmalloc table
>>>> walkers. While lazy mmu mode is already used for kernel mappings in a few
>>>> places, this will extend it's use significantly.
>>>>
>>>> Having reviewed the existing lazy mmu implementations in powerpc, sparc and x86,
>>>> it looks like there are a bunch of bugs, some of which may be more likely to
>>>> trigger once I extend the use of lazy mmu.
>>>
>>> Do you have any idea about generic code issues as result of not adhering to
>>> the originally stated requirement:
>>>
>>>   /*
>>>    ...
>>>    * the PTE updates which happen during this window.  Note that using this
>>>    * interface requires that read hazards be removed from the code.  A read
>>>    * hazard could result in the direct mode hypervisor case, since the actual
>>>    * write to the page tables may not yet have taken place, so reads though
>>>    * a raw PTE pointer after it has been modified are not guaranteed to be
>>>    * up to date.
>>>    ...
>>>    */
>>>
>>> I tried to follow few code paths and at least this one does not look so good:
>>>
>>> copy_pte_range(..., src_pte, ...)
>>> 	ret = copy_nonpresent_pte(..., src_pte, ...)
>>> 		try_restore_exclusive_pte(..., src_pte, ...)	// is_device_exclusive_entry(entry)
>>> 			restore_exclusive_pte(..., ptep, ...)
>>> 				set_pte_at(..., ptep, ...)
>>> 					set_pte(ptep, pte);	// save in lazy mmu mode
>>>
>>> 	// ret == -ENOENT
>>>
>>> 	ptent = ptep_get(src_pte);				// lazy mmu save is not observed
>>> 	ret = copy_present_ptes(..., ptent, ...);		// wrong ptent used
>>>
>>> I am not aware whether the effort to "read hazards be removed from the code"
>>> has ever been made and the generic code is safe in this regard.
>>>
>>> What is your take on this?
>>
>> Hmm, that looks like a bug to me, at least based on the stated requirements.
>> Although this is not a "read through a raw PTE *pointer*", it is a ptep_get().
>> The arch code can override that so I guess it has an opportunity to flush. But I
>> don't think any arches are currently doing that.
>>
>> Probably the simplest fix is to add arch_flush_lazy_mmu_mode() before the
>> ptep_get()?
> 
> Which would completely revert the very idea of the lazy mmu mode?
> (As one would flush on every PTE page table iteration).

Well yes, but this is a pretty rare path, I'm guessing?

> 
>> It won't be a problem in practice for arm64, since the pgtables are always
>> updated immediately. I just want to use these hooks to defer/batch barriers in
>> certain cases.
>>
>> And this is a pre-existing issue for the arches that use lazy mmu with
>> device-exclusive mappings, which my extending lazy mmu into vmalloc won't
>> exacerbate.
>>
>> Would you be willing/able to submit a fix?
> 
> Well, we have a dozen of lazy mmu cases and I would guess it is not the
> only piece of code that seems affected. I was thinking about debug feature
> that could help spotting all troubled locations.
> 
> Then we could assess and decide if it is feasible to fix. Just turning the
> code above into the PTE read-modify-update pattern is quite an exercise...
> 
>> Thanks,
>> Ryan


