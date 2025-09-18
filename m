Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E2FB82BE5
	for <lists+xen-devel@lfdr.de>; Thu, 18 Sep 2025 05:19:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1125892.1467686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uz5Aq-000612-UI; Thu, 18 Sep 2025 03:19:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1125892.1467686; Thu, 18 Sep 2025 03:19:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uz5Aq-0005xt-RQ; Thu, 18 Sep 2025 03:19:08 +0000
Received: by outflank-mailman (input) for mailman id 1125892;
 Thu, 18 Sep 2025 03:19:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFeD=35=intel.com=lkp@srs-se1.protection.inumbo.net>)
 id 1uz5Ap-0005xn-13
 for xen-devel@lists.xenproject.org; Thu, 18 Sep 2025 03:19:07 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 390f3188-943e-11f0-9d13-b5c5bf9af7f9;
 Thu, 18 Sep 2025 05:19:03 +0200 (CEST)
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 20:19:00 -0700
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
 by orviesa004.jf.intel.com with ESMTP; 17 Sep 2025 20:18:55 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uz5Aa-0002hN-0w;
 Thu, 18 Sep 2025 03:18:52 +0000
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
X-Inumbo-ID: 390f3188-943e-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758165544; x=1789701544;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BXxqhBJxXxvdickLzCyDX1rwS2LGPscfHrBsIJKBFHg=;
  b=gv5YNZZJ94ZK7jtClABAwIWpxIbJHWypQxQDOgINpcE4clvvtm8sc5KO
   hzOeBFxby8NXt7DuMvzbUCdDixj4+NHoD8tmRQrb3pTBReY5KbB126j67
   CInB7F4R0C9Wj7j6iPuIkXRtIsKrXph1pWZBr1u9n89iyCbfOpOIgzrZ4
   c0KdcJYsSkCSUIJ3g5eSj6c7915nNVuAEENVEg4qFLXAHOGx7zrkcVaRc
   8xW6/i+RIFp4DIiGmJmvG4PHHuQ9du9dByugHDQj4U476MoTAnMTdGvuB
   toSGy+qCEKJ80ATzfHxU3SSC71tIuU0Iwt3uxb8lrgh1F1qfcfws8RByD
   w==;
X-CSE-ConnectionGUID: NkGumBFJQFCTuNRdv+4Avg==
X-CSE-MsgGUID: qSnuh0ouQnubUxyJnz9wrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="85925407"
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; 
   d="scan'208";a="85925407"
X-CSE-ConnectionGUID: lnvzHdwpST6cNElr5TApng==
X-CSE-MsgGUID: LA6PePTrQ6WURP8TceJ/ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; 
   d="scan'208";a="179702293"
Date: Thu, 18 Sep 2025 11:18:00 +0800
From: kernel test robot <lkp@intel.com>
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, linux-hyperv@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Juergen Gross <jgross@suse.com>, Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Waiman Long <longman@redhat.com>, Jiri Kosina <jikos@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 01/21] x86/paravirt: Remove not needed includes of
 paravirt.h
Message-ID: <202509181151.ja2As5H4-lkp@intel.com>
References: <20250917145220.31064-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917145220.31064-2-jgross@suse.com>

