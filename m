Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A531DA565
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 01:26:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbBcr-0005Uv-Hg; Tue, 19 May 2020 23:26:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1yeG=7B=amazon.com=prvs=4015a1a96=anchalag@srs-us1.protection.inumbo.net>)
 id 1jbBcr-0005Un-0P
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 23:26:21 +0000
X-Inumbo-ID: 24fe38e6-9a28-11ea-a9a0-12813bfff9fa
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 24fe38e6-9a28-11ea-a9a0-12813bfff9fa;
 Tue, 19 May 2020 23:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1589930780; x=1621466780;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=SCTjmV5xVHiNIjiUIMGTdFjC64fXGAUedyZ2c0jICro=;
 b=CekwH+sbAr2pQsEc8oiWkbBH7ofiPVvejYJBFfA/XnznZP0Liel6g0nW
 Mzeh2uGLO9HiCH783//og6xcgE9RFhxYJTOoaJDWhlEFRSsUfnt0Ffb+2
 7KzlZJGf3ynT47xtPhx850MM2v5cW9OPQgeKidCfS6GdlOocYuuWcwjfU 4=;
IronPort-SDR: Kg+TLt+LY+bqUJUwBpjU3RbEzJfqG2xPZmKQMMNfSWm/LI+Yb1NN+YBg1sA0a/PiOEnBmgV9Bu
 QFRUnvjW9CbQ==
X-IronPort-AV: E=Sophos;i="5.73,411,1583193600"; d="scan'208";a="36215719"
Received: from sea32-co-svc-lb4-vlan2.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-17c49630.us-east-1.amazon.com) ([10.47.23.34])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 19 May 2020 23:26:16 +0000
Received: from EX13MTAUWC001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-17c49630.us-east-1.amazon.com (Postfix) with ESMTPS
 id 61936A2313; Tue, 19 May 2020 23:26:09 +0000 (UTC)
Received: from EX13D05UWC003.ant.amazon.com (10.43.162.226) by
 EX13MTAUWC001.ant.amazon.com (10.43.162.135) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 19 May 2020 23:25:48 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D05UWC003.ant.amazon.com (10.43.162.226) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 19 May 2020 23:25:48 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP
 Server id 15.0.1497.2 via Frontend Transport; Tue, 19 May 2020 23:25:48 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id 91F2940712; Tue, 19 May 2020 23:25:48 +0000 (UTC)
Date: Tue, 19 May 2020 23:25:48 +0000
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
Subject: [PATCH 03/12] x86/xen: Introduce new function to map
 HYPERVISOR_shared_info on Resume
Message-ID: <529f544a64bb93b920bf86b1d3f86d93b0a4219b.1589926004.git.anchalag@amazon.com>
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

Introduce a small function which re-uses shared page's PA allocated
during guest initialization time in reserve_shared_info() and not
allocate new page during resume flow.
It also  does the mapping of shared_info_page by calling
xen_hvm_init_shared_info() to use the function.

Signed-off-by: Anchal Agarwal <anchalag@amazon.com>
---
 arch/x86/xen/enlighten_hvm.c | 7 +++++++
 arch/x86/xen/xen-ops.h       | 1 +
 2 files changed, 8 insertions(+)

diff --git a/arch/x86/xen/enlighten_hvm.c b/arch/x86/xen/enlighten_hvm.c
index e138f7de52d2..75b1ec7a0fcd 100644
--- a/arch/x86/xen/enlighten_hvm.c
+++ b/arch/x86/xen/enlighten_hvm.c
@@ -27,6 +27,13 @@
 
 static unsigned long shared_info_pfn;
 
+void xen_hvm_map_shared_info(void)
+{
+	xen_hvm_init_shared_info();
+	if (shared_info_pfn)
+		HYPERVISOR_shared_info = __va(PFN_PHYS(shared_info_pfn));
+}
+
 void xen_hvm_init_shared_info(void)
 {
 	struct xen_add_to_physmap xatp;
diff --git a/arch/x86/xen/xen-ops.h b/arch/x86/xen/xen-ops.h
index 45a441c33d6d..d84c357994bd 100644
--- a/arch/x86/xen/xen-ops.h
+++ b/arch/x86/xen/xen-ops.h
@@ -56,6 +56,7 @@ void xen_enable_syscall(void);
 void xen_vcpu_restore(void);
 
 void xen_callback_vector(void);
+void xen_hvm_map_shared_info(void);
 void xen_hvm_init_shared_info(void);
 void xen_unplug_emulated_devices(void);
 
-- 
2.24.1.AMZN


