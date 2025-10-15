Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DEDBDD8CB
	for <lists+xen-devel@lfdr.de>; Wed, 15 Oct 2025 10:54:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1143370.1477093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8xH5-0008M5-77; Wed, 15 Oct 2025 08:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1143370.1477093; Wed, 15 Oct 2025 08:54:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8xH5-0008JX-3g; Wed, 15 Oct 2025 08:54:23 +0000
Received: by outflank-mailman (input) for mailman id 1143370;
 Wed, 15 Oct 2025 08:54:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=toq2=4Y=intel.com=lkp@srs-se1.protection.inumbo.net>)
 id 1v8xH2-0008JR-Su
 for xen-devel@lists.xenproject.org; Wed, 15 Oct 2025 08:54:21 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 879fe1cc-a9a4-11f0-980a-7dc792cee155;
 Wed, 15 Oct 2025 10:54:18 +0200 (CEST)
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 01:54:15 -0700
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
 by fmviesa001.fm.intel.com with ESMTP; 15 Oct 2025 01:54:10 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1v8xGq-0003eZ-0P;
 Wed, 15 Oct 2025 08:54:08 +0000
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
X-Inumbo-ID: 879fe1cc-a9a4-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760518458; x=1792054458;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+BB5rvJB9mUeya+4DU9TUHtTCg+zs/03Q0ZHCN0cD80=;
  b=Cmbogn/Rb1mK3C6PtK5ClL/jk0i/O2SJIOaY17CHgq/J8JrRU1cpbRA1
   J2Zt7+QwUoi6s6bgcTFAwKZEpU2Jx9Z+oyZTWBF/Bt8eHNObv2DjALTh8
   QnXUgneDUKtB90Bmh+gMJRhM4nZYojVX6WJdi3L+7JE0y5cecvhhvmHiV
   5a/14sDv7cGSh32b+RQUMElzK5NlZZQ8r9PsgZmJho+CLoFF/307hJpZL
   agfkD84/PQjdWRJvRXUsjzKZv/NeLs61EhOFtqMX1VZDU5Fe9qVzu0vOv
   HozzMBpXQZrmAU+O3+47rgt3HVl64N74GIHGf+ErrBcAGqZwMHjAD5JZU
   g==;
X-CSE-ConnectionGUID: UO3u6POQSvG7eIXHr2GyfA==
X-CSE-MsgGUID: WxtftDXxS1+0jqfAoS3lOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="50253064"
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; 
   d="scan'208";a="50253064"
X-CSE-ConnectionGUID: 9G14ytpfQl2dHZh/4Qmtzg==
X-CSE-MsgGUID: zzuIIelBSnefzwE8pAWIJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; 
   d="scan'208";a="213062822"
Date: Wed, 15 Oct 2025 16:53:32 +0800
From: kernel test robot <lkp@intel.com>
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, linux-hyperv@vger.kernel.org,
	virtualization@lists.linux.dev, kvm@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Juergen Gross <jgross@suse.com>,
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
Subject: Re: [PATCH v3 21/21] x86/pvlocks: Move paravirt spinlock functions
 into own header
Message-ID: <202510151611.uYXVunzo-lkp@intel.com>
References: <20251006074606.1266-22-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006074606.1266-22-jgross@suse.com>

Hi Juergen,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on kvm/queue kvm/next linus/master v6.18-rc1 next-20251014]
[cannot apply to tip/x86/core kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Juergen-Gross/x86-paravirt-Remove-not-needed-includes-of-paravirt-h/20251010-094850
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20251006074606.1266-22-jgross%40suse.com
patch subject: [PATCH v3 21/21] x86/pvlocks: Move paravirt spinlock functions into own header
config: x86_64-randconfig-001-20251015 (https://download.01.org/0day-ci/archive/20251015/202510151611.uYXVunzo-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251015/202510151611.uYXVunzo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510151611.uYXVunzo-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `kvm_guest_init':
   arch/x86/kernel/kvm.c:828:(.init.text+0x440f4): undefined reference to `pv_ops_lock'
>> ld: arch/x86/kernel/kvm.c:828:(.init.text+0x4410e): undefined reference to `pv_ops_lock'
   ld: arch/x86/kernel/kvm.c:828:(.init.text+0x4411a): undefined reference to `pv_ops_lock'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

