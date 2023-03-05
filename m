Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DA36AAE75
	for <lists+xen-devel@lfdr.de>; Sun,  5 Mar 2023 08:08:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506505.779638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pYiSJ-0002Zg-EB; Sun, 05 Mar 2023 07:06:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506505.779638; Sun, 05 Mar 2023 07:06:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pYiSJ-0002XU-B1; Sun, 05 Mar 2023 07:06:51 +0000
Received: by outflank-mailman (input) for mailman id 506505;
 Sun, 05 Mar 2023 07:06:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tvXp=65=gmail.com=bobbyeshleman@srs-se1.protection.inumbo.net>)
 id 1pYiSI-0002XO-55
 for xen-devel@lists.xenproject.org; Sun, 05 Mar 2023 07:06:50 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b591592-bb24-11ed-a550-8520e6686977;
 Sun, 05 Mar 2023 08:06:47 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id s11so26191721edy.8
 for <xen-devel@lists.xenproject.org>; Sat, 04 Mar 2023 23:06:47 -0800 (PST)
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
X-Inumbo-ID: 4b591592-bb24-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678000007;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l+EbDURzTRHIyVVZE31yctx/zWPbqi3GIkGOXgI3s0I=;
        b=frwn8UUfE4KY6GIfVCgvWWhN73nstNxrF8r3/EcWRTys3SvuPiBRpAyi0yxkChD9+t
         xdQUGA765bopG1R3mE/VTekGERthaB+e1s+xiwdEfwy9a6JSjNulrSuxafcuQHSu72WQ
         6tl6Ln/XPxMoHLMfccJ+lkww9DN0moMIoHYg4wzjQMP3WviMsAmkiEaRAiQhR7FfE6oY
         Xd8Hzwz+lFYXOTnnPg1OhVxTmjLNxWRSZ8zQrFQCGbksj+l7YTNWRVFcfVT/3ErRdhGt
         5ZxOcjpKdI1x2MVtZRr8MkpMhuDpa6mSiKMOofUMtT4rMVBGuf8dqw782hJfM9dH5mQx
         aoeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678000007;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l+EbDURzTRHIyVVZE31yctx/zWPbqi3GIkGOXgI3s0I=;
        b=Kl2gdnnIE8q/jVy+69/6MtjqZraRFsLUbtxur7HSpEOO3z1DirscP9NoEQqujURcm0
         NiqIxunsRfH9ulY4OE5A6HGt2QRUWpK4rC0dlKwLnztQMBDJ7f0KXCe895MP4wdh1OGf
         HM8ocOs7yBI9vm27/T3thldTX5GqWWE8/gNtLPFEBeGotIZV2r0PtyhiPwtYAarMDSQB
         4vc8HjUGlz9wEJJ5h2o/zgD4hS4mle7sHCNum0JdKTleOMUcDRyV5x4VRxfqaww8xZdJ
         eFwtxDmTCrGmMx5nqAboL6kUtWdnn9LMzWa7CtuNE+EHI3Q8RghuzEJxX5AyBCuXa0u9
         5b2g==
X-Gm-Message-State: AO0yUKVxeXihfz1vub8Oaa0uxc6cq1wF8vDUCNpd6id6Pxy0u3tLwruU
	eCYdvw281MDvMiT9wMYX+CV2AYOjsMbnGOF8jxmQ80iU
X-Google-Smtp-Source: AK7set8oBX9xEvDv9QVBKCwJCSoH7H8g9NabbLaIjgbWUolF1qTq4q+cm4RNMioX+l277ys/w1+uIx4Ar64MK+9fjkg=
X-Received: by 2002:a17:906:3141:b0:8e5:411d:4d09 with SMTP id
 e1-20020a170906314100b008e5411d4d09mr3332860eje.15.1678000007012; Sat, 04 Mar
 2023 23:06:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1677838213.git.oleksii.kurochko@gmail.com>
In-Reply-To: <cover.1677838213.git.oleksii.kurochko@gmail.com>
From: Bobby Eshleman <bobby.eshleman@gmail.com>
Date: Sat, 4 Mar 2023 23:06:36 -0800
Message-ID: <CAKB00G2=MSXrLyczXUEm+OzBj=an6CsjUrRfDhLELupTyAGd2w@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Do basic initialization things
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Connor Davis <connojdavis@gmail.com>, Gianluca Guida <gianluca@rivosinc.com>, 
	Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000059e63905f621d294"

