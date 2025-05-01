Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A23AA642D
	for <lists+xen-devel@lfdr.de>; Thu,  1 May 2025 21:43:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974320.1362209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAZoE-0007Lb-Dl; Thu, 01 May 2025 19:43:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974320.1362209; Thu, 01 May 2025 19:43:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAZoE-0007JO-Au; Thu, 01 May 2025 19:43:02 +0000
Received: by outflank-mailman (input) for mailman id 974320;
 Thu, 01 May 2025 19:43:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iHxF=XR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uAZoC-00074N-OX
 for xen-devel@lists.xenproject.org; Thu, 01 May 2025 19:43:00 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c0ae1e6-26c4-11f0-9eb4-5ba50f476ded;
 Thu, 01 May 2025 21:42:59 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5AF475C490A;
 Thu,  1 May 2025 19:40:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5CAAC4CEE3;
 Thu,  1 May 2025 19:42:55 +0000 (UTC)
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
X-Inumbo-ID: 7c0ae1e6-26c4-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746128577;
	bh=8568cvhRutRjyDbgpnZKxEmTiYe4k4dnc66E6qBl1V8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZUND00Kf7gJdZASDlG66UKU+/IJBFo2Vra34dDbGgfXPs6mL82pxr2BZ8yl3pHePs
	 NN8N5Xwv+rDhC7lNq4r53Y5y56a+g88vG7ZPzmshhvB4EASmwSR7UKpFmf62DEJoHS
	 ALrza2GW6Ztfr2ge8nAPCXIQIKE/toBW7qy3zELJ0RvWNhB5D+H6TK6pmSOfTmayNV
	 lUPIdPuczjYqF6763oBNNF1Jr/sZNjpyyzXdHvsJJzw1rcQMTF1G3RGvizejdFxz/P
	 D30uODFbc3IziXcRafAVPUuwR5PZ/SIO1TDUqN5XXrzwuUnq0ny0mDvLgQG9xyV//J
	 czh73vIGlpj1A==
