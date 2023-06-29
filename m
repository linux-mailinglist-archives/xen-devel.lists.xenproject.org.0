Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C867429C7
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 17:37:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556928.869834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEthc-0004eo-3v; Thu, 29 Jun 2023 15:37:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556928.869834; Thu, 29 Jun 2023 15:37:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEthc-0004cM-0u; Thu, 29 Jun 2023 15:37:00 +0000
Received: by outflank-mailman (input) for mailman id 556928;
 Thu, 29 Jun 2023 15:36:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4caF=CR=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qEtha-0004cG-UN
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 15:36:58 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c87c60d9-1692-11ee-b237-6b7b168915f2;
 Thu, 29 Jun 2023 17:36:58 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2b69ed7d050so12822111fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jun 2023 08:36:58 -0700 (PDT)
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
X-Inumbo-ID: c87c60d9-1692-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1688053017; x=1690645017;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dof83Fv4i0vfWq58FQd3aWC+Ttb5ONZ/LOADV8F3Ncg=;
        b=WmMYhmaHNqL0IrwnhJ9ygyPf2RrTMZdzd/xNIu6dV2sUBUQhL8mFUZHxUaFOHlvRgs
         4lcoxgXUoLNwfLFnhm1ndyy5FbkO1X727wEyvkxll4F/driiqPYJsVdgt5gSYNDfWn09
         vTSB/T/8vfRPF0mWLnY6Hw5GZ3Ex/NkfvyRBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688053017; x=1690645017;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dof83Fv4i0vfWq58FQd3aWC+Ttb5ONZ/LOADV8F3Ncg=;
        b=GbIm4tcK06olE7Lf5k57OKTTiE8l4JocfmbSgH/zrFG0PkT1m9cCkTEkSV4dk28F2M
         Bi61Zi7n0QvIOTClMUoOkHbxCzrJKBeYUHJZzd0Zum0QO+CIFAVG975KVh57BPRDFOJx
         KK4FXko1HqrRf5q7tDfgJs+ANsYv1/UCeaD5bFXOepSiD3V1mMOkn4A4xvB7Eo6F3HGX
         DrAj9TZMrbDyiNgk5VQSThbKFPBYOREbNaVCaeO7GLwlrwcDdDHSV3hmQhEWowg6VGTv
         qTb0onj908pM5tQzkKzkOGRksott9EB6AFGFV1aHynt2+vDGWH1lVqu0JTwClS5VhrYl
         zOdw==
X-Gm-Message-State: ABy/qLbTEK5t138gWQ9GKkiVa0f07h4A5Qej5aQE6PxrqaNXQX7iJAzT
	qNan6IerGC3bkd60pZFn5ZBrTTc8tt+O3zFwzv6WUn7iQg+QfsxOVG8=
X-Google-Smtp-Source: APBJJlGqj85X+kf66Ke3SZ9XUCVOCXRWiKkvNrahDeeSlp1FNaGrrtJomGmG5liZbNdFD20+cj5sd483LB2pu/U1jFA=
X-Received: by 2002:a05:6512:2815:b0:4fb:893e:8ffc with SMTP id
 cf21-20020a056512281500b004fb893e8ffcmr301167lfb.17.1688053017359; Thu, 29
 Jun 2023 08:36:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230629121713.1211-1-alejandro.vallejo@cloud.com>
In-Reply-To: <20230629121713.1211-1-alejandro.vallejo@cloud.com>
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Date: Thu, 29 Jun 2023 16:36:46 +0100
Message-ID: <CAFi36o3oX+YQxrpCU8S-zT8Y-fSKjZg9TZs=28_pZdww9LpQ5w@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Introduce a REQUIRE_NX Kconfig option
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
	Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: multipart/alternative; boundary="000000000000764f6805ff4678d3"

--000000000000764f6805ff4678d3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 29, 2023 at 1:17=E2=80=AFPM Alejandro Vallejo <
alejandro.vallejo@cloud.com> wrote:

