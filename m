Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C828762772
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 01:36:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569988.891208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qORYO-0000cr-Au; Tue, 25 Jul 2023 23:34:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569988.891208; Tue, 25 Jul 2023 23:34:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qORYO-0000aK-7e; Tue, 25 Jul 2023 23:34:56 +0000
Received: by outflank-mailman (input) for mailman id 569988;
 Tue, 25 Jul 2023 23:34:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I1ML=DL=intel.com=lkp@srs-se1.protection.inumbo.net>)
 id 1qORYM-0000aE-1E
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 23:34:54 +0000
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7b77bb6-2b43-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 01:34:49 +0200 (CEST)
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 16:34:46 -0700
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
 by orsmga008.jf.intel.com with ESMTP; 25 Jul 2023 16:34:40 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qORY7-0000Qn-2W;
 Tue, 25 Jul 2023 23:34:39 +0000
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
X-Inumbo-ID: d7b77bb6-2b43-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690328089; x=1721864089;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C5xyKe5/WjYZUNBE8/1FHjpgxl/fMdUuo5xkgVP7J8Y=;
  b=kprEQkvDUSYB8VY754hEFOqF9OPVst5QCXBOombACoxddVdAJ8Mbz8BO
   y9j/KrfHTk0kNkhfEjXQ4yyYfSYlXsID0sZf9EIi/TX/LVvMyZop1imT1
   64drc3Kd0NKooYGQmtnluxbjXPtzNonbi2AjsEfyh3fCNbE97dgA2E1xx
   aaMJLxRLAvRgg3DdTPC34a3yt2ZxKKe/CslwvJn3r42X3sqowcsjUBjQB
   dx252wRrrF9rDLbw+TCCIsr/0xZ113UfcaSUUuRc19bOhFluME1UWyRw+
   xYejA5PKL7S0aB2oQJYOBJaBmZ8Dv4PdkJNAh/qxn/GIqPGRtCVMeqIah
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="366747677"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="366747677"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="755945611"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="755945611"
Date: Wed, 26 Jul 2023 07:33:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
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
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH mm-unstable v7 12/31] powerpc: Convert various functions
 to use ptdescs
Message-ID: <202307260706.qNPJSnjR-lkp@intel.com>
References: <20230725042051.36691-13-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230725042051.36691-13-vishal.moola@gmail.com>

Hi Vishal,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on next-20230725]
[cannot apply to powerpc/next powerpc/fixes s390/features geert-m68k/for-next geert-m68k/for-linus linus/master v6.5-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vishal-Moola-Oracle/mm-Add-PAGE_TYPE_OP-folio-functions/20230725-122458
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230725042051.36691-13-vishal.moola%40gmail.com
patch subject: [PATCH mm-unstable v7 12/31] powerpc: Convert various functions to use ptdescs
config: powerpc-randconfig-r034-20230725 (https://download.01.org/0day-ci/archive/20230726/202307260706.qNPJSnjR-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307260706.qNPJSnjR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307260706.qNPJSnjR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/mm/pgtable-frag.c:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:45:1: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
      45 | DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      46 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     669 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:40:1: note: expanded from here
      40 | __do_insw
         | ^
   arch/powerpc/include/asm/io.h:610:56: note: expanded from macro '__do_insw'
     610 | #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
         |                                        ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/mm/pgtable-frag.c:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:47:1: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
      47 | DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      48 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     669 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:42:1: note: expanded from here
      42 | __do_insl
         | ^
   arch/powerpc/include/asm/io.h:611:56: note: expanded from macro '__do_insl'
     611 | #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
         |                                        ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/mm/pgtable-frag.c:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:49:1: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
      49 | DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      50 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     669 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:44:1: note: expanded from here
      44 | __do_outsb
         | ^
   arch/powerpc/include/asm/io.h:612:58: note: expanded from macro '__do_outsb'
     612 | #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/mm/pgtable-frag.c:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:51:1: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
      51 | DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      52 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     669 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:46:1: note: expanded from here
      46 | __do_outsw
         | ^
   arch/powerpc/include/asm/io.h:613:58: note: expanded from macro '__do_outsw'
     613 | #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/mm/pgtable-frag.c:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:53:1: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
      53 | DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      54 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     669 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:48:1: note: expanded from here
      48 | __do_outsl
         | ^
   arch/powerpc/include/asm/io.h:614:58: note: expanded from macro '__do_outsl'
     614 | #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
>> arch/powerpc/mm/pgtable-frag.c:125:22: error: use of undeclared identifier 'page'
     125 |         BUG_ON(atomic_read(&page->pt_frag_refcount) <= 0);
         |                             ^
   7 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=y] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]


vim +/page +125 arch/powerpc/mm/pgtable-frag.c

0203dd58d897cbd Hugh Dickins          2023-07-11  117  
a95d133c8643cae Christophe Leroy      2018-11-29  118  void pte_fragment_free(unsigned long *table, int kernel)
a95d133c8643cae Christophe Leroy      2018-11-29  119  {
e18a6b21f4c0c0c Vishal Moola (Oracle  2023-07-24  120) 	struct ptdesc *ptdesc = virt_to_ptdesc(table);
a95d133c8643cae Christophe Leroy      2018-11-29  121  
e18a6b21f4c0c0c Vishal Moola (Oracle  2023-07-24  122) 	if (pagetable_is_reserved(ptdesc))
e18a6b21f4c0c0c Vishal Moola (Oracle  2023-07-24  123) 		return free_reserved_ptdesc(ptdesc);
645d5ce2f7d6cb4 Aneesh Kumar K.V      2020-07-09  124  
a95d133c8643cae Christophe Leroy      2018-11-29 @125  	BUG_ON(atomic_read(&page->pt_frag_refcount) <= 0);
e18a6b21f4c0c0c Vishal Moola (Oracle  2023-07-24  126) 	if (atomic_dec_and_test(&ptdesc->pt_frag_refcount)) {
0203dd58d897cbd Hugh Dickins          2023-07-11  127  		if (kernel)
e18a6b21f4c0c0c Vishal Moola (Oracle  2023-07-24  128) 			pagetable_free(ptdesc);
e18a6b21f4c0c0c Vishal Moola (Oracle  2023-07-24  129) 		else if (folio_test_clear_active(ptdesc_folio(ptdesc)))
e18a6b21f4c0c0c Vishal Moola (Oracle  2023-07-24  130) 			call_rcu(&ptdesc->pt_rcu_head, pte_free_now);
0203dd58d897cbd Hugh Dickins          2023-07-11  131  		else
e18a6b21f4c0c0c Vishal Moola (Oracle  2023-07-24  132) 			pte_free_now(&ptdesc->pt_rcu_head);
0203dd58d897cbd Hugh Dickins          2023-07-11  133  	}
a95d133c8643cae Christophe Leroy      2018-11-29  134  }
0203dd58d897cbd Hugh Dickins          2023-07-11  135  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

