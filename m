Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0734F7515
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 07:11:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300358.512262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncKPZ-0007ho-CQ; Thu, 07 Apr 2022 05:10:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300358.512262; Thu, 07 Apr 2022 05:10:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncKPZ-0007ep-9G; Thu, 07 Apr 2022 05:10:25 +0000
Received: by outflank-mailman (input) for mailman id 300358;
 Thu, 07 Apr 2022 05:10:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ZzD=UR=intel.com=lkp@srs-se1.protection.inumbo.net>)
 id 1ncKPX-0007ej-KW
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 05:10:24 +0000
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 036be10f-b631-11ec-8fbc-03012f2f19d4;
 Thu, 07 Apr 2022 07:10:19 +0200 (CEST)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 22:10:16 -0700
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 06 Apr 2022 22:10:13 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1ncKPM-00055m-NU;
 Thu, 07 Apr 2022 05:10:12 +0000
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
X-Inumbo-ID: 036be10f-b631-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649308219; x=1680844219;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=myTDEhVwrLnCdPZFU3d6dVMJ7GMZKVQMpzunGAxXFgE=;
  b=jRbUmBThTYZsz0PAaq+NtUw8p3RyHnTwuasJLkoHaxMkF8Z0K5pH9Df1
   QBbMqkBzCTMe+nMlMxtS7Q2IAxYYbX3wfi8e/eOvdQe3Fy11HtsCs+j2x
   Vv+yL/FK6HlO64vb+/uJ3BR7w2V0gLhoKXKR3ZKSg72ZKVFRDKgTMc6KQ
   jn2HkGL4EULOqjUhIk+lRr+1VjO5xE1qsADrNmrRt3DUQjRdS7GxNu5OC
   2I/6RRe9oj3Dpej9NdguWZnsk6J8/wy1MA3NmD0Ui/XOs0V7AVa5WePMs
   33MjhoEZiN8m0JeQHmxM4yO1eKhLmBOppICWUBUhT9vdOQAmtahQ//Fw8
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="347671270"
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; 
   d="scan'208";a="347671270"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; 
   d="scan'208";a="506008518"
Date: Thu, 7 Apr 2022 13:09:27 +0800
From: kernel test robot <lkp@intel.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: kbuild-all@lists.01.org, Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>, stable@vger.kernel.org,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] xen/balloon: fix page onlining when populating new zone
Message-ID: <202204071359.uas4tsu0-lkp@intel.com>
References: <20220406133229.15979-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220406133229.15979-1-jgross@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Juergen,

I love your patch! Yet something to improve:

[auto build test ERROR on xen-tip/linux-next]
[also build test ERROR on linus/master linux/master v5.18-rc1 next-20220406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Juergen-Gross/xen-balloon-fix-page-onlining-when-populating-new-zone/20220407-000935
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git linux-next
config: arm64-randconfig-r011-20220406 (https://download.01.org/0day-ci/archive/20220407/202204071359.uas4tsu0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/b3deb59d5386ade4fb227038f202a9bdb8ade4ab
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Juergen-Gross/xen-balloon-fix-page-onlining-when-populating-new-zone/20220407-000935
        git checkout b3deb59d5386ade4fb227038f202a9bdb8ade4ab
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/xen/balloon.c: In function 'decrease_reservation':
>> drivers/xen/balloon.c:518:24: error: implicit declaration of function 'alloc_page_for_balloon' [-Werror=implicit-function-declaration]
     518 |                 page = alloc_page_for_balloon(gfp);
         |                        ^~~~~~~~~~~~~~~~~~~~~~
   drivers/xen/balloon.c:518:22: warning: assignment to 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     518 |                 page = alloc_page_for_balloon(gfp);
         |                      ^
>> drivers/xen/balloon.c:545:17: error: implicit declaration of function 'add_page_to_balloon' [-Werror=implicit-function-declaration]
     545 |                 add_page_to_balloon(page);
         |                 ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/alloc_page_for_balloon +518 drivers/xen/balloon.c

   505	
   506	static enum bp_state decrease_reservation(unsigned long nr_pages, gfp_t gfp)
   507	{
   508		enum bp_state state = BP_DONE;
   509		unsigned long i;
   510		struct page *page, *tmp;
   511		int ret;
   512		LIST_HEAD(pages);
   513	
   514		if (nr_pages > ARRAY_SIZE(frame_list))
   515			nr_pages = ARRAY_SIZE(frame_list);
   516	
   517		for (i = 0; i < nr_pages; i++) {
 > 518			page = alloc_page_for_balloon(gfp);
   519			if (page == NULL) {
   520				nr_pages = i;
   521				state = BP_EAGAIN;
   522				break;
   523			}
   524			list_add(&page->lru, &pages);
   525		}
   526	
   527		/*
   528		 * Ensure that ballooned highmem pages don't have kmaps.
   529		 *
   530		 * Do this before changing the p2m as kmap_flush_unused()
   531		 * reads PTEs to obtain pages (and hence needs the original
   532		 * p2m entry).
   533		 */
   534		kmap_flush_unused();
   535	
   536		/*
   537		 * Setup the frame, update direct mapping, invalidate P2M,
   538		 * and add to balloon.
   539		 */
   540		i = 0;
   541		list_for_each_entry_safe(page, tmp, &pages, lru) {
   542			frame_list[i++] = xen_page_to_gfn(page);
   543	
   544			list_del(&page->lru);
 > 545			add_page_to_balloon(page);
   546		}
   547	
   548		flush_tlb_all();
   549	
   550		ret = xenmem_reservation_decrease(nr_pages, frame_list);
   551		BUG_ON(ret != nr_pages);
   552	
   553		balloon_stats.current_pages -= nr_pages;
   554	
   555		return state;
   556	}
   557	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

