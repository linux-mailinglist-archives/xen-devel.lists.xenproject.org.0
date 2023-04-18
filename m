Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CB86E5762
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 04:14:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522539.811980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poaqa-0007C9-7w; Tue, 18 Apr 2023 02:13:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522539.811980; Tue, 18 Apr 2023 02:13:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poaqa-00078j-10; Tue, 18 Apr 2023 02:13:32 +0000
Received: by outflank-mailman (input) for mailman id 522539;
 Tue, 18 Apr 2023 02:13:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jS8q=AJ=intel.com=lkp@srs-se1.protection.inumbo.net>)
 id 1poaqY-00078d-H0
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 02:13:30 +0000
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9743184a-dd8e-11ed-b21e-6b7b168915f2;
 Tue, 18 Apr 2023 04:13:25 +0200 (CEST)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 19:13:19 -0700
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 17 Apr 2023 19:13:13 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1poaqG-000cqb-33;
 Tue, 18 Apr 2023 02:13:12 +0000
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
X-Inumbo-ID: 9743184a-dd8e-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681784005; x=1713320005;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wqlsjQk8Hlncd0Tit9Ob615YFcxS+GeVN0PRT6FhUrY=;
  b=czD+pxJvj3ElkP5b8s20F9FqE+YovoFFjgpTU5ssuoS9hxa2f4w9ckKj
   EAxyiGF41u6hOHX/qdGjXUwFPst+Ly9I6Fgax4HDdX0DDveDRXgFyIt5f
   sfM7uNNnVsK39ICbwIRsPSGHh4N4LMq6X059lbm9bCg8cs475CVOHmrKr
   /GeKzrCnJgb+Stdjy7nZBt+pfFAukBlDtskYcesnYLCZ3Ohv0AeGXowbT
   m/yYOze0pESuuByvW8oHPOqRhcsi3YT9uFMlvNfpZiGLF7Uq0miXINn5W
   MaOV1O5Du6JNgQcd7JFRREYg0OpZTtlIjmtKycr1RMW6YM5GCC186kW2Q
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="343806401"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; 
   d="scan'208";a="343806401"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="723460357"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; 
   d="scan'208";a="723460357"
Date: Tue, 18 Apr 2023 10:13:01 +0800
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
Subject: Re: [PATCH 12/33] mm: Create ptdesc equivalents for
 pgtable_{pte,pmd}_page_{ctor,dtor}
Message-ID: <202304180959.YFCTfVKw-lkp@intel.com>
References: <20230417205048.15870-13-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230417205048.15870-13-vishal.moola@gmail.com>

