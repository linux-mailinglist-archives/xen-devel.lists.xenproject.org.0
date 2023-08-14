Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB3677B78F
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 13:26:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583556.913799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVVi5-00080Z-9c; Mon, 14 Aug 2023 11:26:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583556.913799; Mon, 14 Aug 2023 11:26:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVVi5-0007xb-6A; Mon, 14 Aug 2023 11:26:09 +0000
Received: by outflank-mailman (input) for mailman id 583556;
 Mon, 14 Aug 2023 11:26:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=80nZ=D7=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1qVVi2-0007xV-Qq
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 11:26:06 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5955f45f-3a95-11ee-b288-6b7b168915f2;
 Mon, 14 Aug 2023 13:26:01 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4fe457ec6e7so6647488e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Aug 2023 04:26:01 -0700 (PDT)
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
X-Inumbo-ID: 5955f45f-3a95-11ee-b288-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1692012361; x=1692617161;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UBfGjado5ykuU8PXg/caM32XsiigilSzYP0189TZzXM=;
        b=ERo8QqU/EMZEIi50tIyNUCQw5W6aVa0wVTjNj/ipICDEgzowQMOZn7mfX4Bp6fCWDs
         u8wjF4w8A5EbfsPSxvs6MOPTbOz5f4kxq+jxiMzj22MZJHugfeD3GdeSrE9A5ti313V3
         wDadsjbc4fDXYo8MFW7sHP0SvhEDZrsTAx55o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692012361; x=1692617161;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UBfGjado5ykuU8PXg/caM32XsiigilSzYP0189TZzXM=;
        b=k0kRkh5cR0EMr/Fl/3yHs+hHMn7uvL6etXs+ESzG+uRAXBQBC73LvlMwaI+wj4CSQK
         dB25OCaG4KXtSriQClOEB3SnyhG9r2Y9kMH2DnTc5E5c/B6AvCWQSfEGyNhOfjG4gMqz
         ejxvMpGcYmf6ItjUg/SnPIAfS4U2QhgOURKOICFBeqe8W1/FojsGznBt5j2J32zyxd3X
         b61mMlsLq+TA4En2YyhNJzXnkS6SOTLPWIB2csv7ChOFOEHUPZ7/WQWLP2rvMOcUH1MH
         CmNWRfZjUf6ZQ3MsUJkKpFoZb/+xj83Gq9djjw1WHhAn591XJsENJy0vQjxPag3dVyqC
         uqUg==
X-Gm-Message-State: AOJu0YzVMsT+33QtUMlnJ67oKtQqDPmTPKXMYoD3vwmbe+npX6xKksTD
	7+6tYTHCuFZbbJDsIVx7yyCh/eCZ84w8OCruO+lKsA==
X-Google-Smtp-Source: AGHT+IFib+4JFmUGDCbfvnwkOBX5hSF6w0OjopvFFLXYcEDL3KVAz8Txh3zjtnvRf0rTHY5hn0YGiJSFTIHpWYcLWiY=
X-Received: by 2002:a05:6512:39d1:b0:4fe:7e64:3c1a with SMTP id
 k17-20020a05651239d100b004fe7e643c1amr7030761lfu.2.1692012361092; Mon, 14 Aug
 2023 04:26:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230803203650.1474936-1-andrew.cooper3@citrix.com> <a6348a98-30bb-8a03-7ed7-9e965be119eb@apertussolutions.com>
In-Reply-To: <a6348a98-30bb-8a03-7ed7-9e965be119eb@apertussolutions.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 14 Aug 2023 12:25:50 +0100
Message-ID: <CA+zSX=ZajaUSD=AcqwjNL_HHeZm6kf1pHVDKU9nyZtsxS2N8qw@mail.gmail.com>
Subject: Re: [PATCH] subdom: Fix -Werror=address failure in tmp_emulator
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>, 
	George Dunlap <George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>, 
	Juergen Gross <jgross@suse.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Jason Andryuk <jandryuk@gmail.com>, Christopher Clark <christopher.w.clark@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000bd2b050602e053be"

--000000000000bd2b050602e053be
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 8, 2023 at 10:27=E2=80=AFPM Daniel P. Smith <
dpsmith@apertussolutions.com> wrote:

