Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED50655F0A3
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jun 2022 23:54:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357389.585890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6JAA-0003mE-OY; Tue, 28 Jun 2022 21:54:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357389.585890; Tue, 28 Jun 2022 21:54:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6JAA-0003im-Kr; Tue, 28 Jun 2022 21:54:26 +0000
Received: by outflank-mailman (input) for mailman id 357389;
 Tue, 28 Jun 2022 21:54:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Opqg=XD=gmail.com=dmitry.semenets@srs-se1.protection.inumbo.net>)
 id 1o6JA9-0003if-6y
 for xen-devel@lists.xenproject.org; Tue, 28 Jun 2022 21:54:25 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dec805eb-f72c-11ec-bd2d-47488cf2e6aa;
 Tue, 28 Jun 2022 23:54:24 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id z41so907757ede.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jun 2022 14:54:23 -0700 (PDT)
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
X-Inumbo-ID: dec805eb-f72c-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mSYrvx7Zs7WVuOjUVbgDVrTlqXlYD3NgG0yMPN+CjWk=;
        b=eBkHapLjErSmUbyssocth1SWXwvClGzbhdoKHmvFhA+sW8/i0nEB/Z3Z4Y2KeV6azc
         3b9TAplOkiRGufY/578ZzZZhhwcoFWtvu9fCsY5OrpI1nTTcYchKnP5sUEXmumUCvnol
         0JRZcjYNYMANaXtUcehRDW4iKW4f5TTh/uAGiiBt4AioBBm2Xdbl3V5unpEi29NSxwS5
         Jc/CQXIgnzzgo6Ow0rSU0zRMTTN0mokkTOmBjGmuWp6rpGjZYkBd35Wd8KEhp0UsN6eF
         8+kNZZDdtsBLH8cTmUptOmU81MvBLBE2GJkmMHv/lifZWD/aP2IyPaaeovgeAmjg6dEM
         ri9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mSYrvx7Zs7WVuOjUVbgDVrTlqXlYD3NgG0yMPN+CjWk=;
        b=7otxB22H6sTNBDG5mhXnKexSKf5Es9d9yWGFusVkunE8CXoZmxtmTDyrnufLYWSBt7
         QOYmD8Yq2aoa/tyMvxBjspTg148rfR650Vg53rWTCpT1s0Qhb2ufj6reHMym7pLGS86T
         uF1X2JST+oyIfth0tFrIkEYZ3Tbb5qI3MJyLy/sZqbZ4hHZgknk0QiEcGv6wk4w2udhm
         +dngDJ1YbuwkmXbmMSS5ruPK7X2CAWjuGOsabjc7D+oHuaUIN+kXGmPL0Y2nUqQxUTZu
         g++dd9GEgTgkVvkeiswUHZLm3ere0B3avIPlpGoKn447IPagwDn2vh+n2GR4sD6jE73N
         6EMQ==
X-Gm-Message-State: AJIora+cpMaVRO8khL7HGsDSLsjDg7BB7zD1JPmAYzRgVIkAxHG+ZE6M
	kbg2sanL5vxEW9vInPkVHpVkvr2OxKppECHmAmo=
X-Google-Smtp-Source: AGRyM1umlGm+9a42Pp1JSygaD0AA/oYLlXOwgSSlfWNJx9Wp1LoXs2PaAY8wE+4OxYr1BkcBK0CnvnBWMd64/7IMw0I=
X-Received: by 2002:a05:6402:26d6:b0:435:ba41:dbb0 with SMTP id
 x22-20020a05640226d600b00435ba41dbb0mr195186edd.242.1656453262531; Tue, 28
 Jun 2022 14:54:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220623074428.226719-1-dmitry.semenets@gmail.com>
 <alpine.DEB.2.22.394.2206231457250.2410338@ubuntu-linux-20-04-desktop>
 <e60a4e68-ed00-6cc7-31ca-64bcfc4bbdc5@xen.org> <alpine.DEB.2.22.394.2206241414420.2410338@ubuntu-linux-20-04-desktop>
 <5c986703-c932-3c7d-3756-2b885bb96e42@xen.org>
In-Reply-To: <5c986703-c932-3c7d-3756-2b885bb96e42@xen.org>
From: Dmytro Semenets <dmitry.semenets@gmail.com>
Date: Wed, 29 Jun 2022 00:54:11 +0300
Message-ID: <CACM97VVhQ_cpr59ZbJj4HvxRvCj5h3yZmwsSVcGk7QycX_S24g@mail.gmail.com>
Subject: Re: [PATCH] xen: arm: Don't use stop_cpu() in halt_this_cpu()
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, 
	Dmytro Semenets <dmytro_semenets@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefano and Julien,
