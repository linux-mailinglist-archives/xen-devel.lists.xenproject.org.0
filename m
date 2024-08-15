Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F2F953DA0
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2024 00:56:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778299.1188364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sejOY-0000Za-P4; Thu, 15 Aug 2024 22:56:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778299.1188364; Thu, 15 Aug 2024 22:56:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sejOY-0000XS-MR; Thu, 15 Aug 2024 22:56:38 +0000
Received: by outflank-mailman (input) for mailman id 778299;
 Thu, 15 Aug 2024 22:56:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pCfw=PO=intel.com=lkp@srs-se1.protection.inumbo.net>)
 id 1sejOX-0000XM-FB
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2024 22:56:38 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9dae165b-5b59-11ef-a505-bb4a2ccca743;
 Fri, 16 Aug 2024 00:56:34 +0200 (CEST)
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 15:56:32 -0700
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 15 Aug 2024 15:56:28 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sejOM-0005hO-03;
 Thu, 15 Aug 2024 22:56:26 +0000
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
X-Inumbo-ID: 9dae165b-5b59-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723762594; x=1755298594;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DnWQIIqu3hNQSN2Nb1clnrON51RvUjFBm/tcymd+D00=;
  b=Nd9Lj64AKn3LHlZA4uHO6gW4uSsMk4ts/oPDxyzCdkM7JrF3ipzzxIAv
   wEvRwWECQ/CLTzPjQpZ9u1Tnv/1xSz1R6KufLscY2LhJHGPL+tgHSEFiv
   RmNSHcFFFky7TZ++LakyKcRsvhl0onwr4xnYZFlSg1Vkd4rwjwlpE/sVb
   VwcBFBriZ/CTKbkMR+GLiN72plV0Rtk2wY7WGl1Hg+c9sYIFXpg+wj4O8
   +U3ZpfT82gQlKyzlvZLkDSYJ8P6p2q1hrtzFyITDTxAseAgo4lGk98A+W
   B2hp7ZDc+RejA6FsJaFw6Z5wZ0toZ3RIxNZOZE8RvtterAWLVTncX7C9o
   g==;
X-CSE-ConnectionGUID: s3OV9UGsQjqQ27gq91/ZBw==
X-CSE-MsgGUID: dFZUgE+pT/qRnYzh1zg3TQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="32718290"
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; 
   d="scan'208";a="32718290"
X-CSE-ConnectionGUID: pNnSBi+4QnuPB1Eg0n47TA==
X-CSE-MsgGUID: 0pMppDA9RwGuvV5skoCVoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; 
   d="scan'208";a="90275308"
Date: Fri, 16 Aug 2024 06:55:30 +0800
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
Cc: oe-kbuild-all@lists.linux.dev, xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v2 5/5] x86/pvh: Add 64bit relocation page tables
Message-ID: <202408160603.fDLxZmqp-lkp@intel.com>
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
config: i386-randconfig-052-20240815 (https://download.01.org/0day-ci/archive/20240816/202408160603.fDLxZmqp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240816/202408160603.fDLxZmqp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408160603.fDLxZmqp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/pgtable_64.h:6,
                    from arch/x86/platform/pvh/head.S:19:
   arch/x86/include/asm/pgtable_64_types.h:75: warning: "PGDIR_SHIFT" redefined
      75 | #define PGDIR_SHIFT             39
         | 
   In file included from arch/x86/include/asm/pgtable_32_types.h:15,
                    from arch/x86/include/asm/pgtable_types.h:275,
                    from arch/x86/include/asm/boot.h:6,
                    from arch/x86/platform/pvh/head.S:18:
   arch/x86/include/asm/pgtable-2level_types.h:29: note: this is the location of the previous definition
      29 | #define PGDIR_SHIFT     22
         | 
   arch/x86/include/asm/pgtable_64_types.h:76: warning: "PTRS_PER_PGD" redefined
      76 | #define PTRS_PER_PGD            512
         | 
   arch/x86/include/asm/pgtable-2level_types.h:30: note: this is the location of the previous definition
      30 | #define PTRS_PER_PGD    1024
         | 
>> arch/x86/include/asm/pgtable_64_types.h:97: warning: "PTRS_PER_PTE" redefined
      97 | #define PTRS_PER_PTE    512
         | 
   arch/x86/include/asm/pgtable-2level_types.h:38: note: this is the location of the previous definition
      38 | #define PTRS_PER_PTE    1024
         | 
   arch/x86/include/asm/pgtable_64_types.h:103: warning: "PGDIR_SIZE" redefined
     103 | #define PGDIR_SIZE      (_AC(1, UL) << PGDIR_SHIFT)
         | 
   arch/x86/include/asm/pgtable_32_types.h:20: note: this is the location of the previous definition
      20 | #define PGDIR_SIZE      (1UL << PGDIR_SHIFT)
         | 
   arch/x86/include/asm/pgtable_64_types.h:210: warning: "PGD_KERNEL_START" redefined
     210 | #define PGD_KERNEL_START        ((PAGE_SIZE / 2) / sizeof(pgd_t))
         | 
   arch/x86/include/asm/pgtable-2level_types.h:41: note: this is the location of the previous definition
      41 | #define PGD_KERNEL_START        (CONFIG_PAGE_OFFSET >> PGDIR_SHIFT)
         | 
   arch/x86/include/asm/pgtable_64.h: Assembler messages:
   arch/x86/include/asm/pgtable_64.h:279: Error: invalid operands (*UND* and *ABS* sections) for `>>'


vim +/PTRS_PER_PTE +97 arch/x86/include/asm/pgtable_64_types.h

b8504058a06bd1 Kirill A. Shutemov  2017-03-30  71  
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  72  /*
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  73   * PGDIR_SHIFT determines what a top-level page table entry can map
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  74   */
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  75  #define PGDIR_SHIFT		39
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08 @76  #define PTRS_PER_PGD		512
c65e774fb3f6af Kirill A. Shutemov  2018-02-14  77  #define MAX_PTRS_PER_P4D	1
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  78  
b8504058a06bd1 Kirill A. Shutemov  2017-03-30  79  #endif /* CONFIG_X86_5LEVEL */
b8504058a06bd1 Kirill A. Shutemov  2017-03-30  80  
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  81  /*
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  82   * 3rd level page
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  83   */
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  84  #define PUD_SHIFT	30
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  85  #define PTRS_PER_PUD	512
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  86  
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  87  /*
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  88   * PMD_SHIFT determines the size of the area a middle-level
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  89   * page table can map
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  90   */
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  91  #define PMD_SHIFT	21
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  92  #define PTRS_PER_PMD	512
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  93  
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  94  /*
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  95   * entries per page directory level
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  96   */
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08 @97  #define PTRS_PER_PTE	512
fb3551491b2044 Jeremy Fitzhardinge 2009-02-08  98  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

