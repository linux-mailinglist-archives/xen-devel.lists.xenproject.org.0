Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 109BAB82AF6
	for <lists+xen-devel@lfdr.de>; Thu, 18 Sep 2025 04:47:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1125880.1467675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uz4ep-00020Y-KW; Thu, 18 Sep 2025 02:46:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1125880.1467675; Thu, 18 Sep 2025 02:46:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uz4ep-0001xl-EI; Thu, 18 Sep 2025 02:46:03 +0000
Received: by outflank-mailman (input) for mailman id 1125880;
 Thu, 18 Sep 2025 02:46:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFeD=35=intel.com=lkp@srs-se1.protection.inumbo.net>)
 id 1uz4eo-0001xZ-CJ
 for xen-devel@lists.xenproject.org; Thu, 18 Sep 2025 02:46:02 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a0ad899-9439-11f0-9809-7dc792cee155;
 Thu, 18 Sep 2025 04:45:58 +0200 (CEST)
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 19:45:56 -0700
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
 by fmviesa007.fm.intel.com with ESMTP; 17 Sep 2025 19:45:50 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uz4ea-0002f9-0T;
 Thu, 18 Sep 2025 02:45:48 +0000
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
X-Inumbo-ID: 9a0ad899-9439-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758163559; x=1789699559;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MGtmbYJr4izzxh9Q5fjjfxZ6vSiqc+Pmx0sDfZpsERU=;
  b=OoWePRmyBgaZU5T9GUvdj9DAvHE+ukWnmFsiMlLbu1AoudYTvfE1/xO6
   OWSgBsifuDMoi6il4eZik3W/tBnrkNwknyDU7MIOahCtFKevz6qpTZNkF
   27d8oWgi4yWVb3lqKfCfKv7RFVSqX8eCNF1MJ530nkAVWoWPA6SCsEOEP
   QzjMkG3vb/VuglicluKQPI0TWGUiGYYgJTYyNHMcwegDKHDjtWqXPEDVd
   BRKCv86qgftpQhd5Ke68e1k044MDNowZA6Jq2ZBcllFlpSOWkjZEXyHnU
   qwpMKvVObJ7aCmdCg4RDZE1B6QzzolKKBDvzVkPq4CFVNFEQAWj87AtkT
   w==;
X-CSE-ConnectionGUID: QnWNU6hSStG3VgKUza8P/A==
X-CSE-MsgGUID: DDyWc5KJTGGhzCkrTH9qjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="71908145"
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; 
   d="scan'208";a="71908145"
X-CSE-ConnectionGUID: BKE0jq5BSkG7P9Qe24Ll7w==
X-CSE-MsgGUID: 9xb6ixm/TWyg48SGy4T1TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; 
   d="scan'208";a="175012948"
Date: Thu, 18 Sep 2025 10:45:17 +0800
From: kernel test robot <lkp@intel.com>
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, linux-hyperv@vger.kernel.org,
	virtualization@lists.linux.dev, kvm@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Juergen Gross <jgross@suse.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 21/21] x86/pvlocks: Move paravirt spinlock functions
 into own header
Message-ID: <202509181008.MoLd2u4e-lkp@intel.com>
References: <20250917145220.31064-22-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917145220.31064-22-jgross@suse.com>

Hi Juergen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on kvm/queue kvm/next linus/master v6.17-rc6 next-20250917]
[cannot apply to tip/x86/core kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Juergen-Gross/x86-paravirt-Remove-not-needed-includes-of-paravirt-h/20250917-230321
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20250917145220.31064-22-jgross%40suse.com
patch subject: [PATCH v2 21/21] x86/pvlocks: Move paravirt spinlock functions into own header
config: x86_64-randconfig-003-20250918 (https://download.01.org/0day-ci/archive/20250918/202509181008.MoLd2u4e-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250918/202509181008.MoLd2u4e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509181008.MoLd2u4e-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/paravirt-spinlocks.c:13:13: warning: no previous prototype for function 'native_pv_lock_init' [-Wmissing-prototypes]
      13 | void __init native_pv_lock_init(void)
         |             ^
   arch/x86/kernel/paravirt-spinlocks.c:13:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      13 | void __init native_pv_lock_init(void)
         | ^
         | static 
   1 warning generated.


vim +/native_pv_lock_init +13 arch/x86/kernel/paravirt-spinlocks.c

    12	
  > 13	void __init native_pv_lock_init(void)
    14	{
    15		if (boot_cpu_has(X86_FEATURE_HYPERVISOR))
    16			static_branch_enable(&virt_spin_lock_key);
    17	}
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

