Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C9124E354
	for <lists+xen-devel@lfdr.de>; Sat, 22 Aug 2020 00:27:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k9FVJ-0004T5-1x; Fri, 21 Aug 2020 22:27:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jPNr=B7=amazon.com=prvs=495d0e15a=anchalag@srs-us1.protection.inumbo.net>)
 id 1k9FVH-0004Ss-2e
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 22:27:19 +0000
X-Inumbo-ID: 2ff3aca8-c729-4b20-b616-efbd48fca7fe
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2ff3aca8-c729-4b20-b616-efbd48fca7fe;
 Fri, 21 Aug 2020 22:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1598048838; x=1629584838;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=AYo+6pLde9iknKiLl6WHflZWNz9u2AtyPzZUd9pwJEY=;
 b=A6llCOG/avqIRnrXytHs6Bc4sQNd2Yl9Q2MwSnxOmfilBZPO++lhqWYE
 iYAkESKdaxMnFNkUKX8uK05BA/5ahVRK5B19wuBI1ac93jDIB2zgs/hCa
 ND+K5mdWWkET/DOIbAbHx7dRiPYoVMkJ2DFunbMg5zGWdzJ+Gbm8dzm7g A=;
X-IronPort-AV: E=Sophos;i="5.76,338,1592870400"; d="scan'208";a="61806120"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-859fe132.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 21 Aug 2020 22:26:53 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-859fe132.us-west-2.amazon.com (Postfix) with ESMTPS
 id 1333C228C8C; Fri, 21 Aug 2020 22:26:52 +0000 (UTC)
Received: from EX13D07UWA001.ant.amazon.com (10.43.160.145) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.118) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 21 Aug 2020 22:26:45 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D07UWA001.ant.amazon.com (10.43.160.145) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 21 Aug 2020 22:26:45 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP
 Server id 15.0.1497.2 via Frontend Transport; Fri, 21 Aug 2020 22:26:45 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id CD5D940362; Fri, 21 Aug 2020 22:26:45 +0000 (UTC)
Date: Fri, 21 Aug 2020 22:26:45 +0000
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
Subject: [PATCH v3 03/11] x86/xen: Introduce new function to map
 HYPERVISOR_shared_info on Resume
Message-ID: <15ad3598b31f9a7334bfa6a33f120b5956e88a6b.1598042152.git.anchalag@amazon.com>
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

Introduce a small function which re-uses shared page's PA allocated
during guest initialization time in reserve_shared_info() and not
allocate new page during resume flow.
It also  does the mapping of shared_info_page by calling
xen_hvm_init_shared_info() to use the function.

Changelog:
v1->v2: Remove extra check for shared_info_pfn to be NULL
Signed-off-by: Anchal Agarwal <anchalag@amazon.com>
---
 arch/x86/xen/enlighten_hvm.c | 6 ++++++
 arch/x86/xen/xen-ops.h       | 1 +
 2 files changed, 7 insertions(+)

diff --git a/arch/x86/xen/enlighten_hvm.c b/arch/x86/xen/enlighten_hvm.c
index 9e87ab010c82..ff7c69278f63 100644
--- a/arch/x86/xen/enlighten_hvm.c
+++ b/arch/x86/xen/enlighten_hvm.c
@@ -29,6 +29,12 @@
 
 static unsigned long shared_info_pfn;
 
+void xen_hvm_map_shared_info(void)
+{
+	xen_hvm_init_shared_info();
+	HYPERVISOR_shared_info = __va(PFN_PHYS(shared_info_pfn));
+}
+
 void xen_hvm_init_shared_info(void)
 {
 	struct xen_add_to_physmap xatp;
diff --git a/arch/x86/xen/xen-ops.h b/arch/x86/xen/xen-ops.h
index 45d556f71858..9f0a4345220e 100644
--- a/arch/x86/xen/xen-ops.h
+++ b/arch/x86/xen/xen-ops.h
@@ -53,6 +53,7 @@ void xen_enable_sysenter(void);
 void xen_enable_syscall(void);
 void xen_vcpu_restore(void);
 
+void xen_hvm_map_shared_info(void);
 void xen_hvm_init_shared_info(void);
 void xen_unplug_emulated_devices(void);
 
-- 
2.16.6


