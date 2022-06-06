Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC11653E4EC
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jun 2022 15:58:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342600.567653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyDFV-00062k-8U; Mon, 06 Jun 2022 13:58:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342600.567653; Mon, 06 Jun 2022 13:58:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyDFV-0005zf-4m; Mon, 06 Jun 2022 13:58:29 +0000
Received: by outflank-mailman (input) for mailman id 342600;
 Mon, 06 Jun 2022 13:58:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ykZ=WN=intel.com=lkp@srs-se1.protection.inumbo.net>)
 id 1nyDFT-0005zN-C2
 for xen-devel@lists.xenproject.org; Mon, 06 Jun 2022 13:58:27 +0000
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b83a3b88-e5a0-11ec-bd2c-47488cf2e6aa;
 Mon, 06 Jun 2022 15:58:23 +0200 (CEST)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 06:58:18 -0700
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 06 Jun 2022 06:58:16 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nyDFI-000ClV-3h;
 Mon, 06 Jun 2022 13:58:16 +0000
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
X-Inumbo-ID: b83a3b88-e5a0-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654523903; x=1686059903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OrdvjfoyWC2oTUugw5yPXKwfQFYNc7s7nspjZTsHZQw=;
  b=YfKot5kU9Xq2POvykM4Xr5QoB9eIWKROxPj0oEd0/ZNr0hcutVOkgcc7
   ZoMOmB5mFeg1oW9a/YNIo+z+k7Vua3JVMM3Q776FilbF/DWNPY8dAT1YR
   x09CJBBIFMzouEuHftPo20sydS4pwZYnIHHyxdIVynmZ1g/H09mYrUYeX
   32chIqQV20rTGAAomDVcSoURrlvH3skJpA0bKGrKoZHZWQR7oDppLhkoH
   x/QPmx2ArNpgsZMHCISMx8UJKAk1TFHquWzpFTJFzVwsdmtGtz7pezV2q
   ZjEj731pVGD6QchsVRLEsSy0NHXY+aAgO1gZq2zlG0jtzu1QEsaaVAD+i
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10369"; a="264600466"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="264600466"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="614363696"
Date: Mon, 6 Jun 2022 21:57:57 +0800
From: kernel test robot <lkp@intel.com>
To: Juergen Gross <jgross@suse.com>
Cc: kbuild-all@lists.01.org, xen-devel@lists.xenproject.org,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: [xen-tip:linux-next 6/10] drivers/xen/grant-dma-ops.c:278:6:
 warning: no previous prototype for 'xen_grant_setup_dma_ops'
Message-ID: <202206062149.cNjVOFb7-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Juergen,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git linux-next
head:   bb1b8419ea23d8d2de3c886a540f41e39dfe82a9
commit: 6b268a48884cf8ef00477a0e652864638391587c [6/10] xen/virtio: Enable restricted memory access using Xen grant mappings
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20220606/202206062149.cNjVOFb7-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git/commit/?id=6b268a48884cf8ef00477a0e652864638391587c
        git remote add xen-tip https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git
        git fetch --no-tags xen-tip linux-next
        git checkout 6b268a48884cf8ef00477a0e652864638391587c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/usb/ drivers/xen/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/xen/grant-dma-ops.c:278:6: warning: no previous prototype for 'xen_grant_setup_dma_ops' [-Wmissing-prototypes]
     278 | void xen_grant_setup_dma_ops(struct device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~


vim +/xen_grant_setup_dma_ops +278 drivers/xen/grant-dma-ops.c

2c73e39aceb90b Juergen Gross 2022-06-02  277  
2c73e39aceb90b Juergen Gross 2022-06-02 @278  void xen_grant_setup_dma_ops(struct device *dev)
2c73e39aceb90b Juergen Gross 2022-06-02  279  {
2c73e39aceb90b Juergen Gross 2022-06-02  280  	struct xen_grant_dma_data *data;
2c73e39aceb90b Juergen Gross 2022-06-02  281  
2c73e39aceb90b Juergen Gross 2022-06-02  282  	data = find_xen_grant_dma_data(dev);
2c73e39aceb90b Juergen Gross 2022-06-02  283  	if (data) {
2c73e39aceb90b Juergen Gross 2022-06-02  284  		dev_err(dev, "Xen grant DMA data is already created\n");
2c73e39aceb90b Juergen Gross 2022-06-02  285  		return;
2c73e39aceb90b Juergen Gross 2022-06-02  286  	}
2c73e39aceb90b Juergen Gross 2022-06-02  287  
2c73e39aceb90b Juergen Gross 2022-06-02  288  	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
2c73e39aceb90b Juergen Gross 2022-06-02  289  	if (!data)
2c73e39aceb90b Juergen Gross 2022-06-02  290  		goto err;
2c73e39aceb90b Juergen Gross 2022-06-02  291  
2c73e39aceb90b Juergen Gross 2022-06-02  292  	/* XXX The dom0 is hardcoded as the backend domain for now */
2c73e39aceb90b Juergen Gross 2022-06-02  293  	data->backend_domid = 0;
2c73e39aceb90b Juergen Gross 2022-06-02  294  
2c73e39aceb90b Juergen Gross 2022-06-02  295  	if (xa_err(xa_store(&xen_grant_dma_devices, (unsigned long)dev, data,
2c73e39aceb90b Juergen Gross 2022-06-02  296  			GFP_KERNEL))) {
2c73e39aceb90b Juergen Gross 2022-06-02  297  		dev_err(dev, "Cannot store Xen grant DMA data\n");
2c73e39aceb90b Juergen Gross 2022-06-02  298  		goto err;
2c73e39aceb90b Juergen Gross 2022-06-02  299  	}
2c73e39aceb90b Juergen Gross 2022-06-02  300  
2c73e39aceb90b Juergen Gross 2022-06-02  301  	dev->dma_ops = &xen_grant_dma_ops;
2c73e39aceb90b Juergen Gross 2022-06-02  302  
2c73e39aceb90b Juergen Gross 2022-06-02  303  	return;
2c73e39aceb90b Juergen Gross 2022-06-02  304  
2c73e39aceb90b Juergen Gross 2022-06-02  305  err:
2c73e39aceb90b Juergen Gross 2022-06-02  306  	dev_err(dev, "Cannot set up Xen grant DMA ops, retain platform DMA ops\n");
2c73e39aceb90b Juergen Gross 2022-06-02  307  }
2c73e39aceb90b Juergen Gross 2022-06-02  308  

:::::: The code at line 278 was first introduced by commit
:::::: 2c73e39aceb90b59058cdbc497916049e798963c xen/grant-dma-ops: Add option to restrict memory access under Xen

:::::: TO: Juergen Gross <jgross@suse.com>
:::::: CC: Juergen Gross <jgross@suse.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

