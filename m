Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9235D8A3442
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 19:02:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704817.1101407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvKHP-0003kQ-2q; Fri, 12 Apr 2024 17:01:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704817.1101407; Fri, 12 Apr 2024 17:01:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvKHP-0003im-02; Fri, 12 Apr 2024 17:01:35 +0000
Received: by outflank-mailman (input) for mailman id 704817;
 Fri, 12 Apr 2024 17:01:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fc9m=LR=gmail.com=julien.grall.oss@srs-se1.protection.inumbo.net>)
 id 1rvKHO-0003ig-0s
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2024 17:01:34 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f597418-f8ee-11ee-94a3-07e782e9044d;
 Fri, 12 Apr 2024 19:01:31 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-346f4266e59so817992f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Apr 2024 10:01:31 -0700 (PDT)
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
X-Inumbo-ID: 4f597418-f8ee-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712941291; x=1713546091; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ueitQytYne9OVwQaypVcnl+jAqVfXtnGsCDMUbf4oFU=;
        b=ZE/RfaT4X7WXBm0k2gAPVRMA4ZTqJ5ObMe4N8X9znQ9LuGiZ/QRP5Qw25uyR/nrQcD
         /lACQ6w105Yh+7vZ1T2oap8s2Q5D9kHWwRh5Elo7SoTExoU95hleRDy15z83GTGRNSU5
         K5rrjHF4NigANj+itEJVLZbpw6SVoBn1Ow0v5AfGoVYdPyQpP7rvdOblnGcdBe63YiyW
         LhrLitcgoDwKrl/yr0lOg95dQQVbal4O1gXFQ83iv0eSj3WewDeg5yFPHtZbkbIMzZEG
         DScaPqfaawRSuqcWxWZ0hJkpYr2/hRJsPyz8B/braTVeghWf9mnzGy15y9xAZS8J4pRP
         brkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712941291; x=1713546091;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ueitQytYne9OVwQaypVcnl+jAqVfXtnGsCDMUbf4oFU=;
        b=GSSsrmWDVbknyx6c35NpOi3kE2YfBThiIs1TL6sf3T57p/HOSzRQq+AS8VvpxQcK9e
         v1Ep4F2AuNyWBiTL2G2gKiSsfT0vGbiJe9YcDzewW6JSBZ6ZsDMSPEZ2qXshmD7o+P4x
         r3JNSLMDCjAXkm3vT/G1XuZaJku3FgaytRzW2Nr+fBx0y21TF/vIKBE4sCikZqKSmWUB
         /Dj2NrBjHLQIPoAg8sKLuabLdtMCPvOKqqPuPZPw4pYJUQismC7v/e+6DpDDqyS07c+I
         QWvaeCxZk3XQ6aOTdSAsvLV0bUjxdFZKyOdsrwRQxPSLyuxe9sFV7YqV7F3TldOThbJo
         m8uQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjVDsVxPjRY6/xOtn2leqsO3I4Cgy/v4ZGaQsI5ARHNfV3sLSetxpWu0VVC71zDStvq3YmTlzP+V07aGuLsdA4pOI6/yYCviO8mtLGdFQ=
X-Gm-Message-State: AOJu0YyxSlZUqSEgzsezyKQP0bbPLnvio5/+EPrs2CsNUHpfLRP69fU9
	DPbasjcQ0Uj9fETuShykytqBIiwWQbj0y1BgE8P0/JVOR6dRc/2iZ5x9sRfq0Jttyxly1hCZAjb
	/8fNZQ+Ombj5fub97BiP3QraNeUs=
X-Google-Smtp-Source: AGHT+IFBZYHNpbDmEQN7Omwd524Ik0tbR/W+fqn7hl5rLjTm7FLPy6NlTFF6akOWTgAEWtc5H9R/M/ILVBdq3TXHRDQ=
X-Received: by 2002:a5d:484d:0:b0:343:69b4:b527 with SMTP id
 n13-20020a5d484d000000b0034369b4b527mr2035092wrs.18.1712941290627; Fri, 12
 Apr 2024 10:01:30 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.22.394.2404101644130.976094@ubuntu-linux-20-04-desktop>
 <20240410234740.994001-1-stefano.stabellini@amd.com> <CAJ=z9a3zMaSLSS0mfKT8dngVwrESycSspy8LnW4FZV6hdu_AAw@mail.gmail.com>
 <alpine.DEB.2.22.394.2404111454570.997881@ubuntu-linux-20-04-desktop>
 <CAJ=z9a2gOTLy2B7y9bELQHPhFmCpU2nhyV5zy9_uQvsvx5prqw@mail.gmail.com> <C8D49EE7-B214-41D5-9556-4D3B98629CEA@arm.com>
