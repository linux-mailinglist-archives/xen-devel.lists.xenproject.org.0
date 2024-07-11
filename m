Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 739C392E84A
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 14:30:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757433.1166349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRsvh-0000yy-2C; Thu, 11 Jul 2024 12:29:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757433.1166349; Thu, 11 Jul 2024 12:29:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRsvg-0000xC-Ve; Thu, 11 Jul 2024 12:29:44 +0000
Received: by outflank-mailman (input) for mailman id 757433;
 Thu, 11 Jul 2024 12:29:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xIkU=OL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sRsvf-0000x6-Mm
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 12:29:43 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f7bc317-3f81-11ef-bbfb-fd08da9f4363;
 Thu, 11 Jul 2024 14:29:42 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a77e7420697so120442466b.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 05:29:42 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a853883sm254358966b.144.2024.07.11.05.29.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 05:29:41 -0700 (PDT)
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
X-Inumbo-ID: 3f7bc317-3f81-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720700982; x=1721305782; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rJt8Tyv20wmzolAieM6gHLwRLBB92pjLN3k7/NvGHNY=;
        b=VH5MvvDYvkEYYI/nieQeOGxmXxGmXtnSTVnIj5JJyE0v5D8u/IQNDA+g8pVkCjWVzo
         MvxFS05vlFpAOC1pGNbR2IJZYGY4Cl7ZJk0hF5TOBueLFFC0qi/+iueF972ZT21VOPPm
         MUd7lzCI8qxqGiWpeB6bOcJc9nz9yZyQlI8/zJjPexxu3FW3N3AeVXG6tW3+GUdpci4H
         h2yKFge69UxZmpKVAHtX5P0lDVZSx6klYyEJ/En6K5konGtsI4ZuyeamN7Ti3mLHPzrg
         7w5KkHHqZ40LEAjug0fXIOeA5qni/BmVxsompjz3cXOk3WKIfGdhmqc09YV82fpFBwHs
         KPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720700982; x=1721305782;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rJt8Tyv20wmzolAieM6gHLwRLBB92pjLN3k7/NvGHNY=;
        b=rUOuTEs/jmtTZmJ03jaIiaLv69ArFKWGDu983xuNaXS6YOmsUSuKeq5K/thXp17W03
         uFO8uogSII3yF+MZmoTzWTfBc2gNKDetacDoT1dDHFnCl4buhITAeT6a2DV0Oqdm3Kmf
         tQo11T7mQQLzbF5ntnq8wT5YB18Yl7B4lWQQlqLdLhriBTwyn/hP2PXO3f71Fz6YgDU3
         K3kitU6oQYMDYyTENL7RHPMLCsMb4d74xaU5io8mooYO1wxl09GsXI4j+tnkPZ4n792s
         fzfmfOz/4Q8W8MB+9/jx6X0Ira/VhgvTPkYhpN8yVyWWd9MiGpwguHFMBMgpiWV/BUsa
         BntA==
X-Forwarded-Encrypted: i=1; AJvYcCXxOa7q0Old4hc1LFh+/OBWWeU6J/D2tqjCVkvbaqFw50JLnLq/qVThgqz3QKF1vG1Af3Fue7UXTtxUe7HaMyvDFhRd+EDcsgh5O4eXbLk=
X-Gm-Message-State: AOJu0Yz+ekW4dKiUKMXn75PfKoP4owvt10HI72CpEI6sfH0J+mal9UkT
	urofas5NuBemJfW8wh30KetSfS56EjiLFs6N2voOGIX3pX5R3OCQ
X-Google-Smtp-Source: AGHT+IGplMgDa3oW5nkbZ6wAy7YKGe6ij0XqIDlpOaYdAF0EwR39ESY92+y8qTLE64Hd0GV/qUg2HQ==
X-Received: by 2002:a17:906:1709:b0:a77:eb34:3b53 with SMTP id a640c23a62f3a-a780b6881f7mr552464366b.8.1720700981372;
        Thu, 11 Jul 2024 05:29:41 -0700 (PDT)
