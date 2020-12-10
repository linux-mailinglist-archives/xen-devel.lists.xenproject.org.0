Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C91D22D6769
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 20:51:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49801.88160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knRyC-0002RV-1S; Thu, 10 Dec 2020 19:51:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49801.88160; Thu, 10 Dec 2020 19:51:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knRyB-0002Ps-MO; Thu, 10 Dec 2020 19:51:19 +0000
Received: by outflank-mailman (input) for mailman id 49801;
 Thu, 10 Dec 2020 19:51:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hbU1=FO=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1knRqZ-0007NY-It
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 19:43:27 +0000
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4c6e5196-7580-4ef1-982b-c587c955aa15;
 Thu, 10 Dec 2020 19:42:40 +0000 (UTC)
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
X-Inumbo-ID: 4c6e5196-7580-4ef1-982b-c587c955aa15
Message-Id: <20201210194044.580936243@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1607629359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=KrhhIjbt5v6ZrRAi/JobWuMkwODXuYkNejeEJ8r5wYA=;
	b=O2jdDNolMgwdeqbdehl1p9TNp5CMFEegQIULELNgmYRztgIcL4c3f02Qf6SlZ5l3g40OIQ
	RgS4jJlX+w2xWwCBcvE8uOXoWkE+AICi/Nh5GaOHSq9qtJLjJ382ImsNRhJ2OXUKqHjpIF
	I8MjuSPpVTKBCKMHB0jWJJqdHHehIe0RI7sKzCawI6DUxBj2zGutPRs1VZRztMy0HnwSsf
	OI5cZWwaKtKyxElh00AwZXcb13cApJGdpe1cNRwNFz3Ty/Mas6lCOq0rRGjsr5nCkNgDIf
	ZfeC1Cgjfe3pwIQtGOuNMnkwwWQv4/tiKJan+K2zSJCygXvLKALGPkNvkXEO8Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1607629359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=KrhhIjbt5v6ZrRAi/JobWuMkwODXuYkNejeEJ8r5wYA=;
	b=AYssMWVwzMPlm7xFPvozIcusMMzaZeOC4IJgbRnnFFntYh+XGLTcZ4I1FH/Z2XIwzAjKaN
	H21cttJmA1LtW+AQ==
Date: Thu, 10 Dec 2020 20:25:56 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Marc Zyngier <maz@kernel.org>,
 Tariq Toukan <tariqt@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org,
 linux-rdma@vger.kernel.org,
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
 Saeed Mahameed <saeedm@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Subject: [patch 20/30] net/mlx4: Replace irq_to_desc() abuse
References: <20201210192536.118432146@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit

No driver has any business with the internals of an interrupt
descriptor. Storing a pointer to it just to use yet another helper at the
actual usage site to retrieve the affinity mask is creative at best. Just
because C does not allow encapsulation does not mean that the kernel has no
limits.

Retrieve a pointer to the affinity mask itself and use that. It's still
using an interface which is usually not for random drivers, but definitely
less hideous than the previous hack.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Tariq Toukan <tariqt@nvidia.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org
Cc: linux-rdma@vger.kernel.org
---
 drivers/net/ethernet/mellanox/mlx4/en_cq.c   |    8 +++-----
 drivers/net/ethernet/mellanox/mlx4/en_rx.c   |    6 +-----
 drivers/net/ethernet/mellanox/mlx4/mlx4_en.h |    3 ++-
 3 files changed, 6 insertions(+), 11 deletions(-)

--- a/drivers/net/ethernet/mellanox/mlx4/en_cq.c
+++ b/drivers/net/ethernet/mellanox/mlx4/en_cq.c
@@ -90,7 +90,7 @@ int mlx4_en_activate_cq(struct mlx4_en_p
 			int cq_idx)
 {
 	struct mlx4_en_dev *mdev = priv->mdev;
-	int err = 0;
+	int irq, err = 0;
 	int timestamp_en = 0;
 	bool assigned_eq = false;
 
@@ -116,10 +116,8 @@ int mlx4_en_activate_cq(struct mlx4_en_p
 
 			assigned_eq = true;
 		}
-
-		cq->irq_desc =
-			irq_to_desc(mlx4_eq_get_irq(mdev->dev,
-						    cq->vector));
+		irq = mlx4_eq_get_irq(mdev->dev, cq->vector);
+		cq->aff_mask = irq_get_affinity_mask(irq);
 	} else {
 		/* For TX we use the same irq per
 		ring we assigned for the RX    */
--- a/drivers/net/ethernet/mellanox/mlx4/en_rx.c
+++ b/drivers/net/ethernet/mellanox/mlx4/en_rx.c
@@ -959,8 +959,6 @@ int mlx4_en_poll_rx_cq(struct napi_struc
 
 	/* If we used up all the quota - we're probably not done yet... */
 	if (done == budget || !clean_complete) {
-		const struct cpumask *aff;
-		struct irq_data *idata;
 		int cpu_curr;
 
 		/* in case we got here because of !clean_complete */
@@ -969,10 +967,8 @@ int mlx4_en_poll_rx_cq(struct napi_struc
 		INC_PERF_COUNTER(priv->pstats.napi_quota);
 
 		cpu_curr = smp_processor_id();
-		idata = irq_desc_get_irq_data(cq->irq_desc);
-		aff = irq_data_get_affinity_mask(idata);
 
-		if (likely(cpumask_test_cpu(cpu_curr, aff)))
+		if (likely(cpumask_test_cpu(cpu_curr, cq->aff_mask)))
 			return budget;
 
 		/* Current cpu is not according to smp_irq_affinity -
--- a/drivers/net/ethernet/mellanox/mlx4/mlx4_en.h
+++ b/drivers/net/ethernet/mellanox/mlx4/mlx4_en.h
@@ -46,6 +46,7 @@
 #endif
 #include <linux/cpu_rmap.h>
 #include <linux/ptp_clock_kernel.h>
+#include <linux/irq.h>
 #include <net/xdp.h>
 
 #include <linux/mlx4/device.h>
@@ -380,7 +381,7 @@ struct mlx4_en_cq {
 	struct mlx4_cqe *buf;
 #define MLX4_EN_OPCODE_ERROR	0x1e
 
-	struct irq_desc *irq_desc;
+	const struct cpumask *aff_mask;
 };
 
 struct mlx4_en_port_profile {


