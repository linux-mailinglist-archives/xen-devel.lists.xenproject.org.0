Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE22944AA9
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 13:55:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769639.1180525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZUOk-0005SF-L0; Thu, 01 Aug 2024 11:55:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769639.1180525; Thu, 01 Aug 2024 11:55:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZUOk-0005QZ-Hp; Thu, 01 Aug 2024 11:55:10 +0000
Received: by outflank-mailman (input) for mailman id 769639;
 Thu, 01 Aug 2024 11:55:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dsN4=PA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sZUOi-0005QT-UK
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2024 11:55:09 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5f22581-4ffc-11ef-bc02-fd08da9f4363;
 Thu, 01 Aug 2024 13:55:08 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ef23d04541so81534011fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2024 04:55:08 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f03cf4f790sm22831661fa.55.2024.08.01.04.55.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Aug 2024 04:55:06 -0700 (PDT)
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
X-Inumbo-ID: e5f22581-4ffc-11ef-bc02-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722513307; x=1723118107; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aoP6Mp+aXlnwOtK5jvVI7V9PqcxLBUWIZ6NNA5dKuLw=;
        b=CpJxg2IJ0DWf6kzRdphuXF2FRTIs+Uybq/RgvlHk7iiJsjxjUdJBDeRzRrUWogWRg1
         jMpK5gXkotNGs1U+urbWLiJnRBoizaoXTyiXBHOsmqyo7E2gtjRwv0Kd1EO/8KxavkoW
         AF6Xk88TYkh1kRy4hJd8o/JiqjXsyGP+mJRxMwyG+VTEzWAi+7b+EgzFVDNJuurCb4Yi
         kwJsRJw3VwFdyqh7CMKnKs/phB4nCJ6epKQufs0I1Oh5djHtc537EdH3rVUTcHhS5y7+
         m/4dhNwwxP10ZT448MUSyutQMz0N2hLKCAAQ1PAO0W+W3gInj0cbSqOm2tZ/esduJxQS
         odsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722513307; x=1723118107;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aoP6Mp+aXlnwOtK5jvVI7V9PqcxLBUWIZ6NNA5dKuLw=;
        b=Aeu/rdc5wwv4eOZ1kodg/Tr9YYpwXaK0VsNuLEgh5xz4RZrApRNLRcpDA/y2NS1ShH
         eRz9Rq7ECZNtjT8AZhEp8S5QMdMkAJ1RSYsbMzdwMbNqVghmkJFdMNVeMhG4HPbFYmkC
         tI2/d9VSzinAph32dbC+6D9RPGBjXizVWrF3fQ5QGuXflO9YFSqES5AbFYaXrSCAKCef
         UFtkzHGFTxDjO4sxqovChRCaeL4DFsniGsNxMOQl4+1/xFhC9VgIcQUrrBtP0CTNaRIo
         JYRjie7zP9qoZQGcen9kielRF3e154XJlKne7p0+fckOnNvVX0rzHjUntSbMFU7sciRo
         zfPw==
X-Forwarded-Encrypted: i=1; AJvYcCUxcMWJTfVcp1v/lHvWaI/6RBWpX9+nw8hHR7LQCK87C6bH/rmAfFNPM/ta79phRi7B3nF2TFzLUWno9GezEv261rYN12A6Scv0s7diByc=
X-Gm-Message-State: AOJu0Yzv1FLstr+C/03tgzMOF2wbQcC0TQYvj0Knh5jjGaCAXx71MXsd
	ca/YNvE39xe4x34coENf+lKzOE65q8qGhejJt6KyyZVVi0i79hnT
X-Google-Smtp-Source: AGHT+IGqnM0wd4pc47hl0ljZYsK2T8iOuOLqXSe2vXD8R2tZvbklo5RT/nHR2KvgtufHIaI3sMjY3g==
X-Received: by 2002:a05:651c:22d:b0:2ef:23ec:9356 with SMTP id 38308e7fff4ca-2f1530df004mr15370081fa.8.1722513306994;
        Thu, 01 Aug 2024 04:55:06 -0700 (PDT)
Message-ID: <d816816c0cb37279f45fad46553b1fa267b0febc.camel@gmail.com>
Subject: Re: [PATCH v3 8/9] xen/riscv: page table handling
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Thu, 01 Aug 2024 13:55:05 +0200
In-Reply-To: <afc24e73-78e8-4088-9292-33560e599cbe@suse.com>
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
	 <595c7b6736d6f718bafc7a677fb13881584ce4dc.1721834549.git.oleksii.kurochko@gmail.com>
	 <c2496115-5c42-4cbb-8dde-686a97259609@suse.com>
	 <04b40498494cbbd0d78744d87a2310e211f26b85.camel@gmail.com>
	 <afc24e73-78e8-4088-9292-33560e599cbe@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Thu, 2024-08-01 at 12:43 +0200, Jan Beulich wrote:
>=20
>=20
> > > > +=C2=A0=C2=A0=C2=A0 mfn =3D pte_get_mfn(*entry);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 xen_unmap_table(*table);
> > > > +=C2=A0=C2=A0=C2=A0 *table =3D xen_map_table(mfn);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 return XEN_TABLE_NORMAL_PAGE;
> > > > +}
> > >=20
> > > Normal page? Not normal table?
> > It just mean that this points not to super_page so potenially the
> > in
> > the next one table will have an entry that would be normal page.
>=20
> Or a normal page table, if you haven't reached leaf level yet. IOW
> maybe
> better XEN_TABLE_NORMAL, covering both cases?
It would be better. Thanks.

>=20
> > > > +int map_pages_to_xen(unsigned long virt,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mfn_t mfn,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long nr_mfn=
s,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int flags)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 return xen_pt_update(virt, mfn, nr_mfns, flags)=
;
> > > > +}
> > >=20
> > > Why this wrapping of two functions taking identical arguments?
> > map_pages_to_xen() sounds more clear regarding the way how it
> > should be
> > used.
> >=20
> > xen_pt_update() will be also used inside other functions. Look at
> > the
> > example above.
>=20
> They could as well use map_pages_to_xen() then? Or else the wrapper
> may
> want to check (assert) that it is _not_ called with one of the
> special
> case arguments that xen_pt_update() knows how to deal with?
Yes, map_pages_to_xen() will be used in other functions/wrappers.
At the momemnt, I don't see what should be checked additionally in
map_pages_to_xen(). It seems to me that xen_pt_update() covers all the
checks at the start it needs for now. ( i will double-check that ).

~ Oleksii

