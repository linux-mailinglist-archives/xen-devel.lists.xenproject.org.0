Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 683407DBBBC
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 15:28:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625151.974132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxTEv-0005vx-Ok; Mon, 30 Oct 2023 14:27:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625151.974132; Mon, 30 Oct 2023 14:27:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxTEv-0005uF-M5; Mon, 30 Oct 2023 14:27:37 +0000
Received: by outflank-mailman (input) for mailman id 625151;
 Mon, 30 Oct 2023 14:27:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ec4L=GM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qxTEu-0005u0-D8
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 14:27:36 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7778af3a-7730-11ee-9b0e-b553b5be7939;
 Mon, 30 Oct 2023 15:27:34 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1AB471FF07;
 Mon, 30 Oct 2023 14:27:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DBD17138F8;
 Mon, 30 Oct 2023 14:27:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4y9JNFW9P2VkQgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 30 Oct 2023 14:27:33 +0000
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
X-Inumbo-ID: 7778af3a-7730-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698676054; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=+x62jf5ZiMaBeXCGaTeI3fAeetzVsKKIlwH9XbYi/Wk=;
	b=DVFbhplYczx0rCQjxOvC9F63FeFl9OHZE7xQlGzpqBW0G7Msl6Bylf1AyraSQmEocHrYIh
	ppCCeVfnXGjDCYZ3hTKI397EhbDm222zDQWg+DtpbWN/rvvhX/wM4T6jNQ55qBgpg7+XIm
	V+0arNif/gGSK5kvLKV7DzQ+XySO2QE=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH] xen/events: avoid using info_for_irq() in xen_send_IPI_one()
Date: Mon, 30 Oct 2023 15:27:32 +0100
Message-Id: <20231030142732.1702-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xen_send_IPI_one() is being used by cpuhp_report_idle_dead() after
it calls rcu_report_dead(), meaning that any RCU usage by
xen_send_IPI_one() is a bad idea.

Unfortunately xen_send_IPI_one() is using notify_remote_via_irq()
today, which is using irq_get_chip_data() via info_for_irq(). And
irq_get_chip_data() in turn is using a maple-tree lookup requiring
RCU.

Avoid this problem by caching the ipi event channels in another
percpu variable, allowing the use notify_remote_via_evtchn() in
xen_send_IPI_one().

Fixes: 721255b9826b ("genirq: Use a maple tree for interrupt descriptor management")
Reported-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Juergen Gross <jgross@suse.com>
Tested-by: David Woodhouse <dwmw@amazon.co.uk>
---
 drivers/xen/events/events_base.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index 1b2136fe0fa5..2cf0c2b69386 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -164,6 +164,8 @@ static DEFINE_PER_CPU(int [NR_VIRQS], virq_to_irq) = {[0 ... NR_VIRQS-1] = -1};
 
 /* IRQ <-> IPI mapping */
 static DEFINE_PER_CPU(int [XEN_NR_IPIS], ipi_to_irq) = {[0 ... XEN_NR_IPIS-1] = -1};
+/* Cache for IPI event channels - needed for hot cpu unplug (avoid RCU usage). */
+static DEFINE_PER_CPU(evtchn_port_t [XEN_NR_IPIS], ipi_to_evtchn) = {[0 ... XEN_NR_IPIS-1] = 0};
 
 /* Event channel distribution data */
 static atomic_t channels_on_cpu[NR_CPUS];
@@ -366,6 +368,7 @@ static int xen_irq_info_ipi_setup(unsigned cpu,
 	info->u.ipi = ipi;
 
 	per_cpu(ipi_to_irq, cpu)[ipi] = irq;
+	per_cpu(ipi_to_evtchn, cpu)[ipi] = evtchn;
 
 	return xen_irq_info_common_setup(info, irq, IRQT_IPI, evtchn, 0);
 }
@@ -981,6 +984,7 @@ static void __unbind_from_irq(unsigned int irq)
 			break;
 		case IRQT_IPI:
 			per_cpu(ipi_to_irq, cpu)[ipi_from_irq(irq)] = -1;
+			per_cpu(ipi_to_evtchn, cpu)[ipi_from_irq(irq)] = 0;
 			break;
 		case IRQT_EVTCHN:
 			dev = info->u.interdomain;
@@ -1631,7 +1635,7 @@ EXPORT_SYMBOL_GPL(evtchn_put);
 
 void xen_send_IPI_one(unsigned int cpu, enum ipi_vector vector)
 {
-	int irq;
+	evtchn_port_t evtchn;
 
 #ifdef CONFIG_X86
 	if (unlikely(vector == XEN_NMI_VECTOR)) {
@@ -1642,9 +1646,9 @@ void xen_send_IPI_one(unsigned int cpu, enum ipi_vector vector)
 		return;
 	}
 #endif
-	irq = per_cpu(ipi_to_irq, cpu)[vector];
-	BUG_ON(irq < 0);
-	notify_remote_via_irq(irq);
+	evtchn = per_cpu(ipi_to_evtchn, cpu)[vector];
+	BUG_ON(evtchn == 0);
+	notify_remote_via_evtchn(evtchn);
 }
 
 struct evtchn_loop_ctrl {
-- 
2.35.3


