Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBj0CYBd82lT1wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2026 15:47:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A3C4A3A69
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2026 15:47:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1298195.1573698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIRjY-000208-4i; Thu, 30 Apr 2026 13:47:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1298195.1573698; Thu, 30 Apr 2026 13:47:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIRjY-0001yW-0z; Thu, 30 Apr 2026 13:47:16 +0000
Received: by outflank-mailman (input) for mailman id 1298195;
 Thu, 30 Apr 2026 13:47:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ddea4b728000f373@swg.vates.tech>)
 id 1wIRjW-0001xf-Cq
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2026 13:47:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wIRjV-0086Dx-Ag
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2026 15:47:13 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ddea4b728000f373@swg.vates.tech>)
 id 69f35d5f-bab6-0a2a0a5309dd-0a2a450c923c-6
 for <xen-devel@lists.xenproject.org>; Thu, 30 Apr 2026 15:47:13 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ddea4b728000f373@swg.vates.tech>)
 id 69f35d60-62f1-0a2a450c0019-b9ff1c22903b-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Apr 2026 15:47:13 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ddea4b728000f373.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 30 Apr 2026 13:47:09 +0000
Received: from [192.168.1.18] (88-175-170-134.subs.proxad.net [88.175.170.134])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 37FC98282B;
 Thu, 30 Apr 2026 15:47:09 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=fYrT/JODRVd7P7ffSLbDeb9ahiLPYVUa3o+fs8IKnJ0=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=ea9HkZtzsoxbUv4oZa72f8GsKZo3sqTD6D+NMaZ+4AeRqPhQ9ADo9/61tcYZu1wENo2HvqiLA
 8dA/Ya0Qj1X62O4hw3ARFLee5dZhRg0GWglQw4R+R49iw6ZBy/iXVv+PzQqXd4g8u1eYc7arT9C
 bpJhFuP49ajIprHK7h9W21HWvS2tQ5fZ/LXEGDcuzlUceMezOOzQEX+8j7am96W7IkPGm05uYwt
 osdseIZU+y4YT8smrNUczMUIiqgnRLMTrmVEoLxtSU62EHN3Wia6e52P9L75uYnVv39GU/ko/vS
 +jHrGiBBBiu3oZlIJRtdoaMVdOvXQq1U2fcS2K8b5NKA==
X-Zone-Loop: d092762f139a051628d393a2881818492a25c28669a2
x-campaign-type: default
x-transaction-id: d7f841e6-baf7-4657-a8e4-caa108e7b7f8
x-swg-uid: 01-9b82dfce-6446-4419-a192-ad90733d7ca8
X-Mailer: Sweego
Message-ID:
 <1777556830.8631fc262581453bbf619ec5b2062170.19ddea4b728000f373@vates.tech>
x-swg-bid: 1777556830.8631fc262581453bbf619ec5b2062170.19ddea4b728000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Thu, 30 Apr 2026 15:47:08 +0200
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
 <1777536698.8631fc262581453bbf619ec5b2062170.19ddd7187da000f373@vates.tech>
 <74953b6a-d195-4a12-800d-af324ff35b29@invisiblethingslab.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
In-Reply-To: <74953b6a-d195-4a12-800d-af324ff35b29@invisiblethingslab.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.392.3352229d598ec846.19ddea4b4d9.80e67b5e2fed426=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1777556829402
X-purgate-ID: tlsNG-d25034/1777556833-F5A00CF5-E32DBE9F/0/0
X-purgate-type: clean
X-purgate-size: 5804
X-Rspamd-Queue-Id: 80A3C4A3A69
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
	FORWARDED(0.00)[mailman];
	FORGED_MUA_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:val@invisiblethingslab.com,m:mst@redhat.com,m:jasowang@redhat.com,m:xuanzhuo@linux.alibaba.com,m:eperezma@redhat.com,m:marmarek@invisiblethingslab.com,m:viresh.kumar@linaro.org,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:virtualization@lists.linux.dev,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

