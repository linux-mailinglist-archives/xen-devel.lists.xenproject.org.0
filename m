Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C68456B04AE
	for <lists+xen-devel@lfdr.de>; Wed,  8 Mar 2023 11:38:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507987.782212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZrBT-0003Ic-RY; Wed, 08 Mar 2023 10:38:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507987.782212; Wed, 08 Mar 2023 10:38:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZrBT-0003Gr-Oi; Wed, 08 Mar 2023 10:38:11 +0000
Received: by outflank-mailman (input) for mailman id 507987;
 Wed, 08 Mar 2023 10:38:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WAAO=7A=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1pZrBS-0003Gl-N4
 for xen-devel@lists.xenproject.org; Wed, 08 Mar 2023 10:38:10 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50ccb20c-bd9d-11ed-956e-85ef70e17bfa;
 Wed, 08 Mar 2023 11:38:08 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id bi9so20760102lfb.2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Mar 2023 02:38:08 -0800 (PST)
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
X-Inumbo-ID: 50ccb20c-bd9d-11ed-956e-85ef70e17bfa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1678271888;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5wiR37Bfz55jTjnwRV1Vi5HrHY+NrM1YLrJN0P0JzgA=;
        b=jmJ5Gibinc9Ef31JHP/E8uUU8loGqpJQ3UPXRw+3A0+NxS3daI31XNp/GHL1QvlHEA
         kVpI01GVLnBBnSz75kvNemZYX1sfaZd3Z8Or8eoFhvGgVcR5z3Of4lW5Q9ewPCByGw2e
         Z615r1ul8/PwWh4RkAgKWYbRe+86WkJhZfMTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678271888;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5wiR37Bfz55jTjnwRV1Vi5HrHY+NrM1YLrJN0P0JzgA=;
        b=XeTcX1M/n5l+j+x33fZ5hefls4Y+heZGAD4kB4zPjMeYMkdwbiWbnUlNSf0LUTFc47
         mBNzSVu0oyiZGKjRAAlsKcvCclU+xwGAGnV4ypaLZeTwISX0QWucGVvCCr+yiv3tFzSS
         9Gh0Q/JZ8iQTt75qZvF+mc3+agQyG27y3fQh1f+cPaOi4WoGZIfu8X2dA4/8GsW4ZaBc
         ZkkMV4c2WlMHwv6JO7/Tups9nNE40ZKXM/mMoWfYUMQ/oV33WrPEXMPZcsCC0XOYhPNk
         lBLkWuG1rrISfqPfImDdyrRrTTDmOrtYkNId9Q8eFomXG0f8tAhwFVgQOBtvy6hDRqyr
         WWeA==
X-Gm-Message-State: AO0yUKWCf/qJ7Alvs/kd+Bd8JXaGilhdFInaN7jxIQ43/MpB9YFZdtlY
	XdOhJuFy8BUl3p36hSsXH9i4rKed0io7dM8R+v2O7Q==
X-Google-Smtp-Source: AK7set9CPNiMh7eg8ziVZRGkbDbP+UPuAvGyjmWxrnd3umVaLEz0JNG5cp56sQYU2dQY2kX9olrURK1TihJ9O057Wh0=
X-Received: by 2002:a05:6512:488:b0:4dd:a058:f088 with SMTP id
 v8-20020a056512048800b004dda058f088mr5317232lfq.8.1678271887672; Wed, 08 Mar
 2023 02:38:07 -0800 (PST)
MIME-Version: 1.0
References: <072cf7c6-9f43-6507-bf8c-a79ceedf3000@suse.com>
In-Reply-To: <072cf7c6-9f43-6507-bf8c-a79ceedf3000@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 8 Mar 2023 10:37:56 +0000
Message-ID: <CA+zSX=YEsdgH6kzpqh+UvH1PMPPotzVUDSG_p-bHefUPX93ntw@mail.gmail.com>
Subject: Re: [PATCH RFC] bunzip: work around gcc13 warning
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Type: multipart/alternative; boundary="000000000000b39a1b05f6611fde"

