Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F889BECCE9
	for <lists+xen-devel@lfdr.de>; Sat, 18 Oct 2025 11:53:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1145559.1478426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vA3cg-0001Mq-Q3; Sat, 18 Oct 2025 09:53:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1145559.1478426; Sat, 18 Oct 2025 09:53:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vA3cg-0001KP-N9; Sat, 18 Oct 2025 09:53:14 +0000
Received: by outflank-mailman (input) for mailman id 1145559;
 Sat, 18 Oct 2025 09:53:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5sd8=43=kernel.org=rppt@srs-se1.protection.inumbo.net>)
 id 1vA3cg-0001KJ-5o
 for xen-devel@lists.xenproject.org; Sat, 18 Oct 2025 09:53:14 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 421bb110-ac08-11f0-9d15-b5c5bf9af7f9;
 Sat, 18 Oct 2025 11:53:12 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A913045000;
 Sat, 18 Oct 2025 09:53:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A979DC113D0;
 Sat, 18 Oct 2025 09:52:59 +0000 (UTC)
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
X-Inumbo-ID: 421bb110-ac08-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760781190;
	bh=bOSmYzha9caq7PhodKTKcCoPiLt+2LlIcLfZyClR6tI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PVM7dGcEYXCuz8kq+FQlif5GkokSxvCHTzAFAGwTnR8/6weD/vKEUQASmePsYFC3h
	 +euqjGf0PMyAFk0ZJUt5YM7wZxnuKR0UvscN4IWjm71nso3T24TfhImRIqQfyI4ss6
	 cv+7XmuLUObCGPTep6i88M7y6u+ifbhyfVbe1BHS4zD5ALzPNDk/kx15zhKRwL0t27
	 dMmFhLM5KTioGdUJieNshqGCPzeMSFbHvJviFEJxzNeYiuG1A5BFkxDb8ilKL2vLrA
	 8jv3n05kf1if0vj2NPnC/QhhCj3HuD1WtyN73Zhx+EyOOZxPqW3faoSHxWvYSohg6r
	 KlyEFQZJR/qhA==
Date: Sat, 18 Oct 2025 12:52:55 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
	Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>, Nicholas Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
	x86@kernel.org
Subject: Re: [PATCH v3 05/13] mm: introduce CONFIG_ARCH_LAZY_MMU
Message-ID: <aPNjd2dg3YN-TZKH@kernel.org>
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
 <20251015082727.2395128-6-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015082727.2395128-6-kevin.brodsky@arm.com>

On Wed, Oct 15, 2025 at 09:27:19AM +0100, Kevin Brodsky wrote:
> Architectures currently opt in for implementing lazy_mmu helpers by
> defining __HAVE_ARCH_ENTER_LAZY_MMU_MODE.
> 
> In preparation for introducing a generic lazy_mmu layer that will
> require storage in task_struct, let's switch to a cleaner approach:
> instead of defining a macro, select a CONFIG option.
> 
> This patch introduces CONFIG_ARCH_LAZY_MMU and has each arch select
> it when it implements lazy_mmu helpers.
> __HAVE_ARCH_ENTER_LAZY_MMU_MODE is removed and <linux/pgtable.h>
> relies on the new CONFIG instead.
> 
> On x86, lazy_mmu helpers are only implemented if PARAVIRT_XXL is
> selected. This creates some complications in arch/x86/boot/, because
> a few files manually undefine PARAVIRT* options. As a result
> <asm/paravirt.h> does not define the lazy_mmu helpers, but this
> breaks the build as <linux/pgtable.h> only defines them if
> !CONFIG_ARCH_LAZY_MMU. There does not seem to be a clean way out of
> this - let's just undefine that new CONFIG too.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---

...

> @@ -231,7 +231,7 @@ static inline int pmd_dirty(pmd_t pmd)
>   * held, but for kernel PTE updates, no lock is held). Nesting is not permitted
>   * and the mode cannot be used in interrupt context.
>   */
> -#ifndef __HAVE_ARCH_ENTER_LAZY_MMU_MODE
> +#ifndef CONFIG_ARCH_LAZY_MMU
>  static inline void arch_enter_lazy_mmu_mode(void) {}
>  static inline void arch_leave_lazy_mmu_mode(void) {}
>  static inline void arch_flush_lazy_mmu_mode(void) {}
> diff --git a/mm/Kconfig b/mm/Kconfig
> index 0e26f4fc8717..2fdcb42ca1a1 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -1372,6 +1372,9 @@ config PT_RECLAIM
>  config FIND_NORMAL_PAGE
>  	def_bool n
>  
> +config ARCH_LAZY_MMU
> +	bool
> +

I think a better name would be ARCH_HAS_LAZY_MMU and the config option fits
better to arch/Kconfig.

>  source "mm/damon/Kconfig"
>  
>  endmenu
> -- 
> 2.47.0
> 

-- 
Sincerely yours,
Mike.

