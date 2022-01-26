Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCD849D09C
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 18:22:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261061.451622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCm01-0000kD-K7; Wed, 26 Jan 2022 17:22:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261061.451622; Wed, 26 Jan 2022 17:22:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCm01-0000iM-Go; Wed, 26 Jan 2022 17:22:25 +0000
Received: by outflank-mailman (input) for mailman id 261061;
 Wed, 26 Jan 2022 17:22:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R8cR=SK=gmail.com=julien.grall.oss@srs-se1.protection.inumbo.net>)
 id 1nClzz-0000iG-Sw
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 17:22:23 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85bf3e7b-7ecc-11ec-8f75-fffcc8bd4f1a;
 Wed, 26 Jan 2022 18:22:22 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id s18so242890wrv.7
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jan 2022 09:22:22 -0800 (PST)
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
X-Inumbo-ID: 85bf3e7b-7ecc-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZpPpmdktCYWeYpR7EXdyce24R8LeLXW5+Tvet4H1Yyk=;
        b=YvkAWu6l7hB/bdWbFlPqy3ViwVOVxr8OT1Q7/9Pp4ATSctJnSoI5upVazBkUAgeMAx
         AfYQV7fsHO7pKDLyDqWTxnKVniUxJH9bb3sLra7yv97LNp1yNfdL+ngF+jl/MO3D56Rn
         t9jaZ6guWl0m1pG1DUvFxCn9EEpVebOmpajyB2gaERukmJUIzDu1uCOt4Q81NSPHm+Rn
         N6Ajo8ScFTgdHGFOIUkFzEC49LiOLBUF3IHtP7GmZxjR6QsuwEOHgTjt6DfEe4acvzd4
         mGBZjS5NPEcy8U/Qgj0DhLsAp5oKj7U4qN1y70INfeqOLbiiAISrMOi70QeqKviaIcy5
         Ah/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZpPpmdktCYWeYpR7EXdyce24R8LeLXW5+Tvet4H1Yyk=;
        b=Axubpi/JkPQTNLkb3Lfsh1Y47Lc/ycF5zR5QTC1xQWCWLH6RGY5xzag/o48KcJqvjX
         njthWDnY6FRD4LbIvTDFqqNfT0/NTFh6448sODe9tW0+ancFVRkF8K4I8rFp4eQiAoTR
         ohZdn9RLPGZj4dlw2z1S6QPRtGBIqkkZN52da6IcpbRvBr5+SC2FpD76KYKcBJjpfUSv
         nAElygNHNfjmaZs8Q8rxkT9Ewh0Ur1XJhEpQiJgEqzC5mWxydQctClW8iO1C0oiSD/sR
         trzuaYYC4Bjul6+SbmAmY5J9K+FzQAIoCqHK/EQ11UAnoFIQ+G2ollEmnsxQ+xxIMem9
         NH9Q==
X-Gm-Message-State: AOAM533mlKGI3x9Q8spg4FqUdJOAZhWsyKe4W+EazOy6wS6Li5R4ufvW
	803P9LR7P1v0z+mgvKoOoPWU/w8Snd9R/T2klaI=
X-Google-Smtp-Source: ABdhPJybzQa8gCoqJr3lcRyUAe/cU1ECdpzDAwpRBwxDGr+SMyODvZ7g5lrw2pCTCEbr/eXKlM5Ok5KGIsERxJaiVHU=
X-Received: by 2002:adf:d1e9:: with SMTP id g9mr23003597wrd.94.1643217742030;
 Wed, 26 Jan 2022 09:22:22 -0800 (PST)
MIME-Version: 1.0
References: <20220126165827.61168-1-ayankuma@xilinx.com>
In-Reply-To: <20220126165827.61168-1-ayankuma@xilinx.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Wed, 26 Jan 2022 17:22:11 +0000
Message-ID: <CAJ=z9a1KjOAeR4vpRQGA_sYSvx1h331NKim2bgG8jyru94Beow@mail.gmail.com>
Subject: Re: [XEN v1] xen/arm: io: Check ESR_EL2.ISV != 0 before searching for
 a MMIO handler
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, stefanos@xilinx.com, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Ayan Kumar Halder <ayankuma@xilinx.com>
Content-Type: multipart/alternative; boundary="000000000000cd6b4605d67f7155"

--000000000000cd6b4605d67f7155
Content-Type: text/plain; charset="UTF-8"

Hi,

On Wed, 26 Jan 2022, 16:58 Ayan Kumar Halder, <ayan.kumar.halder@xilinx.com>
wrote:

> Refer to Armv8 ARM DDI 0487G.b, Page D13-3219 "ISS encoding for an
> exception
> from a Data Abort" :-
> ISV - ISS[23:14] holds a valid instruction syndrome
>
> When the ISV is 0, the instruction could not be decoded by the hardware
> (ie ISS
> is invalid). One should immediately return an error to the caller with an
> appropriate error message.


That's going to be very spammy because we have use-case where it could trap
without a valid ISV (e.g. when break-before-make happens). So please don't
had a message.

