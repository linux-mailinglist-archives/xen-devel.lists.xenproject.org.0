Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EA22D6764
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 20:51:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49768.88046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knRxu-0001gY-Lk; Thu, 10 Dec 2020 19:51:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49768.88046; Thu, 10 Dec 2020 19:51:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knRxu-0001fj-Dt; Thu, 10 Dec 2020 19:51:02 +0000
Received: by outflank-mailman (input) for mailman id 49768;
 Thu, 10 Dec 2020 19:51:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hbU1=FO=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1knRrN-0007NY-KY
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 19:44:17 +0000
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c030df19-1f76-46a7-946f-e083156fa1d2;
 Thu, 10 Dec 2020 19:42:50 +0000 (UTC)
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
X-Inumbo-ID: c030df19-1f76-46a7-946f-e083156fa1d2
Message-Id: <20201210194045.360198201@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1607629369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=ZlPg9sxtWavWNstOnduWAE0LJ88d0safrspZWU+Bxkw=;
	b=K1DERQLLdTNr2zHRckKSlzdGpOu3K2YNmRf/Fd+Me9xL7e1+z/WEZj2/ktZthj5jq1hRc5
	H3K05V2lxe1VMwzID4A3YLY85G8CYSpDrmB064IUNRFZIZdMGhdgfMMXJmC2dwy27hx5dv
	+8AXgD/DGykOcBz1Xa8j76SRM06+jkTJXOvxx9wVIyXxp695f6gHDGbeeV9JlTl+CV+qJz
	iigE2xdn6yZ1PRpeA5+aMqV0fQZ1NATjbH3H6LTr2G8vwxub7OglAIb7biMKHi/AyccluD
	JT3nn4CWSg161dQ9jAMQEsqATs9zRWVAVD7sNovXx4fL9L9H47Prx2LPtWUjvw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1607629369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=ZlPg9sxtWavWNstOnduWAE0LJ88d0safrspZWU+Bxkw=;
	b=5OkxueAP7qHY2hZdC3q6dEaDkreK0XDmJgigYgkjGtvPF1gC/y/J1hb+Pc7lUaZciQOAo7
	alJrfrmEbNVTr+Cw==
Date: Thu, 10 Dec 2020 20:26:04 +0100
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
Subject: [patch 28/30] xen/events: Reduce irq_info::spurious_cnt storage size
References: <20201210192536.118432146@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit

To prepare for interrupt spreading reduce the storage size of
irq_info::spurious_cnt to u8 so the required flag for the spreading logic
will not increase the storage size.

Protect the usage site against overruns.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
---
 drivers/xen/events/events_base.c |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -95,7 +95,7 @@ struct irq_info {
 	struct list_head list;
 	struct list_head eoi_list;
 	short refcnt;
-	short spurious_cnt;
+	u8 spurious_cnt;
 	enum xen_irq_type type; /* type */
 	unsigned irq;
 	evtchn_port_t evtchn;   /* event channel */
@@ -528,8 +528,10 @@ static void xen_irq_lateeoi_locked(struc
 		return;
 
 	if (spurious) {
-		if ((1 << info->spurious_cnt) < (HZ << 2))
-			info->spurious_cnt++;
+		if ((1 << info->spurious_cnt) < (HZ << 2)) {
+			if (info->spurious_cnt != 0xFF)
+				info->spurious_cnt++;
+		}
 		if (info->spurious_cnt > 1) {
 			delay = 1 << (info->spurious_cnt - 2);
 			if (delay > HZ)


