Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD67A7CA09
	for <lists+xen-devel@lfdr.de>; Sat,  5 Apr 2025 17:57:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.938964.1339328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u15t0-0002b8-Er; Sat, 05 Apr 2025 15:56:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 938964.1339328; Sat, 05 Apr 2025 15:56:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u15t0-0002Yg-Bp; Sat, 05 Apr 2025 15:56:46 +0000
Received: by outflank-mailman (input) for mailman id 938964;
 Sat, 05 Apr 2025 15:56:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f13i=WX=intel.com=lkp@srs-se1.protection.inumbo.net>)
 id 1u15sy-0002Ya-3v
 for xen-devel@lists.xenproject.org; Sat, 05 Apr 2025 15:56:44 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8eaafa9b-1236-11f0-9eaa-5ba50f476ded;
 Sat, 05 Apr 2025 17:56:40 +0200 (CEST)
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2025 08:56:37 -0700
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 05 Apr 2025 08:56:34 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1u15sl-00028B-2b;
 Sat, 05 Apr 2025 15:56:31 +0000
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
X-Inumbo-ID: 8eaafa9b-1236-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743868600; x=1775404600;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l2vXHFW49XxHHHkNIgLn8Ijs9q+hx64EoXxG3KaCq3g=;
  b=bTJwob7nfmcezGpI/XnfocvFA8s45pXU/9unHG//B902Vn69W79zhenO
   i+kSHvtIxHVLfLU2141NJlAFglMkH4U5oEQpwJsa/hjJ9lNRpKW2iicjq
   RdaO1DRAGGQXTujicjiulpInspi18x58yihbqONVel1KPflFUKBYVndCy
   kJuOO3Y/UTkrUCIRTfkughRSNxq3iyVRiuNEtkBXorxh52cX/GkpG6IpI
   7kiEdB9UtMgWLmzriUIrYdfW2YJHGChLLzO7FgsHVmmK6Wo0DLM1iwHPG
   s09YZDs1m4k/0ivxZIkwKy+lKOu7S7YyDm/XiTo/BrPqGHbU7tEXK+U+8
   g==;
X-CSE-ConnectionGUID: RE0ZIY/qTpmP43r5pKAY0A==
X-CSE-MsgGUID: 86FZwmt0Ro63kvNG25r5yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="56670394"
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; 
   d="scan'208";a="56670394"
X-CSE-ConnectionGUID: Tx+rfS8cSc6qdurkrXso9w==
X-CSE-MsgGUID: /Bwu7ftWSsW9TUWtnRsVkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; 
   d="scan'208";a="150766546"
Date: Sat, 5 Apr 2025 23:55:56 +0800
From: kernel test robot <lkp@intel.com>
To: Roger Pau Monne <roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH v2] x86/xen: fix balloon target initialization for PVH
 dom0
Message-ID: <202504052301.dMtJILzp-lkp@intel.com>
References: <20250404133459.16125-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404133459.16125-1-roger.pau@citrix.com>

Hi Roger,

kernel test robot noticed the following build errors:

[auto build test ERROR on xen-tip/linux-next]
[also build test ERROR on tip/x86/core linus/master v6.14 next-20250404]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Roger-Pau-Monne/x86-xen-fix-balloon-target-initialization-for-PVH-dom0/20250404-214218
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git linux-next
patch link:    https://lore.kernel.org/r/20250404133459.16125-1-roger.pau%40citrix.com
patch subject: [PATCH v2] x86/xen: fix balloon target initialization for PVH dom0
config: x86_64-buildonly-randconfig-003-20250405 (https://download.01.org/0day-ci/archive/20250405/202504052301.dMtJILzp-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504052301.dMtJILzp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504052301.dMtJILzp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: xen_released_pages
   >>> referenced by balloon.c
   >>>               drivers/xen/balloon.o:(balloon_init) in archive vmlinux.a
   >>> referenced by balloon.c
   >>>               drivers/xen/balloon.o:(balloon_init) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

