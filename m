Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB73A3A33D
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 17:53:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892126.1301129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkQpw-0005Al-Sy; Tue, 18 Feb 2025 16:52:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892126.1301129; Tue, 18 Feb 2025 16:52:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkQpw-00059B-Pu; Tue, 18 Feb 2025 16:52:44 +0000
Received: by outflank-mailman (input) for mailman id 892126;
 Tue, 18 Feb 2025 16:52:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p1uV=VJ=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1tkQpv-000595-JV
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 16:52:43 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4f44dba-ee18-11ef-9aa7-95dc52dad729;
 Tue, 18 Feb 2025 17:52:42 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5ded51d31f1so9517201a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 08:52:42 -0800 (PST)
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
X-Inumbo-ID: c4f44dba-ee18-11ef-9aa7-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739897562; x=1740502362; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eDFKLSNOkp6CE3HVQwpWE3wlvJ0ecILXhVsBYQg3M4Q=;
        b=d1OgKtWG32UH4qXOccAda+h8e6Zab1oM6XXk3JSeEmlHMk3RkvrJ459GCUV4J9dsEu
         KMrpRYP2uyLXaGnEyVvmdeG8dS3ynpBmd2zbDqq088NvzGdoOGE0qtw9LNksUOC19IGv
         YzE7ax5AO7WHlozMVeldZqcpWon+fFPa6ReAIkuhBfLa1V2O2NnWd4jYqkAnoSgpFnFt
         D38I0UCdusnwJ/B7F6fgnbi86WIVRR+mq3VZyK476XjiY9YlD34EllZmiQ45xwrcoD2j
         HpJnP449rGPc2oOZ3hEJ+xQGj+gRLjz5IXMUOD1aNvE421gD/JpDjbY2utdji8fxYzEa
         sCUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739897562; x=1740502362;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eDFKLSNOkp6CE3HVQwpWE3wlvJ0ecILXhVsBYQg3M4Q=;
        b=Y1AqQ2AnDBIre98piKv4FGfWFNSySg8myNXckuIY1sQ03krMOiOzxS5JyRKmW4UA2J
         DKNVbr9i2mNvWbjt7QTTb1EH6xKDVE19rmOZ8VbXtCZDG5oVZQt0ZM67ta6lqIp0LrcI
         vloapQ99IkEZfluI9sD4Pop4Fw4H6tWdKINlrlgFtfJ4rTsP3pnQAK3w+r1t29W1Pecy
         46AADK2e2qLhI+kIOyzCxJ2rFVcvGMVNJwV1nrraLROLV9u21kcsoRh7+voOUyQih3gj
         kEQLgQv7tQWH660kAz2g3mnXrF8rHl8dxp94GiSAyhZrPO2S30k3M0G4+I4O7dw5GJ9u
         RZcA==
X-Forwarded-Encrypted: i=1; AJvYcCXcmwbEN0A4g0XX+NatbUXbUjHC+PgKgOpaXX9Gv3B3TUhZHTQGfxcdeNQ35HQiXFufXHK0W2DJDwQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyb60E1wCPOkwPf0Nc9a4E085U5D9+ioJwGcbeoF5GutE2f05i9
	NOahLEnmtxpsmh2OEQtdD9/naJcqI5vq4WdmRJmW8qAW5r0mYvhHCv9+EnpjXr+1CpcAKnADPoD
	04hdfPDcQF4c6hE9+Rzxq0fEzCxs=
X-Gm-Gg: ASbGncuxYWoXyNaXCs+03lKM43owBMYLF8eH0pE1bvUW4bSl811NwI3MAbXC1ENYan+
	tqX/6BUnoEQe6R+i9zYdFQsPPJVgM1Rlihh0rbKyruZgufplEd4BbGOAKUf1PPRSxxmhNIEXt
X-Google-Smtp-Source: AGHT+IHT6m+4vdvYtwVS1Be91nNvmacbx9ZKkpKCWI2AK8qs7Im0jGpr4yxIc1QU9fRgJxQEwkT0tzCfqmVnQG+ZbS0=
X-Received: by 2002:a05:6402:5411:b0:5d0:f9f1:cd73 with SMTP id
 4fb4d7f45d1cf-5e08950d212mr116528a12.13.1739897561204; Tue, 18 Feb 2025
 08:52:41 -0800 (PST)
