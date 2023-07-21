Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3EF75BB97
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 02:41:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566816.886178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMeC4-0003o0-46; Fri, 21 Jul 2023 00:40:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566816.886178; Fri, 21 Jul 2023 00:40:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMeC4-0003lY-1R; Fri, 21 Jul 2023 00:40:28 +0000
Received: by outflank-mailman (input) for mailman id 566816;
 Fri, 21 Jul 2023 00:40:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nBvy=DH=intel.com=lkp@srs-se1.protection.inumbo.net>)
 id 1qMeC2-0003lR-QP
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 00:40:27 +0000
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b55a776-275f-11ee-8611-37d641c3527e;
 Fri, 21 Jul 2023 02:40:21 +0200 (CEST)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 17:40:17 -0700
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
 by fmsmga001.fm.intel.com with ESMTP; 20 Jul 2023 17:40:16 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qMeBq-0006gL-2i;
 Fri, 21 Jul 2023 00:40:14 +0000
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
X-Inumbo-ID: 2b55a776-275f-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689900020; x=1721436020;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CI0o0+Z4qXXHWD154B+rJnNKHysZxCwTxv7+kXT0cow=;
  b=W2yrvArsLo1Z9emOU5xWql5Z1JgWeCNOkf1t2VCO88LmZxiiewfCEKpU
   8zWV0OjcOnCq0Qa+jTO1KxcXuNVBPGWRRKITC5+eGh6/hZn0dlB0pEV2S
   Q6yUmxKLvg1b2PxQpPvmNYhFY7Yisv+Bx00BrDTHrj8g7PGuxoGXZSKly
   LI/tt7tsKkW3LmR4s4kS39ZtWaBHYDImqjrxiSNe8Y3b73raT1LF3XrP4
   9ApxwdJfV8JGne3UQLVvUp0J7DPuFeTrKQ8+XeLkgR0sMSID4BiY2kADI
   gFoDj4gvYedpiNa/ugA5a+sX6JudHc+00dYyd7k/nQBZ1W56Gw8rG2YbG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="433126717"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="433126717"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="868048756"
Date: Fri, 21 Jul 2023 08:38:40 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Erik Schilling <erik.schilling@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 2/2] xen: privcmd: Add support for irqfd
Message-ID: <202307210852.ukq5f98v-lkp@intel.com>
References: <a25d5f01fe9b4624aa12cab77abd001044ea02d5.1689845210.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a25d5f01fe9b4624aa12cab77abd001044ea02d5.1689845210.git.viresh.kumar@linaro.org>

Hi Viresh,

kernel test robot noticed the following build errors:

[auto build test ERROR on xen-tip/linux-next]
[also build test ERROR on linus/master v6.5-rc2 next-20230720]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Viresh-Kumar/xen-privcmd-Add-support-for-irqfd/20230720-173905
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git linux-next
patch link:    https://lore.kernel.org/r/a25d5f01fe9b4624aa12cab77abd001044ea02d5.1689845210.git.viresh.kumar%40linaro.org
patch subject: [PATCH V2 2/2] xen: privcmd: Add support for irqfd
config: arm64-randconfig-r026-20230720 (https://download.01.org/0day-ci/archive/20230721/202307210852.ukq5f98v-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307210852.ukq5f98v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307210852.ukq5f98v-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/xen/privcmd.c:961:12: error: call to undeclared function 'eventfd_ctx_fileget'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     961 |         eventfd = eventfd_ctx_fileget(f.file);
         |                   ^
   drivers/xen/privcmd.c:961:12: note: did you mean 'eventfd_ctx_fdget'?
   include/linux/eventfd.h:56:35: note: 'eventfd_ctx_fdget' declared here
      56 | static inline struct eventfd_ctx *eventfd_ctx_fdget(int fd)
         |                                   ^
>> drivers/xen/privcmd.c:961:10: error: incompatible integer to pointer conversion assigning to 'struct eventfd_ctx *' from 'int' [-Wint-conversion]
     961 |         eventfd = eventfd_ctx_fileget(f.file);
         |                 ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/eventfd_ctx_fileget +961 drivers/xen/privcmd.c

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

