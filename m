Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F2AA0A399
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jan 2025 13:26:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.870156.1281571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWaY8-0001Xu-Ml; Sat, 11 Jan 2025 12:25:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 870156.1281571; Sat, 11 Jan 2025 12:25:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWaY8-0001VK-JR; Sat, 11 Jan 2025 12:25:08 +0000
Received: by outflank-mailman (input) for mailman id 870156;
 Sat, 11 Jan 2025 12:25:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cNkh=UD=intel.com=lkp@srs-se1.protection.inumbo.net>)
 id 1tWaY7-0001VE-4N
 for xen-devel@lists.xenproject.org; Sat, 11 Jan 2025 12:25:07 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13eee5ec-d017-11ef-a0e0-8be0dac302b0;
 Sat, 11 Jan 2025 13:25:04 +0100 (CET)
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2025 04:24:59 -0800
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 11 Jan 2025 04:24:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tWaXu-000Kcp-06;
 Sat, 11 Jan 2025 12:24:54 +0000
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
X-Inumbo-ID: 13eee5ec-d017-11ef-a0e0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736598304; x=1768134304;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A/8dZvb4PodA5W5f8//xP4ydt9geI9IEAZNNNqDbBBk=;
  b=L4eqZmcGKPClDZE944HDryXMaD3iXVM4vYFdm8xt5j+rVGKS2iUCb5Ua
   Q4oIxfX1hiIgY4Gel14xcdtXKRS4cz6R/x4IOd3JxPrumENrNmQBcnR0C
   wOvzzOIPaiktN70RBfZ6frDK12Sf79REq3RLa/aUfe5KCBgfBhsgHwtx0
   er9lFPIrr95tcT6/boClXr8guXkzEpmLnfUafOg9fFQhDmUylOxYNZKtr
   7mssIjQy3YL1HIFNKQ2+f3dduwDRO9QEUi60rDmLauexB9Of8On9FAXZw
   rMdsVuRupf3V36oGk0zajByUuRx3zkdCB+8YKbBco7jgP85xWIMt7Mjb0
   w==;
X-CSE-ConnectionGUID: m8goT+0WRG+5fPMtKpj2lg==
X-CSE-MsgGUID: ru0qFPFpQj6B+X2cbsxcAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="36568771"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="36568771"
X-CSE-ConnectionGUID: s7uiThp/StuhE0Qw+ZroYg==
X-CSE-MsgGUID: wIRlLujDR0CozHf5o3+rzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="127260895"
Date: Sat, 11 Jan 2025 20:24:15 +0800
From: kernel test robot <lkp@intel.com>
To: Roger Pau Monne <roger.pau@citrix.com>, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-pci@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Roger Pau Monne <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>, Bjorn Helgaas <helgaas@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 3/3] pci/msi: remove pci_msi_ignore_mask
Message-ID: <202501112048.6yCFh2ma-lkp@intel.com>
References: <20250110140152.27624-4-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110140152.27624-4-roger.pau@citrix.com>

Hi Roger,

kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus xen-tip/linux-next tip/irq/core linus/master v6.13-rc6 next-20250110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Roger-Pau-Monne/xen-pci-do-not-register-devices-outside-of-PCI-segment-scope/20250110-220331
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20250110140152.27624-4-roger.pau%40citrix.com
patch subject: [PATCH 3/3] pci/msi: remove pci_msi_ignore_mask
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20250111/202501112048.6yCFh2ma-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501112048.6yCFh2ma-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501112048.6yCFh2ma-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pci/msi/msi.c:12:
   In file included from include/linux/irq.h:23:
   In file included from arch/riscv/include/asm/irq.h:10:
   In file included from include/linux/interrupt.h:22:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/pci/msi/msi.c:288:40: error: incomplete definition of type 'const struct irq_domain'
     288 |         const struct msi_domain_info *info = d->host_data;
         |                                              ~^
   include/linux/irq.h:130:8: note: forward declaration of 'struct irq_domain'
     130 | struct irq_domain;
         |        ^
   drivers/pci/msi/msi.c:604:40: error: incomplete definition of type 'const struct irq_domain'
     604 |         const struct msi_domain_info *info = d->host_data;
         |                                              ~^
   include/linux/irq.h:130:8: note: forward declaration of 'struct irq_domain'
     130 | struct irq_domain;
         |        ^
   drivers/pci/msi/msi.c:714:40: error: incomplete definition of type 'const struct irq_domain'
     714 |         const struct msi_domain_info *info = d->host_data;
         |                                              ~^
   include/linux/irq.h:130:8: note: forward declaration of 'struct irq_domain'
     130 | struct irq_domain;
         |        ^
   1 warning and 3 errors generated.


vim +288 drivers/pci/msi/msi.c

   283	
   284	static int msi_setup_msi_desc(struct pci_dev *dev, int nvec,
   285				      struct irq_affinity_desc *masks)
   286	{
   287		const struct irq_domain *d = dev_get_msi_domain(&dev->dev);
 > 288		const struct msi_domain_info *info = d->host_data;
   289		struct msi_desc desc;
   290		u16 control;
   291	
   292		/* MSI Entry Initialization */
   293		memset(&desc, 0, sizeof(desc));
   294	
   295		pci_read_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, &control);
   296		/* Lies, damned lies, and MSIs */
   297		if (dev->dev_flags & PCI_DEV_FLAGS_HAS_MSI_MASKING)
   298			control |= PCI_MSI_FLAGS_MASKBIT;
   299		if (info->flags & MSI_FLAG_NO_MASK)
   300			control &= ~PCI_MSI_FLAGS_MASKBIT;
   301	
   302		desc.nvec_used			= nvec;
   303		desc.pci.msi_attrib.is_64	= !!(control & PCI_MSI_FLAGS_64BIT);
   304		desc.pci.msi_attrib.can_mask	= !!(control & PCI_MSI_FLAGS_MASKBIT);
   305		desc.pci.msi_attrib.default_irq	= dev->irq;
   306		desc.pci.msi_attrib.multi_cap	= FIELD_GET(PCI_MSI_FLAGS_QMASK, control);
   307		desc.pci.msi_attrib.multiple	= ilog2(__roundup_pow_of_two(nvec));
   308		desc.affinity			= masks;
   309	
   310		if (control & PCI_MSI_FLAGS_64BIT)
   311			desc.pci.mask_pos = dev->msi_cap + PCI_MSI_MASK_64;
   312		else
   313			desc.pci.mask_pos = dev->msi_cap + PCI_MSI_MASK_32;
   314	
   315		/* Save the initial mask status */
   316		if (desc.pci.msi_attrib.can_mask)
   317			pci_read_config_dword(dev, desc.pci.mask_pos, &desc.pci.msi_mask);
   318	
   319		return msi_insert_msi_desc(&dev->dev, &desc);
   320	}
   321	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

