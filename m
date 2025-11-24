Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D19C808F9
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 13:48:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170829.1495857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVzF-0000Lg-Jy; Mon, 24 Nov 2025 12:48:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170829.1495857; Mon, 24 Nov 2025 12:48:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVzF-0000JL-HO; Mon, 24 Nov 2025 12:48:09 +0000
Received: by outflank-mailman (input) for mailman id 1170829;
 Mon, 24 Nov 2025 12:48:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H9wV=6A=arm.com=kevin.brodsky@srs-se1.protection.inumbo.net>)
 id 1vNVzD-0000JF-Jb
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 12:48:07 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id d219ee48-c933-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 13:48:05 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57038497;
 Mon, 24 Nov 2025 04:47:57 -0800 (PST)
Received: from [10.57.40.193] (unknown [10.57.40.193])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AEF4F3F6A8;
 Mon, 24 Nov 2025 04:47:56 -0800 (PST)
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
X-Inumbo-ID: d219ee48-c933-11f0-9d18-b5c5bf9af7f9
Message-ID: <f36ebc15-c724-487a-8e4a-9ca95edc544a@arm.com>
Date: Mon, 24 Nov 2025 13:47:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/12] mm: introduce generic lazy_mmu helpers
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>, linux-mm@kvack.org
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
 Peter Zijlstra <peterz@infradead.org>, Suren Baghdasaryan
 <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-7-kevin.brodsky@arm.com>
 <71418b31-aedb-4600-9558-842515dd6c44@arm.com>
 <b44825dd-aef9-4d3e-91fd-a44122264c23@arm.com>
Content-Language: en-GB
In-Reply-To: <b44825dd-aef9-4d3e-91fd-a44122264c23@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/11/2025 11:45, Kevin Brodsky wrote:
>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>>> index b8d37eb037fc..d9c8e94f140f 100644
>>> --- a/arch/arm64/mm/mmu.c
>>> +++ b/arch/arm64/mm/mmu.c
>>> @@ -731,7 +731,7 @@ int split_kernel_leaf_mapping(unsigned long start, unsigned long end)
>>>  		return -EINVAL;
>>>  
>>>  	mutex_lock(&pgtable_split_lock);
>>> -	arch_enter_lazy_mmu_mode();
>>> +	lazy_mmu_mode_enable();
>>>  
>>>  	/*
>>>  	 * The split_kernel_leaf_mapping_locked() may sleep, it is not a
>> This is a bit unfortunate, IMHO. The rest of this comment explains that although
>> you're not supposed to sleep inside lazy mmu mode, it's fine for arm64's
>> implementation. But we are no longer calling arm64's implementation; we are
>> calling a generic function, which does who knows what.
>>
>> I think it all still works, but we are no longer containing our assumptions in
>> arm64 code. We are relying on implementation details of generic code.
> I see your point. The change itself is still correct (and required
> considering patch 8), but maybe the documentation of the generic
> interface should be clarified to guarantee that the generic layer can
> itself cope with sleeping - without any guarantee regarding the
> behaviour of arch_*_lazy_mmu_mode.

Re-reading the existing comment in <linux/pgtable.h>, I think it already
makes clear that sleeping is not forbidden by design:

>  * In the general case, no lock is guaranteed to be held between entry
> and exit
>  * of the lazy mode. So the implementation must assume preemption may
> be enabled
>  * and cpu migration is possible; it must take steps to be robust
> against this.

The arch implementation may disable preemption, but arm64 code can rely
on the arm64 implementation allowing sleeping.

- Kevin


