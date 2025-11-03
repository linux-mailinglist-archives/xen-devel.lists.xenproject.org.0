Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D858C2D989
	for <lists+xen-devel@lfdr.de>; Mon, 03 Nov 2025 19:09:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155505.1484972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFyzH-0001gM-Js; Mon, 03 Nov 2025 18:09:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155505.1484972; Mon, 03 Nov 2025 18:09:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFyzH-0001dm-H4; Mon, 03 Nov 2025 18:09:03 +0000
Received: by outflank-mailman (input) for mailman id 1155505;
 Mon, 03 Nov 2025 18:09:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=10XO=5L=arm.com=kevin.brodsky@srs-se1.protection.inumbo.net>)
 id 1vFyzF-0001de-V1
 for xen-devel@lists.xenproject.org; Mon, 03 Nov 2025 18:09:01 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 2a154c50-b8e0-11f0-9d16-b5c5bf9af7f9;
 Mon, 03 Nov 2025 19:08:57 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DBAF2A6B;
 Mon,  3 Nov 2025 10:08:48 -0800 (PST)
Received: from [10.1.30.16] (unknown [10.1.30.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 463A43F694;
 Mon,  3 Nov 2025 10:08:48 -0800 (PST)
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
X-Inumbo-ID: 2a154c50-b8e0-11f0-9d16-b5c5bf9af7f9
Message-ID: <1965fe85-3734-45e9-af89-651c65845e8a@arm.com>
Date: Mon, 3 Nov 2025 18:08:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/12] mm: enable lazy_mmu sections to nest
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
 <20251029100909.3381140-8-kevin.brodsky@arm.com>
 <ae1236da-2647-4d53-bf4d-ff8fc32eb734@redhat.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <ae1236da-2647-4d53-bf4d-ff8fc32eb734@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/11/2025 12:22, David Hildenbrand wrote:
>
>>   static inline void lazy_mmu_mode_pause(void)
>>   {
>> +    struct lazy_mmu_state *state = &current->lazy_mmu_state;
>> +
>> +    VM_WARN_ON(state->nesting_level == 0 || !state->active);
>> +
>> +    state->active = false;
>>       arch_leave_lazy_mmu_mode();
>
> Just one question:
>
> Don't we want to allow for pause/resume when not enabled? Would seem
> valid to me, because pause/resume code should actually not worry about
> that, right?

This does sound sensible, thanks for the suggestion. The initial goal
was to allow functions that know they're called with lazy MMU enabled to
be able to pause it temporarily if they need batching disabled. But we
could generalise this to: if you know batching would break things, then
you can preemptively add a pause/resume pair, and it won't do anything
unless you're called with lazy MMU enabled.

I also like this as this removes an invalid usage situation - now as
long as you have balanced enable/disable and pause/resume calls, you're
good. Will make that change in v5.

- Kevin

>
> if (!state->nesting_level) {
>     VM_WARN_ON(state->active);
>     return;
> }
> VM_WARN_ON(!state->active);
> state->active = false;
> arch_leave_lazy_mmu_mode();
>

