Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 249986E565E
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 03:24:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522533.811969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poa45-0001aQ-Ge; Tue, 18 Apr 2023 01:23:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522533.811969; Tue, 18 Apr 2023 01:23:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poa45-0001XY-Dl; Tue, 18 Apr 2023 01:23:25 +0000
Received: by outflank-mailman (input) for mailman id 522533;
 Tue, 18 Apr 2023 01:23:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jS8q=AJ=intel.com=lkp@srs-se1.protection.inumbo.net>)
 id 1poa43-0001XS-4T
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 01:23:23 +0000
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 985ed0fe-dd87-11ed-8611-37d641c3527e;
 Tue, 18 Apr 2023 03:23:19 +0200 (CEST)
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 18:23:15 -0700
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 17 Apr 2023 18:23:10 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1poa3p-000co7-26;
 Tue, 18 Apr 2023 01:23:09 +0000
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
X-Inumbo-ID: 985ed0fe-dd87-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681780999; x=1713316999;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xxj4orMdwSEXYJlb7suHd8py6WoU3VU9TrspjC7QyJg=;
  b=hdb43JKFAGuPDJ01N/RoqxdhyfAKl0xmllIzz5b67OxrMWOdEg39v222
   v3Znk5rMNCFHLKFekryh1oz9NiaR+wyUlJNzWR5CoAkWttY6EMOHcJ+HD
   LSi6sdk/4OUQWBCMFDH7bzV/fXpcHGipgLsTvVfXPexujhnTUNUnJITh2
   inaiVKOLP+eyPPJpBRuLPzuTEUSM2B6TQifQgxnuBOWgQ5tJByKdljiOJ
   Wq7LZthKwooB6sn25v6izBatxKcwl4adndmX3Is/GoWk48FXuWNk3T+sY
   /iz1Ilf/MKu8JuRafoLV0eWxHxIvKthuUDcPeMnUq79vO+5qT9LYstAFB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="410264165"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; 
   d="scan'208";a="410264165"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="668298836"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; 
   d="scan'208";a="668298836"
Date: Tue, 18 Apr 2023 09:22:18 +0800
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
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: Re: [PATCH 04/33] mm: add utility functions for ptdesc
Message-ID: <202304180913.p1BuXrBb-lkp@intel.com>
References: <20230417205048.15870-5-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230417205048.15870-5-vishal.moola@gmail.com>

Hi Vishal,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on s390/features powerpc/next powerpc/fixes geert-m68k/for-next geert-m68k/for-linus linus/master v6.3-rc7 next-20230417]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vishal-Moola-Oracle/s390-Use-_pt_s390_gaddr-for-gmap-address-tracking/20230418-045832
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230417205048.15870-5-vishal.moola%40gmail.com
patch subject: [PATCH 04/33] mm: add utility functions for ptdesc
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230418/202304180913.p1BuXrBb-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/1b6f8137ca50a543ad2937092836635ca58c78ce
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vishal-Moola-Oracle/s390-Use-_pt_s390_gaddr-for-gmap-address-tracking/20230418-045832
        git checkout 1b6f8137ca50a543ad2937092836635ca58c78ce
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304180913.p1BuXrBb-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/sh/kernel/asm-offsets.c:14:
   include/linux/mm.h: In function 'virt_to_ptdesc':
>> include/linux/mm.h:2723:16: error: implicit declaration of function 'page_ptdesc' [-Werror=implicit-function-declaration]
    2723 |         return page_ptdesc(virt_to_head_page(x));
         |                ^~~~~~~~~~~
>> include/linux/mm.h:2723:16: warning: returning 'int' from a function with return type 'struct ptdesc *' makes pointer from integer without a cast [-Wint-conversion]
    2723 |         return page_ptdesc(virt_to_head_page(x));
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/sh/include/asm/thread_info.h:13,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sh/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7:
   include/linux/mm.h: In function 'ptdesc_to_virt':
>> include/linux/mm.h:2728:29: error: implicit declaration of function 'ptdesc_page'; did you mean 'pte_page'? [-Werror=implicit-function-declaration]
    2728 |         return page_to_virt(ptdesc_page(pt));
         |                             ^~~~~~~~~~~
   arch/sh/include/asm/page.h:139:27: note: in definition of macro '___va'
     139 | #define ___va(x)        ((x)+PAGE_OFFSET)
         |                           ^
   include/linux/mm.h:117:25: note: in expansion of macro '__va'
     117 | #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)))
         |                         ^~~~
   include/linux/mm.h:117:30: note: in expansion of macro 'PFN_PHYS'
     117 | #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)))
         |                              ^~~~~~~~
   include/asm-generic/memory_model.h:64:21: note: in expansion of macro '__page_to_pfn'
      64 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mm.h:2728:16: note: in expansion of macro 'page_to_virt'
    2728 |         return page_to_virt(ptdesc_page(pt));
         |                ^~~~~~~~~~~~
