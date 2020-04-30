Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5C41BFFE5
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 17:16:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUAv1-0007PY-Ii; Thu, 30 Apr 2020 15:16:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H9qc=6O=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jUAuz-0007Os-Vp
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 15:16:06 +0000
X-Inumbo-ID: 808ec349-8af5-11ea-9a67-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 808ec349-8af5-11ea-9a67-12813bfff9fa;
 Thu, 30 Apr 2020 15:16:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E5A86AE39;
 Thu, 30 Apr 2020 15:16:00 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 0/3] xen: Fix some bugs in scheduling
Date: Thu, 30 Apr 2020 17:15:56 +0200
Message-Id: <20200430151559.1464-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
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
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Some bugs I found when trying to find a problem with cpu-on/offlining
in core scheduling mode.

Patches 1 and 3 are fixing observed problems, while patch 2 is more
of a theoretical issue.

Juergen Gross (3):
  xen/sched: allow rcu work to happen when syncing cpus in core
    scheduling
  xen/sched: fix theoretical races accessing vcpu->dirty_cpu
  xen/cpupool: fix removing cpu from a cpupool

 xen/arch/x86/domain.c      | 14 ++++++++++----
 xen/common/sched/core.c    | 10 +++++++---
 xen/common/sched/cpupool.c |  3 +++
 xen/include/xen/sched.h    |  2 +-
 xen/include/xen/softirq.h  |  2 +-
 5 files changed, 22 insertions(+), 9 deletions(-)

-- 
2.16.4


