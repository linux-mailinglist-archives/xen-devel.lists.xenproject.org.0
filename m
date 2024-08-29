Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E409643D5
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 14:04:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785748.1195246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjdso-00037t-2y; Thu, 29 Aug 2024 12:04:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785748.1195246; Thu, 29 Aug 2024 12:04:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjdsn-00034p-Vz; Thu, 29 Aug 2024 12:04:09 +0000
Received: by outflank-mailman (input) for mailman id 785748;
 Thu, 29 Aug 2024 12:04:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LPGY=P4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sjdsm-00034d-Di
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 12:04:08 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cac25687-65fe-11ef-a0b0-8be0dac302b0;
 Thu, 29 Aug 2024 14:04:07 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5334adf7249so779623e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Aug 2024 05:04:07 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53540859301sm137470e87.295.2024.08.29.05.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 05:04:04 -0700 (PDT)
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
X-Inumbo-ID: cac25687-65fe-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724933046; x=1725537846; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9dzAV2EJGw6yfaq5GwniSakhzOsM6M2GQswLIFbJNZk=;
        b=nbIjAw1TT/d+esrNLiCg28II7M6ELzL8vzcvCxVov17SH6hAMPw9EEqwcH8WT7ARV3
         aZr3hcxIynB6ZAlCypByu9GBr+xysXpFnPX2lOo7Hb9kauTc0xxkt8F3kS8KU9x8CtV6
         DmNaK/ZqcxeWiMfKHiONAl/6UusLf2p22LgFg7AqOt7TFMkFleYGVeW3jFBh33bVqdTC
         eXrsPUJjczKBd/UPeYQiRWJbulPh+hVq/xoNeF2RrmxyuwYAy1YqNWmGqc2paLLQfueK
         VTxRn6g22gnec6jS8p5gCVKCNTjGNTI1At1p1JSAuzajrdmYBebTuBmwSuAFILmsCp+O
         AZ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724933046; x=1725537846;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9dzAV2EJGw6yfaq5GwniSakhzOsM6M2GQswLIFbJNZk=;
        b=Ph3/S8UbUuKHOXe692Uy/0BxlDWUQxXcNrFeSEz+zxgdaqtV2HvUYZXLCNIYTc7P6U
         8316OkR5BwXt3ISwXqmAh5qbhvz6WSrA3gT1HrL4qk8KXfTimeQE5E0V2qwm/CF+csdn
         /DbtNICoZS4JkunmvbNMgfICofmbgYtJFJCrgHMlgkYOts/gJHCIUjZ7JsxDjwB1Lhsy
         yiTjmuUy5iPLN1dMEanYb0pjfXnsrNoHpaz22Jl20mTDs+f/jQGjhLH2ZYdHG8rkX+c0
         3UkqwLhg4crs9uym1mWzRpGL+S/u3yC3B1a/d/Gy97fI+TaXq6qS8K0ICRnbw2JimBA2
         gcjg==
X-Forwarded-Encrypted: i=1; AJvYcCWsWO7b0nFQonhh+i5AQkKIl/9GsnMLvUks/zc3r4B5TnPEDHN4Xqrwt/1sOhrJ/ypqv+X7iTCuOyY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx3oGP6Zg5p/EvWucxc5MyoRNzn8SmTjvm3PcXvvHjx+ZE9YYLN
	IsHoB8aE9MnBpWGFzrhyClzt8jTEQJI7Xahi7B3sNAuR8DblaCPn
X-Google-Smtp-Source: AGHT+IGMomFrlJlke6KxgOwNI1EQFsPuU1rHPdCNGUC9hGeNkv5Ph1YS+0/kQy0OBg2hQlgATo8RYw==
X-Received: by 2002:a05:6512:1105:b0:52e:8141:1b27 with SMTP id 2adb3069b0e04-5353e5aae52mr1844077e87.43.1724933045668;
        Thu, 29 Aug 2024 05:04:05 -0700 (PDT)
