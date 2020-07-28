Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2475231207
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 20:53:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0Uik-0003qC-7p; Tue, 28 Jul 2020 18:53:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ltMw=BH=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1k0Uii-0003q7-PV
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 18:53:00 +0000
X-Inumbo-ID: 8ea9ca82-d103-11ea-8bc4-bc764e2007e4
Received: from mail-oi1-x244.google.com (unknown [2607:f8b0:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ea9ca82-d103-11ea-8bc4-bc764e2007e4;
 Tue, 28 Jul 2020 18:52:59 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id w17so18434383oie.6
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2020 11:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wG80olMuj0yU8vksl8FAt5NrP7SBZdTf2h2KTFtompE=;
 b=qaYo2iFntC2oTEi64xCKEney2JMwllUHbBExMWRdWr0Aa04ZpQi6UMG4SkuUFuVQ8G
 WaiUNg6VhziPQgOwSSuBB6uJFxLFxoMhvCUlmLjgr81Z7JqHF3VHs/RqLUaNttKz5UHg
 bh/eDJycn7cgM7iZf5OPirjLYmg8Eudfbi/q9JYnf4npO2nVkBzdBJXVQiP+WMJER8CA
 jtfsUOv+SONb6DKtcZByxT6UmoeP56PFXH5boijIM5KSb9EFZyvFz60feSPXaZidY2TO
 d0SodP7HHx+06r9cTtM+Bdiq+6SGl7N1BwX3WLj5fv3Roena3WmfwWhU/5/IuPgrZJSo
 qPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wG80olMuj0yU8vksl8FAt5NrP7SBZdTf2h2KTFtompE=;
 b=no80378HUELiZUYJd5Ossst/T0Sb50CLqvEG2BZOhrOMZZ7Y/hH1DUf22Lfy+1ucAt
 ynFFUvRAul/wheCB2fQAJJAdkmF1JPuDBF/JcKrWigk9RxhKpbIfFKlS32tUDYQbBBj8
 IOIX5zZM24p24N5Zs2f85v3ua1Eb87ODujxtMKHSZPo/BCllk7hxuYEPk5Xcy8/ZsjlA
 xSuWV41dzSkfN7uPK9lesV4sqQbWI7zgcQ+8by5SnSt/Q09ZUpR718gFN6ytsBg8EuVu
 VxLw5o48HVlhJeiWZ9N/slC+Y42xuak3IiTp7BS9cKm8JaVminI/u9dScfAvHffESBow
 h2VQ==
X-Gm-Message-State: AOAM531o++g7lJOvSBhUufsza76CIt4ckf63/rmNFfsd/zOR5knQUjZ7
 XgRSuC68VgP715YY2BNcmIqhJJ9JnqOlV5M0ou4=
X-Google-Smtp-Source: ABdhPJxHv5OwMm7p82gJnB2GuqXDBmOS1UDi7BgNiCP1QRFRGMpPH1/LQQC/UxybKpje5kc5VZl+JNiHEVqfbAc16fM=
X-Received: by 2002:aca:380a:: with SMTP id f10mr4493818oia.161.1595962379343; 
 Tue, 28 Jul 2020 11:52:59 -0700 (PDT)
MIME-Version: 1.0
References: <CA+wirGqXMoRkS-aJmfFLipUv8SdY5LKV1aMrF0yKRJQaMvzs6Q@mail.gmail.com>
 <1c5cee83-295e-cc02-d018-b53ddc6e3590@xen.org>
 <CA+wirGpFvLBzYRBaq8yspJj8j9-yoLwN88bt079qM5yqPTwtcA@mail.gmail.com>
 <02b630bd-22e0-afde-6784-be068d0948ae@arm.com>
 <CA+wirGoG+im2mwb2ye6j4MpcVtfQ-prhhmVgdBTosus7hjeu=w@mail.gmail.com>
 <e091c32f-d121-d549-a2fa-f906d28ff8f1@arm.com>
 <alpine.DEB.2.21.2007281054520.646@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2007281054520.646@sstabellini-ThinkPad-T480s>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Tue, 28 Jul 2020 11:52:40 -0700
Message-ID: <CACMJ4GYWBNV5O4otbDj2Lx3Qq6sFPWm8bX4CRABEU3g1izQraQ@mail.gmail.com>
Subject: Re: dom0 LInux 5.8-rc5 kernel failing to initialize cooling maps for
 Allwinner H6 SoC
To: Stefano Stabellini <sstabellini@kernel.org>
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
Cc: =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alejandro <alejandro.gonzalez.correo@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jul 28, 2020 at 11:16 AM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> On Tue, 28 Jul 2020, Andr=C3=A9 Przywara wrote:
> > On 28/07/2020 11:39, Alejandro wrote:
> > > Hello,
> > >
> > > El dom., 26 jul. 2020 a las 22:25, Andr=C3=A9 Przywara
> > > (<andre.przywara@arm.com>) escribi=C3=B3:
> > >> So this was actually my first thought: The firmware (U-Boot SPL) set=
s up
> > >> some basic CPU frequency (888 MHz for H6 [1]), which is known to nev=
er
> > >> overheat the chip, even under full load. So any concern from your si=
de
> > >> about the board or SoC overheating could be dismissed, with the curr=
ent
> > >> mainline code, at least. However you lose the full speed, by quite a
> > >> margin on the H6 (on the A64 it's only 816 vs 1200(ish) MHz).
> > >> However, without the clock entries in the CPU node, the frequency wo=
uld
> > >> never be changed by Dom0 anyway (nor by Xen, which doesn't even know=
 how
> > >> to do this).
> > >> So from a practical point of view: unless you hack Xen to pass on mo=
re
> > >> cpu node properties, you are stuck at 888 MHz anyway, and don't need=
 to
> > >> worry about overheating.
> > > Thank you. Knowing that at least it won't overheat is a relief. But
> > > the performance definitely suffers from the current situation, and
> > > quite a bit. I'm thinking about using KVM instead: even if it does
> > > less paravirtualization of guests,
> >
> > What is this statement based on? I think on ARM this never really
> > applied, and in general whether you do virtio or xen front-end/back-end
> > does not really matter.

When you say "in general" here, this becomes a very broad statement
about virtio and xen front-end/back-ends being equivalent and
interchangable, and that could cause some misunderstanding for a
newcomer.

There are important differences between the isolation properties of
classic virtio and Xen's front-end/back-ends -- and also the Argo
transport. It's particularly important for Xen because it has
priortized support for stronger isolation between execution
environments to a greater extent than some other hypervisors. It is a
critical differentiator for it. The importance of isolation is why Xen
4.14's headline feature was support for Linux stubdomains, upstreamed
to Xen after years of work by the Qubes and OpenXT communities.

> > IMHO any reasoning about performance just based
> > on software architecture is mostly flawed (because it's complex and
> > reality might have missed some memos ;-)

That's another pretty strong statement. Measurement is great, but
maybe performance analysis that is informed and directed by an
understanding of the architecture under test could potentially be more
rigorous and persuasive than work done without it?

> > So just measure your particular use case, then you know.

Hmm.

> > > I'm sure that the ability to use
> > > the maximum frequency of the CPU would offset the additional overhead=
,
> > > and in general offer better performance. But with KVM I lose the
> > > ability to have individual domU's dedicated to some device driver,
> > > which is a nice thing to have from a security standpoint.
> >
> > I understand the theoretical merits, but a) does this really work on
> > your board and b) is this really more secure? What do you want to
> > protect against?
>
> For "does it work on your board", the main obstacle is typically IOMMU
> support to be able to do device assignment properly. That's definitely
> something to check. If it doesn't work nowadays you can try to
> workaround it by using direct 1:1 memory mappings [1].  However, for
> security then you have to configure a MPU. I wonder if H6 has a MPU and
> how it can be configured. In any case, something to keep in mind in case
> the default IOMMU-based setup doesn't work for some reason for the
> device you care about.
>
> For "is this really more secure?", yes it is more secure as you are
> running larger portions of the codebase in unprivileged mode and isolated
> from each other with IOMMU (or MPU) protection. See what the OpenXT and
> Qubes OS guys have been doing.

Yes. Both projects have done quite a lot of work to enable and
maintain driver domains.

thanks,

Christopher

>
>
> [1] https://marc.info/?l=3Dxen-devel&m=3D158691258712815

