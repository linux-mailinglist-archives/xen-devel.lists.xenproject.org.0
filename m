Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDC06C4144
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 04:47:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513082.793558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pepRf-00079u-O8; Wed, 22 Mar 2023 03:47:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513082.793558; Wed, 22 Mar 2023 03:47:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pepRf-00077b-KG; Wed, 22 Mar 2023 03:47:27 +0000
Received: by outflank-mailman (input) for mailman id 513082;
 Wed, 22 Mar 2023 03:47:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Fm+Y=7O=intel.com=lkp@srs-se1.protection.inumbo.net>)
 id 1pepRe-00077V-69
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 03:47:26 +0000
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e848e2b-c864-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 04:47:21 +0100 (CET)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 20:47:18 -0700
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 21 Mar 2023 20:47:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pepRS-000Cpm-1r;
 Wed, 22 Mar 2023 03:47:14 +0000
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
X-Inumbo-ID: 3e848e2b-c864-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679456841; x=1710992841;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ax/5HXwsD/I9SKeAJs9UglIbzGQ09dU9mhXvqOtMefU=;
  b=Azf2EEsr3J5rs+wvT9HSH1Lyl4A+0hy9pUJuFiVITyUmXtp39srggHT4
   erk0rn3qbLi6/FFRbcq3DHD8kB7UKERIV3VGDR/e8FkUqxT4fNk3P1+5h
   k1Fxws9ImFKORU68LAlmNgnxQfCjjJsDUam2ulrzVmVRxJYK577cFBSf/
   brWXynpbAEzcZkG0uvQ1YImBymrEJg9SpUOYS2Sl3LVo08JoJPOAeKxKn
   InDKg3EDP2dmqqp7rzXqWBfy8k86vN4zHH7tsj0S0RFh1vCcSun0rtj3s
   lDob2+SXyV9jjfxMT8bG0b+I58f2lrifJoPsJET5QZiMpXjf6IDlNslj2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="340655840"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; 
   d="scan'208";a="340655840"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="825227609"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; 
   d="scan'208";a="825227609"
Date: Wed, 22 Mar 2023 11:47:04 +0800
From: kernel test robot <lkp@intel.com>
To: Roger Pau Monne <roger.pau@citrix.com>, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	xen-devel@lists.xenproject.org,
	Roger Pau Monne <roger.pau@citrix.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>,
	Alex Chiang <achiang@hp.com>, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v5] ACPI: processor: Fix evaluating _PDC method when
 running as Xen dom0
Message-ID: <202303221107.hgKqaZl0-lkp@intel.com>
References: <20230321141904.49177-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230321141904.49177-1-roger.pau@citrix.com>

Hi Roger,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on xen-tip/linux-next]
[also build test ERROR on rafael-pm/linux-next linus/master v6.3-rc3 next-20230321]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Roger-Pau-Monne/ACPI-processor-Fix-evaluating-_PDC-method-when-running-as-Xen-dom0/20230321-221950
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git linux-next
patch link:    https://lore.kernel.org/r/20230321141904.49177-1-roger.pau%40citrix.com
patch subject: [PATCH v5] ACPI: processor: Fix evaluating _PDC method when running as Xen dom0
config: arm64-randconfig-r013-20230319 (https://download.01.org/0day-ci/archive/20230322/202303221107.hgKqaZl0-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/4232c8b37a0415e1e828fef4ce522c93a0b925fc
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Roger-Pau-Monne/ACPI-processor-Fix-evaluating-_PDC-method-when-running-as-Xen-dom0/20230321-221950
        git checkout 4232c8b37a0415e1e828fef4ce522c93a0b925fc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303221107.hgKqaZl0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/xen/../../arm/xen/enlighten.c:2:
>> include/xen/xen.h:79:2: error: call to undeclared function 'BUG'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           BUG();
           ^
   In file included from arch/arm64/xen/../../arm/xen/enlighten.c:4:
   In file included from include/xen/grant_table.h:48:
   In file included from include/xen/page.h:28:
   In file included from arch/arm64/include/asm/xen/page.h:1:
   In file included from include/xen/arm/page.h:9:
   In file included from include/linux/dma-mapping.h:7:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:141:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                           ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/arm64/xen/../../arm/xen/enlighten.c:4:
   In file included from include/xen/grant_table.h:48:
   In file included from include/xen/page.h:28:
   In file included from arch/arm64/include/asm/xen/page.h:1:
   In file included from include/xen/arm/page.h:9:
   In file included from include/linux/dma-mapping.h:7:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:141:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/arm64/xen/../../arm/xen/enlighten.c:4:
   In file included from include/xen/grant_table.h:48:
   In file included from include/xen/page.h:28:
   In file included from arch/arm64/include/asm/xen/page.h:1:
   In file included from include/xen/arm/page.h:9:
   In file included from include/linux/dma-mapping.h:7:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:141:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
                           set->sig[1] | set->sig[0]) == 0;
                           ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/arm64/xen/../../arm/xen/enlighten.c:4:
   In file included from include/xen/grant_table.h:48:
   In file included from include/xen/page.h:28:
   In file included from arch/arm64/include/asm/xen/page.h:1:
   In file included from include/xen/arm/page.h:9:
   In file included from include/linux/dma-mapping.h:7:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:141:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:100:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
                   return (set->sig[1] | set->sig[0]) == 0;
                           ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/arm64/xen/../../arm/xen/enlighten.c:4:
   In file included from include/xen/grant_table.h:48:
   In file included from include/xen/page.h:28:
   In file included from arch/arm64/include/asm/xen/page.h:1:
   In file included from include/xen/arm/page.h:9:
   In file included from include/linux/dma-mapping.h:7:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:141:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:


vim +/BUG +79 include/xen/xen.h

    73	
    74	#if defined(CONFIG_XEN_DOM0) && defined(CONFIG_ACPI) && defined(CONFIG_X86)
    75	bool __init xen_processor_present(uint32_t acpi_id);
    76	#else
    77	static inline bool xen_processor_present(uint32_t acpi_id)
    78	{
  > 79		BUG();
    80		return false;
    81	}
    82	#endif
    83	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