Message-ID: <4418002b93a3ae101e15e390dc537c726948bcb4.camel@gmail.com>
Subject: Re: [PATCH v5 6/7] xen/riscv: page table handling
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Thu, 29 Aug 2024 14:04:04 +0200
In-Reply-To: <b83e7d23-2171-447f-a4e5-48563e4068a5@suse.com>
References: <cover.1724256026.git.oleksii.kurochko@gmail.com>
	 <090e617d88b279ae88f1a7859875a7e1a0c6ae73.1724256027.git.oleksii.kurochko@gmail.com>
	 <c0005454-3b34-427d-8ea0-620aba632487@suse.com>
	 <ed84c53454cb63082aa96befe89a89d8f234ef71.camel@gmail.com>
	 <b83e7d23-2171-447f-a4e5-48563e4068a5@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Thu, 2024-08-29 at 09:01 +0200, Jan Beulich wrote:
> On 28.08.2024 18:11, oleksii.kurochko@gmail.com=C2=A0wrote:
> > On Tue, 2024-08-27 at 17:00 +0200, Jan Beulich wrote:
> > > On 21.08.2024 18:06, Oleksii Kurochko wrote:
> > > > Implement map_pages_to_xen() which requires several
> > > > functions to manage page tables and entries:
> > > > - pt_update()
> > > > - pt_mapping_level()
> > > > - pt_update_entry()
> > > > - pt_next_level()
> > > > - pt_check_entry()
> > > >=20
> > > > To support these operations, add functions for creating,
> > > > mapping, and unmapping Xen tables:
> > > > - create_table()
> > > > - map_table()
> > > > - unmap_table()
> > > >=20
> > > > Introduce internal macros starting with PTE_* for convenience.
> > > > These macros closely resemble PTE bits, with the exception of
> > > > PTE_SMALL, which indicates that 4KB is needed.
> > >=20
> > > What macros are you talking about here? Is this partially stale,
> > > as
> > > only PTE_SMALL and PTE_POPULATE (and a couple of masks) are being
> > > added?
> > I am speaking about macros connected to masks:
> > =C2=A0=C2=A0=C2=A0=C2=A0 #define PTE_R_MASK(x)=C2=A0=C2=A0 ((x) & PTE_R=
EADABLE)
> > =C2=A0=C2=A0=C2=A0=C2=A0 #define PTE_W_MASK(x)=C2=A0=C2=A0 ((x) & PTE_W=
RITABLE)
> > =C2=A0=C2=A0=C2=A0=C2=A0 #define PTE_X_MASK(x)=C2=A0=C2=A0 ((x) & PTE_E=
XECUTABLE)
> > =C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 #define PTE_RWX_MASK(x) ((x) & (PTE_READABLE |=
 PTE_WRITABLE |
> > =C2=A0=C2=A0 PTE_EXECUTABLE))
>=20
> Some of which is did question further down in my reply. But what's
> worse - by saying "closely resemble PTE bits, with the exception of
> PTE_SMALL" you pretty clearly _do not_ refer to the macros above, but
> to PTE_VALID etc.
Agree, it should be corrected.

