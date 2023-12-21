Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3D081BF4A
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 21:01:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659151.1028630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGPDf-0002sm-P4; Thu, 21 Dec 2023 20:00:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659151.1028630; Thu, 21 Dec 2023 20:00:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGPDf-0002qC-LT; Thu, 21 Dec 2023 20:00:35 +0000
Received: by outflank-mailman (input) for mailman id 659151;
 Thu, 21 Dec 2023 20:00:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ywj9=IA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rGPDd-0002q6-TP
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 20:00:33 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9909d5b6-a03b-11ee-98eb-6d05b1d4d9a1;
 Thu, 21 Dec 2023 21:00:32 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-50e49a0b5caso1519935e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Dec 2023 12:00:32 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 dx10-20020a0565122c0a00b0050e5a280ce0sm334012lfb.106.2023.12.21.12.00.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 12:00:31 -0800 (PST)
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
X-Inumbo-ID: 9909d5b6-a03b-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703188832; x=1703793632; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=x9WEUIFmKJqPKGpZfKvPoIyWtjVLcECz2Yl/a8fI660=;
        b=i+bllZES3SbRn9LDh4joUzYNOGCQSfW3LmJulBlRuSuzgdyIDB7rsudpEvz4RejOL9
         0eLE1MwhUOhN2QBsHAdUoLWPfwXxKExta1zOfl+PCrudQDgNVEBXSRi1uomt1pepItcb
         rYVua3F5+sTRzLb7f1YkkVODvzGqWXnaDZb+UupoS0ZS1raTSYtpOMT9aN20XQHF/Jiz
         LUgH18dUigpSCUkbgR5fg7lLREOzj1hi2j5yKT0RzAdvFdZTLlEG/Z6lo3JJJlmxwW1A
         zShIXbiwLi0etK2EnvcMmDbljXzn4glnRrt0PWnmmnJFA4ahZ1yXeIa89CYljq7mJEGM
         ROwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703188832; x=1703793632;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x9WEUIFmKJqPKGpZfKvPoIyWtjVLcECz2Yl/a8fI660=;
        b=cRy/8V8pV1IpiBTxAhadDokoVUsNRTXzZRJ3ub9BcFRM2y+sOXJ/5WOPTEFDBEegd9
         pnhWszeTQoqSYqtDIXjdJwLFr9/nd7gmecwy1LrZfFN1IJDMqoZfLYIT56nT7wfWeoaa
         c7oWC6bNe0G/O/2uCtl32yZyKytsAE5KjZbEi4WeRx8JE4tkgSRb+f1pusr1LRJtVfLM
         PgPkJJ78CZ8mn3j/u/viOS895XTidLwEu80kSWJKzJ22kXwk0NkrNLkAmEaOdYTrV2YP
         /ntCurPnMxNmEg2xPXDD2sZXHyBBb/R/Ul1yhWumV8UVWLxPZpTkeCcVFfrQUUi9ZYqe
         HDKg==
X-Gm-Message-State: AOJu0Yy7hriPzYQO1suWtAuWxfniZBqpMXdmFEIZy9o79ayV3os9cV6k
	5KVBvpz0g/gncjH61SRPsbM=
X-Google-Smtp-Source: AGHT+IF7Hl2w0ylbL1sOUk+gyND6x3GKK2P5kU7YDDkBOaI7TLO0dzLgU3JzxAKt86ug05AIqklyVg==
X-Received: by 2002:a19:4f55:0:b0:50b:fad6:2f86 with SMTP id a21-20020a194f55000000b0050bfad62f86mr80918lfk.126.1703188831875;
        Thu, 21 Dec 2023 12:00:31 -0800 (PST)
Message-ID: <8deb45febe3d8061bca4a8376c280befeaa00fed.camel@gmail.com>
Subject: Re: [PATCH v2 30/39] xen/riscv: define an address of frame table
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Thu, 21 Dec 2023 21:59:54 +0200
In-Reply-To: <abacb997-99f4-49c3-b146-320cc9ff1a90@suse.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
	 <13ad41657814e4fc235772fa0928de1723ae7c3d.1700761381.git.oleksii.kurochko@gmail.com>
	 <b2c42d56-6bc8-4ea8-9e6f-cae259c274c5@suse.com>
	 <5d3e7f9ad7ff0eb779e269eee1c42300d987b5a1.camel@gmail.com>
	 <abacb997-99f4-49c3-b146-320cc9ff1a90@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Mon, 2023-12-18 at 12:22 +0100, Jan Beulich wrote:
