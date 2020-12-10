Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1122D6768
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 20:51:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49794.88147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knRy8-0002H8-1T; Thu, 10 Dec 2020 19:51:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49794.88147; Thu, 10 Dec 2020 19:51:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knRy7-0002Ed-Ne; Thu, 10 Dec 2020 19:51:15 +0000
Received: by outflank-mailman (input) for mailman id 49794;
 Thu, 10 Dec 2020 19:51:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hbU1=FO=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1knRqP-0007NY-J0
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 19:43:17 +0000
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8a68b993-5ffe-439a-904f-8daff40c5728;
 Thu, 10 Dec 2020 19:42:37 +0000 (UTC)
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
X-Inumbo-ID: 8a68b993-5ffe-439a-904f-8daff40c5728
Message-Id: <20201210194044.255887860@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1607629356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=jUTg4Los1VXz05PCBCDed5HfB12tsGaOsCncsAJwQxU=;
	b=FXhZkYaxbEPy5U+kiVcqwCILOgmOw0n9WJerjpKGSfIyXXxkGyaPiRB5bUJw5/1GbQgK84
	3A3wne9ZskCGrHeBheov/UfaaJAXbhd6XuPaKkHQLZx3IXEKB8JWAfbiz9XVlErPWxhUds
	+BYgAnfA922lpGMT6q/hi+YidzMFXq4opliKvrzDffBcg9VA3r5bNxQxfXyUW8GfN7ZxEw
	tJHtK1YV9651CgrvRnAV+LL92Mn76NESJ20TqtKaDrLgHsHJdq2p3Erxm3ONWn5WeohH8D
	ygiFGZbw1MfYSBaQqVR0RpRK1HywIevKDTa8/tVw8wl8XT4OGsw2hu9prW3gNg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1607629356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=jUTg4Los1VXz05PCBCDed5HfB12tsGaOsCncsAJwQxU=;
	b=jZYO6UEfS1fO8jTBQSg6h2JwtIawA4Pop19pbpdb83G7Islx2MDh7VNX5bpTao8FSicjDK
	BnzPlnU4fVkD+gBg==
Date: Thu, 10 Dec 2020 20:25:53 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Marc Zyngier <maz@kernel.org>,
 Jon Mason <jdmason@kudzu.us>,
 Dave Jiang <dave.jiang@intel.com>,
 Allen Hubbe <allenbh@gmail.com>,
 linux-ntb@googlegroups.com,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>,
 afzal mohammed <afzal.mohd.ma@gmail.com>,
 linux-parisc@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Wambui Karuga <wambui.karugax@gmail.com>,
 intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-gpio@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Michal Simek <michal.simek@xilinx.com>,
 linux-pci@vger.kernel.org,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
 Tariq Toukan <tariqt@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org,
 linux-rdma@vger.kernel.org,
 Saeed Mahameed <saeedm@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Subject: [patch 17/30] NTB/msi: Use irq_has_action()
References: <20201210192536.118432146@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit

Use the proper core function.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Jon Mason <jdmason@kudzu.us>
Cc: Dave Jiang <dave.jiang@intel.com>
Cc: Allen Hubbe <allenbh@gmail.com>
Cc: linux-ntb@googlegroups.com
---
 drivers/ntb/msi.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

--- a/drivers/ntb/msi.c
+++ b/drivers/ntb/msi.c
@@ -282,15 +282,13 @@ int ntbm_msi_request_threaded_irq(struct
 				  struct ntb_msi_desc *msi_desc)
 {
 	struct msi_desc *entry;
-	struct irq_desc *desc;
 	int ret;
 
 	if (!ntb->msi)
 		return -EINVAL;
 
 	for_each_pci_msi_entry(entry, ntb->pdev) {
-		desc = irq_to_desc(entry->irq);
-		if (desc->action)
+		if (irq_has_action(entry->irq))
 			continue;
 
 		ret = devm_request_threaded_irq(&ntb->dev, entry->irq, handler,


