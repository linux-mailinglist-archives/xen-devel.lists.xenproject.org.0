Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4985BB48548
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 09:32:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1114612.1461446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvWMV-0002W7-2l; Mon, 08 Sep 2025 07:32:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1114612.1461446; Mon, 08 Sep 2025 07:32:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvWMV-0002TL-02; Mon, 08 Sep 2025 07:32:27 +0000
Received: by outflank-mailman (input) for mailman id 1114612;
 Mon, 08 Sep 2025 07:32:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g5GF=3T=arm.com=kevin.brodsky@srs-se1.protection.inumbo.net>)
 id 1uvWMT-0002TF-3U
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 07:32:25 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id f3651fed-8c85-11f0-9809-7dc792cee155;
 Mon, 08 Sep 2025 09:32:19 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F1201692;
 Mon,  8 Sep 2025 00:32:10 -0700 (PDT)
Received: from [10.57.58.69] (unknown [10.57.58.69])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A2713F63F;
 Mon,  8 Sep 2025 00:32:12 -0700 (PDT)
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
X-Inumbo-ID: f3651fed-8c85-11f0-9809-7dc792cee155
Message-ID: <16a63f8a-fe9f-4a65-be45-7260858734bd@arm.com>
Date: Mon, 8 Sep 2025 09:32:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] x86/xen: support nested lazy_mmu sections (again)
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
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20250904125736.3918646-1-kevin.brodsky@arm.com>
 <20250904125736.3918646-5-kevin.brodsky@arm.com>
 <d3adc2a0-5888-411e-ac7c-9df45e3389c9-agordeev@linux.ibm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <d3adc2a0-5888-411e-ac7c-9df45e3389c9-agordeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/09/2025 17:48, Alexander Gordeev wrote:
> On Thu, Sep 04, 2025 at 01:57:33PM +0100, Kevin Brodsky wrote:
> ...
>> -static void xen_enter_lazy_mmu(void)
>> +static lazy_mmu_state_t xen_enter_lazy_mmu(void)
>>  {
>> +	if (this_cpu_read(xen_lazy_mode) == XEN_LAZY_MMU)
>> +		return LAZY_MMU_NESTED;
>> +
>>  	enter_lazy(XEN_LAZY_MMU);
>> +	return LAZY_MMU_DEFAULT;
>>  }
>>  
>>  static void xen_flush_lazy_mmu(void)
>> @@ -2167,11 +2171,12 @@ static void __init xen_post_allocator_init(void)
>>  	pv_ops.mmu.write_cr3 = &xen_write_cr3;
>>  }
>>  
>> -static void xen_leave_lazy_mmu(void)
>> +static void xen_leave_lazy_mmu(lazy_mmu_state_t state)
>>  {
>>  	preempt_disable();
>>  	xen_mc_flush();
>> -	leave_lazy(XEN_LAZY_MMU);
>> +	if (state != LAZY_MMU_NESTED)
>> +		leave_lazy(XEN_LAZY_MMU);
> Based on xen_enter_lazy_mmu(), whether this condition needs to be
> executed with the preemption disabled?

AFAIU xen_mc_flush() needs preemption to be disabled. I don't think
{enter,leave}_lazy() do, but this patch doesn't introduce any change
from that perspective. I suppose it doesn't hurt that
xen_leave_lazy_mmu() calls leave_lazy() with preemption disabled.

> Or may be this_cpu_read(xen_lazy_mode) + enter_lazy(XEN_LAZY_MMU)
> should be executed with the preemption disabled?

Adding another this_cpu_read(xen_lazy_mode) in xen_enter_lazy_mmu()
shouldn't change the situation, i.e. preemption should still be safe. If
preemption occurs in the middle of that function,
xen_{start,end}_context_switch() will do the right thing to save/restore
xen_lazy_mode.

- Kevin

