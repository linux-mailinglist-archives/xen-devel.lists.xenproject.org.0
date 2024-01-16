Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE99382E856
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 04:54:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667626.1039095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPaVW-0005Gw-VA; Tue, 16 Jan 2024 03:52:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667626.1039095; Tue, 16 Jan 2024 03:52:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPaVW-0005FB-Rx; Tue, 16 Jan 2024 03:52:58 +0000
Received: by outflank-mailman (input) for mailman id 667626;
 Tue, 16 Jan 2024 03:52:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oUTP=I2=intel.com=lkp@srs-se1.protection.inumbo.net>)
 id 1rPaVV-0005F5-Cn
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 03:52:57 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8c3a3e6-b422-11ee-98f1-6d05b1d4d9a1;
 Tue, 16 Jan 2024 04:52:53 +0100 (CET)
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2024 19:52:50 -0800
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by orviesa001.jf.intel.com with ESMTP; 15 Jan 2024 19:52:48 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rPaSs-000CwO-1n;
 Tue, 16 Jan 2024 03:51:17 +0000
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
X-Inumbo-ID: b8c3a3e6-b422-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705377173; x=1736913173;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q7/n37rsiUDah4i6i7efQa9HUh2Mt2hfaHw7PEa91PA=;
  b=SRT3rssof3AVhP/2kIcj9L5QT+KxiAhzuYcbEa0jEEbfXwku5PQ4RTYn
   DrnR2k1cjr19wbM41swJfW5pHYFkw7evUzOencT05BPM73CNomGsMflLc
   KRmGu6D8W3Xy2jWt0KPvc5w2iaYj/t7MxvE44HoJh1+v3VFtwYhxwNypB
   fkfMSzBfuxeKot4JEzllmc7e8KyiIsFalBFMXwjwb9VcOEMHpTVdHMmfr
   sMPZMbabtCr3SE5uYX45pVDPqoc287IbtPu3mcHzuDc6dbyPbi4bGnfdT
   bRw9zUA5R8TKxU0XD3QZPIU2mpSicAbpK+1+3XKTVFHI5ZZLkKedQxSsL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="430914076"
X-IronPort-AV: E=Sophos;i="6.04,198,1695711600"; 
   d="scan'208";a="430914076"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,198,1695711600"; 
   d="scan'208";a="32314188"
Date: Tue, 16 Jan 2024 11:45:50 +0800
From: kernel test robot <lkp@intel.com>
To: Kunwu Chan <chentao@kylinos.cn>, jgross@suse.com,
	boris.ostrovsky@oracle.com, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	Kunwu Chan <chentao@kylinos.cn>
Subject: Re: [PATCH] x86/xen: Fix some null pointer dereference issues in
 smp.c
Message-ID: <202401161119.iof6BQsf-lkp@intel.com>
References: <20240115100138.34340-1-chentao@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240115100138.34340-1-chentao@kylinos.cn>

Hi Kunwu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/core]
[also build test WARNING on linus/master v6.7 next-20240112]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kunwu-Chan/x86-xen-Fix-some-null-pointer-dereference-issues-in-smp-c/20240115-180429
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20240115100138.34340-1-chentao%40kylinos.cn
patch subject: [PATCH] x86/xen: Fix some null pointer dereference issues in smp.c
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240116/202401161119.iof6BQsf-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240116/202401161119.iof6BQsf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401161119.iof6BQsf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/xen/smp.c:68:6: warning: variable 'rc' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
      68 |         if (!resched_name)
         |             ^~~~~~~~~~~~~
   arch/x86/xen/smp.c:127:9: note: uninitialized use occurs here
     127 |         return rc;
         |                ^~
   arch/x86/xen/smp.c:68:2: note: remove the 'if' if its condition is always false
      68 |         if (!resched_name)
         |         ^~~~~~~~~~~~~~~~~~
      69 |                 goto fail;
         |                 ~~~~~~~~~
   arch/x86/xen/smp.c:64:8: note: initialize the variable 'rc' to silence this warning
      64 |         int rc;
         |               ^
         |                = 0
   1 warning generated.


vim +68 arch/x86/xen/smp.c

    61	
    62	int xen_smp_intr_init(unsigned int cpu)
    63	{
    64		int rc;
    65		char *resched_name, *callfunc_name, *debug_name;
    66	
    67		resched_name = kasprintf(GFP_KERNEL, "resched%d", cpu);
  > 68		if (!resched_name)
    69			goto fail;
    70		per_cpu(xen_resched_irq, cpu).name = resched_name;
    71		rc = bind_ipi_to_irqhandler(XEN_RESCHEDULE_VECTOR,
    72					    cpu,
    73					    xen_reschedule_interrupt,
    74					    IRQF_PERCPU|IRQF_NOBALANCING,
    75					    resched_name,
    76					    NULL);
    77		if (rc < 0)
    78			goto fail;
    79		per_cpu(xen_resched_irq, cpu).irq = rc;
    80	
    81		callfunc_name = kasprintf(GFP_KERNEL, "callfunc%d", cpu);
    82		if (!callfunc_name)
    83			goto fail;
    84		per_cpu(xen_callfunc_irq, cpu).name = callfunc_name;
    85		rc = bind_ipi_to_irqhandler(XEN_CALL_FUNCTION_VECTOR,
    86					    cpu,
    87					    xen_call_function_interrupt,
    88					    IRQF_PERCPU|IRQF_NOBALANCING,
    89					    callfunc_name,
    90					    NULL);
    91		if (rc < 0)
    92			goto fail;
    93		per_cpu(xen_callfunc_irq, cpu).irq = rc;
    94	
    95		if (!xen_fifo_events) {
    96			debug_name = kasprintf(GFP_KERNEL, "debug%d", cpu);
    97			if (!debug_name)
    98				goto fail;
    99			per_cpu(xen_debug_irq, cpu).name = debug_name;
   100			rc = bind_virq_to_irqhandler(VIRQ_DEBUG, cpu,
   101						     xen_debug_interrupt,
   102						     IRQF_PERCPU | IRQF_NOBALANCING,
   103						     debug_name, NULL);
   104			if (rc < 0)
   105				goto fail;
   106			per_cpu(xen_debug_irq, cpu).irq = rc;
   107		}
   108	
   109		callfunc_name = kasprintf(GFP_KERNEL, "callfuncsingle%d", cpu);
   110		if (!callfunc_name)
   111			goto fail;
   112		per_cpu(xen_callfuncsingle_irq, cpu).name = callfunc_name;
   113		rc = bind_ipi_to_irqhandler(XEN_CALL_FUNCTION_SINGLE_VECTOR,
   114					    cpu,
   115					    xen_call_function_single_interrupt,
   116					    IRQF_PERCPU|IRQF_NOBALANCING,
   117					    callfunc_name,
   118					    NULL);
   119		if (rc < 0)
   120			goto fail;
   121		per_cpu(xen_callfuncsingle_irq, cpu).irq = rc;
   122	
   123		return 0;
   124	
   125	 fail:
   126		xen_smp_intr_free(cpu);
   127		return rc;
   128	}
   129	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

