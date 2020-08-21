Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA5124E378
	for <lists+xen-devel@lfdr.de>; Sat, 22 Aug 2020 00:31:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k9FZV-0005q2-LD; Fri, 21 Aug 2020 22:31:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jPNr=B7=amazon.com=prvs=495d0e15a=anchalag@srs-us1.protection.inumbo.net>)
 id 1k9FZT-0005po-Ru
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 22:31:39 +0000
X-Inumbo-ID: a06c0df0-43ed-4070-ad3b-f037ee1f16e6
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a06c0df0-43ed-4070-ad3b-f037ee1f16e6;
 Fri, 21 Aug 2020 22:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1598049099; x=1629585099;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=KGOXaiYn1ak+sFNzgNB3oOUptsvwKqYPuda3QEWzejY=;
 b=Tayj0cXxHIt0m2paOGl1ucxyeIglv9mpERhWV2VG4/ZE/bhM4QgmUlOT
 r32aChzqoD8LRP8tAZEMasZRFlnsuWB+vN+ij8q7MkFB8bym8NmWjH9VT
 du+QHFwS1FUNZJI4YeBiDQEOhWwbnuv8+wrcie5HqRGzhHUn1OO2PU2aP U=;
X-IronPort-AV: E=Sophos;i="5.76,338,1592870400"; d="scan'208";a="49307415"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-67b371d8.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 21 Aug 2020 22:31:39 +0000
Received: from EX13MTAUWB001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-67b371d8.us-east-1.amazon.com (Postfix) with ESMTPS
 id DEBBDA21BC; Fri, 21 Aug 2020 22:31:32 +0000 (UTC)
Received: from EX13D01UWB001.ant.amazon.com (10.43.161.75) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.207) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 21 Aug 2020 22:31:14 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13d01UWB001.ant.amazon.com (10.43.161.75) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 21 Aug 2020 22:31:14 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP
 Server id 15.0.1497.2 via Frontend Transport; Fri, 21 Aug 2020 22:31:14 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id B096A40362; Fri, 21 Aug 2020 22:31:14 +0000 (UTC)
Date: Fri, 21 Aug 2020 22:31:14 +0000
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
Subject: [PATCH v3 11/11] PM / hibernate: update the resume offset on
 SNAPSHOT_SET_SWAP_AREA
Message-ID: <61d94dd74e238edeb264d8e3aa43847b93f986b6.1598042152.git.anchalag@amazon.com>
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

From: Aleksei Besogonov <cyberax@amazon.com>

The SNAPSHOT_SET_SWAP_AREA is supposed to be used to set the hibernation
offset on a running kernel to enable hibernating to a swap file.
However, it doesn't actually update the swsusp_resume_block variable. As
a result, the hibernation fails at the last step (after all the data is
written out) in the validation of the swap signature in
mark_swapfiles().

Before this patch, the command line processing was the only place where
swsusp_resume_block was set.
[Anchal Agarwal: Changelog: Resolved patch conflict as code fragmented to
snapshot_set_swap_area]
Signed-off-by: Aleksei Besogonov <cyberax@amazon.com>
Signed-off-by: Munehisa Kamata <kamatam@amazon.com>
Signed-off-by: Anchal Agarwal <anchalag@amazon.com>
---
 kernel/power/user.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/kernel/power/user.c b/kernel/power/user.c
index d5eedc2baa2a..704a7173e99c 100644
--- a/kernel/power/user.c
+++ b/kernel/power/user.c
@@ -242,9 +242,12 @@ static int snapshot_set_swap_area(struct snapshot_data *data,
 		return -EINVAL;
 	}
 	data->swap = swap_type_of(swdev, offset, &bdev);
-	if (data->swap < 0)
+	if (data->swap < 0) {
 		return -ENODEV;
-
+	} else {
+		swsusp_resume_device = swdev;
+		swsusp_resume_block = offset;
+	}
 	data->bd_inode = bdev->bd_inode;
 	bdput(bdev);
 	return 0;
-- 
2.16.6


