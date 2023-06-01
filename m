Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D34719BD0
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 14:18:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542442.846307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4hFd-0007Nk-6l; Thu, 01 Jun 2023 12:17:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542442.846307; Thu, 01 Jun 2023 12:17:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4hFd-0007Lb-2U; Thu, 01 Jun 2023 12:17:57 +0000
Received: by outflank-mailman (input) for mailman id 542442;
 Thu, 01 Jun 2023 12:17:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mhak=BV=gmail.com=julien.grall.oss@srs-se1.protection.inumbo.net>)
 id 1q4hFb-0007LV-KD
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 12:17:55 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55d606ea-0076-11ee-b231-6b7b168915f2;
 Thu, 01 Jun 2023 14:17:54 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f3bb61f860so887561e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Jun 2023 05:17:54 -0700 (PDT)
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
X-Inumbo-ID: 55d606ea-0076-11ee-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685621874; x=1688213874;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Qs9+tnXanwgcK4qrGEwkuBM1Q57MST68fw5CtbuJTMA=;
        b=BZRYUIQEgP44d4XsCczLEwM1p1QtOJFSxg5kb+asid/w7gjG6XYreSQxEw9mLT9I0K
         pixvcNs+Xd8FZbmKtEp/gKCd49cVTvd62UzSt2Me/ouRIzX25TbInUfmyTu/uk+V9HQn
         UOwu/ZIxCaBlkdGm4qw4TD6/55rzFRoDZTkH8HjFa7hAP8/RiR4XemQXR0PdFXc60TEd
         5BuFKwgJB8IeB99971ChO+fhdiyyZ3OS0TGaH+AFPY30uiYOMQ7PwQchsRyzSoDfdRFA
         E2JSPvX46RxAgf8J+QIjL9CEPhSF1Wt+JPPZiKLJfIqjDB2dvTe4p6eHOJXgYRwRz/ua
         Qpew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685621874; x=1688213874;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qs9+tnXanwgcK4qrGEwkuBM1Q57MST68fw5CtbuJTMA=;
        b=F88BuilfQl1pvx0NOR5bzK3LNyd9wEb/oGTIiMs9kksjPt/z39YG1SeUQk5eAfFZT3
         RoxKqMQobiIGFTrXFP9dJqRuglkHdPXVXyMatWSRrTMIKfFutR9qyF0B6bhL5oTTVI03
         LdEFP/xKcZtcNk8pflXLZDnUBSOfLFCuyr5Q0D31y6gXv3Unj+WUAxhdEpsVJigLZuaF
         +5IEE2wJc6Wr8v7WKAadVJm73auMu5/SexpTsRLo60G0ekBiKREQN5a7tZSM8h4iV/k1
         KuElzUPJlQgLwwLMxOvi7KgajoApoxNiDe73gvOJa9ZdWF/zFGNd97Ec6zi0UaUepw4s
         MMmw==
X-Gm-Message-State: AC+VfDyV050DpW9zlbYhxQJ+A22+0yxsinGwyxNOYK9utrcjWj2Ky7u4
	ydZ7Q8nOvUSkX4yoMpM3bYoAD/B4smDRaUjinUU=
X-Google-Smtp-Source: ACHHUZ5eW811q473omos35ztfVZRcrdG7RLAhpwH316mBd2kSZdFT+vw5sKYKRoeMO6EY695sHz9J2iSgJblU5OAED4=
X-Received: by 2002:ac2:5dd3:0:b0:4f3:a0f0:7c4e with SMTP id
 x19-20020ac25dd3000000b004f3a0f07c4emr1432427lfq.35.1685621873377; Thu, 01
 Jun 2023 05:17:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230601085001.1782-1-michal.orzel@amd.com> <7C760D1D-DAAE-48AC-8B2B-E6140452BE4A@arm.com>
 <73a143ee-8301-e0c0-a3fc-83ec10441c4c@amd.com> <CAJ=z9a3iZHwXPwWiJykeSJbi0YvfD-L6SO3LxxRom=DPAqPuVg@mail.gmail.com>
 <703ccd1b-1908-4f5b-3b48-e02d317a2090@amd.com>
