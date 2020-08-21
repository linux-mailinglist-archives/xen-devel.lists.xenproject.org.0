Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A715024CF52
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 09:33:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k91Y6-0000M3-7j; Fri, 21 Aug 2020 07:33:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vzen=B7=gmail.com=s.temerkhanov@srs-us1.protection.inumbo.net>)
 id 1k91HS-00077h-2s
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 07:16:06 +0000
X-Inumbo-ID: 70041df4-d035-466a-adc2-e1923de49e7f
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 70041df4-d035-466a-adc2-e1923de49e7f;
 Fri, 21 Aug 2020 07:16:04 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id w14so769949ljj.4
 for <xen-devel@lists.xenproject.org>; Fri, 21 Aug 2020 00:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R5LvF+FXIYK74SzU8s1JkLQ+20EIn2gdeOP8bqSNnws=;
 b=KbnPir9Ko/8G9LGwbfxgVBmutzyI9PXi5r89FlO9OLx4IhRffRtdssa2Swm5sL85Qa
 od8JqLD/Lm/spxun18JLlmY806wUxkfauxuX6jX4bFN5OzH7XMZ7FfPF3K+cgZPnLHWw
 0PhjNKX9hBPFfuqAmFBF8HJfdkQydW6e70NxK9uTerYkvo9JBJMMAqMpAB+crYMVktf2
 YJF9rbPbtXukx22Z5iMQCnEcNqdToQ2xKOMw8YJ6Z/6uGRN4uj5KiK0ss0Ifv5pOtGBL
 wW3vCm9bPY8ppP7NTUynV47wYHdZOMbEMxPQrp1lVaqMxmTxYOMvkAbxye7nOyWH+cT+
 GB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R5LvF+FXIYK74SzU8s1JkLQ+20EIn2gdeOP8bqSNnws=;
 b=U9ZBZ/H7R/E1lmd1cBrIx/0eW6/jcS74fzHKgR0GE6E+GO3HuNstk5bYO3dHTroz11
 nkGBwsopDhVL96RNgaiN9XN/M/dirGu6Ldwo2f63pSeVnKkDxgOf1nbZm5T/iGKjlNEL
 N1pgw6dbGM3lgSLiE3dQnrRH/ERD6feqHlo9YhAZ8Rf6LfrniO/pdbjQ0g0YrEHQt8qt
 iJzEyECPu/8Dv6CA1SRcQaM5a6A747JgjDtKsSpYAtBsOoI4LRd2B1mpFm/hTzO4hb+s
 ct+G9ZgT8i1U3QCIFMVnoeRtppt+51q/SQQ/jbCCfYoQQmqP21+75Qj8hoAxspEUZw2V
 9mFw==
X-Gm-Message-State: AOAM5300dxDCotvcfZT3CakbhRehTWmM3kCLu2zzSAU0zLs08gb8aRMp
 BQTED/XWefiz0mbhOWt7AItnkg8iqyk=
X-Google-Smtp-Source: ABdhPJxO8WEK6PR73S0F+M3tforMJ6wiF8jLmAea0N5KGAVyWHz3woRvOvUtVnrv6A4uUbsKO9dXaw==
X-Received: by 2002:a2e:2c0e:: with SMTP id s14mr931405ljs.28.1597994163275;
 Fri, 21 Aug 2020 00:16:03 -0700 (PDT)
Received: from DESKTOP-D7CKA1V.localdomain ([109.252.108.2])
 by smtp.googlemail.com with ESMTPSA id z3sm202059ljz.109.2020.08.21.00.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 00:16:02 -0700 (PDT)
From: Sergey Temerkhanov <s.temerkhanov@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Sergey Temerkhanov <s.temerkhanov@gmail.com>
Subject: [PATCH 1/2] Xen: Use a dedicated irq_info structure pointer
Date: Fri, 21 Aug 2020 10:15:46 +0300
Message-Id: <20200821071547.18894-2-s.temerkhanov@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200821071547.18894-1-s.temerkhanov@gmail.com>
References: <CAMmSBy9-cJuxC0jLPh6O-UCraThzg2wvNO29ZvxrBmVkatt_sg@mail.gmail.com>
 <20200821071547.18894-1-s.temerkhanov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 21 Aug 2020 07:33:16 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Use a dedicated irq_info structure pointer to avoid conflicts
with other parts of the kernel code

Signed-off-by: Sergey Temerkhanov <s.temerkhanov@gmail.com>
---
 drivers/xen/events/events_base.c | 62 +++++++++++++++-----------------
 include/linux/irq.h              | 15 ++++++++
 kernel/irq/chip.c                | 14 ++++++++
 3 files changed, 57 insertions(+), 34 deletions(-)

diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index 8d49b91d92cd..bcc3af399016 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -151,12 +151,6 @@ int get_evtchn_to_irq(unsigned evtchn)
 	return evtchn_to_irq[EVTCHN_ROW(evtchn)][EVTCHN_COL(evtchn)];
 }
 
-/* Get info for IRQ */
-struct irq_info *info_for_irq(unsigned irq)
-{
-	return irq_get_handler_data(irq);
-}
-
 /* Constructors for packed IRQ information. */
 static int xen_irq_info_common_setup(struct irq_info *info,
 				     unsigned irq,
@@ -185,7 +179,7 @@ static int xen_irq_info_common_setup(struct irq_info *info,
 static int xen_irq_info_evtchn_setup(unsigned irq,
 				     unsigned evtchn)
 {
-	struct irq_info *info = info_for_irq(irq);
+	struct irq_info *info = xen_get_irq_info(irq);
 
 	return xen_irq_info_common_setup(info, irq, IRQT_EVTCHN, evtchn, 0);
 }
@@ -195,7 +189,7 @@ static int xen_irq_info_ipi_setup(unsigned cpu,
 				  unsigned evtchn,
 				  enum ipi_vector ipi)
 {
-	struct irq_info *info = info_for_irq(irq);
+	struct irq_info *info = xen_get_irq_info(irq);
 
 	info->u.ipi = ipi;
 
@@ -209,7 +203,7 @@ static int xen_irq_info_virq_setup(unsigned cpu,
 				   unsigned evtchn,
 				   unsigned virq)
 {
-	struct irq_info *info = info_for_irq(irq);
+	struct irq_info *info = xen_get_irq_info(irq);
 
 	info->u.virq = virq;
 
@@ -225,7 +219,7 @@ static int xen_irq_info_pirq_setup(unsigned irq,
 				   uint16_t domid,
 				   unsigned char flags)
 {
-	struct irq_info *info = info_for_irq(irq);
+	struct irq_info *info = xen_get_irq_info(irq);
 
 	info->u.pirq.pirq = pirq;
 	info->u.pirq.gsi = gsi;
@@ -249,7 +243,7 @@ unsigned int evtchn_from_irq(unsigned irq)
 	if (unlikely(WARN(irq >= nr_irqs, "Invalid irq %d!\n", irq)))
 		return 0;
 
-	return info_for_irq(irq)->evtchn;
+	return xen_get_irq_info(irq)->evtchn;
 }
 
 unsigned irq_from_evtchn(unsigned int evtchn)
@@ -265,7 +259,7 @@ int irq_from_virq(unsigned int cpu, unsigned int virq)
 
 static enum ipi_vector ipi_from_irq(unsigned irq)
 {
-	struct irq_info *info = info_for_irq(irq);
+	struct irq_info *info = xen_get_irq_info(irq);
 
 	BUG_ON(info == NULL);
 	BUG_ON(info->type != IRQT_IPI);
@@ -275,7 +269,7 @@ static enum ipi_vector ipi_from_irq(unsigned irq)
 
 static unsigned virq_from_irq(unsigned irq)
 {
-	struct irq_info *info = info_for_irq(irq);
+	struct irq_info *info = xen_get_irq_info(irq);
 
 	BUG_ON(info == NULL);
 	BUG_ON(info->type != IRQT_VIRQ);
@@ -285,7 +279,7 @@ static unsigned virq_from_irq(unsigned irq)
 
 static unsigned pirq_from_irq(unsigned irq)
 {
-	struct irq_info *info = info_for_irq(irq);
+	struct irq_info *info = xen_get_irq_info(irq);
 
 	BUG_ON(info == NULL);
 	BUG_ON(info->type != IRQT_PIRQ);
@@ -295,12 +289,12 @@ static unsigned pirq_from_irq(unsigned irq)
 
 static enum xen_irq_type type_from_irq(unsigned irq)
 {
-	return info_for_irq(irq)->type;
+	return xen_get_irq_info(irq)->type;
 }
 
 unsigned cpu_from_irq(unsigned irq)
 {
-	return info_for_irq(irq)->cpu;
+	return xen_get_irq_info(irq)->cpu;
 }
 
 unsigned int cpu_from_evtchn(unsigned int evtchn)
@@ -323,7 +317,7 @@ static bool pirq_check_eoi_map(unsigned irq)
 
 static bool pirq_needs_eoi_flag(unsigned irq)
 {
-	struct irq_info *info = info_for_irq(irq);
+	struct irq_info *info = xen_get_irq_info(irq);
 	BUG_ON(info->type != IRQT_PIRQ);
 
 	return info->u.pirq.flags & PIRQ_NEEDS_EOI;
@@ -332,7 +326,7 @@ static bool pirq_needs_eoi_flag(unsigned irq)
 static void bind_evtchn_to_cpu(unsigned int chn, unsigned int cpu)
 {
 	int irq = get_evtchn_to_irq(chn);
-	struct irq_info *info = info_for_irq(irq);
+	struct irq_info *info = xen_get_irq_info(irq);
 
 	BUG_ON(irq == -1);
 #ifdef CONFIG_SMP
@@ -375,7 +369,7 @@ static void xen_irq_init(unsigned irq)
 	info->type = IRQT_UNBOUND;
 	info->refcnt = -1;
 
-	irq_set_handler_data(irq, info);
+	xen_set_irq_info(irq, info);
 
 	list_add_tail(&info->list, &xen_irq_list_head);
 }
@@ -424,14 +418,14 @@ static int __must_check xen_allocate_irq_gsi(unsigned gsi)
 
 static void xen_free_irq(unsigned irq)
 {
-	struct irq_info *info = irq_get_handler_data(irq);
+	struct irq_info *info = xen_get_irq_info(irq);
 
 	if (WARN_ON(!info))
 		return;
 
 	list_del(&info->list);
 
-	irq_set_handler_data(irq, NULL);
+	xen_set_irq_info(irq, NULL);
 
 	WARN_ON(info->refcnt > 0);
 
@@ -456,7 +450,7 @@ static void xen_evtchn_close(unsigned int port)
 static void pirq_query_unmask(int irq)
 {
 	struct physdev_irq_status_query irq_status;
-	struct irq_info *info = info_for_irq(irq);
+	struct irq_info *info = xen_get_irq_info(irq);
 
 	BUG_ON(info->type != IRQT_PIRQ);
 
@@ -506,7 +500,7 @@ static void mask_ack_pirq(struct irq_data *data)
 static unsigned int __startup_pirq(unsigned int irq)
 {
 	struct evtchn_bind_pirq bind_pirq;
-	struct irq_info *info = info_for_irq(irq);
+	struct irq_info *info = xen_get_irq_info(irq);
 	int evtchn = evtchn_from_irq(irq);
 	int rc;
 
@@ -559,7 +553,7 @@ static unsigned int startup_pirq(struct irq_data *data)
 static void shutdown_pirq(struct irq_data *data)
 {
 	unsigned int irq = data->irq;
-	struct irq_info *info = info_for_irq(irq);
+	struct irq_info *info = xen_get_irq_info(irq);
 	unsigned evtchn = evtchn_from_irq(irq);
 
 	BUG_ON(info->type != IRQT_PIRQ);
@@ -601,7 +595,7 @@ EXPORT_SYMBOL_GPL(xen_irq_from_gsi);
 static void __unbind_from_irq(unsigned int irq)
 {
 	int evtchn = evtchn_from_irq(irq);
-	struct irq_info *info = irq_get_handler_data(irq);
+	struct irq_info *info = xen_get_irq_info(irq);
 
 	if (info->refcnt > 0) {
 		info->refcnt--;
@@ -763,7 +757,7 @@ int xen_bind_pirq_msi_to_irq(struct pci_dev *dev, struct msi_desc *msidesc,
 int xen_destroy_irq(int irq)
 {
 	struct physdev_unmap_pirq unmap_irq;
-	struct irq_info *info = info_for_irq(irq);
+	struct irq_info *info = xen_get_irq_info(irq);
 	int rc = -ENOENT;
 
 	mutex_lock(&irq_mapping_update_lock);
@@ -855,7 +849,7 @@ int bind_evtchn_to_irq(unsigned int evtchn)
 		/* New interdomain events are bound to VCPU 0. */
 		bind_evtchn_to_cpu(evtchn, 0);
 	} else {
-		struct irq_info *info = info_for_irq(irq);
+		struct irq_info *info = xen_get_irq_info(irq);
 		WARN_ON(info == NULL || info->type != IRQT_EVTCHN);
 	}
 
@@ -898,7 +892,7 @@ static int bind_ipi_to_irq(unsigned int ipi, unsigned int cpu)
 		}
 		bind_evtchn_to_cpu(evtchn, cpu);
 	} else {
-		struct irq_info *info = info_for_irq(irq);
+		struct irq_info *info = xen_get_irq_info(irq);
 		WARN_ON(info == NULL || info->type != IRQT_IPI);
 	}
 
@@ -1001,7 +995,7 @@ int bind_virq_to_irq(unsigned int virq, unsigned int cpu, bool percpu)
 
 		bind_evtchn_to_cpu(evtchn, cpu);
 	} else {
-		struct irq_info *info = info_for_irq(irq);
+		struct irq_info *info = xen_get_irq_info(irq);
 		WARN_ON(info == NULL || info->type != IRQT_VIRQ);
 	}
 
@@ -1105,7 +1099,7 @@ int bind_ipi_to_irqhandler(enum ipi_vector ipi,
 
 void unbind_from_irqhandler(unsigned int irq, void *dev_id)
 {
-	struct irq_info *info = irq_get_handler_data(irq);
+	struct irq_info *info = xen_get_irq_info(irq);
 
 	if (WARN_ON(!info))
 		return;
@@ -1139,7 +1133,7 @@ int evtchn_make_refcounted(unsigned int evtchn)
 	if (irq == -1)
 		return -ENOENT;
 
-	info = irq_get_handler_data(irq);
+	info = xen_get_irq_info(irq);
 
 	if (!info)
 		return -ENOENT;
@@ -1167,7 +1161,7 @@ int evtchn_get(unsigned int evtchn)
 	if (irq == -1)
 		goto done;
 
-	info = irq_get_handler_data(irq);
+	info = xen_get_irq_info(irq);
 
 	if (!info)
 		goto done;
@@ -1263,7 +1257,7 @@ EXPORT_SYMBOL_GPL(xen_hvm_evtchn_do_upcall);
 /* Rebind a new event channel to an existing irq. */
 void rebind_evtchn_irq(int evtchn, int irq)
 {
-	struct irq_info *info = info_for_irq(irq);
+	struct irq_info *info = xen_get_irq_info(irq);
 
 	if (WARN_ON(!info))
 		return;
@@ -1551,7 +1545,7 @@ void xen_poll_irq(int irq)
 /* Check whether the IRQ line is shared with other guests. */
 int xen_test_irq_shared(int irq)
 {
-	struct irq_info *info = info_for_irq(irq);
+	struct irq_info *info = xen_get_irq_info(irq);
 	struct physdev_irq_status_query irq_status;
 
 	if (WARN_ON(!info))
diff --git a/include/linux/irq.h b/include/linux/irq.h
index 6ecaf056ab63..e094d31916e2 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -123,6 +123,7 @@ enum {
 
 struct msi_desc;
 struct irq_domain;
+struct irq_info;
 
 /**
  * struct irq_common_data - per irq data shared by all irqchips
@@ -153,6 +154,9 @@ struct irq_common_data {
 #ifdef CONFIG_GENERIC_IRQ_IPI
 	unsigned int		ipi_offset;
 #endif
+#ifdef CONFIG_XEN
+	struct irq_info     *xen_irq_info;
+#endif
 };
 
 /**
@@ -849,6 +853,17 @@ struct cpumask *irq_data_get_effective_affinity_mask(struct irq_data *d)
 }
 #endif
 
+#ifdef CONFIG_XEN
+static inline struct irq_info *xen_get_irq_info(unsigned int irq)
+{
+	struct irq_data *d = irq_get_irq_data(irq);
+
+	return d ? d->common->xen_irq_info : NULL;
+}
+
+extern int xen_set_irq_info(unsigned int irq, struct irq_info *data);
+#endif
+
 unsigned int arch_dynirq_lower_bound(unsigned int from);
 
 int __irq_alloc_descs(int irq, unsigned int from, unsigned int cnt, int node,
diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index 09d914e486a2..58d1cf60a4f8 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -163,6 +163,20 @@ struct irq_data *irq_get_irq_data(unsigned int irq)
 }
 EXPORT_SYMBOL_GPL(irq_get_irq_data);
 
+#ifdef CONFIG_XEN
+int xen_set_irq_info(unsigned int irq, struct irq_info *data)
+{
+	unsigned long flags;
+	struct irq_desc *desc = irq_get_desc_lock(irq, &flags, 0);
+
+	if (!desc)
+		return -EINVAL;
+	desc->irq_common_data.xen_irq_info = data;
+	irq_put_desc_unlock(desc, flags);
+	return 0;
+}
+#endif
+
 static void irq_state_clr_disabled(struct irq_desc *desc)
 {
 	irqd_clear(&desc->irq_data, IRQD_IRQ_DISABLED);
-- 
2.26.2


