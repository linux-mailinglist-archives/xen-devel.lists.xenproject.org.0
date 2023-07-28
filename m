Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5F7767257
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 18:47:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571521.895574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPQch-0000lA-GA; Fri, 28 Jul 2023 16:47:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571521.895574; Fri, 28 Jul 2023 16:47:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPQch-0000iU-CL; Fri, 28 Jul 2023 16:47:27 +0000
Received: by outflank-mailman (input) for mailman id 571521;
 Fri, 28 Jul 2023 16:47:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q8mr=DO=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1qPQcf-0000iO-Lk
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 16:47:25 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6cabac40-2d66-11ee-8613-37d641c3527e;
 Fri, 28 Jul 2023 18:47:22 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2b9b50be31aso35882551fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Jul 2023 09:47:22 -0700 (PDT)
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
X-Inumbo-ID: 6cabac40-2d66-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1690562842; x=1691167642;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=28ZaXS6e5z5psVXFhMUfYo92OIXSN7eSM59WhHstjtA=;
        b=RLKgMv573JgMjDnFi4ZBWO+twwaDAxxf0CZxuAXgsDhFSbltZTSXQHc9883gxcavnu
         SwuDIBjkF2uiuc9+tH/Aw0ppxrKAZvrKobUIUesRluxGE04OgEasVKWt26em8CjJ75oc
         BErCZDLoOJjut2c6e41GtMXR3yMUG5uCaSdiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690562842; x=1691167642;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=28ZaXS6e5z5psVXFhMUfYo92OIXSN7eSM59WhHstjtA=;
        b=P3yBS1EsOvjN3RzUPZ/GLmrMDR4X4HKM6whKKJxjB03wvWd9kDLiGBT9Df6Ipf7YiB
         Bhdvrof1EV4LaMqfUHGUaiToDsR9gurovbMEwkaVOc+4eC21Emr1TxJ9y4dKGJoVvTVB
         hBrEpBTT9WuZtTopPO3JTUFDRL1cEDt3EgU0LA1ftaMgM2WzHtL3m0ybsUVTqtde1rHL
         RSURXLRffFeW+jzpQOScTq0fclQZxwnSKSVVW7mJQVRPcPtb1KGtQyPq9zyQ7hrSfJze
         jKh4+g4gcQiEiPrM8V25EhlwWO5+3CS8QnjU93vYs87OxydjFEwzeEF7tDyNWTQ7Wuw6
         sReQ==
X-Gm-Message-State: ABy/qLYCH9ggyk5z/zRDnHfkEyby+80YVcekqFEz/rPEpkmawi3O7hQZ
	YDfjgpYoBvDmcOzfNAJCjdeCwPRIgLAHDM8tchG6DQ==
X-Google-Smtp-Source: APBJJlHJ5e//ZpaerwCIFdwVDAzwWgtFRBJ1NM7sehmfmNXyzQSxnEZ5+M1yp+sFhmcc+0kFKo4z382PYeePOtCiwYw=
X-Received: by 2002:a05:651c:156:b0:2b9:c644:415d with SMTP id
 c22-20020a05651c015600b002b9c644415dmr2086034ljd.46.1690562842209; Fri, 28
 Jul 2023 09:47:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230601142742.15489-1-olaf@aepfle.de> <20230601142742.15489-3-olaf@aepfle.de>
In-Reply-To: <20230601142742.15489-3-olaf@aepfle.de>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 28 Jul 2023 17:47:11 +0100
Message-ID: <CA+zSX=bZ5zo9cxWTq9s9QOUGZ-9NMEugewR90z1w8C++sruSVw@mail.gmail.com>
Subject: Re: [PATCH v1 2/7] xentrace: use correct output format for pit and rtc
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>, 
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Content-Type: multipart/alternative; boundary="000000000000ae471806018ed56d"

--000000000000ae471806018ed56d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for the delay here.

Just a couple of notes on the whole series.  First, you didn't CC me on 0/7
or 1/7.  Secondly, patch 7 seems to be corrupted (see e.g., Patchew's
attempt to apply the series [1]).

[1] https://patchew.org/Xen/20230601142742.15489-1-olaf@aepfle.de/

 -George

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
>  0x00084004  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  vlapic create [ delta =
=3D
> 0x%(2)08x%(1)08x , period =3D 0x%(4)08x%(3)08x, irq =3D %(5)d ]
>  0x00084005  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  hpet destroy [ tn =3D %(=
1)d
> ]
>  0x00084006  CPU%(cpu)d  %(tsc)d (+%(reltsc)8d)  pit destroy  [ ]
>

--000000000000ae471806018ed56d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry for the delay here.<div><br></div><div>Just a couple=
 of notes on the whole series.=C2=A0 First, you didn&#39;t CC me on 0/7 or =
1/7.=C2=A0 Secondly, patch 7 seems to be corrupted (see e.g., Patchew&#39;s=
 attempt to apply the series [1]).</div><div><br></div><div>[1]=C2=A0<a hre=
f=3D"https://patchew.org/Xen/20230601142742.15489-1-olaf@aepfle.de/">https:=
//patchew.org/Xen/20230601142742.15489-1-olaf@aepfle.de/</a></div><div><br>=
</div><div>=C2=A0-George</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Jun 1, 2023 at 3:28=E2=80=AFPM Olaf H=
ering &lt;<a href=3D"mailto:olaf@aepfle.de" target=3D"_blank">olaf@aepfle.d=
e</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>The input values were always 32bit.<br>
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
[ delta =3D 0x%(1)08x, period =3D 0x%(2)08x ]<br>
=C2=A00x00084004=C2=A0 CPU%(cpu)d=C2=A0 %(tsc)d (+%(reltsc)8d)=C2=A0 vlapic=
 create [ delta =3D 0x%(2)08x%(1)08x , period =3D 0x%(4)08x%(3)08x, irq =3D=
 %(5)d ]<br>
=C2=A00x00084005=C2=A0 CPU%(cpu)d=C2=A0 %(tsc)d (+%(reltsc)8d)=C2=A0 hpet d=
estroy [ tn =3D %(1)d ]<br>
=C2=A00x00084006=C2=A0 CPU%(cpu)d=C2=A0 %(tsc)d (+%(reltsc)8d)=C2=A0 pit de=
stroy=C2=A0 [ ]<br>
</blockquote></div>

--000000000000ae471806018ed56d--

