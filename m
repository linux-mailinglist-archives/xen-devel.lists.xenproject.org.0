Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4732514B6
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 10:58:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAUmc-0003jh-77; Tue, 25 Aug 2020 08:58:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ixcz=CD=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1kAUmb-0003jb-EB
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 08:58:21 +0000
X-Inumbo-ID: 022f7020-8c45-4175-b7ec-759bf675c3fc
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 022f7020-8c45-4175-b7ec-759bf675c3fc;
 Tue, 25 Aug 2020 08:58:20 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1598345899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YzS9Pbc4ZvWB6xb3WDYBLrC8Em/P8Onaa5usDSFvIls=;
 b=Q1AnEEVnxZwZgaMaK6C2r3DaW/em++Qy7iZR3wneQs2zBEKSf/wYQGMDIRYGAQkX4o3foR
 95Ia6A3HX32NgYF98TdvYqCM3QBDpvBJlDJ935z8xpHM/PdDwb4A4FusZd+rvjKjziqUJK
 guUcNzf+/y9PppNxV7qik2tX1AEDAx8baqtzCMf5CsQq5AM5F1q/cvr0h8hR4KOn3s/loM
 gsPP4+nSkpTtDWQp+9sYD3SwapsX6GDWjpsDvI3rTCVv3Evzn1NAitJZcJj8x6lX/o0j/o
 b5fKmOl3nUc/NHFDfHXowkXw1gasVwlqFUkQl4rbR/ZKwBs19BzgjAZuTC91jg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1598345899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YzS9Pbc4ZvWB6xb3WDYBLrC8Em/P8Onaa5usDSFvIls=;
 b=pAgddJgjd/R+LX5jeyeK/9pp6DB/3GqiCQbFE1zh+g1EEoRKfZ8h5j6mzes0FAlcqXdAzg
 a9AySZuYkCXxydBQ==
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Sergei Temerkhanov
 <s.temerkhanov@gmail.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Subject: Re: [PATCH 0/2] Xen: Use a dedicated pointer for IRQ data
In-Reply-To: <alpine.DEB.2.21.2008241959510.24407@sstabellini-ThinkPad-T480s>
References: <CAMmSBy9-cJuxC0jLPh6O-UCraThzg2wvNO29ZvxrBmVkatt_sg@mail.gmail.com>
 <20200821071547.18894-1-s.temerkhanov@gmail.com>
 <ccc1883f-876f-c1ea-bd68-b3c8ab267a8f@suse.com>
 <CAPEA6dYXaw=ZYv1jJqK=8twVpKXQ8bG0erABKC6HiQh-DcZ-DQ@mail.gmail.com>
 <b2917f59-d101-659d-1704-8d2a294bb2a1@suse.com>
 <871rjzsqyy.fsf@nanos.tec.linutronix.de>
 <alpine.DEB.2.21.2008241959510.24407@sstabellini-ThinkPad-T480s>
Date: Tue, 25 Aug 2020 10:58:18 +0200
Message-ID: <87k0xn5cgl.fsf@nanos.tec.linutronix.de>
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

On Mon, Aug 24 2020 at 20:14, Stefano Stabellini wrote:
> On Fri, 21 Aug 2020, Thomas Gleixner wrote:
>> are accessors to handler_data. Am I missing something?
> I think Juergen's suggestion was to use function pointers as accessors.
>
> The underlying problem is that both Xen and GPIO want to use
> handler_data.
>
> Xen comes first and uses handler_data to handle Xen events
> (drivers/xen/events/events_base.c:xen_irq_init).
>
> Then, the GPIO driver probe function
> (drivers/pinctrl/intel/pinctrl-baytrail.c:byt_gpio_probe) calls
> gpiochip_set_chained_irqchip, which eventually calls
> irq_set_chained_handler_and_data, overwriting handler_data without
> checks.
>
> Juergen's suggestion is to replace irq_set_handler_data and
> irq_get_handler_data with function pointers.
>
> Xen could install its own irq_set_handler_data and irq_get_handler_data
> functions. The Xen implementation would take care of saving other
> handler_data pointers on request: when the GPIO driver calls
> irq_set_chained_handler_and_data it would end up calling the Xen
> implementation of the set_handler_data function that would store the
> GPIO pointer in a Xen struct somewhere.

I don't think that's a good idea. The point is that we have an irq chip
which wants to have per interrupt data and then an interrupt request
which wants that as well.

Conceptually they are distinct. One belongs to the irq chip and one to
the handler.

So the straight forward solution is to switch XEN to use the
irqdesc::irq_data::chip_data instead of
irqdesc::irq_data_common::handler_data.

Something like the completely untested below.

Thanks,

        tglx
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


