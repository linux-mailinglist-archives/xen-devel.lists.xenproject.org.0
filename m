Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BB1BAE9F4
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 23:29:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1134505.1472357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3hu0-0000hc-Ca; Tue, 30 Sep 2025 21:28:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1134505.1472357; Tue, 30 Sep 2025 21:28:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3hu0-0000fs-9R; Tue, 30 Sep 2025 21:28:52 +0000
Received: by outflank-mailman (input) for mailman id 1134505;
 Tue, 30 Sep 2025 21:28:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AVDV=4J=intel.com=lkp@srs-se1.protection.inumbo.net>)
 id 1v3htz-0000fm-6r
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 21:28:51 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72e0f7ce-9e44-11f0-9d14-b5c5bf9af7f9;
 Tue, 30 Sep 2025 23:28:48 +0200 (CEST)
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 14:28:47 -0700
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
 by orviesa004.jf.intel.com with ESMTP; 30 Sep 2025 14:28:42 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1v3htn-0002Ul-2E;
 Tue, 30 Sep 2025 21:28:39 +0000
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
X-Inumbo-ID: 72e0f7ce-9e44-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759267730; x=1790803730;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zfIdBcB/dpjzaEpep4X7eK5CAcnmsMfVWj/01hovLLc=;
  b=cZI+eqaPY6bQiU/lvCJehuzOYwQvH7j2D8GYv1pqf7nF4vgGm5G5GLIk
   g01lYWB+ITPsmGZPM+6ZuHx+1bEQHEqmhTclJrEOwT3NGK2EqqY8wGCQ/
   +S3gq7ZNgSqBKKQQvpn6oqcYjU2oFgFZ/rZqMYr7A2CN1ugglUNiXlxtT
   qxmm017J/hrusNycMY52MHl0o2dLhHnWBOibCVS/la/rtp3VAwc/+ZFLY
   To0ygqdmnJ77jkW1sxCx8SXWbJjOLJnMnUkuUDU3yeyNDQhZpk+qoRqVJ
   jsKS2JLaEqaKMBrxjzPnERhcT0oVt30u9tp9lOExT8S5U2KC/wDttdgzJ
   g==;
X-CSE-ConnectionGUID: CqfjEh4jTKCN69mj0NSpLw==
X-CSE-MsgGUID: dBtD9cpBRmiLZB6lXmmh8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61702276"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; 
   d="scan'208";a="61702276"
X-CSE-ConnectionGUID: q10CyoJ6SJ+/5NU0nmLg9A==
X-CSE-MsgGUID: 8gjwNvBERwyFySIzgmzpQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; 
   d="scan'208";a="182917958"
Date: Wed, 1 Oct 2025 05:27:40 +0800
From: kernel test robot <lkp@intel.com>
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, virtualization@lists.linux.dev
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, xin@zytor.com,
	Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 11/12] x86/paravirt: Don't use pv_ops vector for MSR
 access functions
Message-ID: <202510010555.InsgYDTd-lkp@intel.com>
References: <20250930070356.30695-12-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930070356.30695-12-jgross@suse.com>

Hi Juergen,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on linus/master v6.17]
[cannot apply to kvm/queue kvm/next tip/master kvm/linux-next tip/auto-latest next-20250929]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Juergen-Gross/coco-tdx-Rename-MSR-access-helpers/20250930-150753
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20250930070356.30695-12-jgross%40suse.com
patch subject: [PATCH v2 11/12] x86/paravirt: Don't use pv_ops vector for MSR access functions
config: x86_64-buildonly-randconfig-001-20251001 (https://download.01.org/0day-ci/archive/20251001/202510010555.InsgYDTd-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251001/202510010555.InsgYDTd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510010555.InsgYDTd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:18:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:16:
   In file included from include/linux/uprobes.h:18:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:25:
   In file included from include/linux/jiffies.h:10:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   In file included from arch/x86/include/asm/tsc.h:11:
>> arch/x86/include/asm/msr.h:327:10: fatal error: 'asm/xen/msr.h' file not found
     327 | #include <asm/xen/msr.h>
         |          ^~~~~~~~~~~~~~~
   1 error generated.
   make[3]: *** [scripts/Makefile.build:182: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=3471495288
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1282: prepare0] Error 2 shuffle=3471495288
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3471495288
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=3471495288
   make: Target 'prepare' not remade because of errors.


vim +327 arch/x86/include/asm/msr.h

   325	
   326	#ifdef CONFIG_XEN_PV
 > 327	#include <asm/xen/msr.h>
   328	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

