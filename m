Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 753C424CF51
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 09:33:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k91Y6-0000M9-Fu; Fri, 21 Aug 2020 07:33:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vzen=B7=gmail.com=s.temerkhanov@srs-us1.protection.inumbo.net>)
 id 1k91HV-00077h-KG
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 07:16:09 +0000
X-Inumbo-ID: 38fba31a-0d91-42c5-96a7-14fcaa7db20b
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 38fba31a-0d91-42c5-96a7-14fcaa7db20b;
 Fri, 21 Aug 2020 07:16:06 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id y2so783637ljc.1
 for <xen-devel@lists.xenproject.org>; Fri, 21 Aug 2020 00:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ntouz4mqsJIKIBHBEvVLTjMGfFesOIb72okjI9Kt9LY=;
 b=c5sFVZvbaJyzJCem/GOSX4t82387ipQ1hfi/szMVh5RCmh5RplZWUpb01Fk9ULKpQ1
 Mrz/PQqlPksojQ6H/3X6uPdGUoG9rmX3M36Ksg3xxUXdwQHfH1tR3uewIadtHwTj8JUI
 xgr0QzKAPdIbqOSgSo1gfdcAreG/7CrUEoR1exjeXFu/VErbr7w22eqfO0MzTGAq455S
 UBiySmhbiKj6VboS7qSpm3gY9gKqiVRt82Nj/+q8d2xhHjNNbL1h1Qs+Ye1hMFrISg7f
 +RbsLtd9moa9peKPtBrXohZDTxHu9XGYC5QAk81aJVwSQ7nJlYjSMwgbz12XNAuR3bV7
 K3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ntouz4mqsJIKIBHBEvVLTjMGfFesOIb72okjI9Kt9LY=;
 b=Mm0fV1ScnYjktcnZUnl7fPMSG73reLFnh39FTbuQdHcs9O/dSEjm6X1kHkERu8OcwN
 6GFi5qmu0XkVPx56aKVrJfTZj6MJ5trYnivoM8zff7439SMiNpMxJZVI2LtKRQA9zNs4
 zWlBbepL8lYILh+84VZYtYkCNl/QpRChAercQDI/erRiXfrqrcjqdYWpmWs0BM1rzuZt
 tmNbcs8QXLtfthm/9loiar+PXPVVwB2V6gB/5Lu8LSI7QNZaI6OhxmwBon8AnyRyvKEP
 C6/vPbR4XymKEFjmXAXSCDyuhEzso4YLqIZEnXxe0PjzqYE6Dpt3A9DWUYJE3PucC++q
 ZXLQ==
X-Gm-Message-State: AOAM530ZhhB8vgUKTLNnRDKe2ppegGaXXBzD3DRbJ3jRQ5zVchKVwMky
 stVWOK2EQQ9yXJq0hwMKnavknjx5mgQ=
X-Google-Smtp-Source: ABdhPJwxCOX1lcAxqrbdMjCXcHI4jDjdzTTSXRCDw5zdvztutfduleY0/xO4lhtaqchic5nssrVTfQ==
X-Received: by 2002:a2e:9e8a:: with SMTP id f10mr843633ljk.330.1597994165226; 
 Fri, 21 Aug 2020 00:16:05 -0700 (PDT)
Received: from DESKTOP-D7CKA1V.localdomain ([109.252.108.2])
 by smtp.googlemail.com with ESMTPSA id z3sm202059ljz.109.2020.08.21.00.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 00:16:04 -0700 (PDT)
From: Sergey Temerkhanov <s.temerkhanov@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Sergey Temerkhanov <s.temerkhanov@gmail.com>
Subject: [PATCH 2/2] Xen: Rename irq_info structure
Date: Fri, 21 Aug 2020 10:15:47 +0300
Message-Id: <20200821071547.18894-3-s.temerkhanov@gmail.com>
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

Rename irq_info structure to xen_irq_info to avoid namespace
conflicts

Signed-off-by: Sergey Temerkhanov <s.temerkhanov@gmail.com>
---
 drivers/xen/events/events_2l.c       |  2 +-
 drivers/xen/events/events_base.c     | 60 ++++++++++++++--------------
 drivers/xen/events/events_fifo.c     |  5 ++-
 drivers/xen/events/events_internal.h | 12 +++---
 include/linux/irq.h                  | 10 +++--
 kernel/irq/chip.c                    |  2 +-
 6 files changed, 47 insertions(+), 44 deletions(-)

