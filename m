Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD5BC30BF5
	for <lists+xen-devel@lfdr.de>; Tue, 04 Nov 2025 12:33:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155710.1485151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGFHq-00082X-61; Tue, 04 Nov 2025 11:33:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155710.1485151; Tue, 04 Nov 2025 11:33:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGFHq-00080A-3D; Tue, 04 Nov 2025 11:33:18 +0000
Received: by outflank-mailman (input) for mailman id 1155710;
 Tue, 04 Nov 2025 11:33:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pTF1=5M=arm.com=kevin.brodsky@srs-se1.protection.inumbo.net>)
 id 1vGFHo-000802-7q
 for xen-devel@lists.xenproject.org; Tue, 04 Nov 2025 11:33:16 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 0ce81fd0-b972-11f0-9d16-b5c5bf9af7f9;
 Tue, 04 Nov 2025 12:33:14 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D06201C2B;
 Tue,  4 Nov 2025 03:33:05 -0800 (PST)
Received: from [10.1.38.100] (e126510-lin.cambridge.arm.com [10.1.38.100])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C979F3F63F;
 Tue,  4 Nov 2025 03:33:06 -0800 (PST)
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
X-Inumbo-ID: 0ce81fd0-b972-11f0-9d16-b5c5bf9af7f9
Message-ID: <e3326a9c-108a-4eb2-b12e-bff2b5edd1d3@arm.com>
Date: Tue, 4 Nov 2025 11:33:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/12] powerpc/mm: replace batch->active with
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
 <20251029100909.3381140-10-kevin.brodsky@arm.com>
 <05e2062c-1689-44e7-9cc6-697646ca075d@redhat.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <05e2062c-1689-44e7-9cc6-697646ca075d@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/11/2025 16:05, David Hildenbrand wrote:
> On 29.10.25 11:09, Kevin Brodsky wrote:
>> A per-CPU batch struct is activated when entering lazy MMU mode; its
>> lifetime is the same as the lazy MMU section (it is deactivated when
>> leaving the mode). Preemption is disabled in that interval to ensure
>> that the per-CPU reference remains valid.
>>
>> The generic lazy_mmu layer now tracks whether a task is in lazy MMU
>> mode. We can therefore use the generic helper in_lazy_mmu_mode()
>> to tell whether a batch struct is active instead of tracking it
>> explicitly.
>>
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> ---
>
> I suspect you were not able to test this on real HW. Some help from
> the ppc folks would be appreciated.

Indeed, it would be nice to get some testing on ppc HW that actually
uses lazy MMU (!radix_enabled()).

>
> LGTM, but the interaction with pause/resume adds a bit of complication
> on top.

Does it? This series doesn't change when arch_enter() and arch_leave()
are called, batch->active and in_lazy_mmu_mode() should coincide. 

- Kevin

