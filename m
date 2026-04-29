Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAI5KckY8mljnwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 16:42:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A8E496005
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 16:42:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1297440.1573467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI66y-0001r5-5Z; Wed, 29 Apr 2026 14:42:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1297440.1573467; Wed, 29 Apr 2026 14:42:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI66y-0001oi-2m; Wed, 29 Apr 2026 14:42:00 +0000
Received: by outflank-mailman (input) for mailman id 1297440;
 Wed, 29 Apr 2026 14:41:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dd9b07146000f373@swg.vates.tech>)
 id 1wI66x-0001oa-1p
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 14:41:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wI66w-002YNW-3P
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 16:41:58 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dd9b07146000f373@swg.vates.tech>)
 id 69f218b3-bab6-0a2a0a5309dd-0a2a45059fb4-2
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 16:41:58 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dd9b07146000f373@swg.vates.tech>)
 id 69f218b5-aaa8-0a2a45050019-b9ff1c229a4d-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 16:41:58 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19dd9b07146000f373.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 29 Apr 2026 14:41:52 +0000
Received: from [192.168.1.18] (88-175-170-134.subs.proxad.net [88.175.170.134])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id AE981864B7;
 Wed, 29 Apr 2026 16:41:47 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=UGqK5k1jQYtCqj3M86/fgUSdu27cnCGG4meD6wI1sT0=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=OwvU0vLSDrCTMUY9WTGpIPozgqClF7cygH3ygwgtTF24zz/CMDKc2G3GohBUGp1jhvOQzmyY3
 4qaksEZztNnK/UIhy1iq9dMoXCjgzyC0sqsdLcx+KRjSzs3WZzxHaxUxJclGR/RY/lvTWaXuDue
 ibdyPjtPnPnOjO38X5cy96A59vhWsau1hdajyKSO+S/N//g4gWRusKXx6uGvCosCfwhq3s/F8e9
 emdF52xSWtvzEF9YwTlw19XFMzl4nVoKofftgdncJ/8VoO3NBngGVpHieVqPchJJ5SxxO/064wk
 TVgucWisok9WAqqQxAKf+lehF+lPmj2BIxG4GaumyQUw==
X-Zone-Loop: 23e2bb187a520cdd8e31b3641a32c6e4c8f8a0038cb3
x-campaign-type: default
x-transaction-id: a39e41b0-3301-45bf-b32a-1fa3aabdc141
x-swg-uid: 01-58bd9a84-e73b-4548-aaf3-6f522fed0953
X-Mailer: Sweego
Message-ID:
 <1777473712.8631fc262581453bbf619ec5b2062170.19dd9b07146000f373@vates.tech>
x-swg-bid: 1777473712.8631fc262581453bbf619ec5b2062170.19dd9b07146000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 29 Apr 2026 16:41:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] virtio-mmio: add xenbus probing
To: Val Packett <val@invisiblethingslab.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev
References: <20260429141339.74472-1-val@invisiblethingslab.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
In-Reply-To: <20260429141339.74472-1-val@invisiblethingslab.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.241.1dd4a0eaebe8c9a7.19dd9b05f77.138039998489b248=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1777473707896
X-purgate-ID: tlsNG-c201ff/1777473718-2AB68443-D1598A39/0/0
X-purgate-type: clean
X-purgate-size: 9397
X-Rspamd-Queue-Id: 37A8E496005
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:val@invisiblethingslab.com,m:mst@redhat.com,m:jasowang@redhat.com,m:xuanzhuo@linux.alibaba.com,m:eperezma@redhat.com,m:marmarek@invisiblethingslab.com,m:viresh.kumar@linaro.org,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:virtualization@lists.linux.dev,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,invisiblethingslab.com:email];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

---=Part.241.1dd4a0eaebe8c9a7.19dd9b05f77.138039998489b248=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

Le 29/04/2026 =C3=A0 16:18, Val Packett a =C3=A9crit=C2=A0:
> The experimental virtio-mmio support for Xen was initially developed
> on aarch64, so device trees were used to configure the mmio devices,
> with arbitrary vGIC interrupts used by the hypervisor=2E On x86_64
> however, the only reasonable way to interrupt the guest is over Xen
> event channels, which can only be acquired by children of xenbus,
> the virtual bus driven by Xen's configuration database, XenStore=2E
> It is also a more convenient and "Xen-ish" way to provision devices=2E
>=20
> Implement a xenbus client for virtio-mmio which negotiates an
> event channel and provides it as a platform IRQ to the
> virtio-mmio driver=2E
>=20
>=20
> Signed-off-by: Val Packett <val@invisiblethingslab=2Ecom>
> ---
>=20
> Hi,
>=20
> I've been working on porting virtio-mmio support from Arm to x86_64,
> with the goal of running vhost-user-gpu to power Wayland/GPU integration
> for Qubes OS=2E (I'm aware of various proposals for alternative virtio
> transports but virtio-mmio seems to be the only one that *is* upstream
> already and just Works=2E=2E) Setting up virtio-mmio through xenbus, ini=
tially
> motivated just by event channels being the only real way to get interrup=
ts
> working on HVM, turned out to generally be quite pleasant and nice :)

