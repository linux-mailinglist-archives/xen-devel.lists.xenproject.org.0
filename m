Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D0096DCC7
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 16:57:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791146.1200939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smDvN-0001Sf-08; Thu, 05 Sep 2024 14:57:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791146.1200939; Thu, 05 Sep 2024 14:57:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smDvM-0001PT-SN; Thu, 05 Sep 2024 14:57:28 +0000
Received: by outflank-mailman (input) for mailman id 791146;
 Thu, 05 Sep 2024 14:57:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y9DX=QD=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1smDvK-0001PN-Pt
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2024 14:57:26 +0000
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [2607:f8b0:4864:20::c2e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28d0e9b0-6b97-11ef-99a1-01e77a169b0f;
 Thu, 05 Sep 2024 16:57:24 +0200 (CEST)
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-5dfa3e450beso1039634eaf.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2024 07:57:24 -0700 (PDT)
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
X-Inumbo-ID: 28d0e9b0-6b97-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725548243; x=1726153043; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w1CkghOx0ZI+jKsGcjIgdE2c0h0kdTfHj96MyHfbu0M=;
        b=S7fHwieyfZwJuJIMOwi1ZYniP2ULITnr3P5/riLR4IAfNsL7WmRYDCgskYh3cyeb4/
         IDnAt8JQUpdVxw+d2IYzlV/XYe6BkAKf96jK+gvcs2n0dCJjIYPhlpJHreawgvUt3ITz
         CzlG+pqI2ImrL9506Wq2+X3ZZnrIz+NsAYpdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725548243; x=1726153043;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w1CkghOx0ZI+jKsGcjIgdE2c0h0kdTfHj96MyHfbu0M=;
        b=PHj7WEBSuy2r0MstlueeJnvvVEKWkFA2eIBRzRLWmgpgT92f0vQC7i7zZUQrlTTzls
         CRGd8RlYpGeSlnk0JwOC14ZMiRTGf74eMwDOOoO0B2jjPqY5ETFL3FyhZApksGeYk3+l
         6POHMjgswqUb0rQ1z3ZPheNvWqSbb4wteFGPGdliE+VzX5pPR+BgH7dFm/94Z5zxCVi6
         Pt+qNvCuBoNKfZGraCDTa945bCq14bRh48XM4ZE5jqJhUCSYtUcbqY6UjXE7KZpW6Mn5
         XZBiT4pvBbAI7vzWf2jG0zzr9GVsr9iY4WzG7Omvl19f4ccrJnmQ5VtwsqkVn7V0X/S6
         HX3g==
X-Gm-Message-State: AOJu0YzFIgR2yh4NbqeWy71g7yf5Y0DXDz2KQ9oomFYKW+LNEC9CdHad
	DUX30wjVzPF3nxeYieYWQHxCuDd0JWNZ8/jWavMI1KEkx75rW5DP40yEow1eVWz5c82NRqr0ddS
	B7nq1QnYOiIHnTmSId/pMs4EKp+FYwM9Rq9ktwTcGbbI9eX+K
X-Google-Smtp-Source: AGHT+IHvh70meA9tj5AuY6AwUZd/H61c3hUj0SX8kfYzsj06xX027nHYoFb1ySFVQ7pOJXRGq3+w5PRN05BPP2rw6Kk=
X-Received: by 2002:a05:6870:e92:b0:279:b5ac:d1c1 with SMTP id
 586e51a60fabf-27b49fb0846mr2868820fac.8.1725548243476; Thu, 05 Sep 2024
 07:57:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240905130657.4075906-1-andrew.cooper3@citrix.com>
In-Reply-To: <20240905130657.4075906-1-andrew.cooper3@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 5 Sep 2024 15:57:11 +0100
Message-ID: <CACHz=Zgy0dHovFJHH2-UzoS0J6XXZLcwYbjNTH0A68TvYW3Wug@mail.gmail.com>
Subject: Re: [PATCH 0/3] x86/trampoline: Header cleanup
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Content-Type: multipart/alternative; boundary="000000000000187b9a0621608221"

--000000000000187b9a0621608221
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024 at 2:07=E2=80=AFPM Andrew Cooper <andrew.cooper3@citrix=
.com>
wrote:

> This started while inspecting a preprossed file for bitops, but it turns
> out
> is relevant for Frediano's 32bit boot code changes too.
>
> Its header file juggling, and documentation with observations relevant to
> both
> the ASI and Host UEFI Secureboot work, hence the extended CC list.
>
> Andrew Cooper (3):
>   x86/acpi: Drop acpi_video_flags and use bootsym(video_flags) directly
>   x86/trampoline: Move the trampoline declarations out of <asm/config.h>
>   x86/trampoline: Collect other scattered trampoline symbols
>
>  xen/arch/x86/acpi/power.c             |   4 +-
>  xen/arch/x86/cpu/intel.c              |   2 +
>  xen/arch/x86/dmi_scan.c               |  12 ---
>  xen/arch/x86/efi/efi-boot.h           |   4 +-
>  xen/arch/x86/guest/xen/pvh-boot.c     |   1 +
>  xen/arch/x86/include/asm/acpi.h       |   1 -
>  xen/arch/x86/include/asm/config.h     |  19 ----
>  xen/arch/x86/include/asm/processor.h  |   2 -
>  xen/arch/x86/include/asm/setup.h      |   2 -
>  xen/arch/x86/include/asm/trampoline.h | 120 ++++++++++++++++++++++++++
>  xen/arch/x86/mm.c                     |   1 +
>  xen/arch/x86/platform_hypercall.c     |   2 +
>  xen/arch/x86/setup.c                  |   1 +
>  xen/arch/x86/smpboot.c                |   1 +
>  xen/arch/x86/tboot.c                  |   2 +
>  xen/arch/x86/x86_64/mm.c              |   2 +
>  16 files changed, 136 insertions(+), 40 deletions(-)
>  create mode 100644 xen/arch/x86/include/asm/trampoline.h
>
>
> base-commit: a2de7dc4d845738e734b10fce6550c89c6b1092c
>
>
Hi,
   the series looks good to me.

Frediano

--000000000000187b9a0621608221
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, Sep 5, 2024 at 2:07=E2=80=AFPM Andrew Cooper &lt;<a href=3D"=
mailto:andrew.cooper3@citrix.com">andrew.cooper3@citrix.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">This started whi=
le inspecting a preprossed file for bitops, but it turns out<br>
is relevant for Frediano&#39;s 32bit boot code changes too.<br>
<br>
Its header file juggling, and documentation with observations relevant to b=
oth<br>
the ASI and Host UEFI Secureboot work, hence the extended CC list.<br>
<br>
Andrew Cooper (3):<br>
=C2=A0 x86/acpi: Drop acpi_video_flags and use bootsym(video_flags) directl=
y<br>
=C2=A0 x86/trampoline: Move the trampoline declarations out of &lt;asm/conf=
ig.h&gt;<br>
=C2=A0 x86/trampoline: Collect other scattered trampoline symbols<br>
<br>
=C2=A0xen/arch/x86/acpi/power.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0xen/arch/x86/cpu/intel.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0xen/arch/x86/dmi_scan.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 12 ---<br>
=C2=A0xen/arch/x86/efi/efi-boot.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A04 +-<br>
=C2=A0xen/arch/x86/guest/xen/pvh-boot.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 =
+<br>
=C2=A0xen/arch/x86/include/asm/acpi.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A01 -<br>
=C2=A0xen/arch/x86/include/asm/config.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 19 ----<=
br>
=C2=A0xen/arch/x86/include/asm/processor.h=C2=A0 |=C2=A0 =C2=A02 -<br>
=C2=A0xen/arch/x86/include/asm/setup.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 =
-<br>
=C2=A0xen/arch/x86/include/asm/trampoline.h | 120 +++++++++++++++++++++++++=
+<br>
=C2=A0xen/arch/x86/mm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0xen/arch/x86/platform_hypercall.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 =
+<br>
=C2=A0xen/arch/x86/setup.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0xen/arch/x86/smpboot.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0xen/arch/x86/tboot.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0xen/arch/x86/x86_64/mm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +<br>
=C2=A016 files changed, 136 insertions(+), 40 deletions(-)<br>
=C2=A0create mode 100644 xen/arch/x86/include/asm/trampoline.h<br>
<br>
<br>
base-commit: a2de7dc4d845738e734b10fce6550c89c6b1092c<br><br></blockquote><=
div><br></div><div>Hi,</div><div>=C2=A0=C2=A0 the series looks good to me.<=
/div><div><br></div><div>Frediano</div><div>=C2=A0<br></div></div></div>

--000000000000187b9a0621608221--

