Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5D73206F4
	for <lists+xen-devel@lfdr.de>; Sat, 20 Feb 2021 20:48:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87325.164433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lDYDd-0001HT-NY; Sat, 20 Feb 2021 19:47:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87325.164433; Sat, 20 Feb 2021 19:47:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lDYDd-0001H4-Jx; Sat, 20 Feb 2021 19:47:09 +0000
Received: by outflank-mailman (input) for mailman id 87325;
 Sat, 20 Feb 2021 19:47:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lDYDc-0001Gz-8b
 for xen-devel@lists.xenproject.org; Sat, 20 Feb 2021 19:47:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lDYDb-0001dk-Lf; Sat, 20 Feb 2021 19:47:07 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lDYDb-000628-9G; Sat, 20 Feb 2021 19:47:07 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From;
	bh=IA7DXmK7YoBXYurby+DI9MwqkK0veMWF6uOFJdzIdaE=; b=B9kRmUlmd5hXjIwNo0MQpwtl9J
	Rbc6ffQUVY/P0xM1ORErJ+hK+vwpyTGu8ajEyRUE9gUkpsY5jgFvyGm0fG3qun+KFTPL5sxfMImjW
	huKbKMPxyHGFoIukpw4sU4WZ2fn2a1SBiQeVL3hKjyIkvW5g0GQlsIdkYrtGwQdtK2fU=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org,
	jbeulich@suse.com,
	sstabellini@kernel.org,
	ash.j.wilding@gmail.com,
	Julien Grall <jgrall@amazon.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [PATCH for-4.15] xen/sched: Add missing memory barrier in vcpu_block()
Date: Sat, 20 Feb 2021 19:47:01 +0000
Message-Id: <20210220194701.24202-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

The comment in vcpu_block() states that the events should be checked
/after/ blocking to avoids wakeup waiting race. However, from a generic
perspective, set_bit() doesn't prevent re-ordering. So the following
could happen:

CPU0  (blocking vCPU A)         |   CPU1 ( unblock vCPU A)
                                |
A <- read local events          |
                                |   set local events
                                |   test_and_clear_bit(_VPF_blocked)
                                |       -> Bail out as the bit if not set
                                |
set_bit(_VFP_blocked)           |
                                |
check A                         |

The variable A will be 0 and therefore the vCPU will be blocked when it
should continue running.

vcpu_block() is now gaining an smp_mb__after_atomic() to prevent the CPU
to read any information about local events before the flag _VPF_blocked
is set.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

This is a follow-up of the discussion that started in 2019 (see [1])
regarding a possible race between do_poll()/vcpu_unblock() and the wake
up path.

I haven't yet fully thought about the potential race in do_poll(). If
there is, then this would likely want to be fixed in a separate patch.

On x86, the current code is safe because set_bit() is fully ordered. SO
the problem is Arm (and potentially any new architectures).

I couldn't convince myself whether the Arm implementation of
local_events_need_delivery() contains enough barrier to prevent the
re-ordering. However, I don't think we want to play with devil here as
the function may be optimized in the future.

This patch is candidate for 4.15. The risk is really small as the memory
ordering will be stricter on Arm and therefore less racy.

[1] <3ce4998b-a8a8-37bd-bb26-9550571709b6@suse.com>
---
 xen/common/sched/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 9745a77eee23..2b974fd6f8ba 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -1418,6 +1418,8 @@ void vcpu_block(void)
 
     set_bit(_VPF_blocked, &v->pause_flags);
 
+    smp_mb__after_atomic();
+
     arch_vcpu_block(v);
 
     /* Check for events /after/ blocking: avoids wakeup waiting race. */
-- 
2.17.1


