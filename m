Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A04C872A935
	for <lists+xen-devel@lfdr.de>; Sat, 10 Jun 2023 07:43:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546387.853206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7rMt-0005Wj-HM; Sat, 10 Jun 2023 05:42:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546387.853206; Sat, 10 Jun 2023 05:42:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7rMt-0005PI-D4; Sat, 10 Jun 2023 05:42:31 +0000
Received: by outflank-mailman (input) for mailman id 546387;
 Sat, 10 Jun 2023 05:42:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4fTJ=B6=intel.com=lkp@srs-se1.protection.inumbo.net>)
 id 1q7rMr-0005My-Kj
 for xen-devel@lists.xenproject.org; Sat, 10 Jun 2023 05:42:29 +0000
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95de4ab1-0751-11ee-b232-6b7b168915f2;
 Sat, 10 Jun 2023 07:42:28 +0200 (CEST)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 22:42:26 -0700
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 09 Jun 2023 22:42:17 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1q7rMe-0009mi-1j;
 Sat, 10 Jun 2023 05:42:16 +0000
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
X-Inumbo-ID: 95de4ab1-0751-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686375748; x=1717911748;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=604bTd5KebLX7Wwvo0G69iyofM3Y2hWMagG0LdnFklk=;
  b=lrBaQn7g4FfIKN/WOPS8jhMUPZEzaql315hB75Ahuj/qb7icshHcgEQn
   8MctfnCWkNglANbeKCGPcLeSQmv0CUd0a06y0Es2FQCmE6LWtjoBkwbim
   kafJ6r1kAfoRqbHTk5Z3T5a79ShM8aSz3rIqEImurHRgM5kWCRq4yBQPt
   eZdX0F7fr+b3a7rsT0c8X+L/BsXATN7J+kC7y+utxzWwqh4rKvktgJxaN
   v1EwjZ+fWqO3jyGyLbStgarzNiahoj69vnUi8hfqvv7OR5flWuz8rsmCc
   beTLz1vviZTYVKXqYy4nppoFU++3EhFVIbUW7yFIFC19qa/emkOfYQNxG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="342412496"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; 
   d="scan'208";a="342412496"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="884812675"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; 
   d="scan'208";a="884812675"
Date: Sat, 10 Jun 2023 13:42:09 +0800
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Demi Marie Obenour <demi@invisiblethingslab.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/4] Rip out simple_strtoll()
Message-ID: <202306101334.lDZERsKo-lkp@intel.com>
References: <20230610025759.1813-1-demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230610025759.1813-1-demi@invisiblethingslab.com>

Hi Demi,

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-mfd/for-mfd-next]
[also build test ERROR on lee-leds/for-leds-next linus/master v6.4-rc5 next-20230609]
[cannot apply to xen-tip/linux-next lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Demi-Marie-Obenour/vsscanf-Return-ERANGE-on-integer-overflow/20230610-110026
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20230610025759.1813-1-demi%40invisiblethingslab.com
patch subject: [PATCH 1/4] Rip out simple_strtoll()
config: arm-randconfig-r046-20230610 (https://download.01.org/0day-ci/archive/20230610/202306101334.lDZERsKo-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        git remote add lee-mfd https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git
        git fetch lee-mfd for-mfd-next
        git checkout lee-mfd/for-mfd-next
        b4 shazam https://lore.kernel.org/r/20230610025759.1813-1-demi@invisiblethingslab.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/md/bcache/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306101334.lDZERsKo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/md/bcache/util.c:82:1: error: call to undeclared function 'simple_strtoll'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
   STRTO_H(strtoll, long long)
   ^
   drivers/md/bcache/util.c:28:11: note: expanded from macro 'STRTO_H'
           type i = simple_ ## name(cp, &e, 10);                   \
                    ^
   <scratch space>:22:1: note: expanded from here
   simple_strtoll
   ^
   1 error generated.


vim +/simple_strtoll +82 drivers/md/bcache/util.c

cafe563591446c Kent Overstreet 2013-03-23  79  
cafe563591446c Kent Overstreet 2013-03-23  80  STRTO_H(strtoint, int)
cafe563591446c Kent Overstreet 2013-03-23  81  STRTO_H(strtouint, unsigned int)
cafe563591446c Kent Overstreet 2013-03-23 @82  STRTO_H(strtoll, long long)
cafe563591446c Kent Overstreet 2013-03-23  83  STRTO_H(strtoull, unsigned long long)
cafe563591446c Kent Overstreet 2013-03-23  84  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

