Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C896B0083F
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jul 2025 18:12:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1039687.1411412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZtrn-0002Dk-W4; Thu, 10 Jul 2025 16:11:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1039687.1411412; Thu, 10 Jul 2025 16:11:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZtrn-0002B9-T0; Thu, 10 Jul 2025 16:11:23 +0000
Received: by outflank-mailman (input) for mailman id 1039687;
 Thu, 10 Jul 2025 16:11:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kaax=ZX=bounce.vates.tech=bounce-md_30504962.686fe623.v1-59dbc2ee3c7c49f99d0503c1f0948e3c@srs-se1.protection.inumbo.net>)
 id 1uZtrm-0002Az-Kl
 for xen-devel@lists.xenproject.org; Thu, 10 Jul 2025 16:11:22 +0000
Received: from mail179-35.suw41.mandrillapp.com
 (mail179-35.suw41.mandrillapp.com [198.2.179.35])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82043bab-5da8-11f0-b894-0df219b8e170;
 Thu, 10 Jul 2025 18:11:17 +0200 (CEST)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-35.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4bdKb76ljYzDRJDYx
 for <xen-devel@lists.xenproject.org>; Thu, 10 Jul 2025 16:11:15 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 59dbc2ee3c7c49f99d0503c1f0948e3c; Thu, 10 Jul 2025 16:11:15 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 82043bab-5da8-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1752163875; x=1752433875;
	bh=feMVCJgbIoW/2JKF5VbU/EMcy3sKQtR6uhqO7PUwLAw=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=DEh3D7ybX/FlvPmVf7YZV3N4OSE8dNmOQfDEpMyebBmMDEsMOwgi2GZswHyBum5vM
	 8vuHBnhGDxTDaZCtJqFI4qlpiXeekCtqagytadSqaxjy4OxNTH9ZYxc1s3GczNlyQ4
	 Jl3WsnMNJPD8Y1A5bY+eBrjJQyVR+tbrT+re7mSCg77e3inEGESAvDvnB/xJkA6wrf
	 eqPpwO2PJmiPtC0Cm3pxkVEZFdxDA2EtImQh78p2SpY/ozV3MJ85xxM3hinWpQpAGX
	 OJVp8hcF2Gf4gspsEMNDFjG9/uFFxoe9wF+4jl4NFSI1QiKGoRi8P8CmLGCi4yFYy/
	 DBHdkB8rqz67Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1752163875; x=1752424375; i=anthoine.bourgeois@vates.tech;
	bh=feMVCJgbIoW/2JKF5VbU/EMcy3sKQtR6uhqO7PUwLAw=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=MYB6pyFM0mxxkD1g+8D+aNUcUX8uSQyNNISkU5INEW4YTsLIPrZ+9W2D46dgFYKQV
	 z2GzkeFdy5Fng0YvMR2006DGay+OjxulBq+ILA316/zAYYjxc+XujsY+nrAucFWFsB
	 9xhgXY0ALM0gNeBW1SPO5LxEGobvBMm/zz8RQI7tj9IJc1ZBNliNCN3a1XOKxeHj3k
	 2S7eBQ6ZVZD+SpKUgBCCviZUj3nZ6JHWCeI8D6jTVgQ6TT2OrBvZL6xXgj8opgRLbW
	 dg/zYoDZCnQYgsqw9fEiovQlst9SWcVtLEr1O2f4+VWDe3Mgj7te31BwAzcjraaq5a
	 NP+TuA5tB04pQ==
From: "Anthoine Bourgeois" <anthoine.bourgeois@vates.tech>
Subject: =?utf-8?Q?[PATCH]=20xen/netfront:=20Fix=20TX=20response=20spurious=20interrupts?=
X-Mailer: git-send-email 2.49.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1752163874892
To: xen-devel@lists.xenproject.org
Cc: "Juergen Gross" <jgross@suse.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Oleksandr Tyshchenko" <oleksandr_tyshchenko@epam.com>, "Anthoine Bourgeois" <anthoine.bourgeois@vates.tech>
Message-Id: <20250710161029.3773630-1-anthoine.bourgeois@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.59dbc2ee3c7c49f99d0503c1f0948e3c?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250710:md
Date: Thu, 10 Jul 2025 16:11:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

We found at Vates that there are lot of spurious interrupts when
benchmarking the PV drivers of Xen. This issue appeared with a patch
that addresses security issue XSA-391 (see Fixes below). On an iperf
benchmark, spurious interrupts can represent up to 50% of the
interrupts.

Spurious interrupts are interrupts that are rised for nothing, there is
no work to do. This appends because the function that handles the
interrupts ("xennet_tx_buf_gc") is also called at the end of the request
path to garbage collect the responses received during the transmission
load.

The request path is doing the work that the interrupt handler should
have done otherwise. This is particurary true when there is more than
one vcpu and get worse linearly with the number of vcpu/queue.

Moreover, this problem is amplifyed by the penalty imposed by a spurious
interrupt. When an interrupt is found spurious the interrupt chip will
delay the EOI to slowdown the backend. This delay will allow more
responses to be handled by the request path and then there will be more
chance the next interrupt will not find any work to do, creating a new
spurious interrupt.

This causes performance issue. The solution here is to remove the calls
from the request path and let the interrupt handler do the processing of
the responses. This approch removes spurious interrupts (<0.05%) and
also has the benefit of freeing up cycles in the request path, allowing
it to process more work, which improves performance compared to masking
the spurious interrupt one way or another.

Some vif throughput performance figures from a 8 vCPUs, 4GB of RAM HVM
guest(s):

Without this patch on the :
vm -> dom0: 4.5Gb/s
vm -> vm:   7.0Gb/s

Without XSA-391 patch (revert of b27d47950e48):
vm -> dom0: 8.3Gb/s
vm -> vm:   8.7Gb/s

With XSA-391 and this patch:
vm -> dom0: 11.5Gb/s
vm -> vm:   12.6Gb/s

Fixes: b27d47950e48 ("xen/netfront: harden netfront against event channel storms")
Signed-off-by: Anthoine Bourgeois <anthoine.bourgeois@vates.tech>
---
 drivers/net/xen-netfront.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
index 9bac50963477..a11a0e949400 100644
--- a/drivers/net/xen-netfront.c
+++ b/drivers/net/xen-netfront.c
@@ -638,8 +638,6 @@ static int xennet_xdp_xmit_one(struct net_device *dev,
 	tx_stats->packets++;
 	u64_stats_update_end(&tx_stats->syncp);
 
-	xennet_tx_buf_gc(queue);
-
 	return 0;
 }
 
@@ -849,9 +847,6 @@ static netdev_tx_t xennet_start_xmit(struct sk_buff *skb, struct net_device *dev
 	tx_stats->packets++;
 	u64_stats_update_end(&tx_stats->syncp);
 
-	/* Note: It is not safe to access skb after xennet_tx_buf_gc()! */
-	xennet_tx_buf_gc(queue);
-
 	if (!netfront_tx_slot_available(queue))
 		netif_tx_stop_queue(netdev_get_tx_queue(dev, queue->id));
 
-- 
2.49.1



Anthoine Bourgeois | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


