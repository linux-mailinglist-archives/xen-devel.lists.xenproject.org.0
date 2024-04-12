Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 681D68A2FF0
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 15:54:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704696.1101192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvHM2-00057T-AT; Fri, 12 Apr 2024 13:54:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704696.1101192; Fri, 12 Apr 2024 13:54:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvHM2-00055M-7s; Fri, 12 Apr 2024 13:54:10 +0000
Received: by outflank-mailman (input) for mailman id 704696;
 Fri, 12 Apr 2024 13:54:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fc9m=LR=gmail.com=julien.grall.oss@srs-se1.protection.inumbo.net>)
 id 1rvHM0-00053e-CL
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2024 13:54:08 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2031193a-f8d4-11ee-94a3-07e782e9044d;
 Fri, 12 Apr 2024 15:54:05 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-417d029bf15so6288545e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Apr 2024 06:54:05 -0700 (PDT)
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
X-Inumbo-ID: 2031193a-f8d4-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712930045; x=1713534845; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PtP52yyyBufQM5XbT/oUQOyMrb0Qg4dNHVJnd/TuKJE=;
        b=k29frupQiYL6MJeyikhMbkhFwbIlU6ID3q1yZL4gQSiEaqUPEIv9QkXECJZS+gKmrJ
         kPXMKOIfeK/jcbLaPH7f55XF1uwUgHrzrFM7jEeCAuT34/2w3JIQMOSK6Bgyza+Pb48M
         qFUMidHwWT9kwvF1gIorBCOdQpzi1DM0n+S1gkFJM/uWD2hOIk6w4Uf6EOSUqyrwMwdA
         bsQsX9hUCNG4ke/YSDaUAM/N9lA8YZaS9BLHDhjHPIlNIwGGhG8tvPbPy2mO2A2sSx4G
         0VEsynFf2euXiHREKubxYuqdduD3MLK6slMney81f0i/wxV6hG7IGubsWOfarRvRJA4C
         UnWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712930045; x=1713534845;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PtP52yyyBufQM5XbT/oUQOyMrb0Qg4dNHVJnd/TuKJE=;
        b=AZBXbvFsU2WpyqXycIFtCquLjr0oUxk1rvhxTZPC6W16h4zoCI1P5YrEXTccWC7n3G
         OmHfvnyC/w08KllVX2zj35/hNDoedLu/xHGM4jCdMHC12QQycAiVa2tYfqSDFC0xoW+m
         fw0vfQm5pEIMVmerIkjZu+XnU0msj56gNjLQjReiPOcRU7OsSnZebLMb528mN7eTA4wX
         +L5DVXWhDATTFWz9DbrHeb6BXvYPJoycjnacvwm1G3I7n+c0wYYY5rDkNonjn85UcRV6
         G6fUbPBMMuMOwdtD4k6Hbn3pZSpikC1aZAIfZO3FDSYYmtNwc0hsGJQelxW9FvuhMj0m
         EPcw==
X-Forwarded-Encrypted: i=1; AJvYcCWhDg438PWWBd6tynRK9StOX/4/o5yBdgl+TO97WLwp6VpmT36S4w4z53mUR8BlVR/ZcuG65Hay6jGNNxzQeD2IUC/5D6ez0EYRR6zQjVw=
X-Gm-Message-State: AOJu0YxH0LqQr+Y+OrpfB8mHjYJUa4SyDS93bR/nnlFjKUc0Pqy+w93N
	2Ce/VcFfRZxaDkj2Ppesf/gt0lX0JAirhBMAvOKghoq6jQl25MBHfTcPNw/IayEP+Nz1atTBuSg
	6uum1P9aCdGiMsxttH995PJdK5k4=
X-Google-Smtp-Source: AGHT+IEYBs4+pg3BRufSaVTUkHn/aUgpwUXY+ceBhwwwGciTK1jRRVuGi2MALLW0RzjbHFBpvml3QuMUcM/JN9uFwqU=
X-Received: by 2002:a5d:6945:0:b0:343:eb28:58e9 with SMTP id
 r5-20020a5d6945000000b00343eb2858e9mr1927491wrw.28.1712930044577; Fri, 12 Apr
 2024 06:54:04 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.22.394.2404101644130.976094@ubuntu-linux-20-04-desktop>
 <20240410234740.994001-1-stefano.stabellini@amd.com> <CAJ=z9a3zMaSLSS0mfKT8dngVwrESycSspy8LnW4FZV6hdu_AAw@mail.gmail.com>
 <alpine.DEB.2.22.394.2404111454570.997881@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2404111454570.997881@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Fri, 12 Apr 2024 09:53:53 -0400
Message-ID: <CAJ=z9a2gOTLy2B7y9bELQHPhFmCpU2nhyV5zy9_uQvsvx5prqw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] docs: add xen_ulong_t to the documented integers sizes/alignments
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>, andrew.cooper3@citrix.com, 
	bertrand.marquis@arm.com, george.dunlap@citrix.com, jbeulich@suse.com, 
	michal.orzel@amd.com, roger.pau@citrix.com, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000d512200615e69a03"

--000000000000d512200615e69a03
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Apr 2024 at 18:08, Stefano Stabellini <sstabellini@kernel.org>
wrote:

> On Wed, 10 Apr 2024, Julien Grall wrote:
> > On Wed, 10 Apr 2024 at 19:47, Stefano Stabellini <
> stefano.stabellini@amd.com> wrote:
> >       xen_ulong_t is widely used in public headers.
> >
> >       Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> >       ---
> >
> >       Given that xen_ulong_t is used in public headers there could be a
> better
> >       place for documenting it but this was the most straightforward to
> add.
> >       ---
> >        docs/misra/C-language-toolchain.rst | 11 +++++++++++
> >        1 file changed, 11 insertions(+)
> >
> >       diff --git a/docs/misra/C-language-toolchain.rst
> b/docs/misra/C-language-toolchain.rst
> >       index 5ddfe7bdbe..7a334260e6 100644
> >       --- a/docs/misra/C-language-toolchain.rst
> >       +++ b/docs/misra/C-language-toolchain.rst
> >       @@ -531,6 +531,17 @@ A summary table of data types, sizes and
> alignment is below:
> >             - 64 bits
> >             - x86_64, ARMv8-A AArch64, RV64, PPC64
> >
> >       +   * - xen_ulong_t
> >       +     - 32 bits
> >       +     - 32 bits
> >       +     - x86_32
> >       +
> >       +   * - xen_ulong_t
> >       +     - 64 bits
> >       +     - 64 bits
> >       +     - x86_64, ARMv8-A AArch64, RV64, PPC64, ARMv8-A AArch32,
> ARMv8-R
> >       +       AArch32, ARMv7-A
> >
> >
> > We support neither ARMv8-R nor ARMv8-A Aarch32.
> >
> > I could possibly accept the latter because it works to. But the former
> is so far misleading.
>
> Yes I think you are right. Moreover this document
> (C-language-toolchain.rst) is meant for the Xen build. While this patch
> is trying to document the types used in the public headers for the
> external-facing ABI.
>
> I'll move the information this patch is adding to a separate document,
> specific to the public headers. I will only add the architectures
> currently working: I'll add ARMv8-A Aarch32 because although it is
> unsupported it is interesting to know the size of xen_ulong_t for
> aarch32 in the public headers. I will remove ARMv8-R as it is not
> available upstream.


Thinking a bit more. What about Armv9? Rather than listing each version,
should we instead use ARMv7-A aarch32 and later, ARMv8-A aarch64 and later?

>

--000000000000d512200615e69a03
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, 11 Apr 2024 at 18:08, Stefano Stabellini &lt;<a hre=
f=3D"mailto:sstabellini@kernel.org">sstabellini@kernel.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">On Wed, 10 Apr 2024, Julien Grall wr=
ote:<br>
&gt; On Wed, 10 Apr 2024 at 19:47, Stefano Stabellini &lt;<a href=3D"mailto=
:stefano.stabellini@amd.com" target=3D"_blank">stefano.stabellini@amd.com</=
a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0xen_ulong_t is widely used in public headers=
.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Signed-off-by: Stefano Stabellini &lt;<a hre=
f=3D"mailto:stefano.stabellini@amd.com" target=3D"_blank">stefano.stabellin=
i@amd.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0---<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Given that xen_ulong_t is used in public hea=
ders there could be a better<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0place for documenting it but this was the mo=
st straightforward to add.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0docs/misra/C-language-toolchain.rst | =
11 +++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A01 file changed, 11 insertions(+)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git a/docs/misra/C-language-toolchain=
.rst b/docs/misra/C-language-toolchain.rst<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0index 5ddfe7bdbe..7a334260e6 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0--- a/docs/misra/C-language-toolchain.rst<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0+++ b/docs/misra/C-language-toolchain.rst<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0@@ -531,6 +531,17 @@ A summary table of data=
 types, sizes and alignment is below:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 - 64 bits<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 - x86_64, ARMv8-A AArch=
64, RV64, PPC64<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0* - xen_ulong_t<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0- 32 bits<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0- 32 bits<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0- x86_32<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0* - xen_ulong_t<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0- 64 bits<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0- 64 bits<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0- x86_64, ARMv8-A AArch=
64, RV64, PPC64, ARMv8-A AArch32, ARMv8-R<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0AArch32, ARMv7-A=
<br>
&gt; <br>
&gt; <br>
&gt; We support neither ARMv8-R nor ARMv8-A Aarch32.<br>
&gt; <br>
&gt; I could possibly accept the latter because it works to. But the former=
 is so far misleading.<br>
<br>
Yes I think you are right. Moreover this document<br>
(C-language-toolchain.rst) is meant for the Xen build. While this patch<br>
is trying to document the types used in the public headers for the<br>
external-facing ABI.<br>
<br>
I&#39;ll move the information this patch is adding to a separate document,<=
br>
specific to the public headers. I will only add the architectures<br>
currently working: I&#39;ll add ARMv8-A Aarch32 because although it is<br>
unsupported it is interesting to know the size of xen_ulong_t for<br>
aarch32 in the public headers. I will remove ARMv8-R as it is not<br>
available upstream.</blockquote><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Thinking a bit more. What about Armv9? Rather than listing each version,=
 should we instead use ARMv7-A aarch32 and later, ARMv8-A aarch64 and later=
?</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex" dir=3D"auto"></blockquote></div></div=
>

--000000000000d512200615e69a03--

