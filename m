Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B10C8D857
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 10:25:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173616.1498645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOYFf-0007OC-69; Thu, 27 Nov 2025 09:25:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173616.1498645; Thu, 27 Nov 2025 09:25:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOYFf-0007N9-29; Thu, 27 Nov 2025 09:25:23 +0000
Received: by outflank-mailman (input) for mailman id 1173616;
 Thu, 27 Nov 2025 09:25:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=76a4=6D=intel.com=lkp@srs-se1.protection.inumbo.net>)
 id 1vOYFe-0006zL-6I
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 09:25:22 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc9254f1-cb72-11f0-9d18-b5c5bf9af7f9;
 Thu, 27 Nov 2025 10:25:19 +0100 (CET)
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 01:25:16 -0800
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
 by orviesa009.jf.intel.com with ESMTP; 27 Nov 2025 01:25:10 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vOYFP-000000004CN-2qrR;
 Thu, 27 Nov 2025 09:25:07 +0000
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
X-Inumbo-ID: fc9254f1-cb72-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764235519; x=1795771519;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KK9nzEbpI9PD/rQsiJtia1oCOmSytQ0R3vQ+5NXjJmA=;
  b=BFdHlXMj5e0Xc+McTefoLHNh+pSMC9L4TJ2+/jdYv6cvUfzehO32kNLo
   Z7+OXYDVxowxikZ7sRa8XJ7dFNBHDmvqCu/Ptg4DZVKt8YwaYXvDr5hP1
   8YxRTIM8TnX5+QyY2NFdZNDcGceHkanBqEGoRwgtw0n+6ioDz7LAh8gzr
   TQwvMLg5HQd2HUxtv3yBqMJRA5KaKvyKQpbMKRSP45NzkaOdBbIKaCEXB
   ycO1J5gjJo+PfEY0xDIoalhjzzIAd6ZnoqyEJoFyyEHGRfc9ZmN3UVBh+
   IqJmXh72K2NDGkylz4xfOkXtouJvJLnupBUuCaHetOqvkGklOeEZKpRuL
   Q==;
X-CSE-ConnectionGUID: D2H02AAJQFKeu2dPebxDEA==
X-CSE-MsgGUID: 9im8nL7nRoCHS1asJv8JKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66226410"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="66226410"
X-CSE-ConnectionGUID: URawlKB/TjiX1FSy99cnMQ==
X-CSE-MsgGUID: STAbKrqQRdezH2EW5Q2Vqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="193000716"
Date: Thu, 27 Nov 2025 17:24:18 +0800
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
	Peter Zijlstra <peterz@infradead.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 21/21] x86/pvlocks: Move paravirt spinlock functions
 into own header
Message-ID: <202511271747.smpLdjsz-lkp@intel.com>
References: <20251127070844.21919-22-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127070844.21919-22-jgross@suse.com>

