Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A72A25522
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 09:59:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880492.1290568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tesIa-0002hm-RN; Mon, 03 Feb 2025 08:59:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880492.1290568; Mon, 03 Feb 2025 08:59:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tesIa-0002fI-NE; Mon, 03 Feb 2025 08:59:20 +0000
Received: by outflank-mailman (input) for mailman id 880492;
 Mon, 03 Feb 2025 08:59:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VwXk=U2=gmail.com=thouveng@srs-se1.protection.inumbo.net>)
 id 1tesIZ-0002fC-Dq
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 08:59:19 +0000
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [2607:f8b0:4864:20::c2f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 259f7e0d-e20d-11ef-99a4-01e77a169b0f;
 Mon, 03 Feb 2025 09:59:17 +0100 (CET)
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-5f2e13cb359so1097659eaf.3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 00:59:17 -0800 (PST)
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
X-Inumbo-ID: 259f7e0d-e20d-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738573156; x=1739177956; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XRc/IGCMYulxp0aL0nU/DJU3Uwapafvf9fn4qGfFxJw=;
        b=iAUPOBhetkOMQ0q/2gosoTi3GGyD6126SIvNI2UOjBUdL0YRwQ+g88HhwJY/BjQcru
         pOrosR8/cHQ8bczpWQuD8wXaNp8Yokrv4leanDbwu89ZelMRYJamb5yuFvEthqRk6yhQ
         VtudTe1tdhNrlaPmbT5nIyLHgnkrO+7zFhZT3XII2B7Pve1AP2kYUsXsia9+xr9cMLmw
         bPTApMJy4J7ISll4+ykpJi5JlZxjUimHh4P2YyF7pqUlHsMhOp3yuP151UB+wG9+dTRu
         KKBEHEMNoJMhMOlWTaxjZSluVcbxcTuUPHt+eQ8NsqLgdmvd0Ve/HR5OgTS4/8jGMp2b
         IMsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738573156; x=1739177956;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XRc/IGCMYulxp0aL0nU/DJU3Uwapafvf9fn4qGfFxJw=;
        b=px0fGqky4ZAgoz0WUmML5LuZY+TuTD73yQGm01q+vbWUMF/FLPjrKlHRTyqKIZ3qgg
         JbQC0uTxWM65H1TA2e4LhhhpGMa1VZLUhE/XGXquXAxEZwk+TZ+FllXLeQXgaonca5yw
         FHTNUxpVOOVv/f2yYK0VTMXA2I6Y59aiKgAGCwEh/32yNbajRKxh3ynPMh4PXT8/HZJA
         6L2er2+oEqvf55Jp/bNVUemzcC1vlDKiof6WnIcd+Lz+fBoOR/FkQX+St3pBdK/xo7UR
         y0gxb4ZdAipQtr7s3Gr8icAfi3wiQziQfb0cVBSqZtN+fpvi/hdA5ifqVTti88djcmTo
         bZHQ==
X-Gm-Message-State: AOJu0Yzyng9IaYf7L4XBobBhVIeJF8ZIad65xGw4EJa2O1mMry+luY6/
	CUbdJ8K9i9UKsvCCwHWyQbv2azBSF8ET5Cx6iZf9lYvItSpkl9FEDqI5nzI4/I2YWYRrYxS158M
	8HFJToLhVxNS/geToQUb6eG8jqco=
X-Gm-Gg: ASbGncui6fGw0DbMjbnJWWQ1b4a5a6kd0eYy+G7J558M5BZeAPW29ONHwcRWYLDy7YX
	Docpyatj66Ygg3ULPhrA5rowkw78Wp/ip5kBU+3oMWMrJoGHRTQmKm8K5+8tds+meKrjhjQaw
X-Google-Smtp-Source: AGHT+IH8RThJ44Ns/PqP9Q3HwJRnTGcSc44wsAH12FMxqfM5MkYG7nqy/86y+Y+O1fOiIwTqcMGbbdQjlVTrvsft4qg=
X-Received: by 2002:a05:6820:993:b0:5fa:2e20:a371 with SMTP id
 006d021491bc7-5fc00226980mr14150312eaf.1.1738573155975; Mon, 03 Feb 2025
 00:59:15 -0800 (PST)
MIME-Version: 1.0
References: <CACt9=QgsSM18to9M5k8+3N3NvRoNVmAvsQo5oLO5-A0dm7VFNg@mail.gmail.com>
 <CACBT2OvVcDzoghr5SSjfvA5c9=LDs7DC6Z1Pi0QJ2sv0YFcEfw@mail.gmail.com>
 <CACt9=QiZhq94_=gSpSs782tM9uYQqvgrmOXeGw47C31-dwcrgw@mail.gmail.com>
 <4218bce7-b615-40d7-8d40-b2553d8b1662@citrix.com> <CACt9=Qgc=wjyRujFT=T2r1pvpyqWCOwzXw18BLO0uca7KuPKJA@mail.gmail.com>
 <087acd38-868d-4e1b-ab0f-9dbdb0ceb8a8@citrix.com>
In-Reply-To: <087acd38-868d-4e1b-ab0f-9dbdb0ceb8a8@citrix.com>
From: Guillaume <thouveng@gmail.com>
Date: Mon, 3 Feb 2025 09:58:40 +0100
X-Gm-Features: AWEUYZl_brGzf3VGZoFWXqtqpHcXwDKjQiiCHvN8I8Dg4z0XlFnEfKMAQFLBOk0
Message-ID: <CACt9=Qh0nXr35wx-ce8BC-xHcQjAa5nUdPvsm2K12RusT-wzXg@mail.gmail.com>
Subject: Re: Xen panic due to xstate mismatch
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="00000000000060c983062d391bc0"

--00000000000060c983062d391bc0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Oh cool, thanks a lot for the explanation.
I added the "vzeroupper" and Xen crashes so it looks like the CPUID
emulation is buggy. Also I was able to try it using a VM (same debian
testing) running on virt-manager+kvm and it works fine (Xen in debug mode).
I will have a look by printing the xstate when running on virt-manager+KVM
and I will also run the xen-cpuid command to see the difference just by
curiosity as with your test we already spotted the issue.
Thanks again for your enlightenment. I will continue my testing later today
and if you need me to test something else you are welcome, just ask I will
do my best.

Guillaume

On Sun, Feb 2, 2025 at 6:32=E2=80=AFPM Andrew Cooper <andrew.cooper3@citrix=
.com>
wrote:

> On 02/02/2025 4:58 pm, Guillaume wrote:
> > I attached the output of the `xl dmesg`. This is the 4.19.1 kernel I
> > rebuild but I have the same issue with master (just for info).
>
> Thanks.  This is a TigerLake CPU, and:
>
> > (XEN) Mitigating GDS by disabling AVX while virtualised - protections
> > are best-effort
>
> is why Xen is ignoring AVX.
>
> Now, as to the bug.  From the panic line, you're seeing:
>
> > XSTATE 0x0000000000000003, uncompressed hw size 0x340 !=3D xen size 0x2=
40
>
> xstate is XCR0_SSE | XCR0_X87, and the correct size for this
> configuration is 0x240.
>
> There reason why it matters is because this is the amount of data the
> processor will write out/read in for the XSAVE/XRSTOR instructions,
> which are used for context switching.  These instructions are also
> available in userspace.
>
> Here, VirtualBox is claiming that with AVX disabled, it will still write
> out the AVX registers.  This is buggy, but we're going to have to narrow
> it down further.
>
> Can you try building Xen with this additional line
>
> diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
> index af9e345a7ace..5a5011ba8b10 100644
> --- a/xen/arch/x86/xstate.c
> +++ b/xen/arch/x86/xstate.c
> @@ -789,6 +789,8 @@ static void __init noinline xstate_check_sizes(void)
>       */
>      check_new_xstate(&s, X86_XCR0_SSE | X86_XCR0_X87);
>
> +    asm volatile ("vzeroupper");
> +
>      if ( cpu_has_avx )
>          check_new_xstate(&s, X86_XCR0_YMM);
>
>
> and see if the result crashes or boots?
>
> One possible bug is that VirtualBox is shadowing XCR0 and the real
> setting in hardware is 0x7 (including XCR0_AVX) rather than 0x3.  In
> this case, the reported size is correct, and VirtualBox is failing to
> honour the XSETBV setting.
>
> Alternatively, another bug is that XCR0 is really 0x3, but the CPUID
> emulation for max size is wrong, in which case the XSAVE/etc
> instructions wont actually access beyond 0x240, and "all" that's wrong
> is that we'll allocate a larger buffer than necessary.
>
> The VZEROUPPER (an AVX instruction) should distinguish these two cases.
> If Xen crashes with it in place, then the XCR0 register is correct and
> it's CPUID which is buggy.  If Xen boots with that in place, then
> Virtualbox is shadowing XCR0 with a different value behind Xen's back.
>
> ~Andrew
>

--00000000000060c983062d391bc0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Oh cool, thanks a lot for the explanation.<=
br></div>I added the &quot;vzeroupper&quot; and Xen crashes so it looks lik=
e the CPUID emulation is buggy. Also I was able to try it using a VM (same =
debian testing) running on virt-manager+kvm and it works fine (Xen in debug=
 mode). I will have a look by printing the xstate when running on virt-mana=
ger+KVM and I will also run the xen-cpuid command to see the difference jus=
t by curiosity as with your test we already spotted the issue.<br></div>Tha=
nks again for your enlightenment. I will continue my testing later today an=
d if you need me to test something else you are welcome, just ask I will do=
 my best.<br><br></div>Guillaume<br></div><br><div class=3D"gmail_quote gma=
il_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Feb 2, 20=
25 at 6:32=E2=80=AFPM Andrew Cooper &lt;<a href=3D"mailto:andrew.cooper3@ci=
trix.com">andrew.cooper3@citrix.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On 02/02/2025 4:58 pm, Guillaume wrote:<=
br>
&gt; I attached the output of the `xl dmesg`. This is the 4.19.1 kernel I<b=
r>
&gt; rebuild but I have the same issue with master (just for info).<br>
<br>
Thanks.=C2=A0 This is a TigerLake CPU, and:<br>
<br>
&gt; (XEN) Mitigating GDS by disabling AVX while virtualised - protections<=
br>
&gt; are best-effort<br>
<br>
is why Xen is ignoring AVX.<br>
<br>
Now, as to the bug.=C2=A0 From the panic line, you&#39;re seeing:<br>
<br>
&gt; XSTATE 0x0000000000000003, uncompressed hw size 0x340 !=3D xen size 0x=
240<br>
<br>
xstate is XCR0_SSE | XCR0_X87, and the correct size for this<br>
configuration is 0x240.<br>
<br>
There reason why it matters is because this is the amount of data the<br>
processor will write out/read in for the XSAVE/XRSTOR instructions,<br>
which are used for context switching.=C2=A0 These instructions are also<br>
available in userspace.<br>
<br>
Here, VirtualBox is claiming that with AVX disabled, it will still write<br=
>
out the AVX registers.=C2=A0 This is buggy, but we&#39;re going to have to =
narrow<br>
it down further.<br>
<br>
Can you try building Xen with this additional line<br>
<br>
diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c<br>
index af9e345a7ace..5a5011ba8b10 100644<br>
--- a/xen/arch/x86/xstate.c<br>
+++ b/xen/arch/x86/xstate.c<br>
@@ -789,6 +789,8 @@ static void __init noinline xstate_check_sizes(void)<br=
>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */<br>
=C2=A0=C2=A0=C2=A0=C2=A0 check_new_xstate(&amp;s, X86_XCR0_SSE | X86_XCR0_X=
87);<br>
=C2=A0<br>
+=C2=A0=C2=A0=C2=A0 asm volatile (&quot;vzeroupper&quot;);<br>
+<br>
=C2=A0=C2=A0=C2=A0=C2=A0 if ( cpu_has_avx )<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 check_new_xstate(&amp;s, X=
86_XCR0_YMM);<br>
=C2=A0<br>
<br>
and see if the result crashes or boots?<br>
<br>
One possible bug is that VirtualBox is shadowing XCR0 and the real<br>
setting in hardware is 0x7 (including XCR0_AVX) rather than 0x3.=C2=A0 In<b=
r>
this case, the reported size is correct, and VirtualBox is failing to<br>
honour the XSETBV setting.<br>
<br>
Alternatively, another bug is that XCR0 is really 0x3, but the CPUID<br>
emulation for max size is wrong, in which case the XSAVE/etc<br>
instructions wont actually access beyond 0x240, and &quot;all&quot; that&#3=
9;s wrong<br>
is that we&#39;ll allocate a larger buffer than necessary.<br>
<br>
The VZEROUPPER (an AVX instruction) should distinguish these two cases.=C2=
=A0<br>
If Xen crashes with it in place, then the XCR0 register is correct and<br>
it&#39;s CPUID which is buggy.=C2=A0 If Xen boots with that in place, then<=
br>
Virtualbox is shadowing XCR0 with a different value behind Xen&#39;s back.<=
br>
<br>
~Andrew<br>
</blockquote></div>

--00000000000060c983062d391bc0--

