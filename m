Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C61953F6A
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2024 04:12:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778357.1188405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1semRR-0007FM-9Z; Fri, 16 Aug 2024 02:11:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778357.1188405; Fri, 16 Aug 2024 02:11:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1semRR-0007DG-6L; Fri, 16 Aug 2024 02:11:49 +0000
Received: by outflank-mailman (input) for mailman id 778357;
 Fri, 16 Aug 2024 02:11:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m3Oh=PP=intel.com=lkp@srs-se1.protection.inumbo.net>)
 id 1semRQ-0007DA-0I
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2024 02:11:48 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e030f989-5b74-11ef-a505-bb4a2ccca743;
 Fri, 16 Aug 2024 04:11:45 +0200 (CEST)
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 19:11:40 -0700
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 15 Aug 2024 19:11:36 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1semRB-0005rE-1y;
 Fri, 16 Aug 2024 02:11:33 +0000
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
X-Inumbo-ID: e030f989-5b74-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723774306; x=1755310306;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OOX2cGxCVM34YKQyi56frg88mnAg+Wq/NAETYLvmLkY=;
  b=Ss6abMsfvb7EmaNRTdbWdqqdTvyoduTWqfwGmgKBVvb/0kBtVdLnFxVs
   ze5mEvkigH4WYktoyOtm146DA+zZwu2WjsxqKoL+mpiAIqDgHcCdzqHBH
   ScTZSuianzbpiDFsWd8BzVnML1JxrVA4vd66t8/b0evnzxsT3w1a05KHx
   Ru8VG1p8Rs061lsOk1lRPfqicTZdJl5Kcbw3fTD9fUKzgOnxGIDlUaoVi
   CeomNyjdOcmJHdu+WOs3GY2sS5AkAEDtda9Pit/RoKd7ryXZrQg3HfTLS
   YLhL9X1SoHKYVGQC4ACjz3UlJiwY64zip/Ra6JSZ42hsxXu6qrL49BZZl
   Q==;
X-CSE-ConnectionGUID: mAFspmlITRyT+V/cRS7ctg==
X-CSE-MsgGUID: hso4ktRgQxms5crWfzldEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="32636680"
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; 
   d="scan'208";a="32636680"
X-CSE-ConnectionGUID: WwZsS+P0TomZpW046Balqg==
X-CSE-MsgGUID: axJ7B6N6Skal0/Hc4Tm5rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; 
   d="scan'208";a="59821404"
Date: Fri, 16 Aug 2024 10:10:59 +0800
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
Message-ID: <202408160915.PcKFvj8w-lkp@intel.com>
References: <20240814195053.5564-6-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814195053.5564-6-jason.andryuk@amd.com>

Hi Jason,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on xen-tip/linux-next tip/master linus/master v6.11-rc3 next-20240815]
[cannot apply to tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Andryuk/xen-sync-elfnote-h-from-xen-tree/20240815-035238
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20240814195053.5564-6-jason.andryuk%40amd.com
patch subject: [PATCH v2 5/5] x86/pvh: Add 64bit relocation page tables
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240816/202408160915.PcKFvj8w-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240816/202408160915.PcKFvj8w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408160915.PcKFvj8w-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/pgtable_64.h:6,
                    from arch/x86/platform/pvh/head.S:19:
>> arch/x86/include/asm/pgtable_64_types.h:49: warning: "SHARED_KERNEL_PMD" redefined
      49 | #define SHARED_KERNEL_PMD       0
         | 
   In file included from arch/x86/include/asm/pgtable_32_types.h:11,
                    from arch/x86/include/asm/pgtable_types.h:275,
                    from arch/x86/include/asm/boot.h:6,
                    from arch/x86/platform/pvh/head.S:18:
   arch/x86/include/asm/pgtable-3level_types.h:30: note: this is the location of the previous definition
      30 | #define SHARED_KERNEL_PMD       (!static_cpu_has(X86_FEATURE_PTI))
         | 
   arch/x86/include/asm/pgtable_64_types.h:75: warning: "PGDIR_SHIFT" redefined
      75 | #define PGDIR_SHIFT             39
         | 
   arch/x86/include/asm/pgtable-3level_types.h:37: note: this is the location of the previous definition
      37 | #define PGDIR_SHIFT     30
         | 
>> arch/x86/include/asm/pgtable_64_types.h:76: warning: "PTRS_PER_PGD" redefined
      76 | #define PTRS_PER_PGD            512
         | 
   arch/x86/include/asm/pgtable-3level_types.h:38: note: this is the location of the previous definition
      38 | #define PTRS_PER_PGD    4
         | 
   arch/x86/include/asm/pgtable_64_types.h:99: warning: "PMD_SIZE" redefined
      99 | #define PMD_SIZE        (_AC(1, UL) << PMD_SHIFT)
         | 
   arch/x86/include/asm/pgtable_32_types.h:12: note: this is the location of the previous definition
      12 | # define PMD_SIZE       (1UL << PMD_SHIFT)
         | 
   arch/x86/include/asm/pgtable_64_types.h:103: warning: "PGDIR_SIZE" redefined
     103 | #define PGDIR_SIZE      (_AC(1, UL) << PGDIR_SHIFT)
         | 
   arch/x86/include/asm/pgtable_32_types.h:20: note: this is the location of the previous definition
      20 | #define PGDIR_SIZE      (1UL << PGDIR_SHIFT)
         | 
>> arch/x86/include/asm/pgtable_64_types.h:210: warning: "PGD_KERNEL_START" redefined
     210 | #define PGD_KERNEL_START        ((PAGE_SIZE / 2) / sizeof(pgd_t))
         | 
   arch/x86/include/asm/pgtable-3level_types.h:53: note: this is the location of the previous definition
      53 | #define PGD_KERNEL_START        (CONFIG_PAGE_OFFSET >> PGDIR_SHIFT)
         | 
   arch/x86/include/asm/pgtable_64.h: Assembler messages:
>> arch/x86/include/asm/pgtable_64.h:279: Error: invalid operands (*UND* and *ABS* sections) for `>>'


vim +279 arch/x86/include/asm/pgtable_64.h

09ef8f8e864fcb Jason Andryuk 2024-08-14  278  
09ef8f8e864fcb Jason Andryuk 2024-08-14 @279  L4_PAGE_OFFSET = l4_index(__PAGE_OFFSET_BASE_L4)
09ef8f8e864fcb Jason Andryuk 2024-08-14  280  L4_START_KERNEL = l4_index(__START_KERNEL_map)
09ef8f8e864fcb Jason Andryuk 2024-08-14  281  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

