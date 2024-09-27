Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 369FC98835F
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 13:33:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806238.1217578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su9D7-0005b5-L9; Fri, 27 Sep 2024 11:32:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806238.1217578; Fri, 27 Sep 2024 11:32:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su9D7-0005YK-HT; Fri, 27 Sep 2024 11:32:33 +0000
Received: by outflank-mailman (input) for mailman id 806238;
 Fri, 27 Sep 2024 11:32:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xL9K=QZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1su9D6-0005YE-17
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 11:32:32 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e89347c-7cc4-11ef-a0ba-8be0dac302b0;
 Fri, 27 Sep 2024 13:32:30 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a8d100e9ce0so201917266b.2
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2024 04:32:30 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2996631sm121736466b.200.2024.09.27.04.32.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 04:32:29 -0700 (PDT)
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
X-Inumbo-ID: 2e89347c-7cc4-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727436750; x=1728041550; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YKxF0gyloKagnb//J1dFFPC83qhvaOEQg9w8dI0G60w=;
        b=miKXDYQ/xrK9SYEyDCW3K8fDJCmUDedDw+ANa2MTn1ETZNKpaLDP3QOxrAKz9LFRiQ
         gZnJM08XWDDBPXkYo1yjgrq7+SS/lQCQ8fryLtVx1/n80lBHgD112o+VGatKmAxpLA7t
         eIfCBvsAK7hy3HMcRIGioDxf2tDB55mDOxX9AG3b8r9n8gXOvPkj5wWgY4OjPo2qyaTi
         diPyedJRL5aQyVNfu5KnqTPJrtQyr6gv15yfAd+4BlrftlhoiWsffiB/MZJQnk/Yf5US
         +wJGoGz32RaK8+GBOUdNGdTLr9alI08pKKLnGzRlxdzPNPYNy3q//2uOd6XkXT44qopt
         PCkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727436750; x=1728041550;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YKxF0gyloKagnb//J1dFFPC83qhvaOEQg9w8dI0G60w=;
        b=Gi/tRcOJZsSP1vgO2IskCBcCfF4YAKXToLCMeHBvRhbcdpXarIoRNCxPLl+lRyZfRQ
         aVvmoWk7RudCFKlkNBaiJThBqLBUzTvXiJf2FJLJMsHtvpCrPdWhu19jVRcLLKfvuHul
         wOoD6Jy/lt7QmIoLvx6GUi5u3B57JZPjrKemqUtUIZF2Z9QZcVY4uOegEXTZzGyLz7Np
         ZmSfbsk6HDXo2O38SsSy1XiRnQRCTIdNTP9VwNhUgADBH+eUbQCddrrD04ARjvdsRgq/
         6XdL6lu1QuVJW+t8UZjyuegGB3HAcMXUterC1bALW1/n1RKc1KGAQiVxWb8ggSiuhbTf
         q9hw==
X-Forwarded-Encrypted: i=1; AJvYcCWjxtbsqf6ri1PNntP3OtMklWwTCXpOkXKOigHWkpICg1zN6zrvLxh1XigAIUAKJ+2MAX2vs4OsBqQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwiK4tirPtnH5blbNiUqgNAQx3sh/y5YmZihBQu12PP+oW/kLvu
	m41jkYRM4M/3AUP9KwH5PMtakA47hzsVHXTKdwiCMl0Im/Nw0dxB
X-Google-Smtp-Source: AGHT+IEgz3+z1qqNGl/k+rBHGisfhFJyjR9vJX6Fjx+A+o3et0yvUlAUJhkgu1Rt4ZBUO0OhlzGvDQ==
X-Received: by 2002:a17:906:6a07:b0:a90:3517:6b1d with SMTP id a640c23a62f3a-a93c4acab49mr231743766b.48.1727436749924;
        Fri, 27 Sep 2024 04:32:29 -0700 (PDT)
Message-ID: <edc8bda6d7cf67b370652ea17b5d3ce462adf962.camel@gmail.com>
Subject: Re: [PATCH v7 7/8] xen/riscv: page table handling
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Fri, 27 Sep 2024 13:32:28 +0200
In-Reply-To: <c5b22604-5fa5-4034-8596-654be962ad84@suse.com>
References: <cover.1726242605.git.oleksii.kurochko@gmail.com>
	 <582c4cee40222e80faf1e465c011b07eeaf2c19f.1726242605.git.oleksii.kurochko@gmail.com>
	 <6100a4e0-5bf3-4555-90ae-20624171ff79@suse.com>
	 <fc23fbd82c1495e75fc0bdcfa894cdb56262b11b.camel@gmail.com>
	 <9371e8fd-a1de-40df-8994-814dd6196953@suse.com>
	 <ecab08fbbe1a1e364cf6d4bf9dafa42ced4faef4.camel@gmail.com>
	 <03b67663-1a55-4642-b997-8680961aadeb@suse.com>
	 <cf994aa4f9dbef890f53cf8567519b840da8faf4.camel@gmail.com>
	 <60dd2287-351c-4fd1-bf2d-00645342fc73@suse.com>
	 <dc14add3e5daa4db91955127812b84fb03209831.camel@gmail.com>
	 <c5b22604-5fa5-4034-8596-654be962ad84@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Fri, 2024-09-27 at 11:15 +0200, Jan Beulich wrote:
> On 27.09.2024 10:49, oleksii.kurochko@gmail.com=C2=A0wrote:
> > On Wed, 2024-09-25 at 16:58 +0200, Jan Beulich wrote:
> > > On 25.09.2024 16:50, oleksii.kurochko@gmail.com=C2=A0wrote:
> > > > On Wed, 2024-09-25 at 16:22 +0200, Jan Beulich wrote:
> > > > > On 25.09.2024 12:07, oleksii.kurochko@gmail.com=C2=A0wrote:
> > > > > > On Tue, 2024-09-24 at 15:31 +0200, Jan Beulich wrote:
> > > > > > > On 24.09.2024 13:30, oleksii.kurochko@gmail.com=C2=A0wrote:
> > > > > > > > On Tue, 2024-09-24 at 12:49 +0200, Jan Beulich wrote:
> > > > > > > > > On 13.09.2024 17:57, Oleksii Kurochko wrote:
> > > > > > > > > > +static int pt_next_level(bool alloc_tbl, pte_t
> > > > > > > > > > **table,
> > > > > > > > > > unsigned
> > > > > > > > > > int offset)
> > > > > > > > > > +{
> > > > > > > > > > +=C2=A0=C2=A0=C2=A0 pte_t *entry;
> > > > > > > > > > +=C2=A0=C2=A0=C2=A0 mfn_t mfn;
> > > > > > > > > > +
> > > > > > > > > > +=C2=A0=C2=A0=C2=A0 entry =3D *table + offset;
> > > > > > > > > > +
> > > > > > > > > > +=C2=A0=C2=A0=C2=A0 if ( !pte_is_valid(*entry) )
> > > > > > > > > > +=C2=A0=C2=A0=C2=A0 {
> > > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !alloc=
_tbl )
> > > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 return XEN_TABLE_MAP_FAILED;
> > > > > > > > > > +
> > > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( create=
_table(entry) )
> > > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 return XEN_TABLE_MAP_FAILED;
> > > > > > > > >=20
> > > > > > > > > You're still losing the -ENOMEM here.
> > > > > > > > Agree, I will save the return value of create_table and
> > > > > > > > return
> > > > > > > > it.
> > > > > > >=20
> > > > > > > That won't work very well, will it?=C2=A0
> > > > > > I think it will work, just will be needed another one check
> > > > > > in
> > > > > > pt_update_entry() where pt_next_level() is called:
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( (rc =3D=3D XEN_=
TABLE_MAP_FAILED) || (rc =3D=3D -
> > > > > > ENOMEM) )
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...
> > > > >=20
> > > > > Yet that's precisely why I said "won't work very well":
> > > > > You're
> > > > > now
> > > > > having
> > > > > rc in two entirely distinct number spaces (XEN_TABLE_MAP_*
> > > > > and -
> > > > > E*).
> > > > > That's imo just calling for trouble down the road. Unless you
> > > > > emphasized
> > > > > this aspect pretty well in a comment.
> > > > >=20
> > > > > > > Imo you need a new XEN_TABLE_MAP_NOMEM.
> > > > > > > (And then XEN_TABLE_MAP_FAILED may want renaming to e.g.
> > > > > > > XEN_TABLE_MAP_NONE).
> > > > > > I am still curious if we really need this separation. If to
> > > > > > in
> > > > > > this
> > > > > > way
> > > > > > then it should be updated the check in pt_update_entry():
> > > > > > =C2=A0=C2=A0 --- a/xen/arch/riscv/pt.c
> > > > > > =C2=A0=C2=A0 +++ b/xen/arch/riscv/pt.c
> > > > > > =C2=A0=C2=A0 @@ -165,10 +165,10 @@ static int pt_next_level(boo=
l
> > > > > > alloc_tbl,
> > > > > > pte_t
> > > > > > =C2=A0=C2=A0 **table, unsigned int offset)
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !pte_is_valid(*=
entry) )
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if ( !alloc_tbl )
> > > > > > =C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 return XEN_TABLE_MAP_FAILED;
> > > > > > =C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 return XEN_TABLE_MAP_NONE;
> > > > > > =C2=A0=C2=A0=C2=A0=20
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if ( create_table(entry) )
> > > > > > =C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 return XEN_TABLE_MAP_FAILED;
> > > > > > =C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 return XEN_TABLE_MAP_NOMEM;
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > > > =C2=A0=C2=A0=C2=A0=20
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( pte_is_mapping(=
*entry) )
> > > > > > =C2=A0=C2=A0 @@ -209,7 +209,7 @@ static int pt_update_entry(mfn=
_t
> > > > > > root,
> > > > > > unsigned
> > > > > > =C2=A0=C2=A0 long virt,
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for ( ; level > targ=
et; level-- )
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 rc =3D pt_next_level(alloc_tbl, &table,
> > > > > > offsets[level]);
> > > > > > =C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( r=
c =3D=3D XEN_TABLE_MAP_FAILED )
> > > > > > =C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( (=
rc =3D=3D XEN_TABLE_MAP_NONE) && (rc =3D=3D
> > > > > > XEN_TABLE_MAP_NOMEM)
> > > > > > =C2=A0=C2=A0 )
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 {
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =3D 0;
> > > > > > But the handling of XEN_TABLE_MAP_NONE and
> > > > > > XEN_TABLE_MAP_NOMEM
> > > > > > seems to
> > > > > > me should be left the same as this one part of the code
> > > > > > actually
> > > > > > catching the case when create_table() returns -ENOMEM:
> > > > > > =C2=A0=C2=A0 pt_next_level()
> > > > > > =C2=A0=C2=A0 {
> > > > > > =C2=A0=C2=A0 ...
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if ( flags & (PTE_VALID | PTE_POPULATE) )
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 {
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dprintk(XENLOG_ERR,
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "%s: Unable to map level %u\n",
> > > > > > __func__,
> > > > > > =C2=A0=C2=A0 level);
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =3D -ENOMEM;
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 }
> > > > >=20
> > > > > Except that you want to avoid "inventing" an error code when
> > > > > you
> > > > > were
> > > > > handed one. Just consider what happens to this code if
> > > > > another -
> > > > > E...
> > > > > could also come back from the helper.
> > > > I think we can drop the usage of -ENOMEM in the helper
> > > > create_table()
> > > > by returning XEN_TABLE_MAP_FAILED in case of failure, with a
> > > > redefinition of XEN_TABLE_MAP_FAILED =3D 1, XEN_TABLE_SUPER_PAGE
> > > > =3D 2,
> > > > and
> > > > XEN_TABLE_NORMAL =3D 3, as value 0 is used to indicate that
> > > > everything is
> > > > okay.
> > > >=20
> > > > We can leave the pt_update() code as it is now:
> > > > ...
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
if ( flags & (PTE_VALID | PTE_POPULATE) )
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
{
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 dprintk(XENLOG_ERR,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "%s: Unable to=
 map level %u\n", __func__,
> > > > level);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 rc =3D -ENOMEM;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
}
> > > > ...
> > > >=20
> > > > Because for the end user, it's better to receive the error code
> > > > from
> > > > xen/errno.h rather than a custom error code introduced nearby
> > > > the
> > > > helper.
> > > >=20
> > > > Does it make sense?
> > >=20
> > > While I think I see where you're coming from, I still don't
> > > agree.
> > > And
> > > I never suggested to bubble up some custom error indication. Up
> > > the
> > > call
> > > chain it wants to be -ENOMEM, sure. Yet keying its generation to
> > > flags & (PTE_VALID | PTE_POPULATE) is both less obvious and more
> > > fragile
> > > (towards future code changes) than keying it to rc =3D=3D
> > > XEN_TABLE_MAP_NOMEM.
> > I am not sure that (rc =3D=3D XEN_TABLE_MAP_NOMEM) is equal to (flags &
> > (PTE_VALID | PTE_POPULATE) as XEN_TABLE_MAP_NOMEM miss the case
> > (flags
> > & PTE_VALID) =3D=3D 0 ( removing a mapping case ) and for which should
> > be
> > returned 0 but not -ENOMEM.
>=20
> The intention is quite clear: Return -ENOMEM if and only if an
> allocation
> failed. Hence why I think the XEN_TABLE_MAP_NOMEM approach is
> preferable.
Just to be sure. Do you mean the following:

diff --git a/xen/arch/riscv/pt.c b/xen/arch/riscv/pt.c
index d7eb207ddc..6cd2e595b6 100644
--- a/xen/arch/riscv/pt.c
+++ b/xen/arch/riscv/pt.c
@@ -209,24 +209,15 @@ static int pt_update_entry(mfn_t root, unsigned
long virt,
     for ( ; level > target; level-- )
     {
         rc =3D pt_next_level(alloc_tbl, &table, offsets[level]);
-        if ( rc =3D=3D XEN_TABLE_MAP_FAILED )
+        if ( rc =3D=3D XEN_TABLE_MAP_NOMEM )
         {
-            rc =3D 0;
-
-            /*
-             * We are here because pt_next_level has failed to map
-             * the intermediate page table (e.g the table does not
exist
-             * and the pt couldn't be allocated). It is a valid case
when
-             * removing a mapping as it may not exist in the page
table.
-             * In this case, just ignore it.
-             */
-            if ( flags & (PTE_VALID | PTE_POPULATE) )
-            {
-                dprintk(XENLOG_ERR,
-                        "%s: Unable to map level %u\n", __func__,
level);
-                rc =3D -ENOMEM;
-            }
+            rc =3D -ENOMEM;
+            goto out;
+        }
=20
+        if ( rc =3D=3D XEN_TABLE_MAP_NONE )
+        {
+            rc =3D 0;
             goto out;
         }

~ Oleksii