Is it HVM specific, or can we also make it work for PVH (we can actually=
=20
attach a ioreq server to PVH guests) ?

>=20
> I'd like to get some early feedback for this patch, particularly
> the general stuff:
>=20
> * is this whole thing acceptable in general?
> * should it be extracted into a different file?
> * (from the Xen side) any input on the xenstore keys, what goes where?
> * anything else to keep in mind?
>=20
> It does seem simple enough, so hopefully this can be done?
>=20
> The corresponding userspace-side WIP is available at:
> https://github=2Ecom/QubesOS/xen-vhost-frontend
>=20
> And the required DMOP for firing the evtchn events will be sent
> to xen-devel shortly as well=2E

Could that be done through evtchn_send (or its userland counterpart) ?

>=20
> Thanks,
> ~val
>=20
> ---
>   drivers/virtio/Kconfig       |   7 ++
>   drivers/virtio/virtio_mmio=2Ec | 177 +++++++++++++++++++++++++++++++++=
+-
>   2 files changed, 183 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/virtio/Kconfig b/drivers/virtio/Kconfig
> index ce5bc0d9ea28=2E=2E56bc2b10526b 100644
> --- a/drivers/virtio/Kconfig
> +++ b/drivers/virtio/Kconfig
> @@ -171,6 +171,13 @@ config VIRTIO_MMIO_CMDLINE_DEVICES
>  =20
>   	 If unsure, say 'N'=2E
>  =20
> +config VIRTIO_MMIO_XENBUS
> +	bool "Memory mapped virtio devices parameter parsing"

that text seems to miss the xenbus aspect

> +	depends on VIRTIO_MMIO && XEN
> +	select XEN_XENBUS_FRONTEND
> +	help
> +	 Allow virtio-mmio devices instantiation for Xen guests via xenbus=2E
> +
>   config VIRTIO_DMA_SHARED_BUFFER
>   	tristate
>   	depends on DMA_SHARED_BUFFER
> diff --git a/drivers/virtio/virtio_mmio=2Ec b/drivers/virtio/virtio_mmio=
=2Ec
> index 595c2274fbb5=2E=2E32295284bdbf 100644
> --- a/drivers/virtio/virtio_mmio=2Ec
> +++ b/drivers/virtio/virtio_mmio=2Ec
> @@ -70,6 +70,11 @@
>   #include <uapi/linux/virtio_mmio=2Eh>
>   #include <linux/virtio_ring=2Eh>
>  =20
> +#ifdef CONFIG_VIRTIO_MMIO_XENBUS
> +#include <xen/xen=2Eh>
> +#include <xen/xenbus=2Eh>
> +#include <xen/events=2Eh>
> +#endif
>  =20
>  =20
>   /* The alignment to use between consumer and producer parts of vring=
=2E
> @@ -810,13 +815,183 @@ static struct platform_driver virtio_mmio_driver =
=3D {
>   	},
>   };
>  =20
> +#ifdef CONFIG_VIRTIO_MMIO_XENBUS
> +struct virtio_mmio_xen_info {
> +	struct resource resources[2];
> +	unsigned int evtchn;
> +	struct platform_device *pdev;
> +};
> +
> +static int virtio_mmio_xen_probe(struct xenbus_device *dev,
> +			const struct xenbus_device_id *id)
> +{
> +	int err;
> +	long long base, size;
> +	char *mem;
> +	struct virtio_mmio_xen_info *info;
> +	struct xenbus_transaction xbt;
> +
> +	/* TODO: allocate an unused address here and pass it to the host inste=
ad */
> +	err =3D xenbus_scanf(XBT_NIL, dev->otherend, "base", "0x%llx",
> +			   &base);
> +	if (err < 0) {
> +		xenbus_dev_fatal(dev, err, "reading base");
> +		return -EINVAL;
> +	}
> +
> +	mem =3D xenbus_read(XBT_NIL, dev->otherend, "size", NULL);
> +	if (XENBUS_IS_ERR_READ(mem))
> +		return PTR_ERR(mem);
> +	size =3D memparse(mem, NULL);
> +	kfree(mem);
> +
> +	info =3D kzalloc_obj(*info);
> +	if (!info) {
> +		xenbus_dev_fatal(dev, -ENOMEM, "allocating info structure");
> +		return -ENOMEM;
> +	}
> +
> +	info->resources[0]=2Eflags =3D IORESOURCE_MEM;
> +	info->resources[0]=2Estart =3D base;
> +	info->resources[0]=2Eend =3D base + size - 1;
> +
> +	err =3D xenbus_alloc_evtchn(dev, &info->evtchn);
> +	if (err) {
> +		xenbus_dev_fatal(dev, err, "xenbus_alloc_evtchn");
> +		goto error_info;
> +	}
> +
> +	err =3D bind_evtchn_to_irq(info->evtchn);
> +	if (err <=3D 0) {
> +		xenbus_dev_fatal(dev, err, "bind_evtchn_to_irq");
> +		goto error_evtchan;
> +	}
> +
> +	info->resources[1]=2Eflags =3D IORESOURCE_IRQ;
> +	info->resources[1]=2Estart =3D info->resources[1]=2Eend =3D err;
> +
> +again:
> +	err =3D xenbus_transaction_start(&xbt);
> +	if (err) {
> +		xenbus_dev_fatal(dev, err, "starting transaction");
> +		goto error_irq;
> +	}
> +
> +	err =3D xenbus_printf(xbt, dev->nodename, "event-channel", "%u",
> +			    info->evtchn);
> +	if (err) {
> +		xenbus_transaction_end(xbt, 1);
> +		xenbus_dev_fatal(dev, err, "%s", "writing event-channel");
> +		goto error_irq;
> +	}
> +
> +	err =3D xenbus_transaction_end(xbt, 0);
> +	if (err) {
> +		if (err =3D=3D -EAGAIN)
> +			goto again;
> +		xenbus_dev_fatal(dev, err, "completing transaction");
> +		goto error_irq;
> +	}
> +
> +	dev_set_drvdata(&dev->dev, info);
> +	xenbus_switch_state(dev, XenbusStateInitialised);
> +	return 0;
> +
> +error_irq:
> +	unbind_from_irqhandler(info->resources[1]=2Estart, info);
> +error_evtchan:
> +	xenbus_free_evtchn(dev, info->evtchn);
> +error_info:
> +	kfree(info);
> +
> +	return err;
> +}
> +
> +static void virtio_mmio_xen_backend_changed(struct xenbus_device *dev,
> +				   enum xenbus_state backend_state)
> +{
> +	struct virtio_mmio_xen_info *info =3D dev_get_drvdata(&dev->dev);
> +
> +	switch (backend_state) {
> +	case XenbusStateInitialising:
> +	case XenbusStateInitWait:
> +	case XenbusStateInitialised:
> +	case XenbusStateReconfiguring:
> +	case XenbusStateReconfigured:
> +	case XenbusStateUnknown:
> +		break;
> +
> +	case XenbusStateConnected:
> +		if (dev->state !=3D XenbusStateInitialised) {
> +			dev_warn(&dev->dev, "state %d on connect", dev->state);
> +			break;
> +		}
> +		info->pdev =3D platform_device_register_resndata(&dev->dev,
> +				"virtio-mmio", PLATFORM_DEVID_AUTO,
> +				info->resources, ARRAY_SIZE(info->resources), NULL, 0);
> +		xenbus_switch_state(dev, XenbusStateConnected);
> +		break;
> +
> +	case XenbusStateClosed:
> +		if (dev->state =3D=3D XenbusStateClosed)
> +			break;
> +		fallthrough;	/* Missed the backend's Closing state=2E */
> +	case XenbusStateClosing:
> +		platform_device_unregister(info->pdev);
> +		xenbus_switch_state(dev, XenbusStateClosed);
> +		break;
> +
> +	default:
> +		xenbus_dev_fatal(dev, -EINVAL, "saw state %d at frontend",
> +				 backend_state);
> +		break;
> +	}
> +}
> +