In-Reply-To: <703ccd1b-1908-4f5b-3b48-e02d317a2090@amd.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Thu, 1 Jun 2023 14:17:41 +0200
Message-ID: <CAJ=z9a1V2XNKyc9gQjxhqRmTjpfamQfC5DfZfXZ15VoNqp2wNQ@mail.gmail.com>
Subject: Re: [PATCH] xen/arm: debug-pl011: Use 32-bit accessors for broader compatibility
To: Michal Orzel <michal.orzel@amd.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000fd06dc05fd106c10"

--000000000000fd06dc05fd106c10
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 1 Jun 2023 at 13:48, Michal Orzel <michal.orzel@amd.com> wrote:

> Hi Julien,
>
> On 01/06/2023 13:12, Julien Grall wrote:
> >
> >
> >
> > Hi,
> >
> > Sorry for the formatting.
> >
> > On Thu, 1 Jun 2023 at 12:31, Michal Orzel <michal.orzel@amd.com <mailto=
:
> michal.orzel@amd.com>> wrote:
> >
> >     Hi Bertrand,
> >
> >     On 01/06/2023 12:19, Bertrand Marquis wrote:
> >     >
> >     >
> >     > Hi Michal,
> >     >
> >     >> On 1 Jun 2023, at 10:50, Michal Orzel <michal.orzel@amd.com
> <mailto:michal.orzel@amd.com>> wrote:
> >     >>
> >     >> There are implementations of the PL011 that can only handle 32-b=
it
> >     >> accesses (i.e. no 16-bit or 8-bit), usually advertised by
> 'reg-io-width'
> >     >> dt property set to 4. On such UARTs, the current early printk
> code for
> >     >> arm64 does not work. To fix this issue, make all the accesses to
> be 32-bit
> >     >> by using ldr, str without a size field. This makes it possible t=
o
> use
> >     >> early printk on such platforms, while all the other
> implementations should
> >     >> generally cope with 32-bit accesses. In case they do not, they
> would
> >     >> already fail as we explicitly use writel/readl in the runtime
> driver to
> >     >> maintain broader compatibility and to be SBSAv2 compliant.
> Therefore, this
> >     >> change makes the runtime/early handling consistent (also it
> matches the
> >     >> arm32 debug-pl011 code).
> >     >>
> >     >> Signed-off-by: Michal Orzel <michal.orzel@amd.com <mailto:
> michal.orzel@amd.com>>
> >     >> ---
> >     >> xen/arch/arm/arm64/debug-pl011.inc | 8 ++++----
> >     >> 1 file changed, 4 insertions(+), 4 deletions(-)
> >     >>
> >     >> diff --git a/xen/arch/arm/arm64/debug-pl011.inc
> b/xen/arch/arm/arm64/debug-pl011.inc
> >     >> index 6d60e78c8ba3..80eb8fdc1ec7 100644
> >     >> --- a/xen/arch/arm/arm64/debug-pl011.inc
> >     >> +++ b/xen/arch/arm/arm64/debug-pl011.inc
> >     >> @@ -25,9 +25,9 @@
> >     >>  */
> >     >> .macro early_uart_init xb, c
> >     >>         mov   x\c, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE
> % 16)
> >     >> -        strh  w\c, [\xb, #FBRD]      /* -> UARTFBRD (Baud
> divisor fraction) */
> >     >> +        str   w\c, [\xb, #FBRD]      /* -> UARTFBRD (Baud
> divisor fraction) */
> >     >>         mov   x\c, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE
> / 16)
> >     >> -        strh  w\c, [\xb, #IBRD]      /* -> UARTIBRD (Baud
> divisor integer) */
> >     >> +        str   w\c, [\xb, #IBRD]      /* -> UARTIBRD (Baud
> divisor integer) */
> >     >>         mov   x\c, #WLEN_8           /* 8n1 */
> >     >>         str   w\c, [\xb, #LCR_H]     /* -> UARTLCR_H (Line
> control) */
> >     >>         ldr   x\c, =3D(RXE | TXE | UARTEN)
> >     >> @@ -41,7 +41,7 @@
> >     >>  */
> >     >> .macro early_uart_ready xb, c
> >     >> 1:
> >     >> -        ldrh  w\c, [\xb, #FR]        /* <- UARTFR (Flag
> register) */
> >     >> +        ldr   w\c, [\xb, #FR]        /* <- UARTFR (Flag
> register) */
> >     >>         tst   w\c, #BUSY             /* Check BUSY bit */
> >     >>         b.ne <http://b.ne>  1b                     /* Wait for
> the UART to be ready */
> >     >> .endm
> >     >> @@ -52,7 +52,7 @@
> >     >>  * wt: register which contains the character to transmit
> >     >>  */
> >     >> .macro early_uart_transmit xb, wt
> >     >> -        strb  \wt, [\xb, #DR]        /* -> UARTDR (Data
> Register) */
> >     >> +        str   \wt, [\xb, #DR]        /* -> UARTDR (Data
> Register) */
> >     >
> >     > Is it really ok to drop the 8bit access here ?
> >     It is not only ok, it is necessary. Otherwise it won't work on the
> above mentioned UARTs (they can only perform 32-bit access).
> >
> >
> > IIRC some compilers will complain because you use wN with =E2=80=9Cstr=
=E2=80=9D.
> Hmm, I would expect it to be totally ok as the size is determined by the
> reg name. Any reference?


