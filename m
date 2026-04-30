Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNobEWbU8mmyugEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2026 06:02:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DFC49D22D
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2026 06:02:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1297908.1573579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIIaj-0001zh-EO; Thu, 30 Apr 2026 04:01:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1297908.1573579; Thu, 30 Apr 2026 04:01:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIIaj-0001wk-73; Thu, 30 Apr 2026 04:01:33 +0000
Received: by outflank-mailman (input) for mailman id 1297908;
 Thu, 30 Apr 2026 04:01:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <val@invisiblethingslab.com>) id 1wIIah-0001we-Ns
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2026 04:01:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wIIag-007PkR-LM
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2026 06:01:30 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <val@invisiblethingslab.com>)
 id 69f2d40c-5cb7-0a2a0a5109dd-0a2a4507c7ee-42
 for <xen-devel@lists.xenproject.org>; Thu, 30 Apr 2026 06:01:30 +0200
Received: from [103.168.172.149] (helo=fout-a6-smtp.messagingengine.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <val@invisiblethingslab.com>)
 id 69f2d419-229c-0a2a45070019-67a8ac9580f9-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Apr 2026 06:01:30 +0200
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfout.phl.internal (Postfix) with ESMTP id 12B8FEC0047;
 Thu, 30 Apr 2026 00:01:29 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Thu, 30 Apr 2026 00:01:29 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Apr 2026 00:01:25 -0400 (EDT)
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
	:subject:to:to; s=fm2; t=1777521689; x=1777608089; bh=2ylbdgSEO3
	g7pTjq5Ngy4PvXfav/Y4wiIhm1YRccQLc=; b=m+rIUvnRjz9/8XoBRi1na6YL0m
	qtCPtZbQTvHnQiqB9jSXUAA6TwJjlOJoLdVvPYtEIusCCjyA6t4lBfi1O8NEM66A
	GZR30GH9ZetjhaPGYmY93MGqBUMeeNvezCjsuF5nsWiVt7EVDnCKamRQ3Nv2Jubf
	EqOGPGVH2tDZFdY9aq/X3Ljso7OAdhH0LQeDGjWGFA74kmOrd8l0e1eOMbnoV7FS
	kC4+NLoH/LnesKHXQSdGsoM2I1tjl/Dw3VFZKFEC2eJ+3Egts+B6vEjrOThm9Zga
	NvDPTK9d1lRDwFjU8+uVGJN4YUnJjUxk3JU/AB2XIWCuRI1Ft5jUAFkOFBWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1777521689; x=
	1777608089; bh=2ylbdgSEO3g7pTjq5Ngy4PvXfav/Y4wiIhm1YRccQLc=; b=Q
	pLe9WRYowph1Kl4KLVOS5KSidJSLOTifNzNH/SP7law4UKeAIA+pmlUITiD32ot+
	jZYGLNVxwkO9br9gYnvnLafM60jLXm7OoPRHUosPcLlfsmnEmt+P3ywLDbMAtexQ
	KPCyXdSyrx7Kw7Xx+0ZJwO3MeoqCQI1abABbz1Z6c1c8rvOkEyk+Crk/815sgBfY
	vp4H+LZ0lJy26/nXVf73/iRFxZpqHjV8tgJOcMl+dy/E87rw+S3KVaRv+d6wyoua
	tESPlHtQCQHVIiIjPjvB9DLkhP1eUM57U6kWE8J4JK87ru0uin9u6n+1OpvHFA9f
	UENUGHSwFjHky+B/RctIQ==
X-ME-Sender: <xms:GNTyabX8PBPDfqwgBJY7ZPBDWRtlqfyzR1VU_l90N9jo6MNVknCAxw>
    <xme:GNTyabxHUKsyUArbro6Ihy9eXSDlLk1eeZ-7kYpfqkLECGeMCHyFvACmfHz0Dhmst
    7wWPMzqWb56I2GvsV8Um7bq2wgzt0otN8z96JHbjb1thfebfHg>
