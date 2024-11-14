Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FDE9C8FD3
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 17:31:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836633.1252545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBcjy-0001im-UE; Thu, 14 Nov 2024 16:30:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836633.1252545; Thu, 14 Nov 2024 16:30:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBcjy-0001fm-Ra; Thu, 14 Nov 2024 16:30:42 +0000
Received: by outflank-mailman (input) for mailman id 836633;
 Thu, 14 Nov 2024 16:30:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mvJx=SJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tBcjw-0001eP-HK
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 16:30:40 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6db341f-a2a5-11ef-99a3-01e77a169b0f;
 Thu, 14 Nov 2024 17:30:36 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5ceca0ec4e7so1079847a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 08:30:36 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20df50041sm79485766b.43.2024.11.14.08.30.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 08:30:34 -0800 (PST)
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
X-Inumbo-ID: c6db341f-a2a5-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzQiLCJoZWxvIjoibWFpbC1lZDEteDUzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImM2ZGIzNDFmLWEyYTUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjAxODM2LjMzOTA4Nywic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731601836; x=1732206636; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+RDqCwT/5xDjxt4YaAMNal3TIe2cseSvdisq3H/R+dc=;
        b=RA7wHeXfBkXyGBS0smfbe3rNlTwFPXl+MhSwHuKoVxSTnUkdtspxG10A9aTLTdZLmc
         i4RKWdejA7hfxrVvroMmt2zcoGSSJF4NGgb+GuoMSuvNcXkO9seg6znQnUKfLYfQV+L0
         c9Q9vU0Ib1FKHUzUhhMTN0/Is/ZzvYaMJYBOJPQZkGNkx/8yHY4OFxrddpTQPC9TkYSd
         zN/ndoo9b+vhG/iAi7qM60hJTpnpy/+fK8P4+ZhLXqjAndGOo7fk5ehxdY5ODDgz4UMt
         owBXjaTP8kRH7MOMut7O8iJHjj3S9cfLrS9jfFdS3Kp8gND9c19cOWemMdZ98Yw21xOo
         1urQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731601836; x=1732206636;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+RDqCwT/5xDjxt4YaAMNal3TIe2cseSvdisq3H/R+dc=;
        b=W2LA5WTR4ikkAEhGk/kGvgOao6oJOU7Yc/lQDpm7f0QEeT7l1kI/ciEzsXLlV/aOPb
         xpbar+GBt2NlQ7SoKv/ct8u2Tf96Jl9yLonh3zEHwJrWePO/vULmJrau6eEUjZN0QSzR
         tDmevD0ITIC0Q7Qd0WqmfouVjgNhlIPjG8G/+GCJDzslbVZXviLHPyWAutskHLZ2EswO
         f3CmrZun3F23es3VkL9tiGgGvDr6sHt1WXz5YsxcY2x2Lt6TJe6FcvBYS2jRQQQheaGo
         P/g1KnJNCNl68CXv0He7kGfQ4UUSH+oawJ2zd3C7ogGr8WkUS3aNd70DDH7GtUIPDakK
         S+KA==
X-Forwarded-Encrypted: i=1; AJvYcCVdKbzRj7VbuleBg7Xqy5RSLSBzGh78zvhceSJxNrq3GI8c8CGJP1ZV/5T2ctvqwe6eNQmZvXGLCJE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwKE/WH6tu+CbN54LZwSszNqmnWB+6fKAZCtDTj6U3mIRDIqzi1
	QJutx62n8OnyJjMG5oel53qLqg6JJv7o0mLKMBzUwSEoa6ZVABcg
X-Google-Smtp-Source: AGHT+IEwwqX8uStyHgcdyECJUQBIWVJQrwEj8Hd8jH6eQTcJHEHZsxF653irw5IiIrDKB8dxSASfpg==
X-Received: by 2002:a17:907:a4b:b0:a99:fc3d:7c76 with SMTP id a640c23a62f3a-a9ef001915amr2485163566b.37.1731601835385;
        Thu, 14 Nov 2024 08:30:35 -0800 (PST)
Message-ID: <b71986cbc487b68a8d6b31162bcefb8b3b7c2648.camel@gmail.com>
Subject: Re: [PATCH v5 1/3] xen/riscv: introduce setup_mm()
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman	
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper	 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini	 <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Thu, 14 Nov 2024 17:30:33 +0100
In-Reply-To: <7aaa8eea-247f-43f5-9777-2a3431e0c1a0@suse.com>
References: <cover.1731344883.git.oleksii.kurochko@gmail.com>
	 <c3640fe453cb8a0eff4d50d21d57535f67f7b92a.1731344883.git.oleksii.kurochko@gmail.com>
	 <acd75f3d-da7d-4487-afde-877405c24c2a@suse.com>
	 <aec35a326656a2b976b584ea5467f54cd87ca6d6.camel@gmail.com>
	 <7aaa8eea-247f-43f5-9777-2a3431e0c1a0@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41app1) 