> On 8/3/23 16:36, Andrew Cooper wrote:
> > The opensuse-tumbleweed build jobs currently fail with:
> >
> >    /builds/xen-project/xen/stubdom/tpm_emulator-x86_64/crypto/rsa.c: In
> function 'rsa_private':
> >
> /builds/xen-project/xen/stubdom/tpm_emulator-x86_64/crypto/rsa.c:56:7:
> error: the comparison will always evaluate as 'true' for the address of '=
p'
> will never be NULL [-Werror=3Daddress]
> >       56 |   if (!key->p || !key->q || !key->u) {
> >          |       ^
> >    In file included from
> /builds/xen-project/xen/stubdom/tpm_emulator-x86_64/crypto/rsa.c:17:
> >
> /builds/xen-project/xen/stubdom/tpm_emulator-x86_64/crypto/rsa.h:28:12:
> note: 'p' declared here
> >       28 |   tpm_bn_t p;
> >          |            ^
> >
> > This is because all tpm_bn_t's are 1-element arrays (of either a GMP or
> > OpenSSL BIGNUM flavour).  The author was probably meaning to do value
> checks,
> > but that's not what the code does.
> >
> > Adjust it to compile.  No functional change.
> >
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > ---
> > CC: George Dunlap <George.Dunlap@eu.citrix.com>
> > CC: Jan Beulich <JBeulich@suse.com>
> > CC: Stefano Stabellini <sstabellini@kernel.org>
> > CC: Wei Liu <wl@xen.org>
> > CC: Julien Grall <julien@xen.org>
> > CC: Juergen Gross <jgross@suse.com>
> > CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> > CC: Jason Andryuk <jandryuk@gmail.com>
> > CC: Daniel Smith <dpsmith@apertussolutions.com>
> > CC: Christopher Clark <christopher.w.clark@gmail.com>
> >
> > While I've confirmed this to fix the build issue:
> >
> >
> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/955160430
> >
> > I'm -1 overall to the change, and would prefer to disable vtpm-stubdom
> > entirely.
> >
> > It's TPM 1.2 only, using decades-old libs, and some stuff in the upstre=
am
> > https://github.com/PeterHuewe/tpm-emulator (which is still abandaonded
> as of
> > 2018) is just as concerning as the basic error here in rsa_private().
>
> For semantics sake, the Guest PV interface is 1.2 compliant but the PV
> backend, vtpmmgr, is capable of using TPM2.0.
>
> > vtpm-stubdom isn't credibly component of a Xen system, and we're wastin=
g
> loads
> > of CI cycles testing it...
>
> Unfortunately, I cannot disagree here. This is the only proper vTPM,
> from a trustworthy architecture perspective, that I know of existing
> today. Until I can find someone willing to fund updating the
> implementation and moving it to being an emulated vTPM and not a PV
> interface, it is likely to stay in this state for some time.
>

Did you mean "I cannot *agree* here"?  "Cannot disagree" means you agree
that we're "wasting loads of CI cycles testing it", but the second sentence
seems to imply that it's (currently) irreplacable.

 -George

