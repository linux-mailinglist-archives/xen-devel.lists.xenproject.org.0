Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB5C796DE4
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 02:14:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596944.931086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qe2eR-0003xS-Rz; Thu, 07 Sep 2023 00:13:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596944.931086; Thu, 07 Sep 2023 00:13:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qe2eR-0003vD-P5; Thu, 07 Sep 2023 00:13:39 +0000
Received: by outflank-mailman (input) for mailman id 596944;
 Thu, 07 Sep 2023 00:13:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lXo+=EX=intel.com=lkp@srs-se1.protection.inumbo.net>)
 id 1qe2eQ-0003v7-5k
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 00:13:38 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6194314e-4d13-11ee-8783-cb3800f73035;
 Thu, 07 Sep 2023 02:13:34 +0200 (CEST)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 17:13:26 -0700
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 06 Sep 2023 17:13:22 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qe2e8-0000j1-0U;
 Thu, 07 Sep 2023 00:13:20 +0000
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
X-Inumbo-ID: 6194314e-4d13-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694045615; x=1725581615;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WlkbumebDoiqA7h5lGLoCyy+L33WG8FJ86yAFQBnwlo=;
  b=F0cwzkkhC8Mhzq7bA/w7jXKXMqNxRUZWZD33h2OmUmdg/1O9sOIoFmHy
   awIRDw8ucA8SrC7QClQBT7BySVHIa9W+8CZzTCkotYqF6bJMAphaa6Rg+
   r1h5mDK0SPw0tWMjZ12QMd0ryW8q7tz1n2xdJXs4Qdzx/IeiqX86EiTMk
   kVpjycmIecV9dA2ZIebQRZ2mn+VcduxJD3d/y+LYu4nAn7VzveptT76+Z
   3FiU7zcCIXIJIBSFHaC3m14OlJfANqV+Db6VbpyLVa4ehtX/ldtPPvvNU
   Jy5bbCmIxnA/Yzp7OIO6vXC9c6lR3rW4TJkvrUOOJeBhjBCEbOrutu9Ih
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="374613200"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="374613200"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="856680657"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="856680657"
Date: Thu, 7 Sep 2023 08:12:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Andryuk <jandryuk@gmail.com>, Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Roger Pau Monne <roger.pau@citrix.com>, stable@vger.kernel.org,
	Jason Andryuk <jandryuk@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v2] acpi/processor: sanitize _PDC buffer bits when
 running as Xen dom0
Message-ID: <202309070741.2n0k8FjN-lkp@intel.com>
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
config: i386-randconfig-003-20230907 (https://download.01.org/0day-ci/archive/20230907/202309070741.2n0k8FjN-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309070741.2n0k8FjN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309070741.2n0k8FjN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/acpi/processor_pdc.c:147:3: error: call to undeclared function 'xen_sanitize_pdc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   xen_sanitize_pdc(buffer);
                   ^
   1 error generated.


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

