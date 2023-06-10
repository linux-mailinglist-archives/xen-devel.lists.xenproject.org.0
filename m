Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4287C72A936
	for <lists+xen-devel@lfdr.de>; Sat, 10 Jun 2023 07:43:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546386.853199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7rMt-0005P3-8F; Sat, 10 Jun 2023 05:42:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546386.853199; Sat, 10 Jun 2023 05:42:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7rMt-0005NB-4A; Sat, 10 Jun 2023 05:42:31 +0000
Received: by outflank-mailman (input) for mailman id 546386;
 Sat, 10 Jun 2023 05:42:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4fTJ=B6=intel.com=lkp@srs-se1.protection.inumbo.net>)
 id 1q7rMq-0005My-W3
 for xen-devel@lists.xenproject.org; Sat, 10 Jun 2023 05:42:29 +0000
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 932dd173-0751-11ee-b232-6b7b168915f2;
 Sat, 10 Jun 2023 07:42:26 +0200 (CEST)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 22:42:22 -0700
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 09 Jun 2023 22:42:17 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1q7rMe-0009me-1a;
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
X-Inumbo-ID: 932dd173-0751-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686375746; x=1717911746;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sQgAiqE4AY4AY0vEW9l4MzGZIdDuFn9T2C9jO4o6QXM=;
  b=mgNv1o7OXwwJjSoNW//17n+aC3mXB8n/q7GGXB2Buxe2IY92bmxwHINu
   NPgaIUX9W6xuor8euAAAjpvDAhI9u+g4o1cCjbvuK3CIEhxCa4AQBM6v6
   5iXqgUXag9tPJgqCcBhMJQoqkWhP0WusZefcep90juK1LxqaOcSomCPKe
   C2cNnO4pWe8ExXgOR66Dp+C+sU3Haj8uXxUI0oKZq8OHtoDBhYUaNuaHb
   6EjNm07EKZebcwBQc59/8wzcrICJl2C2qYS9YpKWKPDJFuknaqFm9inob
   3/GAyHSoPzNXSThG4LQxQ/npiuXvc4mohRMCfPqaYZ0untc0PdEluPI3+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="342412479"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; 
   d="scan'208";a="342412479"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="884812674"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; 
   d="scan'208";a="884812674"
