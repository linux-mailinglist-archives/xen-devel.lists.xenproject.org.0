Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FAE454457
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 10:57:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226674.391767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnHh0-0002He-RC; Wed, 17 Nov 2021 09:57:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226674.391767; Wed, 17 Nov 2021 09:57:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnHh0-0002FN-N6; Wed, 17 Nov 2021 09:57:26 +0000
Received: by outflank-mailman (input) for mailman id 226674;
 Wed, 17 Nov 2021 09:57:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BtAJ=QE=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1mnHgz-0002FB-20
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 09:57:25 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id c2974363-478c-11ec-a9d2-d9f7a1cc8784;
 Wed, 17 Nov 2021 10:57:23 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 44247D6E;
 Wed, 17 Nov 2021 01:57:22 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 670063F70D;
 Wed, 17 Nov 2021 01:57:20 -0800 (PST)
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
X-Inumbo-ID: c2974363-478c-11ec-a9d2-d9f7a1cc8784
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [RFC PATCH 0/2] Boot time cpupools
Date: Wed, 17 Nov 2021 09:57:09 +0000
Message-Id: <20211117095711.26596-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1

Currently Xen creates a default cpupool0 that contains all the cpu brought up
during boot and it assumes that the platform has only one kind of CPU.
This assumption does not hold on big.LITTLE platform, but putting different
type of CPU in the same cpupool can result in instability and security issues
for the domains running on the pool.

For this reason this serie introduces an architecture specific way to create
different cpupool at boot time, this is particularly useful on ARM big.LITTLE
platform where there might be the need to have different cpupools for each type
of core, but also systems using NUMA can have different cpu pool for each node.

To test this serie, the hmp_unsafe Xen boot argument is passed to allow Xen
starting different CPUs from the boot core.

Luca Fancellu (2):
  xen/cpupool: Create different cpupools at boot time
  tools/cpupools: Give a name to unnamed cpupools

 tools/libs/light/libxl_utils.c | 13 ++++--
 xen/arch/arm/Kconfig           | 15 ++++++
 xen/arch/arm/Makefile          |  1 +
 xen/arch/arm/cpupool.c         | 84 ++++++++++++++++++++++++++++++++++
 xen/common/sched/cpupool.c     |  5 +-
 xen/include/xen/cpupool.h      | 30 ++++++++++++
 6 files changed, 142 insertions(+), 6 deletions(-)
 create mode 100644 xen/arch/arm/cpupool.c
 create mode 100644 xen/include/xen/cpupool.h

-- 
2.17.1


