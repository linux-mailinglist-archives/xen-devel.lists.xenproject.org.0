Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E74662D6714
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 20:43:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49727.88004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knRq7-0008PR-Dp; Thu, 10 Dec 2020 19:42:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49727.88004; Thu, 10 Dec 2020 19:42:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knRq7-0008OO-8c; Thu, 10 Dec 2020 19:42:59 +0000
Received: by outflank-mailman (input) for mailman id 49727;
 Thu, 10 Dec 2020 19:42:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hbU1=FO=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1knRq5-0007NY-I7
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 19:42:57 +0000
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c23bcf1d-1939-42b0-b0e3-72b6d5ff8c3a;
 Thu, 10 Dec 2020 19:42:32 +0000 (UTC)
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
X-Inumbo-ID: c23bcf1d-1939-42b0-b0e3-72b6d5ff8c3a
Message-Id: <20201210194043.862572239@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1607629351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=JhTeD+U5tH7aZNj19fhxsRS/YgkGW74hooJZTJtUYG8=;
	b=kakkmibZTWswSOf57jMSc/btXnxa6RB0Oxv9VvloZSQtIG4WkM/MftbHazL1ObfAX1q6u6
	v9EgNe5gwBKYjRSGkjE0PSwHQU5J90KEPnfCKLss4hKXmA7Bkc/E+T/2WPZaHEkFR4i+UO
	QdX6JJ+VHkGH1egGtgEd0+oJvfTVSCCs6O0nmczsu900db4+znQu/4DZ0ZqIrtnAutI7sP
	lL8sGEqmceEeKou2jRcjeSLimqt3xaebgyRNSKG8cou2Ox4v3oxNWhwx9YCjoUSMJE+bd8
	k+CDY3uhTourxMY6j19wud6jiqrZu7xtNFwliIMKmsBQdSHoUGcZxQdzt+oYyw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1607629351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=JhTeD+U5tH7aZNj19fhxsRS/YgkGW74hooJZTJtUYG8=;
	b=plOxIMbVY4CH/4Uw1Dak+ev4LYX0asa/YH9Oe3KWiQVB69dEiGhbzcOFTb0+Om9wD47q90
	EKL6tVW8YPmeHADg==
Date: Thu, 10 Dec 2020 20:25:49 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Marc Zyngier <maz@kernel.org>,
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
 Leon Romanovsky <leon@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Subject:
 [patch 13/30] drm/i915/lpe_audio: Remove pointless irq_to_desc() usage
References: <20201210192536.118432146@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit

Nothing uses the result and nothing should ever use it in driver code.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Wambui Karuga <wambui.karugax@gmail.com>
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/i915/display/intel_lpe_audio.c |    4 ----
 1 file changed, 4 deletions(-)

--- a/drivers/gpu/drm/i915/display/intel_lpe_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_lpe_audio.c
@@ -297,13 +297,9 @@ int intel_lpe_audio_init(struct drm_i915
  */
 void intel_lpe_audio_teardown(struct drm_i915_private *dev_priv)
 {
-	struct irq_desc *desc;
-
 	if (!HAS_LPE_AUDIO(dev_priv))
 		return;
 
-	desc = irq_to_desc(dev_priv->lpe_audio.irq);
-
 	lpe_audio_platdev_destroy(dev_priv);
 
 	irq_free_desc(dev_priv->lpe_audio.irq);


