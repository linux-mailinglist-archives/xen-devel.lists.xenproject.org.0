Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3863A212C39
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jul 2020 20:23:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jr3ro-0005Zm-VY; Thu, 02 Jul 2020 18:23:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PV0h=AN=amazon.com=prvs=445caddfd=anchalag@srs-us1.protection.inumbo.net>)
 id 1jr3rm-0005ZE-VZ
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2020 18:23:22 +0000
X-Inumbo-ID: 1caaf9c8-bc91-11ea-bca7-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1caaf9c8-bc91-11ea-bca7-bc764e2007e4;
 Thu, 02 Jul 2020 18:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1593714202; x=1625250202;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=I7turOllMrL/CNEMBFGxOPTAV9RKwwcOD5Qzsp0RMCI=;
 b=vCQNhmqEzpWBiFjhA17o+7y6jSRGt0hV8h93YfSdFmwmTL7uGwTB3li2
 WqRsJOVaS5mmHL5FBKt/3PAjm2H7e/eklFheXYrlJwWuB1POXO7BXTWcE
 SUDV3yj1DX3w216jPDUzXevn+HCtxqoXZ6Tce287X5Fyln5TibTNer3eL E=;
IronPort-SDR: gtZOu0dMiB3ehEJQSAxthJy8slH3FlYoulPxQjoZIUWyHzAH9qA9TfOTryU3wg6sLJrulv+kzq
 yxHeXV2LgO7A==
X-IronPort-AV: E=Sophos;i="5.75,305,1589241600"; d="scan'208";a="39736466"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 02 Jul 2020 18:23:16 +0000
Received: from EX13MTAUEE002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com (Postfix) with ESMTPS
 id A0D51A2540; Thu,  2 Jul 2020 18:23:14 +0000 (UTC)
Received: from EX13D08UEE002.ant.amazon.com (10.43.62.92) by
 EX13MTAUEE002.ant.amazon.com (10.43.62.24) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 2 Jul 2020 18:22:51 +0000
Received: from EX13MTAUEE002.ant.amazon.com (10.43.62.24) by
 EX13D08UEE002.ant.amazon.com (10.43.62.92) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 2 Jul 2020 18:22:51 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.62.224) with Microsoft SMTP
 Server id 15.0.1497.2 via Frontend Transport; Thu, 2 Jul 2020 18:22:51 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id 651F840844; Thu,  2 Jul 2020 18:22:51 +0000 (UTC)
Date: Thu, 2 Jul 2020 18:22:51 +0000
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
Subject: [PATCH v2 08/11] x86/xen: save and restore steal clock during PM
 hibernation
Message-ID: <20200702182251.GA3606@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
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

Save/restore steal times in syscore suspend/resume during PM
hibernation. Commit '5e25f5db6abb9: ("xen/time: do not
decrease steal time after live migration on xen")' fixes xen
guest steal time handling during migration. A similar issue is seen
during PM hibernation.
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

Changelog:
v1->v2: Removed patches that introduced new function calls for saving/restoring
        sched clock offset and using existing ones that are used during LM

Signed-off-by: Anchal Agarwal <anchalag@amazon.com>
---
 arch/x86/xen/suspend.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/x86/xen/suspend.c b/arch/x86/xen/suspend.c
index e8c924e93fc5..10cd14326472 100644
--- a/arch/x86/xen/suspend.c
+++ b/arch/x86/xen/suspend.c
@@ -94,10 +94,9 @@ static int xen_syscore_suspend(void)
 	int ret;
 
 	gnttab_suspend();
-
+	xen_manage_runstate_time(-1);
 	xrfp.domid = DOMID_SELF;
 	xrfp.gpfn = __pa(HYPERVISOR_shared_info) >> PAGE_SHIFT;
-
 	ret = HYPERVISOR_memory_op(XENMEM_remove_from_physmap, &xrfp);
 	if (!ret)
 		HYPERVISOR_shared_info = &xen_dummy_shared_info;
@@ -111,7 +110,7 @@ static void xen_syscore_resume(void)
 	xen_hvm_map_shared_info();
 
 	pvclock_resume();
-
+	xen_manage_runstate_time(0);
 	gnttab_resume();
 }
 
-- 
2.20.1