I don=E2=80=99t have the spec with me. I will have a look on Monday and rep=
ly back
here.


>
> >
> >
> >     And following to what I wrote in commit msg:
> >     - we use str already in arm32 which results in 32-bit access
> >
> >
> >     - we use reald/writel that end up as str/ldr in runtime driver
> >
> >
> >     - we are down to SBSAv2 spec that runtime driver follows (meaning w=
e
> can use early printk for SBSA too)
> >
> >
> > The runtime driver is meant to follow the PL011 spec first and may have
> some adaptation for SBSA.
> >
> >
> >     - this way we support broader list of PL011s consistently (i.e. bot=
h
> early and runtime driver works as oppose to only runtime)
> >
> >
> >  I am not sure I agree here. You are focussing on HW that only support
> 32-bit access. And, AFAICT this shouldn=E2=80=99t be the norm.
> I'm focusing on supporting wider range of devices.
> At the moment Xen PL011 runtime makes 32-bit accesses while early code
> makes 8/16-bit accesses (arm32 uses 32-bit only as well).
> So my patch can only improve things and not make them worse. In case of
> some very old legacy device that cannot cope with 32-bit accesses,
> such device would not work anyway with the runtime driver.


It depends how you approach the problem. From my POV, a user that can=E2=80=
=99t see
logs will likely try to enable the early UART. Then they could debug the
runtime driver. With your proposal, this would even be broken.

Also, while I'm aware of platforms with 32-bit only UART and the normal one
> that can cope with 32-bit as well, I'm not aware of any legacy one that
> cannot do that.


I am under the impression that the default behaviour on Linux is to use non
32-big access. I would not want to diverge from that.


>
> Adding a config option like EARLY_UART_PL011_MMIO32 would be ok but it
> would require to also modify arm32 early printk and runtime driver.


I don=E2=80=99t view it as a requirement. It would be OK to have it only av=
ailable
for 64-but at the beginning. Same for the runtime.


> Not mentioning things that we somehow do not want to look at like
> hardcoded 7372800 HZ frequency for early_uart_init we can just pray
> to match the HW UART clock or other not PL011 spec things (i.e. incorrect
> FIFO size for most modern UARTs).


I am aware of this issue but I don=E2=80=99t understand how this is related=
 to this
discussion.

My only request is you don=E2=80=99t break the existing behavior of the ear=
ly PL011
driver on arm64.


>
> But if this is what you require, I'm somewhat forced to do so just so tha=
t
> our devices can be supported.


See above.


>
> ~Michal
>