Hi Juergen,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on kvm/queue kvm/next linus/master v6.17-rc6 next-20250917]
[cannot apply to tip/x86/core kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Juergen-Gross/x86-paravirt-Remove-not-needed-includes-of-paravirt-h/20250917-230321
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20250917145220.31064-2-jgross%40suse.com
patch subject: [PATCH v2 01/21] x86/paravirt: Remove not needed includes of paravirt.h
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250918/202509181151.ja2As5H4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250918/202509181151.ja2As5H4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509181151.ja2As5H4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/cpu.c:13:
   In file included from include/linux/sched/isolation.h:5:
   In file included from include/linux/cpuset.h:18:
   In file included from include/linux/mmu_context.h:5:
>> arch/x86/include/asm/mmu_context.h:225:2: error: call to undeclared function 'paravirt_enter_mmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     225 |         paravirt_enter_mmap(mm);
         |         ^
>> arch/x86/include/asm/mmu_context.h:232:2: error: call to undeclared function 'paravirt_arch_exit_mmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     232 |         paravirt_arch_exit_mmap(mm);
         |         ^
   arch/x86/include/asm/mmu_context.h:232:2: note: did you mean 'ldt_arch_exit_mmap'?
   arch/x86/include/asm/mmu_context.h:61:6: note: 'ldt_arch_exit_mmap' declared here
      61 | void ldt_arch_exit_mmap(struct mm_struct *mm);
         |      ^
   In file included from kernel/cpu.c:42:
   In file included from include/trace/events/power.h:12:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:53:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:33:
   In file included from arch/x86/include/asm/rqspinlock.h:5:
   arch/x86/include/asm/paravirt.h:736:20: error: static declaration of 'paravirt_enter_mmap' follows non-static declaration
     736 | static inline void paravirt_enter_mmap(struct mm_struct *mm)
         |                    ^
   arch/x86/include/asm/mmu_context.h:225:2: note: previous implicit declaration is here
     225 |         paravirt_enter_mmap(mm);
         |         ^
   In file included from kernel/cpu.c:42:
   In file included from include/trace/events/power.h:12:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:53:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:33:
   In file included from arch/x86/include/asm/rqspinlock.h:5:
   arch/x86/include/asm/paravirt.h:742:20: error: static declaration of 'paravirt_arch_exit_mmap' follows non-static declaration
     742 | static inline void paravirt_arch_exit_mmap(struct mm_struct *mm)
         |                    ^
   arch/x86/include/asm/mmu_context.h:232:2: note: previous implicit declaration is here
     232 |         paravirt_arch_exit_mmap(mm);
         |         ^
   4 errors generated.
--
   In file included from kernel/workqueue.c:52:
   In file included from include/linux/sched/isolation.h:5:
   In file included from include/linux/cpuset.h:18:
   In file included from include/linux/mmu_context.h:5:
>> arch/x86/include/asm/mmu_context.h:225:2: error: call to undeclared function 'paravirt_enter_mmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     225 |         paravirt_enter_mmap(mm);
         |         ^
>> arch/x86/include/asm/mmu_context.h:232:2: error: call to undeclared function 'paravirt_arch_exit_mmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     232 |         paravirt_arch_exit_mmap(mm);
         |         ^
   arch/x86/include/asm/mmu_context.h:232:2: note: did you mean 'ldt_arch_exit_mmap'?
   arch/x86/include/asm/mmu_context.h:61:6: note: 'ldt_arch_exit_mmap' declared here
      61 | void ldt_arch_exit_mmap(struct mm_struct *mm);
         |      ^
   2 errors generated.
--
>> arch/x86/kernel/x86_init.c:90:15: error: use of undeclared identifier 'default_banner'
      90 |                 .banner                 = default_banner,
         |                                           ^
   1 error generated.
--
   In file included from arch/x86/mm/init.c:30:
>> arch/x86/include/asm/mmu_context.h:225:2: error: call to undeclared function 'paravirt_enter_mmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     225 |         paravirt_enter_mmap(mm);
         |         ^
>> arch/x86/include/asm/mmu_context.h:232:2: error: call to undeclared function 'paravirt_arch_exit_mmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     232 |         paravirt_arch_exit_mmap(mm);
         |         ^
   arch/x86/include/asm/mmu_context.h:232:2: note: did you mean 'ldt_arch_exit_mmap'?
   arch/x86/include/asm/mmu_context.h:61:6: note: 'ldt_arch_exit_mmap' declared here
      61 | void ldt_arch_exit_mmap(struct mm_struct *mm);
         |      ^
>> arch/x86/mm/init.c:827:2: error: call to undeclared function 'paravirt_enter_mmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     827 |         paravirt_enter_mmap(text_poke_mm);
         |         ^
   3 errors generated.


vim +/paravirt_enter_mmap +225 arch/x86/include/asm/mmu_context.h

a31e184e4f6996 Dave Hansen        2019-01-02  221  
c10e83f598d080 Thomas Gleixner    2017-12-14  222  static inline int arch_dup_mmap(struct mm_struct *oldmm, struct mm_struct *mm)
a1ea1c032b8f8c Dave Hansen        2014-11-18  223  {
a31e184e4f6996 Dave Hansen        2019-01-02  224  	arch_dup_pkeys(oldmm, mm);
c9ae1b10d95610 Juergen Gross      2023-02-07 @225  	paravirt_enter_mmap(mm);
82721d8b25d76c Kirill A. Shutemov 2023-03-12  226  	dup_lam(oldmm, mm);
a4828f81037f49 Thomas Gleixner    2017-12-14  227  	return ldt_dup_context(oldmm, mm);
a1ea1c032b8f8c Dave Hansen        2014-11-18  228  }
a1ea1c032b8f8c Dave Hansen        2014-11-18  229  
a1ea1c032b8f8c Dave Hansen        2014-11-18  230  static inline void arch_exit_mmap(struct mm_struct *mm)
a1ea1c032b8f8c Dave Hansen        2014-11-18  231  {
a1ea1c032b8f8c Dave Hansen        2014-11-18 @232  	paravirt_arch_exit_mmap(mm);
f55f0501cbf65e Andy Lutomirski    2017-12-12  233  	ldt_arch_exit_mmap(mm);
a1ea1c032b8f8c Dave Hansen        2014-11-18  234  }
a1ea1c032b8f8c Dave Hansen        2014-11-18  235  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

