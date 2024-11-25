Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B6A9D8B22
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 18:17:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843029.1258688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFchY-0006GG-Ta; Mon, 25 Nov 2024 17:16:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843029.1258688; Mon, 25 Nov 2024 17:16:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFchY-0006El-Qq; Mon, 25 Nov 2024 17:16:44 +0000
Received: by outflank-mailman (input) for mailman id 843029;
 Mon, 25 Nov 2024 17:16:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=toQe=SU=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tFchX-0006Ef-Rq
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 17:16:43 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 071d0dc1-ab51-11ef-99a3-01e77a169b0f;
 Mon, 25 Nov 2024 18:16:37 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-aa54adcb894so186039266b.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2024 09:16:37 -0800 (PST)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa50b57bda2sm489473466b.146.2024.11.25.09.16.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 09:16:36 -0800 (PST)
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
X-Inumbo-ID: 071d0dc1-ab51-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmYiLCJoZWxvIjoibWFpbC1lajEteDYyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjA3MWQwZGMxLWFiNTEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNTU0OTk3LjM2ODM3NCwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1732554997; x=1733159797; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ukh5gY3bqEEKYOlfiHn5RMNn60HNLLGftpYT9pSeOF4=;
        b=kF1joOu5337CaJkvLXA61Sp5RPHbBtQ1HuDIWaf1Lhz0EK0BdZYEoT3qgrv10gJty6
         Ogj6lDv+ncVYkj5/5TKOBGKYiC1U3wrCvrih7v/68KA2ZnVQWxHUs5O91k6DKePUn2zU
         J3drWFDHhDjEw4xFbdMZnpucx3sUtzzwedWas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732554997; x=1733159797;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ukh5gY3bqEEKYOlfiHn5RMNn60HNLLGftpYT9pSeOF4=;
        b=BYMnQm9jh25Yq1h8+8gBUtOhvfxw89+N1bpDUXk9kaP0hqhcn0YNfSzgfDPsLFZiNv
         glLUqJuKkDM87fYbLCa70Xtu/Z03RJIDAesYlwODFTWjxgg3CBbvhuIln+Tz1s5JjwhV
         7GIJ4bGWbxUbx5VQp0qDa55KeWBUdVZYNN/zEJaWG/SjTdIY8W/onUO49CBs5TXua2lG
         BYoyX/yP1czAO6lHVPRVn1YXaZLo1uZEGPsYtnqK16XLFGOAX55uPKlQxEPbtQe5tvrI
         hl/MKB56a2U2dnu/hzidXthoEbv3tDes+9OpCqRVBlXnrQBJ5PUeCIG/xtYGEZAff9Mf
         sbFw==
X-Forwarded-Encrypted: i=1; AJvYcCWhJMNU3Y0EYpMsVQeJSnC8LtM+DWeG1tb4buu6J3tKS6paRllP+SPfmgTqPNuwTwLpt+u20tCiPJY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw8vuheQpMaiRwhqvwo1SKghn+WGrSiJMQf2BD/O9L/NSwDVlQl
	TLpUna3iBgFW4r51QEsa+31fwttQomqf4WkRFtAB/XjwwOMMcD+dHvwepN+Bzo8=
X-Gm-Gg: ASbGncsumH81Snxm0NSuj1M4ZoSyI72EiA/XeNIibLXBqqF4KsBvisCDrR2WtlZBy75
	hAf1hmheanXtcy+IcUAb1CH0FBWF0OjZ7+M6F6etd9t4X42xlC836URjU/i4cPcduk/Lkr01nEL
	mO+H71CZxh9+U+0U1aZqFxH0hDt+4U4gw6Mb1E/FThwUVi4NEcqCtVtRRpjzfKhsJPZVZCwuhnv
	QjBs3oqi6mXHyxz7YrWVYdmZLopF7ZHUJZhjoid87mTjLiB8g8OIC9z
