Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D849B49218F
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 09:46:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258396.444918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9k7a-0007FY-EM; Tue, 18 Jan 2022 08:45:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258396.444918; Tue, 18 Jan 2022 08:45:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9k7a-0007CG-BO; Tue, 18 Jan 2022 08:45:42 +0000
Received: by outflank-mailman (input) for mailman id 258396;
 Tue, 18 Jan 2022 08:45:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9uWz=SC=gmail.com=gengdongjiu1@srs-se1.protection.inumbo.net>)
 id 1n9k7Y-0007C6-Vi
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 08:45:41 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03690ac8-783b-11ec-9bbc-9dff3e4ee8c5;
 Tue, 18 Jan 2022 09:45:39 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id o15so67646545lfo.11
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jan 2022 00:45:39 -0800 (PST)
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
X-Inumbo-ID: 03690ac8-783b-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=53Y9XNRQIP/ZWA6H6OV0LmYLgUysqj/JBTf1VdkMq1Y=;
        b=o47fye0Cmq6kklRHHtA/PQU7Bb6F4RizYW+1H8NFSFg0cJyTwyV9UrMHQmXPXLi/l0
         imRubE4zJpFhiZhEuQ9XNOLsfylLpSQCz0DqYdjKgAk0Geccl7qjVS3YTCU2v9jra7nz
         U4YZASFOeSpIIYCzuRJcQbuBsWH5w5sqZXioAN9tuLQnwpVpnFdNf4y5I0L9ev4MXrwm
         kE4JmsNNpNlxqmG45pBfa29udXdC2WmQrO2L4V7tf8oSdQIwrZsReuDx2HhKT8PMLrmm
         yT1eaJhsXDDC2d4/9bYyYSduEtsOOrvBcrjdNwVl4EA3439+3rICSo4JLcrBTVYbznUB
         74PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=53Y9XNRQIP/ZWA6H6OV0LmYLgUysqj/JBTf1VdkMq1Y=;
        b=ZE7PwqX7fQ3SZNvcVHgqPuYIUsdihwN53CIQJMpJAXLw4efyiJyLE8rl8kFJTdMWQq
         5VMSYp2Q6ttsmU0RK0dtnZc45JGsv2dCZj0pNN1h0553QOzHRfkqyg0nrL1P/5c8ZP9n
         VMZsfxRHT2bBCN9MB+Mp8IOEiWrs5QDaP+VyIEqlf1t3B237sKtG353LM8IJS1TEEI/i
         Qn4Pe6Y4vCbrMzQ7dFUcTX3mbdZIwb7OSCASyp0/auC0HCVZm6PVK4di4R9xiNBrQKKy
         5aFdZXjPQiAuNddjrYz4dquSv7k9DvbY6IpFNEDaffqDMyC3N9oen8Xh+cayBxyBC7eN
         Db6Q==
X-Gm-Message-State: AOAM531vZ6iLKtPZgKZZgUeHqx2F6pEM09EpPR6yqPuacE0fCOEshZW0
	fxOtOz9nPoWpgA+7sn558LUrV4fExIBV4mdgWKc=
X-Google-Smtp-Source: ABdhPJzNpqHtYfFiahZe1gt8fpK95T4/n6x0kndDydXZ84NLnqYp+nuXSIOEJ6Ix0cB/EKVPUc0QGFtRhf8cLCs2GxE=
X-Received: by 2002:a05:651c:542:: with SMTP id q2mr1145837ljp.201.1642495539314;
 Tue, 18 Jan 2022 00:45:39 -0800 (PST)
MIME-Version: 1.0
References: <20220117064003.3367188-1-gengdongjiu1@gmail.com> <2a1a0dd5-b8a7-8072-2961-b1fbe9ec746a@xen.org>
In-Reply-To: <2a1a0dd5-b8a7-8072-2961-b1fbe9ec746a@xen.org>
From: Dongjiu Geng <gengdongjiu1@gmail.com>
Date: Tue, 18 Jan 2022 16:45:29 +0800
Message-ID: <CABSBigSOjoXABoYoe+SahQyX0P045YjgK3A=7yyxw_aX8nzTqg@mail.gmail.com>
Subject: Re: [PATCH v4] xen/arm: Allow QEMU platform to be built with GICv2
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Julien Grall <julien@xen.org> =E4=BA=8E2022=E5=B9=B41=E6=9C=8817=E6=97=A5=
=E5=91=A8=E4=B8=80 22:16=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> On 17/01/2022 10:40, Dongjiu Geng wrote:
> > It turns out that QEMU has been supporting GICv2 virtualization since
> > v3.1.0. So remove the dependencies on GICv3.
>
>
> Technically, the current form of CONFIG_QEMU allows the same binary to
> boot on QEMU with GICv2 or GICv3.
>
> > If we want to use GICv3,
> > we can select the QEMU_LEGACY configuration.
>
> AFAIK, GICv3 is not a legacy feature... So it feels a bit odd to name it
> like that (see more below).

Legacy means QEMU platform only supports GICV3, now it can support
both GICv2 and GICv3. The scope of support has been expanded
Not mean GICv3 is a legacy feature.

>
> >
> > Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
> > ---
> >   xen/arch/arm/platforms/Kconfig | 10 +++++++++-
> >   1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kc=
onfig
> > index c93a6b2756..41e82a42ee 100644
> > --- a/xen/arch/arm/platforms/Kconfig
> > +++ b/xen/arch/arm/platforms/Kconfig
> > @@ -13,7 +13,15 @@ config ALL_PLAT
> >       automatically select any of the related drivers.
> >
> >   config QEMU
> > -     bool "QEMU aarch virt machine support"
> > +     bool "QEMU aarch virt machine support >=3D v3.1.0"
>
> This is a bit misleading. A user may select this thinking that this will
> select GICv3. However, this will not.
>
> This also raises the question of what is the default GIC version in QEMU
> (i.e. if you don't pass anything on the command line)? If this is GICv3,
> then I am afraid that this patch would be a no-go for me.
>
> Looking at overall discussion, you seem to push the patch only to allow
> building a tiny Xen for QEMU and the new vGIC.
>
> The default Xen (i.e. make defconfig) will also work on QEMU. Given that
> the new vGIC is a still in development, I am seriously considering to
> say that if you want to try it then you have to use the default
> configuration.
>
> @Dongjiu, is there any reason why you want to use the tiny QEMU config
> rather than the default configuration?

Hi Julien, thanks for the reply, I do not use the tiny QEMU config. I
used the default configuration and selected the platform as QEMU.
But QEMU platform only slects GICV3, so I submit this patch to remove
the limitation because I want to use VGIC. VGIC can already support
GICv2 now.

>
> @Bertrand, @Stefano, what do you think?
>
> Cheers,
>
> --
> Julien Grall