X-ME-Received: <xmr:GNTyaS81bMRlVmF02nYmg-sjCwKsTA64eyvXUqWaZhLEnfOLHlFlcM2A8P6YJCu5LA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekieefudcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:GNTyaQ9lpwWEvk7D3W8FOh-v8UFvy9LxD077RmK18-iGsxLBpoBz4A>
    <xmx:GNTyaRXFM_C8bISyB3i7LdjfauPLV9X3t-nWnjGRYfaWm68YS0Qwmg>
    <xmx:GNTyadeaXKWt2qxuCLhWVSLndggsuCTkf0mnZSRjDKLk7NNMj3f5jQ>
    <xmx:GNTyaaYyiptX3NkomcuJsJ32POBzihjItVqHl3XfHHuPE-wTrpR3KA>
    <xmx:GdTyaR_elsMaFCiS5kLMPtw1pVuxe2GZrjMOk0JwWSMBarSfnRE4KbXO>
Feedback-ID: i001e48d0:Fastmail
Message-ID: <fd6493ac-9d3e-475a-a844-6e53b0472820@invisiblethingslab.com>
Date: Thu, 30 Apr 2026 01:01:22 -0300
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
In-Reply-To: <1777473712.8631fc262581453bbf619ec5b2062170.19dd9b07146000f373@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1777521690-2BD7FC48-0F9579A8/0/0
X-purgate-type: clean
X-purgate-size: 3318
X-Rspamd-Queue-Id: 99DFC49D22D
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
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]


On 4/29/26 11:41 AM, Teddy Astie wrote:
> Hello,
>
> Le 29/04/2026 à 16:18, Val Packett a écrit :
>> […]
>>
>> I've been working on porting virtio-mmio support from Arm to x86_64,
>> with the goal of running vhost-user-gpu to power Wayland/GPU integration
>> for Qubes OS. (I'm aware of various proposals for alternative virtio
>> transports but virtio-mmio seems to be the only one that *is* upstream
>> already and just Works..) Setting up virtio-mmio through xenbus, initially
>> motivated just by event channels being the only real way to get interrupts
>> working on HVM, turned out to generally be quite pleasant and nice :)
> Is it HVM specific, or can we also make it work for PVH (we can actually
> attach a ioreq server to PVH guests) ?

Sorry, typo, I did mean PVH of course!

I've been testing this with PVH guests + PV dom0, with my PV alloc_ioreq 
fix:
https://lore.kernel.org/all/20251126062124.117425-1-val@invisiblethingslab.com/ 


(Time to resend that one as a non-RFC I guess…)

HVM actually does have legacy ISA interrupts (which are often used with 
virtio-mmio on KVM), funnily enough, and I've tried firing those from a 
DMOP but that silly thing didn't work properly.

>> I'd like to get some early feedback for this patch, particularly
>> the general stuff:
>>
>> * is this whole thing acceptable in general?
>> * should it be extracted into a different file?
>> * (from the Xen side) any input on the xenstore keys, what goes where?
>> * anything else to keep in mind?
>>
>> It does seem simple enough, so hopefully this can be done?
>>
>> The corresponding userspace-side WIP is available at:
>> https://github.com/QubesOS/xen-vhost-frontend
>>
>> And the required DMOP for firing the evtchn events will be sent
>> to xen-devel shortly as well.
> Could that be done through evtchn_send (or its userland counterpart) ?

Actually, yes… The use of DMOPs is only dictated by the current Linux 
privcmd.c code (the irqfds created by the kernel react to events by 
executing HYPERVISOR_dm_op with a stored operation), we can avoid the 
need to modify Xen by simply expanding the privcmd driver to make 
"evtchn fds". Sounds good, will do.

>> [..]
>>
>> diff --git a/drivers/virtio/Kconfig b/drivers/virtio/Kconfig
>> index ce5bc0d9ea28..56bc2b10526b 100644
>> --- a/drivers/virtio/Kconfig
>> +++ b/drivers/virtio/Kconfig
>> @@ -171,6 +171,13 @@ config VIRTIO_MMIO_CMDLINE_DEVICES
>>    
>>    	 If unsure, say 'N'.
>>    
>> +config VIRTIO_MMIO_XENBUS
>> +	bool "Memory mapped virtio devices parameter parsing"
> that text seems to miss the xenbus aspect
Yep, didn't change that yet, ack
>> [..]
> In some way, we're defining a new "PV driver" which is a virtio-mmio
> one, I guess we can eventually specific some form of protocol that
> backend/frontend would need to follow ?

Right, Jürgen mentioned documenting the keys in the xenstore-paths doc.. 
would the entire "protocol" (keys + state transition logic) fit into that?

The keys are currently derived from the initial Arm prototype which 
wasn't actually using xenbus properly (the guest driver was configured 
by a device tree node, but the ioreq server used xenstore keys, without 
properly transitioning between states).


Thanks,
~val


