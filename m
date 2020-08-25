Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BC1251A24
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 15:50:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAZKW-0007rP-AC; Tue, 25 Aug 2020 13:49:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h2I2=CD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kAZKU-0007rK-28
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 13:49:38 +0000
X-Inumbo-ID: a34f89d9-b800-4417-9ce8-dc21ea39430b
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a34f89d9-b800-4417-9ce8-dc21ea39430b;
 Tue, 25 Aug 2020 13:49:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 93F46ADD6;
 Tue, 25 Aug 2020 13:50:05 +0000 (UTC)
Subject: Re: [PATCH 0/2] Xen: Use a dedicated pointer for IRQ data
To: Thomas Gleixner <tglx@linutronix.de>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Sergei Temerkhanov <s.temerkhanov@gmail.com>,
 xen-devel@lists.xenproject.org
References: <CAMmSBy9-cJuxC0jLPh6O-UCraThzg2wvNO29ZvxrBmVkatt_sg@mail.gmail.com>
 <20200821071547.18894-1-s.temerkhanov@gmail.com>
 <ccc1883f-876f-c1ea-bd68-b3c8ab267a8f@suse.com>
 <CAPEA6dYXaw=ZYv1jJqK=8twVpKXQ8bG0erABKC6HiQh-DcZ-DQ@mail.gmail.com>
 <b2917f59-d101-659d-1704-8d2a294bb2a1@suse.com>
 <871rjzsqyy.fsf@nanos.tec.linutronix.de>
 <alpine.DEB.2.21.2008241959510.24407@sstabellini-ThinkPad-T480s>
 <87k0xn5cgl.fsf@nanos.tec.linutronix.de>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <cb64e4e9-2ed3-fb15-8c20-d49e47cbff34@suse.com>
Date: Tue, 25 Aug 2020 15:49:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <87k0xn5cgl.fsf@nanos.tec.linutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 25.08.20 10:58, Thomas Gleixner wrote:
> On Mon, Aug 24 2020 at 20:14, Stefano Stabellini wrote:
>> On Fri, 21 Aug 2020, Thomas Gleixner wrote:
>>> are accessors to handler_data. Am I missing something?
>> I think Juergen's suggestion was to use function pointers as accessors.
>>
>> The underlying problem is that both Xen and GPIO want to use
>> handler_data.
>>
>> Xen comes first and uses handler_data to handle Xen events
>> (drivers/xen/events/events_base.c:xen_irq_init).
>>
>> Then, the GPIO driver probe function
>> (drivers/pinctrl/intel/pinctrl-baytrail.c:byt_gpio_probe) calls
>> gpiochip_set_chained_irqchip, which eventually calls
>> irq_set_chained_handler_and_data, overwriting handler_data without
>> checks.
>>
>> Juergen's suggestion is to replace irq_set_handler_data and
>> irq_get_handler_data with function pointers.
>>
>> Xen could install its own irq_set_handler_data and irq_get_handler_data
>> functions. The Xen implementation would take care of saving other
>> handler_data pointers on request: when the GPIO driver calls
>> irq_set_chained_handler_and_data it would end up calling the Xen
>> implementation of the set_handler_data function that would store the
>> GPIO pointer in a Xen struct somewhere.
> 
> I don't think that's a good idea. The point is that we have an irq chip
> which wants to have per interrupt data and then an interrupt request
> which wants that as well.
> 
> Conceptually they are distinct. One belongs to the irq chip and one to
> the handler.
> 
> So the straight forward solution is to switch XEN to use the
> irqdesc::irq_data::chip_data instead of
> irqdesc::irq_data_common::handler_data.

Of course. I must have been blind not to spot chip_data to exist.

> 
> Something like the completely untested below.

A short test showed no problems. Would you mind sending it as a proper
patch? You can add my

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

> 
> Thanks,
> 
>          tglx
> ---
>   drivers/xen/events/events_base.c |   16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> --- a/drivers/xen/events/events_base.c
> +++ b/drivers/xen/events/events_base.c
> @@ -156,7 +156,7 @@ int get_evtchn_to_irq(evtchn_port_t evtc
>   /* Get info for IRQ */
>   struct irq_info *info_for_irq(unsigned irq)
>   {
> -	return irq_get_handler_data(irq);
> +	return irq_get_chip_data(irq);
>   }
>   
>   /* Constructors for packed IRQ information. */
> @@ -377,7 +377,7 @@ static void xen_irq_init(unsigned irq)
>   	info->type = IRQT_UNBOUND;
>   	info->refcnt = -1;
>   
> -	irq_set_handler_data(irq, info);
> +	irq_set_chip_data(irq, info);
>   
>   	list_add_tail(&info->list, &xen_irq_list_head);
>   }
> @@ -426,14 +426,14 @@ static int __must_check xen_allocate_irq
>   
>   static void xen_free_irq(unsigned irq)
>   {
> -	struct irq_info *info = irq_get_handler_data(irq);
> +	struct irq_info *info = irq_get_chip_data(irq);
>   
>   	if (WARN_ON(!info))
>   		return;
>   
>   	list_del(&info->list);
>   
> -	irq_set_handler_data(irq, NULL);
> +	irq_set_chip_data(irq, NULL);
>   
>   	WARN_ON(info->refcnt > 0);
>   
> @@ -603,7 +603,7 @@ EXPORT_SYMBOL_GPL(xen_irq_from_gsi);
>   static void __unbind_from_irq(unsigned int irq)
>   {
>   	evtchn_port_t evtchn = evtchn_from_irq(irq);
> -	struct irq_info *info = irq_get_handler_data(irq);
> +	struct irq_info *info = irq_get_chip_data(irq);
>   
>   	if (info->refcnt > 0) {
>   		info->refcnt--;
> @@ -1108,7 +1108,7 @@ int bind_ipi_to_irqhandler(enum ipi_vect
>   
>   void unbind_from_irqhandler(unsigned int irq, void *dev_id)
>   {
> -	struct irq_info *info = irq_get_handler_data(irq);
> +	struct irq_info *info = irq_get_chip_data(irq);
>   
>   	if (WARN_ON(!info))
>   		return;
> @@ -1142,7 +1142,7 @@ int evtchn_make_refcounted(evtchn_port_t
>   	if (irq == -1)
>   		return -ENOENT;
>   
> -	info = irq_get_handler_data(irq);
> +	info = irq_get_chip_data(irq);
>   
>   	if (!info)
>   		return -ENOENT;
> @@ -1170,7 +1170,7 @@ int evtchn_get(evtchn_port_t evtchn)
>   	if (irq == -1)
>   		goto done;
>   
> -	info = irq_get_handler_data(irq);
> +	info = irq_get_chip_data(irq);
>   
>   	if (!info)
>   		goto done;
> 


