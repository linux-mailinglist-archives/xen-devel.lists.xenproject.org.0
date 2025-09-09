Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA07B4A696
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 11:06:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1115928.1462375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvuIY-0000H9-1k; Tue, 09 Sep 2025 09:05:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1115928.1462375; Tue, 09 Sep 2025 09:05:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvuIX-0000Ek-Uz; Tue, 09 Sep 2025 09:05:57 +0000
Received: by outflank-mailman (input) for mailman id 1115928;
 Tue, 09 Sep 2025 09:05:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z13K=3U=arm.com=kevin.brodsky@srs-se1.protection.inumbo.net>)
 id 1uvuIX-0000Ee-8C
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 09:05:57 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 3098bc18-8d5c-11f0-9d13-b5c5bf9af7f9;
 Tue, 09 Sep 2025 11:05:54 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E25F015A1;
 Tue,  9 Sep 2025 02:05:44 -0700 (PDT)
Received: from [10.57.60.124] (unknown [10.57.60.124])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A7EF13F63F;
 Tue,  9 Sep 2025 02:05:39 -0700 (PDT)
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
X-Inumbo-ID: 3098bc18-8d5c-11f0-9d13-b5c5bf9af7f9
Message-ID: <bd3958cc-f069-40a6-b201-7cab338e0cd9@arm.com>
Date: Tue, 9 Sep 2025 11:05:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] mm: introduce local state for lazy_mmu sections
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
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
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
 <20250908073931.4159362-3-kevin.brodsky@arm.com>
 <20250908224054.0a1969b493d8a837addd782e@linux-foundation.org>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <20250908224054.0a1969b493d8a837addd782e@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/09/2025 07:40, Andrew Morton wrote:
> On Mon,  8 Sep 2025 08:39:26 +0100 Kevin Brodsky <kevin.brodsky@arm.com> wrote:
>
>> arch_{enter,leave}_lazy_mmu_mode() currently have a stateless API
>> (taking and returning no value). This is proving problematic in
>> situations where leave() needs to restore some context back to its
>> original state (before enter() was called). In particular, this
>> makes it difficult to support the nesting of lazy_mmu sections -
>> leave() does not know whether the matching enter() call occurred
>> while lazy_mmu was already enabled, and whether to disable it or
>> not.
>>
>> This patch gives all architectures the chance to store local state
>> while inside a lazy_mmu section by making enter() return some value,
>> storing it in a local variable, and having leave() take that value.
>> That value is typed lazy_mmu_state_t - each architecture defining
>> __HAVE_ARCH_ENTER_LAZY_MMU_MODE is free to define it as it sees fit.
>> For now we define it as int everywhere, which is sufficient to
>> support nesting.
>>
>> The diff is unfortunately rather large as all the API changes need
>> to be done atomically. Main parts:
> This has a build error:
>
>   CC      arch/x86/kernel/asm-offsets.s
> In file included from ./arch/x86/include/asm/irqflags.h:102,
>                  from ./include/linux/irqflags.h:18,
>                  from ./include/linux/spinlock.h:59,
>                  from ./include/linux/swait.h:7,
>                  from ./include/linux/completion.h:12,
>                  from ./include/linux/crypto.h:15,
>                  from arch/x86/kernel/asm-offsets.c:9:
> ./arch/x86/include/asm/paravirt.h: In function 'arch_enter_lazy_mmu_mode':
> ./arch/x86/include/asm/paravirt.h:534:16: error: 'LAZY_MMU_DEFAULT' undeclared (first use in this function)
>   534 |         return LAZY_MMU_DEFAULT;
>       |                ^~~~~~~~~~~~~~~~
> ./arch/x86/include/asm/paravirt.h:534:16: note: each undeclared identifier is re
>
> which gets fixed up later in the series.

Oh indeed good catch! I don't think there's an easy way to fix this
cleanly due to the header soup. Since it's just a temporary change, I
suggest:

diff --git a/arch/x86/include/asm/paravirt.h
b/arch/x86/include/asm/paravirt.h
index 65a0d394fba1..67b9549b4255 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -531,7 +531,7 @@ static inline lazy_mmu_state_t
arch_enter_lazy_mmu_mode(void)
 {
     PVOP_VCALL0(mmu.lazy_mode.enter);
 
-    return LAZY_MMU_DEFAULT;
+    return 0; /* LAZY_MMU_DEFAULT */
 }
 
 static inline void arch_leave_lazy_mmu_mode(lazy_mmu_state_t state)


That will generate a trivial conflict with patch 4, naturally.

Should I send a v3 with that change?

- Kevin

