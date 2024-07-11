Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34ABA92E900
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 15:14:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757468.1166410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRtcj-00033d-EY; Thu, 11 Jul 2024 13:14:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757468.1166410; Thu, 11 Jul 2024 13:14:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRtcj-00030g-BK; Thu, 11 Jul 2024 13:14:13 +0000
Received: by outflank-mailman (input) for mailman id 757468;
 Thu, 11 Jul 2024 13:14:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xIkU=OL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sRtci-00030a-CK
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 13:14:12 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76594adb-3f87-11ef-bbfb-fd08da9f4363;
 Thu, 11 Jul 2024 15:14:11 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a77cbb5e987so115664666b.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 06:14:11 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a871f3asm255968466b.195.2024.07.11.06.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 06:14:10 -0700 (PDT)
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
X-Inumbo-ID: 76594adb-3f87-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720703651; x=1721308451; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vt3qOpTgvwdzidLgQVT1osNX6CtSjSuJgRWwfFAyxQg=;
        b=TiilvKmx80f6pLN/71aACpOfxxWmi4IXn/67I4iGEOYC6YphcWPaVlcoyt7rUNRuw3
         Y1ZFlbYRYOPnHrVpDYxfoMjL5+h/B6c6tw5WlRqxtL0xcEkdmqlZL8ciGfJPGMLp4mAb
         3hZsUzcn0tx/P1/FO8JCBGEvX04JGZGiUUkqEMllNjQrenYkMV6l/dk48T4Bz06wZF1X
         /113W1KyiOaePG4U3HqxBWpIgw/1bGOO8jUglDJ6LRgjtuLLA6JME5tfjgd/l0LKc1fo
         NgeCIdm2k6ccEcef5/FlT/F74Lr4YgsT6pqGr8tljuya/UiZFyZt1z4CpdnQYEC/tfyd
         vFkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720703651; x=1721308451;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vt3qOpTgvwdzidLgQVT1osNX6CtSjSuJgRWwfFAyxQg=;
        b=p2qiEng4XAOg0xUtxBBY5nrysJvtlSPMOjrmwcDI/G66IUH6m5pIuVKoo9xSiqHG2M
         4DKfa9RaN8s5/ty20iGnsrswrYCmJKPiNqEBpBXQb2GD6D2PSR1PXwTnOXSaRw/3EyOO
         W7nxbYNZ/FSolAbJc3qx9cdtCqYQmBCVp2tEUIoTMHvQ4wgbu61W3pUnYczhbebNQz57
         LD6hZ3jHpNTk82jRhnYyESKxNqIogVxdNCGN17La0n0iGkkgabOZgP7B2LKKMz0QGDUb
         lmXLAyMYk7QviNNXJyYPM3v1GxF7h5iml83qPS9O/L08GO4n1+wL9GOaGCONke+VkkkN
         Px5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXCd0kWg2sHgROU+rLRAxIh6gOtUEs+iFnz5bgsRKSwmqHGYxRowYbSHnfIgjazuLMcuhq9n0pHJzoXZu1Veduhu3JFedabMHuEU6OYCug=
X-Gm-Message-State: AOJu0Yz12uc8+/FXLyR+3yJAUR9y1VR/ekpiwXOjQv9ARSGEX+G+pF3t
	OQkJXrMS9qpiyhfej0BIHtPFXWqaQcTLKJiBMqWqAV4VPT7+pFrh
X-Google-Smtp-Source: AGHT+IF7r8aywEKKfdF6NJ+NgyeUFAWqpl6MV7nx6U18AXHIIcxT9GWA7EX6meoRE0HIP2hX5G4WsA==
X-Received: by 2002:a17:906:22d9:b0:a77:c583:4f78 with SMTP id a640c23a62f3a-a780b705109mr415781766b.39.1720703650645;
        Thu, 11 Jul 2024 06:14:10 -0700 (PDT)
