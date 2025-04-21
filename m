Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 193DCA9558D
	for <lists+xen-devel@lfdr.de>; Mon, 21 Apr 2025 19:55:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961379.1352816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6vLS-0007zv-7H; Mon, 21 Apr 2025 17:54:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961379.1352816; Mon, 21 Apr 2025 17:54:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6vLS-0007wq-2X; Mon, 21 Apr 2025 17:54:14 +0000
Received: by outflank-mailman (input) for mailman id 961379;
 Mon, 21 Apr 2025 17:54:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k4Vt=XH=g.ecc.u-tokyo.ac.jp=ishiir@srs-se1.protection.inumbo.net>)
 id 1u6vLP-0007wk-DR
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 17:54:12 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b836f0b-1ed9-11f0-9ffb-bf95429c2676;
 Mon, 21 Apr 2025 19:54:01 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5e5deb6482cso9386928a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 21 Apr 2025 10:54:01 -0700 (PDT)
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
X-Inumbo-ID: 9b836f0b-1ed9-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=g.ecc.u-tokyo.ac.jp; s=google; t=1745258041; x=1745862841; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rgpbcd0UHgkLVgzrjd4scDmmUyBha2wUHEHGK7CtbMs=;
        b=F8Z7dcDi0yHuocHtVnUnzeRDeBpRkxCgR81vrOX6utFTUHG4RhiG8hunfi2oc833eM
         Tt/50BXbyS2hoOsaHjT6fHN81awD+YgGs7jMvfLAkWh/PzcsaOSE6069bjfht/RVfofI
         NjUJz/I7FLiNi75axi1yABq5R1aBBK9GJUnx4sVMW4i+Dz1V2HWkeCARJ3An8RA8WG6u
         NiFyRZjvAkdxtW/Q+MQ7AUdEfPrTxjuHUPrFyd89ThZFRXSiTqn5LsEBkTF6zPHotiln
         /dKEC52kpRPD6g88HeQg6SCVnKjG3aDHAiTkturkEgk0vexHb99L8ZY5+WTsjFzCHZEO
         5xrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745258041; x=1745862841;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rgpbcd0UHgkLVgzrjd4scDmmUyBha2wUHEHGK7CtbMs=;
        b=W4Z49ywlJ4TqH2rbI/zxYGpclNsFjBK8TI068IG7umTLWFdiLVG/sAJ35NgaYP6h+Z
         FOMuOaTyplKroBPboh/MVxMHwLrnpzes1+frjjccG8yDC9jbvM+JrbTZZm++MXTlGQEK
         a1wZ+5vWlUmyPgzL6aZ+Ahh1cv9RYYUxgHoj8AaXrgJDsBVDE+eVRo8DEdWq9nS1/Rlp
         WOXqBYVTcjvt2tLEdYqXHdJwCJWi7Co/dG8SaEVjLQ62Bt9RXCDmYYnBm6JbpCQKWXL4
         qMogLzZGgl50mHc2tmUEjYjsb0F5i7HjMeUTDG3d4arBTRw6LqpYJsMHsGmjSEjovFkp
         Qydg==
X-Gm-Message-State: AOJu0YwHHGwJKnRYzZWU3GiQCyWITje3WIWTbaeEBNt4pLd1NIRGXSRR
	bFpAVazFAXVMbu04lD3LoMtr/n7GJ+3xq0PVck60IxM/RwGYpei7Fh4h0b6OXUsmsla4H5WBDhg
	7g57IUpLEkagBunzoO+QuhISgkGhSltExSzRyFpaCST04yrIRYLG+ww==
X-Gm-Gg: ASbGnctXTzOq6hzLiYw8HiGZkpReMbnOAyr3fdApLoyD5x+XXIg5KVFgrBth3bwmv7k
	8bDDDvS2eBHBzG8JnS4nyQQkjAPJJ4OaH9annj/LzwMg/RI15oAKRWrK3XqQ/odDd1bcfNn3omX
	3D/ryYa86MerEhuLojfFRTtA7To+5pvsAxn/C6fjIK6ooe1FQ240UaquY=