diff --git a/drivers/xen/events/events_2l.c b/drivers/xen/events/events_2l.c
index 8edef51c92e5..d4580db315b0 100644
--- a/drivers/xen/events/events_2l.c
+++ b/drivers/xen/events/events_2l.c
@@ -47,7 +47,7 @@ static unsigned evtchn_2l_max_channels(void)
 	return EVTCHN_2L_NR_CHANNELS;
 }
 
-static void evtchn_2l_bind_to_cpu(struct irq_info *info, unsigned cpu)
+static void evtchn_2l_bind_to_cpu(struct xen_irq_info *info, unsigned int cpu)
 {
 	clear_bit(info->evtchn, BM(per_cpu(cpu_evtchn_mask, info->cpu)));
 	set_bit(info->evtchn, BM(per_cpu(cpu_evtchn_mask, cpu)));
diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index bcc3af399016..1e652ea8da87 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -152,7 +152,7 @@ int get_evtchn_to_irq(unsigned evtchn)
 }
 
 /* Constructors for packed IRQ information. */
-static int xen_irq_info_common_setup(struct irq_info *info,
+static int xen_irq_info_common_setup(struct xen_irq_info *info,
 				     unsigned irq,
 				     enum xen_irq_type type,
 				     unsigned evtchn,
@@ -179,7 +179,7 @@ static int xen_irq_info_common_setup(struct irq_info *info,
 static int xen_irq_info_evtchn_setup(unsigned irq,
 				     unsigned evtchn)
 {
-	struct irq_info *info = xen_get_irq_info(irq);
+	struct xen_irq_info *info = xen_get_irq_info(irq);
 
 	return xen_irq_info_common_setup(info, irq, IRQT_EVTCHN, evtchn, 0);
 }
@@ -189,7 +189,7 @@ static int xen_irq_info_ipi_setup(unsigned cpu,
 				  unsigned evtchn,
 				  enum ipi_vector ipi)
 {
-	struct irq_info *info = xen_get_irq_info(irq);
+	struct xen_irq_info *info = xen_get_irq_info(irq);
 
 	info->u.ipi = ipi;
 
@@ -203,7 +203,7 @@ static int xen_irq_info_virq_setup(unsigned cpu,
 				   unsigned evtchn,
 				   unsigned virq)
 {
-	struct irq_info *info = xen_get_irq_info(irq);
+	struct xen_irq_info *info = xen_get_irq_info(irq);
 
 	info->u.virq = virq;
 
@@ -219,7 +219,7 @@ static int xen_irq_info_pirq_setup(unsigned irq,
 				   uint16_t domid,
 				   unsigned char flags)
 {
-	struct irq_info *info = xen_get_irq_info(irq);
+	struct xen_irq_info *info = xen_get_irq_info(irq);
 
 	info->u.pirq.pirq = pirq;
 	info->u.pirq.gsi = gsi;
@@ -229,7 +229,7 @@ static int xen_irq_info_pirq_setup(unsigned irq,
 	return xen_irq_info_common_setup(info, irq, IRQT_PIRQ, evtchn, 0);
 }
 
-static void xen_irq_info_cleanup(struct irq_info *info)
+static void xen_irq_info_cleanup(struct xen_irq_info *info)
 {
 	set_evtchn_to_irq(info->evtchn, -1);
 	info->evtchn = 0;
@@ -259,7 +259,7 @@ int irq_from_virq(unsigned int cpu, unsigned int virq)
 
 static enum ipi_vector ipi_from_irq(unsigned irq)
 {
-	struct irq_info *info = xen_get_irq_info(irq);
+	struct xen_irq_info *info = xen_get_irq_info(irq);
 
 	BUG_ON(info == NULL);
 	BUG_ON(info->type != IRQT_IPI);
@@ -269,7 +269,7 @@ static enum ipi_vector ipi_from_irq(unsigned irq)
 
 static unsigned virq_from_irq(unsigned irq)
 {
-	struct irq_info *info = xen_get_irq_info(irq);
+	struct xen_irq_info *info = xen_get_irq_info(irq);
 
 	BUG_ON(info == NULL);
 	BUG_ON(info->type != IRQT_VIRQ);
@@ -279,7 +279,7 @@ static unsigned virq_from_irq(unsigned irq)
 
 static unsigned pirq_from_irq(unsigned irq)
 {
-	struct irq_info *info = xen_get_irq_info(irq);
+	struct xen_irq_info *info = xen_get_irq_info(irq);
 
 	BUG_ON(info == NULL);
 	BUG_ON(info->type != IRQT_PIRQ);
@@ -317,7 +317,7 @@ static bool pirq_check_eoi_map(unsigned irq)
 
 static bool pirq_needs_eoi_flag(unsigned irq)
 {
-	struct irq_info *info = xen_get_irq_info(irq);
+	struct xen_irq_info *info = xen_get_irq_info(irq);
 	BUG_ON(info->type != IRQT_PIRQ);
 
 	return info->u.pirq.flags & PIRQ_NEEDS_EOI;
@@ -326,7 +326,7 @@ static bool pirq_needs_eoi_flag(unsigned irq)
 static void bind_evtchn_to_cpu(unsigned int chn, unsigned int cpu)
 {
 	int irq = get_evtchn_to_irq(chn);
-	struct irq_info *info = xen_get_irq_info(irq);
+	struct xen_irq_info *info = xen_get_irq_info(irq);
 
 	BUG_ON(irq == -1);
 #ifdef CONFIG_SMP
@@ -356,7 +356,7 @@ EXPORT_SYMBOL_GPL(notify_remote_via_irq);
 
 static void xen_irq_init(unsigned irq)
 {
-	struct irq_info *info;
+	struct xen_irq_info *info;
 #ifdef CONFIG_SMP
 	/* By default all event channels notify CPU#0. */
 	cpumask_copy(irq_get_affinity_mask(irq), cpumask_of(0));
@@ -418,7 +418,7 @@ static int __must_check xen_allocate_irq_gsi(unsigned gsi)
 
 static void xen_free_irq(unsigned irq)
 {
-	struct irq_info *info = xen_get_irq_info(irq);
+	struct xen_irq_info *info = xen_get_irq_data(irq);
 
 	if (WARN_ON(!info))
 		return;
@@ -450,7 +450,7 @@ static void xen_evtchn_close(unsigned int port)
 static void pirq_query_unmask(int irq)
 {
 	struct physdev_irq_status_query irq_status;
-	struct irq_info *info = xen_get_irq_info(irq);
+	struct xen_irq_info *info = xen_get_irq_info(irq);
 
 	BUG_ON(info->type != IRQT_PIRQ);
 
@@ -500,7 +500,7 @@ static void mask_ack_pirq(struct irq_data *data)
 static unsigned int __startup_pirq(unsigned int irq)
 {
 	struct evtchn_bind_pirq bind_pirq;
-	struct irq_info *info = xen_get_irq_info(irq);
+	struct xen_irq_info *info = xen_get_irq_info(irq);
 	int evtchn = evtchn_from_irq(irq);
 	int rc;
 
@@ -553,7 +553,7 @@ static unsigned int startup_pirq(struct irq_data *data)
 static void shutdown_pirq(struct irq_data *data)
 {
 	unsigned int irq = data->irq;
-	struct irq_info *info = xen_get_irq_info(irq);
+	struct xen_irq_info *info = xen_get_irq_info(irq);
 	unsigned evtchn = evtchn_from_irq(irq);
 
 	BUG_ON(info->type != IRQT_PIRQ);
@@ -578,7 +578,7 @@ static void disable_pirq(struct irq_data *data)
 
 int xen_irq_from_gsi(unsigned gsi)
 {
-	struct irq_info *info;
+	struct xen_irq_info *info;
 
 	list_for_each_entry(info, &xen_irq_list_head, list) {
 		if (info->type != IRQT_PIRQ)
@@ -595,7 +595,7 @@ EXPORT_SYMBOL_GPL(xen_irq_from_gsi);
 static void __unbind_from_irq(unsigned int irq)
 {
 	int evtchn = evtchn_from_irq(irq);
-	struct irq_info *info = xen_get_irq_info(irq);
+	struct xen_irq_info *info = irq_get_handler_data(irq);
 
 	if (info->refcnt > 0) {
 		info->refcnt--;
@@ -757,7 +757,7 @@ int xen_bind_pirq_msi_to_irq(struct pci_dev *dev, struct msi_desc *msidesc,
 int xen_destroy_irq(int irq)
 {
 	struct physdev_unmap_pirq unmap_irq;
-	struct irq_info *info = xen_get_irq_info(irq);
+	struct xen_irq_info *info = xen_get_irq_info(irq);
 	int rc = -ENOENT;
 
 	mutex_lock(&irq_mapping_update_lock);
@@ -795,7 +795,7 @@ int xen_irq_from_pirq(unsigned pirq)
 {
 	int irq;
 
-	struct irq_info *info;
+	struct xen_irq_info *info;
 
 	mutex_lock(&irq_mapping_update_lock);
 
@@ -849,7 +849,7 @@ int bind_evtchn_to_irq(unsigned int evtchn)
 		/* New interdomain events are bound to VCPU 0. */
 		bind_evtchn_to_cpu(evtchn, 0);
 	} else {
-		struct irq_info *info = xen_get_irq_info(irq);
+		struct xen_irq_info *info = xen_get_irq_info(irq);
 		WARN_ON(info == NULL || info->type != IRQT_EVTCHN);
 	}
 
@@ -892,7 +892,7 @@ static int bind_ipi_to_irq(unsigned int ipi, unsigned int cpu)
 		}
 		bind_evtchn_to_cpu(evtchn, cpu);
 	} else {
-		struct irq_info *info = xen_get_irq_info(irq);
+		struct xen_irq_info *info = xen_get_irq_info(irq);
 		WARN_ON(info == NULL || info->type != IRQT_IPI);
 	}
 
@@ -995,7 +995,7 @@ int bind_virq_to_irq(unsigned int virq, unsigned int cpu, bool percpu)
 
 		bind_evtchn_to_cpu(evtchn, cpu);
 	} else {
-		struct irq_info *info = xen_get_irq_info(irq);
+		struct xen_irq_info *info = xen_get_irq_info(irq);
 		WARN_ON(info == NULL || info->type != IRQT_VIRQ);
 	}
 
@@ -1099,7 +1099,7 @@ int bind_ipi_to_irqhandler(enum ipi_vector ipi,
 
 void unbind_from_irqhandler(unsigned int irq, void *dev_id)
 {
-	struct irq_info *info = xen_get_irq_info(irq);
+	struct xen_irq_info *info = xen_get_irq_info(irq);
 
 	if (WARN_ON(!info))
 		return;
@@ -1128,7 +1128,7 @@ EXPORT_SYMBOL_GPL(xen_set_irq_priority);
 int evtchn_make_refcounted(unsigned int evtchn)
 {
 	int irq = get_evtchn_to_irq(evtchn);
-	struct irq_info *info;
+	struct xen_irq_info *info;
 
 	if (irq == -1)
 		return -ENOENT;
@@ -1149,7 +1149,7 @@ EXPORT_SYMBOL_GPL(evtchn_make_refcounted);
 int evtchn_get(unsigned int evtchn)
 {
 	int irq;
-	struct irq_info *info;
+	struct xen_irq_info *info;
 	int err = -ENOENT;
 
 	if (evtchn >= xen_evtchn_max_channels())
@@ -1257,7 +1257,7 @@ EXPORT_SYMBOL_GPL(xen_hvm_evtchn_do_upcall);
 /* Rebind a new event channel to an existing irq. */
 void rebind_evtchn_irq(int evtchn, int irq)
 {
-	struct irq_info *info = xen_get_irq_info(irq);
+	struct xen_irq_info *info = xen_get_irq_info(irq);
 
 	if (WARN_ON(!info))
 		return;
@@ -1406,7 +1406,7 @@ static void restore_pirqs(void)
 {
 	int pirq, rc, irq, gsi;
 	struct physdev_map_pirq map_irq;
-	struct irq_info *info;
+	struct xen_irq_info *info;
 
 	list_for_each_entry(info, &xen_irq_list_head, list) {
 		if (info->type != IRQT_PIRQ)
@@ -1545,7 +1545,7 @@ void xen_poll_irq(int irq)
 /* Check whether the IRQ line is shared with other guests. */
 int xen_test_irq_shared(int irq)
 {
-	struct irq_info *info = xen_get_irq_info(irq);
+	struct xen_irq_info *info = xen_get_irq_info(irq);
 	struct physdev_irq_status_query irq_status;
 
 	if (WARN_ON(!info))
@@ -1562,7 +1562,7 @@ EXPORT_SYMBOL_GPL(xen_test_irq_shared);
 void xen_irq_resume(void)
 {
 	unsigned int cpu;
-	struct irq_info *info;
+	struct xen_irq_info *info;
 
 	/* New event-channel space is not 'live' yet. */
 	xen_evtchn_resume();
diff --git a/drivers/xen/events/events_fifo.c b/drivers/xen/events/events_fifo.c
index 76b318e88382..7de34caa127a 100644
--- a/drivers/xen/events/events_fifo.c
+++ b/drivers/xen/events/events_fifo.c
@@ -138,7 +138,7 @@ static void init_array_page(event_word_t *array_page)
 		array_page[i] = 1 << EVTCHN_FIFO_MASKED;
 }
 
-static int evtchn_fifo_setup(struct irq_info *info)
+static int evtchn_fifo_setup(struct xen_irq_info *info)
 {
 	unsigned port = info->evtchn;
 	unsigned new_array_pages;
@@ -186,7 +186,8 @@ static int evtchn_fifo_setup(struct irq_info *info)
 	return ret;
 }
 
-static void evtchn_fifo_bind_to_cpu(struct irq_info *info, unsigned cpu)
+static void evtchn_fifo_bind_to_cpu(struct xen_irq_info *info,
+				    unsigned int cpu)
 {
 	/* no-op */
 }
diff --git a/drivers/xen/events/events_internal.h b/drivers/xen/events/events_internal.h
index 50c2050a1e32..26d97a754318 100644
--- a/drivers/xen/events/events_internal.h
+++ b/drivers/xen/events/events_internal.h
@@ -30,7 +30,7 @@ enum xen_irq_type {
  *    IPI - IPI vector
  *    EVTCHN -
  */
-struct irq_info {
+struct xen_irq_info {
 	struct list_head list;
 	int refcnt;
 	enum xen_irq_type type;	/* type */
@@ -59,8 +59,8 @@ struct evtchn_ops {
 	unsigned (*max_channels)(void);
 	unsigned (*nr_channels)(void);
 
-	int (*setup)(struct irq_info *info);
-	void (*bind_to_cpu)(struct irq_info *info, unsigned cpu);
+	int (*setup)(struct xen_irq_info *info);
+	void (*bind_to_cpu)(struct xen_irq_info *info, unsigned int cpu);
 
 	void (*clear_pending)(unsigned port);
 	void (*set_pending)(unsigned port);
@@ -78,7 +78,7 @@ extern const struct evtchn_ops *evtchn_ops;
 extern int **evtchn_to_irq;
 int get_evtchn_to_irq(unsigned int evtchn);
 
-struct irq_info *info_for_irq(unsigned irq);
+struct xen_irq_info *xen_get_irq_info(unsigned int irq);
 unsigned cpu_from_irq(unsigned irq);
 unsigned cpu_from_evtchn(unsigned int evtchn);
 
@@ -91,14 +91,14 @@ static inline unsigned xen_evtchn_max_channels(void)
  * Do any ABI specific setup for a bound event channel before it can
  * be unmasked and used.
  */
-static inline int xen_evtchn_port_setup(struct irq_info *info)
+static inline int xen_evtchn_port_setup(struct xen_irq_info *info)
 {
 	if (evtchn_ops->setup)
 		return evtchn_ops->setup(info);
 	return 0;
 }
 
-static inline void xen_evtchn_port_bind_to_cpu(struct irq_info *info,
+static inline void xen_evtchn_port_bind_to_cpu(struct xen_irq_info *info,
 					       unsigned cpu)
 {
 	evtchn_ops->bind_to_cpu(info, cpu);
diff --git a/include/linux/irq.h b/include/linux/irq.h
index e094d31916e2..0490d0c81820 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -123,7 +123,9 @@ enum {
 
 struct msi_desc;
 struct irq_domain;
-struct irq_info;
+#ifdef CONFIG_XEN
+	struct xen_irq_info;
+#endif
 
 /**
  * struct irq_common_data - per irq data shared by all irqchips
@@ -155,7 +157,7 @@ struct irq_common_data {
 	unsigned int		ipi_offset;
 #endif
 #ifdef CONFIG_XEN
-	struct irq_info     *xen_irq_info;
+	struct xen_irq_info *xen_irq_info;
 #endif
 };
 
@@ -854,14 +856,14 @@ struct cpumask *irq_data_get_effective_affinity_mask(struct irq_data *d)
 #endif
 
 #ifdef CONFIG_XEN
-static inline struct irq_info *xen_get_irq_info(unsigned int irq)
+static inline struct xen_irq_info *xen_get_irq_info(unsigned int irq)
 {
 	struct irq_data *d = irq_get_irq_data(irq);
 
 	return d ? d->common->xen_irq_info : NULL;
 }
 
-extern int xen_set_irq_info(unsigned int irq, struct irq_info *data);
+extern int xen_set_irq_data(unsigned int irq, struct xen_irq_info *data);
 #endif
 
 unsigned int arch_dynirq_lower_bound(unsigned int from);
diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index 58d1cf60a4f8..427be895ec6e 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -164,7 +164,7 @@ struct irq_data *irq_get_irq_data(unsigned int irq)
 EXPORT_SYMBOL_GPL(irq_get_irq_data);
 
 #ifdef CONFIG_XEN
-int xen_set_irq_info(unsigned int irq, struct irq_info *data)
+int xen_set_irq_data(unsigned int irq, struct xen_irq_info *data)
 {
 	unsigned long flags;
 	struct irq_desc *desc = irq_get_desc_lock(irq, &flags, 0);
-- 
2.26.2


