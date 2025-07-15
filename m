Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F19D2B063FA
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 18:11:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044524.1414610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubiFn-0005vB-Vj; Tue, 15 Jul 2025 16:11:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044524.1414610; Tue, 15 Jul 2025 16:11:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubiFn-0005tD-SO; Tue, 15 Jul 2025 16:11:39 +0000
Received: by outflank-mailman (input) for mailman id 1044524;
 Tue, 15 Jul 2025 16:11:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Poj7=Z4=bounce.vates.tech=bounce-md_30504962.68767db1.v1-e2f595a5e20a41cbbd41d260dfc56079@srs-se1.protection.inumbo.net>)
 id 1ubiFl-0005t5-P8
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 16:11:37 +0000
Received: from mail179-35.suw41.mandrillapp.com
 (mail179-35.suw41.mandrillapp.com [198.2.179.35])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e15fff4-6196-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 18:11:30 +0200 (CEST)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-35.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4bhPM53L78zDRHx9G
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 16:11:29 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 e2f595a5e20a41cbbd41d260dfc56079; Tue, 15 Jul 2025 16:11:29 +0000
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
X-Inumbo-ID: 5e15fff4-6196-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1752595889; x=1752865889;
	bh=ES5jwX9dQor6Si9bkkhIPkIUgo1wrvr/KsnR/l+M9QM=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=C751+lZk86imdeILVZHpZWGn7iyDDHxefCjlvGBsGIl8TpsmQIFL6XUD1ZH8vfp4a
	 e0VTaEzldARMOhvcjfkNisUFfgYnYwpp/5RZoEvADjDBhsmOOME6BHOp7w1DFQHWDG
	 cCGF4jNukFfgkc+DcJG+7EMw/mSweNSkmGVNChnLfcvUDRxbl3S0MQ4wtU8dMwrZ/4
	 2dA7xTgEgcB04Tvl4QxiJpxgmaOTapgAuFRaJ7/keO61Jmbg4UPa2ZK2PJhX1xvlpb
	 +izaDzX75Dg+XncTJQ6EMIyDfxjHdIbdLIRp9NcvJO7+fLP6DfSkOn2/V1eSYFEO8Z
	 fr/GMLBVnJ5CA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1752595889; x=1752856389; i=anthoine.bourgeois@vates.tech;
	bh=ES5jwX9dQor6Si9bkkhIPkIUgo1wrvr/KsnR/l+M9QM=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=O2xWbEb1hZf11p4VITgku8JweODo0KIQqkDBVvsEvnWdi6pT9673K9QtSbz38uqIW
	 HdL7gr1X6LfU7IzqIYt5sZxBzt7WNfy+sKmKYH+zFYKp0moYubdnNFhN5x3YMyg5qR
	 GVNzi5+Ley8cNgj6SGpXeHmIiJ1Sw+UwU6FdKm6/9KeuVPF/3wm/zYkf/LGpkQrGwd
	 iVnHBVA3kLVAVORfdfQApB/GymVGuR0x5g0rC3fLpY/y3a57NujvsVPqEir63IpcfE
	 xN+/Ne0O0cFzRk3rCIhfVuCQS8OzMVgQZMMa4LvOU6Le7+Vl1DRvtSfXzv+VbPUUx4
	 FNMh1/HSrZmPw==
From: "Anthoine Bourgeois" <anthoine.bourgeois@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v2]=20xen/netfront:=20Fix=20TX=20response=20spurious=20interrupts?=
X-Mailer: git-send-email 2.49.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1752595888301
To: "Juergen Gross" <jgross@suse.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Oleksandr Tyshchenko" <oleksandr_tyshchenko@epam.com>, "Wei Liu" <wei.liu@kernel.org>, "Paul Durrant" <paul@xen.org>, xen-devel@lists.xenproject.org, netdev@vger.kernel.org
Cc: "Anthoine Bourgeois" <anthoine.bourgeois@vates.tech>, "Elliott Mitchell" <ehem+xen@m5p.com>
Message-Id: <20250715160902.578844-2-anthoine.bourgeois@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.e2f595a5e20a41cbbd41d260dfc56079?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250715:md
Date: Tue, 15 Jul 2025 16:11:29 +0000
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

v2:
- add tags
- resend with the maintainers in the recipients list

Fixes: b27d47950e48 ("xen/netfront: harden netfront against event channel storms")
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


