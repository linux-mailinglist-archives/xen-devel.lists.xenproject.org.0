Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F8A901C16
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 09:49:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736992.1143101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGZmE-0002g5-VE; Mon, 10 Jun 2024 07:49:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736992.1143101; Mon, 10 Jun 2024 07:49:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGZmE-0002dc-RM; Mon, 10 Jun 2024 07:49:14 +0000
Received: by outflank-mailman (input) for mailman id 736992;
 Mon, 10 Jun 2024 07:49:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Rpda=NM=intel.com=lkp@srs-se1.protection.inumbo.net>)
 id 1sGZmD-0002dV-BI
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 07:49:13 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eabb4a85-26fd-11ef-b4bb-af5377834399;
 Mon, 10 Jun 2024 09:49:09 +0200 (CEST)
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 00:49:07 -0700
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
 by fmviesa010.fm.intel.com with ESMTP; 10 Jun 2024 00:49:04 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sGZm2-0001x1-0B;
 Mon, 10 Jun 2024 07:49:02 +0000
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
X-Inumbo-ID: eabb4a85-26fd-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718005750; x=1749541750;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6jhS++X/kRSNxPfeeQz/r6FMf/hMVlZK/ESRq3wR3fE=;
  b=HIWPQd19XH9UV9cZrawGD5XiONZjyCgFP7HBO5edG0FRi+rvRENo7da0
   vKeSjDEccBJXexLQka90zZOEiqNgpKqeyQy2T5e2tOtLGurwaL72+Kw86
   LETaRC7VRRsAnCjKBaJaoiEinIxQRcV3Jep3Rn/TaMBwHq9zcGeIRZfkO
   w1CQfqhuZ/kgl95D9Lt96+f4xi4pep4ci1NfhsF1qZLep6CDTgsz0wp00
   Nzh7jR8tmhTXAMUyGeOp/xX0eQ9hs1aTEqA0LW5Juzb0PrJcOB3RQxJvi
   3YO4LgLQ5uXl/2n7tEX9sRYF/NZBuiZhsjmlbwts/qeFx+2kumsVOmg/L
   A==;
X-CSE-ConnectionGUID: 6d4ox8IpRV2zH0G9vTTXlg==
X-CSE-MsgGUID: w/2AFHvdRmGVIbpDnyaMgQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="40052298"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="40052298"
X-CSE-ConnectionGUID: XI7aUyUVQ42Vnk1WEk1W2w==
X-CSE-MsgGUID: SoXCdszSRi+NL0hiSVaKjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="39060747"
Date: Mon, 10 Jun 2024 15:48:31 +0800
From: kernel test robot <lkp@intel.com>
To: Abhinav Jain <jain.abhinav177@gmail.com>, jgross@suse.com,
	sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, skhan@linuxfoundation.org,
	javier.carrasco.cruz@gmail.com, jain.abhinav177@gmail.com
Subject: Re: [PATCH] xen: xen-pciback: Export a bridge and all its children
 as per TODO
Message-ID: <202406101511.hTO5m855-lkp@intel.com>
References: <20240609184410.53500-1-jain.abhinav177@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240609184410.53500-1-jain.abhinav177@gmail.com>

Hi Abhinav,

kernel test robot noticed the following build errors:

[auto build test ERROR on xen-tip/linux-next]
[also build test ERROR on linus/master v6.10-rc3 next-20240607]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Abhinav-Jain/xen-xen-pciback-Export-a-bridge-and-all-its-children-as-per-TODO/20240610-024623
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git linux-next
patch link:    https://lore.kernel.org/r/20240609184410.53500-1-jain.abhinav177%40gmail.com
patch subject: [PATCH] xen: xen-pciback: Export a bridge and all its children as per TODO
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240610/202406101511.hTO5m855-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240610/202406101511.hTO5m855-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406101511.hTO5m855-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/xen/xenbus.h:37,
                    from drivers/xen/xen-pciback/xenbus.c:15:
   drivers/xen/xen-pciback/xenbus.c: In function 'xen_pcibk_export_device':
