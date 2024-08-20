Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 237D59589DF
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 16:43:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780623.1190284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgQ3v-0002iZ-QH; Tue, 20 Aug 2024 14:42:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780623.1190284; Tue, 20 Aug 2024 14:42:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgQ3v-0002gv-NJ; Tue, 20 Aug 2024 14:42:19 +0000
Received: by outflank-mailman (input) for mailman id 780623;
 Tue, 20 Aug 2024 14:42:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z0MZ=PT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sgQ3t-0002gn-HX
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 14:42:17 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64711be6-5f02-11ef-8776-851b0ebba9a2;
 Tue, 20 Aug 2024 16:42:15 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a8657900fc1so65147966b.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Aug 2024 07:42:15 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83838c66e2sm768425466b.3.2024.08.20.07.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 07:42:13 -0700 (PDT)
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
X-Inumbo-ID: 64711be6-5f02-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724164935; x=1724769735; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=x+17sG+zrKvEx+m7iwaQzvbqn1AqzdTNJJMIWpFHezg=;
        b=JmiCHMmPrNplrLWkwT2Idw/3NV14Ttr3aWcWnNi84bziuvMJLWKf482wPLtOSObSBs
         KK8lYJF2LU6l+bcQkbLXjl5+VMnm1Er7Cz+VeAgM1dFm4+EAqkgaaLpXRw2nVXYJEZ84
         LYb6VGDxE5CniMdls67d1LU2Iq8+x+IQVJ6JeX6ls9fmMJqGOQEoTC1mkYDMBOYkVNEP
         FlFq0PXp3rfxbLhaRQXNKThwFIAZzwWkjXsJhCUy/eQD/e19WPiRXrIAAcvuOxlRiJAm
         Mw03z17CwmlBUlgBm/kDRRDt8oRVLjYjJhC1f9A1AJkRwgBQe6LvJDPj+rc/3/uhY61q
         piRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724164935; x=1724769735;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x+17sG+zrKvEx+m7iwaQzvbqn1AqzdTNJJMIWpFHezg=;
        b=mP83AsR/2EoR1XBY8XdqK4fZqGkeIzF+t2InO5JrzO3Z29rjoyoK3mMHOXswdOGf/d
         YgHRuT1NU07N2UJYKwCVd9nOBfTfOyT+mr2nr2J4l4WXgFENa5EOi3GdRWA5z7efdSOs
         g5Tkusq2c6BBBccaDvFQKnzwx3SRZrlMzgo3uvwXhbm/sUB2XvoQzrX3mBaAR7VgVSLi
         WSocTTPVYuRlvgbMs6DCxlwgl9QwEG8Bx2hteQhnYkyVeIPhLlTmu3FcykbOgn5zc9mN
         8zXuj37j3u+xXCfzYyZgXFYqaW20SsMW3rBcq2D2XiLuDvw6lp1IH58Z4RdBFA16/GYn
         A46A==
X-Forwarded-Encrypted: i=1; AJvYcCU2NqqMMYsJ0CS//3Gr8Qrp5sb+9d5TT/z/cQRXgIb4mhiPDT3zjMKSCxNaUGFHdZ28nK50ZownFHs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzGIIkk4FU9sKU4G09nENy97RfCpZW7bxjwB0Xdc8BWS6KZC/zR
	83mdT/wpca7cmYKTEdFLh1uJCpe4xGpVBzp3ndRyNqCGkx+yR3cXWibVQg==
X-Google-Smtp-Source: AGHT+IFO8MsCnemIz+hjjhiUKpwx3kYx+ruEd1nk21ZbA4ym+z/YeMns9GVMzLZkKHXYGxXf6O5lWg==
X-Received: by 2002:a17:907:2d88:b0:a7a:c083:8579 with SMTP id a640c23a62f3a-a8392a4b2e0mr1054862366b.62.1724164934270;
        Tue, 20 Aug 2024 07:42:14 -0700 (PDT)
Message-ID: <bd4226d7002d912fb8f20db673b45c034352f200.camel@gmail.com>
Subject: Re: [PATCH v4 6/7] xen/riscv: page table handling
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Tue, 20 Aug 2024 16:42:12 +0200
In-Reply-To: <4a7f44ce-e5ba-4a36-9b0b-7cd7c14cc846@suse.com>
References: <cover.1723214540.git.oleksii.kurochko@gmail.com>
	 <8362795280a48702bef6f01d41d148edcf299935.1723214540.git.oleksii.kurochko@gmail.com>
	 <85a4e760-07af-42bd-ac27-12a4fa5172cc@suse.com>
	 <1551cd4dd3b5fcf6aea59a972b60fa6b3b06bed6.camel@gmail.com>
	 <4a7f44ce-e5ba-4a36-9b0b-7cd7c14cc846@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-08-20 at 15:47 +0200, Jan Beulich wrote:
> On 20.08.2024 15:18, oleksii.kurochko@gmail.com=C2=A0wrote:
> > On Tue, 2024-08-13 at 12:31 +0200, Jan Beulich wrote:
> > > > + * Sanity check of the entry
> > > > + * mfn is not valid and we are not populating page table. This
> > > > means
> > >=20
> > > How does this fit with ...
> > >=20
> > > > + * we either modify entry or remove an entry.
> > > > + */
> > > > +static bool pt_check_entry(pte_t entry, mfn_t mfn, unsigned
> > > > int
> > > > flags)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 /* Sanity check when modifying an entry. */
> > > > +=C2=A0=C2=A0=C2=A0 if ( (flags & PTE_VALID) && mfn_eq(mfn, INVALID=
_MFN) )
> > >=20
> > > ... the MFN check here? And why is (valid,INVALID_MFN) an
> > > indication
> > > of a modification?
> > Because as mentioned here:
> > ```
> > /*
> > =C2=A0* If `mfn` equals `INVALID_MFN`, it indicates that the following
> > page
> > table
> > =C2=A0* update operation might be related to either populating the
> > table,
> > =C2=A0* destroying a mapping, or modifying an existing mapping.
> > =C2=A0*/
> > static int pt_update(unsigned long virt,
> > ```
>=20
> That's in the description of another function. How would one know
> that
> the rules on (mfn,flags) tuples there would apply here as well,
> without
> you saying so explicitly? It may not be necessary to repeat the other
> comment, but at least you want to reference it.
>=20
> > And so if requested flags are PTE_VALID ( present ) and mfn=3DINVALID
> > it
> > will mean that we are going to modify an entry.
> >=20
> >=20
> > > But then ...
> > >=20
> > > > +=C2=A0=C2=A0=C2=A0 {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* We don't allow modif=
ying an invalid entry. */
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !pte_is_valid(entr=
y) )
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 printk("Modifying invalid entry is not
> > > > allowed.\n");
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 return false;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > >=20
> > > ... I also don't understand what this is about. IOW I'm afraid
> > > I'm
> > > still confused about the purpose of this function as well as the
> > > transitions you want to permit / reject.=C2=A0
> > In the case if the caller call modify_xen_mappings() on a region
> > that
> > doesn't exist.
>=20
> Perhaps. What I think is missing is a clear statement somewhere to
> describe
> what the various combinations of (mfn,flags) mean, in terms of the
> operation
> to be carried out. This may then also help with ...
>=20
> > > I wonder whether the
> > > flags & PTE_VALID and pte_is_valid(entry) aren't in need of
> > > swapping.
> > I am not sure that I understand what you mean.
>=20
> ... this: It's hard to see what cannot be understood about my earlier
> comment. In the code commented on you have a flags & PTE_VALID check
> and a
> pte_is_valid(entry) one. I'm wondering whether the two simply are the
> wrong
> way round.
Sure. I'll add additional comments and reference in the next patch
version to clarify that moment.

>=20
> > > > +/* Update an entry at the level @target. */
> > > > +static int pt_update_entry(mfn_t root, unsigned long virt,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 mfn_t mfn, unsigned int target,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 unsigned int flags)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 int rc;
> > > > +=C2=A0=C2=A0=C2=A0 unsigned int level =3D HYP_PT_ROOT_LEVEL;
> > > > +=C2=A0=C2=A0=C2=A0 pte_t *table;
> > > > +=C2=A0=C2=A0=C2=A0 /*
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * The intermediate page tables are read-o=
nly when the MFN
> > > > is
> > > > not valid
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * and we are not populating page table.
> > >=20
> > > The way flags are handled in PTEs, how can page tables be read-
> > > only?
> > This is not needed for everyone case. In case of entry removing an
> > intermediate page table should be created in case when the user is
> > trying to remove a mapping that doesn't exist.
>=20
> I don't follow: For one, how is this related to "read-only"-ness? And
> then, why would any kind of removal, whether of a present or non-
> present mapping, ever result in page tables being created?
If the mapping doesn't exist and it was requested ( accidentally by the
caller ) then then the logic of PT update will try to allocate the page
table what is actually a bogus behaviour... I have to double-check
that.

>=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * This means we either modify permissions=
 or remove an
> > > > entry.
> > >=20
> > > From all I can determine we also get here when making brand new
> > > entries.
> > > What am I overlooking?
> > Yes, but in this case an intermediate page tables should be
> > read_only,
> > so alloc_only will be true and it will be allowed to create new
> > intermediate page table.
>=20
> Hmm, so instead of "read-only" do you maybe mean page tables are not
> supposed to be modified? There's a difference here: When they're
> read-only, you can't write to them (or a fault will result). Whereas
> when in principle they can be modified, there still may be a rule
> saying "in this case they shouldn't be altered".

There is such rule which checks that page tables aren't supposed to be
modified ( so that is why they are read-only ):
```
    /* Sanity check when modifying an entry. */
    if ( (flags & PTE_VALID) && mfn_eq(mfn, INVALID_MFN) )
    {
	...

        /* We don't allow modifying a table entry */
        if ( pte_is_table(entry) )
        {
            printk("Modifying a table entry is not allowed.\n");
            return false;
        }
```

~ Oleksii

