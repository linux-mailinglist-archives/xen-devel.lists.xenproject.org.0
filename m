Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7434191F8
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 12:06:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196647.349576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUnWt-0003VO-4J; Mon, 27 Sep 2021 10:06:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196647.349576; Mon, 27 Sep 2021 10:06:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUnWt-0003SG-0t; Mon, 27 Sep 2021 10:06:35 +0000
Received: by outflank-mailman (input) for mailman id 196647;
 Mon, 27 Sep 2021 10:06:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7LT4=OR=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1mUnWs-0003SA-5T
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 10:06:34 +0000
Received: from mail-wr1-x431.google.com (unknown [2a00:1450:4864:20::431])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e0e9f269-53e9-4ad8-90a3-0ba5d1a28480;
 Mon, 27 Sep 2021 10:06:32 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id d6so50689670wrc.11
 for <xen-devel@lists.xenproject.org>; Mon, 27 Sep 2021 03:06:32 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d1sm18124520wrr.72.2021.09.27.03.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 03:06:31 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F2AA81FF96;
 Mon, 27 Sep 2021 11:06:29 +0100 (BST)
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
X-Inumbo-ID: e0e9f269-53e9-4ad8-90a3-0ba5d1a28480
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version:content-transfer-encoding;
        bh=SsGrfYLyvw3STW3SK74psyLTGgh9Nxr1GGqYsTYAMcM=;
        b=JCYJqDmZcP6dpSmkqFq9/3KpGM/EFT6dpJQunFfKtIsXa7H/+qmthxv62mSihz9858
         xkYorIeoLH5z0wo24fwlSCH11vuUQQwoVlqrOlA354mdFgb8kfh7IujClMxTIqSub0p4
         wMp7PN/KsNJXVdJv0+GA/ovE7sJJPzCM0TIYBVXDYtTvc6vNR9ia+ZoNRy0iIrLcRrlj
         c4ieqfSDQ+ZtcYpPeGPPGN910dx9cjHmrPSDfdjq7E8DzUyLOkOu581dKaEIZCnhfAY2
         PxeZCLehlosYGsEkVE2xno4tT2nnV3YbM4cNxIeh0ZD0zlMwBfA399RkjbpfD1KhvnJ1
         Vatw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version:content-transfer-encoding;
        bh=SsGrfYLyvw3STW3SK74psyLTGgh9Nxr1GGqYsTYAMcM=;
        b=5wRyg1ndIwqcJ7Y44PWhOA3ztaERpZquEDoVgzUIFWAP58xyAMpz2b3Pq4skpsOwzi
         flYIQNFiPBMuYYRj8l6Sc+Ps2O39pHaf97pHxSOoURQbMSghrDRKtXq1Sh55ziFW5DPa
         Jquo4rlDgHzqYQMfYvct1fnBDdh8wSTVujMRH/7qcIs1TNpQNhjPyR6EaHoTTrcnKk0Z
         6a2n+pg1nrTo2ZAtAhWeRitU2GYxo6g3WgwDQlD6dFAnURuAcQCjQ/uWJw6akjjR/VpM
         FLdH90D7spsw9hLdVL1JPMNuQTUUGU4l5RBwmQPv+WKyx9t6vhg5tqLA2zYqXpW/SqAx
         xBxw==
X-Gm-Message-State: AOAM530A2JNuj2ndt1I702rQP18D2vMNC/YWdmb7pkn3n8cumuJ2z8Me
	nrzmBpnfh7WHRi734pmd222hVg==
X-Google-Smtp-Source: ABdhPJx0ZluoFQhLnmLJIXQPudn0JMs9Zcw7fcd8S25Q/lMxhj02kSRXJITIIb0QoZ2iE/oFKFqXpw==
X-Received: by 2002:adf:d851:: with SMTP id k17mr11896387wrl.54.1632737191992;
        Mon, 27 Sep 2021 03:06:31 -0700 (PDT)
