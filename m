Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F60414F65
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 19:50:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192990.343768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT6OM-0000JL-Ma; Wed, 22 Sep 2021 17:50:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192990.343768; Wed, 22 Sep 2021 17:50:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT6OM-0000H3-HS; Wed, 22 Sep 2021 17:50:46 +0000
Received: by outflank-mailman (input) for mailman id 192990;
 Wed, 22 Sep 2021 17:50:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pxyX=OM=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1mT6OK-0000En-JT
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 17:50:44 +0000
Received: from mail-wr1-x42c.google.com (unknown [2a00:1450:4864:20::42c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b936fbb-83c3-4531-a2cb-1fe5ed750b8f;
 Wed, 22 Sep 2021 17:50:43 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id i23so9426179wrb.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Sep 2021 10:50:43 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c8sm2984483wru.30.2021.09.22.10.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 10:50:41 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 265891FF96;
 Wed, 22 Sep 2021 18:50:41 +0100 (BST)
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
X-Inumbo-ID: 2b936fbb-83c3-4531-a2cb-1fe5ed750b8f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version:content-transfer-encoding;
        bh=EowvngywS72jBE6RikxFXgqAP7QU+TKgMADLoAphN+0=;
        b=cRAwE43CJ0p2nCPQMHV0nj54ejgyt3xuERBZDKA5f2t86nHrc5A1U/PJ9zkn0y0Zkt
         twTViH0WRRUj3qQTLy68RmSXltVvPu66d5aSRH9PmEAz7iliPm9JGYExcd14D+8WhZ9u
         G40GMKh4ANdiBQtu2pJjUPb1VOyxkdaK/M/mGlyZ7iEl0ttRni1uD1szE1kpORfyTJuP
         eXIjUOVRswZhaE/O49CAQbJeXmGBLF2y8gboGWSGeJrmJBwwNZINhrFAcFEhFzU3d/w5
         eY+Y/hw5v1YuSWsuzvdqFRpZ37PQ0ev6OM9fE/63KjKUx/nGJ1KrDQUR93hTXV3XM6FN
         nQAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version:content-transfer-encoding;
        bh=EowvngywS72jBE6RikxFXgqAP7QU+TKgMADLoAphN+0=;
        b=5UfkqmUpfaWkJ68Jt0egl7XcjlIXElCnDIvteqCRT9YmuKPuoj5M/LTJcrjUbFZnds
         QWcOsoytEvRCLEeyqtU59Atg02r6e+UxeEkaTIdZBfkkAhn5gL0a/zAqZkUaw1ImMl76
         8u3sSTOsI+BeXBkBbu3C9qDh95fyLjGDOhrBUxSCZ7KQPrRgyiymFcQ2Po+AKddLkM+N
         Zm8KqbLFoIKVdY19VHxCQAOZYJWO1kc75m8qSmgX6hb6UET+nXQAhfvllI0KAb4NVbbC
         vnIcGrauQHU9x44wbuM21XbkMJDBOd+wGqD+gJNBxw0ReMRGsp1JLt5pCxqo7tZ6C8ha
         WRVg==
X-Gm-Message-State: AOAM532sSFqIQuFZYZPLnxxWjKKf9EwpUI7pr14Z8Guo+rjAaPmg2K7W
	xV8JdSXOhLkaiPoIGEtAzNoufA==
X-Google-Smtp-Source: ABdhPJzRWalyaDRlvA4ti6UQssgLp7cmcVNXyjS70Jwd6eeSvG/1b8HOaBGQYuTHbywYFos5SkbPvQ==
X-Received: by 2002:a7b:c1c5:: with SMTP id a5mr346897wmj.144.1632333042791;
        Wed, 22 Sep 2021 10:50:42 -0700 (PDT)
References: <87lf40vay1.fsf@linaro.org>
 <04272e87a8939be46acddd3c75bbffa84b0a40c1.camel@infradead.org>
User-agent: mu4e 1.7.0; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, Viresh Kumar
 <viresh.kumar@linaro.org>, Wei Liu <wl@xen.org>, Alexandru Agache
 <aagch@amazon.com>, "rust-vmm@lists.opendev.org"
 <rust-vmm@lists.opendev.org>, xen-devel@lists.xenproject.org, Stratos
 Mailing List <stratos-dev@op-lists.linaro.org>, Oleksandr Tyshchenko
 <olekstysh@gmail.com>, Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: Is it time to start implementing Xen bindings for rust-vmm?
Date: Wed, 22 Sep 2021 18:44:41 +0100
In-reply-to: <04272e87a8939be46acddd3c75bbffa84b0a40c1.camel@infradead.org>
Message-ID: <871r5go5xq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


David Woodhouse <dwmw2@infradead.org> writes:

> [[S/MIME Signed Part:Undecided]]
> On Mon, 2021-09-13 at 13:44 +0100, Alex Benn=C3=A9e wrote:
>> Hi,
>>=20
>> As we consider the next cycle for Project Stratos I would like to make
>> some more progress on hypervisor agnosticism for our virtio backends.
>> While we have implemented a number of virtio vhost-user backends using C
>> we've rapidly switched to using rust-vmm based ones for virtio-i2c,
>> virtio-rng and virtio-gpio. Given the interest in Rust for implementing
>> backends does it make sense to do some enabling work in rust-vmm to
>> support Xen?
>
> I like this idea.
>
> Somewhat separately, Alex Agache has already started some preliminary
> hacking on supporting Xen guests within rust-vmm (on top of Linux/KVM):
> https://github.com/alexandruag/vmm-reference/commits/xen

I'll be sending along a more detailed post once I've finished my
work breakdown but I'm currently envisioning two parts. A xen-sys crate
for the low level access that supports both ioctl and hypercall calls.
This would be useful for other projects such as stubdomains (think a
"bare-metal" RTOS with some sort of backend, uni-kernel style). It would
also be the lowest layer that rust-vmm can use to interact with the
hypervisor.

I'm aware the HyperV solution is to present a KVM-like ioctl interface
via the host kernel. However if we want generality with type-1
hypervisors we can't assume all will get suitable translation layers in
the kernel.

Fortunately for the time being our focus is on virtio backends so we
don't need to get directly involved in the hypervisor run loop... for
now.

> Being able to run on *actual* Xen would be good too. And we should also
> aspire to do guest-transparent live migration between the two hosting
> environments.
>
> Where relevant, it would be great to be able to share components (like
> emulation of the Xen PCI platform device, a completely single-tenant
> XenStore implementation dedicated to a single guest, perhaps PV
> netback/blkback and other things).

For Stratos portable virtio backends is one of our project goals.
>
>
> [[End of S/MIME Signed Part]]


--=20
Alex Benn=C3=A9e

