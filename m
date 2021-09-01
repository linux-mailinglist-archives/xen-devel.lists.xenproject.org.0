Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA303FDD1E
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 15:21:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176394.320987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLQAZ-0005gC-Ph; Wed, 01 Sep 2021 13:20:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176394.320987; Wed, 01 Sep 2021 13:20:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLQAZ-0005dV-Me; Wed, 01 Sep 2021 13:20:47 +0000
Received: by outflank-mailman (input) for mailman id 176394;
 Wed, 01 Sep 2021 13:20:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qyqW=NX=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1mLQAX-0005dN-Rx
 for xen-devel@lists.xen.org; Wed, 01 Sep 2021 13:20:45 +0000
Received: from mail-wr1-x429.google.com (unknown [2a00:1450:4864:20::429])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b5b09572-24bc-452d-87bf-2c25f69caa2f;
 Wed, 01 Sep 2021 13:20:44 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id u9so4458220wrg.8
 for <xen-devel@lists.xen.org>; Wed, 01 Sep 2021 06:20:44 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h11sm25481339wrx.9.2021.09.01.06.20.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 06:20:43 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6C4D31FF96;
 Wed,  1 Sep 2021 14:20:42 +0100 (BST)
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
X-Inumbo-ID: b5b09572-24bc-452d-87bf-2c25f69caa2f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version:content-transfer-encoding;
        bh=y/0tGsa7zxs1Lge6n3O6ldiXuhSjzQntOAObjxG3wD8=;
        b=gAnfhwBM6t2sfmWr0LXDnlOXCmfqqkhQvg8PKhZg0mwsVmibDpiyA0ycZRCaPZM/o9
         jWOSV+puCL7VGYR9cJuMUCQlMqfLPQlGiUk4SK9A0wFvpOSsKIHMhHZqu/KF8pArEMJ6
         /K2zuth1vsa6Noddrq4zuOPYXKJkZ2Q9hgUfk2iqtVSf3BP0pVK0BmuZpJghk56qVwZA
         KVVzErNnIv1DqO8RRtIGGKsQZL1U0Fo/GZjHHXlX/1c8vF2xbQQ2E4gI1nVjtDGHg3K0
         gW/ehRFVFcBd1onW2djYp7qR7jy11EXMYIKqt/C/T3/bAZglF4+LSDewaVtD3Rnk96w+
         C7Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version:content-transfer-encoding;
        bh=y/0tGsa7zxs1Lge6n3O6ldiXuhSjzQntOAObjxG3wD8=;
        b=Nb5mqR5TsAz+SC1PjkXWUrHYg7+RYIk2PofavxzZZ1W9z7k7DyBIdtI9aTlSci0TB7
         w8t1qSFHcHfg0Wd9Tq2jcnOy2Xz7IfFH9r3JetnYwMqHRDb66kjuPrhcnXtx/UfZhD7h
         8gAyvV9hCMoX2x67efoVVNilx6cTOonqBF1BdCC8cCRUhScHRYES2nZ9crHt9aSwxhFP
         91HZB7plrUKY4oQH24/CRhOQ7Rl8aOF+DQGtd/kO+kup8bxHyUMNKwiCkjyu7+7ChprY
         QvlrizXqekLy6BCTjxcC8uGmcJoSt+1MftQlVXdLmf92RYVE+iN/U1OrrayTL7T0gh3c
         tMrA==
X-Gm-Message-State: AOAM5316lkUVkwVO/rO9hvknS0Y5pkVZv6uNUiUh6Yw9tgWnf+gODKmJ
	pTvSvzZ9GexVS8CvljiORcLmVA==
X-Google-Smtp-Source: ABdhPJxCevrGYCx7XFVJhI0D2nblAkpnQCi5PGoMrSDHbafJqS3oT1ctZ1duD7JVNhkkNRwTAvhNgg==
X-Received: by 2002:adf:b7cd:: with SMTP id t13mr17597181wre.63.1630502444042;
        Wed, 01 Sep 2021 06:20:44 -0700 (PDT)
References: <87v94ldrqq.fsf@linaro.org>
 <alpine.DEB.2.21.2108041055390.9768@sstabellini-ThinkPad-T480s>
 <YRuSPT9075NuWRYS@stefanha-x1.localdomain>
