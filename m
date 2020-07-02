Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C98F212C24
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jul 2020 20:22:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jr3qw-0005DE-FF; Thu, 02 Jul 2020 18:22:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PV0h=AN=amazon.com=prvs=445caddfd=anchalag@srs-us1.protection.inumbo.net>)
 id 1jr3qu-0005Cv-S3
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2020 18:22:28 +0000
X-Inumbo-ID: fb2adb9d-bc90-11ea-8887-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fb2adb9d-bc90-11ea-8887-12813bfff9fa;
 Thu, 02 Jul 2020 18:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1593714148; x=1625250148;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=L0wmgxX+Ovp8pu3YnIUM23eFCfp/nVBG2avgRDi4ITE=;
 b=AYpFS4qf//QSf1DXaidpas5RaihxjrIv9aA3HVGT/6cvwO7Cqvzf0WDM
 KHGrE03l3CSOcVCMt8LLo2b3Vkpus5fGJjmvBfHBgHz+vwAYepQyb7wKK
 ekiYo9ootHWH/4CBY9Zmu8VbRsxEnZTIMeo2Re+BZu00KiSwLR4lpqXNo s=;
IronPort-SDR: phoIWWm5EGmTpHtUjCgKWFQfuW7oI7r/z0P4Vuu21Tm6bBK93XjGosJHiCJSK1i+PGpOrR2b63
 /Mq6kJcMc4Tg==
X-IronPort-AV: E=Sophos;i="5.75,305,1589241600"; d="scan'208";a="56964556"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-17c49630.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 02 Jul 2020 18:22:26 +0000
Received: from EX13MTAUEB002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-17c49630.us-east-1.amazon.com (Postfix) with ESMTPS
 id C81B2A188E; Thu,  2 Jul 2020 18:22:18 +0000 (UTC)
Received: from EX13D08UEB002.ant.amazon.com (10.43.60.107) by
 EX13MTAUEB002.ant.amazon.com (10.43.60.12) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 2 Jul 2020 18:21:52 +0000
Received: from EX13MTAUEA002.ant.amazon.com (10.43.61.77) by
 EX13D08UEB002.ant.amazon.com (10.43.60.107) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 2 Jul 2020 18:21:52 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.61.169) with Microsoft SMTP
 Server id 15.0.1497.2 via Frontend Transport; Thu, 2 Jul 2020 18:21:52 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id 05A9F40844; Thu,  2 Jul 2020 18:21:52 +0000 (UTC)
Date: Thu, 2 Jul 2020 18:21:52 +0000
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
Subject: [PATCH v2 03/11] x86/xen: Introduce new function to map
 HYPERVISOR_shared_info on Resume
Message-ID: <3601db44e7c543016ca67327393d9ae37019e408.1593665947.git.anchalag@amazon.com>
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
index 3e89b0067ff0..d91099928746 100644
--- a/arch/x86/xen/enlighten_hvm.c
+++ b/arch/x86/xen/enlighten_hvm.c
@@ -28,6 +28,12 @@
 
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
index 53b224fd6177..41e9e9120f2d 100644
--- a/arch/x86/xen/xen-ops.h
+++ b/arch/x86/xen/xen-ops.h
@@ -54,6 +54,7 @@ void xen_enable_sysenter(void);
 void xen_enable_syscall(void);
 void xen_vcpu_restore(void);
 
+void xen_hvm_map_shared_info(void);
 void xen_hvm_init_shared_info(void);
 void xen_unplug_emulated_devices(void);
 
-- 
2.20.1