MIME-Version: 1.0

On Thu, 2024-11-14 at 10:49 +0100, Jan Beulich wrote:
> > > > @@ -423,3 +429,147 @@ void * __init early_fdt_map(paddr_t
> > > > fdt_paddr)
> > > > =C2=A0
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 return fdt_virt;
> > > > =C2=A0}
> > > > +
> > > > +vaddr_t __ro_after_init directmap_virt_start =3D
> > > > DIRECTMAP_VIRT_START;
> > > > +
> > > > +struct page_info *__ro_after_init frametable_virt_start =3D
> > > > frame_table;
> > > > +
> > > > +#ifndef CONFIG_RISCV_32
> > > > +
> > > > +/* Map a frame table to cover physical addresses ps through pe
> > > > */
> > > > +static void __init setup_frametable_mappings(paddr_t ps,
> > > > paddr_t
> > > > pe)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 static mfn_t __initdata frametable_mfn_start =
=3D
> > > > INVALID_MFN_INITIALIZER;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 paddr_t aligned_ps =3D ROUNDUP(ps, PAGE_SIZE);
> > > > +=C2=A0=C2=A0=C2=A0 paddr_t aligned_pe =3D ROUNDDOWN(pe, PAGE_SIZE)=
;
> > > > +=C2=A0=C2=A0=C2=A0 unsigned long nr_mfns =3D PFN_DOWN(aligned_pe -=
 aligned_ps);
> > > > +=C2=A0=C2=A0=C2=A0 unsigned long frametable_size =3D nr_mfns *
> > > > sizeof(*frame_table);
> > > > +=C2=A0=C2=A0=C2=A0 mfn_t base_mfn;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 if ( mfn_eq(frametable_mfn_start, INVALID_MFN) =
)
> > > > +=C2=A0=C2=A0=C2=A0 {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 frametable_mfn_start =
=3D maddr_to_mfn(aligned_ps);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 frametable_virt_start -=
=3D paddr_to_pfn(aligned_ps);
> > > > +=C2=A0=C2=A0=C2=A0 }
> > > > +=C2=A0=C2=A0=C2=A0 else
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic("%s shouldn't be =
called twice\n", __func__);
> > >=20
> > > As said on the v4 thread - I don't think this is needed. Aiui
> > > Misra
> > > would
> > > actually dislike it, as it's unreachable code. Just to re-
> > > iterate: My
> > > complaint there wasn't about this missing check, but about the
> > > function
> > > partly giving the impression of expecting to be called more than
> > > once.
> > I=E2=80=99ll revert this check, then. Would it be better=E2=80=94and su=
fficient=E2=80=94to
> > add
> > a comment before setup_frametable_mappings() indicating that this
> > function should only be called once, to avoid any impression that
> > it
> > might be expected to be called multiple times?
>=20
> You can add such a comment if you like, we we have many functions of
> this
> kind. The important aspect - as said before - is that the function
> should
> not - nowhere - give the impression of possibly expecting to be
> called
> more than once.
Then I am not 100% sure how to deal with this impression specifically
in the case of setup_frametable_mapping() which should be called once.

The only options I have in my head are:
   Option 1:
       static void __init setup_frametable_mappings(paddr_t ps, paddr_t
      pe)
       {
      +    static bool __read_mostly once;
      +
           paddr_t aligned_ps =3D ROUNDUP(ps, PAGE_SIZE);
           paddr_t aligned_pe =3D ROUNDDOWN(pe, PAGE_SIZE);
           unsigned long nr_mfns =3D PFN_DOWN(aligned_pe - aligned_ps);
           unsigned long frametable_size =3D nr_mfns *
      sizeof(*frame_table);
           mfn_t base_mfn;
      =20
      +    ASSERT(!once);
      +
      +    once =3D true;
      +
           frametable_virt_start -=3D paddr_to_pfn(aligned_ps);
      =20
           if ( frametable_size > FRAMETABLE_SIZE )


   Option 2:
  =20
      -struct page_info *__ro_after_init frametable_virt_start =3D
      frame_table;
      +struct page_info *__ro_after_init frametable_virt_start;
      =20
       #ifndef CONFIG_RISCV_32
      =20
      @@ -442,7 +442,9 @@ static void __init
      setup_frametable_mappings(paddr_t ps, paddr_t pe)
           unsigned long frametable_size =3D nr_mfns *
   sizeof(*frame_table);
           mfn_t base_mfn;
      =20
      -    frametable_virt_start -=3D paddr_to_pfn(aligned_ps);
      +    ASSERT(!frametable_virt_start);
      +
      +    frametable_virt_start =3D frame_table -
   paddr_to_pfn(aligned_ps);
      =20
           if ( frametable_size > FRAMETABLE_SIZE )
               panic("The frametable cannot cover [%#"PRIpaddr",
      %#"PRIpaddr")\n",
  =20
~ Oleksii