In-Reply-To: <C8D49EE7-B214-41D5-9556-4D3B98629CEA@arm.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Fri, 12 Apr 2024 13:01:19 -0400
Message-ID: <CAJ=z9a2ENW-3vh4N59csoeMHeMPGv9XFUuC6GrMTYMKM=FpwgQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] docs: add xen_ulong_t to the documented integers sizes/alignments
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Michal Orzel <michal.orzel@amd.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Stefano Stabellini <stefano.stabellini@amd.com>, 
	Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="0000000000002628d60615e9396c"

--0000000000002628d60615e9396c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 12 Apr 2024 at 11:30, Bertrand Marquis <Bertrand.Marquis@arm.com>
wrote:

> Hi Julien,
>
> > On 12 Apr 2024, at 15:53, Julien Grall <julien.grall.oss@gmail.com>
> wrote:
> >
> >
> >
> > On Thu, 11 Apr 2024 at 18:08, Stefano Stabellini <sstabellini@kernel.or=
g>
> wrote:
> > On Wed, 10 Apr 2024, Julien Grall wrote:
> > > On Wed, 10 Apr 2024 at 19:47, Stefano Stabellini <
> stefano.stabellini@amd.com> wrote:
> > >       xen_ulong_t is widely used in public headers.
> > >
> > >       Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > >       ---
> > >
> > >       Given that xen_ulong_t is used in public headers there could be
> a better
> > >       place for documenting it but this was the most straightforward
> to add.
> > >       ---
> > >        docs/misra/C-language-toolchain.rst | 11 +++++++++++
> > >        1 file changed, 11 insertions(+)
> > >
> > >       diff --git a/docs/misra/C-language-toolchain.rst
> b/docs/misra/C-language-toolchain.rst
> > >       index 5ddfe7bdbe..7a334260e6 100644
> > >       --- a/docs/misra/C-language-toolchain.rst
> > >       +++ b/docs/misra/C-language-toolchain.rst
> > >       @@ -531,6 +531,17 @@ A summary table of data types, sizes and
> alignment is below:
> > >             - 64 bits
> > >             - x86_64, ARMv8-A AArch64, RV64, PPC64
> > >
> > >       +   * - xen_ulong_t
> > >       +     - 32 bits
> > >       +     - 32 bits
> > >       +     - x86_32
> > >       +
> > >       +   * - xen_ulong_t
> > >       +     - 64 bits
> > >       +     - 64 bits
> > >       +     - x86_64, ARMv8-A AArch64, RV64, PPC64, ARMv8-A AArch32,
> ARMv8-R
> > >       +       AArch32, ARMv7-A
> > >
> > >
> > > We support neither ARMv8-R nor ARMv8-A Aarch32.
> > >
> > > I could possibly accept the latter because it works to. But the forme=
r
> is so far misleading.
> >
> > Yes I think you are right. Moreover this document
> > (C-language-toolchain.rst) is meant for the Xen build. While this patch
> > is trying to document the types used in the public headers for the
> > external-facing ABI.
> >
> > I'll move the information this patch is adding to a separate document,
> > specific to the public headers. I will only add the architectures
> > currently working: I'll add ARMv8-A Aarch32 because although it is
> > unsupported it is interesting to know the size of xen_ulong_t for
> > aarch32 in the public headers. I will remove ARMv8-R as it is not
> > available upstream.
> >
> > Thinking a bit more. What about Armv9? Rather than listing each version=
,
> should we instead use ARMv7-A aarch32 and later, ARMv8-A aarch64 and late=
r?
>
> Definitely you are right here but as for Armv8-R, Armv9 is not something
> that we explicitely support right now (even though it should work).


I am confused with the comparison. I thought you can=E2=80=99t boot Xen at =
all on
Armv8-R. But you can on Armv9-A as this just Armv8-A + features the
software don=E2=80=99t need to use.

Did you intend to draw the comparison with Armv8-A Aarch32?

Cheers,


>
> Cheers
> Bertrand
>
>
>

