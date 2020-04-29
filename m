Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4673A1BE561
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 19:36:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTqdJ-00029O-4k; Wed, 29 Apr 2020 17:36:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vbvF=6N=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jTqdH-00029J-AP
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 17:36:27 +0000
X-Inumbo-ID: f363e5b2-8a3f-11ea-b07b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f363e5b2-8a3f-11ea-b07b-bc764e2007e4;
 Wed, 29 Apr 2020 17:36:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 87C6CAC37;
 Wed, 29 Apr 2020 17:36:24 +0000 (UTC)
Subject: [PATCH 0/2] xen: credit2: limit the number of CPUs per runqueue
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 29 Apr 2020 19:36:23 +0200
Message-ID: <158818022727.24327.14309662489731832234.stgit@Palanthas>
User-Agent: StGit/0.21
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

In Credit2, the CPUs are assigned to runqueues according to the host
topology. For instance, if we want per-socket runqueues (which is the
default), the CPUs that are in the same socket will end up in the same
runqueue.

This is generally good for scalability, at least until the number of
CPUs that end up in the same runqueue is not too high. In fact, all this
CPUs will compete for the same spinlock, for making scheduling decisions
and manipulating the scheduler data structures. Therefore, if they are
too many, that can become a bottleneck.

This has not been an issue so far, but architectures with 128 CPUs per
socket are now available, and it is certainly unideal to have so many
CPUs in the same runqueue, competing for the same locks, etc.

Let's therefore set a cap to the total number of CPUs that can share a
runqueue. The value is set to 16, by default, but can be changed with
a boot command line parameter.

Note that this is orthogonal and independent from the activity of
introducing runqueue arrangement mechanisms and chriteria. In fact,
we very well may want to implement the capability of having, say, per-LLC
runqueues, or per-die (where that is defined) runqueues. In fact, this
would work well on current system, but nothing guarantees that, in
future, there won't be an architecture with hundreds of CPUs per DIE or
LLC... And we'll be back to where we are now.

Therefore, even if we are actually planning to add some new runqueue
organization criteria, fixing a limit for the number of CPUs that
will ever share a runqueue, whatever the underlying topology is, is
still useful.

Note also that, if the host has hyperthreading (and we are not using
core-scheduling), additional care is taken to avoid splitting CPUs that
are hyperthread siblings among different runqueues.

---
Dario Faggioli (2):
      xen: credit2: factor cpu to runqueue matching in a function
      xen: credit2: limit the max number of CPUs in a runqueue

 xen/common/sched/cpupool.c |    2 -
 xen/common/sched/credit2.c |  130 +++++++++++++++++++++++++++++++++++++++-----
 xen/common/sched/private.h |    2 +
 3 files changed, 119 insertions(+), 15 deletions(-)

--
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