--000000000000bd2b050602e053be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 8, 2023 at 10:27=E2=80=AF=
PM Daniel P. Smith &lt;<a href=3D"mailto:dpsmith@apertussolutions.com">dpsm=
ith@apertussolutions.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On 8/3/23 16:36, Andrew Cooper wrote:<br>
&gt; The opensuse-tumbleweed build jobs currently fail with:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 /builds/xen-project/xen/stubdom/tpm_emulator-x86_64/crypt=
o/rsa.c: In function &#39;rsa_private&#39;:<br>
&gt;=C2=A0 =C2=A0 /builds/xen-project/xen/stubdom/tpm_emulator-x86_64/crypt=
o/rsa.c:56:7: error: the comparison will always evaluate as &#39;true&#39; =
for the address of &#39;p&#39; will never be NULL [-Werror=3Daddress]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A056 |=C2=A0 =C2=A0if (!key-&gt;p || !key-&gt;=
q || !key-&gt;u) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
&gt;=C2=A0 =C2=A0 In file included from /builds/xen-project/xen/stubdom/tpm=
_emulator-x86_64/crypto/rsa.c:17:<br>
&gt;=C2=A0 =C2=A0 /builds/xen-project/xen/stubdom/tpm_emulator-x86_64/crypt=
o/rsa.h:28:12: note: &#39;p&#39; declared here<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A028 |=C2=A0 =C2=A0tpm_bn_t p;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ^<br>
&gt; <br>
&gt; This is because all tpm_bn_t&#39;s are 1-element arrays (of either a G=
MP or<br>
&gt; OpenSSL BIGNUM flavour).=C2=A0 The author was probably meaning to do v=
alue checks,<br>
&gt; but that&#39;s not what the code does.<br>
&gt; <br>
&gt; Adjust it to compile.=C2=A0 No functional change.<br>
&gt; <br>
&gt; Signed-off-by: Andrew Cooper &lt;<a href=3D"mailto:andrew.cooper3@citr=
ix.com" target=3D"_blank">andrew.cooper3@citrix.com</a>&gt;<br>
&gt; ---<br>
&gt; CC: George Dunlap &lt;<a href=3D"mailto:George.Dunlap@eu.citrix.com" t=
arget=3D"_blank">George.Dunlap@eu.citrix.com</a>&gt;<br>
&gt; CC: Jan Beulich &lt;<a href=3D"mailto:JBeulich@suse.com" target=3D"_bl=
ank">JBeulich@suse.com</a>&gt;<br>
&gt; CC: Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org" t=
arget=3D"_blank">sstabellini@kernel.org</a>&gt;<br>
&gt; CC: Wei Liu &lt;<a href=3D"mailto:wl@xen.org" target=3D"_blank">wl@xen=
.org</a>&gt;<br>
&gt; CC: Julien Grall &lt;<a href=3D"mailto:julien@xen.org" target=3D"_blan=
k">julien@xen.org</a>&gt;<br>
&gt; CC: Juergen Gross &lt;<a href=3D"mailto:jgross@suse.com" target=3D"_bl=
ank">jgross@suse.com</a>&gt;<br>
&gt; CC: Marek Marczykowski-G=C3=B3recki &lt;<a href=3D"mailto:marmarek@inv=
isiblethingslab.com" target=3D"_blank">marmarek@invisiblethingslab.com</a>&=
gt;<br>
&gt; CC: Jason Andryuk &lt;<a href=3D"mailto:jandryuk@gmail.com" target=3D"=
_blank">jandryuk@gmail.com</a>&gt;<br>
&gt; CC: Daniel Smith &lt;<a href=3D"mailto:dpsmith@apertussolutions.com" t=
arget=3D"_blank">dpsmith@apertussolutions.com</a>&gt;<br>
&gt; CC: Christopher Clark &lt;<a href=3D"mailto:christopher.w.clark@gmail.=
com" target=3D"_blank">christopher.w.clark@gmail.com</a>&gt;<br>
&gt; <br>
&gt; While I&#39;ve confirmed this to fix the build issue:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 <a href=3D"https://gitlab.com/xen-project/people/andyhhp/=
xen/-/pipelines/955160430" rel=3D"noreferrer" target=3D"_blank">https://git=
lab.com/xen-project/people/andyhhp/xen/-/pipelines/955160430</a><br>
&gt; <br>
&gt; I&#39;m -1 overall to the change, and would prefer to disable vtpm-stu=
bdom<br>
&gt; entirely.<br>
&gt; <br>
&gt; It&#39;s TPM 1.2 only, using decades-old libs, and some stuff in the u=
pstream<br>
&gt; <a href=3D"https://github.com/PeterHuewe/tpm-emulator" rel=3D"noreferr=
er" target=3D"_blank">https://github.com/PeterHuewe/tpm-emulator</a> (which=
 is still abandaonded as of<br>
&gt; 2018) is just as concerning as the basic error here in rsa_private().<=
br>
<br>
For semantics sake, the Guest PV interface is 1.2 compliant but the PV <br>
backend, vtpmmgr, is capable of using TPM2.0.<br>
<br>
&gt; vtpm-stubdom isn&#39;t credibly component of a Xen system, and we&#39;=
re wasting loads<br>
&gt; of CI cycles testing it...<br>
<br>
Unfortunately, I cannot disagree here. This is the only proper vTPM, <br>
from a trustworthy architecture perspective, that I know of existing <br>
today. Until I can find someone willing to fund updating the <br>
implementation and moving it to being an emulated vTPM and not a PV <br>
interface, it is likely to stay in this state for some time.<br></blockquot=
e><div><br></div><div>Did you mean &quot;I cannot *agree* here&quot;?=C2=A0=
 &quot;Cannot disagree&quot; means you agree that we&#39;re &quot;wasting l=
oads of CI cycles testing it&quot;, but the second sentence seems to imply =
that it&#39;s (currently) irreplacable.</div><div><br></div><div>=C2=A0-Geo=
rge=C2=A0</div></div></div>

--000000000000bd2b050602e053be--

