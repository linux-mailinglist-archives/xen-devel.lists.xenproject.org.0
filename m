Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FC8192665
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 11:58:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH3gw-0005PL-Qq; Wed, 25 Mar 2020 10:55:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=O/z9=5K=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jH3gv-0005P9-C4
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 10:55:21 +0000
X-Inumbo-ID: 1bca9638-6e87-11ea-a6c1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1bca9638-6e87-11ea-a6c1-bc764e2007e4;
 Wed, 25 Mar 2020 10:55:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D5AC8ABD1;
 Wed, 25 Mar 2020 10:55:14 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 25 Mar 2020 11:55:06 +0100
Message-Id: <20200325105511.20882-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH v7 0/5] xen/rcu: let rcu work better with core
 scheduling
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Today the RCU handling in Xen is affecting scheduling in several ways.
It is raising sched softirqs without any real need and it requires
tasklets for rcu_barrier(), which interacts badly with core scheduling.

This small series repairs those issues.

Additionally some ASSERT()s are added for verification of sane rcu
handling. In order to avoid those triggering right away the obvious
violations are fixed. This includes making rcu locking functions type
safe.

Changes in V7:
- new patch 1
- added some barriers in patch 1

Changes in V6:
- added memory barrier in patch 1
- drop cpu_map_lock only at the end of rcu_barrier()
- re-add prempt_disable() in patch 3

Changes in V5:
- dropped already committed patches 1 and 4
- fixed race
- rework blocking of rcu processing with held rcu locks

Changes in V4:
- patch 5: use barrier()

Changes in V3:
- type safe locking functions (functions instead of macros)
- per-lock debug additions
- new patches 4 and 6
- fixed races

Changes in V2:
- use get_cpu_maps() in rcu_barrier() handling
- avoid recursion in rcu_barrier() handling
- new patches 3 and 4

Juergen Gross (5):
  xen: introduce smp_mb__[after|before]_atomic() barriers
  xen/rcu: don't use stop_machine_run() for rcu_barrier()
  xen: don't process rcu callbacks when holding a rcu_read_lock()
  xen/rcu: add assertions to debug build
  xen/rcu: add per-lock counter in debug builds

 xen/common/rcupdate.c        | 102 +++++++++++++++++++++++++++++++------------
 xen/common/softirq.c         |  14 +++++-
 xen/include/asm-arm/system.h |   3 ++
 xen/include/asm-x86/system.h |   3 ++
 xen/include/xen/rcupdate.h   |  77 ++++++++++++++++++++++++++------
 5 files changed, 157 insertions(+), 42 deletions(-)

-- 
2.16.4


