Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCDD958D86
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 19:38:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780710.1190345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgSoN-0005pI-16; Tue, 20 Aug 2024 17:38:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780710.1190345; Tue, 20 Aug 2024 17:38:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgSoM-0005nm-TZ; Tue, 20 Aug 2024 17:38:26 +0000
Received: by outflank-mailman (input) for mailman id 780710;
 Tue, 20 Aug 2024 17:38:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9FzQ=PT=intel.com=lkp@srs-se1.protection.inumbo.net>)
 id 1sgSoK-0005ng-DW
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 17:38:24 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fda5bd4e-5f1a-11ef-a507-bb4a2ccca743;
 Tue, 20 Aug 2024 19:38:21 +0200 (CEST)
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 10:38:19 -0700
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
 by fmviesa010.fm.intel.com with ESMTP; 20 Aug 2024 10:37:47 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sgSng-000ASU-1e;
 Tue, 20 Aug 2024 17:37:44 +0000
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
X-Inumbo-ID: fda5bd4e-5f1a-11ef-a507-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724175501; x=1755711501;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F9ys5UlU389ee3QRFRy0ljWKUhgX8RwxMcVWiy3W9E4=;
  b=aXeEWYvOVv8aibdIIn4zBorMbjMkSt+um42ukV/ufaSqRLWG36FgajVj
   zAqklZXJvllMwoiXDP9Z1XJ4qilqgJsKXkLTtqB97FMUZF+0Kyj3ksVER
   J0xpEd9oZsXK6d4kpD8RKQN7cTI3HrpVezK6tTMzX74v5oiJi9ZonU1yW
   eaWV2QzBOgMF5RRmqdGPYb5DjrXRos43s6HWk0cqmmTZ0EwjD5Jgz9fWy
   KZqQjha9hzhipdgRA+WfHEqHODAb78daMMdLpY2iB8xW2r1zFTkAfgk0L
   nPNKgVnOLDElAlUGuczHVoEBAGgsBXZRWy4RQkQGilVG2YDSfWiZb/pwK
   A==;
