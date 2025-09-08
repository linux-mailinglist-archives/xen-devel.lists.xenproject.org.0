Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 453F8B4854B
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 09:32:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1114615.1461456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvWMm-0002q6-BJ; Mon, 08 Sep 2025 07:32:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1114615.1461456; Mon, 08 Sep 2025 07:32:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvWMm-0002oT-6m; Mon, 08 Sep 2025 07:32:44 +0000
Received: by outflank-mailman (input) for mailman id 1114615;
 Mon, 08 Sep 2025 07:32:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g5GF=3T=arm.com=kevin.brodsky@srs-se1.protection.inumbo.net>)
 id 1uvWMk-0002lu-QV
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 07:32:42 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 00a2eb0b-8c86-11f0-9d13-b5c5bf9af7f9;
 Mon, 08 Sep 2025 09:32:41 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88AA2169C;
 Mon,  8 Sep 2025 00:32:32 -0700 (PDT)
Received: from [10.57.58.69] (unknown [10.57.58.69])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CFA563F63F;
 Mon,  8 Sep 2025 00:32:34 -0700 (PDT)
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
X-Inumbo-ID: 00a2eb0b-8c86-11f0-9d13-b5c5bf9af7f9
Message-ID: <1f822d8b-eb46-4998-b1c1-9996d70e1958@arm.com>
Date: Mon, 8 Sep 2025 09:32:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] powerpc/mm: support nested lazy_mmu sections
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
 <20250904125736.3918646-6-kevin.brodsky@arm.com>
 <074ff6ab-5868-4fde-b5bb-9e17632ad817-agordeev@linux.ibm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <074ff6ab-5868-4fde-b5bb-9e17632ad817-agordeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/09/2025 17:52, Alexander Gordeev wrote:
> On Thu, Sep 04, 2025 at 01:57:34PM +0100, Kevin Brodsky wrote:
> ...
>>  static inline lazy_mmu_state_t arch_enter_lazy_mmu_mode(void)
>>  {
>>  	struct ppc64_tlb_batch *batch;
>> +	int lazy_mmu_nested;
>>  
>>  	if (radix_enabled())
>>  		return LAZY_MMU_DEFAULT;
>> @@ -39,9 +40,14 @@ static inline lazy_mmu_state_t arch_enter_lazy_mmu_mode(void)
>>  	 */
>>  	preempt_disable();
>>  	batch = this_cpu_ptr(&ppc64_tlb_batch);
>> -	batch->active = 1;
>> +	lazy_mmu_nested = batch->active;
>>  
>> -	return LAZY_MMU_DEFAULT;
>> +	if (!lazy_mmu_nested) {
> Why not just?
>
> 	if (!batch->active) {

Very fair question! I think the extra variable made sense in an earlier
version of that patch, but now it's used only once and doesn't really
improve readability either. Will remove it in v2, also in patch 6
(basically the same code). Thanks!

- Kevin

