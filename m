Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FP2A6yk82kQ5gEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2026 20:51:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 643444A72A0
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2026 20:51:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1298404.1573734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIWSm-00026G-2a; Thu, 30 Apr 2026 18:50:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1298404.1573734; Thu, 30 Apr 2026 18:50:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIWSl-00023J-Ro; Thu, 30 Apr 2026 18:50:15 +0000
Received: by outflank-mailman (input) for mailman id 1298404;
 Thu, 30 Apr 2026 18:50:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <val@invisiblethingslab.com>) id 1wIWSk-00023D-6z
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2026 18:50:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wIWSj-00GiTV-5w
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2026 20:50:13 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <val@invisiblethingslab.com>)
 id 69f3a44b-5cb7-0a2a0a5109dd-0a2a4506d6dc-22
 for <xen-devel@lists.xenproject.org>; Thu, 30 Apr 2026 20:50:13 +0200
Received: from [103.168.172.145] (helo=fout-a2-smtp.messagingengine.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <val@invisiblethingslab.com>)
 id 69f3a463-7371-0a2a45060019-67a8ac91abe5-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Apr 2026 20:50:12 +0200
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfout.phl.internal (Postfix) with ESMTP id 2E99AEC0099;
 Thu, 30 Apr 2026 14:50:11 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Thu, 30 Apr 2026 14:50:11 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Apr 2026 14:50:08 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm2 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm2 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1777575011; x=1777661411; bh=31eKb1GPyw
	vbkiPuzXzAtZKxLoCKEG3Ll7hcfm5Uv+w=; b=hADA0zpE2YoZUJI7J58ncoiAEz
	gdCloXPZ7RkXVRAYdsE61vycEs4dqhDKW/S2KaQi/TC2lVQ5NJcfCf+Jb3JZ7I6K
	KQZU3K5Jm4n7U7tBE39TE6A+GBc0Yp/n/9U3qqDfgpjMnOiA5ZL6GQiA/8NThSYC
	9qVTk69L7Vtlq8D/AS+ylouDUxdMXOcTnsGNI+q3RPUslU6Cnz4Y0+lpCB7+yl6V
	W/sAfTGEiLsZdtBd6q8H6phv2DTOcwYSBMRI/lIXyieOrv/3Ffnd43XIEDpPyC0U
	WJmELkWGgyyX6Cvk9XrkXVe4SdN9ZbbQGVWNhqLi2aOsTrVe2ghX8O2XKiCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1777575011; x=
	1777661411; bh=31eKb1GPywvbkiPuzXzAtZKxLoCKEG3Ll7hcfm5Uv+w=; b=m
	Tsfiq2AL7mY211mEcqEwT+2vwIJQ/HtQBCYVB4lFqkTT0d5FkMJdK5hcB0MiYyga
	640m+ufFgor2QVRAdNMK2dfS/7jyQOC5hJ4EP4tvM4OAz0cpJw9H8sFnEXwr2VsY
	zfXJUNo0jQp5X1qUkAc7Yy5li18i1ar4U+Ma+h3C2p/ix0KmthnZseZBJek0ZRpQ
	sh0MlJqew3GseGrzwd8f2hhGCO2qECUZ+WLEgYGJLFvE/NjdrRSalw1N7cEo3WJl
	zTOZLZHPXdgXd1zffpUM1/jaCzLohLqWLw4VYbV+wST5YuDMFtMm6Woz8e2T2kkQ
	cvP2phYFH3eEuanoOECMw==
X-ME-Sender: <xms:YqTzaXUBYHSSjmi8ehtPFkUTVDvanc1C2xM37cO0KpOSZsjGTDIFsg>
    <xme:YqTzaXzNfV71ll1jNbA0kR1JToKSLZ6l1Q1vBrvbyPgtnnEzVJeBB5nBAc5Xmluio
    -A-hKPg0U7wMYVhWCbdP2lUf25B4-poMgQ61dIa321KeyQrF4c>
X-ME-Received: <xmr:YqTzae-n-MFPEMn9IbUCMBtHYzzXufuFMkZD2HWINpaa5ecTV144WWPOkNf0o8kKAw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekkedtkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomhepgggrlhcurfgr
    tghkvghtthcuoehvrghlsehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqne
    cuggftrfgrthhtvghrnhepheekgfefveetkeethffhgeeivdffkeegueevkeefveeltefg
    leehffegudegkedvnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehvrghlsehinhhvihhsihgs
    lhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepuddtpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehtvgguugihrdgrshhtihgvsehvrghtvghsrdhtvggt
    hhdprhgtphhtthhopehmshhtsehrvgguhhgrthdrtghomhdprhgtphhtthhopehjrghsoh
    ifrghnghesrhgvughhrghtrdgtohhmpdhrtghpthhtohepgihurghniihhuhhosehlihhn
    uhigrdgrlhhisggrsggrrdgtohhmpdhrtghpthhtohepvghpvghrvgiimhgrsehrvgguhh
    grthdrtghomhdprhgtphhtthhopehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhi
    nhhgshhlrggsrdgtohhmpdhrtghpthhtohepvhhirhgvshhhrdhkuhhmrghrsehlihhnrg
    hrohdrohhrghdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhr
    ohhjvggtthdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrd
    hkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:YqTzac_AjHKvXA36zYPO7mpL7WCtVF8h4yrJV5k80i1B6YRAfJBLGQ>
    <xmx:YqTzadVVSnPGgTuGP7zuMk5_cAFf1Oep4Kw18Ky65JiSYPb-yxPaJw>
    <xmx:YqTzaZe8BK1-pNUhq2QALHn9BNbvD3wih_hIqonJZlII6H7hnYNMqg>
    <xmx:YqTzaWYRc4mwkSgPJVwFLhtit2XC2b2KD0HFEpCJ9kSH-XYkLXxd3w>
    <xmx:Y6Tzad-W9K1K9gMyTK8AWY_EOa3OxDxN6FHYxEHlm-m6gSs5rnrayJDO>
