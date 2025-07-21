Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 645F1B0C063
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 11:35:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051287.1419603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udmvF-0005ui-Nx; Mon, 21 Jul 2025 09:35:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051287.1419603; Mon, 21 Jul 2025 09:35:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udmvF-0005sd-KQ; Mon, 21 Jul 2025 09:35:01 +0000
Received: by outflank-mailman (input) for mailman id 1051287;
 Mon, 21 Jul 2025 09:35:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2HWq=2C=bounce.vates.tech=bounce-md_30504962.687e09be.v1-71c929cf14ce40778317d5867205d26a@srs-se1.protection.inumbo.net>)
 id 1udmvE-0005sX-R2
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 09:35:00 +0000
Received: from mail13.wdc04.mandrillapp.com (mail13.wdc04.mandrillapp.com
 [205.201.139.13]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f59c5d96-6615-11f0-b894-0df219b8e170;
 Mon, 21 Jul 2025 11:34:55 +0200 (CEST)
Received: from pmta16.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail13.wdc04.mandrillapp.com (Mailchimp) with ESMTP id 4blwGk32bfzNCd98F
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jul 2025 09:34:54 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 71c929cf14ce40778317d5867205d26a; Mon, 21 Jul 2025 09:34:54 +0000
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
X-Inumbo-ID: f59c5d96-6615-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1753090494; x=1753360494;
	bh=pzhiMITcrf85hN71FsV2AGWriyLD4v+u3soCymoWcEw=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=UKaXS/GxHa2u1yL/yYflHC7mRWyyoz29FHFn0qLrx044WxwVyV9Ijy256Ha4g5MjT
	 L8hDgDUA1MwerYxRkDT25Cl/Vg4bx1mIlFlc8sCP64UtW71/vS1J13qQw1J906hn7F
	 dOeejB634HM8fMekjsh1FyNI5pmBa3dWYGO753CTxcg75lai9HyB+lH3ircaJQk8jW
	 jDWV++D2prEwNijh4CYAtwLGbL90RY4UgYtyL6AnL8v5igPiGQG22sEL35TQJ6PXO9
	 CegVAGya890u4l7ccod7EOtXG04OLnLYYq54mCQ9+GCicXK3nhmtoyzhpB0rQza2zz
	 rFds5cfsHiMTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1753090494; x=1753350994; i=anthoine.bourgeois@vates.tech;
	bh=pzhiMITcrf85hN71FsV2AGWriyLD4v+u3soCymoWcEw=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=WIghZZxQr4UIoSLkl2yYnjQkpHAs5k685c+/3gAysrnInvcohVmZOth6SphBBzmGB
	 FPZ0Ro3b3a2/u5vl38Ad9knxat5K6eifHVPgoGdi5DeAqwM1jIOwiJ4TOKdmomMURu
	 4M1sZSxv9nfs44RTiksl4qbUjR4l+KRMcgF6U1NdyDtawngWfk7AnZwLUxrLm5cdBb
	 qqEpqKWG1qeUWTRtsJ6lVcvAJpjVZO1FbmFjBVuIH2juIwKT7VJoEn56GVBFzC47DN
	 3FD47Hp7mbApbDbtvyU2GTDUD2S9suoMshNEGjrC/GDqgkus4GJ3UcvUeB9PYBmUCH
	 +1r0K7dKluasg==
From: "Anthoine Bourgeois" <anthoine.bourgeois@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v3]=20xen/netfront:=20Fix=20TX=20response=20spurious=20interrupts?=
X-Mailer: git-send-email 2.49.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1753090492977
To: "Juergen Gross" <jgross@suse.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Oleksandr Tyshchenko" <oleksandr_tyshchenko@epam.com>, "Wei Liu" <wei.liu@kernel.org>, "Paul Durrant" <paul@xen.org>, "Jakub Kicinski" <kuba@kernel.org>, xen-devel@lists.xenproject.org, netdev@vger.kernel.org
Cc: "Anthoine Bourgeois" <anthoine.bourgeois@vates.tech>, "Elliott Mitchell" <ehem+xen@m5p.com>
Message-Id: <20250721093316.23560-1-anthoine.bourgeois@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.71c929cf14ce40778317d5867205d26a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250721:md
Date: Mon, 21 Jul 2025 09:34:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

We found at Vates that there are lot of spurious interrupts when
benchmarking the xen-net PV driver frontend. This issue appeared with a
patch that addresses security issue XSA-391 (b27d47950e48 "xen/netfront:
harden netfront against event channel storms"). On an iperf benchmark,
spurious interrupts can represent up to 50% of the interrupts.

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
the responses. This approch removes most of the spurious interrupts
(<0.05%) and also has the benefit of freeing up cycles in the request
path, allowing it to process more work, which improves performance
compared to masking the spurious interrupt one way or another.

This optimization changes a part of the code that is present since the
net frontend driver was upstreamed. There is no similar pattern in the
other xen PV drivers. Since the first commit of xen-netfront is a blob
that doesn't explain all the design choices I can only guess why this
specific mecanism was here. This could have been introduce to compensate
a slow backend at the time (maybe the backend was fixed or optimize
later) or a small queue. In 18 years, both frontend and backend gain lot
of features and optimizations that could have obsolete the feature of
reaping completions from the TX path.

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

v2:
- add revewed and tested by tags
- resend with the maintainers in the recipients list

v3:
- remove Fixes tag but keep the commit ref in the explanation
- add a paragraph on why this code was here

Signed-off-by: Anthoine Bourgeois <anthoine.bourgeois@vates.tech>
Reviewed-by: Juergen Gross <jgross@suse.com>
Tested-by: Elliott Mitchell <ehem+xen@m5p.com>
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


