Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 840208B1EDF
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 12:13:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711983.1112354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzw6D-0000lx-5h; Thu, 25 Apr 2024 10:13:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711983.1112354; Thu, 25 Apr 2024 10:13:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzw6D-0000kU-2P; Thu, 25 Apr 2024 10:13:05 +0000
Received: by outflank-mailman (input) for mailman id 711983;
 Thu, 25 Apr 2024 10:13:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kZZq=L6=cloud.com=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1rzw6B-0000k8-7z
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 10:13:03 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 655a2564-02ec-11ef-b4bb-af5377834399;
 Thu, 25 Apr 2024 12:13:00 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a5200afe39eso84915366b.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2024 03:13:00 -0700 (PDT)
Received: from smtpclient.apple ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 hy25-20020a1709068a7900b00a4e03c28fd5sm9391565ejc.43.2024.04.25.03.12.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Apr 2024 03:13:00 -0700 (PDT)
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
X-Inumbo-ID: 655a2564-02ec-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1714039980; x=1714644780; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HTY0/4d6v+brvzu1H17q3AeanK8PkY208+oWQiPYkb4=;
        b=Zuqjv1Cc6lmZ/M7CACRy3DoLyqTmkrWrokqU4FZA2stY+eh+GIuyUH/PFdYjPR+8QL
         Q/mojMzOKtyfrbMMroi/QFq7aNOKd1k59zptCEOCBJS4v6HD3P09Lgu1bJThiIx5BLrB
         cKEmojz16LI4sHRefEULXgmcTeYKZ0gpA3UQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714039980; x=1714644780;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HTY0/4d6v+brvzu1H17q3AeanK8PkY208+oWQiPYkb4=;
        b=YiMiG8qffediRlInusaiXrJ2Uaq/z1E3MQUWTQGcc0IMTU4hGdM1UW03YX123JEIv9
         ngAaf0yi4vorM3adzR5Nng2UGGpaLNWX9Kn/9MCUPfp4UG4LzEtqaAz8Ki34+QCjJksA
         ZLP1xGe6F7yfM1Ch2SuimznhlRDil4Ftz5d2mA14+TIE4Zw1DDrSwaeXruxcL/pimLIG
         nHPiq8cc6n8OTPa3yZekYeGgu8d8xoZAYFDTsAm11XbF6mS2eRvyfgVb1p9D9tmNYpbe
         YM2Pi3uMzI15lYrODuPHAjD+o7xI6HgofZAqRcXkaAAwIxJ6ZmQ8s2Re8CAJhQ50QpBm
         jDTQ==
X-Gm-Message-State: AOJu0YwnLThmXORX6MXqWPtpaKS6zbl30ERszNzKRsRz/a4F6ovNT8pd
	N9lXl8d52gVBpR7dIYtN2atMWLEO9NCQXAJqpDUYeWRN9xK5pcqlSGiANu0LvNQ=
X-Google-Smtp-Source: AGHT+IEcQuh862Qip8HTt41welKmp5F7SL9SP+Z4nMU6756fUrcN5l9CIFz77eQ94nSlP0NxvmqqoA==
X-Received: by 2002:a17:907:7e86:b0:a55:ac7c:4321 with SMTP id qb6-20020a1709077e8600b00a55ac7c4321mr6106638ejc.49.1714039980379;
        Thu, 25 Apr 2024 03:13:00 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH v1] tools/ocaml: fix warnings
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <bc752eab0aafd7981634e4f5be7a53f49e1f3cef.1711556875.git.edwin.torok@cloud.com>
Date: Thu, 25 Apr 2024 11:12:49 +0100
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 David Scott <dave@recoil.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A1809DA0-8E73-4375-A98C-B92024B2EDF5@cloud.com>
References: <bc752eab0aafd7981634e4f5be7a53f49e1f3cef.1711556875.git.edwin.torok@cloud.com>
To: =?utf-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
X-Mailer: Apple Mail (2.3774.500.171.1.1)



> On 27 Mar 2024, at 16:30, Edwin T=C3=B6r=C3=B6k =
<edwin.torok@cloud.com> wrote:
>=20
> Do not rely on the string values of the `Failure` exception,
> but use the `_opt` functions instead.
>=20
> Signed-off-by: Edwin T=C3=B6r=C3=B6k <edwin.torok@cloud.com>
> ---
> tools/ocaml/xenstored/config.ml | 20 +++++++++++---------
> 1 file changed, 11 insertions(+), 9 deletions(-)
>=20
> diff --git a/tools/ocaml/xenstored/config.ml =
b/tools/ocaml/xenstored/config.ml
> index 95ef745a54..e0df236f73 100644
> --- a/tools/ocaml/xenstored/config.ml
> +++ b/tools/ocaml/xenstored/config.ml
> @@ -83,25 +83,27 @@ let validate cf expected other =3D
>   let err =3D ref [] in
>   let append x =3D err :=3D x :: !err in
>   List.iter (fun (k, v) ->
> +      let parse ~err_msg parser v f =3D
> +        match parser v with
> +        | None -> append (k, err_msg)
> +        | Some r -> f r
> +      in
>       try
>         if not (List.mem_assoc k expected) then
>           other k v
>         else let ty =3D List.assoc k expected in
>           match ty with
>           | Unit f       -> f ()
> -          | Bool f       -> f (bool_of_string v)
> +          | Bool f       -> parse ~err_msg:"expect bool arg" =
bool_of_string_opt v f
>           | String f     -> f v
> -          | Int f        -> f (int_of_string v)
> -          | Float f      -> f (float_of_string v)
> -          | Set_bool r   -> r :=3D (bool_of_string v)
> +          | Int f        -> parse ~err_msg:"expect int arg" =
int_of_string_opt v f
> +          | Float f      -> parse ~err_msg:"expect float arg" =
float_of_string_opt v f
> +          | Set_bool r   -> parse ~err_msg:"expect bool arg" =
bool_of_string_opt v (fun x -> r :=3D x)
>           | Set_string r -> r :=3D v
> -          | Set_int r    -> r :=3D int_of_string v
> -          | Set_float r  -> r :=3D (float_of_string v)
> +          | Set_int r    -> parse ~err_msg:"expect int arg" =
int_of_string_opt v (fun x -> r:=3D x)
> +          | Set_float r  -> parse ~err_msg:"expect float arg" =
float_of_string_opt v (fun x -> r :=3D x)
>       with
>       | Not_found                 -> append (k, "unknown key")
> -      | Failure "int_of_string"   -> append (k, "expect int arg")
> -      | Failure "bool_of_string"  -> append (k, "expect bool arg")
> -      | Failure "float_of_string" -> append (k, "expect float arg")
>       | exn                       -> append (k, Printexc.to_string =
exn)
>     ) cf;
>   if !err !=3D [] then raise (Error !err)
> --=20
> 2.44.0
>=20


Acked-by: Christian Lindig <christian.lindig@cloud.com>


