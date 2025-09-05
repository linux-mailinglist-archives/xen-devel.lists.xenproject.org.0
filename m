Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1280B45793
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 14:21:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1111929.1460468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuVRR-0005h5-Pu; Fri, 05 Sep 2025 12:21:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1111929.1460468; Fri, 05 Sep 2025 12:21:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuVRR-0005et-ME; Fri, 05 Sep 2025 12:21:21 +0000
Received: by outflank-mailman (input) for mailman id 1111929;
 Fri, 05 Sep 2025 12:21:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jBRp=3Q=arm.com=kevin.brodsky@srs-se1.protection.inumbo.net>)
 id 1uuVIL-0001iM-Da
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 12:11:57 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 81825d51-8a51-11f0-9809-7dc792cee155;
 Fri, 05 Sep 2025 14:11:52 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F0A1B153B;
 Fri,  5 Sep 2025 05:11:42 -0700 (PDT)
Received: from [10.57.60.42] (unknown [10.57.60.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 65F093F63F;
 Fri,  5 Sep 2025 05:11:45 -0700 (PDT)
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
X-Inumbo-ID: 81825d51-8a51-11f0-9809-7dc792cee155
Message-ID: <66335cf3-d49d-4b27-a37b-0a8a5e2c5d78@arm.com>
Date: Fri, 5 Sep 2025 14:11:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Nesting support for lazy MMU mode
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
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
 <9fd076c7-f163-4b92-8201-d8a259a338c1-agordeev@linux.ibm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <9fd076c7-f163-4b92-8201-d8a259a338c1-agordeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/09/2025 11:46, Alexander Gordeev wrote:
> On Thu, Sep 04, 2025 at 01:57:29PM +0100, Kevin Brodsky wrote:
>
> Hi Kevin,
>
>> When the lazy MMU mode was introduced eons ago, it wasn't made clear
>> whether such a sequence was legal:
>>
>> 	arch_enter_lazy_mmu_mode()
>> 	...
>> 		arch_enter_lazy_mmu_mode()
>> 		...
>> 		arch_leave_lazy_mmu_mode()
>> 	...
>> 	arch_leave_lazy_mmu_mode()
> I did not take too deep - sorry if you already answered this.
> Quick question - whether a concern Ryan expressed is addressed
> in general case?

The short answer is yes - it's good that you're asking because I failed
to clarify this in the cover letter!

> https://lore.kernel.org/all/3cad01ea-b704-4156-807e-7a83643917a8@arm.com/
>
> 	enter_lazy_mmu
> 		for_each_pte {
> 			read/modify-write pte
>
> 			alloc_page
> 				enter_lazy_mmu
> 					make page valid
> 				exit_lazy_mmu
>
> 			write_to_page
> 		}
> 	exit_lazy_mmu
>
> <quote>
> This example only works because lazy_mmu doesn't support nesting. The "make page
> valid" operation is completed by the time of the inner exit_lazy_mmu so that the
> page can be accessed in write_to_page. If nesting was supported, the inner
> exit_lazy_mmu would become a nop and write_to_page would explode.
> </quote>

Further down in the cover letter I refer to the approach Catalin
suggested [4]. This was in fact in response to this concern from Ryan.
The key point is: leave() keeps the lazy MMU mode enabled if it is
nested, but it flushes any batched state *unconditionally*, regardless
of nesting level. See patch 3-6 on the practical implementation of this;
patch 7 also spells it out in the documentation.

Hope that clarifies the situation!

- Kevin

[4] https://lore.kernel.org/all/aEhKSq0zVaUJkomX@arm.com/

