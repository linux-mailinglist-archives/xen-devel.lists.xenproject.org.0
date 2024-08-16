Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 762A3953F03
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2024 03:41:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778343.1188396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1selxN-0001kV-Rn; Fri, 16 Aug 2024 01:40:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778343.1188396; Fri, 16 Aug 2024 01:40:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1selxN-0001hK-Oa; Fri, 16 Aug 2024 01:40:45 +0000
Received: by outflank-mailman (input) for mailman id 778343;
 Fri, 16 Aug 2024 01:40:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m3Oh=PP=intel.com=lkp@srs-se1.protection.inumbo.net>)
 id 1selxM-0001hE-TR
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2024 01:40:45 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ad91460-5b70-11ef-8776-851b0ebba9a2;
 Fri, 16 Aug 2024 03:40:41 +0200 (CEST)
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 18:40:39 -0700
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
 by orviesa004.jf.intel.com with ESMTP; 15 Aug 2024 18:40:33 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1selx8-0005n0-2f;
 Fri, 16 Aug 2024 01:40:30 +0000
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
X-Inumbo-ID: 8ad91460-5b70-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723772442; x=1755308442;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FHJRwW+7bRBSKWk7JuaJ+Xkom00qKybRQe8ByoTp8xM=;
  b=fOJ7Y8C2ZW/br6Z4CE7KJL/1Jfguc5MsH949/3loZi3TsNHhl2JPlHlv
   kq2Y1944ksCz+gGevdXS3YnapwIOIfub6KTYNd5ekOLvHcwjm+6pDwBAV
   brns2uhmQ9wf6edHjnlQs3hr+sZ5gaOQ1FlDVxrtDSVVBipIpwQ9s+TJk
   w+PXnKJtZJE0x1izfsfO00uEDVBhtkn0T7BjZaTgqkoXAZ18eHZim0o9I
   zNkd3d5HQsCml5W3crHyq2qlF35V0TgeFRFzOwv2pfRCLSmXQFqz3Hiyj
   93mvHbt46JUbcuhNAEHkygx+4wTOGrbVVtZusfofSqm36vm3evbMPjtAf
   g==;
X-CSE-ConnectionGUID: CmmcSg66TyueHiO6x2JAxQ==
X-CSE-MsgGUID: rfQg69dvQzmTt5V9+/pBCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="32730640"
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; 
   d="scan'208";a="32730640"
X-CSE-ConnectionGUID: okgIv29iR2C0m373nz4+0A==
X-CSE-MsgGUID: lgC3fOkuQpWCFIwLNk6d5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; 
   d="scan'208";a="64472897"
Date: Fri, 16 Aug 2024 09:39:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Andryuk <jason.andryuk@amd.com>, Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Brian Gerst <brgerst@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v2 5/5] x86/pvh: Add 64bit relocation page tables
Message-ID: <202408160955.iKtoU4kP-lkp@intel.com>
References: <20240814195053.5564-6-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814195053.5564-6-jason.andryuk@amd.com>

