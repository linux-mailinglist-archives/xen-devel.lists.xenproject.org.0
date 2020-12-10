Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A1D2D676A
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 20:51:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49805.88172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knRyD-0002W9-P5; Thu, 10 Dec 2020 19:51:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49805.88172; Thu, 10 Dec 2020 19:51:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knRyD-0002UJ-AL; Thu, 10 Dec 2020 19:51:21 +0000
Received: by outflank-mailman (input) for mailman id 49805;
 Thu, 10 Dec 2020 19:51:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hbU1=FO=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1knRqK-0007NY-Ig
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 19:43:12 +0000
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe533430-b33d-4087-a011-f3a1e3dfc651;
 Thu, 10 Dec 2020 19:42:34 +0000 (UTC)
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
X-Inumbo-ID: fe533430-b33d-4087-a011-f3a1e3dfc651
Message-Id: <20201210194044.065003856@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1607629353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=fEH7SfFXgNBjB2KnJKxA/TzRUtcjVN/8Utn6le7GAgY=;
	b=jLhcNWAI6/f0h7r8+rFxJO/huD0wZGw+D4hiyZeoGMMj1an/mYZLtmxjGnZ/aSu9ajxbNk
	p75pL7pZYF9lDXL6k6cLxjzZOwC5q8ecIjJ39xF/dSPObsyqM+yudoL9yN0v7780Bn5yyF
	/Ve3t66EmBeMbc9BsRyBF2dkjfBuqeDKx8lYvDouLXZuAf0vFtIPH5zU4jlfdixs/IVdOS
	vmsr5U63fIVzglTEhwYSxzXESekgTuzdOHcprErKfUMwbSexx9oDdfFa+4Z1VcZaNX5rSu
	6l8HXwdp3e4RNwPr1pyTZfpMenA4zfmUQEoZ4/oyxWsRJm8zIR/y6ojvGi9aNQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1607629353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=fEH7SfFXgNBjB2KnJKxA/TzRUtcjVN/8Utn6le7GAgY=;
	b=vcq9ylrl3bvEPVRyLq7+7uNgnxo0i4JU/giqH4jOxFiIi2uv7Mz1SZNae4Tgp0yDwrMR2T
	GgsHxKk5w8TyzfBQ==
Date: Thu, 10 Dec 2020 20:25:51 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Marc Zyngier <maz@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>,
 afzal mohammed <afzal.mohd.ma@gmail.com>,
 linux-parisc@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>,
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
 Leon Romanovsky <leon@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Subject: [patch 15/30] pinctrl: nomadik: Use irq_has_action()
References: <20201210192536.118432146@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit

Let the core code do the fiddling with irq_desc.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
---
 drivers/pinctrl/nomadik/pinctrl-nomadik.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -948,7 +948,6 @@ static void nmk_gpio_dbg_show_one(struct
 			   (mode < 0) ? "unknown" : modes[mode]);
 	} else {
 		int irq = chip->to_irq(chip, offset);
-		struct irq_desc	*desc = irq_to_desc(irq);
 		const int pullidx = pull ? 1 : 0;
 		int val;
 		static const char * const pulls[] = {
@@ -969,7 +968,7 @@ static void nmk_gpio_dbg_show_one(struct
 		 * This races with request_irq(), set_irq_type(),
 		 * and set_irq_wake() ... but those are "rare".
 		 */
-		if (irq > 0 && desc && desc->action) {
+		if (irq > 0 && irq_has_action(irq)) {
 			char *trigger;
 
 			if (nmk_chip->edge_rising & BIT(offset))