X-Google-Smtp-Source: AGHT+IHWqR+rHse8iF2D1/VGGzwEcgksMXHwtL61c4ERMF1j2/9r+Wwtnlcx8bCbXZWSxOaTmj7vgdjhGQ9XYUKbGTQ=
X-Received: by 2002:a17:907:1b16:b0:abf:6a8d:76b8 with SMTP id
 a640c23a62f3a-acb6ec517bamr1169416566b.11.1745258040879; Mon, 21 Apr 2025
 10:54:00 -0700 (PDT)
MIME-Version: 1.0
References: <CA+aCS-Ha4jSYFfxhOwMGiGJPdCOtgBJLt=3Q=v9dfp6SQJys4w@mail.gmail.com>
 <1415ddc9-81f3-4d50-b735-7e44a7f656d5@citrix.com> <CA+aCS-H2wkiVOMvCS7cCPojduXdStMYzHn7SxintNyg0vS_Bhg@mail.gmail.com>
In-Reply-To: <CA+aCS-H2wkiVOMvCS7cCPojduXdStMYzHn7SxintNyg0vS_Bhg@mail.gmail.com>
From: REIMA ISHII <ishiir@g.ecc.u-tokyo.ac.jp>
Date: Tue, 22 Apr 2025 02:53:49 +0900
X-Gm-Features: ATxdqUHw7hh_Tf_W6oHItl9JyxFMR4IMXupq2jtJ5GPAIo9rx5-AuYWMmxym1zU
Message-ID: <CA+aCS-E0WtbnSM7FuPL0jruXLjdFaZOa9aS0gyy_x5JDRWh50A@mail.gmail.com>
Subject: Re: [BUG] Nested Virtualization Bug on x86-64 AMD CPU
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	Takahiro Shinagawa <shina@ecc.u-tokyo.ac.jp>
Content-Type: multipart/alternative; boundary="00000000000091ce4206334d8dec"

--00000000000091ce4206334d8dec
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am writing to follow up on the bug report I sent, regarding a BUG()
triggered in Xen when performing a nested VMRUN with CR0.PG=3D0 in Long
Mode. The issue was discussed with Andrew Cooper at that time, and I
would like to check if there have been any updates or plans for
addressing this issue.

To briefly recap:
- The problem occurs when an L1 hypervisor, while in 64-bit mode,
executes VMRUN with CR0.PG=3D0 in VMCB12, targeting a 64-bit L2 guest.
- Instead of raising VMEXIT_INVALID, the system encounters a BUG() at
`nsvm_vmcb_guest_intercepts_exitcode`.
- VMEXIT reason observed was 0x402 (AVIC_NOACCEL), although Xen does not
support AVIC.

Andrew pointed out that this could indicate either a missing validity
check (as the state LMA=3D1 && PG=3D0 is invalid) or possible memory
corruption.

Given that this issue could potentially allow a guest VM to trigger a
hypervisor panic, I believe it might be worth formally recognizing and
addressing.
May I kindly ask if this has been acknowledged as a bug internally, or
if there are any plans to handle this case safely (e.g., raising
VMEXIT_INVALID instead of BUG()) in future Xen releases?

Thank you very much for your time


On Wed, Dec 6, 2023 at 12:05=E2=80=AFPM Reima ISHII <ishiir@g.ecc.u-tokyo.a=
c.jp>
wrote:

> Thank you for your prompt response.
>
> On Tue, Dec 5, 2023 at 11:43=E2=80=AFPM Andrew Cooper <andrew.cooper3@cit=
rix.com>
> wrote:
> > Who is still in 64-bit mode ?
> >
> > It is legal for a 64-bit L1 to VMRUN into a 32-bit L2 with PG=3D0.
> >
> > But I'm guessing that you mean L2 is also 64-bit, and we're clearing PG=
,
> > thus creating an illegal state (LMA=3D1 && PG=3D0) in VMCB12.
> >
> > And yes, in that case (virtual) VMRUN at L1 ought to fail with
> > VMEXIT_INVALID.
>
> Yes, you are correct in your understanding. This issue is triggered by
> VMRUN execution to 64-bit L2 guests, when CR0.PG is cleared in VMCB12.
> Contrary to the expected behavior where a VMRUN at L1 should fail with
> VMEXIT_INVALID, the VMRUN does not fail but instead, the system
> encounters a BUG().
>
> > As an incidental observation, that function is particularly absurd and
> > the two switches should be merged.
> >
> > VMExit reason 0x402 is AVIC_NOACCEL and Xen has no support for AVIC in
> > the slightest right now.  i.e. Xen shouldn't have AVIC active in the
> > VMCB, and should never any AVIC related VMExits.
> >
> > It is possible that we've got memory corruption, and have accidentally
> > activated AVIC in the VMCB.
>
> The idea of potential memory corruption activating AVIC in the VMCB is
> certainly an interesting perspective. While I'm not sure how exactly
> such memory corruption could occur, the suggestion does provide a
> compelling explanation for the VMExit reason 0x402 (AVIC_NOACCEL),
> particularly considering Xen's current lack of AVIC support.
>
> > But, is this by any chance all running nested under KVM in your fuzzer?
>
> No, KVM was not used. The issue was observed on a Xen hypervisor's
> domU HVM running directly on the hardware. Within the guest HVM, a
> simple custom hypervisor was utilized.
>
> --
> Graduate School of Information Science and Technology, The University of
> Tokyo
> Reima Ishii
> ishiir@g.ecc.u-tokyo.ac.jp
>


--=20
=E6=9D=B1=E4=BA=AC=E5=A4=A7=E5=AD=A6=E5=A4=A7=E5=AD=A6=E9=99=A2 =E6=83=85=
=E5=A0=B1=E7=90=86=E5=B7=A5=E5=AD=A6=E7=B3=BB=E7=A0=94=E7=A9=B6=E7=A7=91 =
=E3=82=B7=E3=82=B9=E3=83=86=E3=83=A0=E6=83=85=E5=A0=B1=E5=AD=A6=E5=B0=82=E6=
=94=BB =E4=BF=AE=E5=A3=AB2=E5=B9=B4
=E7=9F=B3=E4=BA=95=E7=8E=B2=E7=9C=9F
ishiir@g.ecc.u-tokyo.ac.jp

--00000000000091ce4206334d8dec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I am writing to follow up on the bug report I sent, regard=
ing a BUG()<br>triggered in Xen when performing a nested VMRUN with <a href=
=3D"http://CR0.PG">CR0.PG</a>=3D0 in Long<br>Mode. The issue was discussed =
with Andrew Cooper at that time, and I<br>would like to check if there have=
 been any updates or plans for<br>addressing this issue.<br><br>To briefly =
recap:<br>- The problem occurs when an L1 hypervisor, while in 64-bit mode,=
<br>executes VMRUN with <a href=3D"http://CR0.PG">CR0.PG</a>=3D0 in VMCB12,=
 targeting a 64-bit L2 guest.<br>- Instead of raising VMEXIT_INVALID, the s=
ystem encounters a BUG() at<br>`nsvm_vmcb_guest_intercepts_exitcode`.<br>- =
VMEXIT reason observed was 0x402 (AVIC_NOACCEL), although Xen does not<br>s=
upport AVIC.<br><br>Andrew pointed out that this could indicate either a mi=
ssing validity<br>check (as the state LMA=3D1 &amp;&amp; PG=3D0 is invalid)=
 or possible memory<br>corruption.<br><br>Given that this issue could poten=