Hi Jason,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/core]
[also build test WARNING on xen-tip/linux-next tip/master linus/master v6.11-rc3 next-20240815]
[cannot apply to tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Andryuk/xen-sync-elfnote-h-from-xen-tree/20240815-035238
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20240814195053.5564-6-jason.andryuk%40amd.com
patch subject: [PATCH v2 5/5] x86/pvh: Add 64bit relocation page tables
config: i386-randconfig-011-20240815 (https://download.01.org/0day-ci/archive/20240816/202408160955.iKtoU4kP-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240816/202408160955.iKtoU4kP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408160955.iKtoU4kP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/platform/pvh/head.S:19:
   In file included from arch/x86/include/asm/pgtable_64.h:6:
>> arch/x86/include/asm/pgtable_64_types.h:49:9: warning: 'SHARED_KERNEL_PMD' macro redefined [-Wmacro-redefined]
      49 | #define SHARED_KERNEL_PMD       0
         |         ^
   arch/x86/include/asm/pgtable-3level_types.h:30:9: note: previous definition is here
      30 | #define SHARED_KERNEL_PMD       (!static_cpu_has(X86_FEATURE_PTI))
         |         ^
   In file included from arch/x86/platform/pvh/head.S:19:
   In file included from arch/x86/include/asm/pgtable_64.h:6:
   arch/x86/include/asm/pgtable_64_types.h:75:9: warning: 'PGDIR_SHIFT' macro redefined [-Wmacro-redefined]
      75 | #define PGDIR_SHIFT             39
         |         ^
   arch/x86/include/asm/pgtable-3level_types.h:37:9: note: previous definition is here
      37 | #define PGDIR_SHIFT     30
         |         ^
   In file included from arch/x86/platform/pvh/head.S:19:
   In file included from arch/x86/include/asm/pgtable_64.h:6:
>> arch/x86/include/asm/pgtable_64_types.h:76:9: warning: 'PTRS_PER_PGD' macro redefined [-Wmacro-redefined]
      76 | #define PTRS_PER_PGD            512
         |         ^
   arch/x86/include/asm/pgtable-3level_types.h:38:9: note: previous definition is here
      38 | #define PTRS_PER_PGD    4
         |         ^
   In file included from arch/x86/platform/pvh/head.S:19:
   In file included from arch/x86/include/asm/pgtable_64.h:6:
   arch/x86/include/asm/pgtable_64_types.h:99:9: warning: 'PMD_SIZE' macro redefined [-Wmacro-redefined]
      99 | #define PMD_SIZE        (_AC(1, UL) << PMD_SHIFT)
         |         ^
   arch/x86/include/asm/pgtable_32_types.h:12:10: note: previous definition is here
      12 | # define PMD_SIZE       (1UL << PMD_SHIFT)
         |          ^
   In file included from arch/x86/platform/pvh/head.S:19:
   In file included from arch/x86/include/asm/pgtable_64.h:6:
   arch/x86/include/asm/pgtable_64_types.h:103:9: warning: 'PGDIR_SIZE' macro redefined [-Wmacro-redefined]
     103 | #define PGDIR_SIZE      (_AC(1, UL) << PGDIR_SHIFT)
         |         ^
   arch/x86/include/asm/pgtable_32_types.h:20:9: note: previous definition is here
      20 | #define PGDIR_SIZE      (1UL << PGDIR_SHIFT)
         |         ^
   In file included from arch/x86/platform/pvh/head.S:19:
   In file included from arch/x86/include/asm/pgtable_64.h:6:
>> arch/x86/include/asm/pgtable_64_types.h:210:9: warning: 'PGD_KERNEL_START' macro redefined [-Wmacro-redefined]
     210 | #define PGD_KERNEL_START        ((PAGE_SIZE / 2) / sizeof(pgd_t))
         |         ^
   arch/x86/include/asm/pgtable-3level_types.h:53:9: note: previous definition is here
      53 | #define PGD_KERNEL_START        (CONFIG_PAGE_OFFSET >> PGDIR_SHIFT)
         |         ^
   6 warnings generated.
   /tmp/head-582305.s:252:51: error: expression could not be evaluated
   L4_PAGE_OFFSET = (((__PAGE_OFFSET_BASE_L4) >> 39) & 511)
                                                     ^


vim +/PTRS_PER_PGD +76 arch/x86/include/asm/pgtable_64_types.h

54321d947ae9d6 Jeremy Fitzhardinge 2009-02-11   48  
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  @49  #define SHARED_KERNEL_PMD	0
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08   50  
b8504058a06bd1 Kirill A. Shutemov  2017-03-30   51  #ifdef CONFIG_X86_5LEVEL
b8504058a06bd1 Kirill A. Shutemov  2017-03-30   52  
b8504058a06bd1 Kirill A. Shutemov  2017-03-30   53  /*
b8504058a06bd1 Kirill A. Shutemov  2017-03-30   54   * PGDIR_SHIFT determines what a top-level page table entry can map
b8504058a06bd1 Kirill A. Shutemov  2017-03-30   55   */
c65e774fb3f6af Kirill A. Shutemov  2018-02-14   56  #define PGDIR_SHIFT	pgdir_shift
b8504058a06bd1 Kirill A. Shutemov  2017-03-30   57  #define PTRS_PER_PGD	512
b8504058a06bd1 Kirill A. Shutemov  2017-03-30   58  
b8504058a06bd1 Kirill A. Shutemov  2017-03-30   59  /*
b8504058a06bd1 Kirill A. Shutemov  2017-03-30   60   * 4th level page in 5-level paging case
b8504058a06bd1 Kirill A. Shutemov  2017-03-30   61   */
b8504058a06bd1 Kirill A. Shutemov  2017-03-30   62  #define P4D_SHIFT		39
c65e774fb3f6af Kirill A. Shutemov  2018-02-14   63  #define MAX_PTRS_PER_P4D	512
c65e774fb3f6af Kirill A. Shutemov  2018-02-14   64  #define PTRS_PER_P4D		ptrs_per_p4d
b8504058a06bd1 Kirill A. Shutemov  2017-03-30   65  #define P4D_SIZE		(_AC(1, UL) << P4D_SHIFT)
b8504058a06bd1 Kirill A. Shutemov  2017-03-30   66  #define P4D_MASK		(~(P4D_SIZE - 1))
b8504058a06bd1 Kirill A. Shutemov  2017-03-30   67  
02390b87a94599 Kirill A. Shutemov  2018-02-14   68  #define MAX_POSSIBLE_PHYSMEM_BITS	52
02390b87a94599 Kirill A. Shutemov  2018-02-14   69  
b8504058a06bd1 Kirill A. Shutemov  2017-03-30   70  #else /* CONFIG_X86_5LEVEL */
b8504058a06bd1 Kirill A. Shutemov  2017-03-30   71  
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08   72  /*
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08   73   * PGDIR_SHIFT determines what a top-level page table entry can map
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08   74   */
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08   75  #define PGDIR_SHIFT		39
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  @76  #define PTRS_PER_PGD		512
c65e774fb3f6af Kirill A. Shutemov  2018-02-14   77  #define MAX_PTRS_PER_P4D	1
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08   78  
b8504058a06bd1 Kirill A. Shutemov  2017-03-30   79  #endif /* CONFIG_X86_5LEVEL */
b8504058a06bd1 Kirill A. Shutemov  2017-03-30   80  
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08   81  /*
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08   82   * 3rd level page
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08   83   */
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08   84  #define PUD_SHIFT	30
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08   85  #define PTRS_PER_PUD	512
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08   86  
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08   87  /*
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08   88   * PMD_SHIFT determines the size of the area a middle-level
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08   89   * page table can map
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08   90   */
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08   91  #define PMD_SHIFT	21
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08   92  #define PTRS_PER_PMD	512
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08   93  
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08   94  /*
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08   95   * entries per page directory level
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08   96   */
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08   97  #define PTRS_PER_PTE	512
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08   98  
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08   99  #define PMD_SIZE	(_AC(1, UL) << PMD_SHIFT)
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  100  #define PMD_MASK	(~(PMD_SIZE - 1))
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  101  #define PUD_SIZE	(_AC(1, UL) << PUD_SHIFT)
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  102  #define PUD_MASK	(~(PUD_SIZE - 1))
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  103  #define PGDIR_SIZE	(_AC(1, UL) << PGDIR_SHIFT)
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  104  #define PGDIR_MASK	(~(PGDIR_SIZE - 1))
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  105  
1dddd25125112b Thomas Gleixner     2018-01-04  106  /*
ff61f0791ce969 Jonathan Corbet     2023-03-14  107   * See Documentation/arch/x86/x86_64/mm.rst for a description of the memory map.
1dddd25125112b Thomas Gleixner     2018-01-04  108   *
1dddd25125112b Thomas Gleixner     2018-01-04  109   * Be very careful vs. KASLR when changing anything here. The KASLR address
1dddd25125112b Thomas Gleixner     2018-01-04  110   * range must not overlap with anything except the KASAN shadow area, which
1dddd25125112b Thomas Gleixner     2018-01-04  111   * is correct as KASAN disables KASLR.
1dddd25125112b Thomas Gleixner     2018-01-04  112   */
162434e7f58b21 Kirill A. Shutemov  2018-02-14  113  #define MAXMEM			(1UL << MAX_PHYSMEM_BITS)
92a0f81d89571e Thomas Gleixner     2017-12-20  114  
16877a5570e0c5 Kirill A. Shutemov  2018-11-30  115  #define GUARD_HOLE_PGD_ENTRY	-256UL
16877a5570e0c5 Kirill A. Shutemov  2018-11-30  116  #define GUARD_HOLE_SIZE		(16UL << PGDIR_SHIFT)
16877a5570e0c5 Kirill A. Shutemov  2018-11-30  117  #define GUARD_HOLE_BASE_ADDR	(GUARD_HOLE_PGD_ENTRY << PGDIR_SHIFT)
16877a5570e0c5 Kirill A. Shutemov  2018-11-30  118  #define GUARD_HOLE_END_ADDR	(GUARD_HOLE_BASE_ADDR + GUARD_HOLE_SIZE)
16877a5570e0c5 Kirill A. Shutemov  2018-11-30  119  
d52888aa2753e3 Kirill A. Shutemov  2018-10-26  120  #define LDT_PGD_ENTRY		-240UL
5c7919bb1994f8 Kirill A. Shutemov  2018-02-14  121  #define LDT_BASE_ADDR		(LDT_PGD_ENTRY << PGDIR_SHIFT)
8195d869d118bc Joerg Roedel        2018-07-18  122  #define LDT_END_ADDR		(LDT_BASE_ADDR + PGDIR_SIZE)
5c7919bb1994f8 Kirill A. Shutemov  2018-02-14  123  
14d12bb8582e15 Jiri Kosina         2018-04-12  124  #define __VMALLOC_BASE_L4	0xffffc90000000000UL
14d12bb8582e15 Jiri Kosina         2018-04-12  125  #define __VMALLOC_BASE_L5 	0xffa0000000000000UL
a7412546d8cb5a Kirill A. Shutemov  2018-02-14  126  
a7412546d8cb5a Kirill A. Shutemov  2018-02-14  127  #define VMALLOC_SIZE_TB_L4	32UL
a7412546d8cb5a Kirill A. Shutemov  2018-02-14  128  #define VMALLOC_SIZE_TB_L5	12800UL
a7412546d8cb5a Kirill A. Shutemov  2018-02-14  129  
14d12bb8582e15 Jiri Kosina         2018-04-12  130  #define __VMEMMAP_BASE_L4	0xffffea0000000000UL
14d12bb8582e15 Jiri Kosina         2018-04-12  131  #define __VMEMMAP_BASE_L5	0xffd4000000000000UL
92a0f81d89571e Thomas Gleixner     2017-12-20  132  
eedb92abb9bb03 Kirill A. Shutemov  2018-02-14  133  #ifdef CONFIG_DYNAMIC_MEMORY_LAYOUT
a95ae27c2ee1cb Thomas Garnier      2016-06-21  134  # define VMALLOC_START		vmalloc_base
ed7588d5dc6f5e Kirill A. Shutemov  2018-05-18  135  # define VMALLOC_SIZE_TB	(pgtable_l5_enabled() ? VMALLOC_SIZE_TB_L5 : VMALLOC_SIZE_TB_L4)
25dfe478533272 Thomas Garnier      2016-07-27  136  # define VMEMMAP_START		vmemmap_base
a95ae27c2ee1cb Thomas Garnier      2016-06-21  137  #else
a7412546d8cb5a Kirill A. Shutemov  2018-02-14  138  # define VMALLOC_START		__VMALLOC_BASE_L4
a7412546d8cb5a Kirill A. Shutemov  2018-02-14  139  # define VMALLOC_SIZE_TB	VMALLOC_SIZE_TB_L4
9b46a051e43461 Kirill A. Shutemov  2018-02-14  140  # define VMEMMAP_START		__VMEMMAP_BASE_L4
eedb92abb9bb03 Kirill A. Shutemov  2018-02-14  141  #endif /* CONFIG_DYNAMIC_MEMORY_LAYOUT */
92a0f81d89571e Thomas Gleixner     2017-12-20  142  
1a167ddd3c561b Alexander Potapenko 2022-09-15  143  /*
1a167ddd3c561b Alexander Potapenko 2022-09-15  144   * End of the region for which vmalloc page tables are pre-allocated.
1a167ddd3c561b Alexander Potapenko 2022-09-15  145   * For non-KMSAN builds, this is the same as VMALLOC_END.
1a167ddd3c561b Alexander Potapenko 2022-09-15  146   * For KMSAN builds, VMALLOC_START..VMEMORY_END is 4 times bigger than
1a167ddd3c561b Alexander Potapenko 2022-09-15  147   * VMALLOC_START..VMALLOC_END (see below).
1a167ddd3c561b Alexander Potapenko 2022-09-15  148   */
1a167ddd3c561b Alexander Potapenko 2022-09-15  149  #define VMEMORY_END		(VMALLOC_START + (VMALLOC_SIZE_TB << 40) - 1)
1a167ddd3c561b Alexander Potapenko 2022-09-15  150  
1a167ddd3c561b Alexander Potapenko 2022-09-15  151  #ifndef CONFIG_KMSAN
1a167ddd3c561b Alexander Potapenko 2022-09-15  152  #define VMALLOC_END		VMEMORY_END
1a167ddd3c561b Alexander Potapenko 2022-09-15  153  #else
1a167ddd3c561b Alexander Potapenko 2022-09-15  154  /*
1a167ddd3c561b Alexander Potapenko 2022-09-15  155   * In KMSAN builds vmalloc area is four times smaller, and the remaining 3/4
1a167ddd3c561b Alexander Potapenko 2022-09-15  156   * are used to keep the metadata for virtual pages. The memory formerly
1a167ddd3c561b Alexander Potapenko 2022-09-15  157   * belonging to vmalloc area is now laid out as follows:
1a167ddd3c561b Alexander Potapenko 2022-09-15  158   *
1a167ddd3c561b Alexander Potapenko 2022-09-15  159   * 1st quarter: VMALLOC_START to VMALLOC_END - new vmalloc area
1a167ddd3c561b Alexander Potapenko 2022-09-15  160   * 2nd quarter: KMSAN_VMALLOC_SHADOW_START to
1a167ddd3c561b Alexander Potapenko 2022-09-15  161   *              VMALLOC_END+KMSAN_VMALLOC_SHADOW_OFFSET - vmalloc area shadow
1a167ddd3c561b Alexander Potapenko 2022-09-15  162   * 3rd quarter: KMSAN_VMALLOC_ORIGIN_START to
1a167ddd3c561b Alexander Potapenko 2022-09-15  163   *              VMALLOC_END+KMSAN_VMALLOC_ORIGIN_OFFSET - vmalloc area origins
1a167ddd3c561b Alexander Potapenko 2022-09-15  164   * 4th quarter: KMSAN_MODULES_SHADOW_START to KMSAN_MODULES_ORIGIN_START
1a167ddd3c561b Alexander Potapenko 2022-09-15  165   *              - shadow for modules,
1a167ddd3c561b Alexander Potapenko 2022-09-15  166   *              KMSAN_MODULES_ORIGIN_START to
1a167ddd3c561b Alexander Potapenko 2022-09-15  167   *              KMSAN_MODULES_ORIGIN_START + MODULES_LEN - origins for modules.
1a167ddd3c561b Alexander Potapenko 2022-09-15  168   */
1a167ddd3c561b Alexander Potapenko 2022-09-15  169  #define VMALLOC_QUARTER_SIZE	((VMALLOC_SIZE_TB << 40) >> 2)
1a167ddd3c561b Alexander Potapenko 2022-09-15  170  #define VMALLOC_END		(VMALLOC_START + VMALLOC_QUARTER_SIZE - 1)
1a167ddd3c561b Alexander Potapenko 2022-09-15  171  
1a167ddd3c561b Alexander Potapenko 2022-09-15  172  /*
1a167ddd3c561b Alexander Potapenko 2022-09-15  173   * vmalloc metadata addresses are calculated by adding shadow/origin offsets
1a167ddd3c561b Alexander Potapenko 2022-09-15  174   * to vmalloc address.
1a167ddd3c561b Alexander Potapenko 2022-09-15  175   */
1a167ddd3c561b Alexander Potapenko 2022-09-15  176  #define KMSAN_VMALLOC_SHADOW_OFFSET	VMALLOC_QUARTER_SIZE
1a167ddd3c561b Alexander Potapenko 2022-09-15  177  #define KMSAN_VMALLOC_ORIGIN_OFFSET	(VMALLOC_QUARTER_SIZE << 1)
1a167ddd3c561b Alexander Potapenko 2022-09-15  178  
1a167ddd3c561b Alexander Potapenko 2022-09-15  179  #define KMSAN_VMALLOC_SHADOW_START	(VMALLOC_START + KMSAN_VMALLOC_SHADOW_OFFSET)
1a167ddd3c561b Alexander Potapenko 2022-09-15  180  #define KMSAN_VMALLOC_ORIGIN_START	(VMALLOC_START + KMSAN_VMALLOC_ORIGIN_OFFSET)
1a167ddd3c561b Alexander Potapenko 2022-09-15  181  
1a167ddd3c561b Alexander Potapenko 2022-09-15  182  /*
1a167ddd3c561b Alexander Potapenko 2022-09-15  183   * The shadow/origin for modules are placed one by one in the last 1/4 of
1a167ddd3c561b Alexander Potapenko 2022-09-15  184   * vmalloc space.
1a167ddd3c561b Alexander Potapenko 2022-09-15  185   */
1a167ddd3c561b Alexander Potapenko 2022-09-15  186  #define KMSAN_MODULES_SHADOW_START	(VMALLOC_END + KMSAN_VMALLOC_ORIGIN_OFFSET + 1)
1a167ddd3c561b Alexander Potapenko 2022-09-15  187  #define KMSAN_MODULES_ORIGIN_START	(KMSAN_MODULES_SHADOW_START + MODULES_LEN)
1a167ddd3c561b Alexander Potapenko 2022-09-15  188  #endif /* CONFIG_KMSAN */
92a0f81d89571e Thomas Gleixner     2017-12-20  189  
6145cfe394a7f1 Kees Cook           2013-10-10  190  #define MODULES_VADDR		(__START_KERNEL_map + KERNEL_IMAGE_SIZE)
f06bdd4001c257 Thomas Garnier      2017-03-14  191  /* The module sections ends with the start of the fixmap */
14df3267029158 Thomas Gleixner     2020-11-18  192  #ifndef CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP
f5a40711fa58f1 Andrey Ryabinin     2017-12-28  193  # define MODULES_END		_AC(0xffffffffff000000, UL)
14df3267029158 Thomas Gleixner     2020-11-18  194  #else
14df3267029158 Thomas Gleixner     2020-11-18  195  # define MODULES_END		_AC(0xfffffffffe000000, UL)
14df3267029158 Thomas Gleixner     2020-11-18  196  #endif
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  197  #define MODULES_LEN		(MODULES_END - MODULES_VADDR)
92a0f81d89571e Thomas Gleixner     2017-12-20  198  
3891a04aafd668 H. Peter Anvin      2014-04-29  199  #define ESPFIX_PGD_ENTRY	_AC(-2, UL)
1d33b219563fb9 Kirill A. Shutemov  2017-03-30  200  #define ESPFIX_BASE_ADDR	(ESPFIX_PGD_ENTRY << P4D_SHIFT)
92a0f81d89571e Thomas Gleixner     2017-12-20  201  
f2078904810373 Thomas Gleixner     2018-01-04  202  #define CPU_ENTRY_AREA_PGD	_AC(-4, UL)
92a0f81d89571e Thomas Gleixner     2017-12-20  203  #define CPU_ENTRY_AREA_BASE	(CPU_ENTRY_AREA_PGD << P4D_SHIFT)
92a0f81d89571e Thomas Gleixner     2017-12-20  204  
8266e31ed0fedb Mathias Krause      2014-09-21  205  #define EFI_VA_START		( -4 * (_AC(1, UL) << 30))
8266e31ed0fedb Mathias Krause      2014-09-21  206  #define EFI_VA_END		(-68 * (_AC(1, UL) << 30))
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  207  
8170e6bed465b4 H. Peter Anvin      2013-01-24  208  #define EARLY_DYNAMIC_PAGE_TABLES	64
8170e6bed465b4 H. Peter Anvin      2013-01-24  209  
76e258add7b653 Joerg Roedel        2018-07-18 @210  #define PGD_KERNEL_START	((PAGE_SIZE / 2) / sizeof(pgd_t))
76e258add7b653 Joerg Roedel        2018-07-18  211  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

