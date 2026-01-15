Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD70FD2503D
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 15:44:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1205218.1519584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgOaF-0004GE-Lm; Thu, 15 Jan 2026 14:44:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1205218.1519584; Thu, 15 Jan 2026 14:44:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgOaF-0004Ek-IH; Thu, 15 Jan 2026 14:44:23 +0000
Received: by outflank-mailman (input) for mailman id 1205218;
 Thu, 15 Jan 2026 14:44:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sH18=7U=intel.com=lkp@srs-se1.protection.inumbo.net>)
 id 1vgOaE-0004Ee-9y
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 14:44:22 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a947ee84-f220-11f0-9ccf-f158ae23cfc8;
 Thu, 15 Jan 2026 15:44:16 +0100 (CET)
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 06:44:13 -0800
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 15 Jan 2026 06:44:09 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vgOZy-00000000I54-3wGb;
 Thu, 15 Jan 2026 14:44:06 +0000
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
X-Inumbo-ID: a947ee84-f220-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768488256; x=1800024256;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=W8bSj3Tt1fNR22DvPlznzXtp4tTD+xt+MEIzrxtDuUM=;
  b=AqcVCN8nfy0Sd5yX51uL8zOKmETXVsw8iHMGOQw+VfZudWaQl9qVg8qc
   1eSQ9GpxYVmQ70VxHutb/PHHsuSHmIPyOEYTr/Gij8XxaJDl+y8HZdhlE
   39hN8S2Waac5sotshvEntV+fiqP8vKD+A7U/YSrAfFPd79RZxNN9Tv3yd
   cJxSmPpJTqVFKMe2XtdJIIu5gA3LbjxVy4UN16C9qpeajZhNuHLud/EZj
   j6BHV3cisul9czCSi1tvv/GJNLwPWk/fMbOOU55v7Lu26IjiT0lLxA92T
   CKsrGhVcTsJbR5qdnmpH0u6tMwZ7iSHp3GNzKLH267lRjINuKzODNjSG6
   g==;
X-CSE-ConnectionGUID: 5C4OF2AySB+qxJD1oSx8rA==
X-CSE-MsgGUID: QYGoQ/hlTZSRLxTOFPS8dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69773532"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="69773532"
X-CSE-ConnectionGUID: 1CV0d29lS5m316xjAn+w0w==
X-CSE-MsgGUID: 5+bzz2H0T3OvpIwVh4UbOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="236223880"
Date: Thu, 15 Jan 2026 22:43:59 +0800
From: kernel test robot <lkp@intel.com>
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, virtualization@lists.linux.dev, kvm@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Juergen Gross <jgross@suse.com>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 1/5] x86/paravirt: Replace io_delay() hook with a bool
Message-ID: <202601152203.plJOoOEF-lkp@intel.com>
References: <20260115084849.31502-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260115084849.31502-2-jgross@suse.com>