> On 18.12.2023 11:36, Oleksii wrote:
> > On Thu, 2023-12-14 at 16:48 +0100, Jan Beulich wrote:
> > > On 24.11.2023 11:30, Oleksii Kurochko wrote:
> > > > +#define SLOTN_ENTRY_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 SLOTN(1)
> > > > +
> > > > =C2=A0#define XEN_VIRT_START 0xFFFFFFFFC0000000 /* (_AC(-1, UL) + 1
> > > > -
> > > > GB(1)) */
> > > > +
> > > > +#define FRAMETABLE_VIRT_START=C2=A0=C2=A0 SLOTN(196)
> > > > +#define FRAMETABLE_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 GB(3)
> > > > +#define FRAMETABLE_NR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 (FRAMETABLE_SIZE /
> > > > sizeof(*frame_table))
> > > > +#define FRAMETABLE_VIRT_END=C2=A0=C2=A0=C2=A0=C2=A0 (FRAMETABLE_VI=
RT_START +
> > > > FRAMETABLE_SIZE - 1)
> > > > +
> > > > +#define VMAP_VIRT_START=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 SLOTN(194)
> > > > +#define VMAP_VIRT_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 GB(1)
> > >=20
> > > May I suggest that you keep these blocks sorted by slot number?
> > > Or
> > > wait,
> > > the layout comment further up is also in decreasing order, so
> > > that's
> > > fine here, but then can all of this please be moved next to the
> > > comment
> > > actually providing the necessary context (thus eliminating the
> > > need
> > > for
> > > new comments)?
> > Sure, I'll put this part close to layout comment.
> >=20
> > > =C2=A0You'll then also notice that the generalization here
> > > (keeping basically the same layout for e.g. SATP_MODE_SV48, just
> > > shifted
> > > by 9 bits) isn't in line with the comment there.
> > Does it make sense to add another one table with updated addresses
> > for
> > SATP_MODE_SV48?
>=20
> Well, especially if you mean to support that mode, its layout surely
> wants writing down. I was hoping though that maybe you/we could get
> away
> without multiple tables, but e.g. use one having multiple columns.
I came up with the following but I am not sure that it is really
convient:
/*
 * RISC-V64 Layout:
 *
#if RV_STAGE1_MODE =3D=3D SATP_MODE_SV39
 *
 * From the riscv-privileged doc:
 *   When mapping between narrower and wider addresses,
 *   RISC-V zero-extends a narrower physical address to a wider size.
 *   The mapping between 64-bit virtual addresses and the 39-bit usable
 *   address space of Sv39 is not based on zero-extension but instead
 *   follows an entrenched convention that allows an OS to use one or
 *   a few of the most-significant bits of a full-size (64-bit) virtual
 *   address to quickly distinguish user and supervisor address
regions.
 *
 * It means that:
 *   top VA bits are simply ignored for the purpose of translating to
PA.
#endif
 *
 *       SATP_MODE_SV32   SATP_MODE_SV39   SATP_MODE_SV48 =20
SATP_MODE_SV57
 *     ----------------------------------------------------------------
-----------
 * BA0 | FFFFFFFFFFE00000 | FFFFFFFFC0000000 | FFFFFF8000000000 |
FFFF000000000000
 * BA1 | 0000000019000000 | 0000003200000000 | 0000640000000000 |
00C8000000000000
 * BA2 | 0000000018800000 | 0000003100000000 | 0000620000000000 |
00C4000000000000
 * BA3 | 0000000018400000 | 0000003080000000 | 0000610000000000 |
00C2000000000000
 *=20
 *
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=3D=3D=3D=3D=3D
 * Start addr    |   End addr           |  Size  | Slot       |area
description
 *
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=3D=3D=3D=3D=3D
 * BA0 + 0x800000 |  FFFFFFFFFFFFFFFF   |1016 MB |
L${HYP_PT_ROOT_LEVEL} 511     | Unused
 * BA0 + 0x400000 |  BA0 + 0x800000     |  2 MB  |
L${HYP_PT_ROOT_LEVEL} 511     | Fixmap
 * BA0 + 0x200000 |  BA0 + 0x400000     |  4 MB  |
L${HYP_PT_ROOT_LEVEL} 511     | FDT
 * BA0            |  BA0 + 0x200000     |  2 MB  |
L${HYP_PT_ROOT_LEVEL} 511     | Xen
 *                 ...                  |  1 GB  |
L${HYP_PT_ROOT_LEVEL} 510     | Unused
 * BA1 + 0x000000 |  BA1 + 0x4D80000000 | 309 GB |
L${HYP_PT_ROOT_LEVEL} 200-509 | Direct map
 *                 ...                  |  1 GB  |
L${HYP_PT_ROOT_LEVEL} 199     | Unused
 * BA2 + 0x000000 |  BA2 + 0xC0000000   |  3 GB  |
L${HYP_PT_ROOT_LEVEL} 196-198 | Frametable
 *                 ...                  |  1 GB  |
L${HYP_PT_ROOT_LEVEL} 195     | Unused
 * BA3 + 0x000000 |  BA3 + 0x40000000   |  1 GB  |
L${HYP_PT_ROOT_LEVEL} 194     | VMAP
 *                 ...                  | 194 GB |
L${HYP_PT_ROOT_LEVEL} 0 - 193 | Unused
 *
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=3D=3D=3D=3D=3D
 */

Do you have better ideas?

Thanks in advamce.

~ Oleksii
>=20
>=20
> > Microchip has h/w which requires SATP_MODE_SV48 ( at least ), so I
> > have
> > a patch which introduces SATP_MODE_SV48 and I planned to update the
> > layout table in this patch.
>=20
>=20
>=20


