Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA0518F981
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 17:19:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGPjc-0007S4-8s; Mon, 23 Mar 2020 16:15:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zDPB=5I=gmail.com=yyankovskyi@srs-us1.protection.inumbo.net>)
 id 1jGPja-0007Rz-6b
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 16:15:26 +0000
X-Inumbo-ID: 7fcbff8a-6d21-11ea-b34e-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7fcbff8a-6d21-11ea-b34e-bc764e2007e4;
 Mon, 23 Mar 2020 16:15:23 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id z18so15392wmk.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2020 09:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=dK9q3Q94O2osyjPbhuyCuLPxDZe5LnX41Erpc+KPsFs=;
 b=c2eJHVNLiIROpnr43VSYxVLjcsa8KrMBCAc8xM6ZL9fK4jaV7Yh+6NzOxC8DsGnABh
 lFEsOdvDur+yIN8mEkof7QL+O1FjwJhSiqkuVhnTPsUiswxMGCuBCzGI2PA6qMLezlLC
 T7Ye2RXuxoSlFVz9ra6XytD5KL9/14Jh3b108Qxy4xTVAnjMKJJ9DsMn8r3YhUZhKRvv
 iYdstxT9PAFI+l4/p+TzkuYo1LRIx0LUNU8a9ewfJJD1uI+AS0u79dhRTiRzhf73REVh
 GCIrTOIMOCyzCVkIRDuxuQ81tKrxhFwrqfZ5FG9l5UmlIiQgBE8SfS9+kA0jP7AEmJIA
 BwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=dK9q3Q94O2osyjPbhuyCuLPxDZe5LnX41Erpc+KPsFs=;
 b=tmjhvdyPRGlmKH4/LK2LbMsehMDOF215P+clEkDsqFQaDrlGRWoKA1QtOX3AVkapGe
 0X84RRFX1TiKiDxHtW2vGGWwo4wqmNIOPxJ8re8XZKMpMMmf7kgf8ZuC1ihYcscZItgl
 /dOc3672bw3ptVnk0G3Bf97MeUAXC6XxdrAF5H8NDLHQ7MI1wwvVdQPhhWNvqRtb+PeZ
 AcURkpTIkEy7FWtxQ5zL4vDZwkjMFaREtpc00xFr2e3peeQ5UQjRuLaFGgU058V4LDqj
 jApSe8beUehZ2lUvWcf0T5OgKDT79lruDpABp82Ab1Fddv4NHjUmeRofm1kAqLcgMmlG
 8Ykg==
X-Gm-Message-State: ANhLgQ2T4KgR2Rdc3ENJKtqAgAVFvD25cXvlCrjyXDHbJvNqVzs5PsDr
 MDpuvDTkZoChIlYzOzQjS0k=
X-Google-Smtp-Source: ADFU+vunIFrJ+C9vxFIfCAsVjzj4m2fUsGTSU4P7MY6r49roIZecuFuuKMQVyQiyxRgmJJpGUSnvkw==
X-Received: by 2002:a1c:2404:: with SMTP id k4mr27210339wmk.87.1584980120753; 
 Mon, 23 Mar 2020 09:15:20 -0700 (PDT)
Received: from kbp1-lhp-F74019 (ip-109-41-67-112.web.vodafone.de.
 [109.41.67.112])
 by smtp.gmail.com with ESMTPSA id n124sm84534wma.11.2020.03.23.09.15.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 23 Mar 2020 09:15:20 -0700 (PDT)
Date: Mon, 23 Mar 2020 18:15:11 +0200
From: Yan Yankovskyi <yyankovskyi@gmail.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Jan Beulich <jbeulich@suse.com>
Message-ID: <20200323152343.GA28422@kbp1-lhp-F74019>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: [Xen-devel] [PATCH v4 1/2] xen: Use evtchn_type_t as a type for
 event channels
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Make event channel functions pass event channel port using
evtchn_port_t type. It eliminates signed <-> unsigned conversion.

Signed-off-by: Yan Yankovskyi <yyankovskyi@gmail.com>
---
 drivers/xen/events/events_2l.c        | 16 ++---
 drivers/xen/events/events_base.c      | 93 ++++++++++++++-------------
 drivers/xen/events/events_fifo.c      | 22 +++----
 drivers/xen/events/events_internal.h  | 30 ++++-----
 drivers/xen/evtchn.c                  | 13 ++--
 drivers/xen/gntdev-common.h           |  3 +-
 drivers/xen/gntdev.c                  |  2 +-
 drivers/xen/pvcalls-back.c            |  5 +-
 drivers/xen/pvcalls-front.c           | 15 +++--
 drivers/xen/xen-pciback/xenbus.c      |  7 +-
 drivers/xen/xen-scsiback.c            |  3 +-
 drivers/xen/xenbus/xenbus_client.c    |  6 +-
 include/xen/events.h                  | 22 +++----
 include/xen/interface/event_channel.h |  2 +-
 include/xen/xenbus.h                  |  5 +-
 15 files changed, 128 insertions(+), 116 deletions(-)

diff --git a/drivers/xen/events/events_2l.c b/drivers/xen/events/events_2l.c
index 8edef51c92e5..64df919a2111 100644
--- a/drivers/xen/events/events_2l.c
+++ b/drivers/xen/events/events_2l.c
@@ -53,37 +53,37 @@ static void evtchn_2l_bind_to_cpu(struct irq_info *info, unsigned cpu)
 	set_bit(info->evtchn, BM(per_cpu(cpu_evtchn_mask, cpu)));
 }
 
-static void evtchn_2l_clear_pending(unsigned port)
+static void evtchn_2l_clear_pending(evtchn_port_t port)
 {
 	struct shared_info *s = HYPERVISOR_shared_info;
 	sync_clear_bit(port, BM(&s->evtchn_pending[0]));
 }
 
-static void evtchn_2l_set_pending(unsigned port)
+static void evtchn_2l_set_pending(evtchn_port_t port)
 {
 	struct shared_info *s = HYPERVISOR_shared_info;
 	sync_set_bit(port, BM(&s->evtchn_pending[0]));
 }
 