Hi Juergen,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on tip/sched/core kvm/queue kvm/next linus/master v6.18-rc7]
[cannot apply to kvm/linux-next next-20251127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Juergen-Gross/x86-paravirt-Remove-not-needed-includes-of-paravirt-h/20251127-152054
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20251127070844.21919-22-jgross%40suse.com
patch subject: [PATCH v4 21/21] x86/pvlocks: Move paravirt spinlock functions into own header
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251127/202511271747.smpLdjsz-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511271747.smpLdjsz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511271747.smpLdjsz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/alternative.c:2373:2: error: call to undeclared function 'paravirt_set_cap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2373 |         paravirt_set_cap();
         |         ^
   arch/x86/kernel/alternative.c:2373:2: note: did you mean 'paravirt_ret0'?
   arch/x86/include/asm/paravirt-base.h:23:15: note: 'paravirt_ret0' declared here
      23 | unsigned long paravirt_ret0(void);
         |               ^
   1 error generated.


vim +/paravirt_set_cap +2373 arch/x86/kernel/alternative.c

270a69c4485d7d arch/x86/kernel/alternative.c  Peter Zijlstra            2023-02-08  2344  
9a0b5817ad97bb arch/i386/kernel/alternative.c Gerd Hoffmann             2006-03-23  2345  void __init alternative_instructions(void)
9a0b5817ad97bb arch/i386/kernel/alternative.c Gerd Hoffmann             2006-03-23  2346  {
ebebe30794d38c arch/x86/kernel/alternative.c  Pawan Gupta               2025-05-03  2347  	u64 ibt;
ebebe30794d38c arch/x86/kernel/alternative.c  Pawan Gupta               2025-05-03  2348  
7457c0da024b18 arch/x86/kernel/alternative.c  Peter Zijlstra            2019-05-03  2349  	int3_selftest();
7457c0da024b18 arch/x86/kernel/alternative.c  Peter Zijlstra            2019-05-03  2350  
7457c0da024b18 arch/x86/kernel/alternative.c  Peter Zijlstra            2019-05-03  2351  	/*
7457c0da024b18 arch/x86/kernel/alternative.c  Peter Zijlstra            2019-05-03  2352  	 * The patching is not fully atomic, so try to avoid local
7457c0da024b18 arch/x86/kernel/alternative.c  Peter Zijlstra            2019-05-03  2353  	 * interruptions that might execute the to be patched code.
7457c0da024b18 arch/x86/kernel/alternative.c  Peter Zijlstra            2019-05-03  2354  	 * Other CPUs are not running.
7457c0da024b18 arch/x86/kernel/alternative.c  Peter Zijlstra            2019-05-03  2355  	 */
8f4e956b313dcc arch/i386/kernel/alternative.c Andi Kleen                2007-07-22  2356  	stop_nmi();
123aa76ec0cab5 arch/x86/kernel/alternative.c  Andi Kleen                2009-02-12  2357  
123aa76ec0cab5 arch/x86/kernel/alternative.c  Andi Kleen                2009-02-12  2358  	/*
123aa76ec0cab5 arch/x86/kernel/alternative.c  Andi Kleen                2009-02-12  2359  	 * Don't stop machine check exceptions while patching.
123aa76ec0cab5 arch/x86/kernel/alternative.c  Andi Kleen                2009-02-12  2360  	 * MCEs only happen when something got corrupted and in this
123aa76ec0cab5 arch/x86/kernel/alternative.c  Andi Kleen                2009-02-12  2361  	 * case we must do something about the corruption.
32b1cbe380417f arch/x86/kernel/alternative.c  Marco Ammon               2019-09-02  2362  	 * Ignoring it is worse than an unlikely patching race.
123aa76ec0cab5 arch/x86/kernel/alternative.c  Andi Kleen                2009-02-12  2363  	 * Also machine checks tend to be broadcast and if one CPU
123aa76ec0cab5 arch/x86/kernel/alternative.c  Andi Kleen                2009-02-12  2364  	 * goes into machine check the others follow quickly, so we don't
123aa76ec0cab5 arch/x86/kernel/alternative.c  Andi Kleen                2009-02-12  2365  	 * expect a machine check to cause undue problems during to code
123aa76ec0cab5 arch/x86/kernel/alternative.c  Andi Kleen                2009-02-12  2366  	 * patching.
123aa76ec0cab5 arch/x86/kernel/alternative.c  Andi Kleen                2009-02-12  2367  	 */
8f4e956b313dcc arch/i386/kernel/alternative.c Andi Kleen                2007-07-22  2368  
4e6292114c7412 arch/x86/kernel/alternative.c  Juergen Gross             2021-03-11  2369  	/*
f7af6977621a41 arch/x86/kernel/alternative.c  Juergen Gross             2023-12-10  2370  	 * Make sure to set (artificial) features depending on used paravirt
f7af6977621a41 arch/x86/kernel/alternative.c  Juergen Gross             2023-12-10  2371  	 * functions which can later influence alternative patching.
4e6292114c7412 arch/x86/kernel/alternative.c  Juergen Gross             2021-03-11  2372  	 */
4e6292114c7412 arch/x86/kernel/alternative.c  Juergen Gross             2021-03-11 @2373  	paravirt_set_cap();
4e6292114c7412 arch/x86/kernel/alternative.c  Juergen Gross             2021-03-11  2374  
ebebe30794d38c arch/x86/kernel/alternative.c  Pawan Gupta               2025-05-03  2375  	/* Keep CET-IBT disabled until caller/callee are patched */
ebebe30794d38c arch/x86/kernel/alternative.c  Pawan Gupta               2025-05-03  2376  	ibt = ibt_save(/*disable*/ true);
ebebe30794d38c arch/x86/kernel/alternative.c  Pawan Gupta               2025-05-03  2377  
931ab63664f02b arch/x86/kernel/alternative.c  Peter Zijlstra            2022-10-27  2378  	__apply_fineibt(__retpoline_sites, __retpoline_sites_end,
1d7e707af44613 arch/x86/kernel/alternative.c  Mike Rapoport (Microsoft  2025-01-26  2379) 			__cfi_sites, __cfi_sites_end, true);
026211c40b0554 arch/x86/kernel/alternative.c  Kees Cook                 2025-09-03  2380  	cfi_debug = false;
931ab63664f02b arch/x86/kernel/alternative.c  Peter Zijlstra            2022-10-27  2381  
7508500900814d arch/x86/kernel/alternative.c  Peter Zijlstra            2021-10-26  2382  	/*
7508500900814d arch/x86/kernel/alternative.c  Peter Zijlstra            2021-10-26  2383  	 * Rewrite the retpolines, must be done before alternatives since
7508500900814d arch/x86/kernel/alternative.c  Peter Zijlstra            2021-10-26  2384  	 * those can rewrite the retpoline thunks.
7508500900814d arch/x86/kernel/alternative.c  Peter Zijlstra            2021-10-26  2385  	 */
1d7e707af44613 arch/x86/kernel/alternative.c  Mike Rapoport (Microsoft  2025-01-26  2386) 	apply_retpolines(__retpoline_sites, __retpoline_sites_end);
1d7e707af44613 arch/x86/kernel/alternative.c  Mike Rapoport (Microsoft  2025-01-26  2387) 	apply_returns(__return_sites, __return_sites_end);
7508500900814d arch/x86/kernel/alternative.c  Peter Zijlstra            2021-10-26  2388  
a82b26451de126 arch/x86/kernel/alternative.c  Peter Zijlstra (Intel     2025-06-03  2389) 	its_fini_core();
a82b26451de126 arch/x86/kernel/alternative.c  Peter Zijlstra (Intel     2025-06-03  2390) 
e81dc127ef6988 arch/x86/kernel/alternative.c  Thomas Gleixner           2022-09-15  2391  	/*
ab9fea59487d8b arch/x86/kernel/alternative.c  Peter Zijlstra            2025-02-07  2392  	 * Adjust all CALL instructions to point to func()-10, including
ab9fea59487d8b arch/x86/kernel/alternative.c  Peter Zijlstra            2025-02-07  2393  	 * those in .altinstr_replacement.
e81dc127ef6988 arch/x86/kernel/alternative.c  Thomas Gleixner           2022-09-15  2394  	 */
e81dc127ef6988 arch/x86/kernel/alternative.c  Thomas Gleixner           2022-09-15  2395  	callthunks_patch_builtin_calls();
e81dc127ef6988 arch/x86/kernel/alternative.c  Thomas Gleixner           2022-09-15  2396  
ab9fea59487d8b arch/x86/kernel/alternative.c  Peter Zijlstra            2025-02-07  2397  	apply_alternatives(__alt_instructions, __alt_instructions_end);
ab9fea59487d8b arch/x86/kernel/alternative.c  Peter Zijlstra            2025-02-07  2398  
be0fffa5ca894a arch/x86/kernel/alternative.c  Peter Zijlstra            2023-06-22  2399  	/*
be0fffa5ca894a arch/x86/kernel/alternative.c  Peter Zijlstra            2023-06-22  2400  	 * Seal all functions that do not have their address taken.
be0fffa5ca894a arch/x86/kernel/alternative.c  Peter Zijlstra            2023-06-22  2401  	 */
1d7e707af44613 arch/x86/kernel/alternative.c  Mike Rapoport (Microsoft  2025-01-26  2402) 	apply_seal_endbr(__ibt_endbr_seal, __ibt_endbr_seal_end);
ed53a0d971926e arch/x86/kernel/alternative.c  Peter Zijlstra            2022-03-08  2403  
ebebe30794d38c arch/x86/kernel/alternative.c  Pawan Gupta               2025-05-03  2404  	ibt_restore(ibt);
ebebe30794d38c arch/x86/kernel/alternative.c  Pawan Gupta               2025-05-03  2405  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

