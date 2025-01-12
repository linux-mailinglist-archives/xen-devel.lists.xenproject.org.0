Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5809EA0A70C
	for <lists+xen-devel@lfdr.de>; Sun, 12 Jan 2025 03:59:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.870253.1281590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWoBD-0007Ao-BJ; Sun, 12 Jan 2025 02:58:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 870253.1281590; Sun, 12 Jan 2025 02:58:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWoBD-000798-4d; Sun, 12 Jan 2025 02:58:23 +0000
Received: by outflank-mailman (input) for mailman id 870253;
 Sun, 12 Jan 2025 02:58:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BgA9=UE=intel.com=lkp@srs-se1.protection.inumbo.net>)
 id 1tWoBB-000792-HD
 for xen-devel@lists.xenproject.org; Sun, 12 Jan 2025 02:58:21 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 117bb59a-d091-11ef-a0e1-8be0dac302b0;
 Sun, 12 Jan 2025 03:58:17 +0100 (CET)
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2025 18:58:14 -0800
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 11 Jan 2025 18:58:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tWoAy-000LVj-34;
 Sun, 12 Jan 2025 02:58:08 +0000
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
X-Inumbo-ID: 117bb59a-d091-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736650698; x=1768186698;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P6HmMuEanbN2AbJSaR7/q6oJzdrrcsN9KTJG/tRphkg=;
  b=IoeYaYy++y+nudj/LC5WGmHcDYg8D2gjKTQA4ZTyrS6ybErU+NIcEZ7d
   p/6Wfnbh2VfBHUZP8Dp5sBcPXWWDpzV4CSY3P1eBK+6x+19g/dPlx5eFI
   /YB7PKEWV8dkjOyczNgda8FoGGJJR9EH1DgJXYw2PavP+DSa3mRO/fqiL
   csR1SLAfGYpLaY02BiDUexIEazdyDu4IErMDxwq4V6Z8L+JcLOK1pcg3t
   falI8c6J1+hTT2fEko21qiAv89x8qTQslFmO/1HnhSh7zz1UcxG5dGIXb
   UptENu5t66mYf4xu7BHeyKe1Ty6dA6nF10Wt7tuusE9phqvBeY/nlw1G1
   A==;
X-CSE-ConnectionGUID: jUA6XyM8RrKWBiXaQrP22g==
X-CSE-MsgGUID: u93Tf128TAOJ/jP/qZ/IhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="47567860"
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="47567860"
X-CSE-ConnectionGUID: /Oq5OKv5Spuy/fOjb2Q2bw==
X-CSE-MsgGUID: 0+LuP4+JQZaN13IodNqk0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="141387405"
Date: Sun, 12 Jan 2025 10:57:27 +0800
From: kernel test robot <lkp@intel.com>
To: Roger Pau Monne <roger.pau@citrix.com>, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-pci@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Roger Pau Monne <roger.pau@citrix.com>,
	Nirmal Patel <nirmal.patel@linux.intel.com>,
	Jonathan Derrick <jonathan.derrick@linux.dev>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH 2/3] vmd: disable MSI remapping bypass under Xen
Message-ID: <202501121029.dJk0TBPr-lkp@intel.com>
References: <20250110140152.27624-3-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110140152.27624-3-roger.pau@citrix.com>

Hi Roger,

kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus tip/irq/core linus/master v6.13-rc6 next-20250110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Roger-Pau-Monne/xen-pci-do-not-register-devices-outside-of-PCI-segment-scope/20250110-220331
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20250110140152.27624-3-roger.pau%40citrix.com
patch subject: [PATCH 2/3] vmd: disable MSI remapping bypass under Xen
config: x86_64-buildonly-randconfig-001-20250112 (https://download.01.org/0day-ci/archive/20250112/202501121029.dJk0TBPr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250112/202501121029.dJk0TBPr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501121029.dJk0TBPr-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/controller/vmd.c: In function 'vmd_probe':
>> drivers/pci/controller/vmd.c:973:13: error: implicit declaration of function 'xen_domain' [-Werror=implicit-function-declaration]
     973 |         if (xen_domain())
         |             ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/xen_domain +973 drivers/pci/controller/vmd.c

   966	
   967	static int vmd_probe(struct pci_dev *dev, const struct pci_device_id *id)
   968	{
   969		unsigned long features = (unsigned long) id->driver_data;
   970		struct vmd_dev *vmd;
   971		int err;
   972	
 > 973		if (xen_domain())
   974			/*
   975			 * Xen doesn't have knowledge about devices in the VMD bus.
   976			 * Bypass of MSI remapping won't work in that case as direct
   977			 * write to the MSI entries won't result in functional
   978			 * interrupts.
   979			 */
   980			features &= ~VMD_FEAT_CAN_BYPASS_MSI_REMAP;
   981	
   982		if (resource_size(&dev->resource[VMD_CFGBAR]) < (1 << 20))
   983			return -ENOMEM;
   984	
   985		vmd = devm_kzalloc(&dev->dev, sizeof(*vmd), GFP_KERNEL);
   986		if (!vmd)
   987			return -ENOMEM;
   988	
   989		vmd->dev = dev;
   990		vmd->instance = ida_alloc(&vmd_instance_ida, GFP_KERNEL);
   991		if (vmd->instance < 0)
   992			return vmd->instance;
   993	
   994		vmd->name = devm_kasprintf(&dev->dev, GFP_KERNEL, "vmd%d",
   995					   vmd->instance);
   996		if (!vmd->name) {
   997			err = -ENOMEM;
   998			goto out_release_instance;
   999		}
  1000	
  1001		err = pcim_enable_device(dev);
  1002		if (err < 0)
  1003			goto out_release_instance;
  1004	
  1005		vmd->cfgbar = pcim_iomap(dev, VMD_CFGBAR, 0);
  1006		if (!vmd->cfgbar) {
  1007			err = -ENOMEM;
  1008			goto out_release_instance;
  1009		}
  1010	
  1011		pci_set_master(dev);
  1012		if (dma_set_mask_and_coherent(&dev->dev, DMA_BIT_MASK(64)) &&
  1013		    dma_set_mask_and_coherent(&dev->dev, DMA_BIT_MASK(32))) {
  1014			err = -ENODEV;
  1015			goto out_release_instance;
  1016		}
  1017	
  1018		if (features & VMD_FEAT_OFFSET_FIRST_VECTOR)
  1019			vmd->first_vec = 1;
  1020	
  1021		spin_lock_init(&vmd->cfg_lock);
  1022		pci_set_drvdata(dev, vmd);
  1023		err = vmd_enable_domain(vmd, features);
  1024		if (err)
  1025			goto out_release_instance;
  1026	
  1027		dev_info(&vmd->dev->dev, "Bound to PCI domain %04x\n",
  1028			 vmd->sysdata.domain);
  1029		return 0;
  1030	
  1031	 out_release_instance:
  1032		ida_free(&vmd_instance_ida, vmd->instance);
  1033		return err;
  1034	}
  1035	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