X-Google-Smtp-Source: AGHT+IFJ5iQFb9Oc+J7JuMW8wRyAMHcleQDFGSb2YbA+/0HU7AHHq6ZL35Beh4AzNKhDpi4329iHXQ==
X-Received: by 2002:a17:906:18a1:b0:aa5:392a:f5a7 with SMTP id a640c23a62f3a-aa5392af5c3mr732468566b.57.1732554996631;
        Mon, 25 Nov 2024 09:16:36 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 25 Nov 2024 17:16:32 +0000
Message-Id: <D5VFHJSU153B.BB6IU74AECCA@cloud.com>
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Yann Dirson"
 <yann.dirson@vates.tech>
Subject: Re: [RFC PATCH 07/25] tools/xenbindgen: Add support for structs in
 TOML specs
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Teddy Astie" <teddy.astie@vates.tech>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
 <20241115115200.2824-8-alejandro.vallejo@cloud.com>
 <d98f8aa1-b0ba-4fb5-8c5d-ab18cc40fb01@vates.tech>
In-Reply-To: <d98f8aa1-b0ba-4fb5-8c5d-ab18cc40fb01@vates.tech>

On Mon Nov 25, 2024 at 3:03 PM GMT, Teddy Astie wrote:
> Hi,
>
> > +/// An IDL type. A type may be a primitive integer, a pointer to an ID=
L type,
> > +/// an array of IDL types or a struct composed of IDL types. Every int=
eger must
> > +/// be aligned to its size.
> > +///
> > +/// FIXME: This enumerated type is recovered as-is from the `typ` fiel=
d in the
> > +/// TOML files. Ideally, that representation should be more ergonomic =
and the
> > +/// parser instructed to deal with it.
> > +#[allow(clippy::missing_docs_in_private_items)]
> > +#[derive(Debug, serde::Deserialize, PartialEq)]
> > +#[serde(rename_all =3D "lowercase", tag =3D "tag", content =3D "args")=
]

FYI, this serde config is something I've also changed since the RFC. The
explicit tag and content are gone, because they complicate things and they =
are
actively harmful

Before (with explicit tag+content):

  typ =3D { tag =3D "u16" }
  typ =3D { tag =3D "struct", content =3D "foobar" }
  typ =3D { tag =3D "ptr", content =3D { tag =3D "u8" } }
  typ =3D { tag =3D "ptr", content =3D { tag =3D "struct", content =3D "foo=
bar" } }

After (without explicit tag+content):

  typ =3D "u16"
  typ =3D { struct =3D "foobar" }
  typ =3D { ptr =3D "u8" }
  typ =3D { ptr =3D { struct =3D "foobar" } }

> > +pub enum Typ {
> > +    Struct(String),
> > +    U8,
> > +    U16,
> > +    U32,
> > +    U64,
> > +    I8,
> > +    I16,
> > +    I32,
> > +    I64,
> > +    Ptr(Box<Typ>),
> > +    Array(Box<Typ>, usize),
> > +}
> > +
>
> I think we can name it Type (it doesn't clash with a keyword actually)

Sure. I just wanted it to mirror the field name (because `type` is reserved=
).
In the big scheme of things it's not terribly important to do so.

>
> > +
> > +/// Deserialized form of a field within a hypercall struct (see [`Stru=
ctDef`])
> > +#[derive(Debug, serde::Deserialize)]
> > +pub struct FieldDef {
> > +    /// Name of the field
> > +    pub name: String,
> > +    /// Description of what the field is for. This string is added as =
a comment
> > +    /// on top of the autogenerated field.
> > +    pub description: String,
> > +    /// Type of the field.
> > +    pub typ: Typ,
> > +}
> > +
>
> regarding this "typ" name, we can either use the "raw identifier" syntax=
=20
> with r#type to have it "technically" named 'type' or use

I'd really rather not. Feels like playing with hot fire.

> #[serde(rename =3D "type")]
> to have it named "type" during deserialization even if the field is=20
> still "typ"

This I like. I forgot I could do that.

>
> Cheers
> Teddy
>
>
> Teddy Astie | Vates XCP-ng Developer
>
> XCP-ng & Xen Orchestra - Vates solutions
>
> web: https://vates.tech

Cheers,
Alejandro

