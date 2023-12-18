Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0094816B41
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 11:37:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655844.1023670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFAyz-0005Nr-5T; Mon, 18 Dec 2023 10:36:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655844.1023670; Mon, 18 Dec 2023 10:36:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFAyz-0005La-2N; Mon, 18 Dec 2023 10:36:21 +0000
Received: by outflank-mailman (input) for mailman id 655844;
 Mon, 18 Dec 2023 10:36:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f46f=H5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rFAyx-0005LU-Pz
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 10:36:19 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46a88669-9d91-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 11:36:17 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2c9f099cf3aso38301231fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 02:36:17 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a193808000000b0050d12fe487bsm978192lfa.277.2023.12.18.02.36.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 02:36:16 -0800 (PST)
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
X-Inumbo-ID: 46a88669-9d91-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702895777; x=1703500577; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=okUy8HINtJZLwVQpwTpc8nuySwXabZIOlPYTAN+PnYc=;
        b=db0sdiRX+S/n7u5zRjUyY3wYwm/jNq9nwBFyIuYAd6qkBszr5IHuxphPGrv0B2kN/q
         GFd6k/yzIsyqdJgA83D22QefrET7dGz/JetsmSEwTOBmSyuyDEuVdfM0CyfcSy2CCuU4
         e+SwHticdz9DuTcv7jSYhTKwFLaCNhzkemF0cwKmw1u+rXyxcklrkPHg4t/0xLLBSuXS
         HMYR2ZHlHZclTvpe2GyTcNYah7gGMXAfbV3vkAxPFTttjF77oEbLGaEGX0zouq4SwpWz
         2Hv3d4bt5swMm+UJrPznAEqvh1ZeEfRgykdyL7hXz6YN1m0R/LbIbLFSR/l3/GUMKNP8
         wkhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702895777; x=1703500577;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=okUy8HINtJZLwVQpwTpc8nuySwXabZIOlPYTAN+PnYc=;
        b=jRJEFj51ZMyloWpVdN+VTagSsj4zRQFgnAVJXfL8Q4yPIcot2xTqD7hQjs2/OCCbyE
         Ob/CMzIp61E+D2aok7r91miw8XBYGEhHdeamEmSXxhWP/6bhLu3APgfXFauIHfV0aeQA
         l6rqMUM9iNwdU0IG79VSoS1Co1wMY6tPy6BLaKN4VSJdTbiIKOilCvjon4QNnh1PwYfx
         uaWoWiryEWzt0/gR8fW9+rBBI1QG33MXV4jecT8yecVGEt6lMyV0SCMyBdmXrpxqCQFi
         s9kGqa9Bp+VDpODjo+fAczUlt2/8wb7ej3QH9CN3HYGvObt35YzHKMryTDYezQSh+5Vl
         Wszg==
X-Gm-Message-State: AOJu0YzihvQz7EOTWh49LJhC4eIT/fbt2PDkGGtrTSvt2Ts+S7NTvubk
	BkuBp4+9tjBG1CcJKf4Tz50=
X-Google-Smtp-Source: AGHT+IH3LZDbLXk0GkIeBpkjitcQ107qNfjV7huLQ7t6FrVCyvRktHp/4lCtSD3VDqp9Y7V5aHJ7bQ==
X-Received: by 2002:a05:6512:2242:b0:50d:1a17:b69c with SMTP id i2-20020a056512224200b0050d1a17b69cmr8158155lfu.52.1702895777100;
        Mon, 18 Dec 2023 02:36:17 -0800 (PST)
Message-ID: <5d3e7f9ad7ff0eb779e269eee1c42300d987b5a1.camel@gmail.com>
Subject: Re: [PATCH v2 30/39] xen/riscv: define an address of frame table
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Mon, 18 Dec 2023 12:36:16 +0200
In-Reply-To: <b2c42d56-6bc8-4ea8-9e6f-cae259c274c5@suse.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
	 <13ad41657814e4fc235772fa0928de1723ae7c3d.1700761381.git.oleksii.kurochko@gmail.com>
	 <b2c42d56-6bc8-4ea8-9e6f-cae259c274c5@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2023-12-14 at 16:48 +0100, Jan Beulich wrote:
> On 24.11.2023 11:30, Oleksii Kurochko wrote:
> > Also the patchs adds some helpful macros.
>=20
> In how far they're (going to be) helpful is hard to tell without uses
> and without some suitable comments.
>=20
> > --- a/xen/arch/riscv/include/asm/config.h
> > +++ b/xen/arch/riscv/include/asm/config.h
> > @@ -77,12 +77,31 @@
> > =C2=A0=C2=A0 name:
> > =C2=A0#endif
> > =C2=A0
> > +#define VPN_BITS=C2=A0=C2=A0=C2=A0 (9)
> > +#define OFFSET_BITS (12)
>=20
> Whose offset? In how far is this different from PAGE_SHIFT?
It is page offset ( RISC-V terminology names it so ) and it is not
different with PAGE_SHIFT. OFFSET_BITS can be dropped.
>=20
> > =C2=A0#ifdef CONFIG_RISCV_64
> > +
> > +#define SLOTN_ENTRY_BITS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (HY=
P_PT_ROOT_LEVEL * VPN_BITS +
> > OFFSET_BITS)
> > +#define SLOTN(slot)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (_AT(vaddr_t,slot) <<
> > SLOTN_ENTRY_BITS)
>=20
> Nit: Missing blank after comma.
Thanks. I'll update that.

>=20
> > +#define SLOTN_ENTRY_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SLO=
TN(1)
> > +
> > =C2=A0#define XEN_VIRT_START 0xFFFFFFFFC0000000 /* (_AC(-1, UL) + 1 -
> > GB(1)) */
> > +
> > +#define FRAMETABLE_VIRT_START=C2=A0=C2=A0 SLOTN(196)
> > +#define FRAMETABLE_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 GB(3)
> > +#define FRAMETABLE_NR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 (FRAMETABLE_SIZE /
> > sizeof(*frame_table))
> > +#define FRAMETABLE_VIRT_END=C2=A0=C2=A0=C2=A0=C2=A0 (FRAMETABLE_VIRT_S=
TART +
> > FRAMETABLE_SIZE - 1)
> > +
> > +#define VMAP_VIRT_START=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 SLOTN(194)
> > +#define VMAP_VIRT_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 GB(1)
>=20
> May I suggest that you keep these blocks sorted by slot number? Or
> wait,
> the layout comment further up is also in decreasing order, so that's
> fine here, but then can all of this please be moved next to the
> comment
> actually providing the necessary context (thus eliminating the need
> for
> new comments)?
Sure, I'll put this part close to layout comment.

>  You'll then also notice that the generalization here
> (keeping basically the same layout for e.g. SATP_MODE_SV48, just
> shifted
> by 9 bits) isn't in line with the comment there.
Does it make sense to add another one table with updated addresses for
SATP_MODE_SV48?
Microchip has h/w which requires SATP_MODE_SV48 ( at least ), so I have
a patch which introduces SATP_MODE_SV48 and I planned to update the
layout table in this patch.

>=20
> > @@ -95,6 +114,8 @@
> > =C2=A0#define RV_STAGE1_MODE SATP_MODE_SV32
> > =C2=A0#endif
> > =C2=A0
> > +#define HYP_PT_ROOT_LEVEL (CONFIG_PAGING_LEVELS - 1)
>=20
> I understand that CONFIG_PAGING_LEVELS is defined only just up from
> here,
> but what that identifier stands for is quite clear. It would seem to
> me
> that moving this up ahead if its first use would help clarity.
Thanks. It can be useful, so I'll move it up.

~ Oleksii

