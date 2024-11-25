Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2E49D8581
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 13:39:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842512.1258050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFYN4-0001WY-Fv; Mon, 25 Nov 2024 12:39:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842512.1258050; Mon, 25 Nov 2024 12:39:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFYN4-0001Us-Ba; Mon, 25 Nov 2024 12:39:18 +0000
Received: by outflank-mailman (input) for mailman id 842512;
 Mon, 25 Nov 2024 12:39:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uxrf=SU=bounce.vates.tech=bounce-md_30504962.67446fed.v1-9fbbdb30330a4bae8dd0e343e4975130@srs-se1.protection.inumbo.net>)
 id 1tFYN2-0001Uk-Fm
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 12:39:16 +0000
Received: from mail134-5.atl141.mandrillapp.com
 (mail134-5.atl141.mandrillapp.com [198.2.134.5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45560e73-ab2a-11ef-a0cd-8be0dac302b0;
 Mon, 25 Nov 2024 13:39:12 +0100 (CET)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-5.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4Xxld92xC7zG0CByw
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2024 12:39:09 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 9fbbdb30330a4bae8dd0e343e4975130; Mon, 25 Nov 2024 12:39:09 +0000
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
X-Inumbo-ID: 45560e73-ab2a-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjEzNC41IiwiaGVsbyI6Im1haWwxMzQtNS5hdGwxNDEubWFuZHJpbGxhcHAuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjQ1NTYwZTczLWFiMmEtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNTM4MzUyLjI5NTI4Nywic2VuZGVyIjoiYm91bmNlLW1kXzMwNTA0OTYyLjY3NDQ2ZmVkLnYxLTlmYmJkYjMwMzMwYTRiYWU4ZGQwZTM0M2U0OTc1MTMwQGJvdW5jZS52YXRlcy50ZWNoIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1732538349; x=1732798849;
	bh=IXR2piY85zWK0osdoMrnuuiokPxa8VpFHcies5EH5BM=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=yEa76uop03EMATv5HPw4SG5j8zlR1VYB0qt4YO1XnAlPoKlQ7/mFRoV3QdQSx8vq5
	 lKppxMt7dcIT0wHWvYXGY5Wkohb+EAvvvkG1aqaC4FpT8mU3DvoJXvgh2q2CFnK3tj
	 9pgf7J2Bd0kd3BlbOumYDBt1F7POegiagaazBYrvAUcTusX0408S7pexwFzLOW78IV
	 6j8Rsq4KdkhHLSIWhql6eEj34hRlErZl/eZWy7QdEt419j070+N9hiQ2wajExqWe7b
	 ZIzG3d1bSyL8TSgO6JNFbTP2a4HcHlIF9DyxBWzwn3LItY+mQk/oGPsMThZSCIFS4b
	 HSPKOeiGLGHUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1732538349; x=1732798849; i=teddy.astie@vates.tech;
	bh=IXR2piY85zWK0osdoMrnuuiokPxa8VpFHcies5EH5BM=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ERMHdxyrI7KIqbyrPDXAItBwb55v2IShvYVSqpSi22m3+rH8U4M6lc/ShmI37qCoL
	 V/YsjRhgSLG8sJf0RCfQEf9/TJB4/pIb1jJsu1FW/k1LQa7UT2d4f/90Djo2oNQc3N
	 1FVD3bltLf/5qRdRbcf0YsB+QaiPIyHTZNCGvcDWTrpRA+RdlFz9kKT7a/zVene98y
	 6ifRfZ48n28IFSiwY2W5NU33m0ExkmE/Zh5nAzJRLd26Uc1kdKhSV9j2jng5pcbm+4
	 68N5kuKzd2I2OFN8kKmcnSmCFtkbMAWItrpJvShSoMSqfd+FEaGSDIxm6+VakdJr2q
	 CMCXxepEsPTRQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH=2007/25]=20tools/xenbindgen:=20Add=20support=20for=20structs=20in=20TOML=20specs?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1732538348441
Message-Id: <8dcd8297-d9d9-4106-ba6d-eefd5df6f69a@vates.tech>
To: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>, xen-devel@lists.xenproject.org
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Yann Dirson" <yann.dirson@vates.tech>
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com> <20241115115200.2824-8-alejandro.vallejo@cloud.com>
In-Reply-To: <20241115115200.2824-8-alejandro.vallejo@cloud.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.9fbbdb30330a4bae8dd0e343e4975130?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241125:md
Date: Mon, 25 Nov 2024 12:39:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Alejandro,

Le 15/11/2024 =C3=A0 12:51, Alejandro Vallejo a =C3=A9crit=C2=A0:
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
>   tools/rust/xenbindgen/src/c_lang.rs | 56 ++++++++++++++++++++++++-
>   tools/rust/xenbindgen/src/spec.rs   | 64 ++++++++++++++++++++++++++++-
>   2 files changed, 117 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/rust/xenbindgen/src/c_lang.rs b/tools/rust/xenbindgen/=
src/c_lang.rs
> index f05e36bb362f..597e0ed41362 100644
> --- a/tools/rust/xenbindgen/src/c_lang.rs
> +++ b/tools/rust/xenbindgen/src/c_lang.rs
> @@ -17,9 +17,10 @@
>   
>   use std::fmt::Write;
>   
> -use crate::spec::OutFileDef;
> +use crate::spec::{OutFileDef, StructDef, Typ};
>   
>   use convert_case::{Case, Casing};
> +use log::{debug, trace};
>   
>   /// An abstract indentation level. 0 is no indentation, 1 is [`INDENT_W=
IDTH`]
>   /// and so on.
> @@ -29,6 +30,39 @@ struct Indentation(usize);
>   /// Default width of each level of indentation
>   const INDENT_WIDTH: usize =3D 4;
>   
> +/// Create a C-compatible struct field. Without the terminating semicolo=
n.
> +fn structfield(typ: &Typ, name: &str) -> String {
> +    match typ {
> +        Typ::Ptr(x) =3D> {
> +            let t: &Typ =3D x;
> +            format!(
> +                "XEN_GUEST_HANDLE_64({}) {name}",
> +                match t {
> +                    Typ::U8 =3D> "uint8",
> +                    Typ::U16 =3D> "uint16",
> +                    Typ::U32 =3D> "uint32",
> +                    Typ::U64 =3D> "uint64_aligned_t",
> +                    Typ::I8 =3D> "int8",
> +                    Typ::I16 =3D> "int16",
> +                    Typ::I32 =3D> "int32",
> +                    Typ::I64 =3D> "int64_aligned_t",
> +                    _ =3D> panic!("foo {t:?}"),
> +                }
> +            )
> +        }
> +        Typ::Struct(x) =3D> format!("struct {x} {name}"),
> +        Typ::Array(x, len) =3D> format!("{}{name}[{len}]", structfield(x=
, "")),
> +        Typ::U8 =3D> format!("uint8_t {name}"),
> +        Typ::U16 =3D> format!("uint16_t {name}"),
> +        Typ::U32 =3D> format!("uint32_t {name}"),
> +        Typ::U64 =3D> format!("uint64_aligned_t {name}"),
> +        Typ::I8 =3D> format!("int8_t {name}"),
> +        Typ::I16 =3D> format!("int16_t {name}"),
> +        Typ::I32 =3D> format!("int32_t {name}"),
> +        Typ::I64 =3D> format!("int64_aligned_t {name}"),
> +    }
> +}
> +

I think _t are missing in the Ptr cases (we are currently generating 
XEN_GUEST_HANDLE_64(uint8) which I don't think is valid).
Aside that, wouldn't it be better to have a separate function for 
converting the type to its C representation ?

Something like

impl Typ { // or blanket trait
     fn c_repr(&self) -> String {
         match self {
             /* ... */
         }
     }
}

fn structfield(typ: &Typ, name: &str) -> String {
     format!("{} {name}", typ.c_repr());
}

We can also consider Typ::Struct or Typ::Array cases to call recursively 
to c_repr on its inner type to get its representation.

That way, we can have XEN_GUEST_HANDLE_64(struct something).

Cheers

Teddy



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


