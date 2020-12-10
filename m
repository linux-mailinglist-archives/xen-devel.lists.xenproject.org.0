Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E5A2D6762
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 20:51:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49772.88073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knRxw-0001iy-17; Thu, 10 Dec 2020 19:51:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49772.88073; Thu, 10 Dec 2020 19:51:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knRxv-0001hM-G4; Thu, 10 Dec 2020 19:51:03 +0000
Received: by outflank-mailman (input) for mailman id 49772;
 Thu, 10 Dec 2020 19:51:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hbU1=FO=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1knRr3-0007NY-Jj
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 19:43:57 +0000
Received: from galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1eb2b85e-8e26-421b-abcf-ae18cb7e2d27;
 Thu, 10 Dec 2020 19:42:45 +0000 (UTC)
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
X-Inumbo-ID: 1eb2b85e-8e26-421b-abcf-ae18cb7e2d27
Message-Id: <20201210194044.972064156@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1607629364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=9YlyTwMk4Mbfk7ZW8GDEykvPqsqe5qocY/DN2nXVexA=;
	b=hVw3OYCTWsMz0Aw61IHODSqZTydWtjxPDClGGC7iGCBQqFWidRe56rShTgIEwhvft2xxVQ
	M/YlcKaOAyEQXPl7Q3R3E32QqIuTfXQ19MYqHX2sGJ83TqbX6MyS7Wtr2e++pcbRAgNdOI
	cVxo/p5uF7/AAg7bzLR09pxbrsczA1ufWBrFzi+yYRMMnxIdHGVV8b25XSGFqMhhM/ZLfS
	qYZkmMDMAVG+a+Dk/ioVTw4ujul3+CsBK60KEwLQOzocKe9FTUxmnyQhV7MVP4FyuTzzdh
	Mx0/OtbsUm0nXPbmcxdV1KpjnJXXPfi7+2ISytWZAwaHiml7fGtt4XCeI+DnvA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1607629364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=9YlyTwMk4Mbfk7ZW8GDEykvPqsqe5qocY/DN2nXVexA=;
	b=TDoY6kDn3fqOFjjhxcsd3OY1zWrz3aQ6qRhKrymB7SphyJoO4N2U2VRY7uCgEKkn/QVPql
	uhJWWeP2DlMdL5CA==
Date: Thu, 10 Dec 2020 20:26:00 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Marc Zyngier <maz@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org,
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
 Jon Mason <jdmason@kudzu.us>,
 Dave Jiang <dave.jiang@intel.com>,
 Allen Hubbe <allenbh@gmail.com>,
 linux-ntb@googlegroups.com,
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
 Leon Romanovsky <leon@kernel.org>
Subject: [patch 24/30] xen/events: Remove unused bind_evtchn_to_irq_lateeoi()
References: <20201210192536.118432146@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
---
 drivers/xen/events/events_base.c |    6 ------
 1 file changed, 6 deletions(-)

--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -1132,12 +1132,6 @@ int bind_evtchn_to_irq(evtchn_port_t evt
 }
 EXPORT_SYMBOL_GPL(bind_evtchn_to_irq);
 
-int bind_evtchn_to_irq_lateeoi(evtchn_port_t evtchn)
-{
-	return bind_evtchn_to_irq_chip(evtchn, &xen_lateeoi_chip);
-}
-EXPORT_SYMBOL_GPL(bind_evtchn_to_irq_lateeoi);
-
 static int bind_ipi_to_irq(unsigned int ipi, unsigned int cpu)
 {
 	struct evtchn_bind_ipi bind_ipi;


