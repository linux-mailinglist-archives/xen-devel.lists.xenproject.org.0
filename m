Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2B59E9AB3
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 16:39:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851555.1265607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKfqN-0008T6-HQ; Mon, 09 Dec 2024 15:38:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851555.1265607; Mon, 09 Dec 2024 15:38:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKfqN-0008Pz-EF; Mon, 09 Dec 2024 15:38:43 +0000
Received: by outflank-mailman (input) for mailman id 851555;
 Mon, 09 Dec 2024 15:38:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VMJQ=TC=cloud.com=andrii.sultanov@srs-se1.protection.inumbo.net>)
 id 1tKfqM-0008Pd-2X
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 15:38:42 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9d145fb-b643-11ef-99a3-01e77a169b0f;
 Mon, 09 Dec 2024 16:38:40 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-3011c7b39c7so16051461fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 07:38:40 -0800 (PST)
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
X-Inumbo-ID: a9d145fb-b643-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1733758719; x=1734363519; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ccC9Eq8UwboddNPj6Ku02PI/oYVoN5BHgAe0Mril9cI=;
        b=fMnn9P5Rd/dYyU2oYDcDyg1JpM3kcOYr/KTwluiHHSrlj+9aHucTgs/T0yk9470ALC
         1Et6nvo4cUSShPBBVeTvHY/163379csRyDT8l0pClM7tWbicBYBZBC0tcM7tCqJOgk3r
         X9ewwyxDd+N66ClvpWQGAysI+z+ZGafWmckLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733758719; x=1734363519;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ccC9Eq8UwboddNPj6Ku02PI/oYVoN5BHgAe0Mril9cI=;
        b=v0umk2Pqx+4WG/0WyicdJNkx4x1cwDhSZSI0jy1dY/lP3+9Ff/53BQ2hjTYhDfzr2U
         AIcYxtl0Qryq9F2q2iOkm4pRFONaXU4p700BMz+l3XR27yh9KK8NBgk4nrhgxAZQ1pE0
         y+4rgABaG3A67F5BXnfWY7sy/EFjMWhzROR6ZlmWgvVwpLlG+J0LMeNSRtbnb4hBmRvI
         P1jLKql/5m9D8Z+fjkat+WzkqghAkbOzfy7tBhYYw7aBegstEEGrZJC5xDJfMt60/OU0
         1GLjdGg7Si5Gis+B9k24LQVIYxdplVgM16F0yEH1O00uWs0WpI11HG1nsWcH+9dJ5jYz
         NRkA==
X-Gm-Message-State: AOJu0Yyx3mDEK5hC16uRJNXgnXyY/9DTSFElelWVzqV+dTcnE57sxrw9
	L3vwMfZ/wGQJdS2TyyOlrOikNRrGINvLNYF++Xe1AfVM4ljEujgDJGJ+pFA19tibUtDkJGh8Wai
	3uPf/Js0sc9FBcqk2ZToX3SxqsPBA+iJNxj76CHSJvj492juf
X-Gm-Gg: ASbGnctcYEjgoMursJnKvCclQOG/Q+Se1WnLsSgDHtIO3G5UrUaUXIJ1fBhCIRJq4nm
	Gyf/ZAoVqLTgE/HQbQZHg9PwHI/8Ljw==
X-Google-Smtp-Source: AGHT+IGfX+1+uMO34+9NNJ5ZALAWJ/mnl+JSd/htRbdoc0N9tcHVvtamorOn9xzmseheuIgykuqe4sS2XnH1U6Wo7PM=
X-Received: by 2002:a2e:bccb:0:b0:2ff:55f0:ae4b with SMTP id
 38308e7fff4ca-3002fc2585amr67716231fa.21.1733758718815; Mon, 09 Dec 2024
 07:38:38 -0800 (PST)
MIME-Version: 1.0
References: <cover.1733757256.git.andrii.sultanov@cloud.com>
In-Reply-To: <cover.1733757256.git.andrii.sultanov@cloud.com>
From: Andrii Sultanov <andrii.sultanov@cloud.com>
Date: Mon, 9 Dec 2024 15:38:27 +0000
Message-ID: <CAAa3AOMFGCd4Jt0HWKbXhRw0BbeTnauF_nQEbLcGUWaUxsJ0zg@mail.gmail.com>
Subject: Re: [PATCH v1 0/1] Fix rpath handling in OCaml's Makefile.rules
To: xen-devel@lists.xenproject.org
Cc: Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, 
	Anthony PERARD <anthony.perard@vates.tech>
Content-Type: multipart/alternative; boundary="0000000000008fd77b0628d828a3"

--0000000000008fd77b0628d828a3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

DO NOT COMMIT - this patch is not correct, and I will send an updated
version later.

On Mon, Dec 9, 2024 at 3:16=E2=80=AFPM Andrii Sultanov <andrii.sultanov@clo=
ud.com>
wrote:

> As reported by Nix's Xen team, OCaml stub libs would embed an absolute
> rpath in the binaries, which was picked up on by patchelf. This is a
> symptom of improper handling of -rpath-link in the first place, so
> correct that and get rid of the issue.
>
> Andrii Sultanov (1):
>   tools/ocaml: Specify rpath correctly for ocamlmklib
>
>  tools/ocaml/Makefile.rules | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> --
> 2.39.5
>
>

--0000000000008fd77b0628d828a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">DO NOT COMMIT - this patch is not correct, and I will send=
 an updated version later.<br></div><br><div class=3D"gmail_quote gmail_quo=
te_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 9, 2024 at =
3:16=E2=80=AFPM Andrii Sultanov &lt;<a href=3D"mailto:andrii.sultanov@cloud=
.com">andrii.sultanov@cloud.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">As reported by Nix&#39;s Xen team, OCaml s=
tub libs would embed an absolute<br>
rpath in the binaries, which was picked up on by patchelf. This is a<br>
symptom of improper handling of -rpath-link in the first place, so<br>
correct that and get rid of the issue.<br>
<br>
Andrii Sultanov (1):<br>
=C2=A0 tools/ocaml: Specify rpath correctly for ocamlmklib<br>
<br>
=C2=A0tools/ocaml/Makefile.rules | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
-- <br>
2.39.5<br>
<br>
</blockquote></div>

--0000000000008fd77b0628d828a3--

