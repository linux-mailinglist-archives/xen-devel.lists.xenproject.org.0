Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9E96F3BE8
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 03:50:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528322.821307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptf96-0004Ye-Ud; Tue, 02 May 2023 01:49:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528322.821307; Tue, 02 May 2023 01:49:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptf96-0004Vf-Rj; Tue, 02 May 2023 01:49:36 +0000
Received: by outflank-mailman (input) for mailman id 528322;
 Tue, 02 May 2023 01:49:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lHQJ=AX=intel.com=lkp@srs-se1.protection.inumbo.net>)
 id 1ptf95-0004VZ-Eq
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 01:49:35 +0000
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9431b320-e88b-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 03:49:32 +0200 (CEST)
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 18:49:25 -0700
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 01 May 2023 18:49:20 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ptf8q-0000ke-0J;
 Tue, 02 May 2023 01:49:20 +0000
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
X-Inumbo-ID: 9431b320-e88b-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682992172; x=1714528172;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=atYvzhPCCZ/tytx2DE7s23i4jWidElWSRjsH6cc5aEY=;
  b=Dw7biiOHIg+GLNRuChMal0jdKqSwMg8kLWn6ilfwftkDGxLQABrpFYSu
   SjZVqpFslipAljPqIg8E8x7ozL/4sgdnfcpLA4hFRR777CnMcpP+uKPeU
   5VEYiBBgnQk4DASs2EqV/BOe71eHiKhA5eKPYsLJt3U9/iJEbyyvoDKxh
   JTDpVFn3BFRpwOIjQ0UdUHh20OkxUKJWUU7cSD2/vwpiSCJ1K/VZ7Q7zB
   32qLl/eUZlBXuJclleFmghqGPXkGVJduJWK/cNoa2SQ5W53gBUyaH/+g0
   /nXmO3esuerp7Ka86tPeKJg2t3LYI6ZbCWHhyulx0QPAEClQwO6yhgEUk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="328651235"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; 
   d="scan'208";a="328651235"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="698763727"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; 
   d="scan'208";a="698763727"
Date: Tue, 2 May 2023 09:48:46 +0800
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
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v2 21/34] arm64: Convert various functions to use ptdescs
Message-ID: <202305020914.OGRWcEG1-lkp@intel.com>
References: <20230501192829.17086-22-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230501192829.17086-22-vishal.moola@gmail.com>

Hi Vishal,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master next-20230428]
[cannot apply to s390/features powerpc/next powerpc/fixes geert-m68k/for-next geert-m68k/for-linus v6.3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vishal-Moola-Oracle/mm-Add-PAGE_TYPE_OP-folio-functions/20230502-033042
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230501192829.17086-22-vishal.moola%40gmail.com
patch subject: [PATCH v2 21/34] arm64: Convert various functions to use ptdescs
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230502/202305020914.OGRWcEG1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/8e9481b63b5773d7c914836dcd7fbec2449902bc
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vishal-Moola-Oracle/mm-Add-PAGE_TYPE_OP-folio-functions/20230502-033042
        git checkout 8e9481b63b5773d7c914836dcd7fbec2449902bc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305020914.OGRWcEG1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/build_bug.h:5,
                    from include/linux/bits.h:21,
                    from include/linux/bitops.h:6,
                    from arch/arm64/include/asm/cache.h:39,
                    from include/linux/cache.h:6,
                    from arch/arm64/mm/mmu.c:9:
   arch/arm64/mm/mmu.c: In function 'pgd_pgtable_alloc':
>> arch/arm64/mm/mmu.c:440:24: error: invalid use of void expression
     440 |                 BUG_ON(!ptdesc_pte_dtor(ptdesc));
         |                        ^
   include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
      78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   arch/arm64/mm/mmu.c:440:17: note: in expansion of macro 'BUG_ON'
     440 |                 BUG_ON(!ptdesc_pte_dtor(ptdesc));
         |                 ^~~~~~
   arch/arm64/mm/mmu.c:442:24: error: invalid use of void expression
     442 |                 BUG_ON(!ptdesc_pte_dtor(ptdesc));
         |                        ^
   include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
      78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   arch/arm64/mm/mmu.c:442:17: note: in expansion of macro 'BUG_ON'
     442 |                 BUG_ON(!ptdesc_pte_dtor(ptdesc));
         |                 ^~~~~~


vim +440 arch/arm64/mm/mmu.c

   425	
   426	static phys_addr_t pgd_pgtable_alloc(int shift)
   427	{
   428		phys_addr_t pa = __pgd_pgtable_alloc(shift);
   429		struct ptdesc *ptdesc = page_ptdesc(phys_to_page(pa));
   430	
   431		/*
   432		 * Call proper page table ctor in case later we need to
   433		 * call core mm functions like apply_to_page_range() on
   434		 * this pre-allocated page table.
   435		 *
   436		 * We don't select ARCH_ENABLE_SPLIT_PMD_PTLOCK if pmd is
   437		 * folded, and if so ptdesc_pte_dtor() becomes nop.
   438		 */
   439		if (shift == PAGE_SHIFT)
 > 440			BUG_ON(!ptdesc_pte_dtor(ptdesc));
   441		else if (shift == PMD_SHIFT)
   442			BUG_ON(!ptdesc_pte_dtor(ptdesc));
   443	
   444		return pa;
   445	}
   446	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

