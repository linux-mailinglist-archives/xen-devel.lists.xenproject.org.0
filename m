Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 359992E2686
	for <lists+xen-devel@lfdr.de>; Thu, 24 Dec 2020 12:54:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58702.103425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksPBq-0002as-RR; Thu, 24 Dec 2020 11:53:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58702.103425; Thu, 24 Dec 2020 11:53:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksPBq-0002aR-Nu; Thu, 24 Dec 2020 11:53:54 +0000
Received: by outflank-mailman (input) for mailman id 58702;
 Thu, 24 Dec 2020 11:53:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Kri=F4=merlin.srs.infradead.org=batv+2cb6e212460c613e05ba+6332+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1ksPBp-0002WC-8w
 for xen-devel@lists.xenproject.org; Thu, 24 Dec 2020 11:53:53 +0000
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b450edf5-14d2-46e0-beb6-64d5732f1582;
 Thu, 24 Dec 2020 11:53:38 +0000 (UTC)
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksPBO-0002az-Hj; Thu, 24 Dec 2020 11:53:26 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1ksPBN-00Er3m-GF; Thu, 24 Dec 2020 11:53:25 +0000
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
X-Inumbo-ID: b450edf5-14d2-46e0-beb6-64d5732f1582
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=zk4UYemafseG/MJkQtPNYJOGxL13WedQ005wS02nvsk=; b=YOiTNNDVcCi71gJnkmi5I3nAWT
	/Q+4A66AfywOS5VtbWG0k9kR9csEvksh+dtmcviONDQRV0FOeJYD0jhbhteng8kgZBlfOz0TeQ55F
	BaqqZZQltTwzcRvUPQx0i5SQLoxdMUDqQ9RnrSOsWQisrlZv9688B7ZvgZXKzf2Qt408OkxqGbFkU
	T2u91UjRw3E7CxBwaYQVqKoBlEFVFUlAVnvunwhcfs011ctXe/fiRuOZNy1av1UuV9dwQZFscuAOi
	srq+n/nKV5lmXdVWisRMJS/KxR50shTeTftbnTFSu9YUf08ajZl0Og9nI7nsHQzk0ZAp/WX3YjPip
	PqCvHiZA==;
From: David Woodhouse <dwmw2@infradead.org>
To: x86@kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Paul Durrant <pdurrant@amazon.com>,
	jgrall@amazon.com,
	karahmed@amazon.de,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 2/5] xen: Set platform PCI device INTX affinity to CPU0
Date: Thu, 24 Dec 2020 11:53:20 +0000
Message-Id: <20201224115323.3540130-3-dwmw2@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201224115323.3540130-1-dwmw2@infradead.org>
References: <20201224115323.3540130-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by merlin.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

With INTX or GSI delivery, Xen uses the event channel structures of CPU0.

If the interrupt gets handled by Linux on a different CPU, then no events
are seen as pending. Rather than introducing locking to allow other CPUs
to process CPU0's events, just ensure that the PCI interrupts happens
only on CPU0.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 drivers/xen/platform-pci.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/xen/platform-pci.c b/drivers/xen/platform-pci.c
index 9db557b76511..18f0ed8b1f93 100644
--- a/drivers/xen/platform-pci.c
+++ b/drivers/xen/platform-pci.c
@@ -132,6 +132,13 @@ static int platform_pci_probe(struct pci_dev *pdev,
 			dev_warn(&pdev->dev, "request_irq failed err=%d\n", ret);
 			goto out;
 		}
+		/*
+		 * It doesn't strictly *have* to run on CPU0 but it sure
+		 * as hell better process the event channel ports delivered
+		 * to CPU0.
+		 */
+		irq_set_affinity(pdev->irq, cpumask_of(0));
+
 		callback_via = get_callback_via(pdev);
 		ret = xen_set_callback_via(callback_via);
 		if (ret) {
-- 
2.26.2


