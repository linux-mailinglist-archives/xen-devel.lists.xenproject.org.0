Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIKkKOyuy2kpKAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 13:24:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD67368B08
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 13:24:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268852.1558040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7XBr-00060E-Gm; Tue, 31 Mar 2026 11:23:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268852.1558040; Tue, 31 Mar 2026 11:23:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7XBr-0005yk-E3; Tue, 31 Mar 2026 11:23:23 +0000
Received: by outflank-mailman (input) for mailman id 1268852;
 Tue, 31 Mar 2026 11:23:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <val@invisiblethingslab.com>) id 1w7XBp-0005ye-Ri
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 11:23:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7XBo-002aln-Ph
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 13:23:20 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <val@invisiblethingslab.com>)
 id 69cbae9d-2eae-0a2a0a5409dd-0a2a450ce654-32
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 13:23:20 +0200
Received: from [202.12.124.150] (helo=fout-b7-smtp.messagingengine.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <val@invisiblethingslab.com>)
 id 69cbaea7-f93d-0a2a450c0019-ca0c7c96d9c3-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 13:23:20 +0200
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfout.stl.internal (Postfix) with ESMTP id C661B1D000D9;
 Tue, 31 Mar 2026 07:23:18 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Tue, 31 Mar 2026 07:23:19 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Mar 2026 07:23:16 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm1 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm2 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Content-Transfer-Encoding:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1774956198; x=1775042598; bh=EcsUa8C2fg
	TQynsJHHMDaklxMetgPOWxao6hBDdfyVA=; b=GxDKYTTl1LNI9F+u4S4DgCLgOv
	Kcrq7mFbpjCVCKrG5K4gNU3h1M0R8W6EkrPExlvHBvibFlwJNcPgNenjazcYTIhz
	WrtBXTgBC2QXxI+F4YXrKafTVzThf70Qfj0OgSG69FLx+GuYtYbrgu6+FGaUL/iq
	Kvx6ybnYKL6PLW/6sWvGYS4EBKcqnSLB9Ri6Dz8oQRD4lyiribAXJFUhT35osPqF
	74n4Ef4q2d+B0cQEB+JmZHQqENMHLXmoDFpe1wd0BKlAP4afuf3oV1cqFbRIGsTH
	UItvChIYv+GYs3asFj5lxMsPsZysXuryiHVj/8EMt8MHQqD2X5cz0UpWm6tA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1774956198; x=1775042598; bh=E
	csUa8C2fgTQynsJHHMDaklxMetgPOWxao6hBDdfyVA=; b=bD26wddQtzO270IPw
	3ipfar8cmhKmQY+21H4AGg8ZLpn+Gpn1LiPuK+B8dzIVrTDTZrfg0ttp4OXuPnrN
	HDZEjKIdDj9LWXwosWx4hF0l9zbxGh81XBL2TaaY77sNHDOFuFxzyjbiNs4fT2EA
	smilVaa7TtIcoO6ONR/bNHeA+9SuXXle4ZZ467I1KbPw75g1W2YJnMpw65UCEouL
	QIxOWzteB49CdAYQUECZD8ROLaTkKrDqWTpMa2ytJDi1Xsv6SCEZEjntGhuiMjZS
	YvtvDxIP0t6CpHh+nF2V7fvPEWXJH4d1NxFVCO8Tlnvkw7ePqegcaaMuSf+HWMax
	wlfMA==
X-ME-Sender: <xms:pq7LaYbWTgmmp6kgmkYgE-X6Ogs44xkJKyCNFbPgFbrVh_f02ug0aA>
    <xme:pq7Lacsqw6bAyDjA8LEksJ1YBDAqA4A6sDWondKd0H4qkU3oyULOrhZPpX13dD0Ao
    yTu6l3925xEtlgp0Gv3_YKrj4ybXsg1Cupw1UEOvmdmQ5BaSw>
X-ME-Received: <xmr:pq7LaaNpJT3EiGNei-ycp77s-x-rpZGXdFewRYALvzuXbiK5SqVlIqyMLjk9adeQiQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddtjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegrihhl
    ohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpe
    fkffggfgfuvfhfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeggrghlucfrrggtkhgv
    thhtuceovhgrlhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtf
    frrghtthgvrhhnpeeigfffgfduvefgueeljefgfedugeeivdelkeetieeifefgveettefh
    hfejleegfeenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehvrghlsehinhhvihhs
    ihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepiedpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepthgvugguhidrrghsthhivgesvhgrthgvshdrthgv
    tghhpdhrtghpthhtohepuggvmhhiohgsvghnohhurhesghhmrghilhdrtghomhdprhgtph
    htthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdp
    rhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprd
    horhhgpdhrtghpthhtoheplhhinhhugidqmhhmsehkvhgrtghkrdhorhhgpdhrtghpthht
    oheprghrihgrughnvgesrghrihgrughnvgdrshhprggtvg
X-ME-Proxy: <xmx:pq7LaT6LSvG_5p75fUx-R-PjzGyJuXhAK3aQPJdl5uQ7kK6Xu_gLdA>
    <xmx:pq7LaQR0B-XiB0n4hGmvO5Cuw-AkgNdjgOaTp7g8furXZpdRMPWVuQ>
    <xmx:pq7LaQAC5qBSdtGk0KPTSBkXMFOqi2Vda7mDAZlf7o76rHUHMEeVfw>
    <xmx:pq7LaQG2_uoBLonEXgv0s4UO3v-yweveB3CsFHrClOnBcLKs2bSMHw>
    <xmx:pq7LadqsRxsg0-wb_n4gPdR28Kx_8H5d6lgrj1ykbaG3lR-yuELmZ3wH>