Feedback-ID: i001e48d0:Fastmail
Message-ID: <b3cfed78-15db-459a-9f69-155ea615ecf8@invisiblethingslab.com>
Date: Thu, 30 Apr 2026 15:50:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] virtio-mmio: add xenbus probing
To: Teddy Astie <teddy.astie@vates.tech>, "Michael S. Tsirkin"
 <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev
References: <20260429141339.74472-1-val@invisiblethingslab.com>
 <1777473712.8631fc262581453bbf619ec5b2062170.19dd9b07146000f373@vates.tech>
 <fd6493ac-9d3e-475a-a844-6e53b0472820@invisiblethingslab.com>
 <1777536698.8631fc262581453bbf619ec5b2062170.19ddd7187da000f373@vates.tech>
 <74953b6a-d195-4a12-800d-af324ff35b29@invisiblethingslab.com>
 <1777556830.8631fc262581453bbf619ec5b2062170.19ddea4b728000f373@vates.tech>
Content-Language: en-US
From: Val Packett <val@invisiblethingslab.com>
Autocrypt: addr=val@invisiblethingslab.com; keydata=
 xm8EaFTEiRMFK4EEACIDAwQ+qzawvLuE95iu+QkRqp8P9z6XvFopWtYOaEnYf/nE8KWCnsCD
 jz82tdbKBpmVOdR6ViLD9tzHvaZ1NqZ9mbrszMXq09VfefoCfZp8jnA2yCT8Y4ykmv6902Ne
 NnlkVwrNKFZhbCBQYWNrZXR0IDx2YWxAaW52aXNpYmxldGhpbmdzbGFiLmNvbT7CswQTEwkA
 OxYhBAFMrro+oMGIFPc7Uc87uZxqzalRBQJoVMSJAhsDBQsJCAcCAiICBhUKCQgLAgQWAgMB
 Ah4HAheAAAoJEM87uZxqzalRlIIBf0cujzfSLhvib9iY8LBh8Tirgypm+hJHoY563xhP0YRS
 pmqZ6goIuSGpEKcW5mV3egF/TLLAOjsfroWae4giImTVOJvLOsUycxAP4O5b1Qiy+cCGsHKA
 nCRzrvqnPkyf4OeRznMEaFTEiRIFK4EEACIDAwSffe3tlMmmg3eKVp7SJ+CNZLN0M5qzHSCV
 dBBkIVvEJo+8SDg4jrx/832rxpvMCz2+x7+OHaeBHKafhOWUccYBLKqV/3nBftxCkbzXDbfY
 d02BY9H4wBIn0Y3GnwoIXRgDAQkJwpgEGBMJACAWIQQBTK66PqDBiBT3O1HPO7mcas2pUQUC
 aFTEiQIbDAAKCRDPO7mcas2pUaptAX9f7yUJLGU4C6XjMJvXd8Sz6cGTyxkngPtUyFiNqtad
 /GXBi3vHKYNfSrdqJ8wmZ8MBgOqWaaa1wE4/3qZU8d4RNR8mF7O40WYK/wdf1ycq1uGad8PN
 UDOwAqdfvuF3w8QMPw==
