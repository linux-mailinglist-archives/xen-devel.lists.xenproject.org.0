Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEB07676D6
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 22:18:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571565.895725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPTuC-0005Dl-Q1; Fri, 28 Jul 2023 20:17:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571565.895725; Fri, 28 Jul 2023 20:17:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPTuC-0005AY-Lm; Fri, 28 Jul 2023 20:17:44 +0000
Received: by outflank-mailman (input) for mailman id 571565;
 Fri, 28 Jul 2023 20:17:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q8mr=DO=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1qPTuB-0005AS-6I
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 20:17:43 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd9e8538-2d83-11ee-8613-37d641c3527e;
 Fri, 28 Jul 2023 22:17:41 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2b933bbd3eeso38955721fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 28 Jul 2023 13:17:40 -0700 (PDT)
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
X-Inumbo-ID: cd9e8538-2d83-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1690575460; x=1691180260;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U3QWLF2AUSklfD2C+7y6eRcnqsAug7EPzzxUNoEFpqI=;
        b=PhW1kJG7lLu+vPkjk1yflCppCWJWK+PGIVdbaCT4ZmrJayi2CMLk0wZejdr5JnprlT
         S2ah0LTrqZDJM5r75gcZvhUCwlIONc8Kw4zBQOKBfTTWNE0z3U640m20M3OILPsQf6ND
         YiSlgD+G1UKFxsNji8/L167b7K3nXymsXLYX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690575460; x=1691180260;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U3QWLF2AUSklfD2C+7y6eRcnqsAug7EPzzxUNoEFpqI=;
        b=Pf3SOyRcOIm93qrkJ5VXU0DlPBfp9gafOnY9zzG4F2W2tLJr0BHkQ5WutfbE+gxwkH
         pmZqyBPZBlObt1Jn4IyuAZjnVFgcqAv8DWVn4TWHz/UiTffXU+pZFrPx1O8JZlw0XxO+
         Tfd5FDU2idsPbvKEzHCUWArYYs/0UYjt2+kMHxfjWqF6Nur3WhwaakD+kVl9hZl0d0qr
         v7QnM0ejc8d5+E3VyzkPeUkI9dBrNuVyQt6Pf54vDxK9tFgjE/NeGMNF74/0IgOBEW7o
         S9fFZotMfkVKLhczbUqL/ElzhvweohQ2t0y6SP0T69/vyaHIh7iMYWPGreZNPfUv49l/
         +YNQ==
X-Gm-Message-State: ABy/qLYLpS4NZhmZGagF5539RjY9Z2wFId8fIJxjmLg900ZuLN/2VHJa
	NCOuijyL2E6OK/jpaOw+/zpAsCrwqamGjwEN5BEk5Q==
X-Google-Smtp-Source: APBJJlFBIf2oHPb9V31JFysbR8cveQUnRh7o6x4lzpcqtFY0fMNndd2F8uyACsmFRUr0JPTv9/bk6JO3cRFvZrJnQtw=
X-Received: by 2002:a2e:9044:0:b0:2b9:575e:5298 with SMTP id
 n4-20020a2e9044000000b002b9575e5298mr3032786ljg.13.1690575460397; Fri, 28 Jul
 2023 13:17:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230601142742.15489-1-olaf@aepfle.de> <20230601142742.15489-3-olaf@aepfle.de>
In-Reply-To: <20230601142742.15489-3-olaf@aepfle.de>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 28 Jul 2023 21:17:29 +0100
Message-ID: <CA+zSX=b2ArcQ2RxAKF=auhQ2=nMHOYn4Rtsw50cFe9Jv13Q=RQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/7] xentrace: use correct output format for pit and rtc
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>, 
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Content-Type: multipart/alternative; boundary="000000000000c884da060191c51d"

--000000000000c884da060191c51d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 1, 2023 at 3:28=E2=80=AFPM Olaf Hering <olaf@aepfle.de> wrote:

