Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4471B40B20B
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 16:50:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186841.335587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ9kY-00048C-Mj; Tue, 14 Sep 2021 14:49:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186841.335587; Tue, 14 Sep 2021 14:49:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ9kY-00046P-JN; Tue, 14 Sep 2021 14:49:30 +0000
Received: by outflank-mailman (input) for mailman id 186841;
 Tue, 14 Sep 2021 14:49:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=puvF=OE=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1mQ9kW-00046J-P7
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 14:49:28 +0000
Received: from mail-wm1-x32b.google.com (unknown [2a00:1450:4864:20::32b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 10ec073a-bd73-47ab-a3f6-6f5dc3a0a8a8;
 Tue, 14 Sep 2021 14:49:27 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id g128so5070506wma.5
 for <xen-devel@lists.xenproject.org>; Tue, 14 Sep 2021 07:49:27 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j21sm1424161wmj.40.2021.09.14.07.49.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 07:49:25 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A1A001FF96;
 Tue, 14 Sep 2021 15:49:24 +0100 (BST)
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
X-Inumbo-ID: 10ec073a-bd73-47ab-a3f6-6f5dc3a0a8a8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version:content-transfer-encoding;
        bh=VsSaQm/zbSQNMCoZhBkWVXe+j2FkR4F2DupdJvdq+Ak=;
        b=Do4fypaueveDIn2KEf3d+A6bgMGNQaekYViEjI1dvQGqZEPvprL+44xWwK28pqvFZp
         X8dnggO/KCM3P0Hw58FOJmiSLbrwfjsYF7XGllx5SfPgxJKv3IYy6KdsFz50ctDjbdV/
         cSsO1OHxLYaV+pWd0Ap9GeUGDeARdauqGssczxk2aOqUiU52SDhZxtiJnogGMdZUA0wq
         PEL/nl22pIXqsEKHrk0r6U+rYrzj05fMC3vcWzent4NWOC0YE6PDlQc+5V8zJ3qJbQ0A
         m1aYAAQ/EWs6Tq1fPK6sWFFbrXj6s2dhsfNPLJ2pooqEqGXCfTBEKkmU/hgeCe1LtvIm
         eW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version:content-transfer-encoding;
        bh=VsSaQm/zbSQNMCoZhBkWVXe+j2FkR4F2DupdJvdq+Ak=;
        b=Q4z89XCvTMKCYk0zl2Oi6OQjZkyOLLAPFTxk6PvlSd4tLLbQFgIR42W/510rxf53o2
         Vy2XB9ilONqkpwd29cinFtlGcjxsO954byxlVJo6YgqVgRLr0S8Q4ElOFXF0gcgi7Uyd
         Kh0M5tjgpvf8QCAf8kKAMNqnqw+JrzAXyu4d3HVo4J7+raMlgNuN8mPFOhf5uPVbMK8x
         5Ka6hh2RX4yj6xFKR6lOb+a/LgGD9Tb5phj6cLRR+6ja4XRVS/8D+NCQXrWG5jB+Kr28
         fWsQfCPI2Gp2BdTuoIDCCCiw+ltLZVsg306eOBXCOZnGeEvoxDH2V2ZCYmT75i8BEjsU
         CM4Q==
X-Gm-Message-State: AOAM5311saXCCB3J6EioOh2pGvOyJePmbRHUVqchuxXDqlay815igKYb
	EPDGlACLqKn3veIsMz2IWmnQwg==
X-Google-Smtp-Source: ABdhPJy9XlURfdc6gZhXaT9U9m1ZEmaW8K2p/LoflX2P8gyg4HKxT764dGNgv/2/O3kTtMhPD3VKcQ==
X-Received: by 2002:a1c:1d42:: with SMTP id d63mr2712677wmd.55.1631630966835;
        Tue, 14 Sep 2021 07:49:26 -0700 (PDT)
References: <87lf40vay1.fsf@linaro.org>
 <abfa4f44-8c56-af3f-485e-41b58e790d92@citrix.com>
User-agent: mu4e 1.7.0; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, Viresh Kumar
 <viresh.kumar@linaro.org>, Wei Liu <wl@xen.org>,
 "rust-vmm@lists.opendev.org" <rust-vmm@lists.opendev.org>,
 xen-devel@lists.xenproject.org, Stratos Mailing List
 <stratos-dev@op-lists.linaro.org>, Oleksandr Tyshchenko
 <olekstysh@gmail.com>, Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Doug Goldstein <cardoe@cardoe.com>, Demi Marie Obenour
 <demi@invisiblethingslab.com>, Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: Is it time to start implementing Xen bindings for rust-vmm?
Date: Tue, 14 Sep 2021 15:44:01 +0100
In-reply-to: <abfa4f44-8c56-af3f-485e-41b58e790d92@citrix.com>
Message-ID: <874kanus97.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Andrew Cooper <andrew.cooper3@citrix.com> writes:

> On 13/09/2021 13:44, Alex Benn=C3=A9e wrote:
>> Hi,
>>
>> As we consider the next cycle for Project Stratos I would like to make
>> some more progress on hypervisor agnosticism for our virtio backends.
>> While we have implemented a number of virtio vhost-user backends using C
>> we've rapidly switched to using rust-vmm based ones for virtio-i2c,
>> virtio-rng and virtio-gpio. Given the interest in Rust for implementing
>> backends does it make sense to do some enabling work in rust-vmm to
>> support Xen?
>>
>> There are two chunks of work I can think of:
>>
>>   1. Enough of libxl/hypervisor interface to implement an IOREQ end poin=
t.
>
> No libxl here at all.
>
> As of Xen 4.15, there are enough stable interfaces to implement simple
> IOERQ servers.
>
> https://github.com/xapi-project/varstored/commit/fde707c59f7a189e1d4e97c1=
a4ee1a2d0c378ad1
> was the commit where I removed the final unstable interface from
> varstored (terrible name) which is a dom0 backend for UEFI secure
> variable handling.=C2=A0 As such, it also serves as a (not totally simple)
> reference of an IOERQ server.
>
>
> There are a few bits and pieces of rust going on within Xen, and a whole
> load of plans.=C2=A0 Also, there is a lot of interest from other downstre=
ams
> in being able to write Rust backends.
>
> We've got a placeholder xen and xen-sys crates, and placeholder work for
> supporting cross-compile as x86 PV and PVH stubdomains.

Are these in the rust-vmm project is elsewhere?

> The want to have a simple IOREQ server compiled either as a dom0
> backend, or as a PV or PVH stubdomains influences some of the design
> decisions early on, but they're all no-brainers for the longevity of the
> work.

Just to clarify nomenclature is a PVH stubdomain what I'm referring to
as a bare metal backend, i.e: a unikernel or RTOS image that implements
the backend without having to transition between some sort of userspace
and it's supporting kernel?=20

> I started work on trying to reimplement varstored entirely in Rust as a
> hackathon project, although ran out of time trying to make hypercall
> buffers work (there is a bug with Box and non-global allocators causing
> rustc to hit an assert().=C2=A0 In the short term, we'll have to implement
> hypercall buffers in a slightly more irritating way).
>
> Furthermore, stick to the stable hypercalls only.=C2=A0 Xen's C libraries=
 are
> disaster for cross-version compatibility, and you absolutely do not want
> to recompile your rust program just to run it against a different
> version of the hypervisor.=C2=A0 The plan is to start with simple IOREQ
> servers, which are on fully stable interfaces, then stabilise further
> hypercalls as necessary to expand functionality.

Are the hypercalls mediated by a kernel layer or are you making direct
HVC calls (on ARM) to the hypervisor from userspace?

Where would I look in the Xen code to find the hypercalls that are
considered stable and won't change between versions?

> It's high time the Xen Rust working group (which has been talked about
> for several years now) actually forms...

Indeed part of the purpose of this email was to smoke out those who are
interested in the intersection of Xen, Rust and VirtIO ;-)

--=20
Alex Benn=C3=A9e

