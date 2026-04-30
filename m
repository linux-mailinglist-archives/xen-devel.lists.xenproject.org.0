Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJzzEZMX82llxAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2026 10:49:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6370649F69A
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2026 10:49:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1297999.1573624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIN53-0000b4-OT; Thu, 30 Apr 2026 08:49:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1297999.1573624; Thu, 30 Apr 2026 08:49:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIN53-0000Yo-Lm; Thu, 30 Apr 2026 08:49:09 +0000
Received: by outflank-mailman (input) for mailman id 1297999;
 Thu, 30 Apr 2026 08:49:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <val@invisiblethingslab.com>) id 1wIN51-0000Yi-Nr
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2026 08:49:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wIN51-00FgvN-0H
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2026 10:49:07 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <val@invisiblethingslab.com>)
 id 69f3177f-5cb7-0a2a0a5109dd-0a2a450484fe-8
 for <xen-devel@lists.xenproject.org>; Thu, 30 Apr 2026 10:49:06 +0200
Received: from [202.12.124.147] (helo=fout-b4-smtp.messagingengine.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <val@invisiblethingslab.com>)
 id 69f31781-1dec-0a2a45040019-ca0c7c93ab0f-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Apr 2026 10:49:06 +0200
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfout.stl.internal (Postfix) with ESMTP id 81BCF1D00085;
 Thu, 30 Apr 2026 04:49:04 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Thu, 30 Apr 2026 04:49:05 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Apr 2026 04:49:01 -0400 (EDT)
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
	:subject:to:to; s=fm2; t=1777538944; x=1777625344; bh=itJ09kw1rI
	kq9vePbBZGgye6O4mab+wDcKEKpPA6Ruw=; b=CI/eJzN+QU+rVuluRmyQukY6gA
	ft9znjEvkBtXSgpJuO6Zqt4KmHx3LnRtOurN1Wp1mlxntz4GoELXICVJur1ype6S
	BtVpuYz1Qt5T9I0SvUtg+4yzLqFweH23Y6U8XxFcQeKpyolPmJUwFn9jURUNIQXp
	qt24kiEUhpMPdzRUODxQEJ9ww4GD4KVFG2tP5jAY4cYkFFbFMUlqOFTmnxKUFj0E
	5ux2KxC2e0bY+uvKDKUo0F6Xu7N+ORyXi9ypg0F1Px6sQrX8SZD62PIxeAf79pZ0
	zwKMwXTg0ZbEJTl3JXb/TDBrf1OzisKtaZiRdtt1qi5QfrY8xKVOxQlycMZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1777538944; x=
	1777625344; bh=itJ09kw1rIkq9vePbBZGgye6O4mab+wDcKEKpPA6Ruw=; b=s
	ZIM2f50K+wFPnLYpbt1jDpWlmvb0lQAN8/8x2rubC4aUND4rtnmVHPGtFxVKF9hX
	ROFX+J8PvyUkxpV/75cA05kmwOAyxxik1fSGVeJLY6+tyEUupxw3BwHB2+7QKryy
	mXeyMYyy3vJVPCUffXPufxrUGp3y74w1iB7DBjnISVCULSwKf5nkllC3oIm0VC/P
	Jc/CkglLk7ubJHpd041AFbw43ha4oWbY1MCxn2+dex9oZqKlh0ZWdaaKIJ8Ahm5p
	oNNTH7jDu/FuMptycKTZQSaQHpqflxL3kGAW3A/nKtzcD2IjsGLW6LQRnXlF3sJ4
	Icwv7nab5T9MxPvuisyHQ==
X-ME-Sender: <xms:fxfzaa54m6jJXX4fNsH8OYzo0UtK8J5Fdj_KgeBLSHJp0swmFWs0LA>
    <xme:fxfzaTl4gSYty0SqVz4Lm_Yjg_uXOq_zjYVSjzagN_2TJmAqroYw1x4HumnPRZ-Rx
    ffhDRcslxeii5rietGGnAU6J36HTf0XCy0M30MIODiinDBjMw>
X-ME-Received: <xmr:fxfzaVHsJ1waVWApTgN5LWvy59-HdCiSKYGFMoBZJP__MeOfzx-jVvSnRV4FuXX73Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekieekkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomhepgggrlhcurfgr
    tghkvghtthcuoehvrghlsehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqne
    cuggftrfgrthhtvghrnhepjeehkeffhedvffeffffflefgfeejudejiefhtdeijeeuteei
    teejtdettdeuleevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrd
    gtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    vhgrlhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtth
    hopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthgvugguhidrrghsthhi
    vgesvhgrthgvshdrthgvtghhpdhrtghpthhtohepmhhsthesrhgvughhrghtrdgtohhmpd
    hrtghpthhtohepjhgrshhofigrnhhgsehrvgguhhgrthdrtghomhdprhgtphhtthhopeig
    uhgrnhiihhhuoheslhhinhhugidrrghlihgsrggsrgdrtghomhdprhgtphhtthhopegvph
    gvrhgviihmrgesrhgvughhrghtrdgtohhmpdhrtghpthhtohepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdprhgtphhtthhopehvihhrvghshh
    drkhhumhgrrheslhhinhgrrhhordhorhhgpdhrtghpthhtohepgigvnhdquggvvhgvlhes
    lhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheplhhinhhugidqkh
    gvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:fxfzaS-oSito__s2A4LRHQPxKSW2ryP5NEMTTdGRKuk6f3f4lD15ug>
    <xmx:fxfzaemoHEbPfWLUfJdODKrvZ-zejgXUY2_HB_xH1VVtXgeV6oG9hQ>
    <xmx:fxfzaVBcjC6MCROghfGWzu4eY6opJYDBJzfMg37R5LNSRjatAZdL1w>
    <xmx:fxfzafWYpCNKk2lbLM9VKFZvPp_AWhNh0h95Siq-owLyKLghm09HMA>
    <xmx:gBfzaeidi626Hg46vBsfx6J90jhf44auaIdPPP3MpGET092Q64dmeDgJ>
