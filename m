Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4A7BF08D6
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 12:33:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146073.1478546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAnCK-0003bU-ND; Mon, 20 Oct 2025 10:33:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146073.1478546; Mon, 20 Oct 2025 10:33:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAnCK-0003a6-KQ; Mon, 20 Oct 2025 10:33:04 +0000
Received: by outflank-mailman (input) for mailman id 1146073;
 Mon, 20 Oct 2025 10:33:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HAV6=45=arm.com=kevin.brodsky@srs-se1.protection.inumbo.net>)
 id 1vAnCJ-0003a0-C6
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 10:33:03 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 24c575cb-ada0-11f0-980a-7dc792cee155;
 Mon, 20 Oct 2025 12:32:57 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C576E1063;
 Mon, 20 Oct 2025 03:32:48 -0700 (PDT)
Received: from [10.57.65.147] (unknown [10.57.65.147])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 924903F63F;
 Mon, 20 Oct 2025 03:32:48 -0700 (PDT)
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
X-Inumbo-ID: 24c575cb-ada0-11f0-980a-7dc792cee155
Message-ID: <2338a99c-665c-4545-accb-c9ebffef45fa@arm.com>
Date: Mon, 20 Oct 2025 12:32:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/13] mm: introduce generic lazy_mmu helpers
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
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
 <20251015082727.2395128-7-kevin.brodsky@arm.com>
 <55f8b155-5468-43fc-b6fc-f509f4becd5b-agordeev@linux.ibm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <55f8b155-5468-43fc-b6fc-f509f4becd5b-agordeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/10/2025 17:54, Alexander Gordeev wrote:
> On Wed, Oct 15, 2025 at 09:27:20AM +0100, Kevin Brodsky wrote:
>
> Hi Kevin,
>
> ...
>> * lazy_mmu_mode_pause() ... lazy_mmu_mode_resume()
>>     This is for situations where the mode is temporarily disabled
>>     by first calling pause() and then resume() (e.g. to prevent any
>>     batching from occurring in a critical section).
> ...
>> +static inline void lazy_mmu_mode_pause(void)
>> +{
>> +	arch_leave_lazy_mmu_mode();
> I think it should have been arch_pause_lazy_mmu_mode(), wich defaults
> to  arch_leave_lazy_mmu_mode(), as we discussed in v2:
>
> https://lore.kernel.org/linux-mm/d407a381-099b-4ec6-a20e-aeff4f3d750f@arm.com/#t

See my comment on patch 7 - these new arch callbacks can easily be
introduced later, I don't see much point in introducing them now if they
default to leave/enter on every architecture.

- Kevin

