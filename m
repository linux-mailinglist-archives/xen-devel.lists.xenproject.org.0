Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 707E3295C3E
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 11:49:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10309.27410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVXDn-0004cr-UK; Thu, 22 Oct 2020 09:49:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10309.27410; Thu, 22 Oct 2020 09:49:23 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVXDn-0004cD-Qw; Thu, 22 Oct 2020 09:49:23 +0000
Received: by outflank-mailman (input) for mailman id 10309;
 Thu, 22 Oct 2020 09:49:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dfvK=D5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kVXDl-0004UF-Qc
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 09:49:21 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id abb62816-e269-4a10-99fe-2f5207b54c08;
 Thu, 22 Oct 2020 09:49:11 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 84D3DAE16;
 Thu, 22 Oct 2020 09:49:10 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dfvK=D5=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kVXDl-0004UF-Qc
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 09:49:21 +0000
X-Inumbo-ID: abb62816-e269-4a10-99fe-2f5207b54c08
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id abb62816-e269-4a10-99fe-2f5207b54c08;
	Thu, 22 Oct 2020 09:49:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603360150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JcGWYIUvEotSFKztpkFYqbmREQ/+iyUWzVR4PQ0+LJk=;
	b=FVGKiUpzk67MlNKVh4Iu1U1BNH7HNyRtgob7UIEojDNYRgy5bqCimWkTfFawttBS1JCp1m
	4s/dfZECEcREU0JN4D+kmmZiq44cLh369XQhEphsWT4/d9IWC2x72qR4vqmsrTjRt8YqKn
	lAmPkAY5dIh+SArXdwslzl46isURLSM=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 84D3DAE16;
	Thu, 22 Oct 2020 09:49:10 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 2/5] xen/events: make struct irq_info private to events_base.c
Date: Thu, 22 Oct 2020 11:49:04 +0200
Message-Id: <20201022094907.28560-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201022094907.28560-1-jgross@suse.com>
References: <20201022094907.28560-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The struct irq_info of Xen's event handling is used only for two
evtchn_ops functions outside of events_base.c. Those two functions
can easily be switched to avoid that usage.

This allows to make struct irq_info and its related access functions
private to events_base.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 drivers/xen/events/events_2l.c       |  7 +--
 drivers/xen/events/events_base.c     | 63 ++++++++++++++++++++++---
 drivers/xen/events/events_fifo.c     |  6 +--
 drivers/xen/events/events_internal.h | 70 ++++------------------------
 4 files changed, 73 insertions(+), 73 deletions(-)

diff --git a/drivers/xen/events/events_2l.c b/drivers/xen/events/events_2l.c
index fe5ad0e89cd8..da87f3a1e351 100644
--- a/drivers/xen/events/events_2l.c
+++ b/drivers/xen/events/events_2l.c
@@ -47,10 +47,11 @@ static unsigned evtchn_2l_max_channels(void)
 	return EVTCHN_2L_NR_CHANNELS;
 }
 
-static void evtchn_2l_bind_to_cpu(struct irq_info *info, unsigned cpu)
+static void evtchn_2l_bind_to_cpu(evtchn_port_t evtchn, unsigned int cpu,
+				  unsigned int old_cpu)
 {
-	clear_bit(info->evtchn, BM(per_cpu(cpu_evtchn_mask, info->cpu)));
-	set_bit(info->evtchn, BM(per_cpu(cpu_evtchn_mask, cpu)));
+	clear_bit(evtchn, BM(per_cpu(cpu_evtchn_mask, old_cpu)));
+	set_bit(evtchn, BM(per_cpu(cpu_evtchn_mask, cpu)));
 }
 
 static void evtchn_2l_clear_pending(evtchn_port_t port)
diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index 436682db41c5..1c25580c7691 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -70,6 +70,57 @@
 #undef MODULE_PARAM_PREFIX
 #define MODULE_PARAM_PREFIX "xen."
 
