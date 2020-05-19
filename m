Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D79801DA595
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 01:30:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbBgR-0006Xq-Se; Tue, 19 May 2020 23:30:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1yeG=7B=amazon.com=prvs=4015a1a96=anchalag@srs-us1.protection.inumbo.net>)
 id 1jbBgQ-0006NE-DH
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 23:30:02 +0000
X-Inumbo-ID: a8fd3945-9a28-11ea-a9a1-12813bfff9fa
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a8fd3945-9a28-11ea-a9a1-12813bfff9fa;
 Tue, 19 May 2020 23:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1589931002; x=1621467002;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=fitAmmYR+siRHznU7MJYKk9c4Tw82/jy6e5chPwlJLw=;
 b=YygAM4rxhevUTIpwXDea+e1znhZ7YOkK+Xbwgvyk2RpqEX1HneGo34qH
 FUR9cIh77T27+TwpzuT/FfNlYH1JbfxCVlwArylM/KP1tL7hgMuWok+zE
 H0QLewXYVd0zlqr1NelNitMrBpv7JsNH4728d9RmELnUU2LHe0srjoA2i M=;
IronPort-SDR: Wl3dSMwhpOL5k2tH39DJuBMefCB10ew0UQM8WlE40AAwlaQq7gFVjSYFqv7rMMiJuNURig22t8
 62l/Qk1vmD/Q==
X-IronPort-AV: E=Sophos;i="5.73,411,1583193600"; d="scan'208";a="36216330"
Received: from sea32-co-svc-lb4-vlan2.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-859fe132.us-west-2.amazon.com) ([10.47.23.34])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 19 May 2020 23:30:01 +0000
Received: from EX13MTAUWB001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-859fe132.us-west-2.amazon.com (Postfix) with ESMTPS
 id C56E42225D4; Tue, 19 May 2020 23:29:59 +0000 (UTC)
Received: from EX13D07UWB004.ant.amazon.com (10.43.161.196) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.207) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 19 May 2020 23:29:52 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D07UWB004.ant.amazon.com (10.43.161.196) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 19 May 2020 23:29:52 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP
 Server id 15.0.1497.2 via Frontend Transport; Tue, 19 May 2020 23:29:52 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id 847C740712; Tue, 19 May 2020 23:29:52 +0000 (UTC)
Date: Tue, 19 May 2020 23:29:52 +0000
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
Subject: [PATCH 12/12] PM / hibernate: update the resume offset on
 SNAPSHOT_SET_SWAP_AREA
Message-ID: <40de33ca69c0d3bcf8c827862768ae5d399698d6.1589926004.git.anchalag@amazon.com>
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

From: Aleksei Besogonov <cyberax@amazon.com>

The SNAPSHOT_SET_SWAP_AREA is supposed to be used to set the hibernation
offset on a running kernel to enable hibernating to a swap file.
However, it doesn't actually update the swsusp_resume_block variable. As
a result, the hibernation fails at the last step (after all the data is
written out) in the validation of the swap signature in
mark_swapfiles().

Before this patch, the command line processing was the only place where
swsusp_resume_block was set.
[Changelog: Resolved patch conflict as code fragmented to
snapshot_set_swap_area]
Signed-off-by: Aleksei Besogonov <cyberax@amazon.com>
Signed-off-by: Munehisa Kamata <kamatam@amazon.com>
Signed-off-by: Anchal Agarwal <anchalag@amazon.com>
---
 kernel/power/user.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/kernel/power/user.c b/kernel/power/user.c
index 7959449765d9..1afa1f0a223e 100644
--- a/kernel/power/user.c
+++ b/kernel/power/user.c
@@ -235,8 +235,12 @@ static int snapshot_set_swap_area(struct snapshot_data *data,
 		return -EINVAL;
 	}
 	data->swap = swap_type_of(swdev, offset, NULL);
-	if (data->swap < 0)
+	if (data->swap < 0) {
 		return -ENODEV;
+	} else {
+	    swsusp_resume_device = swdev;
+	    swsusp_resume_block = offset;
+	}
 	return 0;
 }
 
-- 
2.24.1.AMZN


