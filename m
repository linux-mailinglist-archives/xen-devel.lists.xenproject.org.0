Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A949E9D8B02
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 18:08:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843016.1258677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFcZF-0004KN-4i; Mon, 25 Nov 2024 17:08:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843016.1258677; Mon, 25 Nov 2024 17:08:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFcZF-0004IV-1Y; Mon, 25 Nov 2024 17:08:09 +0000
Received: by outflank-mailman (input) for mailman id 843016;
 Mon, 25 Nov 2024 17:08:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=toQe=SU=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tFcZD-0004IP-FR
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 17:08:07 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3eddb2c-ab4f-11ef-a0cd-8be0dac302b0;
 Mon, 25 Nov 2024 18:08:01 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-aa560a65fd6so78114566b.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2024 09:08:01 -0800 (PST)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa50b28dd59sm484161866b.7.2024.11.25.09.08.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 09:08:00 -0800 (PST)
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
X-Inumbo-ID: d3eddb2c-ab4f-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzYiLCJoZWxvIjoibWFpbC1lajEteDYzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImQzZWRkYjJjLWFiNGYtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNTU0NDgxLjk2OTQ5OSwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1732554481; x=1733159281; darn=lists.xenproject.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=alvCs7tOjQO9flrv6NVIShFbMcQqOcPC3L3qeFzVreM=;
        b=LCVykWjA4w11rLiheloTvZPVSjPLiVLib7iuD+8fwKP4gUWD6ngoJwP9NL6aDPsQvx
         DOZCdgoK9ZTG6kpWCGQuVkCPR7/4QsysA+zZWIfUdQFi1YbbXSeoEaIFt9vYNDPLKaB+
         vRXf45KJ6N4tR8QL6FHslQO9HUxgiRPrS3nGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732554481; x=1733159281;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=alvCs7tOjQO9flrv6NVIShFbMcQqOcPC3L3qeFzVreM=;
        b=dou5vsDYEr+nYi0dV67Yl8XidqPrib2wTyEare/h/DqgO3HxNAmwgWCQBLjl1Z2WPy
         d3+lpVWcwECGzDyKzgD9nT99wG8wgrPi+IEGq3tDDRrV6nmASc1JSmetHfxvsrc7h0WU
         XIapCQHRvFNCCGtw8aB/vc3FUE2nVaWGHZ8Ftpb29sbRhW3CwZpmV5mx/xBW1NKjKyoU
         JKAiayHR6RPH8FZRBuTCMMCMVN7e6DqJd8NWkn5MHmoJxWpYJ91WVU80Bxb+Lxlrfz/Y
         cOw8c/N9YLSatMSHMfY1HCqoSwkkXpsxylV3NOqVe45wpKuDKFSmB0pgkD/86RVxKujy
         ZV2w==
X-Forwarded-Encrypted: i=1; AJvYcCWhS2O5OvyFN+Vhxd/iMy/gptNKOECtxhQbK5SrjZP+s/CKCMQtKYyv9MKROZGxUPGmZA3gAYIh9KI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyuex/mPcLKKE+pzaBIeV6lpPAVqmTZMUf0pFg7lCarg7VXtjkr
	QSSSaR1eghiIQcQrYhCQZixHteRMUViorqH4heY1XSEkAaFmHHYKtguNYqIHeu4=
X-Gm-Gg: ASbGncsESTrBpXv1sq2OWnQcoHbgsah0PPaZOyz3byMCrQ6T+B4rKK4+u2N6fVrvuAM
	r6ofa77XRunRzl1ne+OCi57tvjSL3MVXFJ7p4YvADXnojo+vyT6Rpz5OVtdGsY4SZ4oL75udntz
	h7u9BGwCVsg8hJr8GtRpCtiVQldlU5aji6Wtaji0MeZM/Y3pNZ0WISdSGAet9ipqbrgq8VSkZPM
	eD7vEikZ2zp+iwVPlp2GByfwcFOnF5l6ioBxG4jaC852seLguq4+555
X-Google-Smtp-Source: AGHT+IHKP3Lg4eUIBlcCjPhkpszbMFr+ItauMW7prJgZAW6Owm//vqM0gQZJyjIkJbscUqyuucBZdg==
X-Received: by 2002:a17:906:cc4e:b0:aa5:2cff:ede2 with SMTP id a640c23a62f3a-aa5648b90bamr16608566b.26.1732554481218;
        Mon, 25 Nov 2024 09:08:01 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 25 Nov 2024 17:07:57 +0000
Message-Id: <D5VFAZ01ONWK.2H3VDANBDRQR5@cloud.com>
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Teddy Astie" <teddy.astie@vates.tech>, <xen-devel@lists.xenproject.org>
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Yann Dirson"
 <yann.dirson@vates.tech>
Subject: Re: [RFC PATCH 07/25] tools/xenbindgen: Add support for structs in
 TOML specs
X-Mailer: aerc 0.18.2
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
 <20241115115200.2824-8-alejandro.vallejo@cloud.com>
 <8dcd8297-d9d9-4106-ba6d-eefd5df6f69a@vates.tech>