Message-ID: <80864cdf9b6deb31b6e745c45a54a73c9a86ef65.camel@gmail.com>
Subject: Re: [PATCH v1 5/5] xen/riscv: map FDT
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>,  xen-devel@lists.xenproject.org
Date: Thu, 11 Jul 2024 14:29:40 +0200
In-Reply-To: <5c6fbbbf-f6bf-43b3-9628-a92c69e3adb1@xen.org>
References: <cover.1720002425.git.oleksii.kurochko@gmail.com>
	 <7e492df051c949744755a221c0448c740d2c681b.1720002425.git.oleksii.kurochko@gmail.com>
	 <3afd94c0-25f4-4ed8-83d2-6f261b8a64b3@suse.com>
	 <021d29540f8e9abec118e9ca9dcd9675310eda84.camel@gmail.com>
	 <9592e857-bf1c-4e26-acd7-dfb5bb12103e@suse.com>
	 <fda966116ce17b9be0b1a467bd31436a6b5ad225.camel@gmail.com>
	 <e58a9128-efdd-4bff-9562-08d5605d0a13@suse.com>
	 <040e6b1d9b8bbe2b316e0e5b891c2564df28335d.camel@gmail.com>
	 <5c6fbbbf-f6bf-43b3-9628-a92c69e3adb1@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Thu, 2024-07-11 at 12:54 +0100, Julien Grall wrote:
> Hi,
>=20
> On 11/07/2024 12:28, Oleksii wrote:
> > Add Julien as he asked basically the same question in another
> > thread.
>=20
> Thanks!
>=20
> >=20
> > On Thu, 2024-07-11 at 12:50 +0200, Jan Beulich wrote:
> > > On 11.07.2024 12:26, Oleksii wrote:
> > > > On Thu, 2024-07-11 at 11:54 +0200, Jan Beulich wrote:
> > > > > On 11.07.2024 11:40, Oleksii wrote:
> > > > > > On Wed, 2024-07-10 at 14:38 +0200, Jan Beulich wrote:
> > > > > > > On 03.07.2024 12:42, Oleksii Kurochko wrote:
> > > > Does it make sense now?
> > >=20
> > > I think so, yet at the same time it only changes the question:
> > > Why is
> > > it
> > > that you absolutely need to use setup_initial_mapping()?
> > There is no strict requirement to use setup_initial_mapping(). That
> > function is available to me at the moment, and I haven't found a
> > better
> > option other than reusing what I currently have.
>=20
> I am not very familiar with the code base for RISC-V, but looking at
> the=20
> context in the patch, it seems you will still have the identity
> mapping=20
> mapped until start_xen().
We have identity mapping only for a small piece of .text section:
        . =3D ALIGN(IDENT_AREA_SIZE);
        _ident_start =3D .;
        *(.text.ident)
        _ident_end =3D .;

All other will be identically mapped only in case of linker address is
equal to load address.

>=20
> I assume we don't exactly know where the loader will put Xen in
> memory.=20
> Which means that the region may clash with your defined runtime
> regions=20
> (such as the FDT). Did I misunderstand anything?
I am not really get what is the issue here.

If we are speaking about physical regions then loader will guarantee
that Xen and FDT regions don't overlap.

If we are speaking about virtual regions then Xen will check that
nothing is overlaped. And the virtual regions are mapped so high so I
am not sure that loader will put something there. ( FDT in Xen is
mapped to 0xffffffffc0200000 ).

Could you please clarify what I am missing?

>=20
> That's one of the reason on Arm we are trying to enable the MMU very=20
> early. The only thing we setup is a mapping for Xen (and earlyprintk)
> all the rest will be mapped once the MMU is on.
It makes sense. Then I have to introduce map_pages_to_xen() first and
then early_fdt_map().

~ Oleksii

>=20
> With that, the only thing you need to take care off the runtime Xen=20
> address overlapping with the identity mapping.