Feedback-ID: i001e48d0:Fastmail
Message-ID: <36d831f6-f21a-4c0d-b442-e526d8c946b9@invisiblethingslab.com>
Date: Tue, 31 Mar 2026 08:23:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Why memory lending is needed for GPU acceleration
To: Teddy Astie <teddy.astie@vates.tech>,
 Demi Marie Obenour <demiobenour@gmail.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Ariadne Conill <ariadne@ariadne.space>
References: <84462c4b-7813-4ad1-aeb2-862ae4f3a627@gmail.com>
 <c38387fe-beef-4f50-b928-74f96b881b7a@gmail.com>
 <0bbf0349-1006-485f-a2db-6c8b795b4242@invisiblethingslab.com>
 <1de15ce0-9f7e-4253-80a7-ecd94caa4325@vates.tech>
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
In-Reply-To: <1de15ce0-9f7e-4253-80a7-ecd94caa4325@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1774956200-FC630734-07E7097E/0/0
X-purgate-type: clean
X-purgate-size: 4536
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm2];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[vates.tech,gmail.com,lists.xenproject.org,lists.freedesktop.org,kvack.org,ariadne.space];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:demiobenour@gmail.com,m:xen-devel@lists.xenproject.org,m:dri-devel@lists.freedesktop.org,m:linux-mm@kvack.org,m:ariadne@ariadne.space,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[val@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[val@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: AFD67368B08
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/31/26 6:42 AM, Teddy Astie wrote:
> Le 30/03/2026 à 22:13, Val Packett a écrit :
>> [..]
>>
>> we have no need to replicate what KVM does. That's far from the only
>> thing that can be done with a dmabuf.
>>
>> The import-export machinery on the other hand actually does pin the
>> buffers on the driver level, importers are not obligated to support
>> movable buffers (move_notify in dma_buf_attach_ops is entirely optional).
>>
> dma-buf is by concept non-movable if actively used (otherwise, it would
> break DMA). It's just a foreign buffer, and from device standpoint, just
> plain RAM that needs to be mapped.
>
>> Interestingly, there is already XEN_GNTDEV_DMABUF…
>>
>> Wait, do we even have any reason at all to suspect
>> that XEN_GNTDEV_DMABUF doesn't already satisfy all of our buffer-sharing
>> requirements?
>>
> XEN_GNTDEV_DMABUF has been designed for GPU use-cases, and more
> precisely for paravirtualizing a display. The only issue I would have
> with it is that grants are not scalable for GPU 3D use cases (with
> hundreds of MB to share).

At least for the Qubes side, we aren't aiming at running Crysis on a 
paravirtualized GPU just yet anyway :) First we just want desktop apps 
to run well.

Keep in mind that with virtgpu paravirtualization, actual buffer sharing 
between domains only happens for CPU access, which is mostly used for:

- initial resource uploads;
- the occasional readback (which is inherently slow and all graphics 
devs try not to *ever* do);
- special cases like screen capture.

Most CPU mappings of GPU driver managed buffers live for the duration of 
a single memcpy. Mapping size can get large for games indeed, but for 
desktop applications it's rather small.

On the rendering hot path the guest virtgpu driver just submits jobs 
that refer to abstract handles managed by virglrenderer on the host, and 
buffer sharing is *not* happening.

> But we can still keep the concept of a structured guest-owned memory
> that is shared with Dom0 (but for larger quantities), I have some ideas
> regarding improving that area in Xen.
>
> The only issue with changing the memory sharing model is that you would
> need to adjust the virtio-gpu aspect, but the rest can stay the same.
>
> The biggest concern regarding driver compatibility is more about :
> - can dma-buf be used as general buffers : probably yes (even with
> OpenGL/Vulkan); exception may be proprietary Nvidia drivers that lacks
> the feature; maybe very old hardware may struggle more with it
Current nvidia blob drivers do not lack the feature btw..
> - can guest UMD work without access to vram : yes (apparently), AMDGPU
> has a special case where VRAM is not visible (e.g too small PCI BAR),
> there is vram size vs "vram visible size" (which could be 0); you could
> fallback vram-guest-visible with ram mapped on device

UMDs work on a higher level, they work on buffers which are managed by 
the KMD.

In any paravirtualization situation (whether "native 
contexts"/vDRM which runs the full HW-specific UMD in the guest, or 
API-forwarding solutions like Venus) the only guest KMD is virtio-gpu! 
The guest kernel isn't really aware of what VRAM even is.

https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/amd/common/virtio/amdgpu_virtio_bo.c

^ this 300-ish-line file is everything amdgpu ever does with buffer 
objects on the virtio backend.

All it can do is manage host handles, import guest dmabufs into virtgpu 
to get handles for them, export handles to get guest dmabufs, and map 
handles for guest CPU access via the VIRTGPU_MAP ioctl. There are no 
special details to any of this, it's all very straightforward.

It seems to me that implementing VIRTGPU_MAP in terms of dmabuf grants 
would be easy!..

I'll need to get to that point first though, right now I'm still working 
on making basic virtio itself work in our (x86) situation.

> - can it be defined in Vulkan terms (from driver) : You can have
> device_local memory without having it host-visible (i.e memory exists,
> but can't be added in the guest). You would probably just lose some
> zero-copy paths with VRAM. Though you still have RAM shared with GPU
> (GTT in AMDGPU) if that matters.

What did you mean by "added" in the guest?

We shouldn't ever have to touch this level at all, anyhow…
> Worth noting that if you're on integration graphics, you don't have VRAM
> and everything is RAM anyway.


Thanks,
~val