>=20
> > > > @@ -68,6 +111,20 @@ static inline bool pte_is_valid(pte_t p)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 return p.pte & PTE_VALID;
> > > > =C2=A0}
> > > > =C2=A0
> > > > +inline bool pte_is_table(const pte_t p)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 return ((p.pte & (PTE_VALID |
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PTE_READABLE |
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PTE_WRITABLE |
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PTE_EXECUTABLE=
)) =3D=3D PTE_VALID);
> > > > +}
> > >=20
> > > In how far is the READABLE check valid here? You (imo correctly)
> > > ...
>=20
> Oh, I wrongly picked on READABLE when it should have been the
> WRITABLE
> bit.
>=20
> > > > +static inline bool pte_is_mapping(const pte_t p)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 return (p.pte & PTE_VALID) &&
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (p.pt=
e & (PTE_WRITABLE | PTE_EXECUTABLE));
> > > > +}
> > >=20
> > > ... don't consider this bit here.
> > pte_is_mapping() seems to me is correct as according to the RISC-V
> > privileged spec:
> > =C2=A0=C2=A0 4. Otherwise, the PTE is valid. If pte.r =3D 1 or pte.x =
=3D 1, go to
> > step=20
> > =C2=A0=C2=A0 5. Otherwise, this PTE is a pointer to the next level of t=
he
> > page=C2=A0=C2=A0=20
> > =C2=A0=C2=A0 table.
> > =C2=A0=C2=A0 5. A leaf PTE has been found. ...
>=20
> Right. And then why do you check all three of r, x, and w, when the
> doc
> mentions only r and x? There may be reasons, but such reasons then
> need
> clearly stating in a code comment, for people to understand why the
> code
> is not following the spec.
So I remembered why R, W, and X are checked. There is contradictory
information about these bits
(https://github.com/riscv/riscv-isa-manual/blob/main/src/supervisor.adoc?pl=
ain=3D1#L1317C64-L1321C10
):
```
The permission bits, R, W, and X, indicate whether the page is
readable, writable, and executable, respectively. When all three are
zero, the PTE is a pointer to the next level of the page table;
otherwise, it is a leaf PTE.
```

However, it is also written here
(https://github.com/riscv/riscv-isa-manual/blob/main/src/supervisor.adoc?pl=
ain=3D1#L1539
) that only pte.r and pte.x should be checked.

I can assume that the interpretation that R=3DW=3DX=3D0 indicates a pointer
to the next level of the page table could come from this statement
(https://github.com/riscv/riscv-isa-manual/blob/main/src/supervisor.adoc?pl=
ain=3D1#L1538
):
```
If _pte_._v_ =3D 0, or if _pte_._r_ =3D 0 and _pte_._w_ =3D 1, or if any bi=
ts
or encodings that are reserved for future standard use are set within
_pte_, stop and raise a page-fault exception corresponding to the
original access type.
```
From this, I can assume that when pte.r =3D 0, pte.w should also always
be zero; otherwise, a page-fault exception will be raised. ( but it is
no obviously connected to if the PTE is a pointer to the next page
table or not... ).




>=20
> > and regarding pte_is_table() READABLE check is valid as we have to
> > check only that pte.r =3D pte.x =3D 0. WRITABLE check should be
> > dropped. Or
> > just use define pte_is_table() as:
> > =C2=A0=C2=A0 inline bool pte_is_table(const pte_t p)
> > =C2=A0=C2=A0 {
> > =C2=A0=C2=A0=C2=A0	return !pte_is_mapping(p);
> > =C2=A0=C2=A0 }
>=20
> You had it like this earlier on, didn't you? That's wrong, because
> for a
> PTE to describe another page table level PTE_VALID needs to be set.
Agree, it's wrong, missed that.