In-Reply-To: <8dcd8297-d9d9-4106-ba6d-eefd5df6f69a@vates.tech>

On Mon Nov 25, 2024 at 12:39 PM GMT, Teddy Astie wrote:
> Hi Alejandro,
>
> Le 15/11/2024 =C3=A0 12:51, Alejandro Vallejo a =C3=A9crit=C2=A0:
> > Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> > ---
> >   tools/rust/xenbindgen/src/c_lang.rs | 56 ++++++++++++++++++++++++-
> >   tools/rust/xenbindgen/src/spec.rs   | 64 ++++++++++++++++++++++++++++=
-
> >   2 files changed, 117 insertions(+), 3 deletions(-)
> >
> > diff --git a/tools/rust/xenbindgen/src/c_lang.rs b/tools/rust/xenbindge=
n/src/c_lang.rs
> > index f05e36bb362f..597e0ed41362 100644
> > --- a/tools/rust/xenbindgen/src/c_lang.rs
> > +++ b/tools/rust/xenbindgen/src/c_lang.rs
> > @@ -17,9 +17,10 @@
> >
> >   use std::fmt::Write;
> >
> > -use crate::spec::OutFileDef;
> > +use crate::spec::{OutFileDef, StructDef, Typ};
> >
> >   use convert_case::{Case, Casing};
> > +use log::{debug, trace};
> >
> >   /// An abstract indentation level. 0 is no indentation, 1 is [`INDENT=
_WIDTH`]
> >   /// and so on.
> > @@ -29,6 +30,39 @@ struct Indentation(usize);
> >   /// Default width of each level of indentation
> >   const INDENT_WIDTH: usize =3D 4;
> >
> > +/// Create a C-compatible struct field. Without the terminating semico=
lon.
> > +fn structfield(typ: &Typ, name: &str) -> String {
> > +    match typ {
> > +        Typ::Ptr(x) =3D> {
> > +            let t: &Typ =3D x;
> > +            format!(
> > +                "XEN_GUEST_HANDLE_64({}) {name}",
> > +                match t {
> > +                    Typ::U8 =3D> "uint8",
> > +                    Typ::U16 =3D> "uint16",
> > +                    Typ::U32 =3D> "uint32",
> > +                    Typ::U64 =3D> "uint64_aligned_t",
> > +                    Typ::I8 =3D> "int8",
> > +                    Typ::I16 =3D> "int16",
> > +                    Typ::I32 =3D> "int32",
> > +                    Typ::I64 =3D> "int64_aligned_t",
> > +                    _ =3D> panic!("foo {t:?}"),
> > +                }
> > +            )
> > +        }
> > +        Typ::Struct(x) =3D> format!("struct {x} {name}"),
> > +        Typ::Array(x, len) =3D> format!("{}{name}[{len}]", structfield=
(x, "")),
> > +        Typ::U8 =3D> format!("uint8_t {name}"),
> > +        Typ::U16 =3D> format!("uint16_t {name}"),
> > +        Typ::U32 =3D> format!("uint32_t {name}"),
> > +        Typ::U64 =3D> format!("uint64_aligned_t {name}"),
> > +        Typ::I8 =3D> format!("int8_t {name}"),
> > +        Typ::I16 =3D> format!("int16_t {name}"),
> > +        Typ::I32 =3D> format!("int32_t {name}"),
> > +        Typ::I64 =3D> format!("int64_aligned_t {name}"),
> > +    }
> > +}
> > +
>
> I think _t are missing in the Ptr cases (we are currently generating
> XEN_GUEST_HANDLE_64(uint8) which I don't think is valid).

It is intentional. The handles are presently missing those _t in Xen's publ=
ic
headers, but that's something I'll be changing in the interest of sanity. T=
hat
way we can just recurse to the inner type.


> Aside that, wouldn't it be better to have a separate function for
> converting the type to its C representation ?
>
> Something like
>
> impl Typ { // or blanket trait
>      fn c_repr(&self) -> String {
>          match self {
>              /* ... */
>          }
>      }
> }

That's roughhly what typ_rs() does, and indeed what typ_c() used to do. The=
re's
a complication though...

>
> fn structfield(typ: &Typ, name: &str) -> String {
>      format!("{} {name}", typ.c_repr());
> }
>
> We can also consider Typ::Struct or Typ::Array cases to call recursively
> to c_repr on its inner type to get its representation.
>
> That way, we can have XEN_GUEST_HANDLE_64(struct something).

Initially structfield() was typ_c() (like the Rust backend). Then arrays
happened... Size and typename surround the name of the field (e.g: uint8_t
handle[16]) so I stopped doing it like that because I thought I couldn't.

I have since then noticed I can cheat! The following two fields are identic=
al.
Except the first one is a heck of a lot simpler to generate.

  __typeof__(uint8_t[16]) handle;
  uint8_t handle[16];

My latest branch simplifies all this by s/structfield/typ_c/ and using that
typeof trick.

>
> Cheers
>
> Teddy
>
>
>
> Teddy Astie | Vates XCP-ng Developer
>
> XCP-ng & Xen Orchestra - Vates solutions
>
> web: https://vates.tech

Cheers,
Alejandro

