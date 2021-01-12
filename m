Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAE02F3C2E
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 23:15:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66164.117416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzRvl-0007HO-Q2; Tue, 12 Jan 2021 22:14:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66164.117416; Tue, 12 Jan 2021 22:14:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzRvl-0007Gz-Mr; Tue, 12 Jan 2021 22:14:25 +0000
Received: by outflank-mailman (input) for mailman id 66164;
 Tue, 12 Jan 2021 22:14:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DecX=GP=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1kzRvk-0007Gu-6x
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 22:14:24 +0000
Received: from mail-ej1-x62b.google.com (unknown [2a00:1450:4864:20::62b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a453b5fa-f9c2-4a10-bf38-12bf4d1446fa;
 Tue, 12 Jan 2021 22:14:23 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id d17so177032ejy.9
 for <xen-devel@lists.xenproject.org>; Tue, 12 Jan 2021 14:14:23 -0800 (PST)
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
X-Inumbo-ID: a453b5fa-f9c2-4a10-bf38-12bf4d1446fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CT0CyhlrA5J51cvzWdJIUaqF8cJdPEmd+dU5q7+od3I=;
        b=i/p/7DcXgOBHoKDvZo4hAw4MKtJq/o+p4nphR0xy1frw8/WW1kQdpDCjO4wk1u0KiR
         JI92EPsPCdI0NWZYBBsetlujBl6Kr0J9iU/1jOqjyjsLJ1JTtVJ+c0EZWKM1FS6jqpRt
         IRmuKa1yGW7evs4p2eQPe27AJO0wPogjfq5uGrIj9CHSQDmGgswG+LQwzUQ/AyxrxOoP
         Rf+vaL4gTsJXQ0v52HYzoe4Rx8xOTIVoGAVM60rw+zP+Y7QXsfh8WnzFsD7L8bBo+2A2
         u9VLToRNzd4IwtNl+IIT+M2DFW3yQ8n1dD58ozO6dd2zDXHMBc8DT/sN8DwWgPgTnPtN
         Oqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CT0CyhlrA5J51cvzWdJIUaqF8cJdPEmd+dU5q7+od3I=;
        b=QZH8nxzf5Tuh8qzpZRL98ztAV3DyE/wfKHarYDMlj6QW+uGFS7nmqG/Uerw9PfS+Nq
         MehpimKiZFHLcTpodWQBaSrfBsSBANfKryWNVaEhhUpr+FXf01f8vj3pV92i1H8ADqOS
         C9LxToX341ozEMokAN1SsDa/3l0xZ+CgC15HydPH2xrvP7zUMf1ZHHu1NrpgPlwoPdBa
         QTjX3E9vce1lM7YQstwH2Ypv+dQJ3JS57wpbHyOZv85Vkbn7mwkjIAnJldxgP0eDbMRc
         8KyxvY5qrmpk713bTsXr7sWpdMKTJ2Id3W5emTTxOp4QoRRWXjnGLL5yypYZFd0/Rs8R
         Ch7g==
X-Gm-Message-State: AOAM532YDon9PpKB1pyy0cuzJvdDwCtFrcjrbN+92V89baMKvwxeHpmB
	j+lMcG7bTs4kiG9J3i58RSele3UjIHBLWgGX6qM=
X-Google-Smtp-Source: ABdhPJzX9mR1hvrh0rJTyZLZDcLsSLOSrfeU9jr8xgrzkMUjHRthKdM4FwgdnsBGjJPzd39JZfBcYLsl2jEcN9l6YCk=
X-Received: by 2002:a17:906:810:: with SMTP id e16mr681823ejd.34.1610489662248;
 Tue, 12 Jan 2021 14:14:22 -0800 (PST)
MIME-Version: 1.0
References: <20210112001623.28421-1-sstabellini@kernel.org>
 <db6949f1-6b19-b1bb-9bec-8b56a2ad83a1@xen.org> <alpine.DEB.2.21.2101121015100.2495@sstabellini-ThinkPad-T480s>
 <CAJ=z9a208m_NvxgjP=9Eyr6PsJZm3DPy6BKvM1x1oZP=Ftg-ZQ@mail.gmail.com> <alpine.DEB.2.21.2101121252490.2495@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2101121252490.2495@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Tue, 12 Jan 2021 22:14:11 +0000
Message-ID: <CAJ=z9a37BLiTxKy1KDpvmYW4P-4efJjshRotZ=ds+Kj8nD2OSA@mail.gmail.com>
Subject: Re: [PATCH] xen/arm: don't read aarch32 regs when aarch32 isn't available
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Jan 2021 at 21:05, Stefano Stabellini <sstabellini@kernel.org> wrote:
>
> On Tue, 12 Jan 2021, Julien Grall wrote:
> > On Tue, 12 Jan 2021 at 19:09, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > >
> > > On Tue, 12 Jan 2021, Julien Grall wrote:
> > > > > +    aarch32 = c->pfr64.el1 == 2;
> > > >
> > > > This is checking that AArch32 is available in EL1. However, it may not be the
> > > > case yet it would be available in EL0.
> > > >
> > > > As a consequence, 32-bit userspace wouldn't work properly after this patch.
> > > >
> > > > The Arm Arm mandates that if AArch32 is available at EL(n), then it must be
> > > > available at EL(n - 1).
> > > >
> > > > So we should check that AArch32 is available at EL0 because this would
> > > > cover the case where AArch32 is enabled at EL1.
> > >
> > > OK
> > >
> > >
> > > > Furthermore, I would also like to avoid hardcoding value in the code as it is
> > > > less readable. We already define cpu_has_el0_32 which use the boot CPU
> > > > feature. Maybe we want to expand the macro or split it?
> > >
> > > I agree
> > >
> > > Technically, cpu_has_el0_32 works as is, because it is called after
> > > boot_cpu_data has been updated. So we could just use it. What do you
> > > think?
> >
> > I thought about that when I wrote the first e-mail. However, this
> > would not work properly for heterogeneous platforms.
> > There is still a risk to read garbage (or UNDEF) if the boot CPU
> > supports AArch32 but the others.
>
> Yeah, but that is not the kind of thing that can be actually different
> in a heterogeneous platform, as far as I am aware?

Arm CPU vendors can do a lot of interesting mix. For Samsung released
in the past a big.LITTLE with a mix of Armv8.0 and Armv8.2 cores (see
[1]).
It turns out to be a massive blunder because they hack Linux to avoid
detecting a minimum feature set. So the userspace app was trying to
use LSE atomics on Armv8.0 (yes).

I wouldn't be surprised to see a phone with a mix of 64-bit only
processor and one with 32-bit EL0 to run legacy apps.

>
> In any case, a check that takes that into consideraion would be:
>
>     aarch32_el0 = cpu_has_el0_32 &&
>                   (boot_cpu_feature64(el0) == cpu_feature64(c, el0));

Why do you want to check the boot CPU feature? The per-cpu cpuinfo
should really contain a raw copy of the ID registers of that CPU.

Anything else will make our life very difficult when we try to look
for a common set of features or want to expose big.LITTLE to a guest
(this request comes back time to time).

>
> If you have something better in mind please feel free to suggest it and
> I'll add it to the patch. Otherwise, I'll send it with this later today
> with a note that if you want to make a change on commit you have my
> blessing :-)

Let me start by saying that I think the existing cpu_has_* are
misnamed because the name suggest it would check the features of the
current CPU but they only check the boot CPU. But I am not going to
suggest a renaming for now. The header cpufeature.h likely needs an
overhaul.

Instead I would suggest the following:

Pseudo-code:

#define cpu_feature64_has_el0(c) cpu_feature64(c, el0) == 2

And the the code would use:

aarch32_el0 = cpu_feature64_has_el0(c);

[1] https://github.com/golang/go/issues/28431

