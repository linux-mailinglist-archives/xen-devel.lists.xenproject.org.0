Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C98B6958EB7
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 21:41:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780756.1190364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgUi4-0000qf-Ly; Tue, 20 Aug 2024 19:40:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780756.1190364; Tue, 20 Aug 2024 19:40:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgUi4-0000nJ-JH; Tue, 20 Aug 2024 19:40:04 +0000
Received: by outflank-mailman (input) for mailman id 780756;
 Tue, 20 Aug 2024 19:40:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9FzQ=PT=intel.com=lkp@srs-se1.protection.inumbo.net>)
 id 1sgUi2-0000Gh-Kl
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 19:40:03 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa49935e-5f2b-11ef-8776-851b0ebba9a2;
 Tue, 20 Aug 2024 21:39:57 +0200 (CEST)
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 12:39:55 -0700
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 20 Aug 2024 12:39:52 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sgUhp-000AY8-19;
 Tue, 20 Aug 2024 19:39:49 +0000
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
X-Inumbo-ID: fa49935e-5f2b-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724182797; x=1755718797;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eet258ZmfZhKKtJwJUN7C598plW54ADv5Xh+PzuuGlY=;
  b=VkvfnXj6bf+NOzr72R8pSVejdfJXuedz+KjJGtxIM15BY+JfadP5Opk1
   W3Rtvk3VTotsWYUqzjllcj+w7rhF7jhoKZdg8gH5A+o7DTO0qCxJTnjLe
   zUWxPvSvAVG70KSTx1STpJmumo8xw9C1VoCeGORZfjOsDmHRtsY5t0g5w
   jKmsQTGCCrofGfiLqkILKwE++AiYSbqgBHG61HbfjSpeQctc9rVxsrtYE
   /JnIYO9L4zCSUa4nElyEdR0xEKdGXqrr05OnwdHlwasfc4FAkU48BFwrW
   /rKu3tZ16BKIGT+9wheN/XQaxq/mHHJ1ckIEb4hmDLQyuxgxpugLeVy55
   g==;
X-CSE-ConnectionGUID: 5b77VaDkTVS1ocpkC9kYYQ==
X-CSE-MsgGUID: iSbLnaUORva7uBxNzJZY3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22372640"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="22372640"
X-CSE-ConnectionGUID: E7KFSF83RlWgQgxLEKNz3A==
X-CSE-MsgGUID: 8ngfMDiLTICNrsNrsKuyFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="98315039"
Date: Wed, 21 Aug 2024 03:39:26 +0800
From: kernel test robot <lkp@intel.com>
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, linux-acpi@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 6/7] xen: allow mapping ACPI data using a different
 physical address
Message-ID: <202408210336.uafTZlvc-lkp@intel.com>
References: <20240820082012.31316-7-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820082012.31316-7-jgross@suse.com>

Hi Juergen,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on rafael-pm/linux-next rafael-pm/bleeding-edge linus/master v6.11-rc4 next-20240820]
[cannot apply to xen-tip/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Juergen-Gross/xen-use-correct-end-address-of-kernel-for-conflict-checking/20240820-162344
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20240820082012.31316-7-jgross%40suse.com
patch subject: [PATCH v2 6/7] xen: allow mapping ACPI data using a different physical address
config: x86_64-randconfig-004-20240820 (https://download.01.org/0day-ci/archive/20240821/202408210336.uafTZlvc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240821/202408210336.uafTZlvc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408210336.uafTZlvc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/smpboot.c:64:
>> arch/x86/include/asm/acpi.h:179:42: error: unknown type name 'acpi_physical_address'
     179 | extern void __iomem * (*acpi_os_ioremap)(acpi_physical_address phys,
         |                                          ^~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/acpi.h:180:42: error: unknown type name 'acpi_size'
     180 |                                          acpi_size size);
         |                                          ^~~~~~~~~
   arch/x86/include/asm/acpi.h:181:35: error: unknown type name 'acpi_physical_address'
     181 | void __iomem *x86_acpi_os_ioremap(acpi_physical_address phys, acpi_size size);
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/acpi.h:181:63: error: unknown type name 'acpi_size'
     181 | void __iomem *x86_acpi_os_ioremap(acpi_physical_address phys, acpi_size size);
         |                                                               ^~~~~~~~~


vim +/acpi_physical_address +179 arch/x86/include/asm/acpi.h

   176	
   177	#ifdef CONFIG_XEN_PV_DOM0
   178	/* A Xen PV dom0 needs a special acpi_os_ioremap() handling. */
 > 179	extern void __iomem * (*acpi_os_ioremap)(acpi_physical_address phys,
 > 180						 acpi_size size);
   181	void __iomem *x86_acpi_os_ioremap(acpi_physical_address phys, acpi_size size);
   182	#define acpi_os_ioremap acpi_os_ioremap
   183	#endif
   184	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