---=Part.392.3352229d598ec846.19ddea4b4d9.80e67b5e2fed426=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 30/04/2026 =C3=A0 10:51, Val Packett a =C3=A9crit=C2=A0:
>=20
> On 4/30/26 5:11 AM, Teddy Astie wrote:
>> Le 30/04/2026 =C3=A0 06:06, Val Packett a =C3=A9crit=C2=A0:
>>> On 4/29/26 11:41 AM, Teddy Astie wrote:
>>>> Hello,
>>>>
>>>> Le 29/04/2026 =C3=A0 16:18, Val Packett a =C3=A9crit=C2=A0:
>>>>> [=E2=80=A6]
>>>>>
>>>>> I've been working on porting virtio-mmio support from Arm to x86_64,
>>>>> with the goal of running vhost-user-gpu to power Wayland/GPU=20
>>>>> integration
>>>>> for Qubes OS=2E (I'm aware of various proposals for alternative virt=
io
>>>>> transports but virtio-mmio seems to be the only one that *is* upstre=
am
>>>>> already and just Works=2E=2E) Setting up virtio-mmio through xenbus,
>>>>> initially
>>>>> motivated just by event channels being the only real way to get
>>>>> interrupts
>>>>> working on HVM, turned out to generally be quite pleasant and nice :=
)
>>>> Is it HVM specific, or can we also make it work for PVH (we can=20
>>>> actually
>>>> attach a ioreq server to PVH guests) ?
>>> Sorry, typo, I did mean PVH of course!
>>>
>>> I've been testing this with PVH guests + PV dom0, with my PV alloc_ior=
eq
>>> fix:
>>> https://lore=2Ekernel=2Eorg/all/20251126062124=2E117425-1-
>>> val@invisiblethingslab=2Ecom/
>>>
>>> (Time to resend that one as a non-RFC I guess=E2=80=A6)
>>>
>>> HVM actually does have legacy ISA interrupts (which are often used wit=
h
>>> virtio-mmio on KVM), funnily enough, and I've tried firing those from =
a
>>> DMOP but that silly thing didn't work properly=2E
>>>
>>>>> I'd like to get some early feedback for this patch, particularly
>>>>> the general stuff:
>>>>>
>>>>> * is this whole thing acceptable in general?
>>>>> * should it be extracted into a different file?
>>>>> * (from the Xen side) any input on the xenstore keys, what goes wher=
e?
>>>>> * anything else to keep in mind?
>>>>>
>>>>> It does seem simple enough, so hopefully this can be done?
>>>>>
>>>>> The corresponding userspace-side WIP is available at:
>>>>> https://github=2Ecom/QubesOS/xen-vhost-frontend
>>>>>
>>>>> And the required DMOP for firing the evtchn events will be sent
>>>>> to xen-devel shortly as well=2E
>>>> Could that be done through evtchn_send (or its userland counterpart) =
?
>>> Actually, yes=E2=80=A6 The use of DMOPs is only dictated by the curren=
t Linux
>>> privcmd=2Ec code (the irqfds created by the kernel react to events by
>>> executing HYPERVISOR_dm_op with a stored operation), we can avoid the
>>> need to modify Xen by simply expanding the privcmd driver to make
>>> "evtchn fds"=2E Sounds good, will do=2E
>>>
>> Given that the event channel used by device models is exposed through
>> ioreq=2Evp_eport ("evtchn for notifications to/from device model")=2E I
>> don't think you need to expand the privcmd interface, and you should be
>> able to do this instead :
>>
>> open /dev/xen/evtchn
>> perform IOCTL_EVTCHN_BIND_INTERDOMAIN (for each guest vCPU)
>> =C2=A0=C2=A0=C2=A0 with remote_domain=3Dguest_domid, remote_port=3Diore=
q=2Evp_eport
>>
>> Then interact with the event channel through IOCTL_EVTCHN_NOTIFY (with
>> local port given by IOCTL_EVTCHN_BIND_INTERDOMAIN) and read/write on th=
e
>> file descriptor=2E
>=20
> So the reason there's currently an ioctl to bind an eventfd to fire a=20
> stored DMOP is that the whole idea is to (efficiently!) support generic,=
=20
> hypervisor-neutral device server implementations via the vhost-user=20
> protocol=2E
>=20
> Now of course, the current implementation isn't *entirely* hypervisor-=
=20
> neutral as e=2Eg=2E the vm-memory Rust crate (inside of the "neutral" vh=
ost-=20
> user device servers) does need to be built with the `xen` feature=2E But=
=20
> still, that's how it works=2E What can be made generic is generic=2E
>=20
> xen-vhost-frontend, which is the thing that integrates these with Xen,=
=20
> actually used to handle the interrupts in userspace[1] by firing the=20
> DMOP itself (which is where I could "just replace that with=20
> IOCTL_EVTCHN_NOTIFY") but that was offloaded to the kernel with the=20
> introduction of IOCTL_PRIVCMD_IRQFD[2], similarly to KVM_IRQFD=2E
>=20

I think what would be preferable for your usecase would be to have a way=
=20
to bind a event channel with a eventfd object, which should be a=20
primitive that lives in the evtchn device=2E

The current interface kinda assume that you're looking to emulate a=20
completely emulated virtio device with no Xen specifics, it looks like=20
it's not exactly what you're implementing=2E

As you actually plan to switch to using event channels for notifying the=
=20
guest, I think it would be preferable to do the same the other way=20
(event channels to notify the host) so you only have event channels to=20
worry about here=2E

> Switching back to handling the eventfd in userspace would be a literal=
=20
> deoptimization :)
> > While throwing away the whole generic layer to do a fully integrated
> use-case-specific thing sounds more difficult/tedious than this, and not=
=20
> necessarily desirable in general=2E
>=20
> [1]: https://github=2Ecom/vireshk/xen-vhost-frontend/=20
> commit/06d59035f8a387c0f600931d09dfaa27b80ede7f
> [2]: https://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/next/linux-=20
> next=2Egit/commit/?id=3Df8941e6c4c712948663ec5d7bbb546f1a0f4e3f6
>=20
> ~val
>=20
>=20



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.392.3352229d598ec846.19ddea4b4d9.80e67b5e2fed426=---