--000000000000fd06dc05fd106c10
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, 1 Jun 2023 at 13:48, Michal Orzel &lt;<a href=3D"ma=
ilto:michal.orzel@amd.com">michal.orzel@amd.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(=
204,204,204)">Hi Julien,<br>
<br>
On 01/06/2023 13:12, Julien Grall wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt; <br>
&gt; <br>
&gt; Hi,<br>
&gt; <br>
&gt; Sorry for the formatting.<br>
&gt; <br>
&gt; On Thu, 1 Jun 2023 at 12:31, Michal Orzel &lt;<a href=3D"mailto:michal=
.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a hr=
ef=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</=
a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi Bertrand,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 01/06/2023 12:19, Bertrand Marquis wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Hi Michal,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; On 1 Jun 2023, at 10:50, Michal Orzel &lt;=
<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.=
com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank=
">michal.orzel@amd.com</a>&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; There are implementations of the PL011 tha=
t can only handle 32-bit<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; accesses (i.e. no 16-bit or 8-bit), usuall=
y advertised by &#39;reg-io-width&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; dt property set to 4. On such UARTs, the c=
urrent early printk code for<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; arm64 does not work. To fix this issue, ma=
ke all the accesses to be 32-bit<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; by using ldr, str without a size field. Th=
is makes it possible to use<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; early printk on such platforms, while all =
the other implementations should<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; generally cope with 32-bit accesses. In ca=
se they do not, they would<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; already fail as we explicitly use writel/r=
eadl in the runtime driver to<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; maintain broader compatibility and to be S=
BSAv2 compliant. Therefore, this<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; change makes the runtime/early handling co=
nsistent (also it matches the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; arm32 debug-pl011 code).<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; Signed-off-by: Michal Orzel &lt;<a href=3D=
"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a> &l=
t;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.o=
rzel@amd.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; xen/arch/arm/arm64/debug-pl011.inc | 8 +++=
+----<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; 1 file changed, 4 insertions(+), 4 deletio=
ns(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; diff --git a/xen/arch/arm/arm64/debug-pl01=
1.inc b/xen/arch/arm/arm64/debug-pl011.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; index 6d60e78c8ba3..80eb8fdc1ec7 100644<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; --- a/xen/arch/arm/arm64/debug-pl011.inc<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; +++ b/xen/arch/arm/arm64/debug-pl011.inc<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; @@ -25,9 +25,9 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; .macro early_uart_init xb, c<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov=C2=A0=
 =C2=A0x\c, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE % 16)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 strh=C2=A0 w\=
c, [\xb, #FBRD]=C2=A0 =C2=A0 =C2=A0 /* -&gt; UARTFBRD (Baud divisor fractio=
n) */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 str=C2=A0 =C2=
=A0w\c, [\xb, #FBRD]=C2=A0 =C2=A0 =C2=A0 /* -&gt; UARTFBRD (Baud divisor fr=
action) */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov=C2=A0=
 =C2=A0x\c, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE / 16)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 strh=C2=A0 w\=
c, [\xb, #IBRD]=C2=A0 =C2=A0 =C2=A0 /* -&gt; UARTIBRD (Baud divisor integer=
) */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 str=C2=A0 =C2=
=A0w\c, [\xb, #IBRD]=C2=A0 =C2=A0 =C2=A0 /* -&gt; UARTIBRD (Baud divisor in=
teger) */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov=C2=A0=
 =C2=A0x\c, #WLEN_8=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 8n1 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0str=C2=A0=
 =C2=A0w\c, [\xb, #LCR_H]=C2=A0 =C2=A0 =C2=A0/* -&gt; UARTLCR_H (Line contr=
ol) */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldr=C2=A0=
 =C2=A0x\c, =3D(RXE | TXE | UARTEN)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; @@ -41,7 +41,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; .macro early_uart_ready xb, c<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; 1:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ldrh=C2=A0 w\=