Feedback-ID: i001e48d0:Fastmail
Message-ID: <74953b6a-d195-4a12-800d-af324ff35b29@invisiblethingslab.com>
Date: Thu, 30 Apr 2026 05:48:59 -0300
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
In-Reply-To: <1777536698.8631fc262581453bbf619ec5b2062170.19ddd7187da000f373@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1777538946-328753FF-D2D1B605/0/0
X-purgate-type: clean
X-purgate-size: 4389
X-Rspamd-Queue-Id: 6370649F69A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm2,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:mst@redhat.com,m:jasowang@redhat.com,m:xuanzhuo@linux.alibaba.com,m:eperezma@redhat.com,m:marmarek@invisiblethingslab.com,m:viresh.kumar@linaro.org,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:virtualization@lists.linux.dev,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[val@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]


On 4/30/26 5:11 AM, Teddy Astie wrote:
> Le 30/04/2026 à 06:06, Val Packett a écrit :
>> On 4/29/26 11:41 AM, Teddy Astie wrote:
>>> Hello,
>>>
>>> Le 29/04/2026 à 16:18, Val Packett a écrit :
>>>> […]
>>>>
>>>> I've been working on porting virtio-mmio support from Arm to x86_64,
>>>> with the goal of running vhost-user-gpu to power Wayland/GPU integration
>>>> for Qubes OS. (I'm aware of various proposals for alternative virtio
>>>> transports but virtio-mmio seems to be the only one that *is* upstream
>>>> already and just Works..) Setting up virtio-mmio through xenbus,
>>>> initially
>>>> motivated just by event channels being the only real way to get
>>>> interrupts
>>>> working on HVM, turned out to generally be quite pleasant and nice :)
>>> Is it HVM specific, or can we also make it work for PVH (we can actually
>>> attach a ioreq server to PVH guests) ?
>> Sorry, typo, I did mean PVH of course!
>>
>> I've been testing this with PVH guests + PV dom0, with my PV alloc_ioreq
>> fix:
>> https://lore.kernel.org/all/20251126062124.117425-1-
>> val@invisiblethingslab.com/
>>
>> (Time to resend that one as a non-RFC I guess…)
>>
>> HVM actually does have legacy ISA interrupts (which are often used with
>> virtio-mmio on KVM), funnily enough, and I've tried firing those from a
>> DMOP but that silly thing didn't work properly.
>>
>>>> I'd like to get some early feedback for this patch, particularly
>>>> the general stuff:
>>>>
>>>> * is this whole thing acceptable in general?
>>>> * should it be extracted into a different file?
>>>> * (from the Xen side) any input on the xenstore keys, what goes where?
>>>> * anything else to keep in mind?
>>>>
>>>> It does seem simple enough, so hopefully this can be done?
>>>>
>>>> The corresponding userspace-side WIP is available at:
>>>> https://github.com/QubesOS/xen-vhost-frontend
>>>>
>>>> And the required DMOP for firing the evtchn events will be sent
>>>> to xen-devel shortly as well.
>>> Could that be done through evtchn_send (or its userland counterpart) ?
>> Actually, yes… The use of DMOPs is only dictated by the current Linux
>> privcmd.c code (the irqfds created by the kernel react to events by
>> executing HYPERVISOR_dm_op with a stored operation), we can avoid the
>> need to modify Xen by simply expanding the privcmd driver to make
>> "evtchn fds". Sounds good, will do.
>>
> Given that the event channel used by device models is exposed through
> ioreq.vp_eport ("evtchn for notifications to/from device model"). I
> don't think you need to expand the privcmd interface, and you should be
> able to do this instead :
>
> open /dev/xen/evtchn
> perform IOCTL_EVTCHN_BIND_INTERDOMAIN (for each guest vCPU)
>     with remote_domain=guest_domid, remote_port=ioreq.vp_eport
>
> Then interact with the event channel through IOCTL_EVTCHN_NOTIFY (with
> local port given by IOCTL_EVTCHN_BIND_INTERDOMAIN) and read/write on the
> file descriptor.

So the reason there's currently an ioctl to bind an eventfd to fire a 
stored DMOP is that the whole idea is to (efficiently!) support generic, 
hypervisor-neutral device server implementations via the vhost-user 
protocol.

Now of course, the current implementation isn't *entirely* 
hypervisor-neutral as e.g. the vm-memory Rust crate (inside of the 
"neutral" vhost-user device servers) does need to be built with the 
`xen` feature. But still, that's how it works. What can be made generic 
is generic.

xen-vhost-frontend, which is the thing that integrates these with Xen, 
actually used to handle the interrupts in userspace[1] by firing the 
DMOP itself (which is where I could "just replace that with 
IOCTL_EVTCHN_NOTIFY") but that was offloaded to the kernel with the 
introduction of IOCTL_PRIVCMD_IRQFD[2], similarly to KVM_IRQFD.

Switching back to handling the eventfd in userspace would be a literal 
deoptimization :)

While throwing away the whole generic layer to do a fully integrated 
use-case-specific thing sounds more difficult/tedious than this, and not 
necessarily desirable in general.

[1]: 
https://github.com/vireshk/xen-vhost-frontend/commit/06d59035f8a387c0f600931d09dfaa27b80ede7f
[2]: 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=f8941e6c4c712948663ec5d7bbb546f1a0f4e3f6

~val


