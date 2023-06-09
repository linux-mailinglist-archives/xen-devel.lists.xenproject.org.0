Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A1B728F35
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 07:05:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545549.852099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7UJS-0002Qm-1a; Fri, 09 Jun 2023 05:05:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545549.852099; Fri, 09 Jun 2023 05:05:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7UJR-0002O4-U8; Fri, 09 Jun 2023 05:05:25 +0000
Received: by outflank-mailman (input) for mailman id 545549;
 Fri, 09 Jun 2023 01:23:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g3GI=B5=gmail.com=yshxxsjt715@srs-se1.protection.inumbo.net>)
 id 1q7Qqp-0001m6-U2
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 01:23:40 +0000
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [2607:f8b0:4864:20::b32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42a32ced-0664-11ee-b232-6b7b168915f2;
 Fri, 09 Jun 2023 03:23:38 +0200 (CEST)
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-ba8374001abso1285128276.2; 
 Thu, 08 Jun 2023 18:23:38 -0700 (PDT)
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
X-Inumbo-ID: 42a32ced-0664-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686273817; x=1688865817;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MEPQYGbMNK5oj5vl0CdvAX63gLovKSlWu/GcxyuZD6g=;
        b=GMzw9eg2fJj4gC9F2y9I3eRImN69ZKQaBUDrjWPgN+b15ZSeUZiZVGnHiQgD63R+dd
         Ab58Puy3xlOVVGCulI4bTbznnmqBXMnGPsL5Aso4IGVX2oI4S5noI6A+GJc6BRLXCErW
         +SJoZ4W0N33wIMRhsNvYxSbKe1std5/S437AxFWUZ+CWJQTyesNSTTIP0AxAIDrdpHbJ
         u8Zoo9b/QC9eiszHmVRWcoJmisOhceFVRS33ihO80rPt6Zl1sI46+nRlSLTzK69+ofeA
         RemQxP3O1uUjGlT/xOSPyByzJT21UmPgfo/hH2V7e6Dd/ZViqID3Zu3Q9e+e32oEVdUm
         z1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686273817; x=1688865817;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MEPQYGbMNK5oj5vl0CdvAX63gLovKSlWu/GcxyuZD6g=;
        b=YGyVsEHC2W5Cpk8L51zca+yzJE2YS7Ni8cS0yJNaPPtGLoHWRaJ+tGjX9hhkJl/DMS
         kkl2U76CBEpTI4RA/Q6KEWdXvf3tSVxUjmW1y3ppIBMzO2VPXxVAaLKRb+FN2osPyYJ9
         LKi7WKO/LoUQLXbmnEcOXmMRbpYU4TpicAhxnlHZU42oxQbw9MXajIItAbssIEvbScNq
         CMpky15zh6yFiOTRY6zRlZ6Y2A3TbxTm5FMr9gJhgCE7mCq3vrfqWEaxFYko6NRLJUzK
         smHd3EWgXz+/HglwCDooQPxjXFVkWlkW3bSUR+SJfslhYuqHaTnZj1X4tUVGlevdSLrp
         BcgA==
X-Gm-Message-State: AC+VfDxV9kWCaxTUlQO/QU8Dgzt+hyshrs69FjWNT2FidawgVJ5bWRow
	0imdW+Y1K5OD56cxd0aaJWKNOGa2xf2Gid7yT+M=
X-Google-Smtp-Source: ACHHUZ4DBbY8hAIsD2jK2BAIse6BXEBJWVLn7yIBFpsx70R86mbAIUiu58CxRop/uy/PBcAYBmFN8LRcaPYQ65Zb8U0=
X-Received: by 2002:a25:420b:0:b0:bb1:f091:296f with SMTP id
 p11-20020a25420b000000b00bb1f091296fmr1218052yba.36.1686273817541; Thu, 08
 Jun 2023 18:23:37 -0700 (PDT)
MIME-Version: 1.0
References: <CALqm=ddiMwWvdYMgyCtaKMocUEkEJyTgSQup9wJiXm4PrcDuVw@mail.gmail.com>
 <alpine.DEB.2.22.394.2306081537590.3803068@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2306081537590.3803068@ubuntu-linux-20-04-desktop>
From: Jiatong Shen <yshxxsjt715@gmail.com>
Date: Fri, 9 Jun 2023 09:23:26 +0800
Message-ID: <CALqm=dcqtvQrpHkzuffg7S0drR34CMDF83b75ohnoWswHonTMw@mail.gmail.com>
Subject: Re: Asking for help to debug xen efi on Kunpeng machine
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-users@lists.xenproject.org, xen-devel@lists.xenproject.org, 
	julien@xen.org, bertrand.marquis@arm.com
Content-Type: multipart/alternative; boundary="000000000000e380be05fda837b6"

--000000000000e380be05fda837b6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefano,

   Thank you very much for the reply. I do have access to serial but the
machine is near my work space right now, so
I might need some extra time to go to datacenter first. I'll let you know
if it is indeed working.

  Thank you very much again.


Best regards,.

Jiatong Shen

On Fri, Jun 9, 2023 at 6:39=E2=80=AFAM Stefano Stabellini <sstabellini@kern=
el.org>
wrote:

> Hi Jiatong,
>
> Do you have access to the serial? If so, it is possible that the boot
> is actually successful and it is only the screen initialization the
> problem.
>
> If kunpeng 920 is a UEFI/ACPI machine, we know that there are issues
> with screen initialization.
>
> Cheers,
>
> Stefano
>
> On Fri, 9 Jun 2023, Jiatong Shen wrote:
> > Hello community,
> >
> > I need help for debugging XEN on aarch64 architecture. The machine I am
> working on is a kunpeng 920 armv8 compatible CPU. I use debian 11
> > as operating system and installed xen-system-arm64 without any problem.
> But when I boot into xen hypervisor mode, the machine screen is
> > black out without any output or any helpful debugging message.
> >
> >   Could you generously provide some hints for debugging the issue?
> Thank you very much in advance and looking forward to hearing from you.
> >
> > --
> >
> > Best Regards,
> >
> > Jiatong Shen
> >
> >



--=20

Best Regards,

Jiatong Shen

--000000000000e380be05fda837b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Stefano,<div><br></div><div>=C2=A0 =C2=A0Thank you very=
 much for the reply. I do have access to serial but the machine is near my =
work space right now, so=C2=A0</div><div>I might need some extra time to go=
 to datacenter first. I&#39;ll let you know if it is indeed working.=C2=A0 =
=C2=A0</div><div><br></div><div>=C2=A0 Thank you very much again.</div><div=
><br></div><div><br></div><div>Best regards,.</div><div><br></div><div>Jiat=
ong Shen</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Jun 9, 2023 at 6:39=E2=80=AFAM Stefano Stabellini &=
lt;<a href=3D"mailto:sstabellini@kernel.org">sstabellini@kernel.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Jiato=
ng,<br>
<br>
Do you have access to the serial? If so, it is possible that the boot<br>
is actually successful and it is only the screen initialization the<br>
problem.<br>
<br>
If kunpeng 920 is a UEFI/ACPI machine, we know that there are issues<br>
with screen initialization.<br>
<br>
Cheers,<br>
<br>
Stefano<br>
<br>
On Fri, 9 Jun 2023, Jiatong Shen wrote:<br>
&gt; Hello community,<br>
&gt; =C2=A0 =C2=A0<br>
&gt; I need help for debugging=C2=A0XEN on aarch64 architecture. The machin=
e I am working on is a kunpeng 920 armv8 compatible CPU. I use debian 11<br=
>
&gt; as operating system and installed xen-system-arm64 without any problem=
. But when I boot into xen hypervisor mode, the machine screen is<br>
&gt; black out without any output or any helpful debugging message.=C2=A0<b=
r>
&gt; <br>
&gt; =C2=A0 Could you generously=C2=A0provide some hints for debugging the =
issue?=C2=A0 Thank you very much in advance and looking=C2=A0forward to hea=
ring from you.<br>
&gt; <br>
&gt; --<br>
&gt; <br>
&gt; Best Regards,<br>
&gt; <br>
&gt; Jiatong Shen<br>
&gt; <br>
&gt; </blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gma=
il_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signatur=
e"><div dir=3D"ltr"><br><div>Best Regards,</div><div><br></div><div>Jiatong=
 Shen</div></div></div>

--000000000000e380be05fda837b6--

