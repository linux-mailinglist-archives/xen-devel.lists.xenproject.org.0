Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 661E69856E8
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 12:08:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803789.1214595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stOw2-0001sl-7W; Wed, 25 Sep 2024 10:07:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803789.1214595; Wed, 25 Sep 2024 10:07:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stOw2-0001rA-4v; Wed, 25 Sep 2024 10:07:50 +0000
Received: by outflank-mailman (input) for mailman id 803789;
 Wed, 25 Sep 2024 10:07:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mw3j=QX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1stOw1-0001r4-5l
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 10:07:49 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03f42ca7-7b26-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 12:07:48 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5c26311c6f0so8725004a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 03:07:47 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f3427bsm195903866b.15.2024.09.25.03.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 03:07:46 -0700 (PDT)
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
X-Inumbo-ID: 03f42ca7-7b26-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727258867; x=1727863667; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UpmB/RqHd2HzyBRLaFIPSA08hQdvKzim2Fm347BZHW4=;
        b=aDj1C1Nh9kahchEMKS9ldS0mrcYSZ/MUBafaVeZLSQIFbsMAuVCSBWlUVDn+xQ8fa9
         xnrfI0eGt1pdfFRXxIb1MPUF/FH+IBPoMVYFvPnba8dK0FGQSjGUPq/3wO7c9mQeVeBf
         Z/fmhJmLUs2irQlKw3qgYRT/GUhUKHdYlGKwX7a7JFSrB0u0zHuN4dWidytusKB3bpGc
         tV3K4j/eRTaxyA3XPUC0BCSppp8LQboUXJvRGnGq2PgU0rtg5qPa3xt+OhHJq+A3MYH7
         OEjxmsrM/X9/HVuArhmuYrsVLMzkn+bid2SapSpSE5MBgbk/tnGfyJeQKlzfFF18nykn
         mdZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727258867; x=1727863667;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UpmB/RqHd2HzyBRLaFIPSA08hQdvKzim2Fm347BZHW4=;
        b=lSeU1lNnxMSEoRd+gEWq12Frf9VSns4yQ+dyzTeguCnE5s9RYD9Lc5GA7SeTiHfq4e
         no2dFxh/KJuRfTwm7HUOxWODyHJMrYZ8ATxGLD1zN0ETG+FWwp87AV4NsOPoCiPoHSOB
         kreyYfspvNmnL7O6s1MTfLnJS+Et/VBJRC1udmFu/ZxOSern5mSPK8RCKf31KB4GY3Bv
         PZ34f2yN9ttu0TSAdpwWwXF/GgPPCXSskXSz6j9KAZDbBfLxSPza84gXcKEmHVbxmvxT
         PIW+y3Qq3U8O1PA5o8u3hGYFJLG5q5Ze5+lMoTe4cNdhKiE9VjKsDsCaFCedQ3NDfaMk
         o4pA==
X-Forwarded-Encrypted: i=1; AJvYcCV4//qxNq6xzMMQn/PKVqyBS2LxmD9L+A9Fjcr80irKh3LrAuaxYXF4tfImq+TT5kB5HCfVnyu8FRA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyuW9CLkn0V74O8PhQq6fCVb/MVR1L2WLddHejPmQFKILXgX95A
	JAgb+P8Upp9tnSOAwBepFejXnixgR1z09RX1/REa0Bu/f5Eg/16+
X-Google-Smtp-Source: AGHT+IH/Vk1dDxdDJQMvXOedS0TOHew7OLb6HOdXrdB78gMOwas1XcVHjXDORZrjfnr3NBdG74xurA==
X-Received: by 2002:a17:906:f5a9:b0:a8d:2faf:d337 with SMTP id a640c23a62f3a-a93a0325e08mr222661966b.7.1727258866812;
        Wed, 25 Sep 2024 03:07:46 -0700 (PDT)
