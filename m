Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHEfOQYP82nywwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2026 10:12:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 493BF49F1A5
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2026 10:12:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1297969.1573606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIMUp-0003xS-RQ; Thu, 30 Apr 2026 08:11:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1297969.1573606; Thu, 30 Apr 2026 08:11:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIMUp-0003uV-Mb; Thu, 30 Apr 2026 08:11:43 +0000
Received: by outflank-mailman (input) for mailman id 1297969;
 Thu, 30 Apr 2026 08:11:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ddd7187da000f373@swg.vates.tech>)
 id 1wIMUo-0003u9-5f
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2026 08:11:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wIMUn-004hyE-FJ
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2026 10:11:41 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ddd7187da000f373@swg.vates.tech>)
 id 69f30eb8-bab6-0a2a0a5309dd-0a2a450c85a2-28
 for <xen-devel@lists.xenproject.org>; Thu, 30 Apr 2026 10:11:41 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ddd7187da000f373@swg.vates.tech>)
 id 69f30ebc-62f1-0a2a450c0019-b9ff1c229d73-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Apr 2026 10:11:41 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ddd7187da000f373.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 30 Apr 2026 08:11:38 +0000
Received: from [192.168.1.18] (88-175-170-134.subs.proxad.net [88.175.170.134])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 799C0812E3;
 Thu, 30 Apr 2026 10:11:37 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=K5BjNIf9tFswbQOeYBUyQT6QRAHcFYHBub2Z81jUwUA=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=jPZTmBGDpHx3CzsFlQeJd9hPGpuHvqcmZ4AVvUiyLEYeHdra+By20dyF4BK2rIs69alylUEjL
 VL4Sll+7kQhYiYhz2+y+Q+HubVftb2RSYJleBUn3wBsitDOWivyLd/qzNVsO+uvN0Q/lX9x9W2H
 p1KCvySnTsE9etua52aqtqFsFDK+/XRvg+tVTAOh5dXogf2DS1MqJ/kwq6ocKXj6MiaTCfdI0Qb
 d432sLkyq0DIQkJBivKg+0Vg0+zMEe/SUhkGgGyl4tQPXH6NeWBiBMEOy7KKEVKBAP52x+kXK4u
 OyDhZI0MMu9kcO12sG49GTjMnVzzn2U1I7vNliloOuBQ==
X-Zone-Loop: 6dcc421ef085fe90b37f11069ea918596341758269d3
x-campaign-type: default
x-transaction-id: 4403762b-e761-4f62-98b1-a2a661b111a6
x-swg-uid: 01-a5b5fcde-d16a-4aac-891e-b341eb3a09ef
X-Mailer: Sweego
Message-ID:
 <1777536698.8631fc262581453bbf619ec5b2062170.19ddd7187da000f373@vates.tech>
x-swg-bid: 1777536698.8631fc262581453bbf619ec5b2062170.19ddd7187da000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Thu, 30 Apr 2026 10:11:37 +0200
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
 <1777473712.8631fc262581453bbf619ec5b2062170.19dd9b07146000f373@vates.tech>
 <fd6493ac-9d3e-475a-a844-6e53b0472820@invisiblethingslab.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
In-Reply-To: <fd6493ac-9d3e-475a-a844-6e53b0472820@invisiblethingslab.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2fd.57a79a2994658d0b.19ddd718549.d4fe0c9720373f89=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1777536697674
X-purgate-ID: tlsNG-d25034/1777536701-6E975CF5-37DAD087/0/0
X-purgate-type: clean
X-purgate-size: 4998
X-Rspamd-Queue-Id: 493BF49F1A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[5];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:val@invisiblethingslab.com,m:mst@redhat.com,m:jasowang@redhat.com,m:xuanzhuo@linux.alibaba.com,m:eperezma@redhat.com,m:marmarek@invisiblethingslab.com,m:viresh.kumar@linaro.org,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:virtualization@lists.linux.dev,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:url,vates.tech:dkim,vates.tech:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

