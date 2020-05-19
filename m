Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7B21DA57E
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 01:28:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbBf8-0005xo-A2; Tue, 19 May 2020 23:28:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1yeG=7B=amazon.com=prvs=4015a1a96=anchalag@srs-us1.protection.inumbo.net>)
 id 1jbBf6-0005xQ-So
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 23:28:40 +0000
X-Inumbo-ID: 7852e852-9a28-11ea-a9a0-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7852e852-9a28-11ea-a9a0-12813bfff9fa;
 Tue, 19 May 2020 23:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1589930919; x=1621466919;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=8oFwSiGiXazezHFt6ilNhdZTejmHfEW4a5eyQv6e/gQ=;
 b=O67L4Ghoyg8obEDO3ivTUOcNgc7b8Q8+mRkR6K8hVvkPyO1A3y6cEHm4
 Cu8St2CGH61ACGXV0/rhMCbirWBWM3hGOPReuITNJYBwt05ARxHxkLcB5
 NyHESGaaztZUoQwkmxfly6yrh36RwxACxwzpf5kDmA4UyjbJxsCzYxFY+ 0=;
IronPort-SDR: ypi20ESB/vUTFj2KU/00Es79bg7nB7GrK8X0Zx694qkzKCpMWUQK1Y3nZ8y0w9sxgpu4l6EFGx
 eREArqyAyGtA==
X-IronPort-AV: E=Sophos;i="5.73,411,1583193600"; d="scan'208";a="31067058"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-c5104f52.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 19 May 2020 23:28:37 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-c5104f52.us-west-2.amazon.com (Postfix) with ESMTPS
 id 03FA7A1E06; Tue, 19 May 2020 23:28:35 +0000 (UTC)
Received: from EX13D07UWA001.ant.amazon.com (10.43.160.145) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 19 May 2020 23:28:30 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D07UWA001.ant.amazon.com (10.43.160.145) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 19 May 2020 23:28:30 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP
 Server id 15.0.1497.2 via Frontend Transport; Tue, 19 May 2020 23:28:30 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id 8B45240712; Tue, 19 May 2020 23:28:30 +0000 (UTC)
Date: Tue, 19 May 2020 23:28:30 +0000
From: Anchal Agarwal <anchalag@amazon.com>
To: <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>, <hpa@zytor.com>, 
 <x86@kernel.org>, <boris.ostrovsky@oracle.com>, <jgross@suse.com>,
 <linux-pm@vger.kernel.org>, <linux-mm@kvack.org>, <kamatam@amazon.com>,
 <sstabellini@kernel.org>, <konrad.wilk@oracle.com>, <roger.pau@citrix.com>,
 <axboe@kernel.dk>, <davem@davemloft.net>, <rjw@rjwysocki.net>,
 <len.brown@intel.com>, <pavel@ucw.cz>, <peterz@infradead.org>,
 <eduval@amazon.com>, <sblbir@amazon.com>, <anchalag@amazon.com>,
 <xen-devel@lists.xenproject.org>, <vkuznets@redhat.com>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dwmw@amazon.co.uk>, <benh@kernel.crashing.org>
Subject: [PATCH 08/12] xen/time: introduce xen_{save,restore}_steal_clock
Message-ID: <ae90ece495d29f54fc9986a07f45ab6659136573.1589926004.git.anchalag@amazon.com>
References: <cover.1589926004.git.anchalag@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1589926004.git.anchalag@amazon.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Munehisa Kamata <kamatam@amazon.com>

Currently, steal time accounting code in scheduler expects steal clock
callback to provide monotonically increasing value. If the accounting
code receives a smaller value than previous one, it uses a negative
value to calculate steal time and results in incorrectly updated idle
and steal time accounting. This breaks userspace tools which read
/proc/stat.

