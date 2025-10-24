Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0972CC06B54
	for <lists+xen-devel@lfdr.de>; Fri, 24 Oct 2025 16:33:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1150404.1481558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCIrK-0007By-21; Fri, 24 Oct 2025 14:33:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1150404.1481558; Fri, 24 Oct 2025 14:33:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCIrJ-000792-Uj; Fri, 24 Oct 2025 14:33:37 +0000
Received: by outflank-mailman (input) for mailman id 1150404;
 Fri, 24 Oct 2025 14:33:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rNzd=5B=arm.com=kevin.brodsky@srs-se1.protection.inumbo.net>)
 id 1vCIrI-0006jM-SU
 for xen-devel@lists.xenproject.org; Fri, 24 Oct 2025 14:33:36 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 6bd6138b-b0e6-11f0-980a-7dc792cee155;
 Fri, 24 Oct 2025 16:33:34 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66B1C1516;
 Fri, 24 Oct 2025 07:33:26 -0700 (PDT)
Received: from [10.44.160.74] (e126510-lin.lund.arm.com [10.44.160.74])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D7FEF3F66E;
 Fri, 24 Oct 2025 07:33:25 -0700 (PDT)
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
X-Inumbo-ID: 6bd6138b-b0e6-11f0-980a-7dc792cee155
Message-ID: <f458fbed-266b-48a5-a6e0-745dc2893a34@arm.com>
Date: Fri, 24 Oct 2025 16:33:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/13] mm: enable lazy_mmu sections to nest
To: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
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
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
 <20251015082727.2395128-8-kevin.brodsky@arm.com>
 <2073294c-8003-451a-93e0-9aab81de4d22@redhat.com>
 <7a4e136b-66a5-4244-ab07-f0bcc3a26a83@arm.com>
 <af4414b6-617c-4dc8-bddc-3ea00d1f6f3b@redhat.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <af4414b6-617c-4dc8-bddc-3ea00d1f6f3b@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/10/2025 15:23, David Hildenbrand wrote:
>>>> + * currently enabled.
>>>>     */
>>>>    #ifdef CONFIG_ARCH_LAZY_MMU
>>>>    static inline void lazy_mmu_mode_enable(void)
>>>>    {
>>>> -    arch_enter_lazy_mmu_mode();
>>>> +    struct lazy_mmu_state *state = &current->lazy_mmu_state;
>>>> +
>>>> +    VM_BUG_ON(state->count == U8_MAX);
>>>
>>> No VM_BUG_ON() please.
>>
>> I did wonder if this would be acceptable!
>
> Use VM_WARN_ON_ONCE() and let early testing find any such issues.
>
> VM_* is active in debug kernels only either way! :)

That was my intention - I don't think the checking overhead is justified
in production.

>
> If you'd want to handle this in production kernels you'd need
>
> if (WARN_ON_ONCE()) {
>     /* Try to recover */
> }
>
> And that seems unnecessary/overly-complicated for something that
> should never happen, and if it happens, can be found early during testing.

Got it. Then I guess I'll go for a VM_WARN_ON_ONCE() (because indeed
once the overflow/underflow occurs it'll go wrong on every
enable/disable pair).

>
>>
>> What should we do in case of underflow/overflow then? Saturate or just
>> let it wrap around? If an overflow occurs we're probably in some
>> infinite recursion and we'll crash anyway, but an underflow is likely
>> due to a double disable() and saturating would probably allow to
>> recover.
>>
>>>
>>>> +    /* enable() must not be called while paused */
>>>> +    VM_WARN_ON(state->count > 0 && !state->enabled);
>>>> +
>>>> +    if (state->count == 0) {
>>>> +        arch_enter_lazy_mmu_mode();
>>>> +        state->enabled = true;
>>>> +    }
>>>> +    ++state->count;
>>>
>>> Can do
>>>
>>> if (state->count++ == 0) {
>>
>> My idea here was to have exactly the reverse order between enable() and
>> disable(), so that arch_enter() is called before lazy_mmu_state is
>> updated, and arch_leave() afterwards. arch_* probably shouldn't rely on
>> this (or care), but I liked the symmetry.
>
> I see, but really the arch callback should never have to care about that
> value -- unless something is messed up :)

Fair enough, then I can fold those increments/decrements ;)

- Kevin

