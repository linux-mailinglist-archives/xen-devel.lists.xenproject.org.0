Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEhDKNJa52l87AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 13:09:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A42E439EDB
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 13:09:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288900.1569140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF8yM-0000tH-R2; Tue, 21 Apr 2026 11:08:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288900.1569140; Tue, 21 Apr 2026 11:08:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF8yM-0000ro-NQ; Tue, 21 Apr 2026 11:08:54 +0000
Received: by outflank-mailman (input) for mailman id 1288900;
 Tue, 21 Apr 2026 11:08:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <lkp@intel.com>) id 1wF8yK-0000rg-WA
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 11:08:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF8yI-00BWGn-78
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 13:08:52 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <lkp@intel.com>)
 id 69e75ab6-5cb7-0a2a0a5109dd-0a2a4508819e-32
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 13:08:50 +0200
Received: from [192.198.163.8] (helo=mgamail.intel.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <lkp@intel.com>)
 id 69e75ac0-63b5-0a2a45080019-c0c6a308a67c-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 13:08:50 +0200
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 04:08:47 -0700
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 21 Apr 2026 04:08:46 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wF8yB-000000003Qa-3dGO;
 Tue, 21 Apr 2026 11:08:43 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=Intel header.d=intel.com header.i="@intel.com" header.h="Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776769729; x=1808305729;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OeDNHRU79WaG0ZKrqxuZJYzFNK66hcB5aJigefNW67s=;
  b=c/qrtmhZfh9R/ls2F6Zxb/JIsutBUJzFnqz38XNDCoopkaIxak21qTBR
   8VSKfRYYNsovpKyr4oEYP+mKwUn+HrpqlcoSGozq9/unAwgh9mJHBjCxb
   FnwXQV89wuV6KYa13eajG9mtcqe1h4o2nrZZnb3Z63OtVDsJ0N4boTwi0
   EH7iByg4a4E37jpGKn6JcrCxK/7b9cUwYVp5Y/hhz61iNC20kktSKuDZD
   oXsh3uMKQMuRlBvjKVUoljdeK4bsqEP3Y81CcxDtYupwbo54f1wupQWpQ
   9foAIYScgD0SnKV8f6hJ1Eb+y2Qo+aG9UzGyRQ8rP8i7FUlqIsRGgTylE
   A==;
X-CSE-ConnectionGUID: nC9Y4b84R4at0C3monpQpQ==
X-CSE-MsgGUID: 5tWbveVwS3CV+041hxC5yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="95257951"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="95257951"
X-CSE-ConnectionGUID: gUCRgVilQF+/8zgWNJVDBw==
X-CSE-MsgGUID: h5r2wrwxT16rd+Nk+oK+MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="255473858"
Date: Tue, 21 Apr 2026 19:08:06 +0800
From: kernel test robot <lkp@intel.com>
To: zhaoguohan@kylinos.cn, jgross@suse.com, sstabellini@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, oleksandr_tyshchenko@epam.com,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	GuoHan Zhao <zhaoguohan@kylinos.cn>
Subject: Re: [PATCH] xen/manage: unwind partial shutdown watcher setup on
 error
Message-ID: <202604211801.rqptlYaS-lkp@intel.com>
References: <20260407022443.12971-1-zhaoguohan@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407022443.12971-1-zhaoguohan@kylinos.cn>
X-purgate-ID: tlsNG-c1860d/1776769730-C2169DB1-E575909F/0/0
X-purgate-type: clean
X-purgate-size: 3615
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,git-scm.com:url];
	FORGED_SENDER(0.00)[lkp@intel.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zhaoguohan@kylinos.cn,m:jgross@suse.com,m:sstabellini@kernel.org,m:oe-kbuild-all@lists.linux.dev,m:oleksandr_tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 0A42E439EDB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v7.0]
[cannot apply to xen-tip/linux-next linus/master next-20260420]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/zhaoguohan-kylinos-cn/xen-manage-unwind-partial-shutdown-watcher-setup-on-error/20260416-185003
base:   v7.0
patch link:    https://lore.kernel.org/r/20260407022443.12971-1-zhaoguohan%40kylinos.cn
patch subject: [PATCH] xen/manage: unwind partial shutdown watcher setup on error
config: arm64-randconfig-002-20260421 (https://download.01.org/0day-ci/archive/20260421/202604211801.rqptlYaS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260421/202604211801.rqptlYaS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604211801.rqptlYaS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/xen/manage.c: In function 'setup_shutdown_watcher':
>> drivers/xen/manage.c:380:1: warning: label 'err_unregister_shutdown' defined but not used [-Wunused-label]
     380 | err_unregister_shutdown:
         | ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/xen/manage.c: In function 'shutdown_event':
   drivers/xen/manage.c:357:60: warning: '%s' directive output may be truncated writing up to 71 bytes into a region of size 12 [-Wformat-truncation=]
     357 |                 snprintf(node, FEATURE_PATH_SIZE, "feature-%s",
         |                                                            ^~
   In function 'setup_shutdown_watcher',
       inlined from 'shutdown_event' at drivers/xen/manage.c:389:2:
   drivers/xen/manage.c:357:17: note: 'snprintf' output between 9 and 80 bytes into a destination of size 20
     357 |                 snprintf(node, FEATURE_PATH_SIZE, "feature-%s",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     358 |                          shutdown_handlers[idx].command);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/err_unregister_shutdown +380 drivers/xen/manage.c

   353	
   354		for (idx = 0; idx < ARRAY_SIZE(shutdown_handlers); idx++) {
   355			if (!shutdown_handlers[idx].flag)
   356				continue;
   357			snprintf(node, FEATURE_PATH_SIZE, "feature-%s",
   358				 shutdown_handlers[idx].command);
   359			err = xenbus_printf(XBT_NIL, "control", node, "%u", 1);
   360			if (err) {
   361				pr_err("%s: Error %d writing %s\n", __func__,
   362					err, node);
   363				goto err_remove_features;
   364			}
   365		}
   366	
   367		return 0;
   368	
   369	err_remove_features:
   370		while (--idx >= 0) {
   371			if (!shutdown_handlers[idx].flag)
   372				continue;
   373			snprintf(node, FEATURE_PATH_SIZE, "feature-%s",
   374				 shutdown_handlers[idx].command);
   375			xenbus_rm(XBT_NIL, "control", node);
   376		}
   377	#ifdef CONFIG_MAGIC_SYSRQ
   378		unregister_xenbus_watch(&sysrq_watch);
   379	#endif
 > 380	err_unregister_shutdown:
   381		unregister_xenbus_watch(&shutdown_watch);
   382		return err;
   383	}
   384	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

