Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0464C88E811
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 16:12:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698596.1090471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpUw5-0004to-GJ; Wed, 27 Mar 2024 15:11:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698596.1090471; Wed, 27 Mar 2024 15:11:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpUw5-0004r5-D1; Wed, 27 Mar 2024 15:11:29 +0000
Received: by outflank-mailman (input) for mailman id 698596;
 Wed, 27 Mar 2024 15:11:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VkeH=LB=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1rpUw3-0004pe-W9
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 15:11:28 +0000
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [2607:f8b0:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47378973-ec4c-11ee-a1ef-f123f15fe8a2;
 Wed, 27 Mar 2024 16:11:25 +0100 (CET)
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-3bbbc6e51d0so4029052b6e.3
 for <xen-devel@lists.xenproject.org>; Wed, 27 Mar 2024 08:11:25 -0700 (PDT)
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
X-Inumbo-ID: 47378973-ec4c-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1711552284; x=1712157084; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RYLFJKvrPbWM1nm93Sy2/N4e0Xdz2Sb0AN5azVWzbGo=;
        b=FBluUFs43cCEn91WdfkEhtzzmgVYvlDhfqDUyYtcFxIuCRQGqL2lpIhpoOWCbjP44i
         UGRNBdRk74X2JHdujia9TZJs1RT2PjgCa2nPHTCNO17R4zm6jTSoAz4EygDPCI1ecsvt
         N93wLL5ZOeAI5TKmB99NIYYRgdvfv9Q5tsQ1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711552284; x=1712157084;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RYLFJKvrPbWM1nm93Sy2/N4e0Xdz2Sb0AN5azVWzbGo=;
        b=brSDtDS8i/GRqx95krwLip46U7y+VD9f46sctm2HZmJ9QWXH+bJ+rATgkE6Kk0uvTg
         cyfoEz696s87HSeeYQvUG559iATntO+nDUfKPrJSyxNm36IK25hzwv9cqHzu2LZ7tFSG
         hvmWCIeNAsox3vXdlqk5W5S5grv7rKyVTJ9DU6nM8uyArtnqZNRwFn9Bgv328WuAnWbF
         veG5Y5QfQPIrL3BmL4eIiRVn4TCGuElOzTtuYuf5ZXtHQUvYXIwEly/3hWQBzhd76Faq
         9N0EYhSoLCyUGvxT3tdD4+kC55ydNA0rf3IjQqFgCQi8HDXKT4cMWd7iGLGchx96ocHc
         cJ4Q==
X-Gm-Message-State: AOJu0YzcrwSlgBIQKSxjMc7uD4uha4yYxXw2BROhet/A0tMltKPTOapl
	pZD1UU3smOJV33VjlfxKSniccpWvD3/5QirJcshojLHcrzfaw/sakiVIeEzPYi/TP0+pSCoZSIw
	0bXot6Z6Dr4PnG6tebqvcSzFelN5ECnPNg+GaNQ==
X-Google-Smtp-Source: AGHT+IHnu7QA6eocUrNTbEezhP4M0pi3STJtZqt74U8RTJx4uQZevElOOj9Lk2RcY65FOVCDKWT65d73Efki/NHVy5c=
X-Received: by 2002:a05:6808:13d0:b0:3c3:520b:d163 with SMTP id
 d16-20020a05680813d000b003c3520bd163mr221897oiw.49.1711552284669; Wed, 27 Mar
 2024 08:11:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240226104829.1044479-1-andrew.cooper3@citrix.com>
In-Reply-To: <20240226104829.1044479-1-andrew.cooper3@citrix.com>
From: Edwin Torok <edwin.torok@cloud.com>
Date: Wed, 27 Mar 2024 15:11:13 +0000
Message-ID: <CAEfZLvnc+cf6XRqKNcaymd_7pDgw-1Lu10sjDr_jpzNuNhc3YQ@mail.gmail.com>
Subject: Re: [PATCH] tools/oxenstored: Re-format
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Christian Lindig <christian.lindig@citrix.com>, Rob Hoes <Rob.Hoes@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 10:48=E2=80=AFAM Andrew Cooper
<andrew.cooper3@citrix.com> wrote:
>
> Rerun make format.

Looks good, although not sure whether whitespace will be correctly
preserved in email, recommend using git to push the changes.
Reviewed-by: Edwin T=C3=B6r=C3=B6k <edwin.torok@cloud.com>

>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Christian Lindig <christian.lindig@citrix.com>
> CC: Edwin T=C3=B6r=C3=B6k <edwin.torok@cloud.com>
> CC: Rob Hoes <Rob.Hoes@citrix.com>
> ---
>  tools/ocaml/xenstored/quota.ml | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/tools/ocaml/xenstored/quota.ml b/tools/ocaml/xenstored/quota=
.ml
> index 1f652040d898..082cd25f26fc 100644
> --- a/tools/ocaml/xenstored/quota.ml
> +++ b/tools/ocaml/xenstored/quota.ml
> @@ -55,13 +55,13 @@ let _check quota id size =3D
>      raise Data_too_big
>    );
>    if id > 0 then
> -  try
> -    let entry =3D DomidMap.find id quota.cur in
> -    if entry >=3D quota.maxent then (
> -      warn "domain %u cannot create entry: quota reached" id;
> -      raise Limit_reached
> -    )
> -  with Not_found -> ()
> +    try
> +      let entry =3D DomidMap.find id quota.cur in
> +      if entry >=3D quota.maxent then (
> +        warn "domain %u cannot create entry: quota reached" id;
> +        raise Limit_reached
> +      )
> +    with Not_found -> ()
>
>  let check quota id size =3D
>    if !activate then
> @@ -88,4 +88,4 @@ let merge orig_quota mod_quota dest_quota =3D
>      | diff -> update_entry dest id diff (* update with [x=3Dx+diff] *)
>    in
>    {dest_quota with cur =3D DomidMap.fold fold_merge mod_quota.cur dest_q=
uota.cur}
> -  (* dest_quota =3D dest_quota + (mod_quota - orig_quota) *)
> +(* dest_quota =3D dest_quota + (mod_quota - orig_quota) *)
>
> base-commit: 8de3afc0b402bc17f65093a53e5870862707a8c7
> --
> 2.30.2
>