In some way, we're defining a new "PV driver" which is a virtio-mmio=20
one, I guess we can eventually specific some form of protocol that=20
backend/frontend would need to follow ?

> +static void virtio_mmio_xen_remove(struct xenbus_device *dev)
> +{
> +	struct virtio_mmio_xen_info *info =3D dev_get_drvdata(&dev->dev);
> +
> +	kfree(info);
> +	dev_set_drvdata(&dev->dev, NULL);
> +}
> +
> +static const struct xenbus_device_id virtio_mmio_xen_ids[] =3D {
> +	{ "virtio" },
> +	{ "" },
> +};
> +
> +static struct xenbus_driver virtio_mmio_xen_driver =3D {
> +	=2Eids			=3D virtio_mmio_xen_ids,
> +	=2Eprobe			=3D virtio_mmio_xen_probe,
> +	=2Eotherend_changed	=3D virtio_mmio_xen_backend_changed,
> +	=2Eremove			=3D virtio_mmio_xen_remove,
> +};
> +#endif
> +
>   static int __init virtio_mmio_init(void)
>   {
> -	return platform_driver_register(&virtio_mmio_driver);
> +	int ret;
> +
> +	ret =3D platform_driver_register(&virtio_mmio_driver);
> +	if (ret)
> +		return ret;
> +
> +#ifdef CONFIG_VIRTIO_MMIO_XENBUS
> +	if (xen_domain())
> +		ret =3D xenbus_register_frontend(&virtio_mmio_xen_driver);
> +#endif> +
> +	return ret;
>   }
>  =20
>   static void __exit virtio_mmio_exit(void)
>   {
> +#ifdef CONFIG_VIRTIO_MMIO_XENBUS
> +	if (xen_domain())
> +		xenbus_unregister_driver(&virtio_mmio_xen_driver);
> +#endif
> +
>   	platform_driver_unregister(&virtio_mmio_driver);
>   	vm_unregister_cmdline_devices();
>   }



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.241.1dd4a0eaebe8c9a7.19dd9b05f77.138039998489b248=---

