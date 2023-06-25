Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE57A73CF23
	for <lists+xen-devel@lfdr.de>; Sun, 25 Jun 2023 10:00:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554750.866149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDKe3-0003Oz-W7; Sun, 25 Jun 2023 07:58:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554750.866149; Sun, 25 Jun 2023 07:58:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDKe3-0003MA-TK; Sun, 25 Jun 2023 07:58:51 +0000
Received: by outflank-mailman (input) for mailman id 554750;
 Sun, 25 Jun 2023 07:58:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0i/f=CN=intel.com=lkp@srs-se1.protection.inumbo.net>)
 id 1qDKe1-0003M4-Q4
 for xen-devel@lists.xenproject.org; Sun, 25 Jun 2023 07:58:50 +0000
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ae7b192-132e-11ee-b237-6b7b168915f2;
 Sun, 25 Jun 2023 09:58:45 +0200 (CEST)
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2023 00:58:41 -0700
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 25 Jun 2023 00:58:34 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qDKdm-0009sJ-0Z;
 Sun, 25 Jun 2023 07:58:34 +0000
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
X-Inumbo-ID: 1ae7b192-132e-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687679925; x=1719215925;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eTIwvrfKylgiLU30c+QKGL2VdYd5OeJbT6ROhsR0yJI=;
  b=neV7gq/9aN83HABzFrHRqMas+KNi5YLf2cRweFmJwoCCefhUx6CATVFV
   EG/d1F3R2s5DpHVIg7AqwjZcF1hnqQusoo47jZOcR/DknfIxLD2QoNpCW
   g4lP6wLK73IGp/h+4gxQS8XjdXS6sX3QawAwcV3F2mmMsK5JNo9NNvC4D
   swft/+LIY5onWDCC64kh2y/UdVdsRuIe4Dz/XfFP5vCg0ockGENEBjjPK
   VigY4d+XJ/xJhh4xHFw+d+8TGtR66qT5jopUFku/fcnBFPkZofmKfzYNC
   LYIUSJ1b7vmGj1xgOr6qkfyT96CMgg+BnKDKuhJRDCiIXXQrHnWSGFGSi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="447419945"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="447419945"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="693123135"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="693123135"
Date: Sun, 25 Jun 2023 15:57:56 +0800
From: kernel test robot <lkp@intel.com>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
	Hugh Dickins <hughd@google.com>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v5 24/33] m68k: Convert various functions to use ptdescs
Message-ID: <202306251513.WVzxgGxu-lkp@intel.com>
References: <20230622205745.79707-25-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230622205745.79707-25-vishal.moola@gmail.com>