+/* Interrupt types. */
+enum xen_irq_type {
+	IRQT_UNBOUND = 0,
+	IRQT_PIRQ,
+	IRQT_VIRQ,
+	IRQT_IPI,
+	IRQT_EVTCHN
+};
+
+/*
+ * Packed IRQ information:
+ * type - enum xen_irq_type
+ * event channel - irq->event channel mapping
+ * cpu - cpu this event channel is bound to
+ * index - type-specific information:
+ *    PIRQ - vector, with MSB being "needs EIO", or physical IRQ of the HVM
+ *           guest, or GSI (real passthrough IRQ) of the device.
+ *    VIRQ - virq number
+ *    IPI - IPI vector
+ *    EVTCHN -
+ */
+struct irq_info {
+	struct list_head list;
+	struct list_head eoi_list;
+	short refcnt;
+	short spurious_cnt;
+	enum xen_irq_type type; /* type */
+	unsigned irq;
+	evtchn_port_t evtchn;   /* event channel */
+	unsigned short cpu;     /* cpu bound */
+	unsigned short eoi_cpu; /* EOI must happen on this cpu-1 */
+	unsigned int irq_epoch; /* If eoi_cpu valid: irq_epoch of event */
+	u64 eoi_time;           /* Time in jiffies when to EOI. */
+
+	union {
+		unsigned short virq;
+		enum ipi_vector ipi;
+		struct {
+			unsigned short pirq;
+			unsigned short gsi;
+			unsigned char vector;
+			unsigned char flags;
+			uint16_t domid;
+		} pirq;
+	} u;
+};
+
+#define PIRQ_NEEDS_EOI	(1 << 0)
+#define PIRQ_SHAREABLE	(1 << 1)
+#define PIRQ_MSI_GROUP	(1 << 2)
+
 static uint __read_mostly event_loop_timeout = 2;
 module_param(event_loop_timeout, uint, 0644);
 
@@ -110,7 +161,7 @@ static DEFINE_PER_CPU(int [NR_VIRQS], virq_to_irq) = {[0 ... NR_VIRQS-1] = -1};
 /* IRQ <-> IPI mapping */
 static DEFINE_PER_CPU(int [XEN_NR_IPIS], ipi_to_irq) = {[0 ... XEN_NR_IPIS-1] = -1};
 
-int **evtchn_to_irq;
+static int **evtchn_to_irq;
 #ifdef CONFIG_X86
 static unsigned long *pirq_eoi_map;
 #endif
@@ -190,7 +241,7 @@ int get_evtchn_to_irq(evtchn_port_t evtchn)
 }
 
 /* Get info for IRQ */
-struct irq_info *info_for_irq(unsigned irq)
+static struct irq_info *info_for_irq(unsigned irq)
 {
 	if (irq < nr_legacy_irqs())
 		return legacy_info_ptrs[irq];
@@ -228,7 +279,7 @@ static int xen_irq_info_common_setup(struct irq_info *info,
 
 	irq_clear_status_flags(irq, IRQ_NOREQUEST|IRQ_NOAUTOEN);
 
-	return xen_evtchn_port_setup(info);
+	return xen_evtchn_port_setup(evtchn);
 }
 
 static int xen_irq_info_evtchn_setup(unsigned irq,
@@ -351,7 +402,7 @@ static enum xen_irq_type type_from_irq(unsigned irq)
 	return info_for_irq(irq)->type;
 }
 
-unsigned cpu_from_irq(unsigned irq)
+static unsigned cpu_from_irq(unsigned irq)
 {
 	return info_for_irq(irq)->cpu;
 }
@@ -391,7 +442,7 @@ static void bind_evtchn_to_cpu(evtchn_port_t evtchn, unsigned int cpu)
 #ifdef CONFIG_SMP
 	cpumask_copy(irq_get_affinity_mask(irq), cpumask_of(cpu));
 #endif
-	xen_evtchn_port_bind_to_cpu(info, cpu);
+	xen_evtchn_port_bind_to_cpu(evtchn, cpu, info->cpu);
 
 	info->cpu = cpu;
 }
@@ -745,7 +796,7 @@ static unsigned int __startup_pirq(unsigned int irq)
 	info->evtchn = evtchn;
 	bind_evtchn_to_cpu(evtchn, 0);
 
-	rc = xen_evtchn_port_setup(info);
+	rc = xen_evtchn_port_setup(evtchn);
 	if (rc)
 		goto err;
 
diff --git a/drivers/xen/events/events_fifo.c b/drivers/xen/events/events_fifo.c
index 6085a808da95..243e7b6d7b96 100644
--- a/drivers/xen/events/events_fifo.c
+++ b/drivers/xen/events/events_fifo.c
@@ -138,9 +138,8 @@ static void init_array_page(event_word_t *array_page)
 		array_page[i] = 1 << EVTCHN_FIFO_MASKED;
 }
 
-static int evtchn_fifo_setup(struct irq_info *info)
+static int evtchn_fifo_setup(evtchn_port_t port)
 {
-	evtchn_port_t port = info->evtchn;
 	unsigned new_array_pages;
 	int ret;
 
@@ -186,7 +185,8 @@ static int evtchn_fifo_setup(struct irq_info *info)
 	return ret;
 }
 
