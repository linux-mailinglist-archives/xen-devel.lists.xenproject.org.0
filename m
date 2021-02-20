Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF9F320420
	for <lists+xen-devel@lfdr.de>; Sat, 20 Feb 2021 07:10:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87144.164274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lDLS3-0004oX-EY; Sat, 20 Feb 2021 06:09:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87144.164274; Sat, 20 Feb 2021 06:09:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lDLS3-0004o8-BI; Sat, 20 Feb 2021 06:09:11 +0000
Received: by outflank-mailman (input) for mailman id 87144;
 Sat, 20 Feb 2021 06:02:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aogJ=HW=kernel.org=chenhuacai@srs-us1.protection.inumbo.net>)
 id 1lDLLU-0004Zm-2c
 for xen-devel@lists.xenproject.org; Sat, 20 Feb 2021 06:02:24 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2df76584-4671-43de-a100-eef7380d51aa;
 Sat, 20 Feb 2021 06:02:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C337E64EDE
 for <xen-devel@lists.xenproject.org>; Sat, 20 Feb 2021 06:02:21 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id o15so6357199ilt.6
 for <xen-devel@lists.xenproject.org>; Fri, 19 Feb 2021 22:02:21 -0800 (PST)
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
X-Inumbo-ID: 2df76584-4671-43de-a100-eef7380d51aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613800941;
	bh=ShcGVisZXSeMg1DM1Ug/ltlAeszRZetvwkkEgFVlNas=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YSQAOBZjx77Ns4trHoOsngxkQa38xVjltXBABkfbX425KuGX5umsxwyesIcw3M9m0
	 E1CBeP+KT/7ktq3qJsK+8ztsAyUo1Y+szBDMXVBUy0LssKWNWODnxjYIHb7kwI0p/U
	 OMtv1pX83FzJa09GTTmNeee7rrVKV5Rx57K2tgRQUkoBozsoihRJj5tAd3g/guoNFq
	 6dYliAq0igKoimsq0gG8LbZNbMgmQ/dhvUaUHgPv0ypgHnSvTgIePgQyXuaLXydf1z
	 grZ/lAFZ3Vje1rb1fjKjkE0NPbbhKxxJZc4dBaGoIP5s/mLVrydINYb/OD9SVtUKPj
	 TNTNGsBRQIZHA==
X-Gm-Message-State: AOAM533jBZOZBXQpQvLhjhi4V5aeTpQohu+FDooe0R2ai7RbuCIdZj7Z
	VSBwB0wN+BYeFOPZX8STih2+TcyOssPgBGSyvHU=
X-Google-Smtp-Source: ABdhPJyCLmvlLlMWilIXNLMyuqYrduB90HoBtfugKMuSdQ5Su7DwyI7kL8H7jWSAUPeMHbmo5K5tjSLHJRZ+MPDkFwE=
X-Received: by 2002:a92:6907:: with SMTP id e7mr6713495ilc.134.1613800941002;
 Fri, 19 Feb 2021 22:02:21 -0800 (PST)
MIME-Version: 1.0
References: <20210219173847.2054123-1-philmd@redhat.com> <20210219173847.2054123-6-philmd@redhat.com>
 <31a32613-2a61-7cd2-582a-4e6d10949436@flygoat.com>
In-Reply-To: <31a32613-2a61-7cd2-582a-4e6d10949436@flygoat.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 20 Feb 2021 14:02:08 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6TJyP8diBUu4EsSWSNrVP7YxxPaMNnm2uuZJfdGY40Jg@mail.gmail.com>
Message-ID: <CAAhV-H6TJyP8diBUu4EsSWSNrVP7YxxPaMNnm2uuZJfdGY40Jg@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] hw/mips: Restrict KVM to the malta & virt machines
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>, 
	Peter Maydell <peter.maydell@linaro.org>, Anthony Perard <anthony.perard@citrix.com>, 
	qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, Halil Pasic <pasic@linux.ibm.com>, 
	xen-devel@lists.xenproject.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
	David Gibson <david@gibson.dropbear.id.au>, qemu-arm@nongnu.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, kvm <kvm@vger.kernel.org>, 
	BALATON Zoltan <balaton@eik.bme.hu>, Leif Lindholm <leif@nuviainc.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Radoslaw Biernacki <rad@semihalf.com>, 
	Alistair Francis <alistair@alistair23.me>, Paul Durrant <paul@xen.org>, 
	Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	=?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
	Greg Kurz <groug@kaod.org>, Christian Borntraeger <borntraeger@de.ibm.com>, 
	Cornelia Huck <cohuck@redhat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	David Hildenbrand <david@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Huacai Chen <chenhuacai@kernel.org>

On Sat, Feb 20, 2021 at 12:56 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrot=
e:
>
> =E5=9C=A8 2021/2/20 =E4=B8=8A=E5=8D=881:38, Philippe Mathieu-Daud=C3=A9 =
=E5=86=99=E9=81=93:
> > Restrit KVM to the following MIPS machines:
> > - malta
> > - loongson3-virt
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
> Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>
> > ---
> >   hw/mips/loongson3_virt.c | 5 +++++
> >   hw/mips/malta.c          | 5 +++++
> >   2 files changed, 10 insertions(+)
> >
> > diff --git a/hw/mips/loongson3_virt.c b/hw/mips/loongson3_virt.c
> > index d4a82fa5367..c3679dff043 100644
> > --- a/hw/mips/loongson3_virt.c
> > +++ b/hw/mips/loongson3_virt.c
> > @@ -612,6 +612,10 @@ static void mips_loongson3_virt_init(MachineState =
*machine)
> >       loongson3_virt_devices_init(machine, liointc);
> >   }
> >
> > +static const char *const valid_accels[] =3D {
> > +    "tcg", "kvm", NULL
> > +};
> > +
> >   static void loongson3v_machine_class_init(ObjectClass *oc, void *data=
)
> >   {
> >       MachineClass *mc =3D MACHINE_CLASS(oc);
> > @@ -622,6 +626,7 @@ static void loongson3v_machine_class_init(ObjectCla=
ss *oc, void *data)
> >       mc->max_cpus =3D LOONGSON_MAX_VCPUS;
> >       mc->default_ram_id =3D "loongson3.highram";
> >       mc->default_ram_size =3D 1600 * MiB;
> > +    mc->valid_accelerators =3D valid_accels;
> >       mc->kvm_type =3D mips_kvm_type;
> >       mc->minimum_page_bits =3D 14;
> >   }
> > diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> > index 9afc0b427bf..0212048dc63 100644
> > --- a/hw/mips/malta.c
> > +++ b/hw/mips/malta.c
> > @@ -1443,6 +1443,10 @@ static const TypeInfo mips_malta_device =3D {
> >       .instance_init =3D mips_malta_instance_init,
> >   };
> >
> > +static const char *const valid_accels[] =3D {
> > +    "tcg", "kvm", NULL
> > +};
> > +
> >   static void mips_malta_machine_init(MachineClass *mc)
> >   {
> >       mc->desc =3D "MIPS Malta Core LV";
> > @@ -1456,6 +1460,7 @@ static void mips_malta_machine_init(MachineClass =
*mc)
> >       mc->default_cpu_type =3D MIPS_CPU_TYPE_NAME("24Kf");
> >   #endif
> >       mc->default_ram_id =3D "mips_malta.ram";
> > +    mc->valid_accelerators =3D valid_accels;
> >   }
> >
> >   DEFINE_MACHINE("malta", mips_malta_machine_init)
>

