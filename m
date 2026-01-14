Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC9DD1CCCE
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 08:21:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202527.1518059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfvBt-0004w4-V2; Wed, 14 Jan 2026 07:21:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202527.1518059; Wed, 14 Jan 2026 07:21:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfvBt-0004tt-SV; Wed, 14 Jan 2026 07:21:17 +0000
Received: by outflank-mailman (input) for mailman id 1202527;
 Wed, 14 Jan 2026 07:21:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EFsb=7T=gaisler.com=andreas@srs-se1.protection.inumbo.net>)
 id 1vfvBs-0004tk-Vb
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 07:21:16 +0000
Received: from smtp-out3.simply.com (smtp-out3.simply.com [94.231.106.210])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c2c0307-f119-11f0-9ccf-f158ae23cfc8;
 Wed, 14 Jan 2026 08:21:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by smtp.simply.com (Simply.com) with ESMTP id 4drcwp38sWz1DR2b;
 Wed, 14 Jan 2026 08:21:14 +0100 (CET)
Received: from [192.168.0.25] (h-98-128-223-123.NA.cust.bahnhof.se
 [98.128.223.123])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by smtp.simply.com (Simply.com) with ESMTPSA id 4drcwm54NNz1DDXY;
 Wed, 14 Jan 2026 08:21:12 +0100 (CET)
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
X-Inumbo-ID: 9c2c0307-f119-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gaisler.com;
	s=simplycom2; t=1768375274;
	bh=USGtV3+n93v8pp6pT/3Zgm6YGfywpo0PJVEBtkCCeSQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=GLYRdRw6BcVYpXpDzS8ZqYhxtT7bZEqyt6FuYL8Og+uuX6KmBzkodf4AAzTgQK8Vj
	 6QbBYuy/EUx3fCM7vga1p7zdd9seT9SSuJ28fck7TvCAs/Gwc0UpWogq+FDfeMLhxP
	 Q9tIWi9KAy3JY7vvXnVldebdrOSI6/xQmw6aZqkHZJU9FXjDY0poTHU/LzOD1ekgYF
	 2nFh0u8d2uWVggyereuQ0MAq07iXxOjlDmJmNDlViRxcJ4I2srsAz+uaxP1y7echmT
	 rgWILKmtxf/xBcRfC4IBmOKjPaCa/8zHfl4NRJCZIC9TqeetLFcYzLPvsXlK9du/pk
	 oxIYdU3UlZQgw==
Message-ID: <544172e4-cdf7-4789-8cad-4dc3c498e497@gaisler.com>
Date: Wed, 14 Jan 2026 08:21:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/14] sparc/mm: replace batch->active with
 is_lazy_mmu_mode_active()
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
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
 Peter Zijlstra <peterz@infradead.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org,
 "David Hildenbrand (Red Hat)" <david@kernel.org>
References: <20251215150323.2218608-1-kevin.brodsky@arm.com>
 <20251215150323.2218608-13-kevin.brodsky@arm.com>
Content-Language: en-US
From: Andreas Larsson <andreas@gaisler.com>
In-Reply-To: <20251215150323.2218608-13-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025-12-15 16:03, Kevin Brodsky wrote:
> A per-CPU batch struct is activated when entering lazy MMU mode; its
> lifetime is the same as the lazy MMU section (it is deactivated when
> leaving the mode). Preemption is disabled in that interval to ensure
> that the per-CPU reference remains valid.
> 
> The generic lazy_mmu layer now tracks whether a task is in lazy MMU
> mode. We can therefore use the generic helper
> is_lazy_mmu_mode_active() to tell whether a batch struct is active
> instead of tracking it explicitly.
> 
> Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  arch/sparc/include/asm/tlbflush_64.h | 1 -
>  arch/sparc/mm/tlb.c                  | 9 +--------
>  2 files changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/arch/sparc/include/asm/tlbflush_64.h b/arch/sparc/include/asm/tlbflush_64.h
> index 4e1036728e2f..6133306ba59a 100644
> --- a/arch/sparc/include/asm/tlbflush_64.h
> +++ b/arch/sparc/include/asm/tlbflush_64.h
> @@ -12,7 +12,6 @@ struct tlb_batch {
>  	unsigned int hugepage_shift;
>  	struct mm_struct *mm;
>  	unsigned long tlb_nr;
> -	unsigned long active;
>  	unsigned long vaddrs[TLB_BATCH_NR];
>  };
>  
> diff --git a/arch/sparc/mm/tlb.c b/arch/sparc/mm/tlb.c
> index 7b5dfcdb1243..3a852071d260 100644
> --- a/arch/sparc/mm/tlb.c
> +++ b/arch/sparc/mm/tlb.c
> @@ -52,11 +52,7 @@ void flush_tlb_pending(void)
>  
>  void arch_enter_lazy_mmu_mode(void)
>  {
> -	struct tlb_batch *tb;
> -
>  	preempt_disable();
> -	tb = this_cpu_ptr(&tlb_batch);
> -	tb->active = 1;
>  }
>  
>  void arch_flush_lazy_mmu_mode(void)
> @@ -69,10 +65,7 @@ void arch_flush_lazy_mmu_mode(void)
>  
>  void arch_leave_lazy_mmu_mode(void)
>  {
> -	struct tlb_batch *tb = this_cpu_ptr(&tlb_batch);
> -
>  	arch_flush_lazy_mmu_mode();
> -	tb->active = 0;
>  	preempt_enable();
>  }
>  
> @@ -93,7 +86,7 @@ static void tlb_batch_add_one(struct mm_struct *mm, unsigned long vaddr,
>  		nr = 0;
>  	}
>  
> -	if (!tb->active) {
> +	if (!is_lazy_mmu_mode_active()) {
>  		flush_tsb_user_page(mm, vaddr, hugepage_shift);
>  		global_flush_tlb_page(mm, vaddr);
>  		goto out;

Acked-by: Andreas Larsson <andreas@gaisler.com>

Cheers,
Andreas