In-Reply-To: <1777556830.8631fc262581453bbf619ec5b2062170.19ddea4b728000f373@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1777575013-91678D75-278DF2CF/0/0
X-purgate-type: clean
X-purgate-size: 5250
X-Rspamd-Queue-Id: 643444A72A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm2,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,invisiblethingslab.com:dkim,invisiblethingslab.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:mst@redhat.com,m:jasowang@redhat.com,m:xuanzhuo@linux.alibaba.com,m:eperezma@redhat.com,m:marmarek@invisiblethingslab.com,m:viresh.kumar@linaro.org,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:virtualization@lists.linux.dev,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[val@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[val@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]

On 4/30/26 10:47 AM, Teddy Astie wrote:
> Le 30/04/2026 à 10:51, Val Packett a écrit :
>> On 4/30/26 5:11 AM, Teddy Astie wrote:
>>> Le 30/04/2026 à 06:06, Val Packett a écrit :
>>>> [..]
>>>>>> I'd like to get some early feedback for this patch, particularly
>>>>>> the general stuff:
>>>>>>
>>>>>> * is this whole thing acceptable in general?
>>>>>> * should it be extracted into a different file?
>>>>>> * (from the Xen side) any input on the xenstore keys, what goes where?
>>>>>> * anything else to keep in mind?
>>>>>>
>>>>>> It does seem simple enough, so hopefully this can be done?
>>>>>>
>>>>>> The corresponding userspace-side WIP is available at:
>>>>>> https://github.com/QubesOS/xen-vhost-frontend
>>>>>>
>>>>>> And the required DMOP for firing the evtchn events will be sent
>>>>>> to xen-devel shortly as well.
>>>>> Could that be done through evtchn_send (or its userland counterpart) ?
>>>> Actually, yes… The use of DMOPs is only dictated by the current Linux
>>>> privcmd.c code (the irqfds created by the kernel react to events by
>>>> executing HYPERVISOR_dm_op with a stored operation), we can avoid the
>>>> need to modify Xen by simply expanding the privcmd driver to make
>>>> "evtchn fds". Sounds good, will do.
>>>>
>>> Given that the event channel used by device models is exposed through
>>> ioreq.vp_eport ("evtchn for notifications to/from device model"). I
>>> don't think you need to expand the privcmd interface, and you should be
>>> able to do this instead :
>>>
>>> open /dev/xen/evtchn
>>> perform IOCTL_EVTCHN_BIND_INTERDOMAIN (for each guest vCPU)
>>>      with remote_domain=guest_domid, remote_port=ioreq.vp_eport
>>>
>>> Then interact with the event channel through IOCTL_EVTCHN_NOTIFY (with
>>> local port given by IOCTL_EVTCHN_BIND_INTERDOMAIN) and read/write on the
>>> file descriptor.
>> So the reason there's currently an ioctl to bind an eventfd to fire a
>> stored DMOP is that the whole idea is to (efficiently!) support generic,
>> hypervisor-neutral device server implementations via the vhost-user
>> protocol.
>>
>> Now of course, the current implementation isn't *entirely* hypervisor-
>> neutral as e.g. the vm-memory Rust crate (inside of the "neutral" vhost-
>> user device servers) does need to be built with the `xen` feature. But
>> still, that's how it works. What can be made generic is generic.
>>
>> xen-vhost-frontend, which is the thing that integrates these with Xen,
>> actually used to handle the interrupts in userspace[1] by firing the
>> DMOP itself (which is where I could "just replace that with
>> IOCTL_EVTCHN_NOTIFY") but that was offloaded to the kernel with the
>> introduction of IOCTL_PRIVCMD_IRQFD[2], similarly to KVM_IRQFD.
>>
> I think what would be preferable for your usecase would be to have a way
> to bind a event channel with a eventfd object, which should be a
> primitive that lives in the evtchn device.

Yeah, it would be an ioctl on the evtchn device, definitely. I wasn't 
being exact when I said "extend privcmd", sorry. I just meant "handling 
it on the Linux side" generally!

> The current interface kinda assume that you're looking to emulate a
> completely emulated virtio device with no Xen specifics, it looks like
> it's not exactly what you're implementing.
It's already implemented, and I'm not looking to change it much, just to 
make it work on x86_64. The only thing that wasn't already compatible 
was firing the host-to-guest interrupt, because on x86_64 we don't have 
anything like the (v)GIC with its massive arbitrary IRQ number space. 
Event channels are the only way to interrupt a PVH guest, hence using 
xenbus in the guest to provision the device.
> As you actually plan to switch to using event channels for notifying the
> guest, I think it would be preferable to do the same the other way
> (event channels to notify the host) so you only have event channels to
> worry about here.

The other direction is already implemented perfectly well in 
IOCTL_PRIVCMD_IOEVENTFD. The MMIO area is set up like so:

- ioreq is mapped with 
IOCTL_PRIVCMD_MMAP_RESOURCE(XENMEM_resource_ioreq_server, ..);
- vp_eport event channels (per cpu) are bound to the current domain via 
IOCTL_EVTCHN_BIND_INTERDOMAIN;
- those are passed, along with the ioreq page itself, to 
IOCTL_PRIVCMD_IOEVENTFD to get an eventfd that fires when a virtqueue is 
ready;
- which is an eventfd that xen-vhost-frontend passes to the vhost-user 
device server.

So for this direction, it's not a 1:1 mapping but rather a specific 
contraption designed to efficiently handle this use case:

- when an ioreq event channel (for any of the vcpus) fires,
- the kernel handler (ioeventfd_interrupt) checks if it's specifically 
an IOREQ_WRITE write to the VIRTIO_MMIO_QUEUE_NOTIFY offset,
- and if so, it signals the eventfd for any virtqueue that has new data 
(waking the generic device server which has the eventfd, so bypassing 
xen-vhost-frontend), pings the guest back via evtchn, and returns 
IRQ_HANDLED;
- otherwise the request is handled in userspace by xen-vhost-frontend 
(virtio configuration register access).

It just works :)

~val


