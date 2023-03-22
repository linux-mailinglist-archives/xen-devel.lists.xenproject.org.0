Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C63C6C403E
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 03:16:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513060.793508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peo0Z-00034N-17; Wed, 22 Mar 2023 02:15:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513060.793508; Wed, 22 Mar 2023 02:15:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peo0Y-00031b-S8; Wed, 22 Mar 2023 02:15:22 +0000
Received: by outflank-mailman (input) for mailman id 513060;
 Wed, 22 Mar 2023 02:15:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Fm+Y=7O=intel.com=lkp@srs-se1.protection.inumbo.net>)
 id 1peo0X-00031V-Mn
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 02:15:22 +0000
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61ba9056-c857-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 03:15:17 +0100 (CET)
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 19:15:12 -0700
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 21 Mar 2023 19:15:09 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1peo0K-000Ch8-0k;
 Wed, 22 Mar 2023 02:15:08 +0000
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
X-Inumbo-ID: 61ba9056-c857-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679451317; x=1710987317;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Zkutf1Yva2S5sDuaQ/5qW6PUkaAWInQ2qoCKwvKC4ms=;
  b=B09rYJUrbJ5Klv/eBD3JgENNj3lMSVriOqOHofQ2BrJ1PGpIb4/3CU9A
   bGilSM0IL8S92FLyvZoUZu+c9owCLAK0+VyFMz1SLgXDjXa5SB4ChLYBf
   qeKuWbFHaF7uRbCE5+YxPRynWplWqBdAu47JbqCV/PkelsciY0O6Les/F
   NLEdlsqIDU0i/fgKz4h1O1mHBlTIRUnIQNMucEekNADdgkZc+1+UgfU6R
   MbDd7i9sueMxWw+G6hbPu12+oxWVbkCUeoZ+phox7MfFNNhuEqfi7FIZt
   ITcoaKOZEiGT70yh7JuSLe8QsVZxaY3luQOc+wMc0A73jbH9xwSyKix1p
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="401677805"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; 
   d="scan'208";a="401677805"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="746127578"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; 
   d="scan'208";a="746127578"
Date: Wed, 22 Mar 2023 10:14:09 +0800
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
Message-ID: <202303221035.BFY5kyh1-lkp@intel.com>
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
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20230322/202303221035.BFY5kyh1-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/4232c8b37a0415e1e828fef4ce522c93a0b925fc
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Roger-Pau-Monne/ACPI-processor-Fix-evaluating-_PDC-method-when-running-as-Xen-dom0/20230321-221950
        git checkout 4232c8b37a0415e1e828fef4ce522c93a0b925fc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303221035.BFY5kyh1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/xen/suspend_hvm.c:4:
>> include/xen/xen.h:79:2: error: implicit declaration of function 'BUG' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           BUG();
           ^
   1 error generated.


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