> v3:
>   * Fixed a Gitlab CI breakage on older toolchains (patch 1)
>   * Removed XD_DISABLE override logic from cpu/intel.c
>   * Various style fixes to patch 2 (from Andrew's feedback)
>
> This option hardens Xen by forcing it to write secure (NX-enhanced) PTEs
> regardless of the runtime NX feature bit in boot_cpu_data. This prevents =
an
> attacker with partial write support from affecting Xen's PTE generation
> logic by overriding the NX feature flag. The patch asserts support for th=
e
> NX bit in PTEs at boot time and if so short-circuits the cpu_has_nx macro
> to 1.
>
> Alejandro Vallejo (3):
>   tools: Add __AC() macro to common-macros.h
>   x86/boot: Clear XD_DISABLE from the early boot path
>   x86: Add Kconfig option to require NX bit support
>
>  tools/include/xen-tools/common-macros.h |  3 ++
>  tools/libs/light/libxl_internal.h       |  2 -
>  tools/tests/x86_emulator/x86-emulate.h  |  3 --
>  xen/arch/x86/Kconfig                    | 16 +++++++
>  xen/arch/x86/boot/head.S                | 62 ++++++++++++++++++++++---
>  xen/arch/x86/boot/trampoline.S          |  3 +-
>  xen/arch/x86/cpu/intel.c                | 16 +++----
>  xen/arch/x86/efi/efi-boot.h             |  9 ++++
>  xen/arch/x86/include/asm/cpufeature.h   |  3 +-
>  xen/arch/x86/include/asm/msr-index.h    |  2 +-
>  xen/arch/x86/include/asm/x86-vendors.h  |  6 +--
>  11 files changed, 98 insertions(+), 27 deletions(-)
>
> --
> 2.34.1
>
> Adding CCs here because I forgot to run the add_maintainers.pl script
before sending. Ugh...

Alejandro

--000000000000764f6805ff4678d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Jun 29, 2023 at 1:17=E2=80=AFPM A=
lejandro Vallejo &lt;<a href=3D"mailto:alejandro.vallejo@cloud.com">alejand=
ro.vallejo@cloud.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">v3:<br>
=C2=A0 * Fixed a Gitlab CI breakage on older toolchains (patch 1)<br>
=C2=A0 * Removed XD_DISABLE override logic from cpu/intel.c<br>
=C2=A0 * Various style fixes to patch 2 (from Andrew&#39;s feedback)<br>
<br>
This option hardens Xen by forcing it to write secure (NX-enhanced) PTEs<br=
>
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
Alejandro Vallejo (3):<br>
=C2=A0 tools: Add __AC() macro to common-macros.h<br>
=C2=A0 x86/boot: Clear XD_DISABLE from the early boot path<br>
=C2=A0 x86: Add Kconfig option to require NX bit support<br>
<br>
=C2=A0tools/include/xen-tools/common-macros.h |=C2=A0 3 ++<br>
=C2=A0tools/libs/light/libxl_internal.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2=
 -<br>
=C2=A0tools/tests/x86_emulator/x86-emulate.h=C2=A0 |=C2=A0 3 --<br>
=C2=A0xen/arch/x86/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 16 +++++++<br>
=C2=A0xen/arch/x86/boot/head.S=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 62 ++++++++++++++++++++++---<br>
=C2=A0xen/arch/x86/boot/trampoline.S=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 3 +-<br>
=C2=A0xen/arch/x86/cpu/intel.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 16 +++----<br>
=C2=A0xen/arch/x86/efi/efi-boot.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 9 ++++<br>
=C2=A0xen/arch/x86/include/asm/cpufeature.h=C2=A0 =C2=A0|=C2=A0 3 +-<br>
=C2=A0xen/arch/x86/include/asm/msr-index.h=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0xen/arch/x86/include/asm/x86-vendors.h=C2=A0 |=C2=A0 6 +--<br>
=C2=A011 files changed, 98 insertions(+), 27 deletions(-)<br>
<br>
-- <br>
2.34.1<br>
<br></blockquote>Adding CCs here because I forgot to run the <a href=3D"htt=
p://add_maintainers.pl">add_maintainers.pl</a> script<br>before sending. Ug=
h...<br><div><br></div><div>Alejandro=C2=A0</div></div></div>

--000000000000764f6805ff4678d3--