User-agent: mu4e 1.7.0; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Stratos Mailing List
 <stratos-dev@op-lists.linaro.org>, virtio-dev@lists.oasis-open.org, Arnd
 Bergmann <arnd.bergmann@linaro.org>, Viresh Kumar
 <viresh.kumar@linaro.org>, AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Jan Kiszka
 <jan.kiszka@siemens.com>, Carl van Schaik <cvanscha@qti.qualcomm.com>,
 pratikp@quicinc.com, Srivatsa Vaddagiri <vatsa@codeaurora.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Wei.Chen@arm.com, olekstysh@gmail.com,
 Oleksandr_Tyshchenko@epam.com, Bertrand.Marquis@arm.com,
 Artem_Mygaiev@epam.com, julien@xen.org, jgross@suse.com, paul@xen.org,
 xen-devel@lists.xen.org, Elena Afanasova <eafanasova@gmail.com>
Subject: Re: Enabling hypervisor agnosticism for VirtIO backends
Date: Wed, 01 Sep 2021 13:53:34 +0100
In-reply-to: <YRuSPT9075NuWRYS@stefanha-x1.localdomain>
Message-ID: <875yvkh1p1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Stefan Hajnoczi <stefanha@redhat.com> writes:

> [[PGP Signed Part:Undecided]]
> On Wed, Aug 04, 2021 at 12:20:01PM -0700, Stefano Stabellini wrote:
>> > Could we consider the kernel internally converting IOREQ messages from
>> > the Xen hypervisor to eventfd events? Would this scale with other kern=
el
>> > hypercall interfaces?
>> >=20
>> > So any thoughts on what directions are worth experimenting with?
>>=20=20
>> One option we should consider is for each backend to connect to Xen via
>> the IOREQ interface. We could generalize the IOREQ interface and make it
>> hypervisor agnostic. The interface is really trivial and easy to add.
>> The only Xen-specific part is the notification mechanism, which is an
>> event channel. If we replaced the event channel with something else the
>> interface would be generic. See:
>> https://gitlab.com/xen-project/xen/-/blob/staging/xen/include/public/hvm=
/ioreq.h#L52
>
> There have been experiments with something kind of similar in KVM
> recently (see struct ioregionfd_cmd):
> https://lore.kernel.org/kvm/dad3d025bcf15ece11d9df0ff685e8ab0a4f2edd.1613=
828727.git.eafanasova@gmail.com/

Reading the cover letter was very useful in showing how this provides a
separate channel for signalling IO events to userspace instead of using
the normal type-2 vmexit type event. I wonder how deeply tied the
userspace facing side of this is to KVM? Could it provide a common FD
type interface to IOREQ?

As I understand IOREQ this is currently a direct communication between
userspace and the hypervisor using the existing Xen message bus. My
worry would be that by adding knowledge of what the underlying
hypervisor is we'd end up with excess complexity in the kernel. For one
thing we certainly wouldn't want an API version dependency on the kernel
to understand which version of the Xen hypervisor it was running on.

>> There is also another problem. IOREQ is probably not be the only
>> interface needed. Have a look at
>> https://marc.info/?l=3Dxen-devel&m=3D162373754705233&w=3D2. Don't we als=
o need
>> an interface for the backend to inject interrupts into the frontend? And
>> if the backend requires dynamic memory mappings of frontend pages, then
>> we would also need an interface to map/unmap domU pages.
>>=20
>> These interfaces are a lot more problematic than IOREQ: IOREQ is tiny
>> and self-contained. It is easy to add anywhere. A new interface to
>> inject interrupts or map pages is more difficult to manage because it
>> would require changes scattered across the various emulators.
>
> Something like ioreq is indeed necessary to implement arbitrary devices,
> but if you are willing to restrict yourself to VIRTIO then other
> interfaces are possible too because the VIRTIO device model is different
> from the general purpose x86 PIO/MMIO that Xen's ioreq seems to
> support.

It's true our focus is just VirtIO which does support alternative
transport options however most implementations seem to be targeting
virtio-mmio for it's relative simplicity and understood semantics
(modulo a desire for MSI to reduce round trip latency handling
signalling).

>
> Stefan
>
> [[End of PGP Signed Part]]


--=20
Alex Benn=C3=A9e

