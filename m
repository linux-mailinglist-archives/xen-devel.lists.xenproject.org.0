Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE8075DFE9
	for <lists+xen-devel@lfdr.de>; Sun, 23 Jul 2023 06:51:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568132.887547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNR38-0002c1-I2; Sun, 23 Jul 2023 04:50:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568132.887547; Sun, 23 Jul 2023 04:50:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNR38-0002Zg-F3; Sun, 23 Jul 2023 04:50:30 +0000
Received: by outflank-mailman (input) for mailman id 568132;
 Sun, 23 Jul 2023 04:50:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dWw5=DJ=intel.com=lkp@srs-se1.protection.inumbo.net>)
 id 1qNR36-0002Za-Fd
 for xen-devel@lists.xenproject.org; Sun, 23 Jul 2023 04:50:28 +0000
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e73c862-2914-11ee-8611-37d641c3527e;
 Sun, 23 Jul 2023 06:50:24 +0200 (CEST)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2023 21:50:21 -0700
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 22 Jul 2023 21:50:18 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qNR2v-0008qL-0x;
 Sun, 23 Jul 2023 04:50:17 +0000
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
X-Inumbo-ID: 6e73c862-2914-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690087824; x=1721623824;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/xZW808BrUCeT5DlyP4BVVq4u1ojxXBhWS/KYqOFDsA=;
  b=ISiTbxsKbyR5p8uguNcjrrUoPfxX/89qJJgFXk+Tw/uoRZPACEG0qn+r
   wtzb32bTePlyE6/34cO1GUDoLyk/ET4Rdd5SUUgiBOGwk8rIXvN/1uFiD
   Gm02/CiE0d1LfqBSxz06o4IY1Bb9H6I0bs3XvJCp3Yzqz0RWsbStfKG3H
   xHTU0qqiuAnlA4kt1BCgxID/t4EJ2j0ynkuVS6kKKcMeI7fLMaxJXEvja
   yNDK79telNfZx/z+E78jPMWmbM6FPhbQibI4NVpzWqHbDsGY8nPwckZAK
   B9lYftGbCawITZboBn+V6aWmQTQ/YSHXJ4Ehxc66Ae4jXHfDDIk+H+k/M
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="370850804"
X-IronPort-AV: E=Sophos;i="6.01,226,1684825200"; 
   d="scan'208";a="370850804"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="899131358"
X-IronPort-AV: E=Sophos;i="6.01,226,1684825200"; 
   d="scan'208";a="899131358"
Date: Sun, 23 Jul 2023 12:49:18 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: oe-kbuild-all@lists.linux.dev, Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Erik Schilling <erik.schilling@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 2/2] xen: privcmd: Add support for irqfd
Message-ID: <202307231237.JHGxqmdg-lkp@intel.com>
References: <a25d5f01fe9b4624aa12cab77abd001044ea02d5.1689845210.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a25d5f01fe9b4624aa12cab77abd001044ea02d5.1689845210.git.viresh.kumar@linaro.org>

Hi Viresh,

kernel test robot noticed the following build errors:

[auto build test ERROR on xen-tip/linux-next]
[also build test ERROR on linus/master v6.5-rc2 next-20230721]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Viresh-Kumar/xen-privcmd-Add-support-for-irqfd/20230720-173905
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git linux-next
patch link:    https://lore.kernel.org/r/a25d5f01fe9b4624aa12cab77abd001044ea02d5.1689845210.git.viresh.kumar%40linaro.org
patch subject: [PATCH V2 2/2] xen: privcmd: Add support for irqfd
config: x86_64-randconfig-r091-20230723 (https://download.01.org/0day-ci/archive/20230723/202307231237.JHGxqmdg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230723/202307231237.JHGxqmdg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307231237.JHGxqmdg-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/xen/privcmd.c: In function 'privcmd_irqfd_assign':
>> drivers/xen/privcmd.c:961:19: error: implicit declaration of function 'eventfd_ctx_fileget'; did you mean 'eventfd_ctx_fdget'? [-Werror=implicit-function-declaration]
     961 |         eventfd = eventfd_ctx_fileget(f.file);
         |                   ^~~~~~~~~~~~~~~~~~~
         |                   eventfd_ctx_fdget
>> drivers/xen/privcmd.c:961:17: warning: assignment to 'struct eventfd_ctx *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     961 |         eventfd = eventfd_ctx_fileget(f.file);
         |                 ^
   cc1: some warnings being treated as errors


vim +961 drivers/xen/privcmd.c

   936	
   937	static int privcmd_irqfd_assign(struct privcmd_irqfd *irqfd)
   938	{
   939		struct privcmd_kernel_irqfd *kirqfd, *tmp;
   940		struct eventfd_ctx *eventfd;
   941		__poll_t events;
   942		struct fd f;
   943		int ret;
   944	
   945		kirqfd = kzalloc(sizeof(*kirqfd), GFP_KERNEL);
   946		if (!kirqfd)
   947			return -ENOMEM;
   948	
   949		kirqfd->irq = irqfd->irq;
   950		kirqfd->dom = irqfd->dom;
   951		kirqfd->level = irqfd->level;
   952		INIT_LIST_HEAD(&kirqfd->list);
   953		INIT_WORK(&kirqfd->shutdown, irqfd_shutdown);
   954	
   955		f = fdget(irqfd->fd);
   956		if (!f.file) {
   957			ret = -EBADF;
   958			goto error_kfree;
   959		}
   960	
 > 961		eventfd = eventfd_ctx_fileget(f.file);
   962		if (IS_ERR(eventfd)) {
   963			ret = PTR_ERR(eventfd);
   964			goto error_fd_put;
   965		}
   966	
   967		kirqfd->eventfd = eventfd;
   968	
   969		/*
   970		 * Install our own custom wake-up handling so we are notified via a
   971		 * callback whenever someone signals the underlying eventfd.
   972		 */
   973		init_waitqueue_func_entry(&kirqfd->wait, irqfd_wakeup);
   974		init_poll_funcptr(&kirqfd->pt, irqfd_poll_func);
   975	
   976		mutex_lock(&irqfds_lock);
   977	
   978		list_for_each_entry(tmp, &irqfds_list, list) {
   979			if (kirqfd->eventfd == tmp->eventfd) {
   980				ret = -EBUSY;
   981				mutex_unlock(&irqfds_lock);
   982				goto error_eventfd;
   983			}
   984		}
   985	
   986		list_add_tail(&kirqfd->list, &irqfds_list);
   987		mutex_unlock(&irqfds_lock);
   988	
   989		/*
   990		 * Check if there was an event already pending on the eventfd before we
   991		 * registered, and trigger it as if we didn't miss it.
   992		 */
   993		events = vfs_poll(f.file, &kirqfd->pt);
   994		if (events & EPOLLIN)
   995			irqfd_inject(kirqfd);
   996	
   997		/*
   998		 * Do not drop the file until the kirqfd is fully initialized, otherwise
   999		 * we might race against the EPOLLHUP.
  1000		 */
  1001		fdput(f);
  1002		return 0;
  1003	
  1004	error_eventfd:
  1005		eventfd_ctx_put(eventfd);
  1006	
  1007	error_fd_put:
  1008		fdput(f);
  1009	
  1010	error_kfree:
  1011		kfree(kirqfd);
  1012		return ret;
  1013	}
  1014	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

