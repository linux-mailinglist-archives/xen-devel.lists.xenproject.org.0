Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F37B51D2D
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 18:12:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1118604.1464327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwNQW-00057h-E6; Wed, 10 Sep 2025 16:12:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1118604.1464327; Wed, 10 Sep 2025 16:12:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwNQW-00055F-BN; Wed, 10 Sep 2025 16:12:08 +0000
Received: by outflank-mailman (input) for mailman id 1118604;
 Wed, 10 Sep 2025 16:12:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4bPx=3V=arm.com=kevin.brodsky@srs-se1.protection.inumbo.net>)
 id 1uwNQU-000559-Hh
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 16:12:06 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id e448d7d4-8e60-11f0-9d13-b5c5bf9af7f9;
 Wed, 10 Sep 2025 18:12:05 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B91C716F2;
 Wed, 10 Sep 2025 09:11:55 -0700 (PDT)
Received: from [10.57.67.148] (unknown [10.57.67.148])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F3D43F63F;
 Wed, 10 Sep 2025 09:11:56 -0700 (PDT)
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
X-Inumbo-ID: e448d7d4-8e60-11f0-9d13-b5c5bf9af7f9
Message-ID: <250835cd-f07a-4b8a-bc01-ace24b407efc@arm.com>
Date: Wed, 10 Sep 2025 18:11:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] mm: introduce local state for lazy_mmu sections
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Andreas Larsson <andreas@gaisler.com>,
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
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
 Mark Rutland <Mark.Rutland@arm.com>
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
 <20250908073931.4159362-3-kevin.brodsky@arm.com>
 <d23ea683-cca4-4973-88b1-4f6fd9b22314@redhat.com>
 <ca2054ad-b163-4e61-8ec4-6f2e36461628-agordeev@linux.ibm.com>
 <e7acb889-1fe9-4db3-acf4-39f4960e8ccd@redhat.com>
 <2fecfae7-1140-4a23-a352-9fd339fcbae5-agordeev@linux.ibm.com>
 <e521b1f4-3f2b-48cd-9568-b9a4cf4c4830@redhat.com>
 <47ee1df7-1602-4200-af94-475f84ca8d80@arm.com>
 <b2e52967-7ca1-411e-9c66-8d3483624ca7-agordeev@linux.ibm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <b2e52967-7ca1-411e-9c66-8d3483624ca7-agordeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/09/2025 16:38, Alexander Gordeev wrote:
>>>>> Would that integrate well with LAZY_MMU_DEFAULT etc?
>>>> Hmm... I though the idea is to use LAZY_MMU_* by architectures that
>>>> want to use it - at least that is how I read the description above.
>>>>
>>>> It is only kasan_populate|depopulate_vmalloc_pte() in generic code
>>>> that do not follow this pattern, and it looks as a problem to me.
>> This discussion also made me realise that this is problematic, as the
>> LAZY_MMU_{DEFAULT,NESTED} macros were meant only for architectures'
>> convenience, not for generic code (where lazy_mmu_state_t should ideally
>> be an opaque type as mentioned above). It almost feels like the kasan
>> case deserves a different API, because this is not how enter() and
>> leave() are meant to be used. This would mean quite a bit of churn
>> though, so maybe just introduce another arch-defined value to pass to
>> leave() for such a situation - for instance,
>> arch_leave_lazy_mmu_mode(LAZY_MMU_FLUSH)?
> What about to adjust the semantics of apply_to_page_range() instead?
>
> It currently assumes any caller is fine with apply_to_pte_range() to
> enter the lazy mode. By contrast, kasan_(de)populate_vmalloc_pte() are
> not fine at all and must leave the lazy mode. That literally suggests
> the original assumption is incorrect.
>
> We could change int apply_to_pte_range(..., bool create, ...) to e.g.
> apply_to_pte_range(..., unsigned int flags, ...) and introduce a flag
> that simply skips entering the lazy mmu mode.

This is pretty much what Ryan proposed [1r] some time ago, although for
a different purpose (avoiding nesting). There wasn't much appetite for
it then, but I agree that this would be a more logical way to go about it.

- Kevin

[1r]
https://lore.kernel.org/all/20250530140446.2387131-4-ryan.roberts@arm.com/