Hi Juergen,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/master]
[also build test ERROR on next-20260115]
[cannot apply to kvm/queue kvm/next tip/x86/core kvm/linux-next tip/auto-latest linus/master v6.19-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Juergen-Gross/x86-paravirt-Replace-io_delay-hook-with-a-bool/20260115-165320
base:   tip/master
patch link:    https://lore.kernel.org/r/20260115084849.31502-2-jgross%40suse.com
patch subject: [PATCH v3 1/5] x86/paravirt: Replace io_delay() hook with a bool
config: i386-randconfig-011-20260115 (https://download.01.org/0day-ci/archive/20260115/202601152203.plJOoOEF-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601152203.plJOoOEF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601152203.plJOoOEF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/cpufreq/longhaul.c:145:2: error: call to undeclared function 'arch_safe_halt'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     145 |         safe_halt();
         |         ^
   include/linux/irqflags.h:231:3: note: expanded from macro 'safe_halt'
     231 |                 raw_safe_halt();                \
         |                 ^
   include/linux/irqflags.h:192:27: note: expanded from macro 'raw_safe_halt'
     192 | #define raw_safe_halt()                 arch_safe_halt()
         |                                         ^
>> drivers/cpufreq/longhaul.c:150:2: error: call to undeclared function 'halt'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     150 |         halt();
         |         ^
   drivers/cpufreq/longhaul.c:179:2: error: call to undeclared function 'arch_safe_halt'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     179 |         safe_halt();
         |         ^
   include/linux/irqflags.h:231:3: note: expanded from macro 'safe_halt'
     231 |                 raw_safe_halt();                \
         |                 ^
   include/linux/irqflags.h:192:27: note: expanded from macro 'raw_safe_halt'
     192 | #define raw_safe_halt()                 arch_safe_halt()
         |                                         ^
   drivers/cpufreq/longhaul.c:187:4: error: call to undeclared function 'halt'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     187 |                         halt();
         |                         ^
   drivers/cpufreq/longhaul.c:205:3: error: call to undeclared function 'halt'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     205 |                 halt();
         |                 ^
   drivers/cpufreq/longhaul.c:224:4: error: call to undeclared function 'halt'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     224 |                         halt();
         |                         ^
   drivers/cpufreq/longhaul.c:165:6: warning: variable 't' set but not used [-Wunused-but-set-variable]
     165 |         u32 t;
         |             ^
   1 warning and 6 errors generated.


vim +/arch_safe_halt +145 drivers/cpufreq/longhaul.c

^1da177e4c3f41 arch/i386/kernel/cpu/cpufreq/longhaul.c Linus Torvalds 2005-04-16  134  
ac617bd0f7b959 arch/x86/kernel/cpu/cpufreq/longhaul.c  Dave Jones     2009-01-17  135  static void do_longhaul1(unsigned int mults_index)
^1da177e4c3f41 arch/i386/kernel/cpu/cpufreq/longhaul.c Linus Torvalds 2005-04-16  136  {
dadb49d8746bc4 arch/i386/kernel/cpu/cpufreq/longhaul.c Rafa³ Bilski   2006-07-03  137  	union msr_bcr2 bcr2;
^1da177e4c3f41 arch/i386/kernel/cpu/cpufreq/longhaul.c Linus Torvalds 2005-04-16  138  
c435e608cf59ff drivers/cpufreq/longhaul.c              Ingo Molnar    2025-04-09  139  	rdmsrq(MSR_VIA_BCR2, bcr2.val);
dadb49d8746bc4 arch/i386/kernel/cpu/cpufreq/longhaul.c Rafa³ Bilski   2006-07-03  140  	/* Enable software clock multiplier */
dadb49d8746bc4 arch/i386/kernel/cpu/cpufreq/longhaul.c Rafa³ Bilski   2006-07-03  141  	bcr2.bits.ESOFTBF = 1;
ac617bd0f7b959 arch/x86/kernel/cpu/cpufreq/longhaul.c  Dave Jones     2009-01-17  142  	bcr2.bits.CLOCKMUL = mults_index & 0xff;
dadb49d8746bc4 arch/i386/kernel/cpu/cpufreq/longhaul.c Rafa³ Bilski   2006-07-03  143  
dadb49d8746bc4 arch/i386/kernel/cpu/cpufreq/longhaul.c Rafa³ Bilski   2006-07-03  144  	/* Sync to timer tick */
dadb49d8746bc4 arch/i386/kernel/cpu/cpufreq/longhaul.c Rafa³ Bilski   2006-07-03 @145  	safe_halt();
dadb49d8746bc4 arch/i386/kernel/cpu/cpufreq/longhaul.c Rafa³ Bilski   2006-07-03  146  	/* Change frequency on next halt or sleep */
78255eb2397332 drivers/cpufreq/longhaul.c              Ingo Molnar    2025-04-09  147  	wrmsrq(MSR_VIA_BCR2, bcr2.val);
179da8e6e8903a arch/i386/kernel/cpu/cpufreq/longhaul.c Rafa³ Bilski   2006-08-08  148  	/* Invoke transition */
179da8e6e8903a arch/i386/kernel/cpu/cpufreq/longhaul.c Rafa³ Bilski   2006-08-08  149  	ACPI_FLUSH_CPU_CACHE();
179da8e6e8903a arch/i386/kernel/cpu/cpufreq/longhaul.c Rafa³ Bilski   2006-08-08 @150  	halt();
dadb49d8746bc4 arch/i386/kernel/cpu/cpufreq/longhaul.c Rafa³ Bilski   2006-07-03  151  
dadb49d8746bc4 arch/i386/kernel/cpu/cpufreq/longhaul.c Rafa³ Bilski   2006-07-03  152  	/* Disable software clock multiplier */
dadb49d8746bc4 arch/i386/kernel/cpu/cpufreq/longhaul.c Rafa³ Bilski   2006-07-03  153  	local_irq_disable();
c435e608cf59ff drivers/cpufreq/longhaul.c              Ingo Molnar    2025-04-09  154  	rdmsrq(MSR_VIA_BCR2, bcr2.val);
dadb49d8746bc4 arch/i386/kernel/cpu/cpufreq/longhaul.c Rafa³ Bilski   2006-07-03  155  	bcr2.bits.ESOFTBF = 0;
78255eb2397332 drivers/cpufreq/longhaul.c              Ingo Molnar    2025-04-09  156  	wrmsrq(MSR_VIA_BCR2, bcr2.val);
^1da177e4c3f41 arch/i386/kernel/cpu/cpufreq/longhaul.c Linus Torvalds 2005-04-16  157  }
^1da177e4c3f41 arch/i386/kernel/cpu/cpufreq/longhaul.c Linus Torvalds 2005-04-16  158  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

