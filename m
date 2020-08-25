Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5E9251C39
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 17:23:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAamv-0007zF-BL; Tue, 25 Aug 2020 15:23:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ixcz=CD=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1kAamu-0007zA-I1
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 15:23:04 +0000
X-Inumbo-ID: 0bd0e0eb-cba6-4203-9b7a-5bff54bf12d1
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0bd0e0eb-cba6-4203-9b7a-5bff54bf12d1;
 Tue, 25 Aug 2020 15:23:02 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1598368981; h=from:from:reply-to:subject:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=av1m+1kxx0uAiVcVtSqAkN5hIO2GB8aGHtHRf9Awh1M=;
 b=Qj+BGek6+iQDiAWTLg+MX28+Jg16I6rIFUVYnYfOTHI1Enp0BOt1uLOrpnq2Eud6rh70VN
 kn/PO1N6Q7jSRTGrJ+qaV5NGM0iKGWgHbFSdofXJhLWOWw2j4K9/7/h+TwjE8cHFis96Av
 a5+AgRQMI9oK7tRs6R8wfe4CXOr6PKTVfoMN5fn3sULJmn1bTyvSQDUcyScrvY6X7rqMpx
 wovpHVpit/tU7ipzBy4CFjMjL81ssb85Leiyzo4uAJrFnss1ShaNeAjfzL+u+sv3KhwSYp
 mvkNVmvxAPEAQjI75Fm/FTGIuxf8uj9XeiyQG35jCOn3xLE/ncVHsfLedsB+PQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1598368981; h=from:from:reply-to:subject:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=av1m+1kxx0uAiVcVtSqAkN5hIO2GB8aGHtHRf9Awh1M=;
 b=AeXFkLvwt7OZUR5h3/I0qgXxgQoaVPjk7tWwkRH5CvYd+3xN2oLWjtX8Uo6h7zcHlv0TmN
 p4iyNw6w7R/tEVDw==
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Sergei Temerkhanov <s.temerkhanov@gmail.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Roman Shaposhnik <roman@zededa.com>
Subject: [PATCH] xen/events: Use chip data for storing per IRQ XEN data pointer
Subject: 
In-Reply-To: <cb64e4e9-2ed3-fb15-8c20-d49e47cbff34@suse.com>
References: <CAMmSBy9-cJuxC0jLPh6O-UCraThzg2wvNO29ZvxrBmVkatt_sg@mail.gmail.com>
 <20200821071547.18894-1-s.temerkhanov@gmail.com>
 <ccc1883f-876f-c1ea-bd68-b3c8ab267a8f@suse.com>
 <CAPEA6dYXaw=ZYv1jJqK=8twVpKXQ8bG0erABKC6HiQh-DcZ-DQ@mail.gmail.com>
 <b2917f59-d101-659d-1704-8d2a294bb2a1@suse.com>
 <871rjzsqyy.fsf@nanos.tec.linutronix.de>
 <alpine.DEB.2.21.2008241959510.24407@sstabellini-ThinkPad-T480s>
 <87k0xn5cgl.fsf@nanos.tec.linutronix.de>
 <cb64e4e9-2ed3-fb15-8c20-d49e47cbff34@suse.com>
Date: Tue, 25 Aug 2020 17:22:58 +0200
Message-ID: <87lfi2yckt.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
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

XEN uses irqdesc::irq_data_common::handler_data to store a per interrupt
XEN data pointer which contains XEN specific information.

handler data is meant for interrupt handlers and not for storing irq chip
specific information as some devices require handler data to store internal
per interrupt information, e.g. pinctrl/GPIO chained interrupt handlers.

This obviously creates a conflict of interests and crashes the machine
because the XEN pointer is overwritten by the driver pointer.

As the XEN data is not handler specific it should be stored in
irqdesc::irq_data::chip_data instead.

A simple sed s/irq_[sg]et_handler_data/irq_[sg]et_chip_data/ cures that.

Reported-by: Roman Shaposhnik <roman@zededa.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
Note: This probably wants a 'Cc: stable@' and a 'Fixes:' tag, but I
leave that as an exercise to the maintainers how far they want to move
that back.
---
 drivers/xen/events/events_base.c |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)


--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -156,7 +156,7 @@ int get_evtchn_to_irq(evtchn_port_t evtc
 /* Get info for IRQ */
 struct irq_info *info_for_irq(unsigned irq)
 {
-	return irq_get_handler_data(irq);
+	return irq_get_chip_data(irq);
 }
 
 /* Constructors for packed IRQ information. */
@@ -377,7 +377,7 @@ static void xen_irq_init(unsigned irq)
 	info->type = IRQT_UNBOUND;
 	info->refcnt = -1;
 
-	irq_set_handler_data(irq, info);
+	irq_set_chip_data(irq, info);
 
 	list_add_tail(&info->list, &xen_irq_list_head);
 }
@@ -426,14 +426,14 @@ static int __must_check xen_allocate_irq
 
 static void xen_free_irq(unsigned irq)
 {
-	struct irq_info *info = irq_get_handler_data(irq);
+	struct irq_info *info = irq_get_chip_data(irq);
 
 	if (WARN_ON(!info))
 		return;
 
 	list_del(&info->list);
 
-	irq_set_handler_data(irq, NULL);
+	irq_set_chip_data(irq, NULL);
 
 	WARN_ON(info->refcnt > 0);
 
@@ -603,7 +603,7 @@ EXPORT_SYMBOL_GPL(xen_irq_from_gsi);
 static void __unbind_from_irq(unsigned int irq)
 {
 	evtchn_port_t evtchn = evtchn_from_irq(irq);
-	struct irq_info *info = irq_get_handler_data(irq);
+	struct irq_info *info = irq_get_chip_data(irq);
 
 	if (info->refcnt > 0) {
 		info->refcnt--;
@@ -1108,7 +1108,7 @@ int bind_ipi_to_irqhandler(enum ipi_vect
 
 void unbind_from_irqhandler(unsigned int irq, void *dev_id)
 {
-	struct irq_info *info = irq_get_handler_data(irq);
+	struct irq_info *info = irq_get_chip_data(irq);
 
 	if (WARN_ON(!info))
 		return;
@@ -1142,7 +1142,7 @@ int evtchn_make_refcounted(evtchn_port_t
 	if (irq == -1)
 		return -ENOENT;
 
-	info = irq_get_handler_data(irq);
+	info = irq_get_chip_data(irq);
 
 	if (!info)
 		return -ENOENT;
@@ -1170,7 +1170,7 @@ int evtchn_get(evtchn_port_t evtchn)
 	if (irq == -1)
 		goto done;
 
-	info = irq_get_handler_data(irq);
+	info = irq_get_chip_data(irq);
 
 	if (!info)
 		goto done;

