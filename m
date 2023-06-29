Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3312B7429E6
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 17:49:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556948.869873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEttB-0007oq-Vw; Thu, 29 Jun 2023 15:48:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556948.869873; Thu, 29 Jun 2023 15:48:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEttB-0007nB-Sp; Thu, 29 Jun 2023 15:48:57 +0000
Received: by outflank-mailman (input) for mailman id 556948;
 Thu, 29 Jun 2023 15:48:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4caF=CR=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qEtt9-0007n1-Um
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 15:48:55 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73cdc208-1694-11ee-b237-6b7b168915f2;
 Thu, 29 Jun 2023 17:48:55 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3fbac8b01b3so7098465e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jun 2023 08:48:55 -0700 (PDT)
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
X-Inumbo-ID: 73cdc208-1694-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1688053734; x=1690645734;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jSdVjJpCmVpHY5/wQZSl5p+XU1biZd4tgXDVzzjLKaU=;
        b=IH+9sXOL0ufzC82KZ7hsvx05xCogL0W2VThecu8sB4eGYezjhIvSw0NWFvED9o6YwX
         4wP46n0Rd4zz7dTVUEoQytUMzuoKjbGJIJ/VKO43nJGcJqstuPpGtj79zRCHSyQfHM2Z
         wmrTAJRJX1hewOlW2DHHLv96gERIUckvO3Hko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688053734; x=1690645734;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jSdVjJpCmVpHY5/wQZSl5p+XU1biZd4tgXDVzzjLKaU=;
        b=dlXz5h+Z3MVRbySsNBx6wreunASgGcy3Fkk24ym3TFYDhs/folP8xLyy40d67pqni7
         4f1TztvK4b3bsOpeZL1fErGV0HueyocpdAVXNQi9WuxCQ2LrJ7qLuUarldyK0IqTk4dL
         5dq9bV/xPtKLkGfmlXU0/oDjoJh0c+jeyL6oNUOZp0SayiKsvpojeZOxYOj32aidnYqj
         FkbTNcE/iE0Cov5ZaO/go+yyKoWscDN5Qhi+QHj+gi3eTG08fTWtU5rql+7Yuisv0ruK
         Ym4GqZIbSR+DRA+WW6fM9zARivqxKbVZr7NzRtov0puBKScuIHugm0baWJEiV1n7zcAC
         mEGQ==
X-Gm-Message-State: AC+VfDx5/4ZbOmAKRVJ0GrGZmw+tXfkYuaVRbyzTFOr2vKKrirOfizcx
	i7jwcbxAA0bKcIU0S5z5CR8ZzWPIUp5F2SDq5osVLIKKFZ9SZO2A
X-Google-Smtp-Source: ACHHUZ7f+TCxycZlLeqK+gBTBRkUzdENQu3rKmP4nmkYnD9U6U5QV5bFY27XkunvZGAu+Rwel7idP8qLHIw0wdOyglA=
X-Received: by 2002:adf:fd0b:0:b0:314:22b:7003 with SMTP id
 e11-20020adffd0b000000b00314022b7003mr5348932wrr.21.1688053734262; Thu, 29
 Jun 2023 08:48:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230629121713.1211-1-alejandro.vallejo@cloud.com> <20230629121713.1211-4-alejandro.vallejo@cloud.com>
In-Reply-To: <20230629121713.1211-4-alejandro.vallejo@cloud.com>
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Date: Thu, 29 Jun 2023 16:48:44 +0100
Message-ID: <CAFi36o1hkZHEMuDGStfCwgKqdB-HyPnpdv=PHcm4WDSHVZcP_w@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] x86: Add Kconfig option to require NX bit support
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: multipart/alternative; boundary="00000000000031608e05ff46a39d"

--00000000000031608e05ff46a39d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 29, 2023 at 1:17=E2=80=AFPM Alejandro Vallejo <
alejandro.vallejo@cloud.com> wrote:

> This option hardens Xen by forcing it to write secure (NX-enhanced) PTEs
> regardless of the runtime NX feature bit in boot_cpu_data. This prevents =
an
> attacker with partial write support from affecting Xen's PTE generation
> logic by overriding the NX feature flag. The patch asserts support for th=
e
> NX bit in PTEs at boot time and if so short-circuits the cpu_has_nx macro
> to 1.
>
> It has the nice benefit of replacing many instances of runtime checks wit=
h
> folded constants. This has several knock-on effects that improve codegen,
> saving 2.5KiB off the text section.
>
> The config option defaults to OFF for compatibility with previous
> behaviour.
>
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
>  xen/arch/x86/Kconfig                  | 16 ++++++++++++++++
>  xen/arch/x86/boot/head.S              | 15 ++++++++++++++-
>  xen/arch/x86/boot/trampoline.S        |  3 ++-
>  xen/arch/x86/efi/efi-boot.h           |  9 +++++++++
>  xen/arch/x86/include/asm/cpufeature.h |  3 ++-
>  5 files changed, 43 insertions(+), 3 deletions(-)
>

@mantainers

--00000000000031608e05ff46a39d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Jun 29, 2023 at 1:17=E2=80=AFPM A=
lejandro Vallejo &lt;<a href=3D"mailto:alejandro.vallejo@cloud.com">alejand=
ro.vallejo@cloud.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">This option hardens Xen by f=
orcing it to write secure (NX-enhanced) PTEs<br>
regardless of the runtime NX feature bit in boot_cpu_data. This prevents an=
<br>
attacker with partial write support from affecting Xen&#39;s PTE generation=
<br>
logic by overriding the NX feature flag. The patch asserts support for the<=
br>
NX bit in PTEs at boot time and if so short-circuits the cpu_has_nx macro<b=
r>
to 1.<br>
<br>
It has the nice benefit of replacing many instances of runtime checks with<=
br>
folded constants. This has several knock-on effects that improve codegen,<b=
r>
saving 2.5KiB off the text section.<br>
<br>
The config option defaults to OFF for compatibility with previous<br>
behaviour.<br>
<br>
Signed-off-by: Alejandro Vallejo &lt;<a href=3D"mailto:alejandro.vallejo@cl=
oud.com" target=3D"_blank">alejandro.vallejo@cloud.com</a>&gt;<br>
Reviewed-by: Andrew Cooper &lt;<a href=3D"mailto:andrew.cooper3@citrix.com"=
 target=3D"_blank">andrew.cooper3@citrix.com</a>&gt;<br>
---<br>
=C2=A0xen/arch/x86/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 16 ++++++++++++++++<br>
=C2=A0xen/arch/x86/boot/head.S=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 15 ++++++++++++++-<br>
=C2=A0xen/arch/x86/boot/trampoline.S=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +=
+-<br>
=C2=A0xen/arch/x86/efi/efi-boot.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 9 +++++++++<br>
=C2=A0xen/arch/x86/include/asm/cpufeature.h |=C2=A0 3 ++-<br>
=C2=A05 files changed, 43 insertions(+), 3 deletions(-)<br></blockquote><di=
v><br><a class=3D"gmail_plusreply" id=3D"plusReplyChip-1">@mantainers</a>=
=C2=A0</div></div></div>

--00000000000031608e05ff46a39d--