-static void evtchn_fifo_bind_to_cpu(struct irq_info *info, unsigned cpu)
+static void evtchn_fifo_bind_to_cpu(evtchn_port_t evtchn, unsigned int cpu, 
+				    unsigned int old_cpu)
 {
 	/* no-op */
 }
diff --git a/drivers/xen/events/events_internal.h b/drivers/xen/events/events_internal.h
index 82937d90d7d7..0a97c0549db7 100644
--- a/drivers/xen/events/events_internal.h
+++ b/drivers/xen/events/events_internal.h
@@ -7,65 +7,15 @@
 #ifndef __EVENTS_INTERNAL_H__
 #define __EVENTS_INTERNAL_H__
 
-/* Interrupt types. */
-enum xen_irq_type {
-	IRQT_UNBOUND = 0,
-	IRQT_PIRQ,
-	IRQT_VIRQ,
-	IRQT_IPI,
-	IRQT_EVTCHN
-};
-
-/*
- * Packed IRQ information:
- * type - enum xen_irq_type
- * event channel - irq->event channel mapping
- * cpu - cpu this event channel is bound to
- * index - type-specific information:
- *    PIRQ - vector, with MSB being "needs EIO", or physical IRQ of the HVM
- *           guest, or GSI (real passthrough IRQ) of the device.
- *    VIRQ - virq number
- *    IPI - IPI vector
- *    EVTCHN -
- */
-struct irq_info {
-	struct list_head list;
-	struct list_head eoi_list;
-	short refcnt;
-	short spurious_cnt;
-	enum xen_irq_type type;	/* type */
-	unsigned irq;
-	evtchn_port_t evtchn;	/* event channel */
-	unsigned short cpu;	/* cpu bound */
-	unsigned short eoi_cpu;	/* EOI must happen on this cpu */
-	unsigned int irq_epoch;	/* If eoi_cpu valid: irq_epoch of event */
-	u64 eoi_time;		/* Time in jiffies when to EOI. */
-
-	union {
-		unsigned short virq;
-		enum ipi_vector ipi;
-		struct {
-			unsigned short pirq;
-			unsigned short gsi;
-			unsigned char vector;
-			unsigned char flags;
-			uint16_t domid;
-		} pirq;
-	} u;
-};
-
-#define PIRQ_NEEDS_EOI	(1 << 0)
-#define PIRQ_SHAREABLE	(1 << 1)
-#define PIRQ_MSI_GROUP	(1 << 2)
-
 struct evtchn_loop_ctrl;
 
 struct evtchn_ops {
 	unsigned (*max_channels)(void);
 	unsigned (*nr_channels)(void);
 
-	int (*setup)(struct irq_info *info);
-	void (*bind_to_cpu)(struct irq_info *info, unsigned cpu);
+	int (*setup)(evtchn_port_t port);
+	void (*bind_to_cpu)(evtchn_port_t evtchn, unsigned int cpu,
+			    unsigned int old_cpu);
 
 	void (*clear_pending)(evtchn_port_t port);
 	void (*set_pending)(evtchn_port_t port);
@@ -83,12 +33,9 @@ struct evtchn_ops {
 
 extern const struct evtchn_ops *evtchn_ops;
 
-extern int **evtchn_to_irq;
 int get_evtchn_to_irq(evtchn_port_t evtchn);
 void handle_irq_for_port(evtchn_port_t port, struct evtchn_loop_ctrl *ctrl);
 
-struct irq_info *info_for_irq(unsigned irq);
-unsigned cpu_from_irq(unsigned irq);
 unsigned int cpu_from_evtchn(evtchn_port_t evtchn);
 
 static inline unsigned xen_evtchn_max_channels(void)
@@ -100,17 +47,18 @@ static inline unsigned xen_evtchn_max_channels(void)
  * Do any ABI specific setup for a bound event channel before it can
  * be unmasked and used.
  */
-static inline int xen_evtchn_port_setup(struct irq_info *info)
+static inline int xen_evtchn_port_setup(evtchn_port_t evtchn)
 {
 	if (evtchn_ops->setup)
-		return evtchn_ops->setup(info);
+		return evtchn_ops->setup(evtchn);
 	return 0;
 }
 
-static inline void xen_evtchn_port_bind_to_cpu(struct irq_info *info,
-					       unsigned cpu)
+static inline void xen_evtchn_port_bind_to_cpu(evtchn_port_t evtchn,
+					       unsigned int cpu,
+					       unsigned int old_cpu)
 {
-	evtchn_ops->bind_to_cpu(info, cpu);
+	evtchn_ops->bind_to_cpu(evtchn, cpu, old_cpu);
 }
 
 static inline void clear_evtchn(evtchn_port_t port)
-- 
2.26.2