MIME-Version: 1.0
References: <20250218162618.46167-1-philmd@linaro.org> <20250218162618.46167-3-philmd@linaro.org>
In-Reply-To: <20250218162618.46167-3-philmd@linaro.org>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Tue, 18 Feb 2025 10:52:28 -0600
X-Gm-Features: AWEUYZn8gQqosEO0e1gCKUbrt0HCJzA-UMZ55g9inVW7k1cA7-ctVXAivgYFFLA
Message-ID: <CAJy5ezp2pgDAyraishtSkfSMHU5aRj_myZyO=nRNpCVFXkh4jA@mail.gmail.com>
Subject: Re: [PATCH 2/8] hw/arm: Do not expose the virt machine on Xen-only binary
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
	xen-devel@lists.xenproject.org, qemu-arm@nongnu.org, 
	Anthony PERARD <anthony@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Peter Maydell <peter.maydell@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, 
	"Michael S. Tsirkin" <mst@redhat.com>, David Woodhouse <dwmw2@infradead.org>, 
	Vikram Garhwal <vikram.garhwal@bytedance.com>, Thomas Huth <thuth@redhat.com>, 
	Jan Beulich <jbeulich@suse.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000014ce20062e6d78c4"

--00000000000014ce20062e6d78c4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2025 at 10:26=E2=80=AFAM Philippe Mathieu-Daud=C3=A9 <philm=
d@linaro.org>
wrote:

> Since the Virt machine is useless under Xen, do not even
> try to build it there.
> A Xen-only binary now only offers the XenPVH machine:
>
>   $ qemu-system-aarch64 -M help
>   Supported machines are:
>   none                 empty machine
>   xenpvh               Xen PVH ARM machine
>
>
Makes sense to me.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>



> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/arm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 256013ca808..e5f4b1d84d3 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -2,6 +2,7 @@ config ARM_VIRT
>      bool
>      default y
>      depends on ARM
> +    depends on TCG || KVM || HVF
>      imply PCI_DEVICES
>      imply TEST_DEVICES
>      imply VFIO_AMD_XGBE
> --
> 2.47.1
>
>

--00000000000014ce20062e6d78c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Feb 18, 2025 at 10:26=E2=80=AFAM =
Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">philmd=
@linaro.org</a>&gt; wrote:</div><div class=3D"gmail_quote gmail_quote_conta=
iner"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">Since the Virt mach=
ine is useless under Xen, do not even<br>
try to build it there.<br>
A Xen-only binary now only offers the XenPVH machine:<br>
<br>
=C2=A0 $ qemu-system-aarch64 -M help<br>
=C2=A0 Supported machines are:<br>
=C2=A0 none=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0em=
pty machine<br>
=C2=A0 xenpvh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Xen PVH=
 ARM machine<br>
<br></blockquote><div><br></div><div>Makes sense to me.</div><div><br></div=
><div>Reviewed-by: Edgar E. Iglesias &lt;<a href=3D"mailto:edgar.iglesias@a=
md.com">edgar.iglesias@amd.com</a>&gt;</div><div><br></div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@lin=
aro.org" target=3D"_blank">philmd@linaro.org</a>&gt;<br>
---<br>
=C2=A0hw/arm/Kconfig | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig<br>
index 256013ca808..e5f4b1d84d3 100644<br>
--- a/hw/arm/Kconfig<br>
+++ b/hw/arm/Kconfig<br>
@@ -2,6 +2,7 @@ config ARM_VIRT<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
=C2=A0 =C2=A0 =C2=A0default y<br>
=C2=A0 =C2=A0 =C2=A0depends on ARM<br>
+=C2=A0 =C2=A0 depends on TCG || KVM || HVF<br>
=C2=A0 =C2=A0 =C2=A0imply PCI_DEVICES<br>
=C2=A0 =C2=A0 =C2=A0imply TEST_DEVICES<br>
=C2=A0 =C2=A0 =C2=A0imply VFIO_AMD_XGBE<br>
-- <br>
2.47.1<br>
<br>
</blockquote></div></div>

--00000000000014ce20062e6d78c4--