--0000000000002628d60615e9396c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, 12 Apr 2024 at 11:30, Bertrand Marquis &lt;<a href=
=3D"mailto:Bertrand.Marquis@arm.com">Bertrand.Marquis@arm.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-l=
eft-color:rgb(204,204,204)">Hi Julien,<br>
<br>
&gt; On 12 Apr 2024, at 15:53, Julien Grall &lt;<a href=3D"mailto:julien.gr=
all.oss@gmail.com" target=3D"_blank">julien.grall.oss@gmail.com</a>&gt; wro=
te:<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; On Thu, 11 Apr 2024 at 18:08, Stefano Stabellini &lt;<a href=3D"mailto=
:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; w=
rote:<br>
&gt; On Wed, 10 Apr 2024, Julien Grall wrote:<br>
&gt; &gt; On Wed, 10 Apr 2024 at 19:47, Stefano Stabellini &lt;<a href=3D"m=
ailto:stefano.stabellini@amd.com" target=3D"_blank">stefano.stabellini@amd.=
com</a>&gt; wrote:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0xen_ulong_t is widely used in public he=
aders.<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Signed-off-by: Stefano Stabellini &lt;<=
a href=3D"mailto:stefano.stabellini@amd.com" target=3D"_blank">stefano.stab=
ellini@amd.com</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0---<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Given that xen_ulong_t is used in publi=
c headers there could be a better<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0place for documenting it but this was t=
he most straightforward to add.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0---<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 docs/misra/C-language-toolchain.rst | =
11 +++++++++++<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 1 file changed, 11 insertions(+)<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git a/docs/misra/C-language-tool=
chain.rst b/docs/misra/C-language-toolchain.rst<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0index 5ddfe7bdbe..7a334260e6 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0--- a/docs/misra/C-language-toolchain.r=
st<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0+++ b/docs/misra/C-language-toolchain.r=
st<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0@@ -531,6 +531,17 @@ A summary table of=
 data types, sizes and alignment is below:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- 64 bits<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- x86_64, ARMv8-A =
AArch64, RV64, PPC64<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0* - xen_ulong_t<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0- 32 bits<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0- 32 bits<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0- x86_32<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0+<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0* - xen_ulong_t<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0- 64 bits<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0- 64 bits<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0- x86_64, ARMv8-A =
AArch64, RV64, PPC64, ARMv8-A AArch32, ARMv8-R<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0AArch32, AR=
Mv7-A<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; We support neither ARMv8-R nor ARMv8-A Aarch32.<br>
&gt; &gt; <br>
&gt; &gt; I could possibly accept the latter because it works to. But the f=
ormer is so far misleading.<br>
&gt; <br>
&gt; Yes I think you are right. Moreover this document<br>
&gt; (C-language-toolchain.rst) is meant for the Xen build. While this patc=
h<br>
&gt; is trying to document the types used in the public headers for the<br>
&gt; external-facing ABI.<br>
&gt; <br>
&gt; I&#39;ll move the information this patch is adding to a separate docum=
ent,<br>
&gt; specific to the public headers. I will only add the architectures<br>
&gt; currently working: I&#39;ll add ARMv8-A Aarch32 because although it is=
<br>
&gt; unsupported it is interesting to know the size of xen_ulong_t for<br>
&gt; aarch32 in the public headers. I will remove ARMv8-R as it is not<br>
&gt; available upstream.<br>
&gt; <br>
&gt; Thinking a bit more. What about Armv9? Rather than listing each versio=
n, should we instead use ARMv7-A aarch32 and later, ARMv8-A aarch64 and lat=
er?<br>
<br>
Definitely you are right here but as for Armv8-R, Armv9 is not something th=
at we explicitely support right now (even though it should work).</blockquo=
te><div dir=3D"auto"><br></div><div dir=3D"auto">I am confused with the com=
parison. I thought you can=E2=80=99t boot Xen at all on Armv8-R. But you ca=
n on Armv9-A as this just Armv8-A + features the software don=E2=80=99t nee=
d to use.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Did you intend=
 to draw the comparison with Armv8-A Aarch32?</div><div dir=3D"auto"><br></=
div><div dir=3D"auto">Cheers,</div><div dir=3D"auto"><br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1=
px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,2=
04)" dir=3D"auto"><br>
<br>
Cheers<br>
Bertrand<br>
<br>
<br>
</blockquote></div></div>

--0000000000002628d60615e9396c--