tially allow a guest VM to trigger a<br>hypervisor panic, I believe it migh=
t be worth formally recognizing and<br>addressing.<br>May I kindly ask if t=
his has been acknowledged as a bug internally, or<br>if there are any plans=
 to handle this case safely (e.g., raising<br>VMEXIT_INVALID instead of BUG=
()) in future Xen releases?<br><br>Thank you very much for your time</div><=
br><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Wed, Dec 6, 2023 at 12:05=E2=80=AFPM Reima ISHII &lt;=
<a href=3D"mailto:ishiir@g.ecc.u-tokyo.ac.jp">ishiir@g.ecc.u-tokyo.ac.jp</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Tha=
nk you for your prompt response.<br>
<br>
On Tue, Dec 5, 2023 at 11:43=E2=80=AFPM Andrew Cooper &lt;<a href=3D"mailto=
:andrew.cooper3@citrix.com" target=3D"_blank">andrew.cooper3@citrix.com</a>=
&gt; wrote:<br>
&gt; Who is still in 64-bit mode ?<br>
&gt;<br>
&gt; It is legal for a 64-bit L1 to VMRUN into a 32-bit L2 with PG=3D0.<br>
&gt;<br>
&gt; But I&#39;m guessing that you mean L2 is also 64-bit, and we&#39;re cl=
earing PG,<br>
&gt; thus creating an illegal state (LMA=3D1 &amp;&amp; PG=3D0) in VMCB12.<=
br>
&gt;<br>
&gt; And yes, in that case (virtual) VMRUN at L1 ought to fail with<br>
&gt; VMEXIT_INVALID.<br>
<br>
Yes, you are correct in your understanding. This issue is triggered by<br>
VMRUN execution to 64-bit L2 guests, when <a href=3D"http://CR0.PG" rel=3D"=
noreferrer" target=3D"_blank">CR0.PG</a> is cleared in VMCB12.<br>
Contrary to the expected behavior where a VMRUN at L1 should fail with<br>
VMEXIT_INVALID, the VMRUN does not fail but instead, the system<br>
encounters a BUG().<br>
<br>
&gt; As an incidental observation, that function is particularly absurd and=
<br>
&gt; the two switches should be merged.<br>
&gt;<br>
&gt; VMExit reason 0x402 is AVIC_NOACCEL and Xen has no support for AVIC in=
<br>
&gt; the slightest right now.=C2=A0 i.e. Xen shouldn&#39;t have AVIC active=
 in the<br>
&gt; VMCB, and should never any AVIC related VMExits.<br>
&gt;<br>
&gt; It is possible that we&#39;ve got memory corruption, and have accident=
ally<br>
&gt; activated AVIC in the VMCB.<br>
<br>
The idea of potential memory corruption activating AVIC in the VMCB is<br>
certainly an interesting perspective. While I&#39;m not sure how exactly<br=
>
such memory corruption could occur, the suggestion does provide a<br>
compelling explanation for the VMExit reason 0x402 (AVIC_NOACCEL),<br>
particularly considering Xen&#39;s current lack of AVIC support.<br>
<br>
&gt; But, is this by any chance all running nested under KVM in your fuzzer=
?<br>
<br>
No, KVM was not used. The issue was observed on a Xen hypervisor&#39;s<br>
domU HVM running directly on the hardware. Within the guest HVM, a<br>
simple custom hypervisor was utilized.<br>
<br>
-- <br>
Graduate School of Information Science and Technology, The University of To=
kyo<br>
Reima Ishii<br>
<a href=3D"mailto:ishiir@g.ecc.u-tokyo.ac.jp" target=3D"_blank">ishiir@g.ec=
c.u-tokyo.ac.jp</a><br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><div>=E6=9D=B1=E4=BA=AC=E5=A4=A7=E5=AD=A6=E5=A4=A7=E5=AD=A6=
=E9=99=A2 =E6=83=85=E5=A0=B1=E7=90=86=E5=B7=A5=E5=AD=A6=E7=B3=BB=E7=A0=94=
=E7=A9=B6=E7=A7=91 =E3=82=B7=E3=82=B9=E3=83=86=E3=83=A0=E6=83=85=E5=A0=B1=
=E5=AD=A6=E5=B0=82=E6=94=BB =E4=BF=AE=E5=A3=AB2=E5=B9=B4</div><div>=E7=9F=
=B3=E4=BA=95=E7=8E=B2=E7=9C=9F</div><div><a href=3D"mailto:ishiir@g.ecc.u-t=
okyo.ac.jp" target=3D"_blank">ishiir@g.ecc.u-tokyo.ac.jp</a></div></div></d=
iv>

--00000000000091ce4206334d8dec--