>> include/asm-generic/memory_model.h:46:35: warning: initialization of 'const struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      46 | ({      const struct page *__pg = (pg);                         \
         |                                   ^
   arch/sh/include/asm/page.h:139:27: note: in definition of macro '___va'
     139 | #define ___va(x)        ((x)+PAGE_OFFSET)
         |                           ^
   include/linux/mm.h:117:25: note: in expansion of macro '__va'
     117 | #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)))
         |                         ^~~~
   include/linux/mm.h:117:30: note: in expansion of macro 'PFN_PHYS'
     117 | #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)))
         |                              ^~~~~~~~
   include/asm-generic/memory_model.h:64:21: note: in expansion of macro '__page_to_pfn'
      64 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mm.h:117:39: note: in expansion of macro 'page_to_pfn'
     117 | #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)))
         |                                       ^~~~~~~~~~~
   include/linux/mm.h:2728:16: note: in expansion of macro 'page_to_virt'
    2728 |         return page_to_virt(ptdesc_page(pt));
         |                ^~~~~~~~~~~~
   include/linux/mm.h: In function 'ptdesc_address':
>> include/linux/mm.h:2733:30: error: implicit declaration of function 'ptdesc_folio'; did you mean 'page_folio'? [-Werror=implicit-function-declaration]
    2733 |         return folio_address(ptdesc_folio(pt));
         |                              ^~~~~~~~~~~~
         |                              page_folio
>> include/linux/mm.h:2733:30: warning: passing argument 1 of 'folio_address' makes pointer from integer without a cast [-Wint-conversion]
    2733 |         return folio_address(ptdesc_folio(pt));
         |                              ^~~~~~~~~~~~~~~~
         |                              |
         |                              int
   include/linux/mm.h:2151:55: note: expected 'const struct folio *' but argument is of type 'int'
    2151 | static inline void *folio_address(const struct folio *folio)
         |                                   ~~~~~~~~~~~~~~~~~~~~^~~~~
   include/linux/mm.h: In function 'ptdesc_is_reserved':
>> include/linux/mm.h:2738:36: warning: passing argument 1 of 'folio_test_reserved' makes pointer from integer without a cast [-Wint-conversion]
    2738 |         return folio_test_reserved(ptdesc_folio(pt));
         |                                    ^~~~~~~~~~~~~~~~
         |                                    |
         |                                    int
   In file included from include/linux/mmzone.h:23:
   include/linux/page-flags.h:375:62: note: expected 'struct folio *' but argument is of type 'int'
     375 | static __always_inline bool folio_test_##lname(struct folio *folio)     \
         |                                                ~~~~~~~~~~~~~~^~~~~
   include/linux/page-flags.h:423:9: note: in expansion of macro 'TESTPAGEFLAG'
     423 |         TESTPAGEFLAG(uname, lname, policy)                              \
         |         ^~~~~~~~~~~~
   include/linux/page-flags.h:494:1: note: in expansion of macro 'PAGEFLAG'
     494 | PAGEFLAG(Reserved, reserved, PF_NO_COMPOUND)
         | ^~~~~~~~
   include/linux/mm.h: In function 'ptdesc_alloc':
   include/linux/mm.h:2745:16: warning: returning 'int' from a function with return type 'struct ptdesc *' makes pointer from integer without a cast [-Wint-conversion]
    2745 |         return page_ptdesc(page);
         |                ^~~~~~~~~~~~~~~~~
   include/linux/mm.h: In function 'ptdesc_free':
>> include/linux/mm.h:2750:29: warning: initialization of 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2750 |         struct page *page = ptdesc_page(pt);
         |                             ^~~~~~~~~~~
   include/linux/mm.h: In function 'free_reserved_ptdesc':
>> include/linux/mm.h:2988:28: warning: passing argument 1 of 'free_reserved_page' makes pointer from integer without a cast [-Wint-conversion]
    2988 |         free_reserved_page(ptdesc_page(pt));
         |                            ^~~~~~~~~~~~~~~
         |                            |
         |                            int
   include/linux/mm.h:2971:52: note: expected 'struct page *' but argument is of type 'int'
    2971 | static inline void free_reserved_page(struct page *page)
         |                                       ~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors
   make[2]: *** [scripts/Makefile.build:114: arch/sh/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1286: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/page_ptdesc +2723 include/linux/mm.h

  2720	
  2721	static inline struct ptdesc *virt_to_ptdesc(const void *x)
  2722	{
> 2723		return page_ptdesc(virt_to_head_page(x));
  2724	}
  2725	
  2726	static inline void *ptdesc_to_virt(struct ptdesc *pt)
  2727	{
> 2728		return page_to_virt(ptdesc_page(pt));
  2729	}
  2730	
  2731	static inline void *ptdesc_address(struct ptdesc *pt)
  2732	{
> 2733		return folio_address(ptdesc_folio(pt));
  2734	}
  2735	
  2736	static inline bool ptdesc_is_reserved(struct ptdesc *pt)
  2737	{
> 2738		return folio_test_reserved(ptdesc_folio(pt));
  2739	}
  2740	
  2741	static inline struct ptdesc *ptdesc_alloc(gfp_t gfp, unsigned int order)
  2742	{
  2743		struct page *page = alloc_pages(gfp | __GFP_COMP, order);
  2744	
  2745		return page_ptdesc(page);
  2746	}
  2747	
  2748	static inline void ptdesc_free(struct ptdesc *pt)
  2749	{
> 2750		struct page *page = ptdesc_page(pt);
  2751	
  2752		__free_pages(page, compound_order(page));
  2753	}
  2754	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