> The input values were always 32bit.
>
> Fixes 55ee5dea32 ("xentrace: add TRC_HVM_EMUL")
>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> ---
>  tools/xentrace/formats | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tools/xentrace/formats b/tools/xentrace/formats
> index 0fcc327a40..afb5ee0112 100644
> --- a/tools/xentrace/formats
> +++ b/tools/xentrace/formats
> @@ -211,8 +211,8 @@
>  0x00802008  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  do_irq [ irq =3D %(1)d,
> began =3D %(2)dus, ended =3D %(3)dus ]
>
>  0x00084001  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  hpet create [ tn =3D %(1=
)d,
> irq =3D %(2)d, delta =3D 0x%(4)08x%(3)08x, period =3D 0x%(6)08x%(5)08x ]
> -0x00084002  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  pit create [ delta =3D
> 0x%(1)016x, period =3D 0x%(2)016x ]
> -0x00084003  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  rtc create [ delta =3D
> 0x%(1)016x , period =3D 0x%(2)016x ]
> +0x00084002  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  pit create [ delta =3D
> 0x%(1)08x, period =3D 0x%(2)08x ]
> +0x00084003  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  rtc create [ delta =3D
> 0x%(1)08x, period =3D 0x%(2)08x ]
>

Looks good.  While we're here, any reason not to s/create/start/; to match
up with the trace definition?

Either way:

Reviewed-by: George Dunlap <george.dunlap@cloud.com>

--000000000000c884da060191c51d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 1, 2023 at 3:28=E2=80=AFP=
M Olaf Hering &lt;<a href=3D"mailto:olaf@aepfle.de">olaf@aepfle.de</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The input=
 values were always 32bit.<br>
<br>
Fixes 55ee5dea32 (&quot;xentrace: add TRC_HVM_EMUL&quot;)<br>
<br>
Signed-off-by: Olaf Hering &lt;<a href=3D"mailto:olaf@aepfle.de" target=3D"=
_blank">olaf@aepfle.de</a>&gt;<br>
---<br>
=C2=A0tools/xentrace/formats | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/tools/xentrace/formats b/tools/xentrace/formats<br>
index 0fcc327a40..afb5ee0112 100644<br>
--- a/tools/xentrace/formats<br>
+++ b/tools/xentrace/formats<br>
@@ -211,8 +211,8 @@<br>
=C2=A00x00802008=C2=A0 CPU%(cpu)d=C2=A0 %(tsc)d (+%(reltsc)8d)=C2=A0 do_irq=
 [ irq =3D %(1)d, began =3D %(2)dus, ended =3D %(3)dus ]<br>
<br>
=C2=A00x00084001=C2=A0 CPU%(cpu)d=C2=A0 %(tsc)d (+%(reltsc)8d)=C2=A0 hpet c=
reate [ tn =3D %(1)d, irq =3D %(2)d, delta =3D 0x%(4)08x%(3)08x, period =3D=
 0x%(6)08x%(5)08x ]<br>
-0x00084002=C2=A0 CPU%(cpu)d=C2=A0 %(tsc)d (+%(reltsc)8d)=C2=A0 pit create =
[ delta =3D 0x%(1)016x, period =3D 0x%(2)016x ]<br>
-0x00084003=C2=A0 CPU%(cpu)d=C2=A0 %(tsc)d (+%(reltsc)8d)=C2=A0 rtc create =
[ delta =3D 0x%(1)016x , period =3D 0x%(2)016x ]<br>
+0x00084002=C2=A0 CPU%(cpu)d=C2=A0 %(tsc)d (+%(reltsc)8d)=C2=A0 pit create =
[ delta =3D 0x%(1)08x, period =3D 0x%(2)08x ]<br>
+0x00084003=C2=A0 CPU%(cpu)d=C2=A0 %(tsc)d (+%(reltsc)8d)=C2=A0 rtc create =
[ delta =3D 0x%(1)08x, period =3D 0x%(2)08x ]<br></blockquote><div><br></di=
v><div>Looks good.=C2=A0 While we&#39;re here, any reason not to s/create/s=
tart/; to match up with the trace definition?</div><div><br></div><div>Eith=
er way:</div><div><br></div><div>Reviewed-by: George Dunlap &lt;<a href=3D"=
mailto:george.dunlap@cloud.com">george.dunlap@cloud.com</a>&gt;</div></div>=
</div>

--000000000000c884da060191c51d--

