Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 275AF3FFD50
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 11:39:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177962.323767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM5ey-0000GT-8S; Fri, 03 Sep 2021 09:38:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177962.323767; Fri, 03 Sep 2021 09:38:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM5ey-0000Dg-4z; Fri, 03 Sep 2021 09:38:56 +0000
Received: by outflank-mailman (input) for mailman id 177962;
 Fri, 03 Sep 2021 09:38:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iCYc=NZ=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1mM5ew-0000DV-JS
 for xen-devel@lists.xen.org; Fri, 03 Sep 2021 09:38:54 +0000
Received: from mail-wr1-x429.google.com (unknown [2a00:1450:4864:20::429])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b0ad83b8-e1a1-4018-b8eb-222b928869fe;
 Fri, 03 Sep 2021 09:38:52 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id q14so7320267wrp.3
 for <xen-devel@lists.xen.org>; Fri, 03 Sep 2021 02:38:52 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g143sm3863966wme.16.2021.09.03.02.38.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 02:38:50 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D1CFC1FF96;
 Fri,  3 Sep 2021 10:38:49 +0100 (BST)
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
X-Inumbo-ID: b0ad83b8-e1a1-4018-b8eb-222b928869fe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version:content-transfer-encoding;
        bh=eglj5ZpXfutr/eGVG8JtkghmoUPw+XxKGQoeUjdoPlo=;
        b=oYPdVmnHy4majCVmnTP+1CNbmbzW79nSLoTQ13OnPEJvgKek/h2Gi7AnN9hoFNGDJ+
         9oRio4Ppmw1h+mbh1Gaf7tAb7az0AGMNUsV10jA5po4tKmjRAm17aMCgxJjfccEn2hp3
         3Tsue8DDRoaE+1qJyZMoPdN9RpbX7ZKGM29rOcRYIGOR40wndTr9e6Mj0sippnBAKLA1
         hXmu02EkfOzX4jKVD7Aha6jbZIMl/QYGJtjJmORg59pL5uN+MV/fqh55driLyzThWsdi
         yfVj7UNlDTtg+5btsSE4yRhA6yb0Q4jY73uiT/bo+KloDFU/IePiG4YYh62qRBQUG/Ou
         njiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version:content-transfer-encoding;
        bh=eglj5ZpXfutr/eGVG8JtkghmoUPw+XxKGQoeUjdoPlo=;
        b=E1EMoo2bCvxxNlYLMh6KH+mziJhtd07q9Jt00KFQj5dyL2uz6eU2sYuifG0qQGkFes
         QkQssVnoEtl63hk+RvxJeNi2H/UwPzfbQwidLKUGjqzEu6ZJh2AHi2cvEoguQ67qLpVy
         Gtgjq93vg6ph3HGlVIkL0Q3yONBjBqtoafW6y4C/kz2F6C6oP37NPyRtp5wU/9bZilkL
         ySgC7Z+7LRIAOZL4ujnDODyWXRAnBvZQ2KjlrIifXsMY9OpShU/LEesRfdS4xLKBDQh0
         DmDRcWzNmT9QqYdYD1M6ILo5eIm8vNgQ7Iyt0KeE6BA3yGhKQeArmO6DfRKAcuNFMrRW
         9F7g==
X-Gm-Message-State: AOAM532Mn0+OK+1BaOhRB1597jN4K7IgYaQZK7xSicnIScJ/O752duPt
	tVJ4DcFO5RbClQ+btCXafJtLRQ==
X-Google-Smtp-Source: ABdhPJx6NdsYfccjIXK3bpXfNCSBcf1+do70OI6kBYhG6UJu6Ret7BmqXZyyO/01ILiNCDYEWnYxTw==
X-Received: by 2002:adf:eb02:: with SMTP id s2mr3012989wrn.294.1630661931736;
        Fri, 03 Sep 2021 02:38:51 -0700 (PDT)
References: <87v94ldrqq.fsf@linaro.org>
 <alpine.DEB.2.21.2108041055390.9768@sstabellini-ThinkPad-T480s>
 <YRuSPT9075NuWRYS@stefanha-x1.localdomain> <875yvkh1p1.fsf@linaro.org>
 <20210903080609.GD47953@laputa>
