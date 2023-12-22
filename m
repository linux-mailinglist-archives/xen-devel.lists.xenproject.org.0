Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7750681C738
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 10:17:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659276.1028809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGbe7-0005nR-MJ; Fri, 22 Dec 2023 09:16:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659276.1028809; Fri, 22 Dec 2023 09:16:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGbe7-0005lm-JP; Fri, 22 Dec 2023 09:16:43 +0000
Received: by outflank-mailman (input) for mailman id 659276;
 Fri, 22 Dec 2023 09:16:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=buqB=IB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rGbe6-0005lg-6r
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 09:16:42 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0f76559-a0aa-11ee-98eb-6d05b1d4d9a1;
 Fri, 22 Dec 2023 10:16:40 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50e3cdcf010so1847968e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 01:16:40 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a05651232ce00b0050e2ceb395csm480739lfg.219.2023.12.22.01.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 01:16:39 -0800 (PST)
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
X-Inumbo-ID: d0f76559-a0aa-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703236600; x=1703841400; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+2BRkSyWdTjrfGeOtDYIpTNdh8fpcgTgPydWGvcBYTA=;
        b=EBD+B+cWYR3M0ah0XWaNnFooT1WCDgUzMahLpEbjte8CsdTvT+FuWMQY+iCtOHd7lT
         iwhu9IZ+n2AkCP/Sc6s85t92S/5fml0M/gg+6fktNcuzjyfP5O6iw3RVAXdrOSrB2lox
         zd8ONxY1jr9Z91OQZkwgWcIddMvQerLl9h/qsXjZCc5roa5NKQAU5x4H14Klt8riW+ZW
         AdYVtkFRNs49aqqBGpUpX5iQaQ21DnoLFmPzryD+ceHcSGCcuxe1IhupUaRDM7lrdH/G
         xpkRTSV+emjacsTYCGuyxZtLKXu8oEvrZ0IZ4OaVxXjDwWLQaqG8rgZGjKiQjRX+f/kF
         4mYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703236600; x=1703841400;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+2BRkSyWdTjrfGeOtDYIpTNdh8fpcgTgPydWGvcBYTA=;
        b=tJ0vEJsTji4FZkkysuNe3pZeF31jAr3RIVBLzz7Bgl9YfWVoAtGGNIYR+YB0sSdPZz
         W9UNs3CTtFrAVBtS8wFCvuk59vljVSpZOlyiVozDwQV0duU3e+8ebmw3wsVS0NOhszVm
         96kzm9LgWsD7qdEaeCWjznOCP+UHt51CyF7RsYlEYazxbGPQccUTCEfF3TDjI1NgW5/y
         IxxDmjfcDRVf51bE+s9AhOpl0viDnoU64RUoAbjG8wnifO0F/eNeYfbl48lRXtqv3INR
         /vPuUL7vTPRYElxLxujqC6f1KLGtlqpJzMgU5UuFUZkYJIqEGZ8fMNgSeyv6bYdlKVnC
         5qow==
X-Gm-Message-State: AOJu0Yy5jKC9xKzh2xWp1nMnCbI7g2K8nz1eXJtqwmXVUHu6vQC/kmiy
	UQ6Lw1XdDcRJ2nJtyiOxEZE=
X-Google-Smtp-Source: AGHT+IF7jclQs/ekIseNVDk4eD2I/jueIStd/pWFp5EOxdib5WQTh9ToH4u1cAtqVfacw3Q1A/cmUg==
X-Received: by 2002:ac2:4649:0:b0:50e:3d69:6522 with SMTP id s9-20020ac24649000000b0050e3d696522mr284901lfo.175.1703236599903;
        Fri, 22 Dec 2023 01:16:39 -0800 (PST)
Message-ID: <11343301f5fc5193cf1ce959a3dbde37e3201b19.camel@gmail.com>
Subject: Re: [PATCH v2 30/39] xen/riscv: define an address of frame table
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Fri, 22 Dec 2023 11:16:38 +0200
In-Reply-To: <03651b8f-238a-4d64-8595-6b814a118d87@suse.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
	 <13ad41657814e4fc235772fa0928de1723ae7c3d.1700761381.git.oleksii.kurochko@gmail.com>
	 <b2c42d56-6bc8-4ea8-9e6f-cae259c274c5@suse.com>
	 <5d3e7f9ad7ff0eb779e269eee1c42300d987b5a1.camel@gmail.com>
	 <abacb997-99f4-49c3-b146-320cc9ff1a90@suse.com>
	 <8deb45febe3d8061bca4a8376c280befeaa00fed.camel@gmail.com>
	 <03651b8f-238a-4d64-8595-6b814a118d87@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Fri, 2023-12-22 at 09:08 +0100, Jan Beulich wrote:
> On 21.12.2023 20:59, Oleksii wrote:
> > On Mon, 2023-12-18 at 12:22 +0100, Jan Beulich wrote:
> > > On 18.12.2023 11:36, Oleksii wrote:
> > > > On Thu, 2023-12-14 at 16:48 +0100, Jan Beulich wrote:
> > > > > On 24.11.2023 11:30, Oleksii Kurochko wrote:
> > > > > > +#define SLOTN_ENTRY_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 SLOTN(1)
> > > > > > +
> > > > > > =C2=A0#define XEN_VIRT_START 0xFFFFFFFFC0000000 /* (_AC(-1, UL)
> > > > > > + 1
> > > > > > -
> > > > > > GB(1)) */
> > > > > > +
> > > > > > +#define FRAMETABLE_VIRT_START=C2=A0=C2=A0 SLOTN(196)
> > > > > > +#define FRAMETABLE_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 GB(3)
> > > > > > +#define FRAMETABLE_NR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (FRAMETABLE_SIZE /
> > > > > > sizeof(*frame_table))
> > > > > > +#define FRAMETABLE_VIRT_END=C2=A0=C2=A0=C2=A0=C2=A0 (FRAMETABL=
E_VIRT_START +
> > > > > > FRAMETABLE_SIZE - 1)
> > > > > > +
> > > > > > +#define VMAP_VIRT_START=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 SLOTN(194)
> > > > > > +#define VMAP_VIRT_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 GB(1)
> > > > >=20
> > > > > May I suggest that you keep these blocks sorted by slot
> > > > > number?
> > > > > Or
> > > > > wait,
> > > > > the layout comment further up is also in decreasing order, so
> > > > > that's
> > > > > fine here, but then can all of this please be moved next to
> > > > > the
> > > > > comment
> > > > > actually providing the necessary context (thus eliminating
> > > > > the
> > > > > need
> > > > > for
> > > > > new comments)?
> > > > Sure, I'll put this part close to layout comment.
> > > >=20
> > > > > =C2=A0You'll then also notice that the generalization here
> > > > > (keeping basically the same layout for e.g. SATP_MODE_SV48,
> > > > > just
> > > > > shifted
> > > > > by 9 bits) isn't in line with the comment there.
> > > > Does it make sense to add another one table with updated
> > > > addresses
> > > > for
> > > > SATP_MODE_SV48?
> > >=20
> > > Well, especially if you mean to support that mode, its layout
> > > surely
> > > wants writing down. I was hoping though that maybe you/we could
> > > get
> > > away
> > > without multiple tables, but e.g. use one having multiple
> > > columns.
> > I came up with the following but I am not sure that it is really
> > convient:
> > /*
> > =C2=A0* RISC-V64 Layout:
> > =C2=A0*
> > #if RV_STAGE1_MODE =3D=3D SATP_MODE_SV39
> > =C2=A0*
> > =C2=A0* From the riscv-privileged doc:
> > =C2=A0*=C2=A0=C2=A0 When mapping between narrower and wider addresses,
> > =C2=A0*=C2=A0=C2=A0 RISC-V zero-extends a narrower physical address to =
a wider
> > size.
> > =C2=A0*=C2=A0=C2=A0 The mapping between 64-bit virtual addresses and th=
e 39-bit
> > usable
> > =C2=A0*=C2=A0=C2=A0 address space of Sv39 is not based on zero-extensio=
n but
> > instead
> > =C2=A0*=C2=A0=C2=A0 follows an entrenched convention that allows an OS =
to use one
> > or
> > =C2=A0*=C2=A0=C2=A0 a few of the most-significant bits of a full-size (=
64-bit)
> > virtual
> > =C2=A0*=C2=A0=C2=A0 address to quickly distinguish user and supervisor =
address
> > regions.
> > =C2=A0*
> > =C2=A0* It means that:
> > =C2=A0*=C2=A0=C2=A0 top VA bits are simply ignored for the purpose of t=
ranslating
> > to
> > PA.
> > #endif
> > =C2=A0*
> > =C2=A0*=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SATP_MODE_SV32=C2=A0=C2=A0 =
SATP_MODE_SV39=C2=A0=C2=A0 SATP_MODE_SV48=C2=A0=20
> > SATP_MODE_SV57
> > =C2=A0*=C2=A0=C2=A0=C2=A0=C2=A0 ---------------------------------------=
---------------------
> > ----
> > -----------
> > =C2=A0* BA0 | FFFFFFFFFFE00000 | FFFFFFFFC0000000 | FFFFFF8000000000 |
> > FFFF000000000000
> > =C2=A0* BA1 | 0000000019000000 | 0000003200000000 | 0000640000000000 |
> > 00C8000000000000
> > =C2=A0* BA2 | 0000000018800000 | 0000003100000000 | 0000620000000000 |
> > 00C4000000000000
> > =C2=A0* BA3 | 0000000018400000 | 0000003080000000 | 0000610000000000 |
> > 00C2000000000000
> > =C2=A0*=20
> > =C2=A0*
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =3D=3D=3D=3D
> > =3D=3D=3D=3D=3D
> > =C2=A0* Start addr=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 End addr=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 Size=C2=A0 | Slot=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |area
> > description
> > =C2=A0*
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =3D=3D=3D=3D
> > =3D=3D=3D=3D=3D
> > =C2=A0* BA0 + 0x800000 |=C2=A0 FFFFFFFFFFFFFFFF=C2=A0=C2=A0 |1016 MB |
> > L${HYP_PT_ROOT_LEVEL} 511=C2=A0=C2=A0=C2=A0=C2=A0 | Unused
> > =C2=A0* BA0 + 0x400000 |=C2=A0 BA0 + 0x800000=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 2 MB=C2=A0 |
> > L${HYP_PT_ROOT_LEVEL} 511=C2=A0=C2=A0=C2=A0=C2=A0 | Fixmap
> > =C2=A0* BA0 + 0x200000 |=C2=A0 BA0 + 0x400000=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 4 MB=C2=A0 |
> > L${HYP_PT_ROOT_LEVEL} 511=C2=A0=C2=A0=C2=A0=C2=A0 | FDT
> > =C2=A0* BA0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 BA0 + 0x200000=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 MB=C2=A0 |
> > L${HYP_PT_ROOT_LEVEL} 511=C2=A0=C2=A0=C2=A0=C2=A0 | Xen
> > =C2=A0*=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
1 GB=C2=A0 |
> > L${HYP_PT_ROOT_LEVEL} 510=C2=A0=C2=A0=C2=A0=C2=A0 | Unused
> > =C2=A0* BA1 + 0x000000 |=C2=A0 BA1 + 0x4D80000000 | 309 GB |
> > L${HYP_PT_ROOT_LEVEL} 200-509 | Direct map
> > =C2=A0*=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
1 GB=C2=A0 |
> > L${HYP_PT_ROOT_LEVEL} 199=C2=A0=C2=A0=C2=A0=C2=A0 | Unused
> > =C2=A0* BA2 + 0x000000 |=C2=A0 BA2 + 0xC0000000=C2=A0=C2=A0 |=C2=A0 3 G=
B=C2=A0 |
> > L${HYP_PT_ROOT_LEVEL} 196-198 | Frametable
> > =C2=A0*=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
1 GB=C2=A0 |
> > L${HYP_PT_ROOT_LEVEL} 195=C2=A0=C2=A0=C2=A0=C2=A0 | Unused
> > =C2=A0* BA3 + 0x000000 |=C2=A0 BA3 + 0x40000000=C2=A0=C2=A0 |=C2=A0 1 G=
B=C2=A0 |
> > L${HYP_PT_ROOT_LEVEL} 194=C2=A0=C2=A0=C2=A0=C2=A0 | VMAP
> > =C2=A0*=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 194 GB=
 |
> > L${HYP_PT_ROOT_LEVEL} 0 - 193 | Unused
> > =C2=A0*
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =3D=3D=3D=3D
> > =3D=3D=3D=3D=3D
> > =C2=A0*/
> >=20
> > Do you have better ideas?
>=20
> It doesn't look too bad imo, at the first glance, albeit the line
> wrapping damage of course makes it a little hard to look at. In the
> last table with all lines saying L${HYP_PT_ROOT_LEVEL}, perhaps that
> could be put in the table heading (instead of "Slot" say e.g. "Root
> PT slot")?
Thanks for the remark. It would be definitely better.

~ Oleksii