References: <87pmsylywy.fsf@linaro.org> <YU5mW396S04IsCBr@mail-itl>
User-agent: mu4e 1.7.0; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Stratos Mailing List <stratos-dev@op-lists.linaro.org>, Mike Holmes
 <mike.holmes@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Peter Griffin
 <peter.griffin@linaro.org>, xen-devel@lists.xenproject.org, wl@xen.org,
 Artem Mygaiev <Artem_Mygaiev@epam.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Doug Goldstein <cardoe@cardoe.com>, Oleksandr Tyshchenko
 <olekstysh@gmail.com>, Rust-VMM Mailing List <rust-vmm@lists.opendev.org>,
 Sergio Lopez <slp@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>, David
 Woodhouse <dwmw2@infradead.org>, Arnd Bergmann <arnd.bergmann@linaro.org>
Subject: Re: Xen Rust VirtIO demos work breakdown for Project Stratos
Date: Mon, 27 Sep 2021 10:50:56 +0100
In-reply-to: <YU5mW396S04IsCBr@mail-itl>
Message-ID: <874ka68h96.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com> writes:

> [[PGP Signed Part:Undecided]]
> On Fri, Sep 24, 2021 at 05:02:46PM +0100, Alex Benn=C3=A9e wrote:
>> Hi,
>
> Hi,
>
>> 2.1 Stable ABI for foreignmemory mapping to non-dom0 ([STR-57])
>> =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
>>=20
>>   Currently the foreign memory mapping support only works for dom0 due
>>   to reference counting issues. If we are to support backends running in
>>   their own domains this will need to get fixed.
>>=20
>>   Estimate: 8w
>>=20
>>=20
>> [STR-57] <https://linaro.atlassian.net/browse/STR-57>
>
> I'm pretty sure it was discussed before, but I can't find relevant
> (part of) thread right now: does your model assumes the backend (running
> outside of dom0) will gain ability to map (or access in other way)
> _arbitrary_ memory page of a frontend domain? Or worse: any domain?

The aim is for some DomU's to host backends for other DomU's instead of
all backends being in Dom0. Those backend DomU's would have to be
considered trusted because as you say the default memory model of VirtIO
is to have full access to the frontend domains memory map.

> That is a significant regression in terms of security model Xen
> provides. It would give the backend domain _a lot more_ control over the
> system that it normally has with Xen PV drivers - negating significant
> part of security benefits of using driver domains.

It's part of the continual trade off between security and speed. For
things like block and network backends there is a penalty if data has to
be bounce buffered before it ends up in the guest address space.

> So, does the above require frontend agreeing (explicitly or implicitly)
> for accessing specific pages by the backend? There were several
> approaches to that discussed, including using grant tables (as PV
> drivers do), vIOMMU(?), or even drastically different model with no
> shared memory at all (Argo). Can you clarify which (if any) approach
> your attempt of VirtIO on Xen will use?

There are separate strands of work in Stratos looking at how we could
further secure VirtIO for architectures with distributed backends (e.g.
you may accept the block backend having access to the whole of memory
but an i2c multiplexer has different performance characteristics).

Currently the only thing we have prototyped is "fat virtqueues" which
Arnd has been working on. Here the only actual shared memory required is
the VirtIO config space and the relevant virt queues.

Other approaches have been discussed including using the virtio-iommu to
selectively make areas available to the backend or use memory zoning so
for example network buffers are only allocated in a certain region of
guest physical memory that is shared with the backend.

> A more general idea: can we collect info on various VirtIO on Xen
> approaches (since there is more than one) in a single place, including:
>  - key characteristics, differences
>  - who is involved
>  - status
>  - links to relevant threads, maybe
>
> I'd propose to revive https://wiki.xenproject.org/wiki/Virtio_On_Xen

From the Stratos point of view Xen is a useful proving ground for
general VirtIO experimentation due to being both a type-1 and open
source. Our ultimate aim is have a high degree of code sharing for
backends regardless of the hypervisor choice so a guest can use a VirtIO
device model without having to be locked into KVM.

If your technology choice is already fixed with a Xen hypervisor and
portability isn't a concern you might well just stick to the existing
well tested Xen PV interfaces.

--=20
Alex Benn=C3=A9e

