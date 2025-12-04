Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DA4CA376E
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 12:40:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177566.1501819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR7gG-0005qE-O8; Thu, 04 Dec 2025 11:39:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177566.1501819; Thu, 04 Dec 2025 11:39:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR7gG-0005ol-KO; Thu, 04 Dec 2025 11:39:28 +0000
Received: by outflank-mailman (input) for mailman id 1177566;
 Thu, 04 Dec 2025 11:39:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8NnK=6K=kernel.org=david@srs-se1.protection.inumbo.net>)
 id 1vR7gE-0005od-IT
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 11:39:26 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e19b5688-d105-11f0-9d1a-b5c5bf9af7f9;
 Thu, 04 Dec 2025 12:39:24 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0DC21601E2;
 Thu,  4 Dec 2025 11:39:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D03C3C4CEFB;
 Thu,  4 Dec 2025 11:39:12 +0000 (UTC)
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
X-Inumbo-ID: e19b5688-d105-11f0-9d1a-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764848362;
	bh=oGOR/Gy9sovZXJOpLcgTuOfyjEMxsxmxhHmHgTDnlvg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PE+WiSnZpBNNRcaVS0QWTpayXH+dWoN5nt+357dXYUJWSjuOlaAsOBoe3SqzwB59R
	 0BhfuC55fmyIKS+5sWgvrif65X9dIQNyx1j8zScdnb4JsSuXTbZHZKOdhJztBH13oI
	 Z2xVQUclq5bzMcDG9oXYqty7pxfA/Wou/aR2Tjfhg2wQpAVF58f5Wxsu7+lh42EsgU
	 tzePMKUtQaqGs3/m7uKwUZJa+NFZNeb3W7vSvEYI4cegv0lxJrfu/RurxuRx1OGmTe
	 IzJrQ0kiAZGVJ74Dcu7D6yrF3jlh37vFw4mnVpHVXtFq7j5uuCInmCGOIVhoeMwI7Z
	 muM8WetLK5bJw==
Message-ID: <b341e7fa-4382-48b5-896a-1a0d347b66ca@kernel.org>
Date: Thu, 4 Dec 2025 12:39:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/12] arm64: mm: replace TIF_LAZY_MMU with
 in_lazy_mmu_mode()
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
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
 Peter Zijlstra <peterz@infradead.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251124132228.622678-1-kevin.brodsky@arm.com>
 <20251124132228.622678-10-kevin.brodsky@arm.com>
 <89ecddb7-83ee-427b-823b-984204939ecf@arm.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <89ecddb7-83ee-427b-823b-984204939ecf@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/4/25 07:52, Anshuman Khandual wrote:
> On 24/11/25 6:52 PM, Kevin Brodsky wrote:
>> The generic lazy_mmu layer now tracks whether a task is in lazy MMU
>> mode. As a result we no longer need a TIF flag for that purpose -
>> let's use the new in_lazy_mmu_mode() helper instead.
>>
>> The explicit check for in_interrupt() is no longer necessary either
>> as in_lazy_mmu_mode() always returns false in interrupt context.
>>
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> ---
>>   arch/arm64/include/asm/pgtable.h     | 19 +++----------------
>>   arch/arm64/include/asm/thread_info.h |  3 +--
>>   2 files changed, 4 insertions(+), 18 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>> index a7d99dee3dc4..dd7ed653a20d 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -62,28 +62,16 @@ static inline void emit_pte_barriers(void)
>>   
>>   static inline void queue_pte_barriers(void)
>>   {
>> -	unsigned long flags;
>> -
>> -	if (in_interrupt()) {
>> -		emit_pte_barriers();
>> -		return;
>> -	}
>> -
>> -	flags = read_thread_flags();
>> -
>> -	if (flags & BIT(TIF_LAZY_MMU)) {
>> +	if (in_lazy_mmu_mode()) {
>>   		/* Avoid the atomic op if already set. */
>> -		if (!(flags & BIT(TIF_LAZY_MMU_PENDING)))
>> +		if (!test_thread_flag(TIF_LAZY_MMU_PENDING))
> 
> A small nit - will it be better not to use test_thread_flag() here and just
> keep checking flags like earlier to avoid non-related changes. Although not
> a problem TBH.

I'd assume the existing code wanted to avoid fetching the flags two 
times? So switching to test_thread_flag() should be fine now.

-- 
Cheers

David