X-CSE-ConnectionGUID: C3UHaGacT+md4SS17JJyxQ==
X-CSE-MsgGUID: FMl04N66Sn2fvg7Ev3M1Ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="45019404"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="45019404"
X-CSE-ConnectionGUID: L51FrettSbecQ6z0Q2BVTQ==
X-CSE-MsgGUID: lA8PK9nmTUyeERQjg4edhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="60958613"
Date: Wed, 21 Aug 2024 01:37:11 +0800
From: kernel test robot <lkp@intel.com>
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, linux-acpi@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Juergen Gross <jgross@suse.com>,
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
Message-ID: <202408210000.e7XA8iNs-lkp@intel.com>
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
config: i386-buildonly-randconfig-002-20240820 (https://download.01.org/0day-ci/archive/20240821/202408210000.e7XA8iNs-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240821/202408210000.e7XA8iNs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408210000.e7XA8iNs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/x86_init.c:123:23: error: use of undeclared identifier 'x86_default_set_root_pointer'
     123 |                 .set_root_pointer       = x86_default_set_root_pointer,
         |                                           ^
>> arch/x86/kernel/x86_init.c:124:23: error: use of undeclared identifier 'x86_default_get_root_pointer'
     124 |                 .get_root_pointer       = x86_default_get_root_pointer,
         |                                           ^
>> arch/x86/kernel/x86_init.c:125:28: error: use of undeclared identifier 'acpi_generic_reduced_hw_init'
     125 |                 .reduced_hw_early_init  = acpi_generic_reduced_hw_init,
         |                                           ^
   3 errors generated.


vim +/x86_default_set_root_pointer +123 arch/x86/kernel/x86_init.c

f7cf5a5b8c0e59 Thomas Gleixner 2009-08-19   65  
f7cf5a5b8c0e59 Thomas Gleixner 2009-08-19   66  	.resources = {
5d94e81f69d4b1 Dan Williams    2011-03-08   67  		.probe_roms		= probe_roms,
8fee697d990c54 Thomas Gleixner 2009-08-19   68  		.reserve_resources	= reserve_standard_io_resources,
103e206309639b Ingo Molnar     2017-01-28   69  		.memory_setup		= e820__memory_setup_default,
0f4a1e80989aca Kevin Loughlin  2024-03-13   70  		.dmi_setup		= dmi_setup,
f7cf5a5b8c0e59 Thomas Gleixner 2009-08-19   71  	},
f4848472cd9948 Thomas Gleixner 2009-08-20   72  
f4848472cd9948 Thomas Gleixner 2009-08-20   73  	.mpparse = {
de93410310952f Thomas Gleixner 2009-08-20   74  		.setup_ioapic_ids	= x86_init_noop,
e061c7ae0830ff Thomas Gleixner 2024-02-13   75  		.find_mptable		= mpparse_find_mptable,
dcb7600849ce9b Thomas Gleixner 2024-02-13   76  		.early_parse_smp_cfg	= mpparse_parse_early_smp_config,
dcb7600849ce9b Thomas Gleixner 2024-02-13   77  		.parse_smp_cfg		= mpparse_parse_smp_config,
f4848472cd9948 Thomas Gleixner 2009-08-20   78  	},
d9112f43021554 Thomas Gleixner 2009-08-20   79  
d9112f43021554 Thomas Gleixner 2009-08-20   80  	.irqs = {
d9112f43021554 Thomas Gleixner 2009-08-20   81  		.pre_vector_init	= init_ISA_irqs,
66bcaf0bde100a Thomas Gleixner 2009-08-20   82  		.intr_init		= native_init_IRQ,
979923871f69a4 Thomas Gleixner 2020-01-23   83  		.intr_mode_select	= apic_intr_mode_select,
6b15ffa07dc325 Thomas Gleixner 2020-08-26   84  		.intr_mode_init		= apic_intr_mode_init,
6b15ffa07dc325 Thomas Gleixner 2020-08-26   85  		.create_pci_msi_domain	= native_create_pci_msi_domain,
d9112f43021554 Thomas Gleixner 2009-08-20   86  	},
42bbdb43b16d23 Thomas Gleixner 2009-08-20   87  
42bbdb43b16d23 Thomas Gleixner 2009-08-20   88  	.oem = {
42bbdb43b16d23 Thomas Gleixner 2009-08-20   89  		.arch_setup		= x86_init_noop,
6f30c1ac3fcf11 Thomas Gleixner 2009-08-20   90  		.banner			= default_banner,
42bbdb43b16d23 Thomas Gleixner 2009-08-20   91  	},
030cb6c00d242c Thomas Gleixner 2009-08-20   92  
030cb6c00d242c Thomas Gleixner 2009-08-20   93  	.paging = {
7737b215ad0f94 Attilio Rao     2012-08-21   94  		.pagetable_init		= native_pagetable_init,
030cb6c00d242c Thomas Gleixner 2009-08-20   95  	},
736decac643e89 Thomas Gleixner 2009-08-19   96  
736decac643e89 Thomas Gleixner 2009-08-19   97  	.timers = {
736decac643e89 Thomas Gleixner 2009-08-19   98  		.setup_percpu_clockev	= setup_boot_APIC_clock,
845b3944bbdf9e Thomas Gleixner 2009-08-19   99  		.timer_init		= hpet_time_init,
c311ed6183f4fd Rahul Tanwar    2019-10-10  100  		.wallclock_init		= x86_wallclock_init,
736decac643e89 Thomas Gleixner 2009-08-19  101  	},
d07c1be0693e09 FUJITA Tomonori 2009-11-10  102  
d07c1be0693e09 FUJITA Tomonori 2009-11-10  103  	.iommu = {
d07c1be0693e09 FUJITA Tomonori 2009-11-10  104  		.iommu_init		= iommu_init_noop,
d07c1be0693e09 FUJITA Tomonori 2009-11-10  105  	},
b72d0db9dd41da Thomas Gleixner 2009-08-29  106  
b72d0db9dd41da Thomas Gleixner 2009-08-29  107  	.pci = {
b72d0db9dd41da Thomas Gleixner 2009-08-29  108  		.init			= x86_default_pci_init,
ab3b37937e8f4f Thomas Gleixner 2009-08-29  109  		.init_irq		= x86_default_pci_init_irq,
9325a28ce2fa7c Thomas Gleixner 2009-08-29  110  		.fixup_irqs		= x86_default_pci_fixup_irqs,
b72d0db9dd41da Thomas Gleixner 2009-08-29  111  	},
f72e38e8ec8869 Juergen Gross   2017-11-09  112  
f72e38e8ec8869 Juergen Gross   2017-11-09  113  	.hyper = {
f72e38e8ec8869 Juergen Gross   2017-11-09  114  		.init_platform		= x86_init_noop,
f3614646005a1b Juergen Gross   2017-11-09  115  		.guest_late_init	= x86_init_noop,
f72e38e8ec8869 Juergen Gross   2017-11-09  116  		.x2apic_available	= bool_x86_init_noop,
ab0f59c6f13528 David Woodhouse 2020-10-24  117  		.msi_ext_dest_id	= bool_x86_init_noop,
f72e38e8ec8869 Juergen Gross   2017-11-09  118  		.init_mem_mapping	= x86_init_noop,
6f84f8d1587f20 Pavel Tatashin  2018-04-10  119  		.init_after_bootmem	= x86_init_noop,
f72e38e8ec8869 Juergen Gross   2017-11-09  120  	},
038bac2b02989a Juergen Gross   2018-02-19  121  
038bac2b02989a Juergen Gross   2018-02-19  122  	.acpi = {
41fa1ee9c6d687 Josh Boyer      2019-08-19 @123  		.set_root_pointer	= x86_default_set_root_pointer,
e7b66d16fe4172 Juergen Gross   2018-10-10 @124  		.get_root_pointer	= x86_default_get_root_pointer,
81b53e5ff21e09 Andy Shevchenko 2018-02-20 @125  		.reduced_hw_early_init	= acpi_generic_reduced_hw_init,
038bac2b02989a Juergen Gross   2018-02-19  126  	},
736decac643e89 Thomas Gleixner 2009-08-19  127  };
736decac643e89 Thomas Gleixner 2009-08-19  128  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