-static bool evtchn_2l_is_pending(unsigned port)
+static bool evtchn_2l_is_pending(evtchn_port_t port)
 {
 	struct shared_info *s = HYPERVISOR_shared_info;
 	return sync_test_bit(port, BM(&s->evtchn_pending[0]));
 }
 
-static bool evtchn_2l_test_and_set_mask(unsigned port)
+static bool evtchn_2l_test_and_set_mask(evtchn_port_t port)
 {
 	struct shared_info *s = HYPERVISOR_shared_info;
 	return sync_test_and_set_bit(port, BM(&s->evtchn_mask[0]));
 }
 
-static void evtchn_2l_mask(unsigned port)
+static void evtchn_2l_mask(evtchn_port_t port)
 {
 	struct shared_info *s = HYPERVISOR_shared_info;
 	sync_set_bit(port, BM(&s->evtchn_mask[0]));
 }
 
-static void evtchn_2l_unmask(unsigned port)
+static void evtchn_2l_unmask(evtchn_port_t port)
 {
 	struct shared_info *s = HYPERVISOR_shared_info;
 	unsigned int cpu = get_cpu();
@@ -173,7 +173,7 @@ static void evtchn_2l_handle_events(unsigned cpu)
 	/* Timer interrupt has highest priority. */
 	irq = irq_from_virq(cpu, VIRQ_TIMER);
 	if (irq != -1) {
-		unsigned int evtchn = evtchn_from_irq(irq);
+		evtchn_port_t evtchn = evtchn_from_irq(irq);
 		word_idx = evtchn / BITS_PER_LONG;
 		bit_idx = evtchn % BITS_PER_LONG;
 		if (active_evtchns(cpu, s, word_idx) & (1ULL << bit_idx))
@@ -228,7 +228,7 @@ static void evtchn_2l_handle_events(unsigned cpu)
 
 		do {
 			xen_ulong_t bits;
-			int port;
+			evtchn_port_t port;
 
 			bits = MASK_LSBS(pending_bits, bit_idx);
 
diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index 499eff7d3f65..3a791c8485d0 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -116,7 +116,7 @@ static void clear_evtchn_to_irq_all(void)
 	}
 }
 
-static int set_evtchn_to_irq(unsigned evtchn, unsigned irq)
+static int set_evtchn_to_irq(evtchn_port_t evtchn, unsigned int irq)
 {
 	unsigned row;
 	unsigned col;
@@ -143,7 +143,7 @@ static int set_evtchn_to_irq(unsigned evtchn, unsigned irq)
 	return 0;
 }
 
-int get_evtchn_to_irq(unsigned evtchn)
+int get_evtchn_to_irq(evtchn_port_t evtchn)
 {
 	if (evtchn >= xen_evtchn_max_channels())
 		return -1;
@@ -162,7 +162,7 @@ struct irq_info *info_for_irq(unsigned irq)
 static int xen_irq_info_common_setup(struct irq_info *info,
 				     unsigned irq,
 				     enum xen_irq_type type,
-				     unsigned evtchn,
+				     evtchn_port_t evtchn,
 				     unsigned short cpu)
 {
 	int ret;
@@ -184,7 +184,7 @@ static int xen_irq_info_common_setup(struct irq_info *info,
 }
 
 static int xen_irq_info_evtchn_setup(unsigned irq,
-				     unsigned evtchn)
+				     evtchn_port_t evtchn)
 {
 	struct irq_info *info = info_for_irq(irq);
 
@@ -193,7 +193,7 @@ static int xen_irq_info_evtchn_setup(unsigned irq,
 
 static int xen_irq_info_ipi_setup(unsigned cpu,
 				  unsigned irq,
-				  unsigned evtchn,
+				  evtchn_port_t evtchn,
 				  enum ipi_vector ipi)
 {
 	struct irq_info *info = info_for_irq(irq);
@@ -207,7 +207,7 @@ static int xen_irq_info_ipi_setup(unsigned cpu,
 
 static int xen_irq_info_virq_setup(unsigned cpu,
 				   unsigned irq,
-				   unsigned evtchn,
+				   evtchn_port_t evtchn,
 				   unsigned virq)
 {
 	struct irq_info *info = info_for_irq(irq);
@@ -220,7 +220,7 @@ static int xen_irq_info_virq_setup(unsigned cpu,
 }
 
 static int xen_irq_info_pirq_setup(unsigned irq,
-				   unsigned evtchn,
+				   evtchn_port_t evtchn,
 				   unsigned pirq,
 				   unsigned gsi,
 				   uint16_t domid,
@@ -245,7 +245,7 @@ static void xen_irq_info_cleanup(struct irq_info *info)
 /*
  * Accessors for packed IRQ information.
  */
-unsigned int evtchn_from_irq(unsigned irq)
+evtchn_port_t evtchn_from_irq(unsigned irq)
 {
 	if (WARN(irq >= nr_irqs, "Invalid irq %d!\n", irq))
 		return 0;
@@ -253,7 +253,7 @@ unsigned int evtchn_from_irq(unsigned irq)
 	return info_for_irq(irq)->evtchn;
 }
 
-unsigned irq_from_evtchn(unsigned int evtchn)
+unsigned int irq_from_evtchn(evtchn_port_t evtchn)
 {
 	return get_evtchn_to_irq(evtchn);
 }
@@ -304,7 +304,7 @@ unsigned cpu_from_irq(unsigned irq)
 	return info_for_irq(irq)->cpu;
 }
 
-unsigned int cpu_from_evtchn(unsigned int evtchn)
+unsigned int cpu_from_evtchn(evtchn_port_t evtchn)
 {
 	int irq = get_evtchn_to_irq(evtchn);
 	unsigned ret = 0;
@@ -330,9 +330,9 @@ static bool pirq_needs_eoi_flag(unsigned irq)
 	return info->u.pirq.flags & PIRQ_NEEDS_EOI;
 }
 
-static void bind_evtchn_to_cpu(unsigned int chn, unsigned int cpu)
+static void bind_evtchn_to_cpu(evtchn_port_t evtchn, unsigned int cpu)
 {
-	int irq = get_evtchn_to_irq(chn);
+	int irq = get_evtchn_to_irq(evtchn);
 	struct irq_info *info = info_for_irq(irq);
 
 	BUG_ON(irq == -1);
@@ -354,7 +354,7 @@ static void bind_evtchn_to_cpu(unsigned int chn, unsigned int cpu)
  */
 void notify_remote_via_irq(int irq)
 {
-	int evtchn = evtchn_from_irq(irq);
+	evtchn_port_t evtchn = evtchn_from_irq(irq);
 
 	if (VALID_EVTCHN(evtchn))
 		notify_remote_via_evtchn(evtchn);
@@ -445,7 +445,7 @@ static void xen_free_irq(unsigned irq)
 	irq_free_desc(irq);
 }
 
-static void xen_evtchn_close(unsigned int port)
+static void xen_evtchn_close(evtchn_port_t port)
 {
 	struct evtchn_close close;
 
@@ -472,7 +472,7 @@ static void pirq_query_unmask(int irq)
 
 static void eoi_pirq(struct irq_data *data)
 {
-	int evtchn = evtchn_from_irq(data->irq);
+	evtchn_port_t evtchn = evtchn_from_irq(data->irq);
 	struct physdev_eoi eoi = { .irq = pirq_from_irq(data->irq) };
 	int rc = 0;
 
@@ -508,7 +508,7 @@ static unsigned int __startup_pirq(unsigned int irq)
 {
 	struct evtchn_bind_pirq bind_pirq;
 	struct irq_info *info = info_for_irq(irq);
-	int evtchn = evtchn_from_irq(irq);
+	evtchn_port_t evtchn = evtchn_from_irq(irq);
 	int rc;
 
 	BUG_ON(info->type != IRQT_PIRQ);
@@ -561,7 +561,7 @@ static void shutdown_pirq(struct irq_data *data)
 {
 	unsigned int irq = data->irq;
 	struct irq_info *info = info_for_irq(irq);
-	unsigned evtchn = evtchn_from_irq(irq);
+	evtchn_port_t evtchn = evtchn_from_irq(irq);
 
 	BUG_ON(info->type != IRQT_PIRQ);
 
@@ -601,7 +601,7 @@ EXPORT_SYMBOL_GPL(xen_irq_from_gsi);
 
 static void __unbind_from_irq(unsigned int irq)
 {
-	int evtchn = evtchn_from_irq(irq);
+	evtchn_port_t evtchn = evtchn_from_irq(irq);
 	struct irq_info *info = irq_get_handler_data(irq);
 
 	if (info->refcnt > 0) {
@@ -827,7 +827,7 @@ int xen_pirq_from_irq(unsigned irq)
 }
 EXPORT_SYMBOL_GPL(xen_pirq_from_irq);
 
-int bind_evtchn_to_irq(unsigned int evtchn)
+int bind_evtchn_to_irq(evtchn_port_t evtchn)
 {
 	int irq;
 	int ret;
@@ -870,8 +870,8 @@ EXPORT_SYMBOL_GPL(bind_evtchn_to_irq);
 static int bind_ipi_to_irq(unsigned int ipi, unsigned int cpu)
 {
 	struct evtchn_bind_ipi bind_ipi;
-	int evtchn, irq;
-	int ret;
+	evtchn_port_t evtchn;
+	int ret, irq;
 
 	mutex_lock(&irq_mapping_update_lock);
 
@@ -909,7 +909,7 @@ static int bind_ipi_to_irq(unsigned int ipi, unsigned int cpu)
 }
 
 int bind_interdomain_evtchn_to_irq(unsigned int remote_domain,
-				   unsigned int remote_port)
+				   evtchn_port_t remote_port)
 {
 	struct evtchn_bind_interdomain bind_interdomain;
 	int err;
@@ -924,10 +924,11 @@ int bind_interdomain_evtchn_to_irq(unsigned int remote_domain,
 }
 EXPORT_SYMBOL_GPL(bind_interdomain_evtchn_to_irq);
 
-static int find_virq(unsigned int virq, unsigned int cpu)
+static int find_virq(unsigned int virq, unsigned int cpu, evtchn_port_t *evtchn)
 {
 	struct evtchn_status status;
-	int port, rc = -ENOENT;
+	evtchn_port_t port;
+	int rc = -ENOENT;
 
 	memset(&status, 0, sizeof(status));
 	for (port = 0; port < xen_evtchn_max_channels(); port++) {
@@ -939,7 +940,7 @@ static int find_virq(unsigned int virq, unsigned int cpu)
 		if (status.status != EVTCHNSTAT_virq)
 			continue;
 		if (status.u.virq == virq && status.vcpu == xen_vcpu_nr(cpu)) {
-			rc = port;
+			*evtchn = port;
 			break;
 		}
 	}
@@ -962,7 +963,8 @@ EXPORT_SYMBOL_GPL(xen_evtchn_nr_channels);
 int bind_virq_to_irq(unsigned int virq, unsigned int cpu, bool percpu)
 {
 	struct evtchn_bind_virq bind_virq;
-	int evtchn, irq, ret;
+	evtchn_port_t evtchn = 0;
+	int irq, ret;
 
 	mutex_lock(&irq_mapping_update_lock);
 
@@ -988,9 +990,8 @@ int bind_virq_to_irq(unsigned int virq, unsigned int cpu, bool percpu)
 			evtchn = bind_virq.port;
 		else {
 			if (ret == -EEXIST)
-				ret = find_virq(virq, cpu);
+				ret = find_virq(virq, cpu, &evtchn);
 			BUG_ON(ret < 0);
-			evtchn = ret;
 		}
 
 		ret = xen_irq_info_virq_setup(cpu, irq, evtchn, virq);
@@ -1019,7 +1020,7 @@ static void unbind_from_irq(unsigned int irq)
 	mutex_unlock(&irq_mapping_update_lock);
 }
 
-int bind_evtchn_to_irqhandler(unsigned int evtchn,
+int bind_evtchn_to_irqhandler(evtchn_port_t evtchn,
 			      irq_handler_t handler,
 			      unsigned long irqflags,
 			      const char *devname, void *dev_id)
@@ -1040,7 +1041,7 @@ int bind_evtchn_to_irqhandler(unsigned int evtchn,
 EXPORT_SYMBOL_GPL(bind_evtchn_to_irqhandler);
 
 int bind_interdomain_evtchn_to_irqhandler(unsigned int remote_domain,
-					  unsigned int remote_port,
+					  evtchn_port_t remote_port,
 					  irq_handler_t handler,
 					  unsigned long irqflags,
 					  const char *devname,
@@ -1132,7 +1133,7 @@ int xen_set_irq_priority(unsigned irq, unsigned priority)
 }
 EXPORT_SYMBOL_GPL(xen_set_irq_priority);
 
-int evtchn_make_refcounted(unsigned int evtchn)
+int evtchn_make_refcounted(evtchn_port_t evtchn)
 {
 	int irq = get_evtchn_to_irq(evtchn);
 	struct irq_info *info;
@@ -1153,7 +1154,7 @@ int evtchn_make_refcounted(unsigned int evtchn)
 }
 EXPORT_SYMBOL_GPL(evtchn_make_refcounted);
 
-int evtchn_get(unsigned int evtchn)
+int evtchn_get(evtchn_port_t evtchn)
 {
 	int irq;
 	struct irq_info *info;
@@ -1186,7 +1187,7 @@ int evtchn_get(unsigned int evtchn)
 }
 EXPORT_SYMBOL_GPL(evtchn_get);
 
-void evtchn_put(unsigned int evtchn)
+void evtchn_put(evtchn_port_t evtchn)
 {
 	int irq = get_evtchn_to_irq(evtchn);
 	if (WARN_ON(irq == -1))
@@ -1252,7 +1253,7 @@ void xen_hvm_evtchn_do_upcall(void)
 EXPORT_SYMBOL_GPL(xen_hvm_evtchn_do_upcall);
 
 /* Rebind a new event channel to an existing irq. */
-void rebind_evtchn_irq(int evtchn, int irq)
+void rebind_evtchn_irq(evtchn_port_t evtchn, int irq)
 {
 	struct irq_info *info = info_for_irq(irq);
 
@@ -1284,7 +1285,7 @@ void rebind_evtchn_irq(int evtchn, int irq)
 }
 
 /* Rebind an evtchn so that it gets delivered to a specific cpu */
-static int xen_rebind_evtchn_to_cpu(int evtchn, unsigned int tcpu)
+static int xen_rebind_evtchn_to_cpu(evtchn_port_t evtchn, unsigned int tcpu)
 {
 	struct evtchn_bind_vcpu bind_vcpu;
 	int masked;
@@ -1342,7 +1343,7 @@ EXPORT_SYMBOL_GPL(xen_set_affinity_evtchn);
 
 static void enable_dynirq(struct irq_data *data)
 {
-	int evtchn = evtchn_from_irq(data->irq);
+	evtchn_port_t evtchn = evtchn_from_irq(data->irq);
 
 	if (VALID_EVTCHN(evtchn))
 		unmask_evtchn(evtchn);
@@ -1350,7 +1351,7 @@ static void enable_dynirq(struct irq_data *data)
 
 static void disable_dynirq(struct irq_data *data)
 {
-	int evtchn = evtchn_from_irq(data->irq);
+	evtchn_port_t evtchn = evtchn_from_irq(data->irq);
 
 	if (VALID_EVTCHN(evtchn))
 		mask_evtchn(evtchn);
@@ -1358,7 +1359,7 @@ static void disable_dynirq(struct irq_data *data)
 
 static void ack_dynirq(struct irq_data *data)
 {
-	int evtchn = evtchn_from_irq(data->irq);
+	evtchn_port_t evtchn = evtchn_from_irq(data->irq);
 
 	if (!VALID_EVTCHN(evtchn))
 		return;
@@ -1385,7 +1386,7 @@ static void mask_ack_dynirq(struct irq_data *data)
 
 static int retrigger_dynirq(struct irq_data *data)
 {
-	unsigned int evtchn = evtchn_from_irq(data->irq);
+	evtchn_port_t evtchn = evtchn_from_irq(data->irq);
 	int masked;
 
 	if (!VALID_EVTCHN(evtchn))
@@ -1440,7 +1441,8 @@ static void restore_pirqs(void)
 static void restore_cpu_virqs(unsigned int cpu)
 {
 	struct evtchn_bind_virq bind_virq;
-	int virq, irq, evtchn;
+	evtchn_port_t evtchn;
+	int virq, irq;
 
 	for (virq = 0; virq < NR_VIRQS; virq++) {
 		if ((irq = per_cpu(virq_to_irq, cpu)[virq]) == -1)
@@ -1465,7 +1467,8 @@ static void restore_cpu_virqs(unsigned int cpu)
 static void restore_cpu_ipis(unsigned int cpu)
 {
 	struct evtchn_bind_ipi bind_ipi;
-	int ipi, irq, evtchn;
+	evtchn_port_t evtchn;
+	int ipi, irq;
 
 	for (ipi = 0; ipi < XEN_NR_IPIS; ipi++) {
 		if ((irq = per_cpu(ipi_to_irq, cpu)[ipi]) == -1)
@@ -1489,7 +1492,7 @@ static void restore_cpu_ipis(unsigned int cpu)
 /* Clear an irq's pending state, in preparation for polling on it */
 void xen_clear_irq_pending(int irq)
 {
-	int evtchn = evtchn_from_irq(irq);
+	evtchn_port_t evtchn = evtchn_from_irq(irq);
 
 	if (VALID_EVTCHN(evtchn))
 		clear_evtchn(evtchn);
@@ -1497,7 +1500,7 @@ void xen_clear_irq_pending(int irq)
 EXPORT_SYMBOL(xen_clear_irq_pending);
 void xen_set_irq_pending(int irq)
 {
-	int evtchn = evtchn_from_irq(irq);
+	evtchn_port_t evtchn = evtchn_from_irq(irq);
 
 	if (VALID_EVTCHN(evtchn))
 		set_evtchn(evtchn);
@@ -1505,7 +1508,7 @@ void xen_set_irq_pending(int irq)
 
 bool xen_test_irq_pending(int irq)
 {
-	int evtchn = evtchn_from_irq(irq);
+	evtchn_port_t evtchn = evtchn_from_irq(irq);
 	bool ret = false;
 
 	if (VALID_EVTCHN(evtchn))
@@ -1667,7 +1670,7 @@ module_param(fifo_events, bool, 0);
 void __init xen_init_IRQ(void)
 {
 	int ret = -EINVAL;
-	unsigned int evtchn;
+	evtchn_port_t evtchn;
 
 	if (fifo_events)
 		ret = xen_evtchn_fifo_init();
diff --git a/drivers/xen/events/events_fifo.c b/drivers/xen/events/events_fifo.c
index 76b318e88382..c60ee0450173 100644
--- a/drivers/xen/events/events_fifo.c
+++ b/drivers/xen/events/events_fifo.c
@@ -82,7 +82,7 @@ static unsigned event_array_pages __read_mostly;
 
 #endif
 
-static inline event_word_t *event_word_from_port(unsigned port)
+static inline event_word_t *event_word_from_port(evtchn_port_t port)
 {
 	unsigned i = port / EVENT_WORDS_PER_PAGE;
 
@@ -140,7 +140,7 @@ static void init_array_page(event_word_t *array_page)
 
 static int evtchn_fifo_setup(struct irq_info *info)
 {
-	unsigned port = info->evtchn;
+	evtchn_port_t port = info->evtchn;
 	unsigned new_array_pages;
 	int ret;
 
@@ -191,37 +191,37 @@ static void evtchn_fifo_bind_to_cpu(struct irq_info *info, unsigned cpu)
 	/* no-op */
 }
 
-static void evtchn_fifo_clear_pending(unsigned port)
+static void evtchn_fifo_clear_pending(evtchn_port_t port)
 {
 	event_word_t *word = event_word_from_port(port);
 	sync_clear_bit(EVTCHN_FIFO_BIT(PENDING, word), BM(word));
 }
 
-static void evtchn_fifo_set_pending(unsigned port)
+static void evtchn_fifo_set_pending(evtchn_port_t port)
 {
 	event_word_t *word = event_word_from_port(port);
 	sync_set_bit(EVTCHN_FIFO_BIT(PENDING, word), BM(word));
 }
 
-static bool evtchn_fifo_is_pending(unsigned port)
+static bool evtchn_fifo_is_pending(evtchn_port_t port)
 {
 	event_word_t *word = event_word_from_port(port);
 	return sync_test_bit(EVTCHN_FIFO_BIT(PENDING, word), BM(word));
 }
 
-static bool evtchn_fifo_test_and_set_mask(unsigned port)
+static bool evtchn_fifo_test_and_set_mask(evtchn_port_t port)
 {
 	event_word_t *word = event_word_from_port(port);
 	return sync_test_and_set_bit(EVTCHN_FIFO_BIT(MASKED, word), BM(word));
 }
 
-static void evtchn_fifo_mask(unsigned port)
+static void evtchn_fifo_mask(evtchn_port_t port)
 {
 	event_word_t *word = event_word_from_port(port);
 	sync_set_bit(EVTCHN_FIFO_BIT(MASKED, word), BM(word));
 }
 
-static bool evtchn_fifo_is_masked(unsigned port)
+static bool evtchn_fifo_is_masked(evtchn_port_t port)
 {
 	event_word_t *word = event_word_from_port(port);
 	return sync_test_bit(EVTCHN_FIFO_BIT(MASKED, word), BM(word));
@@ -242,7 +242,7 @@ static void clear_masked(volatile event_word_t *word)
 	} while (w != old);
 }
 
-static void evtchn_fifo_unmask(unsigned port)
+static void evtchn_fifo_unmask(evtchn_port_t port)
 {
 	event_word_t *word = event_word_from_port(port);
 
@@ -270,7 +270,7 @@ static uint32_t clear_linked(volatile event_word_t *word)
 	return w & EVTCHN_FIFO_LINK_MASK;
 }
 
-static void handle_irq_for_port(unsigned port)
+static void handle_irq_for_port(evtchn_port_t port)
 {
 	int irq;
 
@@ -286,7 +286,7 @@ static void consume_one_event(unsigned cpu,
 {
 	struct evtchn_fifo_queue *q = &per_cpu(cpu_queue, cpu);
 	uint32_t head;
-	unsigned port;
+	evtchn_port_t port;
 	event_word_t *word;
 
 	head = q->head[priority];
diff --git a/drivers/xen/events/events_internal.h b/drivers/xen/events/events_internal.h
index 82938cff6c7a..10684feb094e 100644
--- a/drivers/xen/events/events_internal.h
+++ b/drivers/xen/events/events_internal.h
@@ -33,7 +33,7 @@ struct irq_info {
 	int refcnt;
 	enum xen_irq_type type;	/* type */
 	unsigned irq;
-	unsigned int evtchn;	/* event channel */
+	evtchn_port_t evtchn;	/* event channel */
 	unsigned short cpu;	/* cpu bound */
 
 	union {
@@ -60,12 +60,12 @@ struct evtchn_ops {
 	int (*setup)(struct irq_info *info);
 	void (*bind_to_cpu)(struct irq_info *info, unsigned cpu);
 
-	void (*clear_pending)(unsigned port);
-	void (*set_pending)(unsigned port);
-	bool (*is_pending)(unsigned port);
-	bool (*test_and_set_mask)(unsigned port);
-	void (*mask)(unsigned port);
-	void (*unmask)(unsigned port);
+	void (*clear_pending)(evtchn_port_t port);
+	void (*set_pending)(evtchn_port_t port);
+	bool (*is_pending)(evtchn_port_t port);
+	bool (*test_and_set_mask)(evtchn_port_t port);
+	void (*mask)(evtchn_port_t port);
+	void (*unmask)(evtchn_port_t port);
 
 	void (*handle_events)(unsigned cpu);
 	void (*resume)(void);
@@ -74,11 +74,11 @@ struct evtchn_ops {
 extern const struct evtchn_ops *evtchn_ops;
 
 extern int **evtchn_to_irq;
-int get_evtchn_to_irq(unsigned int evtchn);
+int get_evtchn_to_irq(evtchn_port_t evtchn);
 
 struct irq_info *info_for_irq(unsigned irq);
 unsigned cpu_from_irq(unsigned irq);
-unsigned cpu_from_evtchn(unsigned int evtchn);
+unsigned int cpu_from_evtchn(evtchn_port_t evtchn);
 
 static inline unsigned xen_evtchn_max_channels(void)
 {
@@ -102,32 +102,32 @@ static inline void xen_evtchn_port_bind_to_cpu(struct irq_info *info,
 	evtchn_ops->bind_to_cpu(info, cpu);
 }
 
-static inline void clear_evtchn(unsigned port)
+static inline void clear_evtchn(evtchn_port_t port)
 {
 	evtchn_ops->clear_pending(port);
 }
 
-static inline void set_evtchn(unsigned port)
+static inline void set_evtchn(evtchn_port_t port)
 {
 	evtchn_ops->set_pending(port);
 }
 
-static inline bool test_evtchn(unsigned port)
+static inline bool test_evtchn(evtchn_port_t port)
 {
 	return evtchn_ops->is_pending(port);
 }
 
-static inline bool test_and_set_mask(unsigned port)
+static inline bool test_and_set_mask(evtchn_port_t port)
 {
 	return evtchn_ops->test_and_set_mask(port);
 }
 
-static inline void mask_evtchn(unsigned port)
+static inline void mask_evtchn(evtchn_port_t port)
 {
 	return evtchn_ops->mask(port);
 }
 
-static inline void unmask_evtchn(unsigned port)
+static inline void unmask_evtchn(evtchn_port_t port)
 {
 	return evtchn_ops->unmask(port);
 }
diff --git a/drivers/xen/evtchn.c b/drivers/xen/evtchn.c
index 052b55a14ebc..6e0b1dd5573c 100644
--- a/drivers/xen/evtchn.c
+++ b/drivers/xen/evtchn.c
@@ -83,7 +83,7 @@ struct per_user_data {
 struct user_evtchn {
 	struct rb_node node;
 	struct per_user_data *user;
-	unsigned port;
+	evtchn_port_t port;
 	bool enabled;
 };
 
@@ -138,7 +138,8 @@ static void del_evtchn(struct per_user_data *u, struct user_evtchn *evtchn)
 	kfree(evtchn);
 }
 
-static struct user_evtchn *find_evtchn(struct per_user_data *u, unsigned port)
+static struct user_evtchn *find_evtchn(struct per_user_data *u,
+				       evtchn_port_t port)
 {
 	struct rb_node *node = u->evtchns.rb_node;
 
@@ -163,7 +164,7 @@ static irqreturn_t evtchn_interrupt(int irq, void *data)
 	struct per_user_data *u = evtchn->user;
 
 	WARN(!evtchn->enabled,
-	     "Interrupt for port %d, but apparently not enabled; per-user %p\n",
+	     "Interrupt for port %u, but apparently not enabled; per-user %p\n",
 	     evtchn->port, u);
 
 	disable_irq_nosync(irq);
@@ -286,7 +287,7 @@ static ssize_t evtchn_write(struct file *file, const char __user *buf,
 	mutex_lock(&u->bind_mutex);
 
 	for (i = 0; i < (count/sizeof(evtchn_port_t)); i++) {
-		unsigned port = kbuf[i];
+		evtchn_port_t port = kbuf[i];
 		struct user_evtchn *evtchn;
 
 		evtchn = find_evtchn(u, port);
@@ -361,7 +362,7 @@ static int evtchn_resize_ring(struct per_user_data *u)
 	return 0;
 }
 
-static int evtchn_bind_to_user(struct per_user_data *u, int port)
+static int evtchn_bind_to_user(struct per_user_data *u, evtchn_port_t port)
 {
 	struct user_evtchn *evtchn;
 	struct evtchn_close close;
@@ -423,7 +424,7 @@ static void evtchn_unbind_from_user(struct per_user_data *u,
 
 static DEFINE_PER_CPU(int, bind_last_selected_cpu);
 
-static void evtchn_bind_interdom_next_vcpu(int evtchn)
+static void evtchn_bind_interdom_next_vcpu(evtchn_port_t evtchn)
 {
 	unsigned int selected_cpu, irq;
 	struct irq_desc *desc;
diff --git a/drivers/xen/gntdev-common.h b/drivers/xen/gntdev-common.h
index 9a3960ecff6c..20d7d059dadb 100644
--- a/drivers/xen/gntdev-common.h
+++ b/drivers/xen/gntdev-common.h
@@ -15,6 +15,7 @@
 #include <linux/mman.h>
 #include <linux/mmu_notifier.h>
 #include <linux/types.h>
+#include <xen/interface/event_channel.h>
 
 struct gntdev_dmabuf_priv;
 
@@ -38,7 +39,7 @@ struct gntdev_unmap_notify {
 	int flags;
 	/* Address relative to the start of the gntdev_grant_map. */
 	int addr;
-	int event;
+	evtchn_port_t event;
 };
 
 struct gntdev_grant_map {
diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
index 0258415ca0b2..50651e566564 100644
--- a/drivers/xen/gntdev.c
+++ b/drivers/xen/gntdev.c
@@ -652,7 +652,7 @@ static long gntdev_ioctl_notify(struct gntdev_priv *priv, void __user *u)
 	struct gntdev_grant_map *map;
 	int rc;
 	int out_flags;
-	unsigned int out_event;
+	evtchn_port_t out_event;
 
 	if (copy_from_user(&op, u, sizeof(op)))
 		return -EFAULT;
diff --git a/drivers/xen/pvcalls-back.c b/drivers/xen/pvcalls-back.c
index c57c71b7d53d..cf4ce3e9358d 100644
--- a/drivers/xen/pvcalls-back.c
+++ b/drivers/xen/pvcalls-back.c
@@ -300,7 +300,7 @@ static struct sock_mapping *pvcalls_new_active_socket(
 		struct pvcalls_fedata *fedata,
 		uint64_t id,
 		grant_ref_t ref,
-		uint32_t evtchn,
+		evtchn_port_t evtchn,
 		struct socket *sock)
 {
 	int ret;
@@ -905,7 +905,8 @@ static irqreturn_t pvcalls_back_conn_event(int irq, void *sock_map)
 
 static int backend_connect(struct xenbus_device *dev)
 {
-	int err, evtchn;
+	int err;
+	evtchn_port_t evtchn;
 	grant_ref_t ring_ref;
 	struct pvcalls_fedata *fedata = NULL;
 
diff --git a/drivers/xen/pvcalls-front.c b/drivers/xen/pvcalls-front.c
index 57592a6b5c9e..b43b5595e988 100644
--- a/drivers/xen/pvcalls-front.c
+++ b/drivers/xen/pvcalls-front.c
@@ -368,12 +368,12 @@ static int alloc_active_ring(struct sock_mapping *map)
 	return -ENOMEM;
 }
 
-static int create_active(struct sock_mapping *map, int *evtchn)
+static int create_active(struct sock_mapping *map, evtchn_port_t *evtchn)
 {
 	void *bytes;
 	int ret = -ENOMEM, irq = -1, i;
 
-	*evtchn = -1;
+	*evtchn = 0;
 	init_waitqueue_head(&map->active.inflight_conn_req);
 
 	bytes = map->active.data.in;
@@ -404,7 +404,7 @@ static int create_active(struct sock_mapping *map, int *evtchn)
 	return 0;
 
 out_error:
-	if (*evtchn >= 0)
+	if (*evtchn > 0)
 		xenbus_free_evtchn(pvcalls_front_dev, *evtchn);
 	return ret;
 }
@@ -415,7 +415,8 @@ int pvcalls_front_connect(struct socket *sock, struct sockaddr *addr,
 	struct pvcalls_bedata *bedata;
 	struct sock_mapping *map = NULL;
 	struct xen_pvcalls_request *req;
-	int notify, req_id, ret, evtchn;
+	int notify, req_id, ret;
+	evtchn_port_t evtchn;
 
 	if (addr->sa_family != AF_INET || sock->type != SOCK_STREAM)
 		return -EOPNOTSUPP;
@@ -765,7 +766,8 @@ int pvcalls_front_accept(struct socket *sock, struct socket *newsock, int flags)
 	struct sock_mapping *map;
 	struct sock_mapping *map2 = NULL;
 	struct xen_pvcalls_request *req;
-	int notify, req_id, ret, evtchn, nonblock;
+	int notify, req_id, ret, nonblock;
+	evtchn_port_t evtchn;
 
 	map = pvcalls_enter_sock(sock);
 	if (IS_ERR(map))
@@ -1125,7 +1127,8 @@ static int pvcalls_front_remove(struct xenbus_device *dev)
 static int pvcalls_front_probe(struct xenbus_device *dev,
 			  const struct xenbus_device_id *id)
 {
-	int ret = -ENOMEM, evtchn, i;
+	int ret = -ENOMEM, i;
+	evtchn_port_t evtchn;
 	unsigned int max_page_order, function_calls, len;
 	char *versions;
 	grant_ref_t gref_head = 0;
diff --git a/drivers/xen/xen-pciback/xenbus.c b/drivers/xen/xen-pciback/xenbus.c
index 833b2d2c4318..f2115587855f 100644
--- a/drivers/xen/xen-pciback/xenbus.c
+++ b/drivers/xen/xen-pciback/xenbus.c
@@ -105,13 +105,13 @@ static void free_pdev(struct xen_pcibk_device *pdev)
 }
 
 static int xen_pcibk_do_attach(struct xen_pcibk_device *pdev, int gnt_ref,
-			     int remote_evtchn)
+			     evtchn_port_t remote_evtchn)
 {
 	int err = 0;
 	void *vaddr;
 
 	dev_dbg(&pdev->xdev->dev,
-		"Attaching to frontend resources - gnt_ref=%d evtchn=%d\n",
+		"Attaching to frontend resources - gnt_ref=%d evtchn=%u\n",
 		gnt_ref, remote_evtchn);
 
 	err = xenbus_map_ring_valloc(pdev->xdev, &gnt_ref, 1, &vaddr);
@@ -142,7 +142,8 @@ static int xen_pcibk_do_attach(struct xen_pcibk_device *pdev, int gnt_ref,
 static int xen_pcibk_attach(struct xen_pcibk_device *pdev)
 {
 	int err = 0;
-	int gnt_ref, remote_evtchn;
+	int gnt_ref;
+	evtchn_port_t remote_evtchn;
 	char *magic = NULL;
 
 
diff --git a/drivers/xen/xen-scsiback.c b/drivers/xen/xen-scsiback.c
index ba0942e481bc..75c0a2e9a6db 100644
--- a/drivers/xen/xen-scsiback.c
+++ b/drivers/xen/xen-scsiback.c
@@ -854,7 +854,8 @@ static int scsiback_init_sring(struct vscsibk_info *info, grant_ref_t ring_ref,
 static int scsiback_map(struct vscsibk_info *info)
 {
 	struct xenbus_device *dev = info->dev;
-	unsigned int ring_ref, evtchn;
+	unsigned int ring_ref;
+	evtchn_port_t evtchn;
 	int err;
 
 	err = xenbus_gather(XBT_NIL, dev->otherend,
diff --git a/drivers/xen/xenbus/xenbus_client.c b/drivers/xen/xenbus/xenbus_client.c
index e17ca8156171..1f87514e4efc 100644
--- a/drivers/xen/xenbus/xenbus_client.c
+++ b/drivers/xen/xenbus/xenbus_client.c
@@ -391,7 +391,7 @@ EXPORT_SYMBOL_GPL(xenbus_grant_ring);
  * error, the device will switch to XenbusStateClosing, and the error will be
  * saved in the store.
  */
-int xenbus_alloc_evtchn(struct xenbus_device *dev, int *port)
+int xenbus_alloc_evtchn(struct xenbus_device *dev, evtchn_port_t *port)
 {
 	struct evtchn_alloc_unbound alloc_unbound;
 	int err;
@@ -414,7 +414,7 @@ EXPORT_SYMBOL_GPL(xenbus_alloc_evtchn);
 /**
  * Free an existing event channel. Returns 0 on success or -errno on error.
  */
-int xenbus_free_evtchn(struct xenbus_device *dev, int port)
+int xenbus_free_evtchn(struct xenbus_device *dev, evtchn_port_t port)
 {
 	struct evtchn_close close;
 	int err;
@@ -423,7 +423,7 @@ int xenbus_free_evtchn(struct xenbus_device *dev, int port)
 
 	err = HYPERVISOR_event_channel_op(EVTCHNOP_close, &close);
 	if (err)
-		xenbus_dev_error(dev, err, "freeing event channel %d", port);
+		xenbus_dev_error(dev, err, "freeing event channel %u", port);
 
 	return err;
 }
diff --git a/include/xen/events.h b/include/xen/events.h
index c0e6a0598397..12b0dcb6a120 100644
--- a/include/xen/events.h
+++ b/include/xen/events.h
@@ -14,8 +14,8 @@
 
 unsigned xen_evtchn_nr_channels(void);
 
-int bind_evtchn_to_irq(unsigned int evtchn);
-int bind_evtchn_to_irqhandler(unsigned int evtchn,
+int bind_evtchn_to_irq(evtchn_port_t evtchn);
+int bind_evtchn_to_irqhandler(evtchn_port_t evtchn,
 			      irq_handler_t handler,
 			      unsigned long irqflags, const char *devname,
 			      void *dev_id);
@@ -31,9 +31,9 @@ int bind_ipi_to_irqhandler(enum ipi_vector ipi,
 			   const char *devname,
 			   void *dev_id);
 int bind_interdomain_evtchn_to_irq(unsigned int remote_domain,
-				   unsigned int remote_port);
+				   evtchn_port_t remote_port);
 int bind_interdomain_evtchn_to_irqhandler(unsigned int remote_domain,
-					  unsigned int remote_port,
+					  evtchn_port_t remote_port,
 					  irq_handler_t handler,
 					  unsigned long irqflags,
 					  const char *devname,
@@ -54,15 +54,15 @@ int xen_set_irq_priority(unsigned irq, unsigned priority);
 /*
  * Allow extra references to event channels exposed to userspace by evtchn
  */
-int evtchn_make_refcounted(unsigned int evtchn);
-int evtchn_get(unsigned int evtchn);
-void evtchn_put(unsigned int evtchn);
+int evtchn_make_refcounted(evtchn_port_t evtchn);
+int evtchn_get(evtchn_port_t evtchn);
+void evtchn_put(evtchn_port_t evtchn);
 
 void xen_send_IPI_one(unsigned int cpu, enum ipi_vector vector);
-void rebind_evtchn_irq(int evtchn, int irq);
+void rebind_evtchn_irq(evtchn_port_t evtchn, int irq);
 int xen_set_affinity_evtchn(struct irq_desc *desc, unsigned int tcpu);
 
-static inline void notify_remote_via_evtchn(int port)
+static inline void notify_remote_via_evtchn(evtchn_port_t port)
 {
 	struct evtchn_send send = { .port = port };
 	(void)HYPERVISOR_event_channel_op(EVTCHNOP_send, &send);
@@ -86,9 +86,9 @@ void xen_poll_irq(int irq);
 void xen_poll_irq_timeout(int irq, u64 timeout);
 
 /* Determine the IRQ which is bound to an event channel */
-unsigned irq_from_evtchn(unsigned int evtchn);
+unsigned int irq_from_evtchn(evtchn_port_t evtchn);
 int irq_from_virq(unsigned int cpu, unsigned int virq);
-unsigned int evtchn_from_irq(unsigned irq);
+evtchn_port_t evtchn_from_irq(unsigned irq);
 
 #ifdef CONFIG_XEN_PVHVM
 /* Xen HVM evtchn vector callback */
diff --git a/include/xen/interface/event_channel.h b/include/xen/interface/event_channel.h
index 45650c9a06d5..cf80e338fbb0 100644
--- a/include/xen/interface/event_channel.h
+++ b/include/xen/interface/event_channel.h
@@ -220,7 +220,7 @@ struct evtchn_expand_array {
 #define EVTCHNOP_set_priority    13
 struct evtchn_set_priority {
 	/* IN parameters. */
-	uint32_t port;
+	evtchn_port_t port;
 	uint32_t priority;
 };
 
diff --git a/include/xen/xenbus.h b/include/xen/xenbus.h
index 850a43bd69d3..725da8965eb9 100644
--- a/include/xen/xenbus.h
+++ b/include/xen/xenbus.h
@@ -47,6 +47,7 @@
 #include <xen/interface/grant_table.h>
 #include <xen/interface/io/xenbus.h>
 #include <xen/interface/io/xs_wire.h>
+#include <xen/interface/event_channel.h>
 
 #define XENBUS_MAX_RING_GRANT_ORDER 4
 #define XENBUS_MAX_RING_GRANTS      (1U << XENBUS_MAX_RING_GRANT_ORDER)
@@ -219,8 +220,8 @@ int xenbus_unmap_ring(struct xenbus_device *dev,
 		      grant_handle_t *handles, unsigned int nr_handles,
 		      unsigned long *vaddrs);
 
-int xenbus_alloc_evtchn(struct xenbus_device *dev, int *port);
-int xenbus_free_evtchn(struct xenbus_device *dev, int port);
+int xenbus_alloc_evtchn(struct xenbus_device *dev, evtchn_port_t *port);
+int xenbus_free_evtchn(struct xenbus_device *dev, evtchn_port_t port);
 
 enum xenbus_state xenbus_read_driver_state(const char *path);
 
-- 
2.17.1