>> drivers/xen/xen-pciback/xenbus.c:270:38: error: 'struct pci_dev' has no member named 'domain'
     270 |                                 child->domain, child->bus->number,
         |                                      ^~
   include/linux/dev_printk.h:129:48: note: in definition of macro 'dev_printk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
         |                                                ^~~~~~~~~~~
   drivers/xen/xen-pciback/xenbus.c:268:25: note: in expansion of macro 'dev_dbg'
     268 |                         dev_dbg(&pdev->xdev->dev,
         |                         ^~~~~~~
   drivers/xen/xen-pciback/xenbus.c:275:60: error: 'struct pci_dev' has no member named 'domain'
     275 |                                                       child->domain,
         |                                                            ^~
   drivers/xen/xen-pciback/xenbus.c:284:46: error: 'struct pci_dev' has no member named 'domain'
     284 |                                         child->domain,
         |                                              ^~
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/xen/xen-pciback/xenbus.c:281:33: note: in expansion of macro 'dev_err'
     281 |                                 dev_err(&pdev->xdev->dev,
         |                                 ^~~~~~~


vim +270 drivers/xen/xen-pciback/xenbus.c

   225	
   226	static int xen_pcibk_export_device(struct xen_pcibk_device *pdev,
   227					 int domain, int bus, int slot, int func,
   228					 int devid)
   229	{
   230		struct pci_dev *dev;
   231		int err = 0;
   232	
   233		dev_dbg(&pdev->xdev->dev, "exporting dom %x bus %x slot %x func %x\n",
   234			domain, bus, slot, func);
   235	
   236		dev = pcistub_get_pci_dev_by_slot(pdev, domain, bus, slot, func);
   237		if (!dev) {
   238			err = -EINVAL;
   239			xenbus_dev_fatal(pdev->xdev, err,
   240					 "Couldn't locate PCI device "
   241					 "(%04x:%02x:%02x.%d)! "
   242					 "perhaps already in-use?",
   243					 domain, bus, slot, func);
   244			goto out;
   245		}
   246	
   247		err = xen_pcibk_add_pci_dev(pdev, dev, devid,
   248					    xen_pcibk_publish_pci_dev);
   249		if (err)
   250			goto out;
   251	
   252		dev_info(&dev->dev, "registering for %d\n", pdev->xdev->otherend_id);
   253		if (xen_register_device_domain_owner(dev,
   254						     pdev->xdev->otherend_id) != 0) {
   255			dev_err(&dev->dev, "Stealing ownership from dom%d.\n",
   256				xen_find_device_domain_owner(dev));
   257			xen_unregister_device_domain_owner(dev);
   258			xen_register_device_domain_owner(dev, pdev->xdev->otherend_id);
   259		}
   260	
   261		/* Check if the device is a bridge and export all its children */
   262		if ((dev->hdr_type && PCI_HEADER_TYPE_MASK) == PCI_HEADER_TYPE_BRIDGE) {
   263			struct pci_dev *child = NULL;
   264	
   265			/* Iterate over all the devices in this bridge */
   266			list_for_each_entry(child, &dev->subordinate->devices,
   267					bus_list) {
   268				dev_dbg(&pdev->xdev->dev,
   269					"exporting child device %04x:%02x:%02x.%d\n",
 > 270					child->domain, child->bus->number,
   271					PCI_SLOT(child->devfn),
   272					PCI_FUNC(child->devfn));
   273	
   274				err = xen_pcibk_export_device(pdev,
   275							      child->domain,
   276							      child->bus->number,
   277							      PCI_SLOT(child->devfn),
   278							      PCI_FUNC(child->devfn),
   279							      devid);
   280				if (err) {
   281					dev_err(&pdev->xdev->dev,
   282						"failed to export child device : "
   283						"%04x:%02x:%02x.%d\n",
   284						child->domain,
   285						child->bus->number,
   286						PCI_SLOT(child->devfn),
   287						PCI_FUNC(child->devfn));
   288					goto out;
   289				}
   290			}
   291		}
   292	out:
   293		return err;
   294	}
   295	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

