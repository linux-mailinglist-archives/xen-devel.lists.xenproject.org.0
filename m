Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E87472AB98
	for <lists+xen-devel@lfdr.de>; Sat, 10 Jun 2023 15:01:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546499.853443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7yC9-0004jw-3t; Sat, 10 Jun 2023 12:59:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546499.853443; Sat, 10 Jun 2023 12:59:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7yC9-0004hg-0e; Sat, 10 Jun 2023 12:59:53 +0000
Received: by outflank-mailman (input) for mailman id 546499;
 Sat, 10 Jun 2023 12:59:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4fTJ=B6=intel.com=lkp@srs-se1.protection.inumbo.net>)
 id 1q7yC6-0004gp-QD
 for xen-devel@lists.xenproject.org; Sat, 10 Jun 2023 12:59:51 +0000
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abb01068-078e-11ee-8611-37d641c3527e;
 Sat, 10 Jun 2023 14:59:46 +0200 (CEST)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2023 05:59:42 -0700
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 10 Jun 2023 05:59:38 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1q7yBt-000A6A-2O;
 Sat, 10 Jun 2023 12:59:37 +0000
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
X-Inumbo-ID: abb01068-078e-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686401986; x=1717937986;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ITLJwuiMSNZijdY4Cz6EusiXck7vPTOmLnkmQWskaI8=;
  b=Z95AYMxanozb81j/PirH8BtpRPec1X9YrOGDAYFbCm5maN3n9lntsifY
   o6lELulYhTwvcYVdqXcTtYu9wYJEAXGVCDkrVgcqtjJ0o55MTH7bzv/aF
   eYrIviMJ8gvHvF+TNkzYV4lYYZm02RBz0ngvtu5wXpnYhYPos7H+NwVg2
   sdnbXOkl1c6Pczjf8OmFU3YfRl6/QefSmwyatUGhwFlJxR8VUtn/uA1oi
   wZCGTFBi8/wudmEsOo1G0oiHeXah3lMHU4Xl3N/uZHFACXTqvfgC4BQJm
   T2ugYVQiNouAy7y8vX/EDRlup5lItl+4bEx6fD3U7+VdPaTZmJ2Ll7pjY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="338122805"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="338122805"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="957451084"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="957451084"
Date: Sat, 10 Jun 2023 20:59:16 +0800
From: kernel test robot <lkp@intel.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>,
	Federico Vaga <federico.vaga@vaga.pv.it>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Lee Jones <lee@kernel.org>, Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: oe-kbuild-all@lists.linux.dev,
	Demi Marie Obenour <demi@invisiblethingslab.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/4] vsscanf(): Return -ERANGE on integer overflow
Message-ID: <202306102055.ZSJK8Xsj-lkp@intel.com>
References: <20230610025759.1813-2-demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230610025759.1813-2-demi@invisiblethingslab.com>

Hi Demi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on lee-leds/for-leds-next linus/master v6.4-rc5 next-20230609]
[cannot apply to xen-tip/linux-next lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Demi-Marie-Obenour/vsscanf-Return-ERANGE-on-integer-overflow/20230610-110026
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20230610025759.1813-2-demi%40invisiblethingslab.com
patch subject: [PATCH 2/4] vsscanf(): Return -ERANGE on integer overflow
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230610/202306102055.ZSJK8Xsj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        git remote add lee-mfd https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git
        git fetch lee-mfd for-mfd-next
        git checkout lee-mfd/for-mfd-next
        b4 shazam https://lore.kernel.org/r/20230610025759.1813-2-demi@invisiblethingslab.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/staging/media/atomisp/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306102055.ZSJK8Xsj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/staging/media/atomisp//pci/ia_css_acc_types.h:25,
                    from drivers/staging/media/atomisp//pci/ia_css_pipe_public.h:29,
                    from drivers/staging/media/atomisp//pci/ia_css_stream_public.h:25,
                    from drivers/staging/media/atomisp//pci/runtime/binary/interface/ia_css_binary.h:23,
                    from drivers/staging/media/atomisp//pci/runtime/debug/interface/ia_css_debug.h:25,
                    from drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc.host.c:18:
>> drivers/staging/media/atomisp//pci/hive_isp_css_include/platform_support.h:30: warning: "UCHAR_MAX" redefined
      30 | #define UCHAR_MAX  (255)
         | 
   In file included from include/linux/limits.h:7,
                    from drivers/staging/media/atomisp//pci/hive_isp_css_include/type_support.h:37,
                    from drivers/staging/media/atomisp//pci/ia_css_types.h:27,
                    from drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc.host.c:16:
   include/vdso/limits.h:5: note: this is the location of the previous definition
       5 | #define UCHAR_MAX       ((unsigned char)~0U)
         | 


vim +/UCHAR_MAX +30 drivers/staging/media/atomisp//pci/hive_isp_css_include/platform_support.h

ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/hive_isp_css_include/platform_support.h Mauro Carvalho Chehab 2020-04-19  27  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/hive_isp_css_include/platform_support.h Mauro Carvalho Chehab 2020-04-19  28  #define UINT16_MAX USHRT_MAX
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/hive_isp_css_include/platform_support.h Mauro Carvalho Chehab 2020-04-19  29  #define UINT32_MAX UINT_MAX
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/hive_isp_css_include/platform_support.h Mauro Carvalho Chehab 2020-04-19 @30  #define UCHAR_MAX  (255)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/hive_isp_css_include/platform_support.h Mauro Carvalho Chehab 2020-04-19  31  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

