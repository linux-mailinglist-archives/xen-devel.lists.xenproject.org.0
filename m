Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E15B973CB77
	for <lists+xen-devel@lfdr.de>; Sat, 24 Jun 2023 16:55:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554590.865874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qD4ee-0004gU-2i; Sat, 24 Jun 2023 14:54:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554590.865874; Sat, 24 Jun 2023 14:54:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qD4ed-0004d9-Vj; Sat, 24 Jun 2023 14:54:23 +0000
Received: by outflank-mailman (input) for mailman id 554590;
 Sat, 24 Jun 2023 14:54:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4T8M=CM=gmail.com=yshxxsjt715@srs-se1.protection.inumbo.net>)
 id 1qD4ec-0004cy-6Y
 for xen-devel@lists.xenproject.org; Sat, 24 Jun 2023 14:54:22 +0000
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [2607:f8b0:4864:20::1129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb600a57-129e-11ee-8611-37d641c3527e;
 Sat, 24 Jun 2023 16:54:18 +0200 (CEST)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-56ff9cc91b4so16659287b3.0; 
 Sat, 24 Jun 2023 07:54:13 -0700 (PDT)
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
X-Inumbo-ID: fb600a57-129e-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687618452; x=1690210452;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ve5c/XjiFN9IjAHvrJUqy7C78NTNJD/ufGwlceBYROE=;
        b=bR/YtHXL0OVgiPuZuB1bKRlm/wn5UC6Kzaga4iDkxCyDmyJ7cOA8Wdlzx4PR/Kd7DS
         LbB6S2Rs2mzAEuFtRVSJBSrZPriEP7po/s2/VpAKFkPw2vCR3JJMkO5PnSusXI/WqL3L
         Cv+B4/Cd4ne62PgurJoypC5lOcQS7kITEsF8RiklORn/FbzlxK3eed9g1OpvXJulp0VW
         qlK+SlTRlvNe5xmWCxKDENRvxlcZe3pphjYlWzlJs4k2m74MQxH/YMKTmTI01cOUIc9L
         qFS4JvTgZGaMXEB4Ex1P4GAg1OUvqg/mmz9cp3a2anpzldeSLzaEzT33TfAk64fivW/z
         r9SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687618452; x=1690210452;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ve5c/XjiFN9IjAHvrJUqy7C78NTNJD/ufGwlceBYROE=;
        b=RvnOVe9ZWL1MYiHM6eNY0DsDUb8nsXHG54Q0NoEwgm0K5+NTA03PD1NXR68ktQQY/e
         49h7bBlgmsybGu+vdc7CskefONW/f6taqV60QEwdm7K/BsAXS3C8T4sqPq8NrwxttaeB
         KABjclwB1en6WdONlm/Pfq+X1By6nsGFs1VPS+uUXJUVR0KoG3iAtc8qb9JB/Tz881ii
         lB29lYHDEVO5FAT9WjLRmcE502gSjNN6DouO4QKx/UQ8x4vtf+uyKiI4A+151cm/QrRX
         oQ+pNSo8Mj0dpou/FXvJ/nIRQ/PUmV7yZ6r63rhLuXoiVQ7CdDlHG42kwA1p2/EzKvV0
         vuMQ==
X-Gm-Message-State: AC+VfDxFnmSPg4iJhnS5BKm9elecSff+uXs4OfMAaiwhRhjh/q2d9fj/
	Yx9trXg0+DJ+lgrD57gTwnN0nF3qkT556pu4DJg=
X-Google-Smtp-Source: ACHHUZ4C82ZdQBcUPr3jcGpx6HFMgmOOyDUrekM1bdzk+rC2zJZW6eKzmbZs8MvL84QrbnoorQWQc9tbgq6M+zPBbZY=
X-Received: by 2002:a81:8007:0:b0:56d:40da:1fc2 with SMTP id
 q7-20020a818007000000b0056d40da1fc2mr26921176ywf.50.1687618452231; Sat, 24
 Jun 2023 07:54:12 -0700 (PDT)
MIME-Version: 1.0
References: <CALqm=ddiMwWvdYMgyCtaKMocUEkEJyTgSQup9wJiXm4PrcDuVw@mail.gmail.com>
 <alpine.DEB.2.22.394.2306081537590.3803068@ubuntu-linux-20-04-desktop>
 <e729d60e-b290-dec3-e35b-65c24ffbfda6@xen.org> <CALqm=ddc3BhqRQmPDjnZ3TeMEXPTMUDfj7JCSj0QEDxnMaKLvw@mail.gmail.com>
 <78899eac-9de8-3626-8f40-98f993984f95@xen.org> <CALqm=dfrudbnsy7RdP9GdSmyO2m9JN=8mKD7wQvz2WBv6afJhQ@mail.gmail.com>
 <CALqm=de+zGitK2ofX=gExMX1mVUbN1S45fMtf5a9iBR-WBZpcw@mail.gmail.com>
 <CALqm=dcn02oe=nrL_SEo+y5aTJX8SD3OB3fccFyEwPch6fLfDg@mail.gmail.com>
 <CALqm=deNDzc83QEAUqTE5iKb7g106V_k_F6AEJc19R=W-0TDsw@mail.gmail.com>
 <e3f54279-db7a-973c-e792-712dc2b19eb7@xen.org> <CALqm=dfE=Ni0gzs8F692DmXzBs-EbqCs7sXenBt0qOGV=iyj0g@mail.gmail.com>
 <ebdfe8a6-7aee-a553-907e-e788c3b3df33@xen.org> <CALqm=ddPaaF8PG=ycb0u0iGHR+=35SV9taSo7Q-0FqH9QeMiEA@mail.gmail.com>
 <1ef5a5a6-01ea-4f3f-c05f-7dfd204a1861@xen.org>
In-Reply-To: <1ef5a5a6-01ea-4f3f-c05f-7dfd204a1861@xen.org>
From: Jiatong Shen <yshxxsjt715@gmail.com>
Date: Sat, 24 Jun 2023 22:54:01 +0800
Message-ID: <CALqm=dd494P-BWCiemXJYgE4QbZ09MfE_bmae75LqGQcV=PiXA@mail.gmail.com>
Subject: Re: Asking for help to debug xen efi on Kunpeng machine
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, xen-users@lists.xenproject.org, 
	xen-devel@lists.xenproject.org, bertrand.marquis@arm.com
Content-Type: multipart/alternative; boundary="0000000000005c98de05fee14a37"

--0000000000005c98de05fee14a37
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Julien,

   Thank you very much for your reply. Can you teach me how to find the
relationship between MBI-gen and devices?
I am not sure how to find out the mbi-gen backed devices..

Best Regards,
Jiatong Shen

On Sat, Jun 24, 2023 at 4:24=E2=80=AFPM Julien Grall <julien@xen.org> wrote=
:

> Hi,
>
> On 20/06/2023 08:09, Jiatong Shen wrote:
> > Hello Julien,
> >
> >     Sorry for the delay.. I obtained the full xen log and attached it i=
n
> the
> > mail. Please take a look when you are available. Thank you very much
>
> Thanks for sharing the logs. The following lines are interesting:
>
> [    1.081905] Hisilicon MBIGEN-V2 HISI0152:00: Failed to create mbi-gen
> irqdomain
> [    1.082107] Hisilicon MBIGEN-V2 HISI0152:01: Failed to create mbi-gen
> irqdomain
> [    1.082204] Hisilicon MBIGEN-V2 HISI0152:02: Failed to create mbi-gen
> irqdomain
> [    1.082294] Hisilicon MBIGEN-V2 HISI0152:03: Failed to create mbi-gen
> irqdomain
> [    1.082381] Hisilicon MBIGEN-V2 HISI0152:04: Failed to create mbi-gen
> irqdomain
> [    1.082466] Hisilicon MBIGEN-V2 HISI0152:05: Failed to create mbi-gen
> irqdomain
>
> Looking at a Hisilicon Device-Tree, this is an interrupt controller
> behind the GICv3 ITS. You will need to rebuild Xen with CONFIG_HAS_ITS=3D=
y.
>
> Also, can you confirm which devices are behind the MBI-Gen? If this is
> only PCI devices, then you are probably fine to give the controllers to
> dom0. But for PCI passthrough, you will most likely need to implement it
> a driver in Xen.
>
> Cheers,
>
> --
> Julien Grall
>


--=20

Best Regards,

Jiatong Shen

--0000000000005c98de05fee14a37
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Julien,<div><br></div><div>=C2=A0 =C2=A0Thank you ve=
ry much for your reply. Can you teach me how to find the relationship betwe=
en MBI-gen and devices?=C2=A0</div><div>I am not sure how to find out the m=
bi-gen backed devices..</div><div><br></div><div>Best Regards,</div><div>Ji=
atong Shen</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Jun 24, 2023 at 4:24=E2=80=AFPM Julien Grall &lt;<a=
 href=3D"mailto:julien@xen.org">julien@xen.org</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
On 20/06/2023 08:09, Jiatong Shen wrote:<br>
&gt; Hello Julien,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Sorry for the delay.. I obtained the full xen log a=
nd attached it in the<br>
&gt; mail. Please take a look when you are available. Thank you very much<b=
r>
<br>
Thanks for sharing the logs. The following lines are interesting:<br>
<br>
[=C2=A0 =C2=A0 1.081905] Hisilicon MBIGEN-V2 HISI0152:00: Failed to create =
mbi-gen <br>
irqdomain<br>
[=C2=A0 =C2=A0 1.082107] Hisilicon MBIGEN-V2 HISI0152:01: Failed to create =
mbi-gen <br>
irqdomain<br>
[=C2=A0 =C2=A0 1.082204] Hisilicon MBIGEN-V2 HISI0152:02: Failed to create =
mbi-gen <br>
irqdomain<br>
[=C2=A0 =C2=A0 1.082294] Hisilicon MBIGEN-V2 HISI0152:03: Failed to create =
mbi-gen <br>
irqdomain<br>
[=C2=A0 =C2=A0 1.082381] Hisilicon MBIGEN-V2 HISI0152:04: Failed to create =
mbi-gen <br>
irqdomain<br>
[=C2=A0 =C2=A0 1.082466] Hisilicon MBIGEN-V2 HISI0152:05: Failed to create =
mbi-gen <br>
irqdomain<br>
<br>
Looking at a Hisilicon Device-Tree, this is an interrupt controller <br>
behind the GICv3 ITS. You will need to rebuild Xen with CONFIG_HAS_ITS=3Dy.=
<br>
<br>
Also, can you confirm which devices are behind the MBI-Gen? If this is <br>
only PCI devices, then you are probably fine to give the controllers to <br=
>
dom0. But for PCI passthrough, you will most likely need to implement it <b=
r>
a driver in Xen.<br>
<br>
Cheers,<br>
<br>
-- <br>
Julien Grall<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><br><div>Best Regards,</div><div><br></div><div>Jiatong Shen=
</div></div></div>

--0000000000005c98de05fee14a37--