Message-ID: <ecab08fbbe1a1e364cf6d4bf9dafa42ced4faef4.camel@gmail.com>
Subject: Re: [PATCH v7 7/8] xen/riscv: page table handling
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Wed, 25 Sep 2024 12:07:45 +0200
In-Reply-To: <9371e8fd-a1de-40df-8994-814dd6196953@suse.com>
References: <cover.1726242605.git.oleksii.kurochko@gmail.com>
	 <582c4cee40222e80faf1e465c011b07eeaf2c19f.1726242605.git.oleksii.kurochko@gmail.com>
	 <6100a4e0-5bf3-4555-90ae-20624171ff79@suse.com>
	 <fc23fbd82c1495e75fc0bdcfa894cdb56262b11b.camel@gmail.com>
	 <9371e8fd-a1de-40df-8994-814dd6196953@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-09-24 at 15:31 +0200, Jan Beulich wrote:
> On 24.09.2024 13:30, oleksii.kurochko@gmail.com=C2=A0wrote:
> > On Tue, 2024-09-24 at 12:49 +0200, Jan Beulich wrote:
> > > On 13.09.2024 17:57, Oleksii Kurochko wrote:
> > > > +static int pt_next_level(bool alloc_tbl, pte_t **table,
> > > > unsigned
> > > > int offset)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 pte_t *entry;
> > > > +=C2=A0=C2=A0=C2=A0 mfn_t mfn;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 entry =3D *table + offset;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 if ( !pte_is_valid(*entry) )
> > > > +=C2=A0=C2=A0=C2=A0 {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !alloc_tbl )
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 return XEN_TABLE_MAP_FAILED;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( create_table(entry=
) )
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 return XEN_TABLE_MAP_FAILED;
> > >=20
> > > You're still losing the -ENOMEM here.
> > Agree, I will save the return value of create_table and return it.
>=20
> That won't work very well, will it?=C2=A0
I think it will work, just will be needed another one check in
pt_update_entry() where pt_next_level() is called:
        if ( (rc =3D=3D XEN_TABLE_MAP_FAILED) || (rc =3D=3D -ENOMEM) )
        ...

> Imo you need a new XEN_TABLE_MAP_NOMEM.
> (And then XEN_TABLE_MAP_FAILED may want renaming to e.g.
> XEN_TABLE_MAP_NONE).
I am still curious if we really need this separation. If to in this way
then it should be updated the check in pt_update_entry():
   --- a/xen/arch/riscv/pt.c
   +++ b/xen/arch/riscv/pt.c
   @@ -165,10 +165,10 @@ static int pt_next_level(bool alloc_tbl, pte_t
   **table, unsigned int offset)
        if ( !pte_is_valid(*entry) )
        {
            if ( !alloc_tbl )
   -            return XEN_TABLE_MAP_FAILED;
   +            return XEN_TABLE_MAP_NONE;
   =20
            if ( create_table(entry) )
   -            return XEN_TABLE_MAP_FAILED;
   +            return XEN_TABLE_MAP_NOMEM;
        }
   =20
        if ( pte_is_mapping(*entry) )
   @@ -209,7 +209,7 @@ static int pt_update_entry(mfn_t root, unsigned
   long virt,
        for ( ; level > target; level-- )
        {
            rc =3D pt_next_level(alloc_tbl, &table, offsets[level]);
   -        if ( rc =3D=3D XEN_TABLE_MAP_FAILED )
   +        if ( (rc =3D=3D XEN_TABLE_MAP_NONE) && (rc =3D=3D XEN_TABLE_MAP=
_NOMEM)
   )
            {
                rc =3D 0;
But the handling of XEN_TABLE_MAP_NONE and XEN_TABLE_MAP_NOMEM seems to
me should be left the same as this one part of the code actually
catching the case when create_table() returns -ENOMEM:
   pt_next_level()
   {
   ...
               if ( flags & (PTE_VALID | PTE_POPULATE) )
               {
                   dprintk(XENLOG_ERR,
                           "%s: Unable to map level %u\n", __func__,
   level);
                   rc =3D -ENOMEM;
               }
   ...
  =20
~ Oleksii

