Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D122A72AE71
	for <lists+xen-devel@lfdr.de>; Sat, 10 Jun 2023 21:40:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546596.853581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q84Qw-0000pZ-Fr; Sat, 10 Jun 2023 19:39:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546596.853581; Sat, 10 Jun 2023 19:39:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q84Qw-0000ml-Ce; Sat, 10 Jun 2023 19:39:34 +0000
Received: by outflank-mailman (input) for mailman id 546596;
 Sat, 10 Jun 2023 19:39:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4fTJ=B6=intel.com=lkp@srs-se1.protection.inumbo.net>)
 id 1q84Qt-0000mf-PT
 for xen-devel@lists.xenproject.org; Sat, 10 Jun 2023 19:39:32 +0000
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8112db17-07c6-11ee-8611-37d641c3527e;
 Sat, 10 Jun 2023 21:39:26 +0200 (CEST)
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2023 12:39:23 -0700
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 10 Jun 2023 12:39:18 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1q84Qg-000AO6-09;
 Sat, 10 Jun 2023 19:39:18 +0000
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
X-Inumbo-ID: 8112db17-07c6-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686425966; x=1717961966;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ufJG5h/aowefg1btQn3CbK4pVsN3453BNzPIbovB+38=;
  b=htJcG0/94PnbSnVGyWMbILXCgLha13z+n/eI/YlVjvVTGgbUlpHzBM3I
   MUrvZUSN+g5WlPtAy+lZU/dGSQoy8FQd+iTydu/MB0m+yhlgKusD9Yzm/
   4DKGqiq2lmO8XAmrKeQYITpCP7qFtCxb2HnHkfFtsJ9Po31WVW43uTtWF
   3eQoMu+pVMRyaywPW4ex8OmsbDQ60GB0bpeQ/CISWl1neWGWWPRBcJbWT
   FAk/ieB4VKRDGQRSZfEn0NMkhZi9dp9IQaUXuK1/hWi+68MbTNlLgY1Tt
   Igt8R1D92v+scp+GjqxRpLnMMYIiI3EP7jAR/7HWDTsVzbMN4/OxnUElA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="361163536"
X-IronPort-AV: E=Sophos;i="6.00,233,1681196400"; 
   d="scan'208";a="361163536"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="713885680"
X-IronPort-AV: E=Sophos;i="6.00,233,1681196400"; 
   d="scan'208";a="713885680"
Date: Sun, 11 Jun 2023 03:38:43 +0800
From: kernel test robot <lkp@intel.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Demi Marie Obenour <demi@invisiblethingslab.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/3] vsscanf(): Integer overflow is a conversion
 failure
Message-ID: <202306110319.q5StyX6B-lkp@intel.com>
References: <20230610170743.2510-2-demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230610170743.2510-2-demi@invisiblethingslab.com>

Hi Demi,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on lee-mfd/for-mfd-next xen-tip/linux-next linus/master lee-mfd/for-mfd-fixes v6.4-rc5 next-20230609]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Demi-Marie-Obenour/vsscanf-Integer-overflow-is-a-conversion-failure/20230611-010926
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230610170743.2510-2-demi%40invisiblethingslab.com
patch subject: [PATCH v2 1/3] vsscanf(): Integer overflow is a conversion failure
config: arc-randconfig-r033-20230611 (https://download.01.org/0day-ci/archive/20230611/202306110319.q5StyX6B-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add media-tree git://linuxtv.org/media_tree.git
        git fetch media-tree master
        git checkout media-tree/master
        b4 shazam https://lore.kernel.org/r/20230610170743.2510-2-demi@invisiblethingslab.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306110319.q5StyX6B-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/vsprintf.c: In function 'simple_strtoll':
>> lib/vsprintf.c:163:16: error: too few arguments to function 'simple_strntoll'
     163 |         return simple_strntoll(cp, INT_MAX, endp, base);
         |                ^~~~~~~~~~~~~~~
   lib/vsprintf.c:134:18: note: declared here
     134 | static long long simple_strntoll(const char *cp, size_t max_chars, char **endp,
         |                  ^~~~~~~~~~~~~~~
   lib/vsprintf.c: In function 'va_format':
   lib/vsprintf.c:1687:9: warning: function 'va_format' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1687 |         buf += vsnprintf(buf, end > buf ? end - buf : 0, va_fmt->fmt, va);
         |         ^~~
   lib/vsprintf.c: In function 'simple_strtoll':
   lib/vsprintf.c:164:1: error: control reaches end of non-void function [-Werror=return-type]
     164 | }
         | ^
   cc1: some warnings being treated as errors


vim +/simple_strntoll +163 lib/vsprintf.c

900fdc4573766d Richard Fitzgerald 2021-05-14  152  
^1da177e4c3f41 Linus Torvalds     2005-04-16  153  /**
^1da177e4c3f41 Linus Torvalds     2005-04-16  154   * simple_strtoll - convert a string to a signed long long
^1da177e4c3f41 Linus Torvalds     2005-04-16  155   * @cp: The start of the string
^1da177e4c3f41 Linus Torvalds     2005-04-16  156   * @endp: A pointer to the end of the parsed string will be placed here
^1da177e4c3f41 Linus Torvalds     2005-04-16  157   * @base: The number base to use
462e471107624f Eldad Zack         2012-12-17  158   *
e8cc2b97ca5aa1 Andy Shevchenko    2020-02-21  159   * This function has caveats. Please use kstrtoll instead.
^1da177e4c3f41 Linus Torvalds     2005-04-16  160   */
^1da177e4c3f41 Linus Torvalds     2005-04-16  161  long long simple_strtoll(const char *cp, char **endp, unsigned int base)
^1da177e4c3f41 Linus Torvalds     2005-04-16  162  {
900fdc4573766d Richard Fitzgerald 2021-05-14 @163  	return simple_strntoll(cp, INT_MAX, endp, base);
^1da177e4c3f41 Linus Torvalds     2005-04-16  164  }
98d5ce0d004466 Hans Verkuil       2010-04-23  165  EXPORT_SYMBOL(simple_strtoll);
^1da177e4c3f41 Linus Torvalds     2005-04-16  166  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