User-agent: mu4e 1.7.0; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: AKASHI Takahiro <takahiro.akashi@linaro.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Stratos Mailing List
 <stratos-dev@op-lists.linaro.org>, virtio-dev@lists.oasis-open.org, Arnd
 Bergmann <arnd.bergmann@linaro.org>, Viresh Kumar
 <viresh.kumar@linaro.org>, Stefano Stabellini
 <stefano.stabellini@xilinx.com>, Jan Kiszka <jan.kiszka@siemens.com>, Carl
 van Schaik <cvanscha@qti.qualcomm.com>, pratikp@quicinc.com, Srivatsa
 Vaddagiri <vatsa@codeaurora.org>, Jean-Philippe Brucker
 <jean-philippe@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Wei.Chen@arm.com, olekstysh@gmail.com, Oleksandr_Tyshchenko@epam.com,
 Bertrand.Marquis@arm.com, Artem_Mygaiev@epam.com, julien@xen.org,
 jgross@suse.com, paul@xen.org, xen-devel@lists.xen.org, Elena Afanasova
 <eafanasova@gmail.com>
Subject: Re: Enabling hypervisor agnosticism for VirtIO backends
Date: Fri, 03 Sep 2021 10:28:06 +0100
In-reply-to: <20210903080609.GD47953@laputa>
Message-ID: <87czpqq9qu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


AKASHI Takahiro <takahiro.akashi@linaro.org> writes:

> Alex,
>
> On Wed, Sep 01, 2021 at 01:53:34PM +0100, Alex Benn??e wrote:
>>=20
>> Stefan Hajnoczi <stefanha@redhat.com> writes:
>>=20
>> > [[PGP Signed Part:Undecided]]
>> > On Wed, Aug 04, 2021 at 12:20:01PM -0700, Stefano Stabellini wrote:
>> >> > Could we consider the kernel internally converting IOREQ messages f=
rom
>> >> > the Xen hypervisor to eventfd events? Would this scale with other k=
ernel
>> >> > hypercall interfaces?
>> >> >=20
>> >> > So any thoughts on what directions are worth experimenting with?
>> >>=20=20
>> >> One option we should consider is for each backend to connect to Xen v=
ia
>> >> the IOREQ interface. We could generalize the IOREQ interface and make=
 it
>> >> hypervisor agnostic. The interface is really trivial and easy to add.
>> >> The only Xen-specific part is the notification mechanism, which is an
>> >> event channel. If we replaced the event channel with something else t=
he
>> >> interface would be generic. See:
>> >> https://gitlab.com/xen-project/xen/-/blob/staging/xen/include/public/=
hvm/ioreq.h#L52
>> >
>> > There have been experiments with something kind of similar in KVM
>> > recently (see struct ioregionfd_cmd):
>> > https://lore.kernel.org/kvm/dad3d025bcf15ece11d9df0ff685e8ab0a4f2edd.1=
613828727.git.eafanasova@gmail.com/
>>=20
>> Reading the cover letter was very useful in showing how this provides a
>> separate channel for signalling IO events to userspace instead of using
>> the normal type-2 vmexit type event. I wonder how deeply tied the
>> userspace facing side of this is to KVM? Could it provide a common FD
>> type interface to IOREQ?
>
> Why do you stick to a "FD" type interface?

I mean most user space interfaces on POSIX start with a file descriptor
and the usual read/write semantics or a series of ioctls.

>> As I understand IOREQ this is currently a direct communication between
>> userspace and the hypervisor using the existing Xen message bus. My
>
> With IOREQ server, IO event occurrences are notified to BE via Xen's event
> channel, while the actual contexts of IO events (see struct ioreq in iore=
q.h)
> are put in a queue on a single shared memory page which is to be assigned
> beforehand with xenforeignmemory_map_resource hypervisor call.

If we abstracted the IOREQ via the kernel interface you would probably
just want to put the ioreq structure on a queue rather than expose the
shared page to userspace.=20

>> worry would be that by adding knowledge of what the underlying
>> hypervisor is we'd end up with excess complexity in the kernel. For one
>> thing we certainly wouldn't want an API version dependency on the kernel
>> to understand which version of the Xen hypervisor it was running on.
>
> That's exactly what virtio-proxy in my proposal[1] does; All the hypervis=
or-
> specific details of IO event handlings are contained in virtio-proxy
> and virtio BE will communicate with virtio-proxy through a virtqueue
> (yes, virtio-proxy is seen as yet another virtio device on BE) and will
> get IO event-related *RPC* callbacks, either MMIO read or write, from
> virtio-proxy.
>
> See page 8 (protocol flow) and 10 (interfaces) in [1].

There are two areas of concern with the proxy approach at the moment.
The first is how the bootstrap of the virtio-proxy channel happens and
the second is how many context switches are involved in a transaction.
Of course with all things there is a trade off. Things involving the
very tightest latency would probably opt for a bare metal backend which
I think would imply hypervisor knowledge in the backend binary.

>
> If kvm's ioregionfd can fit into this protocol, virtio-proxy for kvm
> will hopefully be implemented using ioregionfd.
>
> -Takahiro Akashi
>
> [1] https://op-lists.linaro.org/pipermail/stratos-dev/2021-August/000548.=
html

--=20
Alex Benn=C3=A9e