Message-ID: <956cb4f4f11fc0d7679f9b9c3611b7e0649f2633.camel@gmail.com>
Subject: Re: [PATCH v1 5/5] xen/riscv: map FDT
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>,  xen-devel@lists.xenproject.org
Date: Thu, 11 Jul 2024 15:14:09 +0200
In-Reply-To: <5de15734-29eb-42e0-b6c9-f6d734222b59@xen.org>
References: <cover.1720002425.git.oleksii.kurochko@gmail.com>
	 <7e492df051c949744755a221c0448c740d2c681b.1720002425.git.oleksii.kurochko@gmail.com>
	 <3afd94c0-25f4-4ed8-83d2-6f261b8a64b3@suse.com>
	 <021d29540f8e9abec118e9ca9dcd9675310eda84.camel@gmail.com>
	 <9592e857-bf1c-4e26-acd7-dfb5bb12103e@suse.com>
	 <fda966116ce17b9be0b1a467bd31436a6b5ad225.camel@gmail.com>
	 <e58a9128-efdd-4bff-9562-08d5605d0a13@suse.com>
	 <040e6b1d9b8bbe2b316e0e5b891c2564df28335d.camel@gmail.com>
	 <5c6fbbbf-f6bf-43b3-9628-a92c69e3adb1@xen.org>
	 <80864cdf9b6deb31b6e745c45a54a73c9a86ef65.camel@gmail.com>
	 <5de15734-29eb-42e0-b6c9-f6d734222b59@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Thu, 2024-07-11 at 13:44 +0100, Julien Grall wrote:
> Hi Oleksii,
Hi Julien,

>=20
> On 11/07/2024 13:29, Oleksii wrote:
> > On Thu, 2024-07-11 at 12:54 +0100, Julien Grall wrote:
> > > Hi,
> > >=20
> > > On 11/07/2024 12:28, Oleksii wrote:
> > > > Add Julien as he asked basically the same question in another
> > > > thread.
> > >=20
> > > Thanks!
> > >=20
> > > >=20
> > > > On Thu, 2024-07-11 at 12:50 +0200, Jan Beulich wrote:
> > > > > On 11.07.2024 12:26, Oleksii wrote:
> > > > > > On Thu, 2024-07-11 at 11:54 +0200, Jan Beulich wrote:
> > > > > > > On 11.07.2024 11:40, Oleksii wrote:
> > > > > > > > On Wed, 2024-07-10 at 14:38 +0200, Jan Beulich wrote:
> > > > > > > > > On 03.07.2024 12:42, Oleksii Kurochko wrote:
> > > > > > Does it make sense now?
> > > > >=20
> > > > > I think so, yet at the same time it only changes the
> > > > > question:
> > > > > Why is
> > > > > it
> > > > > that you absolutely need to use setup_initial_mapping()?
> > > > There is no strict requirement to use setup_initial_mapping().
> > > > That
> > > > function is available to me at the moment, and I haven't found
> > > > a
> > > > better
> > > > option other than reusing what I currently have.
> > >=20
> > > I am not very familiar with the code base for RISC-V, but looking
> > > at
> > > the
> > > context in the patch, it seems you will still have the identity
> > > mapping
> > > mapped until start_xen().
> > We have identity mapping only for a small piece of .text section:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . =3D ALIGN(IDENT_AREA=
_SIZE);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _ident_start =3D .;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.text.ident)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _ident_end =3D .;
> >=20
> > All other will be identically mapped only in case of linker address
> > is
> > equal to load address.
> >=20
> > >=20
> > > I assume we don't exactly know where the loader will put Xen in
> > > memory.
> > > Which means that the region may clash with your defined runtime
> > > regions
> > > (such as the FDT). Did I misunderstand anything?
> > I am not really get what is the issue here.
> >=20
> > If we are speaking about physical regions then loader will
> > guarantee
> > that Xen and FDT regions don't overlap.
>=20
> Sure. But I was referring to...
>=20
> >=20
> > If we are speaking about virtual regions then Xen will check that
> > nothing is overlaped.=20
>=20
> ... this part. The more regions you mapped with MMU off, the more
> work=20
> you have to do to ensure nothing will clash.
Yes, agree here. Then I have to look at what I need now to introduce
map_pages_to_xen().

Thanks for clarifying.

>=20
> > And the virtual regions are mapped so high so I
> > am not sure that loader will put something there. ( FDT in Xen is
> > mapped to 0xffffffffc0200000 )
> Never say never :). On Arm, some 64-bit HW (such as ADLink AVA
> platform)=20
> has the RAM starting very high and load Xen around 8TB. For Arm, we=20
> still decided to put a limit (10TB) where Xen can be loaded but this
> is=20
> mainly done for convenience (otherwise it is a bit more complicated
> to=20
> get off the identity mapping).
Oh, it is very high. I couldn't even expect.

~ Oleksii

>=20
> We still have a check in place to ensure that Xen is not loaded above
> 10TB. If you map the FDT within the same L1.
>=20
> Cheers,
>=20