> > > > +#define XEN_TABLE_MAP_FAILED 0
> > > > +#define XEN_TABLE_SUPER_PAGE 1
> > > > +#define XEN_TABLE_NORMAL 2
> > > > +
> > > > +/*
> > > > + * Take the currently mapped table, find the corresponding
> > > > entry,
> > > > + * and map the next table, if available.
> > > > + *
> > > > + * The alloc_tbl parameters indicates whether intermediate
> > > > tables
> > > > should
> > > > + * be allocated when not present.
> > > > + *
> > > > + * Return values:
> > > > + *=C2=A0 XEN_TABLE_MAP_FAILED: Either alloc_only was set and the
> > > > entry
> > > > + *=C2=A0 was empty, or allocating a new page failed.
> > > > + *=C2=A0 XEN_TABLE_NORMAL: next level or leaf mapped normally
> > > > + *=C2=A0 XEN_TABLE_SUPER_PAGE: The next entry points to a
> > > > superpage.
> > > > + */
> > > > +static int pt_next_level(bool alloc_tbl, pte_t **table,
> > > > unsigned
> > > > int offset)
> > >=20
> > > Having the boolean first is unusual, but well - it's your choice.
> > >=20
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 pte_t *entry;
> > > > +=C2=A0=C2=A0=C2=A0 int ret;
> > > > +=C2=A0=C2=A0=C2=A0 mfn_t mfn;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 entry =3D *table + offset;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 if ( !pte_is_valid(*entry) )
> > > > +=C2=A0=C2=A0=C2=A0 {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( alloc_tbl )
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 return XEN_TABLE_MAP_FAILED;
> > >=20
> > > Is this condition meant to be inverted?
> > if alloc_tbl =3D true we shouldn't allocatetable as:
> > =C2=A0=C2=A0=C2=A0=C2=A0 * The intermediate page table shouldn't be all=
ocated when MFN
> > isn't
> > =C2=A0=C2=A0=C2=A0=C2=A0 * valid and we are not populating page table.
> > ...
> > =C2=A0=C2=A0=C2=A0 */
>=20
> Well, no. The variable name really shouldn't be the opposite of what
> is
> meant. "alloc_tbl" can only possibly mean "allocate a table if none
> is
> there". I can't think of a sensible interpretation in the inverted
> sense.
> I'm curious how you mean to interpret that variable name.
My interpretation was that alloc_tbl =3D true means that algorithm is
trying to allocate the table what is forbidden at the moment but I
agree that your interpretation sounds more understandable based on the
variable name.

>=20
> > =C2=A0=C2=A0=C2=A0 bool alloc_tbl =3D mfn_eq(mfn, INVALID_MFN) && !(fla=
gs &
> > PTE_POPULATE);
> >=20
> > So if mfn =3D INVALID_MFN and flags.PTE_POPULATE=3D0 it means that this
> > table shouldn't be allocated and thereby pt_next_level() should
> > return
> > XEN_TABLE_MAP_FAILED.
> >=20
> > Or to invert if ( alloc_tbl )it will be needed to invert defintion
> > of
> > alloc_tbl:
> > =C2=A0bool alloc_tbl =3D !mfn_eq(mfn, INVALID_MFN) || (flags &
> > PTE_POPULATE);
>=20
> Yes, as I did comment further down.
>=20
> > > > +=C2=A0=C2=A0=C2=A0 if ( level !=3D target )
> > > > +=C2=A0=C2=A0=C2=A0 {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk("%s: Shattering =
superpage is not supported\n",
> > > > __func__);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =3D -EOPNOTSUPP;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;
> > > > +=C2=A0=C2=A0=C2=A0 }
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 entry =3D table + offsets[level];
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 rc =3D -EINVAL;
> > > > +=C2=A0=C2=A0=C2=A0 if ( !pt_check_entry(*entry, mfn, flags) )
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 /* We are removing the page */
> > > > +=C2=A0=C2=A0=C2=A0 if ( !(flags & PTE_VALID) )
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memset(&pte, 0x00, size=
of(pte));
> > > > +=C2=A0=C2=A0=C2=A0 else
> > > > +=C2=A0=C2=A0=C2=A0 {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* We are inserting a m=
apping =3D> Create new pte. */
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !mfn_eq(mfn, INVAL=
ID_MFN) )
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 pte =3D pte_from_mfn(mfn, PTE_VALID);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else /* We are updating=
 the permission =3D> Copy the
> > > > current
> > > > pte. */
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 pte =3D *entry;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* update permission ac=
cording to the flags */
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte.pte |=3D PTE_RWX_MA=
SK(flags) | PTE_ACCESSED |
> > > > PTE_DIRTY;
> > >=20
> > > When updating an entry, don't you also need to clear (some of)
> > > the
> > > flags?
> > I am not sure why some flags should be cleared. Here we are taking
> > only
> > necessary for pte flags such as R, W, X or other bits in flags are
> > ignored.
>=20
> Consider what happens to a PTE with R and X set when a request comes
> in
> to change to R/W. You'll end up with R, X, and W all set if you don't
> first clear the bits that are meant to be changeable in a "modify"
> operation.
That's definitely going to be a problem. I'll update the code then.

>=20
> > > > +/* Return the level where mapping should be done */
> > > > +static int pt_mapping_level(unsigned long vfn, mfn_t mfn,
> > > > unsigned
> > > > long nr,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 unsigned int flags)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 unsigned int level =3D 0;
> > > > +=C2=A0=C2=A0=C2=A0 unsigned long mask;
> > > > +=C2=A0=C2=A0=C2=A0 unsigned int i;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 /* Use blocking mapping unless the caller reque=
sts 4K
> > > > mapping
> > > > */
> > > > +=C2=A0=C2=A0=C2=A0 if ( unlikely(flags & PTE_SMALL) )
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return level;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 /*
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * Don't take into account the MFN when re=
moving mapping
> > > > (i.e
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * MFN_INVALID) to calculate the correct t=
arget order.
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 *
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * `vfn` and `mfn` must be both superpage =
aligned.
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * They are or-ed together and then checke=
d against the
> > > > size
> > > > of
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * each level.
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 *
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * `left` is not included and checked sepa=
rately to allow
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * superpage mapping even if it is not pro=
perly aligned
> > > > (the
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * user may have asked to map 2MB + 4k).
> > >=20
> > > What is this about? There's nothing named "left" here.
> > It refer to "remaining" pages or "leftover" space after trying to
> > align
> > a mapping to a superpage boundary.
>=20
> What what is the quoted "left" here? Such a variable appears to exist
> in
> the caller, but using the name here is lacking context.
Then I will update the comment and tell from where 'left' is coming.

>=20
>=20
> > > > + * If `mfn` is valid and flags has PTE_VALID bit set then it
> > > > means
> > > > that
> > > > + * inserting will be done.
> > > > + */
> > >=20
> > > What about mfn !=3D INVALID_MFN and PTE_VALID clear?
> > PTE_VALID=3D0 will be always considered as destroying and no matter
> > what
> > is mfn value as in this case the removing is done in the way where
> > mfn
> > isn't used:
>=20
> Right, yet elsewhere you're restrictive as to MFN values valid to
> use.
> Not requiring INVALID_MFN here looks inconsistent to me.
but actually if we will leave ASSERT in pt_check_entry() we will be
sure that we are here with mfn =3D INVALID_MFN:
       /* Sanity check when removing a mapping. */
       else if ( (flags & (PTE_VALID | PTE_POPULATE)) =3D=3D 0 )
       {
           /* We should be here with an invalid MFN. */
           ASSERT(mfn_eq(mfn, INVALID_MFN));
>=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memset(&pte, 0x00, sizeof(pt=
e));
>=20
> Just to mention it: I don't think memset() is a very good way of
> clearing
> a PTE, even if right here it's not a live one.
Just direct assigning would be better?=20

>=20
> > > =C2=A0Also note that "`mfn` is
> > > valid" isn't the same as "mfn !=3D INVALID_MFN". You want to be
> > > precise
> > > here,
> > > to avoid confusion later on. (I say that knowing that we're still
> > > fighting
> > > especially shadow paging code on x86 not having those properly
> > > separated.)
> > If it is needed to be precise and mfn is valid isn't the same as
> > "mfn
> > !=3D INVALID_MFN" only for the case of shadow paging?
>=20
> No, I used shadow paging only as an example of where we have similar
> issues. I'd like to avoid that a new port starts out with introducing
> more instances of that. You want to properly separate INVALID_MFN
> from
> "invalid MFN", where the latter means any MFN where either nothing
> exists at all, or (see mfn_valid()) where no struct page_info exists.
Well, now I think I understand the difference between "INVALID_MFN" and
"invalid MFN."

Referring back to your original reply, I need to update the comment
above pt_update():
```
   ...
     * If `mfn` is valid ( exist ) and flags has PTE_VALID bit set then it
   means that inserting will be done.
```
Would this be correct and more precise?

Based on the code for mfn_valid(), the separation is currently done
using the max_page value, which can't be initialized at the moment as
it requires reading the device tree file to obtain the RAM end.

We could use a placeholder for the RAM end (for example, a very high
value like -1UL) and then add __mfn_valid() within pt_update().
However, I'm not sure if this approach aligns with what you consider by
proper separation between INVALID_MFN and "invalid MFN."

~ Oleksii

