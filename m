Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E35A598616E
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 16:51:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804039.1214912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTLv-00074M-OG; Wed, 25 Sep 2024 14:50:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804039.1214912; Wed, 25 Sep 2024 14:50:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTLv-00072X-KV; Wed, 25 Sep 2024 14:50:51 +0000
Received: by outflank-mailman (input) for mailman id 804039;
 Wed, 25 Sep 2024 14:50:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mw3j=QX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1stTLu-00072R-15
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 14:50:50 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8cf2d881-7b4d-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 16:50:48 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5356ab89665so8233108e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 07:50:48 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf4d797dsm1920696a12.89.2024.09.25.07.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 07:50:46 -0700 (PDT)
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
X-Inumbo-ID: 8cf2d881-7b4d-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727275847; x=1727880647; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/IWyYeD5OFjr85hiL+zR1Ee4642Vj56aNmKFYlzWxqY=;
        b=Xv5frxgXvT+lEn2mEg/7CMqTDAxsXfxIMn3qAd4KFS72+EAYbbW4eJSCH+SkKM8zBF
         ii4xPvhS8kYN5gOysNzhO2nlbFz1tHhtDCuzD+LHlEyhQN5QYNHEj+KcGOZewkk99tBR
         M25n6oaa720ovJSJPTI1nFHijB28Xu6Sm59fYwGF731lra4zPaDUk++moMmeN+qr3TX9
         8MW25p4mV2Qwm/gXm7r45Ug6MjU1ZNAfxVe/3jBCOP5/WOJvJn+qsm3UKnkTpm9uU7uf
         iDQTZaqqwsE+HbRR5VpX68Fre0U1znHxIsiPU/7jktGJEDXG6jvyg5+I0bkm5FvftPdR
         uP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727275847; x=1727880647;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/IWyYeD5OFjr85hiL+zR1Ee4642Vj56aNmKFYlzWxqY=;
        b=mQAvOzPNyduMaTUQP/v0mvbWsobK7RlNYOMd7pi/ZNf7CfpwJGyVP5n+PvVWTcD/Wv
         DABvaS9dcAOiyu86r/YQ1zMP4EMmeZ5MSEkZyyPwTji8kkLJZgPCa1oAoCwR4ZCmhYdF
         iYKsjWu6iIovmRRUmt2mbiRcaM/H/iS9K40wXCkwWLoDjl4oAscR2LpIs6dQ4d+UCF1r
         mde+/eLk6CwxFL2nJORH0Gsi0Vzs7Nu1KEJxzUDUzr/eMtRp89bL7CYdbHyHXqiRahem
         0jdqd/vZhIQR2lHEU38b6U3k0tOClzFAxZAywVPZdldkUiGmIuFU7q4mYU32Y/2M2AlJ
         WaEA==
X-Forwarded-Encrypted: i=1; AJvYcCV+UPyrW/iCMxU07BlvCITBZbdbIUDLu4SZMXqSF1Ck8AOyMNYHkZB0PN1LryCJIZRV8FCQ1KlySjA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxXc4dunGFu9Ka/U6gDvddDCMgEhDCJmRfCQ5NpxQyU9QHZ7C12
	tpwOLar4QTPvavc+9cyPoBrXUWKViX5sRKhgeOHO9wnY2e0XNxWJ
X-Google-Smtp-Source: AGHT+IHnYBwLfKptiEgCh6faz0EJbSG8nNBE/iG1RLk+5g3uhjQQn6RZFIFY8qCUGDdmkD3DPSId6Q==
X-Received: by 2002:a05:6512:110e:b0:52e:8141:1b27 with SMTP id 2adb3069b0e04-5387755b9afmr1918372e87.43.1727275847058;
        Wed, 25 Sep 2024 07:50:47 -0700 (PDT)
Message-ID: <cf994aa4f9dbef890f53cf8567519b840da8faf4.camel@gmail.com>
Subject: Re: [PATCH v7 7/8] xen/riscv: page table handling
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Wed, 25 Sep 2024 16:50:45 +0200
In-Reply-To: <03b67663-1a55-4642-b997-8680961aadeb@suse.com>
References: <cover.1726242605.git.oleksii.kurochko@gmail.com>
	 <582c4cee40222e80faf1e465c011b07eeaf2c19f.1726242605.git.oleksii.kurochko@gmail.com>
	 <6100a4e0-5bf3-4555-90ae-20624171ff79@suse.com>
	 <fc23fbd82c1495e75fc0bdcfa894cdb56262b11b.camel@gmail.com>
	 <9371e8fd-a1de-40df-8994-814dd6196953@suse.com>
	 <ecab08fbbe1a1e364cf6d4bf9dafa42ced4faef4.camel@gmail.com>
	 <03b67663-1a55-4642-b997-8680961aadeb@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Wed, 2024-09-25 at 16:22 +0200, Jan Beulich wrote:
