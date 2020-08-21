Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC3E24E372
	for <lists+xen-devel@lfdr.de>; Sat, 22 Aug 2020 00:30:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k9FYh-0005ek-1N; Fri, 21 Aug 2020 22:30:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jPNr=B7=amazon.com=prvs=495d0e15a=anchalag@srs-us1.protection.inumbo.net>)
 id 1k9FYf-0005eR-Jt
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 22:30:49 +0000
X-Inumbo-ID: 9dfdf4ac-0b3a-4138-9ea8-e5897a1496e8
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9dfdf4ac-0b3a-4138-9ea8-e5897a1496e8;
 Fri, 21 Aug 2020 22:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1598049049; x=1629585049;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=fYlNM/Ki+IOGvkGZqz//RrR1UMvb0Rd2rCL0FP2g5T0=;
 b=pn/9JOBeWYnevmFKb35F9JN1FDS14Fldm6UpDiEdFFOGxsEkSVMjnhhK
 ZE2lqZPwMMsadGJo2IqOC+YbCvcABrrr19HqGSUrl9oFTPHM6Lf5sQjTT
 sHbLUSbRXzMH81LocOyw+aPK/FbUuL9hK+Qdqq9nE31G0T5emgmffQl6E 0=;
X-IronPort-AV: E=Sophos;i="5.76,338,1592870400"; d="scan'208";a="69983166"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-821c648d.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 21 Aug 2020 22:30:46 +0000
Received: from EX13MTAUWC001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-821c648d.us-east-1.amazon.com (Postfix) with ESMTPS
 id C2DE2A1FA1; Fri, 21 Aug 2020 22:30:39 +0000 (UTC)
Received: from EX13D05UWC002.ant.amazon.com (10.43.162.92) by
 EX13MTAUWC001.ant.amazon.com (10.43.162.135) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 21 Aug 2020 22:30:11 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D05UWC002.ant.amazon.com (10.43.162.92) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 21 Aug 2020 22:30:11 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP
 Server id 15.0.1497.2 via Frontend Transport; Fri, 21 Aug 2020 22:30:11 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id 59A8A40362; Fri, 21 Aug 2020 22:30:11 +0000 (UTC)
Date: Fri, 21 Aug 2020 22:30:11 +0000
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
Subject: [PATCH v3 09/11] xen: Introduce wrapper for save/restore sched clock
 offset
Message-ID: <c3665c0918a56d8789995d53f9fbe77131938a66.1598042152.git.anchalag@amazon.com>
References: <cover.1598042152.git.anchalag@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1598042152.git.anchalag@amazon.com>
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

Introduce wrappers for save/restore xen_sched_clock_offset to be
used by PM hibernation code to avoid system instability during resume.

Signed-off-by: Anchal Agarwal <anchalag@amazon.com>
---
 arch/x86/xen/time.c    | 15 +++++++++++++--
 arch/x86/xen/xen-ops.h |  2 ++
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/x86/xen/time.c b/arch/x86/xen/time.c
index 91f5b330dcc6..e45349178ffc 100644
--- a/arch/x86/xen/time.c
+++ b/arch/x86/xen/time.c
@@ -387,12 +387,23 @@ static const struct pv_time_ops xen_time_ops __initconst = {
 static struct pvclock_vsyscall_time_info *xen_clock __read_mostly;
 static u64 xen_clock_value_saved;
 
+/*This is needed to maintain a monotonic clock value during PM hibernation */
+void xen_save_sched_clock_offset(void)
+{
+	xen_clock_value_saved = xen_clocksource_read() - xen_sched_clock_offset;
+}
+
+void xen_restore_sched_clock_offset(void)
+{
+	xen_sched_clock_offset = xen_clocksource_read() - xen_clock_value_saved;
+}
+
 void xen_save_time_memory_area(void)
 {
 	struct vcpu_register_time_memory_area t;
 	int ret;
 
-	xen_clock_value_saved = xen_clocksource_read() - xen_sched_clock_offset;
+	xen_save_sched_clock_offset();
 
 	if (!xen_clock)
 		return;
@@ -435,7 +446,7 @@ void xen_restore_time_memory_area(void)
 out:
 	/* Need pvclock_resume() before using xen_clocksource_read(). */
 	pvclock_resume();
-	xen_sched_clock_offset = xen_clocksource_read() - xen_clock_value_saved;
+	xen_restore_sched_clock_offset();
 }
 
 static void xen_setup_vsyscall_time_info(void)
diff --git a/arch/x86/xen/xen-ops.h b/arch/x86/xen/xen-ops.h
index 9f0a4345220e..9a79e210119c 100644
--- a/arch/x86/xen/xen-ops.h
+++ b/arch/x86/xen/xen-ops.h
@@ -69,6 +69,8 @@ void xen_save_time_memory_area(void);
 void xen_restore_time_memory_area(void);
 void xen_init_time_ops(void);
 void xen_hvm_init_time_ops(void);
+void xen_save_sched_clock_offset(void);
+void xen_restore_sched_clock_offset(void);
 
 irqreturn_t xen_debug_interrupt(int irq, void *dev_id);
 
-- 
2.16.6


