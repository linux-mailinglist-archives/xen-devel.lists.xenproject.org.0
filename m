Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E45EC2DAAA
	for <lists+xen-devel@lfdr.de>; Mon, 03 Nov 2025 19:26:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155515.1484982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFzFa-0004To-Tu; Mon, 03 Nov 2025 18:25:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155515.1484982; Mon, 03 Nov 2025 18:25:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFzFa-0004Rx-RB; Mon, 03 Nov 2025 18:25:54 +0000
Received: by outflank-mailman (input) for mailman id 1155515;
 Mon, 03 Nov 2025 18:25:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=10XO=5L=arm.com=kevin.brodsky@srs-se1.protection.inumbo.net>)
 id 1vFzFZ-0004Rr-HE
 for xen-devel@lists.xenproject.org; Mon, 03 Nov 2025 18:25:53 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 8732420b-b8e2-11f0-9d16-b5c5bf9af7f9;
 Mon, 03 Nov 2025 19:25:52 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7EF862A6B;
 Mon,  3 Nov 2025 10:25:43 -0800 (PST)
Received: from [10.1.30.16] (unknown [10.1.30.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E06143F694;
 Mon,  3 Nov 2025 10:25:43 -0800 (PST)
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
X-Inumbo-ID: 8732420b-b8e2-11f0-9d16-b5c5bf9af7f9
Message-ID: <334d6272-a1c2-4075-a956-3f41908371a6@arm.com>
Date: Mon, 3 Nov 2025 18:25:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/12] arm64: mm: replace TIF_LAZY_MMU with
 in_lazy_mmu_mode()
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
 <20251029100909.3381140-9-kevin.brodsky@arm.com>
 <b6f5b3cc-93a0-408a-b7e0-72462f3fd549@redhat.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <b6f5b3cc-93a0-408a-b7e0-72462f3fd549@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/11/2025 16:03, David Hildenbrand wrote:
> On 29.10.25 11:09, Kevin Brodsky wrote:
>> The generic lazy_mmu layer now tracks whether a task is in lazy MMU
>> mode. As a result we no longer need a TIF flag for that purpose -
>> let's use the new in_lazy_mmu_mode() helper instead.
>>
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> ---
>>   arch/arm64/include/asm/pgtable.h     | 16 +++-------------
>>   arch/arm64/include/asm/thread_info.h |  3 +--
>>   2 files changed, 4 insertions(+), 15 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/pgtable.h
>> b/arch/arm64/include/asm/pgtable.h
>> index 535435248923..61ca88f94551 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -62,30 +62,21 @@ static inline void emit_pte_barriers(void)
>>     static inline void queue_pte_barriers(void)
>>   {
>> -    unsigned long flags;
>> -
>>       if (in_interrupt()) {
>>           emit_pte_barriers();
>>           return;
>>       }
>>   -    flags = read_thread_flags();
>> -
>> -    if (flags & BIT(TIF_LAZY_MMU)) {
>> -        /* Avoid the atomic op if already set. */
>> -        if (!(flags & BIT(TIF_LAZY_MMU_PENDING)))
>> -            set_thread_flag(TIF_LAZY_MMU_PENDING);
>> -    } else {
>> +    if (in_lazy_mmu_mode())
>> +        test_and_set_thread_flag(TIF_LAZY_MMU_PENDING);
>
> You likely don't want a test_and_set here, which would do a
> test_and_set_bit() -- an atomic rmw.

Ah yes good point, the new version would do an atomic RMW in all cases.
Simpler code but also slower :/

>
> You only want to avoid the atomic write if already set.
>
> So keep the current
>
>     /* Avoid the atomic op if already set. */
>     if (!(flags & BIT(TIF_LAZY_MMU_PENDING)))
>         set_thread_flag(TIF_LAZY_MMU_PENDING); 

Pretty much, since we're now only considering one flag we can simplify
it to:

if (!test_thread_flag(TIF_LAZY_MMU_PENDING))
    set_thread_flag(TIF_LAZY_MMU_PENDING);

- Kevin