Hi Vishal,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20230622]
[cannot apply to akpm-mm/mm-everything powerpc/next powerpc/fixes s390/features geert-m68k/for-next geert-m68k/for-linus linus/master v6.4-rc7 v6.4-rc6 v6.4-rc5 v6.4-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vishal-Moola-Oracle/mm-Add-PAGE_TYPE_OP-folio-functions/20230623-050011
base:   next-20230622
patch link:    https://lore.kernel.org/r/20230622205745.79707-25-vishal.moola%40gmail.com
patch subject: [PATCH v5 24/33] m68k: Convert various functions to use ptdescs
config: m68k-randconfig-s051-20230625 (https://download.01.org/0day-ci/archive/20230625/202306251513.WVzxgGxu-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230625/202306251513.WVzxgGxu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306251513.WVzxgGxu-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/m68k/include/asm/pgalloc.h:12,
                    from kernel/fork.c:103:
   arch/m68k/include/asm/mcf_pgalloc.h: In function 'pgd_alloc':
>> arch/m68k/include/asm/mcf_pgalloc.h:82:60: error: 'GFP_NOWARN' undeclared (first use in this function); did you mean 'GFP_NOWAIT'?
      82 |         struct ptdesc *ptdesc = pagetable_alloc((GFP_DMA | GFP_NOWARN) &
         |                                                            ^~~~~~~~~~
         |                                                            GFP_NOWAIT
   arch/m68k/include/asm/mcf_pgalloc.h:82:60: note: each undeclared identifier is reported only once for each function it appears in
   arch/m68k/include/asm/mcf_pgalloc.h: At top level:
>> arch/m68k/include/asm/mcf_pgalloc.h:23:16: warning: 'ptdesc_address' is static but used in inline function 'pte_alloc_one_kernel' which is not static
      23 |         return ptdesc_address(ptdesc);
         |                ^~~~~~~~~~~~~~
>> arch/m68k/include/asm/mcf_pgalloc.h:17:33: warning: 'pagetable_alloc' is static but used in inline function 'pte_alloc_one_kernel' which is not static
      17 |         struct ptdesc *ptdesc = pagetable_alloc((GFP_DMA | __GFP_ZERO) &
         |                                 ^~~~~~~~~~~~~~~
>> arch/m68k/include/asm/mcf_pgalloc.h:10:24: warning: 'virt_to_ptdesc' is static but used in inline function 'pte_free_kernel' which is not static
      10 |         pagetable_free(virt_to_ptdesc(pte));
         |                        ^~~~~~~~~~~~~~
>> arch/m68k/include/asm/mcf_pgalloc.h:10:9: warning: 'pagetable_free' is static but used in inline function 'pte_free_kernel' which is not static
      10 |         pagetable_free(virt_to_ptdesc(pte));
         |         ^~~~~~~~~~~~~~
--
   In file included from arch/m68k/mm/mcfmmu.c:21:
   arch/m68k/include/asm/mcf_pgalloc.h: In function 'pgd_alloc':
>> arch/m68k/include/asm/mcf_pgalloc.h:82:60: error: 'GFP_NOWARN' undeclared (first use in this function); did you mean 'GFP_NOWAIT'?
      82 |         struct ptdesc *ptdesc = pagetable_alloc((GFP_DMA | GFP_NOWARN) &
         |                                                            ^~~~~~~~~~
         |                                                            GFP_NOWAIT
   arch/m68k/include/asm/mcf_pgalloc.h:82:60: note: each undeclared identifier is reported only once for each function it appears in
   arch/m68k/mm/mcfmmu.c: At top level:
   arch/m68k/mm/mcfmmu.c:36:13: warning: no previous prototype for 'paging_init' [-Wmissing-prototypes]
      36 | void __init paging_init(void)
         |             ^~~~~~~~~~~
   arch/m68k/mm/mcfmmu.c: In function 'paging_init':
   arch/m68k/mm/mcfmmu.c:41:37: warning: variable 'bootmem_end' set but not used [-Wunused-but-set-variable]
      41 |         unsigned long next_pgtable, bootmem_end;
         |                                     ^~~~~~~~~~~
   arch/m68k/include/asm/mcf_pgalloc.h: At top level:
>> arch/m68k/include/asm/mcf_pgalloc.h:23:16: warning: 'ptdesc_address' is static but used in inline function 'pte_alloc_one_kernel' which is not static
      23 |         return ptdesc_address(ptdesc);
         |                ^~~~~~~~~~~~~~
>> arch/m68k/include/asm/mcf_pgalloc.h:17:33: warning: 'pagetable_alloc' is static but used in inline function 'pte_alloc_one_kernel' which is not static
      17 |         struct ptdesc *ptdesc = pagetable_alloc((GFP_DMA | __GFP_ZERO) &
         |                                 ^~~~~~~~~~~~~~~
>> arch/m68k/include/asm/mcf_pgalloc.h:10:24: warning: 'virt_to_ptdesc' is static but used in inline function 'pte_free_kernel' which is not static
      10 |         pagetable_free(virt_to_ptdesc(pte));
         |                        ^~~~~~~~~~~~~~
>> arch/m68k/include/asm/mcf_pgalloc.h:10:9: warning: 'pagetable_free' is static but used in inline function 'pte_free_kernel' which is not static
      10 |         pagetable_free(virt_to_ptdesc(pte));
         |         ^~~~~~~~~~~~~~


vim +82 arch/m68k/include/asm/mcf_pgalloc.h

     7	
     8	extern inline void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
     9	{
  > 10		pagetable_free(virt_to_ptdesc(pte));
    11	}
    12	
    13	extern const char bad_pmd_string[];
    14	
    15	extern inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
    16	{
  > 17		struct ptdesc *ptdesc = pagetable_alloc((GFP_DMA | __GFP_ZERO) &
    18				~__GFP_HIGHMEM, 0);
    19	
    20		if (!ptdesc)
    21			return NULL;
    22	
  > 23		return ptdesc_address(ptdesc);
    24	}
    25	
    26	extern inline pmd_t *pmd_alloc_kernel(pgd_t *pgd, unsigned long address)
    27	{
    28		return (pmd_t *) pgd;
    29	}
    30	
    31	#define pmd_populate(mm, pmd, pte) (pmd_val(*pmd) = (unsigned long)(pte))
    32	
    33	#define pmd_populate_kernel pmd_populate
    34	
    35	static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pgtable,
    36					  unsigned long address)
    37	{
    38		struct ptdesc *ptdesc = virt_to_ptdesc(pgtable);
    39	
    40		pagetable_pte_dtor(ptdesc);
    41		pagetable_free(ptdesc);
    42	}
    43	
    44	static inline pgtable_t pte_alloc_one(struct mm_struct *mm)
    45	{
    46		struct ptdesc *ptdesc = pagetable_alloc(GFP_DMA | __GFP_ZERO, 0);
    47		pte_t *pte;
    48	
    49		if (!ptdesc)
    50			return NULL;
    51		if (!pagetable_pte_ctor(ptdesc)) {
    52			pagetable_free(ptdesc);
    53			return NULL;
    54		}
    55	
    56		pte = ptdesc_address(ptdesc);
    57		return pte;
    58	}
    59	
    60	static inline void pte_free(struct mm_struct *mm, pgtable_t pgtable)
    61	{
    62		struct ptdesc *ptdesc = virt_to_ptdesc(pgtable);
    63	
    64		pagetable_pte_dtor(ptdesc);
    65		pagetable_free(ptdesc);
    66	}
    67	
    68	/*
    69	 * In our implementation, each pgd entry contains 1 pmd that is never allocated
    70	 * or freed.  pgd_present is always 1, so this should never be called. -NL
    71	 */
    72	#define pmd_free(mm, pmd) BUG()
    73	
    74	static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
    75	{
    76		pagetable_free(virt_to_ptdesc(pgd));
    77	}
    78	
    79	static inline pgd_t *pgd_alloc(struct mm_struct *mm)
    80	{
    81		pgd_t *new_pgd;
  > 82		struct ptdesc *ptdesc = pagetable_alloc((GFP_DMA | GFP_NOWARN) &
    83				~__GFP_HIGHMEM, 0);
    84	
    85		if (!ptdesc)
    86			return NULL;
    87		new_pgd = ptdesc_address(ptdesc);
    88	
    89		memcpy(new_pgd, swapper_pg_dir, PTRS_PER_PGD * sizeof(pgd_t));
    90		memset(new_pgd, 0, PAGE_OFFSET >> PGDIR_SHIFT);
    91		return new_pgd;
    92	}
    93	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