--00000000000059e63905f621d294
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I just wanted to let you know I have this queued up to review, I=E2=80=99ve=
 just
been very overloaded. I=E2=80=99ll give these a review in the coming week.

Best,
Bobby

On Fri, Mar 3, 2023 at 2:24 AM Oleksii Kurochko <oleksii.kurochko@gmail.com=
>
wrote:

> The patch series groups and updates the following patches:
> 1. xen/riscv: disable fpu
> 2. xen/riscv: initialize .bss section
> 3. xen/riscv: read/save hart_id and dtb_base passed by bootloader
>
> ---
> Changes since v2:
>  * Patch [xen/riscv: disable fpu] was moved to the start of start()
>    function  to detect illegal usage of floating point
>    earlier.
>  * Add dummy_bss variable to make .bss initialization code more simple.
>  * Change comparison of addresses from signed to unsigned.
>  * Add the comment for start() function with the explanation what and
>    how OpenSBI pass to start() function.
>  * Clean up start() code related to read&save hart_id & dtb_base.
> ---
> Changes since v1:
>  * initialization of .bss was moved to head.S
>  * read/save/pass of hart_id and  dtb_base passed by a bootloader
>    were moved to head.S. Also, it was updated start_xen() arguments
>    to recieve hard_id & dtb_base
> ---
>
> Oleksii Kurochko (3):
>   xen/riscv: disable fpu
>   xen/riscv: read/save hart_id and dtb_base passed by bootloader
>   xen/riscv: initialize .bss section
>
>  xen/arch/riscv/riscv64/head.S | 21 +++++++++++++++++++++
>  xen/arch/riscv/setup.c        | 11 ++++++++++-
>  2 files changed, 31 insertions(+), 1 deletion(-)
>
> --
> 2.39.0
>
>

--00000000000059e63905f621d294
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I just wanted to let you know I have this queued up to re=
view, I=E2=80=99ve just been very overloaded. I=E2=80=99ll give these a rev=
iew in the coming week.</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
Best,</div><div dir=3D"auto">Bobby</div><div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 3, 2023 at 2:24 AM Oleks=
ii Kurochko &lt;<a href=3D"mailto:oleksii.kurochko@gmail.com">oleksii.kuroc=
hko@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The pa=
tch series groups and updates the following patches:<br>
1. xen/riscv: disable fpu<br>
2. xen/riscv: initialize .bss section<br>
3. xen/riscv: read/save hart_id and dtb_base passed by bootloader<br>
<br>
---<br>
Changes since v2:<br>
=C2=A0* Patch [xen/riscv: disable fpu] was moved to the start of start()<br=
>
=C2=A0 =C2=A0function=C2=A0 to detect illegal usage of floating point<br>
=C2=A0 =C2=A0earlier.<br>
=C2=A0* Add dummy_bss variable to make .bss initialization code more simple=
.<br>
=C2=A0* Change comparison of addresses from signed to unsigned.<br>
=C2=A0* Add the comment for start() function with the explanation what and<=
br>
=C2=A0 =C2=A0how OpenSBI pass to start() function.<br>
=C2=A0* Clean up start() code related to read&amp;save hart_id &amp; dtb_ba=
se.=C2=A0 =C2=A0<br>
---<br>
Changes since v1:<br>
=C2=A0* initialization of .bss was moved to head.S<br>
=C2=A0* read/save/pass of hart_id and=C2=A0 dtb_base passed by a bootloader=
<br>
=C2=A0 =C2=A0were moved to head.S. Also, it was updated start_xen() argumen=
ts<br>
=C2=A0 =C2=A0to recieve hard_id &amp; dtb_base<br>
---<br>
<br>
Oleksii Kurochko (3):<br>
=C2=A0 xen/riscv: disable fpu<br>
=C2=A0 xen/riscv: read/save hart_id and dtb_base passed by bootloader<br>
=C2=A0 xen/riscv: initialize .bss section<br>
<br>
=C2=A0xen/arch/riscv/riscv64/head.S | 21 +++++++++++++++++++++<br>
=C2=A0xen/arch/riscv/setup.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 11 ++++++++++-<br=
>
=C2=A02 files changed, 31 insertions(+), 1 deletion(-)<br>
<br>
-- <br>
2.39.0<br>
<br>
</blockquote></div></div>

--00000000000059e63905f621d294--