That makes me think that the same will be valid for your other patch.

There is no use of the MMIO handler. This is the
> reason why one should check for ISV before attempting to find a MMIO
> handler.
>
> Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
> ---
>
> Suggested by Julien Grall in
> https://lists.xenproject.org/archives/html/xen-devel/2022-01/msg01245.html
>
>  xen/arch/arm/io.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
> index 729287e37c..14d39222f2 100644
> --- a/xen/arch/arm/io.c
> +++ b/xen/arch/arm/io.c
> @@ -109,6 +109,13 @@ enum io_state try_handle_mmio(struct cpu_user_regs
> *regs,
>
>      ASSERT(hsr.ec == HSR_EC_DATA_ABORT_LOWER_EL);
>
> +    /* All the instructions used on emulated MMIO region should be valid
> */
> +    if ( !dabt.valid )
> +    {
> +        gprintk(XENLOG_DEBUG, "No valid instruction syndrome for data
> abort\n");
> +        return IO_ABORT;
> +    }
> +
>      handler = find_mmio_handler(v->domain, info.gpa);
>      if ( !handler )
>      {
> @@ -121,10 +128,6 @@ enum io_state try_handle_mmio(struct cpu_user_regs
> *regs,
>          return rc;
>      }
>
> -    /* All the instructions used on emulated MMIO region should be valid
> */
> -    if ( !dabt.valid )
> -        return IO_ABORT;
> -
>      /*
>       * Erratum 766422: Thumb store translation fault to Hypervisor may
>       * not have correct HSR Rt value.
> --
> 2.17
>

--000000000000cd6b4605d67f7155
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi,<br><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, 26 Jan 2022, 16:58 Ayan Kumar Halder, &lt;<=
a href=3D"mailto:ayan.kumar.halder@xilinx.com">ayan.kumar.halder@xilinx.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Refer to Armv8 ARM =
DDI 0487G.b, Page D13-3219 &quot;ISS encoding for an exception<br>
from a Data Abort&quot; :-<br>
ISV - ISS[23:14] holds a valid instruction syndrome<br>
<br>
When the ISV is 0, the instruction could not be decoded by the hardware (ie=
 ISS<br>
is invalid). One should immediately return an error to the caller with an<b=
r>
appropriate error message. </blockquote></div></div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">That&#39;s going to be very spammy because we have u=
se-case where it could trap without a valid ISV (e.g. when break-before-mak=
e happens). So please don&#39;t had a message.</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">That makes me think that the same will be valid for =
your other patch.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div c=
lass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">There is no use of the =
MMIO handler. This is the<br>
reason why one should check for ISV before attempting to find a MMIO handle=
r.<br>
<br>
Signed-off-by: Ayan Kumar Halder &lt;<a href=3D"mailto:ayankuma@xilinx.com"=
 target=3D"_blank" rel=3D"noreferrer">ayankuma@xilinx.com</a>&gt;<br>
---<br>
<br>
Suggested by Julien Grall in <a href=3D"https://lists.xenproject.org/archiv=
es/html/xen-devel/2022-01/msg01245.html" rel=3D"noreferrer noreferrer" targ=
et=3D"_blank">https://lists.xenproject.org/archives/html/xen-devel/2022-01/=
msg01245.html</a><br>
<br>
=C2=A0xen/arch/arm/io.c | 11 +++++++----<br>
=C2=A01 file changed, 7 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c<br>
index 729287e37c..14d39222f2 100644<br>
--- a/xen/arch/arm/io.c<br>
+++ b/xen/arch/arm/io.c<br>
@@ -109,6 +109,13 @@ enum io_state try_handle_mmio(struct cpu_user_regs *re=
gs,<br>
<br>
=C2=A0 =C2=A0 =C2=A0ASSERT(<a href=3D"http://hsr.ec" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">hsr.ec</a> =3D=3D HSR_EC_DATA_ABORT_LOWER_EL);<br=
>
<br>
+=C2=A0 =C2=A0 /* All the instructions used on emulated MMIO region should =
be valid */<br>
+=C2=A0 =C2=A0 if ( !dabt.valid )<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 gprintk(XENLOG_DEBUG, &quot;No valid instructi=
on syndrome for data abort\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return IO_ABORT;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0handler =3D find_mmio_handler(v-&gt;domain, info.gpa);<=
br>
=C2=A0 =C2=A0 =C2=A0if ( !handler )<br>
=C2=A0 =C2=A0 =C2=A0{<br>
@@ -121,10 +128,6 @@ enum io_state try_handle_mmio(struct cpu_user_regs *re=
gs,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return rc;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 /* All the instructions used on emulated MMIO region should =
be valid */<br>
-=C2=A0 =C2=A0 if ( !dabt.valid )<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return IO_ABORT;<br>
-<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 * Erratum 766422: Thumb store translation fault to Hyp=
ervisor may<br>
=C2=A0 =C2=A0 =C2=A0 * not have correct HSR Rt value.<br>
-- <br>
2.17<br>
</blockquote></div></div></div>

--000000000000cd6b4605d67f7155--

