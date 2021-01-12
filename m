Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BDE2F3A80
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 20:30:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65946.116904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzPMY-0004Cn-2s; Tue, 12 Jan 2021 19:29:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65946.116904; Tue, 12 Jan 2021 19:29:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzPMX-0004CO-VT; Tue, 12 Jan 2021 19:29:53 +0000
Received: by outflank-mailman (input) for mailman id 65946;
 Tue, 12 Jan 2021 19:29:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DecX=GP=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1kzPMW-0004CJ-Op
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 19:29:52 +0000
Received: from mail-ed1-x52b.google.com (unknown [2a00:1450:4864:20::52b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3de370e1-68d9-4f9f-8c37-1dd6945b0436;
 Tue, 12 Jan 2021 19:29:51 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id cm17so3644550edb.4
 for <xen-devel@lists.xenproject.org>; Tue, 12 Jan 2021 11:29:51 -0800 (PST)
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
X-Inumbo-ID: 3de370e1-68d9-4f9f-8c37-1dd6945b0436
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m6MwQDiXuU71zaDbIBzlCHAW31pM33Xc2Vvh8fHc/Jg=;
        b=me83nlTbvYLQE0voZVnmpCpLrRh2GB1shm1NoVxYBfeXYSrD01mdd4fVicifGuuQEF
         MY4ZAkOWfNiV3gIs/Om0hpF12qm6m+9xYRkg5MQYUCz0zDPv4LxOoZyoEH2bEv8bwav+
         3f1Si4XMYL35oAmka9SDiM68Xd/aMGVm8Zqn7TfNqPQ/HYKaUyLokXzZpb7WrDYTMfG3
         wkQCj2cknYyxQfiV3HcCQGl66gbWZC1Dy8+y7wSTTNjQBFoqM2VVFdKhD1PnRL86/Qd9
         hL02nayTquxS+cK0hvm/dZd/XNpv0+X3VcIzudsYYEHR0rZBpeaLDuIfrjqFriaeBFyV
         ttfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m6MwQDiXuU71zaDbIBzlCHAW31pM33Xc2Vvh8fHc/Jg=;
        b=P+y0X5wtCr6zpBQHbBr3lXqSDOWp0XhnnnlsTu+5WikSSABhVBD/sWZ3vyy6SCblyK
         6ZXK4rbnhvQMX7Z6M2hFdXL5IOz4B3SXiL9yL7V3V1ylmljUutPEKQ8KddYuHfvfXkEf
         igXMSSbT8iwmSYGu9g41VxDQp6SRO16hY699dN92eYJxrihYghGRAXJtuzl9JTdTa7X5
         xocEfGEY7BfAY0KwAvcIODzEa15bwOc3LmbUOUy+DmefjgVfpRNH0z2GzuFov/DJTTDV
         QwjxDZk7BXngD1b1BBVf9nMKJZuZbENYwK2FQkr5c324TbrJwcR3whgugq7EzkEH45Yp
         glxQ==
X-Gm-Message-State: AOAM5324avEB4iUvnRDe1lB+RCWMy2gU8guDsUEYxdhpqwhHuFKdLDFf
	CRFg1QMfXEpzM+QIXNHQ70mKBcy8iheIMwhbKFo=
X-Google-Smtp-Source: ABdhPJwZIppVjuCjGDIG1LpGeTf60XK1sMpNcIOaZjE2f1QCe9QmS9bEofgwHwMxLz2jzRnjz5PK6JBltEp8lkuOR7g=
X-Received: by 2002:a05:6402:50a:: with SMTP id m10mr548162edv.324.1610479791015;
 Tue, 12 Jan 2021 11:29:51 -0800 (PST)
MIME-Version: 1.0
References: <20210112001623.28421-1-sstabellini@kernel.org>
 <db6949f1-6b19-b1bb-9bec-8b56a2ad83a1@xen.org> <alpine.DEB.2.21.2101121015100.2495@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2101121015100.2495@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Tue, 12 Jan 2021 19:29:40 +0000
Message-ID: <CAJ=z9a208m_NvxgjP=9Eyr6PsJZm3DPy6BKvM1x1oZP=Ftg-ZQ@mail.gmail.com>
Subject: Re: [PATCH] xen/arm: don't read aarch32 regs when aarch32 isn't available
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Jan 2021 at 19:09, Stefano Stabellini <sstabellini@kernel.org> wrote:
>
> On Tue, 12 Jan 2021, Julien Grall wrote:
> > > +    aarch32 = c->pfr64.el1 == 2;
> >
> > This is checking that AArch32 is available in EL1. However, it may not be the
> > case yet it would be available in EL0.
> >
> > As a consequence, 32-bit userspace wouldn't work properly after this patch.
> >
> > The Arm Arm mandates that if AArch32 is available at EL(n), then it must be
> > available at EL(n - 1).
> >
> > So we should check that AArch32 is available at EL0 because this would
> > cover the case where AArch32 is enabled at EL1.
>
> OK
>
>
> > Furthermore, I would also like to avoid hardcoding value in the code as it is
> > less readable. We already define cpu_has_el0_32 which use the boot CPU
> > feature. Maybe we want to expand the macro or split it?
>
> I agree
>
> Technically, cpu_has_el0_32 works as is, because it is called after
> boot_cpu_data has been updated. So we could just use it. What do you
> think?

I thought about that when I wrote the first e-mail. However, this
would not work properly for heterogeneous platforms.
There is still a risk to read garbage (or UNDEF) if the boot CPU
supports AArch32 but the others.

Cheers,

