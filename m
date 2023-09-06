Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF057946D7
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 01:11:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596902.931019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qe1fJ-0001f7-F8; Wed, 06 Sep 2023 23:10:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596902.931019; Wed, 06 Sep 2023 23:10:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qe1fJ-0001bz-CO; Wed, 06 Sep 2023 23:10:29 +0000
Received: by outflank-mailman (input) for mailman id 596902;
 Wed, 06 Sep 2023 23:10:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r+8v=EW=intel.com=lkp@srs-se1.protection.inumbo.net>)
 id 1qe1fH-0001ZS-Hq
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 23:10:27 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c65e70b-4d0a-11ee-9b0d-b553b5be7939;
 Thu, 07 Sep 2023 01:10:21 +0200 (CEST)
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 16:10:13 -0700
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 06 Sep 2023 16:10:09 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qe1ew-0000gB-2m;
 Wed, 06 Sep 2023 23:10:06 +0000
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
X-Inumbo-ID: 8c65e70b-4d0a-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694041821; x=1725577821;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fEw9pa/NdSdFIzoYPpsMEnIibMq4wIaQI1Ds5infKOM=;
  b=LuEXLknw/9cAovSwTeTUhE6AQr0f0/DCe6EDgOzOm/XINphnedE62KkZ
   UgdRP83HTP6/A0A18QGwzMZB3hhjZeqDTN5Ip2+qEV+i5hi6jofSV+0GU
   InQkLdiTgdKKYYXTHKcTf6tcwE6HfJB6PYPgQ1sQg/Xs1K0mo5/euYNNP
   Nnk7ZM/ypOi/bCgc4UIgKs8aTqfES4NqM+NaBkA8NN4qNnmRY4FLpH7EE
   XCsD5U+Qb9EmfsY2Nkeb8J0ALNzNlUgYXvvhKSvF/CoPApAKvmZ96cu2v
   jC8BareLHg8bJ0JSQiM6EyVamdnP2+tKa99yzI6Bmejs+mYzf9fPvhESd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="408215570"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="408215570"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="744866586"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="744866586"
Date: Thu, 7 Sep 2023 07:09:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Andryuk <jandryuk@gmail.com>, Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Roger Pau Monne <roger.pau@citrix.com>,
	stable@vger.kernel.org, Jason Andryuk <jandryuk@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v2] acpi/processor: sanitize _PDC buffer bits when
 running as Xen dom0
Message-ID: <202309070625.dJUDcGZg-lkp@intel.com>
References: <20230906182125.48642-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230906182125.48642-1-jandryuk@gmail.com>

Hi Jason,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on v6.5]
[cannot apply to rafael-pm/linux-next linus/master next-20230906]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Andryuk/acpi-processor-sanitize-_PDC-buffer-bits-when-running-as-Xen-dom0/20230907-022235
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20230906182125.48642-1-jandryuk%40gmail.com
patch subject: [PATCH v2] acpi/processor: sanitize _PDC buffer bits when running as Xen dom0
config: x86_64-randconfig-r011-20230907 (https://download.01.org/0day-ci/archive/20230907/202309070625.dJUDcGZg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309070625.dJUDcGZg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309070625.dJUDcGZg-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/acpi/processor_pdc.c: In function 'acpi_processor_eval_pdc':
>> drivers/acpi/processor_pdc.c:147:17: error: implicit declaration of function 'xen_sanitize_pdc' [-Werror=implicit-function-declaration]
     147 |                 xen_sanitize_pdc(buffer);
         |                 ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/xen_sanitize_pdc +147 drivers/acpi/processor_pdc.c

   116	
   117	/*
   118	 * _PDC is required for a BIOS-OS handshake for most of the newer
   119	 * ACPI processor features.
   120	 */
   121	static acpi_status
   122	acpi_processor_eval_pdc(acpi_handle handle, struct acpi_object_list *pdc_in)
   123	{
   124		acpi_status status = AE_OK;
   125		union acpi_object *obj;
   126		u32 *buffer = NULL;
   127	
   128		obj = pdc_in->pointer;
   129		buffer = (u32 *)(obj->buffer.pointer);
   130	
   131		if (boot_option_idle_override == IDLE_NOMWAIT) {
   132			/*
   133			 * If mwait is disabled for CPU C-states, the C2C3_FFH access
   134			 * mode will be disabled in the parameter of _PDC object.
   135			 * Of course C1_FFH access mode will also be disabled.
   136			 */
   137			buffer[2] &= ~(ACPI_PDC_C_C2C3_FFH | ACPI_PDC_C_C1_FFH);
   138		}
   139	
   140		if (xen_initial_domain()) {
   141			/*
   142			 * When Linux is running as Xen dom0, the hypervisor is the
   143			 * entity in charge of the processor power management, and so
   144			 * Xen needs to check the OS capabilities reported in the _PDC
   145			 * buffer matches what the hypervisor driver supports.
   146			 */
 > 147			xen_sanitize_pdc(buffer);
   148		}
   149	
   150		status = acpi_evaluate_object(handle, "_PDC", pdc_in, NULL);
   151	
   152		if (ACPI_FAILURE(status))
   153			acpi_handle_debug(handle,
   154			    "Could not evaluate _PDC, using legacy perf control\n");
   155	
   156		return status;
   157	}
   158	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