c, [\xb, #FR]=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* &lt;- UARTFR (Flag register) */=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ldr=C2=A0 =C2=
=A0w\c, [\xb, #FR]=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* &lt;- UARTFR (Flag registe=
r) */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst=C2=A0=
 =C2=A0w\c, #BUSY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Check B=
USY bit */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=
=3D"http://b.ne" rel=3D"noreferrer" target=3D"_blank">b.ne</a> &lt;<a href=
=3D"http://b.ne" rel=3D"noreferrer" target=3D"_blank">http://b.ne</a>&gt;=
=C2=A0 1b=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* Wait for the UART to be ready */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; .endm<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; @@ -52,7 +52,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 * wt: register which contains the ch=
aracter to transmit<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; .macro early_uart_transmit xb, wt<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 strb=C2=A0 \w=
t, [\xb, #DR]=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* -&gt; UARTDR (Data Register) */=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 str=C2=A0 =C2=
=A0\wt, [\xb, #DR]=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* -&gt; UARTDR (Data Registe=
r) */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Is it really ok to drop the 8bit access here ?=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0It is not only ok, it is necessary. Otherwise it wo=
n&#39;t work on the above mentioned UARTs (they can only perform 32-bit acc=
ess).<br>
&gt; <br>
&gt; <br>
&gt; IIRC some compilers will complain because you use wN with =E2=80=9Cstr=
=E2=80=9D.<br>
Hmm, I would expect it to be totally ok as the size is determined by the re=
g name. Any reference?</blockquote><div dir=3D"auto"><br></div><div dir=3D"=
auto">I don=E2=80=99t have the spec with me. I will have a look on Monday a=
nd reply back here.</div><div dir=3D"auto"><br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-=
left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)" dir=
=3D"auto"><br>
<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0And following to what I wrote in commit msg:<br>
&gt;=C2=A0 =C2=A0 =C2=A0- we use str already in arm32 which results in 32-b=
it access<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0- we use reald/writel that end up as str/ldr in run=
time driver<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0- we are down to SBSAv2 spec that runtime driver fo=
llows (meaning we can use early printk for SBSA too)<br>
&gt; <br>
&gt; <br>
&gt; The runtime driver is meant to follow the PL011 spec first and may hav=
e some adaptation for SBSA.<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0- this way we support broader list of PL011s consis=
tently (i.e. both early and runtime driver works as oppose to only runtime)=
<br>
&gt; <br>
&gt; <br>
&gt; =C2=A0I am not sure I agree here. You are focussing on HW that only su=
pport 32-bit access. And, AFAICT this shouldn=E2=80=99t be the norm.<br>
I&#39;m focusing on supporting wider range of devices.<br>
At the moment Xen PL011 runtime makes 32-bit accesses while early code make=
s 8/16-bit accesses (arm32 uses 32-bit only as well).<br>
So my patch can only improve things and not make them worse. In case of som=
e very old legacy device that cannot cope with 32-bit accesses,<br>
such device would not work anyway with the runtime driver.</blockquote><div=
 dir=3D"auto"><br></div><div dir=3D"auto">It depends how you approach the p=
roblem. From my POV, a user that can=E2=80=99t see logs will likely try to =
enable the early UART. Then they could debug the runtime driver. With your =
proposal, this would even be broken.</div><div dir=3D"auto"><br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-=
width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(20=
4,204,204)" dir=3D"auto">Also, while I&#39;m aware of platforms with 32-bit=
 only UART and the normal one<br>
that can cope with 32-bit as well, I&#39;m not aware of any legacy one that=
 cannot do that.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">=
I am under the impression that the default behaviour on Linux is to use non=
 32-big access. I would not want to diverge from that.</div><div dir=3D"aut=
o"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border=
-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
Adding a config option like EARLY_UART_PL011_MMIO32 would be ok but it woul=
d require to also modify arm32 early printk and runtime driver.</blockquote=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:=
rgb(204,204,204)" dir=3D"auto"></blockquote><div dir=3D"auto"><br></div><di=
v dir=3D"auto">I don=E2=80=99t view it as a requirement. It would be OK to =
have it only available for 64-but at the beginning. Same for the runtime.</=
div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padd=
ing-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
Not mentioning things that we somehow do not want to look at like hardcoded=
 7372800 HZ frequency for early_uart_init we can just pray<br>
to match the HW UART clock or other not PL011 spec things (i.e. incorrect F=
IFO size for most modern UARTs).</blockquote><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">I am aware of this issue but I don=E2=80=99t understand how=
 this is related to this discussion.</div><div dir=3D"auto"><br></div><div =
dir=3D"auto">My only request is you don=E2=80=99t break the existing behavi=
or of the early PL011 driver on arm64.</div><div dir=3D"auto"><br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(=
204,204,204)" dir=3D"auto"><br>
<br>
But if this is what you require, I&#39;m somewhat forced to do so just so t=
hat our devices can be supported.</blockquote><div dir=3D"auto"><br></div><=
div dir=3D"auto">See above.=C2=A0</div><div dir=3D"auto"><br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wid=
th:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,2=
04,204)" dir=3D"auto"><br>
<br>
~Michal<br>
</blockquote></div></div>

--000000000000fd06dc05fd106c10--