---=Part.2fd.57a79a2994658d0b.19ddd718549.d4fe0c9720373f89=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 30/04/2026 =C3=A0 06:06, Val Packett a =C3=A9crit=C2=A0:
>=20
> On 4/29/26 11:41 AM, Teddy Astie wrote:
>> Hello,
>>
>> Le 29/04/2026 =C3=A0 16:18, Val Packett a =C3=A9crit=C2=A0:
>>> [=E2=80=A6]
>>>
>>> I've been working on porting virtio-mmio support from Arm to x86_64,
>>> with the goal of running vhost-user-gpu to power Wayland/GPU integrati=
on
>>> for Qubes OS=2E (I'm aware of various proposals for alternative virtio
>>> transports but virtio-mmio seems to be the only one that *is* upstream
>>> already and just Works=2E=2E) Setting up virtio-mmio through xenbus,=
=20
>>> initially
>>> motivated just by event channels being the only real way to get=20
>>> interrupts
>>> working on HVM, turned out to generally be quite pleasant and nice :)
>> Is it HVM specific, or can we also make it work for PVH (we can actuall=
y
>> attach a ioreq server to PVH guests) ?
>=20
> Sorry, typo, I did mean PVH of course!
>=20
> I've been testing this with PVH guests + PV dom0, with my PV alloc_ioreq=
=20
> fix:
> https://lore=2Ekernel=2Eorg/all/20251126062124=2E117425-1-=20
> val@invisiblethingslab=2Ecom/
>=20
> (Time to resend that one as a non-RFC I guess=E2=80=A6)
>=20
> HVM actually does have legacy ISA interrupts (which are often used with=
=20
> virtio-mmio on KVM), funnily enough, and I've tried firing those from a=
=20
> DMOP but that silly thing didn't work properly=2E
>=20
>>> I'd like to get some early feedback for this patch, particularly
>>> the general stuff:
>>>
>>> * is this whole thing acceptable in general?
>>> * should it be extracted into a different file?
>>> * (from the Xen side) any input on the xenstore keys, what goes where?
>>> * anything else to keep in mind?
>>>
>>> It does seem simple enough, so hopefully this can be done?
>>>
>>> The corresponding userspace-side WIP is available at:
>>> https://github=2Ecom/QubesOS/xen-vhost-frontend
>>>
>>> And the required DMOP for firing the evtchn events will be sent
>>> to xen-devel shortly as well=2E
>> Could that be done through evtchn_send (or its userland counterpart) ?
>=20
> Actually, yes=E2=80=A6 The use of DMOPs is only dictated by the current =
Linux=20
> privcmd=2Ec code (the irqfds created by the kernel react to events by=20
> executing HYPERVISOR_dm_op with a stored operation), we can avoid the=20
> need to modify Xen by simply expanding the privcmd driver to make=20
> "evtchn fds"=2E Sounds good, will do=2E
>=20

Given that the event channel used by device models is exposed through=20
ioreq=2Evp_eport ("evtchn for notifications to/from device model")=2E I=20
don't think you need to expand the privcmd interface, and you should be=20
able to do this instead :

open /dev/xen/evtchn
perform IOCTL_EVTCHN_BIND_INTERDOMAIN (for each guest vCPU)
   with remote_domain=3Dguest_domid, remote_port=3Dioreq=2Evp_eport

Then interact with the event channel through IOCTL_EVTCHN_NOTIFY (with=20
local port given by IOCTL_EVTCHN_BIND_INTERDOMAIN) and read/write on the=
=20
file descriptor=2E

I have some experimental Rust code to work with event channels [1], but=20
I think you can find similar code in multiples places=2E

[1]
https://github=2Ecom/TSnake41/rust-vmm-xen/blob/redesign-proposal/xen/src/=
event/mod=2Ers
https://github=2Ecom/TSnake41/rust-vmm-xen/blob/redesign-proposal/xen-unix=
/src/event/mod=2Ers

>>> [=2E=2E]
>>>
>>> diff --git a/drivers/virtio/Kconfig b/drivers/virtio/Kconfig
>>> index ce5bc0d9ea28=2E=2E56bc2b10526b 100644
>>> --- a/drivers/virtio/Kconfig
>>> +++ b/drivers/virtio/Kconfig
>>> @@ -171,6 +171,13 @@ config VIRTIO_MMIO_CMDLINE_DEVICES
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If unsure, say 'N'=2E
>>> +config VIRTIO_MMIO_XENBUS
>>> +=C2=A0=C2=A0=C2=A0 bool "Memory mapped virtio devices parameter parsi=
ng"
>> that text seems to miss the xenbus aspect
> Yep, didn't change that yet, ack
>>> [=2E=2E]
>> In some way, we're defining a new "PV driver" which is a virtio-mmio
>> one, I guess we can eventually specific some form of protocol that
>> backend/frontend would need to follow ?
>=20
> Right,=C2=A0J=C3=BCrgen mentioned documenting the keys in the xenstore-p=
aths doc=2E=2E=20
> would the entire "protocol" (keys + state transition logic) fit into tha=
t?
>=20
> The keys are currently derived from the initial Arm prototype which=20
> wasn't actually using xenbus properly (the guest driver was configured=
=20
> by a device tree node, but the ioreq server used xenstore keys, without=
=20
> properly transitioning between states)=2E
>=20
>=20
> Thanks,
> ~val
>=20
>=20

Teddy


-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.2fd.57a79a2994658d0b.19ddd718549.d4fe0c9720373f89=---

