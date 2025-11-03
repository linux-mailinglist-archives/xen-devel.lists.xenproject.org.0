Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B500DC2D97A
	for <lists+xen-devel@lfdr.de>; Mon, 03 Nov 2025 19:08:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155494.1484962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFyx1-00019Q-9E; Mon, 03 Nov 2025 18:06:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155494.1484962; Mon, 03 Nov 2025 18:06:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFyx1-00016y-5a; Mon, 03 Nov 2025 18:06:43 +0000
Received: by outflank-mailman (input) for mailman id 1155494;
 Mon, 03 Nov 2025 18:06:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=10XO=5L=arm.com=kevin.brodsky@srs-se1.protection.inumbo.net>)
 id 1vFywz-00016s-Tu
 for xen-devel@lists.xenproject.org; Mon, 03 Nov 2025 18:06:41 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id d5e152b2-b8df-11f0-980a-7dc792cee155;
 Mon, 03 Nov 2025 19:06:36 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 183932A6B;
 Mon,  3 Nov 2025 10:06:27 -0800 (PST)
Received: from [10.1.30.16] (unknown [10.1.30.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 67BAA3F694;
 Mon,  3 Nov 2025 10:06:27 -0800 (PST)
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
X-Inumbo-ID: d5e152b2-b8df-11f0-980a-7dc792cee155
Message-ID: <bcc78ea0-5eca-49e5-bafd-84a16e06ab98@arm.com>
Date: Mon, 3 Nov 2025 18:06:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/12] x86/xen: simplify flush_lazy_mmu()
To: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 David Woodhouse <dwmw2@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>,
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
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-3-kevin.brodsky@arm.com>
 <5a3ccb7e-9d36-4ac8-9634-c8dec3d6a47c@redhat.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <5a3ccb7e-9d36-4ac8-9634-c8dec3d6a47c@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/11/2025 12:14, David Hildenbrand wrote:
> On 29.10.25 11:08, Kevin Brodsky wrote:
>> arch_flush_lazy_mmu_mode() is called when outstanding batched
>> pgtable operations must be completed immediately. There should
>> however be no need to leave and re-enter lazy MMU completely. The
>> only part of that sequence that we really need is xen_mc_flush();
>> call it directly.
>>
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> ---
>>   arch/x86/xen/mmu_pv.c | 6 ++----
>>   1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
>> index 2a4a8deaf612..7a35c3393df4 100644
>> --- a/arch/x86/xen/mmu_pv.c
>> +++ b/arch/x86/xen/mmu_pv.c
>> @@ -2139,10 +2139,8 @@ static void xen_flush_lazy_mmu(void)
>>   {
>>       preempt_disable();
>>   -    if (xen_get_lazy_mode() == XEN_LAZY_MMU) {
>> -        arch_leave_lazy_mmu_mode();
>> -        arch_enter_lazy_mmu_mode();
>> -    }
>> +    if (xen_get_lazy_mode() == XEN_LAZY_MMU)
>> +        xen_mc_flush();
>>         preempt_enable();
>>   }
>
> Looks like that was moved to XEN code in
>
> commit a4a7644c15096f57f92252dd6e1046bf269c87d8
> Author: Juergen Gross <jgross@suse.com>
> Date:   Wed Sep 13 13:38:27 2023 +0200
>
>     x86/xen: move paravirt lazy code
>
>
> And essentially the previous implementation lived in
> arch/x86/kernel/paravirt.c:paravirt_flush_lazy_mmu(void) in an
> implementation-agnostic way:
>
> void paravirt_flush_lazy_mmu(void)
> {
>        preempt_disable();
>
>        if (paravirt_get_lazy_mode() == PARAVIRT_LAZY_MMU) {
>                arch_leave_lazy_mmu_mode();
>                arch_enter_lazy_mmu_mode();
>        }
>
>        preempt_enable();
> }

Indeed, I saw that too. Calling the generic leave/enter functions made
some sense at that point, but now that the implementation is
Xen-specific we can directly call xen_mc_flush().

>
> So indeed, I assume just doing the flush here is sufficient.
>
> Reviewed-by: David Hildenbrand <david@redhat.com> 

Thanks for the review!

- Kevin

