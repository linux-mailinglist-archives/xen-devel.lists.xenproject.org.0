Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPl3BtMnBWq3SwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 03:39:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C020C53CC57
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 03:39:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308588.1579992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNL2c-0003xg-5U; Thu, 14 May 2026 01:39:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308588.1579992; Thu, 14 May 2026 01:39:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNL2c-0003uk-2I; Thu, 14 May 2026 01:39:10 +0000
Received: by outflank-mailman (input) for mailman id 1308588;
 Thu, 14 May 2026 01:39:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <lkp@intel.com>) id 1wNL2a-0003ue-Jw
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 01:39:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNL2Z-004Ng9-Fp
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 03:39:08 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <lkp@intel.com>)
 id 6a05279f-5cb7-0a2a0a5109dd-0a2a4509e02a-10
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 03:39:06 +0200
Received: from [192.198.163.17] (helo=mgamail.intel.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <lkp@intel.com>)
 id 6a0527b7-2497-0a2a45090019-c0c6a3117e4e-3
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 03:39:05 +0200
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 18:39:03 -0700
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
 by orviesa005.jf.intel.com with ESMTP; 13 May 2026 18:39:01 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wNL2Q-000000005Xv-1qVY;
 Thu, 14 May 2026 01:38:58 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=Intel header.d=intel.com header.i="@intel.com" header.h="Date:From:To:Cc:Subject:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778722745; x=1810258745;
  h=date:from:to:cc:subject:message-id;
  bh=zXwtdp+YjAdVp9OJoO84enid4Ti08H/Ay04wWcpCzEQ=;
  b=Xn0hNpdOXZcGlJ7oNF4fLVRmr4OuQT0BNOxOR9SkxNuy86qN0boTwj3G
   eFd3oj+KHyF9dsLUHmhZpeKsXVJDjMidCCmZNAxJtgneLJPx/nBRKMMt4
   enueEdtrAyuvz1sdCEl+ZEorQjEeLpjJXI7FNeC5zCVcZ1KjZXvjRVs6T
   T/RQSRhneTiJU2/CH7c+nKyXNcXg3ATnYwrPlqFkeS3MfUBJRU0ylgPcV
   ycgT8v74dEMMIH88WZI4uYnv5oJKG6VqamrWPRVgcsheMgCBXw0jgGbxm
   rYXt+mzMfPNrnyi+7pKwkyZdWsfaRdZq7dgDrW8U2YZ8xO1L+1P+Zs0dd
   A==;
X-CSE-ConnectionGUID: oCkmkbNjS6KEJI3wU5niEw==
X-CSE-MsgGUID: r6OY55CcRtasdHdPmSciKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79519182"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="79519182"
X-CSE-ConnectionGUID: 3bH1zwYlQPC+w0k76cxGvQ==
X-CSE-MsgGUID: 4zL0JSdmRqifES204eLtcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="243228403"
Date: Thu, 14 May 2026 09:38:03 +0800
From: kernel test robot <lkp@intel.com>
To: Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
Subject: [xen-tip:linux-next 2/6] ld.lld: error: undefined symbol:
 __memset
Message-ID: <202605140922.q7IlUv7o-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-purgate-ID: tlsNG-bad1c0/1778722746-41364A53-033F8F92/0/0
X-purgate-type: clean
X-purgate-size: 1335
X-Rspamd-Queue-Id: C020C53CC57
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mfo@igalia.com,m:llvm@lists.linux.dev,m:oe-kbuild-all@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:jgross@suse.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lkp@intel.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,intel.com:email,intel.com:mid,intel.com:dkim];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Action: no action

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git linux-next
head:   67d618348f8f1ce11b1d76f3303a28097f165ac9
commit: 99cf26a6143c22ee6c5b940a0e5e027a99e5524a [2/6] x86/asm, x86/boot: Expose inline memcmp
config: x86_64-randconfig-005-20260514 (https://download.01.org/0day-ci/archive/20260514/202605140922.q7IlUv7o-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140922.q7IlUv7o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605140922.q7IlUv7o-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __memset
   >>> referenced by string.c
   >>>               arch/x86/purgatory/purgatory.ro:(__UNIQUE_ID_addressable___memset_0)
--
>> ld.lld: error: undefined symbol: __memmove
   >>> referenced by string.c
   >>>               arch/x86/purgatory/purgatory.ro:(__UNIQUE_ID_addressable___memmove_1)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

