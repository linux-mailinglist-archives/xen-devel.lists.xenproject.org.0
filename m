Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E30D212C3A
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jul 2020 20:23:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jr3rt-0005by-Cm; Thu, 02 Jul 2020 18:23:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PV0h=AN=amazon.com=prvs=445caddfd=anchalag@srs-us1.protection.inumbo.net>)
 id 1jr3rs-0005bi-OH
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2020 18:23:28 +0000
X-Inumbo-ID: 1ff4c03c-bc91-11ea-8887-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1ff4c03c-bc91-11ea-8887-12813bfff9fa;
 Thu, 02 Jul 2020 18:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1593714208; x=1625250208;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=H8un5fMu7aydEquICqxLlc2CreWzZQt/df8398cfX/c=;
 b=EuA4j1Ay4fUzhF4NQf9kdvekUqHC2IfUmjhWyFdGQlbU2lauRr+EJ/n2
 KABRzPs83MGZNiCxxkRZPPkPJSukvqM/8Vb5yJ158icsqMR7iUEs+XSgN
 CQVB3R2qlf/4G/PBYIWAcQwa+FfuGd7am6XGebcC+LqV02Kmz/7nPf+Pj 0=;
IronPort-SDR: +nUVv9fjNo7jApSiBsxQulNLtThEWcq31zBbfQPBu6bZu2P9FKOrUT141gBiLH5vsliubVIDL4
 w1fvvS1czfgA==
X-IronPort-AV: E=Sophos;i="5.75,305,1589241600"; d="scan'208";a="39736489"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-c6afef2e.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 02 Jul 2020 18:23:26 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-c6afef2e.us-west-2.amazon.com (Postfix) with ESMTPS
 id 93042A2655; Thu,  2 Jul 2020 18:23:24 +0000 (UTC)
Received: from EX13D10UWA001.ant.amazon.com (10.43.160.216) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.118) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 2 Jul 2020 18:23:12 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D10UWA001.ant.amazon.com (10.43.160.216) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 2 Jul 2020 18:23:12 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP
 Server id 15.0.1497.2 via Frontend Transport; Thu, 2 Jul 2020 18:23:12 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id BB32E40844; Thu,  2 Jul 2020 18:23:12 +0000 (UTC)
Date: Thu, 2 Jul 2020 18:23:12 +0000
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
Subject: [PATCH v2 09/11] xen: Introduce wrapper for save/restore sched clock
 offset
Message-ID: <20200702182312.GA3699@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
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

Introduce wrappers for save/restore xen_sched_clock_offset to be
used by PM hibernation code to avoid system instability during resume.

Signed-off-by: Anchal Agarwal <anchalag@amazon.com>
---
 arch/x86/xen/time.c    | 15 +++++++++++++--
 arch/x86/xen/xen-ops.h |  2 ++
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/x86/xen/time.c b/arch/x86/xen/time.c
index c8897aad13cd..676950eb0cb5 100644
--- a/arch/x86/xen/time.c
+++ b/arch/x86/xen/time.c
@@ -386,12 +386,23 @@ static const struct pv_time_ops xen_time_ops __initconst = {
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
@@ -434,7 +445,7 @@ void xen_restore_time_memory_area(void)
 out:
 	/* Need pvclock_resume() before using xen_clocksource_read(). */
 	pvclock_resume();
-	xen_sched_clock_offset = xen_clocksource_read() - xen_clock_value_saved;
+	xen_restore_sched_clock_offset();
 }
 
 static void xen_setup_vsyscall_time_info(void)
diff --git a/arch/x86/xen/xen-ops.h b/arch/x86/xen/xen-ops.h
index 41e9e9120f2d..f4b78b19493b 100644
--- a/arch/x86/xen/xen-ops.h
+++ b/arch/x86/xen/xen-ops.h
@@ -70,6 +70,8 @@ void xen_save_time_memory_area(void);
 void xen_restore_time_memory_area(void);
 void xen_init_time_ops(void);
 void xen_hvm_init_time_ops(void);
+void xen_save_sched_clock_offset(void);
+void xen_restore_sched_clock_offset(void);
 
 irqreturn_t xen_debug_interrupt(int irq, void *dev_id);
 
-- 
2.20.1