--000000000000b39a1b05f6611fde
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 3, 2023 at 7:29=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:

> While provable that length[0] is always initialized (because symCount
> cannot be zero), upcoming gcc13 fails to recognize this and warns about
> the unconditional use of the value immediately following the loop.
>
> See also https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D106511.
>
> Reported-by: Martin Li=C5=A1ka <martin.liska@suse.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> RFC: We've cloned this code from Linux and the code is unchanged there.
>      Therefore the same issue should exist there, and we may better get
>      whatever workaround is going to be applied there. But I'm unaware
>      of the issue, so far, having been observed in and reported against
>      Linux. This may be because they disable the maybe-uninitialized
>      warning by default, and they re-enable it only when building with
>      W=3D2.
>
> --- a/xen/common/bunzip2.c
> +++ b/xen/common/bunzip2.c
> @@ -233,7 +233,7 @@ static int __init get_next_block(struct
>                    becomes negative, so an unsigned inequality catches
>                    it.) */
>                 t =3D get_bits(bd, 5)-1;
> -               for (i =3D 0; i < symCount; i++) {
> +               for (length[0] =3D i =3D 0; i < symCount; i++) {
>

My main comment here is that nobody looking at this code will immediately
think, "Oh, I bet this is to work around a gcc bug that can't tell that
length[0] will always be initialized".  I'd put it in a separate line, with
a comment explaining the situation.

 -George

--000000000000b39a1b05f6611fde
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 3, 2023 at 7:29=E2=80=AFA=
M Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Whi=
le provable that length[0] is always initialized (because symCount<br>
cannot be zero), upcoming gcc13 fails to recognize this and warns about<br>
the unconditional use of the value immediately following the loop.<br>
<br>
See also <a href=3D"https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D106511" =
rel=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org/bugzilla/show_bug.=
cgi?id=3D106511</a>.<br>
<br>
Reported-by: Martin Li=C5=A1ka &lt;<a href=3D"mailto:martin.liska@suse.com"=
 target=3D"_blank">martin.liska@suse.com</a>&gt;<br>
Signed-off-by: Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" target=
=3D"_blank">jbeulich@suse.com</a>&gt;<br>
---<br>
RFC: We&#39;ve cloned this code from Linux and the code is unchanged there.=
<br>
=C2=A0 =C2=A0 =C2=A0Therefore the same issue should exist there, and we may=
 better get<br>
=C2=A0 =C2=A0 =C2=A0whatever workaround is going to be applied there. But I=
&#39;m unaware<br>
=C2=A0 =C2=A0 =C2=A0of the issue, so far, having been observed in and repor=
ted against<br>
=C2=A0 =C2=A0 =C2=A0Linux. This may be because they disable the maybe-unini=
tialized<br>
=C2=A0 =C2=A0 =C2=A0warning by default, and they re-enable it only when bui=
lding with<br>
=C2=A0 =C2=A0 =C2=A0W=3D2.<br>
<br>
--- a/xen/common/bunzip2.c<br>
+++ b/xen/common/bunzip2.c<br>
@@ -233,7 +233,7 @@ static int __init get_next_block(struct<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0become=
s negative, so an unsigned inequality catches<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0it.) *=
/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t =3D get_bits(bd, =
5)-1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt=
; symCount; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (length[0] =3D =
i =3D 0; i &lt; symCount; i++) {<br></blockquote><div><br></div><div>My mai=
n comment here is that nobody looking at this code will immediately think, =
&quot;Oh, I bet this is to work around a gcc bug that can&#39;t tell that l=
ength[0] will always be initialized&quot;.=C2=A0 I&#39;d put it in a separa=
te line, with a comment explaining the situation.</div><div><br></div><div>=
=C2=A0-George</div><div>=C2=A0</div></div></div>

--000000000000b39a1b05f6611fde--