Hi Vishal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on next-20230417]
[cannot apply to s390/features powerpc/next powerpc/fixes geert-m68k/for-next geert-m68k/for-linus linus/master v6.3-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vishal-Moola-Oracle/s390-Use-_pt_s390_gaddr-for-gmap-address-tracking/20230418-045832
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230417205048.15870-13-vishal.moola%40gmail.com
patch subject: [PATCH 12/33] mm: Create ptdesc equivalents for pgtable_{pte,pmd}_page_{ctor,dtor}
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230418/202304180959.YFCTfVKw-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d53de56a2dbf659b53aee1aa2eac60bcc936f10b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vishal-Moola-Oracle/s390-Use-_pt_s390_gaddr-for-gmap-address-tracking/20230418-045832
        git checkout d53de56a2dbf659b53aee1aa2eac60bcc936f10b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304180959.YFCTfVKw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/sh/kernel/asm-offsets.c:14:
   include/linux/mm.h: In function 'virt_to_ptdesc':
   include/linux/mm.h:2723:16: error: implicit declaration of function 'page_ptdesc' [-Werror=implicit-function-declaration]
    2723 |         return page_ptdesc(virt_to_head_page(x));
         |                ^~~~~~~~~~~
   include/linux/mm.h:2723:16: warning: returning 'int' from a function with return type 'struct ptdesc *' makes pointer from integer without a cast [-Wint-conversion]
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
   include/linux/mm.h:2728:29: error: implicit declaration of function 'ptdesc_page'; did you mean 'pte_page'? [-Werror=implicit-function-declaration]
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
   include/asm-generic/memory_model.h:46:35: warning: initialization of 'const struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
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
   include/linux/mm.h:2733:30: error: implicit declaration of function 'ptdesc_folio'; did you mean 'page_folio'? [-Werror=implicit-function-declaration]
    2733 |         return folio_address(ptdesc_folio(pt));
         |                              ^~~~~~~~~~~~
         |                              page_folio
   include/linux/mm.h:2733:30: warning: passing argument 1 of 'folio_address' makes pointer from integer without a cast [-Wint-conversion]
    2733 |         return folio_address(ptdesc_folio(pt));
         |                              ^~~~~~~~~~~~~~~~
         |                              |
         |                              int
   include/linux/mm.h:2151:55: note: expected 'const struct folio *' but argument is of type 'int'
    2151 | static inline void *folio_address(const struct folio *folio)
         |                                   ~~~~~~~~~~~~~~~~~~~~^~~~~
   include/linux/mm.h: In function 'ptdesc_is_reserved':
   include/linux/mm.h:2738:36: warning: passing argument 1 of 'folio_test_reserved' makes pointer from integer without a cast [-Wint-conversion]
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
   include/linux/mm.h:2750:29: warning: initialization of 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2750 |         struct page *page = ptdesc_page(pt);
         |                             ^~~~~~~~~~~
   include/linux/mm.h: In function 'ptdesc_pte_ctor':
>> include/linux/mm.h:2826:31: warning: initialization of 'struct folio *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2826 |         struct folio *folio = ptdesc_folio(ptdesc);
         |                               ^~~~~~~~~~~~
   include/linux/mm.h: In function 'pgtable_pte_page_ctor':
   include/linux/mm.h:2837:32: warning: passing argument 1 of 'ptdesc_pte_ctor' makes pointer from integer without a cast [-Wint-conversion]
    2837 |         return ptdesc_pte_ctor(page_ptdesc(page));
         |                                ^~~~~~~~~~~~~~~~~
         |                                |
         |                                int
   include/linux/mm.h:2824:51: note: expected 'struct ptdesc *' but argument is of type 'int'
    2824 | static inline bool ptdesc_pte_ctor(struct ptdesc *ptdesc)
         |                                    ~~~~~~~~~~~~~~~^~~~~~
   include/linux/mm.h: In function 'ptdesc_pte_dtor':
   include/linux/mm.h:2842:31: warning: initialization of 'struct folio *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2842 |         struct folio *folio = ptdesc_folio(ptdesc);
         |                               ^~~~~~~~~~~~
   include/linux/mm.h: In function 'pgtable_pte_page_dtor':
   include/linux/mm.h:2851:25: warning: passing argument 1 of 'ptdesc_pte_dtor' makes pointer from integer without a cast [-Wint-conversion]
    2851 |         ptdesc_pte_dtor(page_ptdesc(page));
         |                         ^~~~~~~~~~~~~~~~~
         |                         |
         |                         int
   include/linux/mm.h:2840:51: note: expected 'struct ptdesc *' but argument is of type 'int'
    2840 | static inline void ptdesc_pte_dtor(struct ptdesc *ptdesc)
         |                                    ~~~~~~~~~~~~~~~^~~~~~
   include/linux/mm.h: In function 'ptdesc_pmd_ctor':
   include/linux/mm.h:2935:31: warning: initialization of 'struct folio *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2935 |         struct folio *folio = ptdesc_folio(ptdesc);
         |                               ^~~~~~~~~~~~
   include/linux/mm.h: In function 'pgtable_pmd_page_ctor':
   include/linux/mm.h:2946:32: warning: passing argument 1 of 'ptdesc_pmd_ctor' makes pointer from integer without a cast [-Wint-conversion]
    2946 |         return ptdesc_pmd_ctor(page_ptdesc(page));
         |                                ^~~~~~~~~~~~~~~~~
         |                                |
         |                                int
   include/linux/mm.h:2933:51: note: expected 'struct ptdesc *' but argument is of type 'int'
    2933 | static inline bool ptdesc_pmd_ctor(struct ptdesc *ptdesc)
         |                                    ~~~~~~~~~~~~~~~^~~~~~
   include/linux/mm.h: In function 'ptdesc_pmd_dtor':
   include/linux/mm.h:2951:31: warning: initialization of 'struct folio *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2951 |         struct folio *folio = ptdesc_folio(ptdesc);
         |                               ^~~~~~~~~~~~
   include/linux/mm.h: In function 'pgtable_pmd_page_dtor':
   include/linux/mm.h:2960:25: warning: passing argument 1 of 'ptdesc_pmd_dtor' makes pointer from integer without a cast [-Wint-conversion]
    2960 |         ptdesc_pmd_dtor(page_ptdesc(page));
         |                         ^~~~~~~~~~~~~~~~~
         |                         |
         |                         int
   include/linux/mm.h:2949:51: note: expected 'struct ptdesc *' but argument is of type 'int'
    2949 | static inline void ptdesc_pmd_dtor(struct ptdesc *ptdesc)
         |                                    ~~~~~~~~~~~~~~~^~~~~~
   include/linux/mm.h: In function 'free_reserved_ptdesc':
   include/linux/mm.h:3016:28: warning: passing argument 1 of 'free_reserved_page' makes pointer from integer without a cast [-Wint-conversion]
    3016 |         free_reserved_page(ptdesc_page(pt));
         |                            ^~~~~~~~~~~~~~~
         |                            |
         |                            int
   include/linux/mm.h:2999:52: note: expected 'struct page *' but argument is of type 'int'
    2999 | static inline void free_reserved_page(struct page *page)
         |                                       ~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors
   make[2]: *** [scripts/Makefile.build:114: arch/sh/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1286: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +2826 include/linux/mm.h

  2823	
  2824	static inline bool ptdesc_pte_ctor(struct ptdesc *ptdesc)
  2825	{
> 2826		struct folio *folio = ptdesc_folio(ptdesc);
  2827	
  2828		if (!ptlock_init(ptdesc))
  2829			return false;
  2830		__SetPageTable(&folio->page);
  2831		lruvec_stat_add_folio(folio, NR_PAGETABLE);
  2832		return true;
  2833	}
  2834	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

