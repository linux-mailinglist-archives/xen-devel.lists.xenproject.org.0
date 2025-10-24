Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B9CC062D3
	for <lists+xen-devel@lfdr.de>; Fri, 24 Oct 2025 14:10:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1150097.1481362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCGc0-0004iP-9P; Fri, 24 Oct 2025 12:09:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1150097.1481362; Fri, 24 Oct 2025 12:09:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCGc0-0004g2-6L; Fri, 24 Oct 2025 12:09:40 +0000
Received: by outflank-mailman (input) for mailman id 1150097;
 Fri, 24 Oct 2025 12:09:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rNzd=5B=arm.com=kevin.brodsky@srs-se1.protection.inumbo.net>)
 id 1vCGby-0004ft-Rl
 for xen-devel@lists.xenproject.org; Fri, 24 Oct 2025 12:09:38 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 4cfdf048-b0d2-11f0-980a-7dc792cee155;
 Fri, 24 Oct 2025 14:09:33 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C614106F;
 Fri, 24 Oct 2025 05:09:24 -0700 (PDT)
Received: from [10.44.160.74] (e126510-lin.lund.arm.com [10.44.160.74])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1BA303F66E;
 Fri, 24 Oct 2025 05:09:24 -0700 (PDT)
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
X-Inumbo-ID: 4cfdf048-b0d2-11f0-980a-7dc792cee155
Message-ID: <604f26cb-46c6-4533-8110-0b174eed821d@arm.com>
Date: Fri, 24 Oct 2025 14:09:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/13] powerpc/mm: implement arch_flush_lazy_mmu_mode()
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
 <20251015082727.2395128-4-kevin.brodsky@arm.com>
 <60c55686-87dd-46d0-884e-80f7d423663b@redhat.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <60c55686-87dd-46d0-884e-80f7d423663b@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/10/2025 21:36, David Hildenbrand wrote:
> On 15.10.25 10:27, Kevin Brodsky wrote:
>> [...]
>>
>> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
>> b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
>> index 146287d9580f..7704dbe8e88d 100644
>> --- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
>> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
>> @@ -41,6 +41,16 @@ static inline void arch_enter_lazy_mmu_mode(void)
>>       batch->active = 1;
>>   }
>>   +static inline void arch_flush_lazy_mmu_mode(void)
>> +{
>> +    struct ppc64_tlb_batch *batch;
>> +
>> +    batch = this_cpu_ptr(&ppc64_tlb_batch);
>
> The downside is the double this_cpu_ptr() now on the
> arch_leave_lazy_mmu_mode() path.

This is only temporary, patch 9 removes it from arch_enter(). I don't
think having a redundant this_cpu_ptr() for a few commits is really a
concern?

Same idea for patch 4/10.

- Kevin