Date: Sat, 10 Jun 2023 13:42:10 +0800
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
Subject: Re: [PATCH 1/4] Rip out simple_strtoll()
Message-ID: <202306101317.YiBrl6OZ-lkp@intel.com>
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
config: csky-randconfig-r011-20230610 (https://download.01.org/0day-ci/archive/20230610/202306101317.YiBrl6OZ-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add lee-mfd https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git
        git fetch lee-mfd for-mfd-next
        git checkout lee-mfd/for-mfd-next
        b4 shazam https://lore.kernel.org/r/20230610025759.1813-1-demi@invisiblethingslab.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash drivers/md/bcache/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306101317.YiBrl6OZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/md/bcache/util.c: In function 'bch_strtoll_h':
>> drivers/md/bcache/util.c:28:18: error: implicit declaration of function 'simple_strtoll'; did you mean 'simple_strtoull'? [-Werror=implicit-function-declaration]
      28 |         type i = simple_ ## name(cp, &e, 10);                   \
         |                  ^~~~~~~
   drivers/md/bcache/util.c:82:1: note: in expansion of macro 'STRTO_H'
      82 | STRTO_H(strtoll, long long)
         | ^~~~~~~
   cc1: some warnings being treated as errors


vim +28 drivers/md/bcache/util.c

cafe563591446c Kent Overstreet     2013-03-23  22  
cafe563591446c Kent Overstreet     2013-03-23  23  #define STRTO_H(name, type)					\
169ef1cf6171d3 Kent Overstreet     2013-03-28  24  int bch_ ## name ## _h(const char *cp, type *res)		\
cafe563591446c Kent Overstreet     2013-03-23  25  {								\
cafe563591446c Kent Overstreet     2013-03-23  26  	int u = 0;						\
cafe563591446c Kent Overstreet     2013-03-23  27  	char *e;						\
cafe563591446c Kent Overstreet     2013-03-23 @28  	type i = simple_ ## name(cp, &e, 10);			\
cafe563591446c Kent Overstreet     2013-03-23  29  								\
cafe563591446c Kent Overstreet     2013-03-23  30  	switch (tolower(*e)) {					\
cafe563591446c Kent Overstreet     2013-03-23  31  	default:						\
cafe563591446c Kent Overstreet     2013-03-23  32  		return -EINVAL;					\
cafe563591446c Kent Overstreet     2013-03-23  33  	case 'y':						\
cafe563591446c Kent Overstreet     2013-03-23  34  	case 'z':						\
cafe563591446c Kent Overstreet     2013-03-23  35  		u++;						\
df561f6688fef7 Gustavo A. R. Silva 2020-08-23  36  		fallthrough;					\
cafe563591446c Kent Overstreet     2013-03-23  37  	case 'e':						\
cafe563591446c Kent Overstreet     2013-03-23  38  		u++;						\
df561f6688fef7 Gustavo A. R. Silva 2020-08-23  39  		fallthrough;					\
cafe563591446c Kent Overstreet     2013-03-23  40  	case 'p':						\
cafe563591446c Kent Overstreet     2013-03-23  41  		u++;						\
df561f6688fef7 Gustavo A. R. Silva 2020-08-23  42  		fallthrough;					\
cafe563591446c Kent Overstreet     2013-03-23  43  	case 't':						\
cafe563591446c Kent Overstreet     2013-03-23  44  		u++;						\
df561f6688fef7 Gustavo A. R. Silva 2020-08-23  45  		fallthrough;					\
cafe563591446c Kent Overstreet     2013-03-23  46  	case 'g':						\
cafe563591446c Kent Overstreet     2013-03-23  47  		u++;						\
df561f6688fef7 Gustavo A. R. Silva 2020-08-23  48  		fallthrough;					\
cafe563591446c Kent Overstreet     2013-03-23  49  	case 'm':						\
cafe563591446c Kent Overstreet     2013-03-23  50  		u++;						\
df561f6688fef7 Gustavo A. R. Silva 2020-08-23  51  		fallthrough;					\
cafe563591446c Kent Overstreet     2013-03-23  52  	case 'k':						\
cafe563591446c Kent Overstreet     2013-03-23  53  		u++;						\
cafe563591446c Kent Overstreet     2013-03-23  54  		if (e++ == cp)					\
cafe563591446c Kent Overstreet     2013-03-23  55  			return -EINVAL;				\
df561f6688fef7 Gustavo A. R. Silva 2020-08-23  56  		fallthrough;					\
cafe563591446c Kent Overstreet     2013-03-23  57  	case '\n':						\
cafe563591446c Kent Overstreet     2013-03-23  58  	case '\0':						\
cafe563591446c Kent Overstreet     2013-03-23  59  		if (*e == '\n')					\
cafe563591446c Kent Overstreet     2013-03-23  60  			e++;					\
cafe563591446c Kent Overstreet     2013-03-23  61  	}							\
cafe563591446c Kent Overstreet     2013-03-23  62  								\
cafe563591446c Kent Overstreet     2013-03-23  63  	if (*e)							\
cafe563591446c Kent Overstreet     2013-03-23  64  		return -EINVAL;					\
cafe563591446c Kent Overstreet     2013-03-23  65  								\
cafe563591446c Kent Overstreet     2013-03-23  66  	while (u--) {						\
cafe563591446c Kent Overstreet     2013-03-23  67  		if ((type) ~0 > 0 &&				\
cafe563591446c Kent Overstreet     2013-03-23  68  		    (type) ~0 / 1024 <= i)			\
cafe563591446c Kent Overstreet     2013-03-23  69  			return -EINVAL;				\
cafe563591446c Kent Overstreet     2013-03-23  70  		if ((i > 0 && ANYSINT_MAX(type) / 1024 < i) ||	\
cafe563591446c Kent Overstreet     2013-03-23  71  		    (i < 0 && -ANYSINT_MAX(type) / 1024 > i))	\
cafe563591446c Kent Overstreet     2013-03-23  72  			return -EINVAL;				\
cafe563591446c Kent Overstreet     2013-03-23  73  		i *= 1024;					\
cafe563591446c Kent Overstreet     2013-03-23  74  	}							\
cafe563591446c Kent Overstreet     2013-03-23  75  								\
cafe563591446c Kent Overstreet     2013-03-23  76  	*res = i;						\
cafe563591446c Kent Overstreet     2013-03-23  77  	return 0;						\
cafe563591446c Kent Overstreet     2013-03-23  78  }								\
cafe563591446c Kent Overstreet     2013-03-23  79  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

