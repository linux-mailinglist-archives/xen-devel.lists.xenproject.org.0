Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C5DC2D069
	for <lists+xen-devel@lfdr.de>; Mon, 03 Nov 2025 17:14:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155425.1484920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFxCD-0002AZ-LX; Mon, 03 Nov 2025 16:14:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155425.1484920; Mon, 03 Nov 2025 16:14:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFxCD-00027w-IS; Mon, 03 Nov 2025 16:14:17 +0000
Received: by outflank-mailman (input) for mailman id 1155425;
 Mon, 03 Nov 2025 16:11:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j3Hq=5L=kernel.org=david@srs-se1.protection.inumbo.net>)
 id 1vFx9R-00024e-6J
 for xen-devel@lists.xenproject.org; Mon, 03 Nov 2025 16:11:25 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id babde6dd-b8cf-11f0-980a-7dc792cee155;
 Mon, 03 Nov 2025 17:11:19 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CF01A43237;
 Mon,  3 Nov 2025 16:11:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A46CC4CEE7;
 Mon,  3 Nov 2025 16:11:08 +0000 (UTC)
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
X-Inumbo-ID: babde6dd-b8cf-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762186276;
	bh=V1CU9ZdjaPBn/WuqIoDgCoBVzQIejoJ47+/3Iu7JZPI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=npyBUuqjUIKg4InV+qpRD6OtpMB4/GHdS8B1NFF+Q9yYKiP+sb3TgKsbqJH8Sa1rZ
	 IjmKf10sHhPZ9tJBExNMfKK9yT/VFR2YIZ9V/xn9DQdnHw+celZDegZhXdLQrF/SN5
	 lUex3DQHMkchog6zMIgVbKEfsJTbKokiYZLXNK0+peJ+RcXLboT6AnCcS4v+iq0vdd
	 UNq+DePKElJQaoqkKpkF65sYRbAzqC1oOL9GKK49eQoY+wljWRBdmHyv0D0R45C04e
	 nEuXWJ5n/3CnJfkZVAWRCYTclKE+cKq52lFKq1tbquYMBGM5LejdtS3JnqVMyuKIJJ
	 wBZRvG6pryrXw==
Message-ID: <15381b5c-726f-4eda-8ffd-c95c0acd7635@kernel.org>
Date: Mon, 3 Nov 2025 17:11:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/12] sparc/mm: replace batch->active with
 in_lazy_mmu_mode()
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
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
 <20251029100909.3381140-11-kevin.brodsky@arm.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20251029100909.3381140-11-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29.10.25 11:09, Kevin Brodsky wrote:
> A per-CPU batch struct is activated when entering lazy MMU mode; its
> lifetime is the same as the lazy MMU section (it is deactivated when
> leaving the mode). Preemption is disabled in that interval to ensure
> that the per-CPU reference remains valid.
> 
> The generic lazy_mmu layer now tracks whether a task is in lazy MMU
> mode. We can therefore use the generic helper in_lazy_mmu_mode()
> to tell whether a batch struct is active instead of tracking it
> explicitly.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>   arch/sparc/include/asm/tlbflush_64.h | 1 -
>   arch/sparc/mm/tlb.c                  | 9 +--------
>   2 files changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/arch/sparc/include/asm/tlbflush_64.h b/arch/sparc/include/asm/tlbflush_64.h
> index 4e1036728e2f..6133306ba59a 100644
> --- a/arch/sparc/include/asm/tlbflush_64.h
> +++ b/arch/sparc/include/asm/tlbflush_64.h
> @@ -12,7 +12,6 @@ struct tlb_batch {
>   	unsigned int hugepage_shift;
>   	struct mm_struct *mm;
>   	unsigned long tlb_nr;
> -	unsigned long active;
>   	unsigned long vaddrs[TLB_BATCH_NR];
>   };
>   
> diff --git a/arch/sparc/mm/tlb.c b/arch/sparc/mm/tlb.c
> index 7b5dfcdb1243..879e22c86e5c 100644
> --- a/arch/sparc/mm/tlb.c
> +++ b/arch/sparc/mm/tlb.c
> @@ -52,11 +52,7 @@ void flush_tlb_pending(void)
>   
>   void arch_enter_lazy_mmu_mode(void)
>   {
> -	struct tlb_batch *tb;
> -
>   	preempt_disable();
> -	tb = this_cpu_ptr(&tlb_batch);
> -	tb->active = 1;
>   }
>   
>   void arch_flush_lazy_mmu_mode(void)
> @@ -69,10 +65,7 @@ void arch_flush_lazy_mmu_mode(void)
>   
>   void arch_leave_lazy_mmu_mode(void)
>   {
> -	struct tlb_batch *tb = this_cpu_ptr(&tlb_batch);
> -
>   	arch_flush_lazy_mmu_mode();
> -	tb->active = 0;
>   	preempt_enable();
>   }
>   
> @@ -93,7 +86,7 @@ static void tlb_batch_add_one(struct mm_struct *mm, unsigned long vaddr,
>   		nr = 0;
>   	}
>   
> -	if (!tb->active) {
> +	if (!in_lazy_mmu_mode()) {
>   		flush_tsb_user_page(mm, vaddr, hugepage_shift);
>   		global_flush_tlb_page(mm, vaddr);
>   		goto out;

(messing up my transition to the email address as Thunderbird defaults 
to my old one still on mails received through RH servers)

Did we get this tested with some help from sparc64 folks?

Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>

-- 
Cheers

David


