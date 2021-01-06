Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 529352EC08B
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jan 2021 16:40:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62536.110825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxAvF-0004uq-H5; Wed, 06 Jan 2021 15:40:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62536.110825; Wed, 06 Jan 2021 15:40:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxAvF-0004u3-DB; Wed, 06 Jan 2021 15:40:29 +0000
Received: by outflank-mailman (input) for mailman id 62536;
 Wed, 06 Jan 2021 15:40:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/BkQ=GJ=merlin.srs.infradead.org=batv+c1eea7d49f76ef5ed0ab+6345+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1kxAvD-0004s7-8O
 for xen-devel@lists.xenproject.org; Wed, 06 Jan 2021 15:40:27 +0000
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7a4a58f0-5a76-4283-9804-a772858c7929;
 Wed, 06 Jan 2021 15:40:17 +0000 (UTC)
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxAuo-00024J-KG; Wed, 06 Jan 2021 15:40:02 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1kxAul-002S1y-UC; Wed, 06 Jan 2021 15:39:59 +0000
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
X-Inumbo-ID: 7a4a58f0-5a76-4283-9804-a772858c7929
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=syx4fu3vYSlHpqPUTOPP75qBiFyto3EbQNXax9AAeb0=; b=xKAr8/0ohLyi2mlUlvnEt/4XWH
	9QauMDlcKsgnTjsJ0u/YPo+PsLVRWU0XolK6AHZgJPqpPGGFJh/4Ckh0pEacbapZh98vSu/Fl1yrg
	5AvBda+9raTYEqCxBnGKKVeNc26HZvEZlYzTVKASbZokmDAZqPOep23QNP9Fi/VkJKnykKlGQZ/Uu
	In9L0Xw296oo5R8h0Lpe+aN4SCkUSv9frEy3wdJX99PwvZZ4o9L/l681OBgaqYUgCOfGZ2xkPwNo/
	1DpNnuDxS0VvYIVz3vYYvIhmBDKjHvvIzf3FHSlnCCc9OpJbix73kOLhqtTg1GGopg9V4dEFlOUkS
	rpREujGg==;
From: David Woodhouse <dwmw2@infradead.org>
To: x86@kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Paul Durrant <pdurrant@amazon.com>,
	jgrall@amazon.com,
	karahmed@amazon.de,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH v3 2/5] xen: Set platform PCI device INTX affinity to CPU0
Date: Wed,  6 Jan 2021 15:39:55 +0000
Message-Id: <20210106153958.584169-3-dwmw2@infradead.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210106153958.584169-1-dwmw2@infradead.org>
References: <20210106153958.584169-1-dwmw2@infradead.org>
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
Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
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
2.29.2


