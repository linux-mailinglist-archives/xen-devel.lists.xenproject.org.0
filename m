Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEA59965C3
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 11:44:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814098.1227198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syTEv-0008WN-OA; Wed, 09 Oct 2024 09:44:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814098.1227198; Wed, 09 Oct 2024 09:44:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syTEv-0008Ud-LC; Wed, 09 Oct 2024 09:44:17 +0000
Received: by outflank-mailman (input) for mailman id 814098;
 Wed, 09 Oct 2024 09:44:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3wKy=RF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1syTEt-0008UX-Qy
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 09:44:15 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b088226-8623-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 11:44:14 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5398cc2fcb7so7550500e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 02:44:13 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539aff1d341sm1458616e87.167.2024.10.09.02.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 02:44:12 -0700 (PDT)
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
X-Inumbo-ID: 0b088226-8623-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728467053; x=1729071853; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=azvjZLZmY1Yusr59naqFI2Y/i885nbOVpal2iF9eUmw=;
        b=iuYlEjTinnp3IkJOTJCb8po8z9KTLwM1+mtIPGVnoIy7WS1Ny6kO+CjYfVcHIJqtFD
         ADyez+cluGa1psYNWgLjO0eZOnHjAMRb7I/7BUgpAfZxxKMPXqC5QUsbC4DJuPupkffc
         tzSof/emTy5iH37LgDZnfafXVKUHbDUHkw8aAVYyLRTfNM2uClTO3WSorzwZwy9qnvxI
         rUL4sb7vIGWFuTPDj+RfOLtiWPB5yGzHe8NU7VKGHm8QmPFRBDPTpQphX68mLzz4//B5
         6Kcd1ifQWIt3eVzU8C8olmYW+ao7JnsPZNJI2s7k+gvAL2ZbUUg1/0VnzPrf62MnYsEp
         PoYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728467053; x=1729071853;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=azvjZLZmY1Yusr59naqFI2Y/i885nbOVpal2iF9eUmw=;
        b=RQ/SR/Q2xipRUKjV4rsGXGXUbpfcC3uB1VJ2Gmt0uGMBk5t+c7PXwvsOKwU3qIAXLv
         YI5mjehv9DwRC/Rdnamcv1BiysjLCwfA7KwbiwDz/Co7sPxRCv6RngA3oeRED65jm+Yo
         7r3mYUDBvgU4lwjs9iNptb/T7EXhLDMHi0nCdOGrfXy+L4Wi7WJx6ARgqUpluttHa61r
         NvAltsDNIMv3ttjY5MamNCgC4HJox6lzSayxjMKUOeHvMoW4Nhd/7Iy4Ll8h1Tsxj00F
         FgugTpJlfJgmmNbYFfcMRp50NmDpYTX24xW41YKuyHK40DIG7p2/1sIfvpQEot7dLip0
         pIjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHIxvKSZ6I6OqQjbSqWOHdNxCBd1m+F/8OXkzZrm3eGdUZv0+ys4OrA76c3TJBIkrTuUFI2ACENQM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy659bUeIDA8TlloQKTyqELGAtxZXvxCezgrgxyjYXx/AVJUbV6
	OZT72JrZccaKiWuh/j+CeFRuOCisepixMHgFhOEp31/CewN9jvyJ
X-Google-Smtp-Source: AGHT+IHaVdKHY6jstBHtgfVYpkz45Ka06kz2xLHSXasvRX6ZbgNNHZREMw61jpYkkyLHQk0qb45ICA==
X-Received: by 2002:a05:6512:3087:b0:539:94e2:a0d6 with SMTP id 2adb3069b0e04-539c48eabbbmr1064176e87.31.1728467053095;
        Wed, 09 Oct 2024 02:44:13 -0700 (PDT)
Message-ID: <bb3d291186e1549de52f020d9cdca2b1938e508f.camel@gmail.com>
Subject: Re: [PATCH v2 1/3] xen/riscv: implement virt_to_maddr()
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Wed, 09 Oct 2024 11:44:12 +0200
In-Reply-To: <98fdc897-2ad7-47c6-a633-70dfa381e562@suse.com>
References: <cover.1728057657.git.oleksii.kurochko@gmail.com>
	 <25a0fa030db90c929379a799aa5e03bed0197665.1728057657.git.oleksii.kurochko@gmail.com>
	 <5771a606964dfaf7d507a5ecbc315dbbf8eac479.camel@gmail.com>
	 <98fdc897-2ad7-47c6-a633-70dfa381e562@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-10-08 at 12:34 +0200, Jan Beulich wrote:
> On 08.10.2024 12:26, oleksii.kurochko@gmail.com=C2=A0wrote:
> > On Fri, 2024-10-04 at 18:04 +0200, Oleksii Kurochko wrote:
> > > @@ -28,7 +29,21 @@ static inline void *maddr_to_virt(paddr_t ma)
> > > =C2=A0=C2=A0=C2=A0=C2=A0 return NULL;
> > > =C2=A0}
> > > =C2=A0
> > > -#define virt_to_maddr(va) ({ BUG_ON("unimplemented"); 0; })
> > > +static inline unsigned long virt_to_maddr(unsigned long va)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0 ASSERT(va >=3D (DIRECTMAP_VIRT_START + DIRECTMAP_=
SIZE));
> > It should be ASSERT(va < (...)).
> >=20
> > Then I can't use virt_to_maddr() instead of LINK_TO_LOAD() as=20
> > address from Xen's VA space ( XEN_VIRT_START ) are higher then
> > (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE).
> >=20
> > Or as an option we could consider to drop this ASSERT() as if
> > VA is from directmap range the if below will catch that; otherwise
> > we have another one ASSERT() which checks that VA is from Xen VA
> > range
> > where it is sage to use (phys_offset + va).
> >=20
> > Could we consider just dropping "ASSERT(va < (DIRECTMAP_VIRT_START
> > +
> > DIRECTMAP_SIZE))" or I am missing something?
>=20
> Counter question: Why did you put the ASSERT() there when - once
> corrected - it's actually pointless? What you want to make sure is
> that virt_to_maddr() can't be invoked with bad argument (without
> noticing). If that's achieved with just the other assertion (as it
> looks to be), then leaving out this assertion ought to be fine.
Originally, I didn=E2=80=99t include the part after 'if (...)'. The purpose=
 of
ASSERT(va < (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE)) was to ensure that
the virtual address fell within the expected (directmap) range. Later,
I added the part after 'if (...)', which extended the acceptable
virtual address range to also cover addresses from Xen=E2=80=99s linkage
address space. At that point, I should have removed the original
ASSERT() but overlooked it.

I will drop the first ASSERT() and update the commit message / comment
above virt_to_maddr() why it is enough to have only 1 ASSERT() after if
(...).

~ Oleksii

