Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 887182D670B
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 20:42:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49700.87908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knRph-0007dc-J1; Thu, 10 Dec 2020 19:42:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49700.87908; Thu, 10 Dec 2020 19:42:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knRph-0007cN-E0; Thu, 10 Dec 2020 19:42:33 +0000
Received: by outflank-mailman (input) for mailman id 49700;
 Thu, 10 Dec 2020 19:42:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hbU1=FO=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1knRpf-0007OY-Cn
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 19:42:31 +0000
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 37bf2da7-5f6e-44d6-b7ea-6278350e7d51;
 Thu, 10 Dec 2020 19:42:25 +0000 (UTC)
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
X-Inumbo-ID: 37bf2da7-5f6e-44d6-b7ea-6278350e7d51
Message-Id: <20201210194043.362094758@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1607629344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=xI8ipC8kVjJGltjSHu5Mwub/dbA42XKOSuIg0xDxbuM=;
	b=D/de10U4HoG38vblr7IeySKjPU1LbUwG6rWRmeGYZrTiPhh//Hh7l/GxJreJ0rFcvzRPJy
	uoauNylV8dWf/MoltroGmVGhvJ2oJ5Y1i1Hdh3B/UY4mD9pwH+y7Dg4V+Vuar0V4FZXmUS
	6T9k0+65HYvYSEKNJ4TVXxdcFWWUmHXiCvk5q873lejGHd1ZF8kDnbNFZOuvndA/bZ6hqk
	upKi4g8D5MCEBYYTgyELzJKcRa+JlxwqpINFEbwiyouRus62LMleSD5uCsPspz8eEzaopF
	eLafHsQRj846r/5tje8mdg+dCV5YsColFl6docNWF4RiFgqrORcZz2o154ST/Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1607629344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=xI8ipC8kVjJGltjSHu5Mwub/dbA42XKOSuIg0xDxbuM=;
	b=uhk8uY0rFu42URnjai4w+dmeZE7ul5z78imfPTBVOwBrf5zNSXRAMP26aad4ZYcrnfPUQU
	IQRkkJ1oiqPOXJDw==
Date: Thu, 10 Dec 2020 20:25:44 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Marc Zyngier <maz@kernel.org>,
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
 Leon Romanovsky <leon@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Subject: [patch 08/30] genirq: Provide kstat_irqdesc_cpu()
References: <20201210192536.118432146@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit

Most users of kstat_irqs_cpu() have the irq descriptor already. No point in
calling into the core code and looking it up once more.

Use it in per_cpu_count_show() to start with.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 include/linux/irqdesc.h |    6 ++++++
 kernel/irq/irqdesc.c    |    4 ++--
 2 files changed, 8 insertions(+), 2 deletions(-)

--- a/include/linux/irqdesc.h
+++ b/include/linux/irqdesc.h
@@ -113,6 +113,12 @@ static inline void irq_unlock_sparse(voi
 extern struct irq_desc irq_desc[NR_IRQS];
 #endif
 
+static inline unsigned int irq_desc_kstat_cpu(struct irq_desc *desc,
+					      unsigned int cpu)
+{
+	return desc->kstat_irqs ? *per_cpu_ptr(desc->kstat_irqs, cpu) : 0;
+}
+
 static inline struct irq_desc *irq_data_to_desc(struct irq_data *data)
 {
 	return container_of(data->common, struct irq_desc, irq_common_data);
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -147,12 +147,12 @@ static ssize_t per_cpu_count_show(struct
 				  struct kobj_attribute *attr, char *buf)
 {
 	struct irq_desc *desc = container_of(kobj, struct irq_desc, kobj);
-	int cpu, irq = desc->irq_data.irq;
 	ssize_t ret = 0;
 	char *p = "";
+	int cpu;
 
 	for_each_possible_cpu(cpu) {
-		unsigned int c = kstat_irqs_cpu(irq, cpu);
+		unsigned int c = irq_desc_kstat_cpu(desc, cpu);
 
 		ret += scnprintf(buf + ret, PAGE_SIZE - ret, "%s%u", p, c);
 		p = ",";