What is the conclusion about this patch?

=D1=81=D0=B1, 25 =D0=B8=D1=8E=D0=BD. 2022 =D0=B3. =D0=B2 17:45, Julien Gral=
l <julien@xen.org>:
>
> Hi Stefano,
>
> On 24/06/2022 22:31, Stefano Stabellini wrote:
> > On Fri, 24 Jun 2022, Julien Grall wrote:
> >> On 23/06/2022 23:07, Stefano Stabellini wrote:
> >>> On Thu, 23 Jun 2022, dmitry.semenets@gmail.com wrote:
> >>>> From: Dmytro Semenets <dmytro_semenets@epam.com>
> >>> So wouldn't it be better to remove the panic from the implementation =
of
> >>> call_psci_cpu_off?
> >>
> >> I have asked to keep the panic() in call_psci_cpu_off(). If you remove=
 the
> >> panic() then we will hide the fact that the CPU was not properly turne=
d off
> >> and will consume more energy than expected.
> >>
> >> The WFI loop is fine when shutting down or rebooting because we know t=
his will
> >> only happen for a short period of time.
> >
> > Yeah, I don't think we should hide that CPU_OFF failed. I think we
> > should print a warning. However, given that we know CPU_OFF can
> > reasonably fail in normal conditions returning DENIED when a Trusted OS
> > is present, then I think we should not panic.
>
> We know how to detect this condition (see section 5.9 in DEN0022D.b). So
> I would argue we should fix it properly rather than removing the panic().
>
> >
> > If there was a way to distinguish a failure because a Trusted OS is
> > present (the "normal" failure) from other failures, I would suggest to:
> > - print a warning if failed due to a Trusted OS being present
> > - panic in other cases
> >
> > Unfortunately it looks like in all cases the return code is DENIED :-(
> I am confused. Per the spec, the only reason CPU_OFF can return DENIED
> is because the Trusted OS is resident. So what other cases are you
> talking about?
>
> >
> >
> > Given that, I would not panic and only print a warning in all cases. Or
> > we could ASSERT which at least goes away in !DEBUG builds.
>
> ASSERT() is definitely not way to deal with external input. I could
> possibly accept a WARN(), but see above.
>
> >>> The reason I am saying this is that stop_cpu is called in a number of
> >>> places beyond halt_this_cpu and as far as I can tell any of them coul=
d
> >>> trigger the panic. (I admit they are unlikely places but still.)
> >>
> >> This is one of the example where the CPU will not be stopped for a sho=
rt
> >> period of time. We should deal with them differently (i.e. migrating t=
he
> >> trusted OS or else) so we give all the chance for the CPU to be fully =
powered.
> >>
> >> IMHO, this is a different issue and hence why I didn't ask Dmitry to s=
olve it.
> >
> > I see your point now. I was seeing the two things as one.
> >
> > I think it is true that the WFI loop is likely to work. Also it is true
> > that from a power perspective it makes no different on power down or
> > reboot.  From that point of view this patch is OK.
> >
> > But even on shut-down/reboot, why not do that as a fallback in case
> > CPU_OFF didn't work? It is going to work most of the times anyway, why
> > change the default for the few cases that doesn't work?
>
> Because we would not be consistent how we would turn off a CPU on a
> system supporting PSCI. I would prefer to use the same method everywhere
> so it is easier to reason about.
>
> I am also not sure how you define "most of the time". Yes it is possible
> that the boards we aware of will not have this issue, but how about the
> one we don't know?
>
> >
> > Given that this patch would work, I don't want to insist on this and le=
t
> > you decide.
> >
> >
> > But even if we don't want to remove the panic as part of this patch, I
> > think we should remove the panic in a separate patch anyway, at least
> > until someone investigates and thinks of a strategy how to migrate the
> > TrustedOS as you suggested.
> If we accept this patch, then we remove the immediate pain. The other
> uses of stop_cpu() are in:
>         1) idle_loop(), this is reachable when turning off a CPU after bo=
ot
> (not supported on Arm)
>          2) start_secondary(), this is only used during boot (CPU
> hot-unplug is not supported)
>
> Even if it would be possible to trigger the panic() in 2), I am not
> aware of an immediate issue there. So I think it would be the wrong
> approach to remove the panic() first and then investigate.
>
> The advantage of the panic() is it will remind us that some needs to be
> fixed. With a warning (or WARN()) people will tend to ignore it.
>
> Cheers,
>
> --
> Julien Grall

