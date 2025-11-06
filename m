Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 892FCC3A42B
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 11:30:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156716.1485725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGxFo-0006Ls-4T; Thu, 06 Nov 2025 10:30:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156716.1485725; Thu, 06 Nov 2025 10:30:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGxFo-0006Jd-1T; Thu, 06 Nov 2025 10:30:08 +0000
Received: by outflank-mailman (input) for mailman id 1156716;
 Thu, 06 Nov 2025 10:30:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eIRr=5O=arm.com=kevin.brodsky@srs-se1.protection.inumbo.net>)
 id 1vGxFn-0006JX-5U
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 10:30:07 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 8ce6d35a-bafb-11f0-980a-7dc792cee155;
 Thu, 06 Nov 2025 11:30:01 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B85731596;
 Thu,  6 Nov 2025 02:29:52 -0800 (PST)
Received: from [10.1.34.75] (unknown [10.1.34.75])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB9A53F66E;
 Thu,  6 Nov 2025 02:29:53 -0800 (PST)
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
X-Inumbo-ID: 8ce6d35a-bafb-11f0-980a-7dc792cee155
Message-ID: <b3e4a92f-5b51-4eee-bfb8-c454add0f0d2@arm.com>
Date: Thu, 6 Nov 2025 10:29:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/12] powerpc/64s: Do not re-activate batched TLB
 flush
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, linux-mm@kvack.org
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
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-2-kevin.brodsky@arm.com>
 <87qzud42n1.ritesh.list@gmail.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <87qzud42n1.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/11/2025 02:46, Ritesh Harjani (IBM) wrote:
> Kevin Brodsky <kevin.brodsky@arm.com> writes:
>
>> From: Alexander Gordeev <agordeev@linux.ibm.com>
>>
>> Since commit b9ef323ea168 ("powerpc/64s: Disable preemption in hash
>> lazy mmu mode") a task can not be preempted while in lazy MMU mode.
>> Therefore, the batch re-activation code is never called, so remove it.
>>
>> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> ---
>>  arch/powerpc/include/asm/thread_info.h |  2 --
>>  arch/powerpc/kernel/process.c          | 25 -------------------------
>>  2 files changed, 27 deletions(-)
>>
> Since the commit referenced in above disables the preemption in
> arch_enter_lazy_mmu(), so the expectation is that we will never be
> context switched while in lazy_mmu, hence the code changes in
> switch_to() around __flush_tlb_pending() should ideally never be called.

Correct, that's the idea.

> With this analysis - the patch looks good to me. I will give this entire
> patch series a try on Power HW with Hash mmu too (which uses lazy mmu and
> let you know the results of that)!

That'd be very appreciated, thanks a lot!

> For this patch please feel free to add:
> Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>
>
> CC: Venkat who also runs CI on linux Power HW for upstream testing :)

Ack, will Cc you both in the next version.

- Kevin