top - 08:05:35 up  2:12,  3 users,  load average: 0.00, 0.07, 0.23
Tasks:  80 total,   1 running,  79 sleeping,   0 stopped,   0 zombie
Cpu(s):  0.0%us,  0.0%sy,  0.0%ni,30100.0%id,  0.0%wa,  0.0%hi, 0.0%si,-1253874204672.0%st

This can actually happen when a Xen PVHVM guest gets restored from
hibernation, because such a restored guest is just a fresh domain from
Xen perspective and the time information in runstate info starts over
from scratch.

This patch introduces xen_save_steal_clock() which saves current values
in runstate info into per-cpu variables. Its couterpart,
xen_restore_steal_clock(), sets offset if it found the current values in
runstate info are smaller than previous ones. xen_steal_clock() is also
modified to use the offset to ensure that scheduler only sees
monotonically increasing number.

Signed-off-by: Munehisa Kamata <kamatam@amazon.com>
Signed-off-by: Anchal Agarwal <anchalag@amazon.com>
---
 drivers/xen/time.c    | 29 ++++++++++++++++++++++++++++-
 include/xen/xen-ops.h |  2 ++
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/time.c b/drivers/xen/time.c
index 0968859c29d0..3560222cc0dd 100644
--- a/drivers/xen/time.c
+++ b/drivers/xen/time.c
@@ -23,6 +23,9 @@ static DEFINE_PER_CPU(struct vcpu_runstate_info, xen_runstate);
 
 static DEFINE_PER_CPU(u64[4], old_runstate_time);
 
+static DEFINE_PER_CPU(u64, xen_prev_steal_clock);
+static DEFINE_PER_CPU(u64, xen_steal_clock_offset);
+
 /* return an consistent snapshot of 64-bit time/counter value */
 static u64 get64(const u64 *p)
 {
@@ -149,7 +152,7 @@ bool xen_vcpu_stolen(int vcpu)
 	return per_cpu(xen_runstate, vcpu).state == RUNSTATE_runnable;
 }
 
-u64 xen_steal_clock(int cpu)
+static u64 __xen_steal_clock(int cpu)
 {
 	struct vcpu_runstate_info state;
 
@@ -157,6 +160,30 @@ u64 xen_steal_clock(int cpu)
 	return state.time[RUNSTATE_runnable] + state.time[RUNSTATE_offline];
 }
 
+u64 xen_steal_clock(int cpu)
+{
+	return __xen_steal_clock(cpu) + per_cpu(xen_steal_clock_offset, cpu);
+}
+
+void xen_save_steal_clock(int cpu)
+{
+	per_cpu(xen_prev_steal_clock, cpu) = xen_steal_clock(cpu);
+}
+
+void xen_restore_steal_clock(int cpu)
+{
+	u64 steal_clock = __xen_steal_clock(cpu);
+
+	if (per_cpu(xen_prev_steal_clock, cpu) > steal_clock) {
+		/* Need to update the offset */
+		per_cpu(xen_steal_clock_offset, cpu) =
+		    per_cpu(xen_prev_steal_clock, cpu) - steal_clock;
+	} else {
+		/* Avoid unnecessary steal clock warp */
+		per_cpu(xen_steal_clock_offset, cpu) = 0;
+	}
+}
+
 void xen_setup_runstate_info(int cpu)
 {
 	struct vcpu_register_runstate_memory_area area;
diff --git a/include/xen/xen-ops.h b/include/xen/xen-ops.h
index 89b1e88712d6..74fb5eb3aad8 100644
--- a/include/xen/xen-ops.h
+++ b/include/xen/xen-ops.h
@@ -37,6 +37,8 @@ void xen_time_setup_guest(void);
 void xen_manage_runstate_time(int action);
 void xen_get_runstate_snapshot(struct vcpu_runstate_info *res);
 u64 xen_steal_clock(int cpu);
+void xen_save_steal_clock(int cpu);
+void xen_restore_steal_clock(int cpu);
 
 int xen_setup_shutdown_event(void);
 
-- 
2.24.1.AMZN


