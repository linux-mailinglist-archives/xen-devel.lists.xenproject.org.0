Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B91F4D25A09
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 17:11:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1205500.1519736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgPwY-0007Gt-9l; Thu, 15 Jan 2026 16:11:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1205500.1519736; Thu, 15 Jan 2026 16:11:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgPwY-0007FE-6z; Thu, 15 Jan 2026 16:11:30 +0000
Received: by outflank-mailman (input) for mailman id 1205500;
 Thu, 15 Jan 2026 16:11:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sH18=7U=intel.com=lkp@srs-se1.protection.inumbo.net>)
 id 1vgPwW-0007F5-Aj
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 16:11:28 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d389db73-f22c-11f0-9ccf-f158ae23cfc8;
 Thu, 15 Jan 2026 17:11:20 +0100 (CET)
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 08:11:19 -0800
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 15 Jan 2026 08:11:14 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vgPwF-00000000IBQ-0m18;
 Thu, 15 Jan 2026 16:11:11 +0000
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
X-Inumbo-ID: d389db73-f22c-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768493481; x=1800029481;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gFIoEC1f1qlzIUpk/6FrkLxr7vkPH7lbau/8uT3TPbk=;
  b=Ai//pSkzXrHAyhBvqUxZfQzZvPfO2GIxCTtGQuAOM4+y7v4ZW2VFmB64
   GL59F1+3KBpv0hIEDiVt5xCHRjpzFTtavQ4Iurf5BpoBnQU7SdK4bfM+n
   5Di7/zS+q4RJXY8KWG7Sjn6O3aHr/XPlF4LSzOdBvYTB4L8igQLwxBsJE
   PTE3BycLp55RxeQlcKyRjrDjNVI6suEYiohcD7CCxXzBVN4oqGPbFHD9h
   5uKpgdhBc6oulQBAsOzE5USZe/BzJ2TWK4dwvJe4ahSJTnwVIjQ1iBYnd
   RYv9ElzfFxrGL75NGyaYfs4SDqS9JhTqqEKmRtpefHr7wZW+YZeh0LIDi
   Q==;
X-CSE-ConnectionGUID: P2S7flEKRmesLbaS43dFCQ==
X-CSE-MsgGUID: AETCUT9KQRupmjY6Z1DepA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69701548"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="69701548"
X-CSE-ConnectionGUID: T0RnRcTxRsGGrhE5Yp0D6g==
X-CSE-MsgGUID: 0Lh0zAVbQ2yEnGpU34emxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="205020917"
Date: Fri, 16 Jan 2026 00:10:12 +0800
From: kernel test robot <lkp@intel.com>
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, virtualization@lists.linux.dev, kvm@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
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
Message-ID: <202601152321.kJ6D4yKM-lkp@intel.com>
References: <20260115084849.31502-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
config: x86_64-randconfig-006-20260115 (https://download.01.org/0day-ci/archive/20260115/202601152321.kJ6D4yKM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601152321.kJ6D4yKM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601152321.kJ6D4yKM-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/tboot.c: In function 'tboot_shutdown':
>> arch/x86/kernel/tboot.c:255:17: error: implicit declaration of function 'halt' [-Werror=implicit-function-declaration]
     255 |                 halt();
         |                 ^~~~
   cc1: some warnings being treated as errors


vim +/halt +255 arch/x86/kernel/tboot.c

58c41d28259c24 H. Peter Anvin 2009-08-14  225  
3162534069597e Joseph Cihula  2009-06-30  226  void tboot_shutdown(u32 shutdown_type)
3162534069597e Joseph Cihula  2009-06-30  227  {
3162534069597e Joseph Cihula  2009-06-30  228  	void (*shutdown)(void);
3162534069597e Joseph Cihula  2009-06-30  229  
3162534069597e Joseph Cihula  2009-06-30  230  	if (!tboot_enabled())
3162534069597e Joseph Cihula  2009-06-30  231  		return;
3162534069597e Joseph Cihula  2009-06-30  232  
11520e5e7c1855 Linus Torvalds 2012-12-15  233  	/*
11520e5e7c1855 Linus Torvalds 2012-12-15  234  	 * if we're being called before the 1:1 mapping is set up then just
11520e5e7c1855 Linus Torvalds 2012-12-15  235  	 * return and let the normal shutdown happen; this should only be
11520e5e7c1855 Linus Torvalds 2012-12-15  236  	 * due to very early panic()
11520e5e7c1855 Linus Torvalds 2012-12-15  237  	 */
11520e5e7c1855 Linus Torvalds 2012-12-15  238  	if (!tboot_pg_dir)
11520e5e7c1855 Linus Torvalds 2012-12-15  239  		return;
11520e5e7c1855 Linus Torvalds 2012-12-15  240  
3162534069597e Joseph Cihula  2009-06-30  241  	/* if this is S3 then set regions to MAC */
3162534069597e Joseph Cihula  2009-06-30  242  	if (shutdown_type == TB_SHUTDOWN_S3)
58c41d28259c24 H. Peter Anvin 2009-08-14  243  		if (tboot_setup_sleep())
58c41d28259c24 H. Peter Anvin 2009-08-14  244  			return;
3162534069597e Joseph Cihula  2009-06-30  245  
3162534069597e Joseph Cihula  2009-06-30  246  	tboot->shutdown_type = shutdown_type;
3162534069597e Joseph Cihula  2009-06-30  247  
3162534069597e Joseph Cihula  2009-06-30  248  	switch_to_tboot_pt();
3162534069597e Joseph Cihula  2009-06-30  249  
3162534069597e Joseph Cihula  2009-06-30  250  	shutdown = (void(*)(void))(unsigned long)tboot->shutdown_entry;
3162534069597e Joseph Cihula  2009-06-30  251  	shutdown();
3162534069597e Joseph Cihula  2009-06-30  252  
3162534069597e Joseph Cihula  2009-06-30  253  	/* should not reach here */
3162534069597e Joseph Cihula  2009-06-30  254  	while (1)
3162534069597e Joseph Cihula  2009-06-30 @255  		halt();
3162534069597e Joseph Cihula  2009-06-30  256  }
3162534069597e Joseph Cihula  2009-06-30  257  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