Date: Thu, 1 May 2025 12:42:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Shawn Anastasio <sanastasio@raptorengineering.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v5 2/3] xen/mm: Switch some APIs over to pte_attr_t
In-Reply-To: <20250425112415.245585-3-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2505011242160.3879245@ubuntu-linux-20-04-desktop>
References: <20250425112415.245585-1-andrew.cooper3@citrix.com> <20250425112415.245585-3-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1450196449-1746128577=:3879245"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1450196449-1746128577=:3879245
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 25 Apr 2025, Andrew Cooper wrote:
> From: Shawn Anastasio <sanastasio@raptorengineering.com>
> 
> Several APIs take an architecture-dependent set of flags in an unsigned int,
> but this needs to be a wider type to support PPC.
> 
> The new type pte_attr_t has been introduced for this purpose, so switch to it
> in map_pages_to_xen(), __vmap() and modify_xen_mappings{,_lite}().
> 
> No functional change.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
> ---
>  xen/arch/arm/mmu/pt.c   | 4 ++--
>  xen/arch/ppc/mm-radix.c | 2 +-
>  xen/arch/riscv/pt.c     | 2 +-
>  xen/arch/x86/mm.c       | 6 +++---
>  xen/common/efi/boot.c   | 4 ++--
>  xen/common/vmap.c       | 2 +-
>  xen/include/xen/mm.h    | 7 ++++---
>  xen/include/xen/vmap.h  | 3 ++-
>  8 files changed, 16 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/arch/arm/mmu/pt.c b/xen/arch/arm/mmu/pt.c
> index 11cb1c66dac8..4726e713efd3 100644
> --- a/xen/arch/arm/mmu/pt.c
> +++ b/xen/arch/arm/mmu/pt.c
> @@ -696,7 +696,7 @@ static int xen_pt_update(unsigned long virt,
>  int map_pages_to_xen(unsigned long virt,
>                       mfn_t mfn,
>                       unsigned long nr_mfns,
> -                     unsigned int flags)
> +                     pte_attr_t flags)
>  {
>      return xen_pt_update(virt, mfn, nr_mfns, flags);
>  }
> @@ -714,7 +714,7 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
>      return xen_pt_update(s, INVALID_MFN, (e - s) >> PAGE_SHIFT, 0);
>  }
>  
> -int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
> +int modify_xen_mappings(unsigned long s, unsigned long e, pte_attr_t nf)
>  {
>      ASSERT(IS_ALIGNED(s, PAGE_SIZE));
>      ASSERT(IS_ALIGNED(e, PAGE_SIZE));
> diff --git a/xen/arch/ppc/mm-radix.c b/xen/arch/ppc/mm-radix.c
> index 9a00ae416af0..d5385ec9dd4b 100644
> --- a/xen/arch/ppc/mm-radix.c
> +++ b/xen/arch/ppc/mm-radix.c
> @@ -265,7 +265,7 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
>  int map_pages_to_xen(unsigned long virt,
>                       mfn_t mfn,
>                       unsigned long nr_mfns,
> -                     unsigned int flags)
> +                     pte_attr_t flags)
>  {
>      BUG_ON("unimplemented");
>  }
> diff --git a/xen/arch/riscv/pt.c b/xen/arch/riscv/pt.c
> index 857619d48df1..918b1b91abde 100644
> --- a/xen/arch/riscv/pt.c
> +++ b/xen/arch/riscv/pt.c
> @@ -504,7 +504,7 @@ static int pt_update(vaddr_t virt, mfn_t mfn,
>  int map_pages_to_xen(unsigned long virt,
>                       mfn_t mfn,
>                       unsigned long nr_mfns,
> -                     unsigned int flags)
> +                     pte_attr_t flags)
>  {
>      /*
>       * Ensure that flags has PTE_VALID bit as map_pages_to_xen() is supposed
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index 1cf236516789..0e6c766be4aa 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -5442,7 +5442,7 @@ int map_pages_to_xen(
>      unsigned long virt,
>      mfn_t mfn,
>      unsigned long nr_mfns,
> -    unsigned int flags)
> +    pte_attr_t flags)
>  {
>      bool locking = system_state > SYS_STATE_boot;
>      l3_pgentry_t *pl3e = NULL, ol3e;
> @@ -5860,7 +5860,7 @@ int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
>   *
>   * It is an error to call with present flags over an unpopulated range.
>   */
> -int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
> +int modify_xen_mappings(unsigned long s, unsigned long e, pte_attr_t nf)
>  {
>      bool locking = system_state > SYS_STATE_boot;
>      l3_pgentry_t *pl3e = NULL;
> @@ -6156,7 +6156,7 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
>   * the non-inclusive boundary will be updated.
>   */
>  void init_or_livepatch modify_xen_mappings_lite(
> -    unsigned long s, unsigned long e, unsigned int nf)
> +    unsigned long s, unsigned long e, pte_attr_t nf)
>  {
>      unsigned long v = s, fm, flags;
>  
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index 143b5681ba92..e39fbc3529c4 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -1676,7 +1676,7 @@ void __init efi_init_memory(void)
>      struct rt_extra {
>          struct rt_extra *next;
>          unsigned long smfn, emfn;
> -        unsigned int prot;
> +        pte_attr_t prot;
>      } *extra, *extra_head = NULL;
>  
>      free_ebmalloc_unused_mem();
> @@ -1691,7 +1691,7 @@ void __init efi_init_memory(void)
>          EFI_MEMORY_DESCRIPTOR *desc = efi_memmap + i;
>          u64 len = desc->NumberOfPages << EFI_PAGE_SHIFT;
>          unsigned long smfn, emfn;
> -        unsigned int prot = PAGE_HYPERVISOR_RWX;
> +        pte_attr_t prot = PAGE_HYPERVISOR_RWX;
>          paddr_t mem_base;
>          unsigned long mem_npages;
>  
> diff --git a/xen/common/vmap.c b/xen/common/vmap.c
> index 47225fecc067..d6991421f3f7 100644
> --- a/xen/common/vmap.c
> +++ b/xen/common/vmap.c
> @@ -222,7 +222,7 @@ static void vm_free(const void *va)
>  }
>  
>  void *__vmap(const mfn_t *mfn, unsigned int granularity,
> -             unsigned int nr, unsigned int align, unsigned int flags,
> +             unsigned int nr, unsigned int align, pte_attr_t flags,
>               enum vmap_region type)
>  {
>      void *va = vm_alloc(nr * granularity, align, type);
> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> index ae1c48a61545..e89942b87d1e 100644
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -64,6 +64,7 @@
>  #include <xen/bug.h>
>  #include <xen/compiler.h>
>  #include <xen/mm-frame.h>
> +#include <xen/mm-types.h>
>  #include <xen/types.h>
>  #include <xen/list.h>
>  #include <xen/spinlock.h>
> @@ -113,11 +114,11 @@ int map_pages_to_xen(
>      unsigned long virt,
>      mfn_t mfn,
>      unsigned long nr_mfns,
> -    unsigned int flags);
> +    pte_attr_t flags);
>  /* Alter the permissions of a range of Xen virtual address space. */
> -int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf);
> +int modify_xen_mappings(unsigned long s, unsigned long e, pte_attr_t nf);
>  void modify_xen_mappings_lite(unsigned long s, unsigned long e,
> -                              unsigned int nf);
> +                              pte_attr_t nf);
>  int destroy_xen_mappings(unsigned long s, unsigned long e);
>  /* Retrieve the MFN mapped by VA in Xen virtual address space. */
>  mfn_t xen_map_to_mfn(unsigned long va);
> diff --git a/xen/include/xen/vmap.h b/xen/include/xen/vmap.h
> index 26c831757a11..327a2597826d 100644
> --- a/xen/include/xen/vmap.h
> +++ b/xen/include/xen/vmap.h
> @@ -9,6 +9,7 @@
>  #define __XEN_VMAP_H__
>  
>  #include <xen/mm-frame.h>
> +#include <xen/mm-types.h>
>  #include <xen/page-size.h>
>  
>  /* Identifiers for the linear ranges tracked by vmap */
> @@ -57,7 +58,7 @@ void vm_init_type(enum vmap_region type, void *start, void *end);
>   * @return Pointer to the mapped area on success; NULL otherwise.
>   */
>  void *__vmap(const mfn_t *mfn, unsigned int granularity, unsigned int nr,
> -             unsigned int align, unsigned int flags, enum vmap_region type);
> +             unsigned int align, pte_attr_t flags, enum vmap_region type);
>  
>  /*
>   * Map an array of pages contiguously into the VMAP_DEFAULT vmap region
> -- 
> 2.39.5
> 
--8323329-1450196449-1746128577=:3879245--

