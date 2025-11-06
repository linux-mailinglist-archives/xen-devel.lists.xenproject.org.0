Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2FEC3A477
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 11:33:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156750.1485755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGxJA-0007tD-Uu; Thu, 06 Nov 2025 10:33:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156750.1485755; Thu, 06 Nov 2025 10:33:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGxJA-0007rD-RG; Thu, 06 Nov 2025 10:33:36 +0000
Received: by outflank-mailman (input) for mailman id 1156750;
 Thu, 06 Nov 2025 10:33:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eIRr=5O=arm.com=kevin.brodsky@srs-se1.protection.inumbo.net>)
 id 1vGxJ9-0007r5-Mt
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 10:33:35 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 0bf40853-bafc-11f0-9d17-b5c5bf9af7f9;
 Thu, 06 Nov 2025 11:33:34 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 260141596;
 Thu,  6 Nov 2025 02:33:26 -0800 (PST)
Received: from [10.1.34.75] (unknown [10.1.34.75])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9451F3F66E;
 Thu,  6 Nov 2025 02:33:26 -0800 (PST)
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
X-Inumbo-ID: 0bf40853-bafc-11f0-9d17-b5c5bf9af7f9
Message-ID: <1ac5be9f-fc05-463f-9512-74922acf8980@arm.com>
Date: Thu, 6 Nov 2025 10:33:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/12] mm: introduce CONFIG_ARCH_HAS_LAZY_MMU_MODE
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
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-6-kevin.brodsky@arm.com>
 <87o6ph3xdq.ritesh.list@gmail.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <87o6ph3xdq.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/11/2025 04:40, Ritesh Harjani (IBM) wrote:
> Kevin Brodsky <kevin.brodsky@arm.com> writes:
>
>> Architectures currently opt in for implementing lazy_mmu helpers by
>> defining __HAVE_ARCH_ENTER_LAZY_MMU_MODE.
>>
>> In preparation for introducing a generic lazy_mmu layer that will
>> require storage in task_struct, let's switch to a cleaner approach:
>> instead of defining a macro, select a CONFIG option.
>>
>> This patch introduces CONFIG_ARCH_HAS_LAZY_MMU_MODE and has each
>> arch select it when it implements lazy_mmu helpers.
>> __HAVE_ARCH_ENTER_LAZY_MMU_MODE is removed and <linux/pgtable.h>
>> relies on the new CONFIG instead.
>>
>> On x86, lazy_mmu helpers are only implemented if PARAVIRT_XXL is
>> selected. This creates some complications in arch/x86/boot/, because
>> a few files manually undefine PARAVIRT* options. As a result
>> <asm/paravirt.h> does not define the lazy_mmu helpers, but this
>> breaks the build as <linux/pgtable.h> only defines them if
>> !CONFIG_ARCH_HAS_LAZY_MMU_MODE. There does not seem to be a clean
>> way out of this - let's just undefine that new CONFIG too.
>>
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> ---
>>  arch/arm64/Kconfig                                 | 1 +
>>  arch/arm64/include/asm/pgtable.h                   | 1 -
>>  arch/powerpc/include/asm/book3s/64/tlbflush-hash.h | 2 --
>>  arch/powerpc/platforms/Kconfig.cputype             | 1 +
>>  arch/sparc/Kconfig                                 | 1 +
>>  arch/sparc/include/asm/tlbflush_64.h               | 2 --
>>  arch/x86/Kconfig                                   | 1 +
>>  arch/x86/boot/compressed/misc.h                    | 1 +
>>  arch/x86/boot/startup/sme.c                        | 1 +
>>  arch/x86/include/asm/paravirt.h                    | 1 -
>>  include/linux/pgtable.h                            | 2 +-
>>  mm/Kconfig                                         | 3 +++
>>  12 files changed, 10 insertions(+), 7 deletions(-)
> Maybe we can add this to ... ?
>
> Documentation/features/vm/lazy_mmu/arch-support.txt
>
> #
> # Feature name:          lazy_mmu mode
> #         Kconfig:       ARCH_HAS_LAZY_MMU_MODE
> #         description:   arch supports arch_{enter|flush|leave}_lazy_mmu_mode()
> #
>     -----------------------
>     |         arch |status|
>     -----------------------
>     |       arm64: |  ok  |
>     |     powerpc: |  ok  |
>     |       sparc: |  ok  |
>     |         x86: |  ok  |
>     -----------------------

That's an interesting idea but I'm not sure it really makes sense for
lazy MMU? AFAIU these arch-support.txt files are meant to help identify
which generic features an arch has support for. Lazy MMU isn't really a
feature though, in the sense that what it does is entirely defined by
the arch. This patch does introduce a generic layer, but ultimately it
remains a collection of arch hooks.

> As for this patch, the changes are mostly straight forward around the
> configs part. This looks good to me. Please feel free to add: 
>
> Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

Thanks for the review!

- Kevin

