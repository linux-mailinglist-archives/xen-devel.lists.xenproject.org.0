Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFFE27AE89
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 15:01:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMslr-0002y8-Qi; Mon, 28 Sep 2020 13:00:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RDSs=DF=linaro.org=masami.hiramatsu@srs-us1.protection.inumbo.net>)
 id 1kMslr-0002y2-1n
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 13:00:47 +0000
X-Inumbo-ID: 67e917f1-4c38-42c7-9ff8-72c3020e8ee5
Received: from mail-yb1-xb42.google.com (unknown [2607:f8b0:4864:20::b42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 67e917f1-4c38-42c7-9ff8-72c3020e8ee5;
 Mon, 28 Sep 2020 13:00:46 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id b142so849577ybg.9
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2020 06:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oFrcOReZdA9aaTV6nxtmlXzJnDN9gwExVQg1SmgbdWA=;
 b=TCrqKi+B6guutvw0U0XxRIMEYyV3vRfj8z+o9ynJa0GGs4vEecWvd99kwxDzu71dTV
 +sB76+riAafXReBvQfY3TRJQtXxmijWP0vAzIBQBvgF3CopADhtd+gLCCO7R0jShAQvM
 NW0kHkO+RR633op9fy5wS9Xk6cyvpUmdztXp8r/Wg9QOctd+PlKc+fhhn5+MVbIfpPHT
 bWY5WX+hzA1Pc8HOEVLsSwGvVoAxAhd+VcnlQZhilCI6Krq0b+Vxb67lVZX5CbHMdV4G
 cE1iGs1k+kQ9nUCtRr6vLmkrr+aku2sOOD5mjPiU7Zbzkshui+LMwsVXSoW6fjcUNepA
 p8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oFrcOReZdA9aaTV6nxtmlXzJnDN9gwExVQg1SmgbdWA=;
 b=q7Zv5vWi2HhDShozlsQZHwJAHwafk3GZFFCVKexqvFe2RcMCZenkgaHdsVe2jIBdBL
 ZVO0ReBqinq2qM6EhJcBJ6CIuTtkkllgu3BCpv/iVPEjBzBSuvvT95xqsiDShJUM29vb
 9Ob8ljp1kKutGDuHWIVI3lEHPP2zmVTjbu/j6yeemHZNXDe6f4V27H8AeOa2Ykq8xyhM
 rzSHOL1vrd5uff6UPiSmq2dtv/THyH1dhYaErPeD8Qd1OU1pv/7/PZIkN1Kj4qIULYCQ
 kWf1zDxNYYGs6HA9heFG2kKHGwS0TU03/rBleDz5Vqu2Zz25fBCn5oUhrR/0FayuWk5q
 Jenw==
X-Gm-Message-State: AOAM531cxx1vgy5NSKh9U0jN5bKqHNzpb3vKAKxdIr3P9SLBmwBZ7Ws1
 gw8X6meo85Eoeu9E/OXUt5EfhIuZ2I9BPxCT0PurFw==
X-Google-Smtp-Source: ABdhPJzxX7iq30FyjD11pmosXXFRtzx3kB8pOiItxVaha9l2S9BhcQoQLT6Qq0+7PZjkEhGaFO6q2/nvxz+b1tgJgIk=
X-Received: by 2002:a25:3ce:: with SMTP id 197mr1687970ybd.233.1601298045906; 
 Mon, 28 Sep 2020 06:00:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200926205542.9261-1-julien@xen.org>
 <CAA93ih3-gTAEzV=yYS-9cHGyN9rfAC28Xeyk8Gsmi7D2BS_OWQ@mail.gmail.com>
In-Reply-To: <CAA93ih3-gTAEzV=yYS-9cHGyN9rfAC28Xeyk8Gsmi7D2BS_OWQ@mail.gmail.com>
From: Masami Hiramatsu <masami.hiramatsu@linaro.org>
Date: Mon, 28 Sep 2020 22:00:35 +0900
Message-ID: <CAA93ih2EiyCnuL4sw1OLw+XEWa7sN3zJWvsnxHfx9b9Fq+cOxw@mail.gmail.com>
Subject: Re: [PATCH 0/4] xen/arm: Unbreak ACPI
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 ehem+xen@m5p.com, bertrand.marquis@arm.com, andre.przywara@arm.com, 
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, 
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, 
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

I've missed the explanation of the attached patch. This prototype
patch was also needed for booting up the Xen on my box (for the system
which has no SPCR).

Thank you,

2020=E5=B9=B49=E6=9C=8828=E6=97=A5(=E6=9C=88) 15:47 Masami Hiramatsu <masam=
i.hiramatsu@linaro.org>:
>
> Hello,
>
> This made progress with my Xen boot on DeveloperBox (
> https://www.96boards.org/product/developerbox/ ) with ACPI.
>
> Thank you,
>
>
> 2020=E5=B9=B49=E6=9C=8827=E6=97=A5(=E6=97=A5) 5:56 Julien Grall <julien@x=
en.org>:
>
> >
> > From: Julien Grall <jgrall@amazon.com>
> >
> > Hi all,
> >
> > Xen on ARM has been broken for quite a while on ACPI systems. This
> > series aims to fix it.
> >
> > Unfortunately I don't have a system with ACPI v6.0 or later (QEMU seems
> > to only support 5.1). So I did only some light testing.
> >
> > I have only build tested the x86 side so far.
> >
> > Cheers,
> >
> > *** BLURB HERE ***
> >
> > Julien Grall (4):
> >   xen/acpi: Rework acpi_os_map_memory() and acpi_os_unmap_memory()
> >   xen/arm: acpi: The fixmap area should always be cleared during
> >     failure/unmap
> >   xen/arm: Check if the platform is not using ACPI before initializing
> >     Dom0less
> >   xen/arm: Introduce fw_unreserved_regions() and use it
> >
> >  xen/arch/arm/acpi/lib.c     | 79 ++++++++++++++++++++++++++++++-------
> >  xen/arch/arm/kernel.c       |  2 +-
> >  xen/arch/arm/setup.c        | 25 +++++++++---
> >  xen/arch/x86/acpi/lib.c     | 18 +++++++++
> >  xen/drivers/acpi/osl.c      | 34 ++++++++--------
> >  xen/include/asm-arm/setup.h |  2 +-
> >  xen/include/xen/acpi.h      |  1 +
> >  7 files changed, 123 insertions(+), 38 deletions(-)
> >
> > --
> > 2.17.1
> >
>
>
> --
> Masami Hiramatsu



--=20
Masami Hiramatsu