> On 25.09.2024 12:07, oleksii.kurochko@gmail.com=C2=A0wrote:
> > On Tue, 2024-09-24 at 15:31 +0200, Jan Beulich wrote:
> > > On 24.09.2024 13:30, oleksii.kurochko@gmail.com=C2=A0wrote:
> > > > On Tue, 2024-09-24 at 12:49 +0200, Jan Beulich wrote:
> > > > > On 13.09.2024 17:57, Oleksii Kurochko wrote:
> > > > > > +static int pt_next_level(bool alloc_tbl, pte_t **table,
> > > > > > unsigned
> > > > > > int offset)
> > > > > > +{
> > > > > > +=C2=A0=C2=A0=C2=A0 pte_t *entry;
> > > > > > +=C2=A0=C2=A0=C2=A0 mfn_t mfn;
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0 entry =3D *table + offset;
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0 if ( !pte_is_valid(*entry) )
> > > > > > +=C2=A0=C2=A0=C2=A0 {
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !alloc_tbl )
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 return XEN_TABLE_MAP_FAILED;
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( create_table(e=
ntry) )
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 return XEN_TABLE_MAP_FAILED;
> > > > >=20
> > > > > You're still losing the -ENOMEM here.
> > > > Agree, I will save the return value of create_table and return
> > > > it.
> > >=20
> > > That won't work very well, will it?=C2=A0
> > I think it will work, just will be needed another one check in
> > pt_update_entry() where pt_next_level() is called:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( (rc =3D=3D XEN_TABLE_MA=
P_FAILED) || (rc =3D=3D -ENOMEM) )
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...
>=20
> Yet that's precisely why I said "won't work very well": You're now
> having
> rc in two entirely distinct number spaces (XEN_TABLE_MAP_* and -E*).
> That's imo just calling for trouble down the road. Unless you
> emphasized
> this aspect pretty well in a comment.
>=20
> > > Imo you need a new XEN_TABLE_MAP_NOMEM.
> > > (And then XEN_TABLE_MAP_FAILED may want renaming to e.g.
> > > XEN_TABLE_MAP_NONE).
> > I am still curious if we really need this separation. If to in this
> > way
> > then it should be updated the check in pt_update_entry():
> > =C2=A0=C2=A0 --- a/xen/arch/riscv/pt.c
> > =C2=A0=C2=A0 +++ b/xen/arch/riscv/pt.c
> > =C2=A0=C2=A0 @@ -165,10 +165,10 @@ static int pt_next_level(bool alloc_=
tbl,
> > pte_t
> > =C2=A0=C2=A0 **table, unsigned int offset)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !pte_is_valid(*entry) )
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (=
 !alloc_tbl )
> > =C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return XEN_TABLE_MAP_FAILED;
> > =C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return XEN_TABLE_MAP_NONE;
> > =C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (=
 create_table(entry) )
> > =C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return XEN_TABLE_MAP_FAILED;
> > =C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return XEN_TABLE_MAP_NOMEM;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > =C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( pte_is_mapping(*entry) =
)
> > =C2=A0=C2=A0 @@ -209,7 +209,7 @@ static int pt_update_entry(mfn_t root,
> > unsigned
> > =C2=A0=C2=A0 long virt,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for ( ; level > target; leve=
l-- )
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =
=3D pt_next_level(alloc_tbl, &table, offsets[level]);
> > =C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( rc =3D=3D=
 XEN_TABLE_MAP_FAILED )
> > =C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( (rc =3D=
=3D XEN_TABLE_MAP_NONE) && (rc =3D=3D
> > XEN_TABLE_MAP_NOMEM)
> > =C2=A0=C2=A0 )
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 rc =3D 0;
> > But the handling of XEN_TABLE_MAP_NONE and XEN_TABLE_MAP_NOMEM
> > seems to
> > me should be left the same as this one part of the code actually
> > catching the case when create_table() returns -ENOMEM:
> > =C2=A0=C2=A0 pt_next_level()
> > =C2=A0=C2=A0 {
> > =C2=A0=C2=A0 ...
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 if ( flags & (PTE_VALID | PTE_POPULATE) )
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dprintk(XENLOG_ERR,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 "%s: Unable to map level %u\n",
> > __func__,
> > =C2=A0=C2=A0 level);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =3D -ENOMEM;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 }
>=20
> Except that you want to avoid "inventing" an error code when you were
> handed one. Just consider what happens to this code if another -E...
> could also come back from the helper.
I think we can drop the usage of -ENOMEM in the helper create_table()
by returning XEN_TABLE_MAP_FAILED in case of failure, with a
redefinition of XEN_TABLE_MAP_FAILED =3D 1, XEN_TABLE_SUPER_PAGE =3D 2, and
XEN_TABLE_NORMAL =3D 3, as value 0 is used to indicate that everything is
okay.

We can leave the pt_update() code as it is now:
...
            if ( flags & (PTE_VALID | PTE_POPULATE) )
            {
                dprintk(XENLOG_ERR,
                      "%s: Unable to map level %u\n", __func__, level);
                rc =3D -ENOMEM;
            }
...

Because for the end user, it's better to receive the error code from
xen/errno.h rather than a custom error code introduced nearby the
helper.

Does it make sense?

~ Oleksii




