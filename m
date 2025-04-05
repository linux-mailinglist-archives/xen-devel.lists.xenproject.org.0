Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06530A7C91F
	for <lists+xen-devel@lfdr.de>; Sat,  5 Apr 2025 14:49:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.938932.1339319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u12wz-0003gz-Lw; Sat, 05 Apr 2025 12:48:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 938932.1339319; Sat, 05 Apr 2025 12:48:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u12wz-0003dr-Ip; Sat, 05 Apr 2025 12:48:41 +0000
Received: by outflank-mailman (input) for mailman id 938932;
 Sat, 05 Apr 2025 12:48:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f13i=WX=intel.com=lkp@srs-se1.protection.inumbo.net>)
 id 1u12wy-0003df-3J
 for xen-devel@lists.xenproject.org; Sat, 05 Apr 2025 12:48:40 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a3523c2-121c-11f0-9eaa-5ba50f476ded;
 Sat, 05 Apr 2025 14:48:38 +0200 (CEST)
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2025 05:46:23 -0700
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
 by orviesa003.jf.intel.com with ESMTP; 05 Apr 2025 05:46:19 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1u12uf-00021r-15;
 Sat, 05 Apr 2025 12:46:17 +0000
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
X-Inumbo-ID: 4a3523c2-121c-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743857318; x=1775393318;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rEKB5o3tXinJ0e4nM3y2sFbzk380OYk6wMscqAt4kac=;
  b=JFi2eBcfuNTyXjSXFQdwrvSP83sNTzBLUoB1IOqnqROQzxsAygqiiejl
   Wy3T+VzN4LUkWAmMMaCM9AL4vEJiA79hYBsCdE4fUaVZo8JQR3e1FeS7o
   cdzoCrjNueuYHn2Wp+QUH0sgnIQe0GEcCMqp0TidOtR7NxWYxKAf/BFQj
   8ADRqtBsDXhBgmmHNimL/phBugp0VRP8ARPG2EJiaKu4QJbaCKGVbPoet
   T+oFbuO2bIfBp+KIRXlR1oGTSy8hOgHe9Qsu4t7a9JhyD8TETBdxmFnXp
   qi3ukyWBk7tjrHAOvtYqKuKhwTK80IbnAGJWgbPCx8GHOnYMDQAJEl+i+
   w==;
X-CSE-ConnectionGUID: i6SMgtmVSjaKttf1GCS8zw==
X-CSE-MsgGUID: OqN2iih7RKC2bdaaTQEwlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="44435479"
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; 
   d="scan'208";a="44435479"
X-CSE-ConnectionGUID: FKz5BdQuSRG15LyZFBxneA==
X-CSE-MsgGUID: agc02w7UT6SGrQ+nBl7REw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; 
   d="scan'208";a="132389101"
Date: Sat, 5 Apr 2025 20:45:30 +0800
From: kernel test robot <lkp@intel.com>
To: Roger Pau Monne <roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH v2] x86/xen: fix balloon target initialization for PVH
 dom0
Message-ID: <202504052022.avvx45LI-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-001-20250405 (https://download.01.org/0day-ci/archive/20250405/202504052022.avvx45LI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504052022.avvx45LI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504052022.avvx45LI-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/xen/balloon.o: in function `balloon_init':
>> drivers/xen/balloon.c:727: undefined reference to `xen_released_pages'


vim +727 drivers/xen/balloon.c

   716	
   717	static int __init balloon_init(void)
   718	{
   719		struct task_struct *task;
   720		int rc;
   721	
   722		if (!xen_domain())
   723			return -ENODEV;
   724	
   725		pr_info("Initialising balloon driver\n");
   726	
 > 727		if (xen_released_pages >= get_num_physpages()) {
   728			WARN(1, "Released pages underflow current target");
   729			return -ERANGE;
   730		}
   731	
   732		balloon_stats.current_pages = get_num_physpages() - xen_released_pages;
   733		balloon_stats.target_pages  = balloon_stats.current_pages;
   734		balloon_stats.balloon_low   = 0;
   735		balloon_stats.balloon_high  = 0;
   736		balloon_stats.total_pages   = balloon_stats.current_pages;
   737	
   738		balloon_stats.schedule_delay = 1;
   739		balloon_stats.max_schedule_delay = 32;
   740		balloon_stats.retry_count = 1;
   741		balloon_stats.max_retry_count = 4;
   742	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

