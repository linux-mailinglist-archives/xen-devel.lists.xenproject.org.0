Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B63AB212C3B
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jul 2020 20:23:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jr3s3-0005hX-La; Thu, 02 Jul 2020 18:23:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PV0h=AN=amazon.com=prvs=445caddfd=anchalag@srs-us1.protection.inumbo.net>)
 id 1jr3s2-0005h0-AO
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2020 18:23:38 +0000
X-Inumbo-ID: 2504ba33-bc91-11ea-8887-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2504ba33-bc91-11ea-8887-12813bfff9fa;
 Thu, 02 Jul 2020 18:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1593714218; x=1625250218;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=42TBP3y4PhPFoPiNAsOF6sq0ISwy0yvaTgprwGJN3gs=;
 b=gqArI3DQHtn1L2MkSfq/YBuf/AiCtMbE6j8vOQleOTW18+umcSBh8b1X
 fWQhO2254GD1Yx+wItnv1LzeF5PkT5/7Pz/dUbzITx+cf6WwmgfyY7uEq
 pSpHMVd4YThvuOvnqu4Z1YCdOUZ6bg6zufvGvQt8bnFf/5zW5ht3pAjbX A=;
IronPort-SDR: LmEWe+lBjje6IkAwKMPzWi2nEZ4tgqKNfXE84BMIprWb5gWec64tizT5QYDEjeSJ/XdZT9iLjF
 RRHpr+GD/3WQ==
X-IronPort-AV: E=Sophos;i="5.75,305,1589241600"; d="scan'208";a="55693384"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-d0be17ee.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 02 Jul 2020 18:23:37 +0000
Received: from EX13MTAUWB001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-d0be17ee.us-west-2.amazon.com (Postfix) with ESMTPS
 id 7E718A255A; Thu,  2 Jul 2020 18:23:35 +0000 (UTC)
Received: from EX13D10UWB004.ant.amazon.com (10.43.161.121) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 2 Jul 2020 18:23:28 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D10UWB004.ant.amazon.com (10.43.161.121) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 2 Jul 2020 18:23:28 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP
 Server id 15.0.1497.2 via Frontend Transport; Thu, 2 Jul 2020 18:23:28 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id 8E2C940844; Thu,  2 Jul 2020 18:23:28 +0000 (UTC)
Date: Thu, 2 Jul 2020 18:23:28 +0000
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
Subject: [PATCH v2 10/11] xen: Update sched clock offset to avoid system
 instability in hibernation
Message-ID: <20200702182328.GA3751@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
References: <cover.1593665947.git.anchalag@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1593665947.git.anchalag@amazon.com>
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

Save/restore xen_sched_clock_offset in syscore suspend/resume during PM
hibernation. Commit '867cefb4cb1012: ("xen: Fix x86 sched_clock() interface
for xen")' fixes xen guest time handling during migration. A similar issue
is seen during PM hibernation when system runs CPU intensive workload.
Post resume pvclock resets the value to 0 however, xen sched_clock_offset
is never updated. System instability is seen during resume from hibernation
when system is under heavy CPU load. Since xen_sched_clock_offset is not
updated, system does not see the monotonic clock value and the scheduler
would then think that heavy CPU hog tasks need more time in CPU, causing
the system to freeze

Signed-off-by: Anchal Agarwal <anchalag@amazon.com>
---
 arch/x86/xen/suspend.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/x86/xen/suspend.c b/arch/x86/xen/suspend.c
index 10cd14326472..4d8b1d2390b9 100644
--- a/arch/x86/xen/suspend.c
+++ b/arch/x86/xen/suspend.c
@@ -95,6 +95,7 @@ static int xen_syscore_suspend(void)
 
 	gnttab_suspend();
 	xen_manage_runstate_time(-1);
+	xen_save_sched_clock_offset();
 	xrfp.domid = DOMID_SELF;
 	xrfp.gpfn = __pa(HYPERVISOR_shared_info) >> PAGE_SHIFT;
 	ret = HYPERVISOR_memory_op(XENMEM_remove_from_physmap, &xrfp);
@@ -110,6 +111,12 @@ static void xen_syscore_resume(void)
 	xen_hvm_map_shared_info();
 
 	pvclock_resume();
+	/*
+	 * Restore xen_sched_clock_offset during resume to maintain
+	 * monotonic clock value
+	 */
+	xen_restore_sched_clock_offset();
+
 	xen_manage_runstate_time(0);
 	gnttab_resume();
 }
-- 
2.20.1


