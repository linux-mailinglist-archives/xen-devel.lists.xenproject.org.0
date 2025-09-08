Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C71B4889B
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 11:36:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1114953.1461744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvYI7-0007it-M4; Mon, 08 Sep 2025 09:36:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1114953.1461744; Mon, 08 Sep 2025 09:36:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvYI7-0007hD-IH; Mon, 08 Sep 2025 09:36:03 +0000
Received: by outflank-mailman (input) for mailman id 1114953;
 Mon, 08 Sep 2025 09:36:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zbUz=3T=cloud.com=gerald.elder-vass@srs-se1.protection.inumbo.net>)
 id 1uvYI5-0007dH-OP
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 09:36:01 +0000
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [2607:f8b0:4864:20::b31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38669b95-8c97-11f0-9809-7dc792cee155;
 Mon, 08 Sep 2025 11:35:56 +0200 (CEST)
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-e9d5e41c670so3911386276.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Sep 2025 02:35:56 -0700 (PDT)
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
X-Inumbo-ID: 38669b95-8c97-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1757324156; x=1757928956; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VmNQj5CvzMm3+mVyvgID5aOJAeNFb9zTblKtJiTor2I=;
        b=TL/HRPCeqDoz1b2MdPMpufnUbAIv3Ttqn0LtlNJoiatk7gNRIqaos6hA8C5QG5nyox
         qZv6A3lC/ipDOjgFRJkGVFLfM1GSqOOdqp9/fYiT07P9kf1u43YTQ8RfCWIyXq3UBfYg
         d1R89Jh0ACaYi+GoeliPz23ImtxhmZfpwHguk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757324156; x=1757928956;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VmNQj5CvzMm3+mVyvgID5aOJAeNFb9zTblKtJiTor2I=;
        b=Q8UbIjVPELZcbXGh2CLMT/u+HvK2aNzlFnfwHWLlm5zKkTu4P8tFXUcgXQ+KU7yIXU
         L7SsBBYd4Pj0OrY7uUBJMWIzmg46HV3/m08oNwvYlC5dtluNfEmMETTCg0kcjHeupOfN
         xBXZVuU9hQ/BeaaUQr2jE2zkZSRNbJ1sGYcQYZdLnRUKlo4gSgObXZlyIebKtMNqaWHh
         0WBGym9kdVDV8AVFgFVF6Hcy2I4mKpe9LNrYeOYgiPQynfjM8v/pNeQ9BA/bdE08R5hz
         lxW4lj20Sq+aBUPgZH/BfVF15Ny2vAOQAwQ0rL4QW2vYFk8dq5OT/Hm5JA60uz027ZGr
         SL+Q==
X-Forwarded-Encrypted: i=1; AJvYcCX9Arbwu60m0S3v5KTIflrCZVf5v60EaZoghynZPaBiArPVw/8ImDx2J0BPBTHRTyaMJ/C2ELjICzI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwLS1n92nG2xsX3oODFSu2Ke+oNA/znMvUYGE2FRdqeAtfkm5Bc
	OupgQm16jK0bjqOnGOmxaViEZ0PstRHN/2gT1X2i4wHGNCcNCcv72dZYNUdZtzmsoKXrRRFcBho
	RynrkwvI4oM/Z4faG/aEzk6E8VSz3Gm8h/AsyYeXMvA==
X-Gm-Gg: ASbGncumZ8MWCC7kI+qk/PQTcmCymSiW4vmhPcX4RCrk/SLIZ7Vf52jhJ1QKj5nIxEo
	yH/dLgMgZ6G1zabiwLrfwchtR8S2kvR27xdbv7sOB/BBRqo/SbIlHg6xMoQQUsiIkr5NcOkEReG
	LoTdAOZHX0cjpKHa1cyCZJ9qqZqN6Be0WkSBNlz2WldDNKEX7dajZvLZhXTg0T1u8UAf4Tsd5JG
	sXZc2xR9NoY+zR6b98x07bCnMRIlPOoS9XBvLLq
X-Google-Smtp-Source: AGHT+IElmatWT17jYWsW+gUSp/ZDRToxQ2dIgLj9ktdeVpGM1UhetYGY2AJ4XLEcUtbelrsOzoa+UhGMz7Rt+Fqp+ko=
X-Received: by 2002:a05:6902:2304:b0:e97:b32:fa5c with SMTP id
 3f1490d57ef6-e9f685ad47bmr6332215276.49.1757324155607; Mon, 08 Sep 2025
 02:35:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1757071716.git.gerald.elder-vass@cloud.com>
 <8d66f9ce2c9c352794c0c144f6e00d0a9d465dbe.1757071716.git.gerald.elder-vass@cloud.com>
 <ed2e2406-bfab-4111-a9d0-025c85b51bdb@suse.com>
In-Reply-To: <ed2e2406-bfab-4111-a9d0-025c85b51bdb@suse.com>
From: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
Date: Mon, 8 Sep 2025 10:35:44 +0100
X-Gm-Features: AS18NWDOw7R2YJ1ONaLccNozwnaHV0Wy5EqpPDFZJL9g1LnuJ7Z2Srq8_BrT58Y
Message-ID: <CAOJ+D-UkSveZ4LdYK5GA3VucxxSbQgBv5m9jfZ0H_MyuHP-UZQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] efi: Add a function to check if Secure Boot mode
 is enabled
To: Jan Beulich <jbeulich@suse.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="0000000000000cfec2063e46ea56"

--0000000000000cfec2063e46ea56
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>> +          size =3D=3D 1 && data =3D=3D 0) )
>
>... any reason it's literal 1 here?

The size variable is also used as output from GetVariable and we should
verify that the size of the returned data is as expected, it is simply one
byte so probably not worth defining any macros to make it clearer


*Gerald Elder-Vass*
Senior Software Engineer

XenServer
Cambridge, UK

On Mon, Sep 8, 2025 at 9:49=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:

> On 05.09.2025 14:10, Gerald Elder-Vass wrote:
> > From: Ross Lagerwall <ross.lagerwall@citrix.com>
> >
> > Also cache it to avoid needing to repeatedly ask the firmware.
> >
> > Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> > Signed-off-by: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
> > ---
> > CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> > CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>
> > CC: Jan Beulich <jbeulich@suse.com>
> > CC: Andrew Cooper <andrew.cooper3@citrix.com>
> > CC: Anthony PERARD <anthony.perard@vates.tech>
> > CC: Michal Orzel <michal.orzel@amd.com>
> > CC: Julien Grall <julien@xen.org>
> > CC: "Roger Pau Monn=C3=A9" <roger.pau@citrix.com>
> > CC: Stefano Stabellini <sstabellini@kernel.org>
> >
> > v4:
> > - Fix MISRA warning regarding SecureBoot string
> > v3:
> > - Fix build on ARM
> > ---
> >  xen/common/efi/boot.c    | 24 ++++++++++++++++++++++++
> >  xen/common/efi/runtime.c |  1 +
> >  xen/include/xen/efi.h    |  2 ++
> >  3 files changed, 27 insertions(+)
> >
> > diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> > index e12fa1a7ec04..ccbfc401f7ba 100644
> > --- a/xen/common/efi/boot.c
> > +++ b/xen/common/efi/boot.c
> > @@ -901,6 +901,28 @@ static void __init pre_parse(const struct file
> *file)
> >                     " last line will be ignored.\r\n");
> >  }
> >
> > +static void __init init_secure_boot_mode(void)
> > +{
> > +    static EFI_GUID __initdata gv_uuid =3D EFI_GLOBAL_VARIABLE;
> > +    static CHAR16 __initdata str_SecureBoot[] =3D L"SecureBoot";
> > +    EFI_STATUS status;
> > +    uint8_t data =3D 0;
> > +    UINTN size =3D sizeof(data);
>
> Unlike here, ...
>
> > +    UINT32 attr =3D 0;
> > +
> > +    status =3D efi_rs->GetVariable(str_SecureBoot, &gv_uuid, &attr,
> &size, &data);
> > +
> > +    if ( status =3D=3D EFI_NOT_FOUND ||
> > +         (status =3D=3D EFI_SUCCESS &&
> > +          attr =3D=3D (EFI_VARIABLE_BOOTSERVICE_ACCESS |
> EFI_VARIABLE_RUNTIME_ACCESS) &&
>
> (Nit: Overlong line.)
>
> > +          size =3D=3D 1 && data =3D=3D 0) )
>
> ... any reason it's literal 1 here?
>
> Jan
>

--0000000000000cfec2063e46ea56
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span class=3D"gmail-im">&gt;&gt; +=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 size =3D=3D 1 &amp;&amp; data =3D=3D 0) )<br>&gt;<br></sp=
an>&gt;... any reason it&#39;s literal 1 here?<font color=3D"#888888" style=
=3D"--darkreader-inline-color: var(--darkreader-text-888888, #9d9488);"><br=
></font></div><div><br></div><div>The size variable is also used as output =
from GetVariable and we should verify that the size of the returned data is=
 as expected, it is simply one byte so probably not worth defining any macr=
os to make it clearer</div><div><br></div><div><div dir=3D"ltr" class=3D"gm=
ail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><b>=
<br></b></div><div><b>Gerald Elder-Vass</b></div><div>Senior Software Engin=
eer</div><div><br></div><div>XenServer</div><div>Cambridge, UK</div></div><=
/div></div></div><br><div class=3D"gmail_quote gmail_quote_container"><div =
dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 8, 2025 at 9:49=E2=80=AFAM Jan=
 Beulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 05.09=
.2025 14:10, Gerald Elder-Vass wrote:<br>
&gt; From: Ross Lagerwall &lt;<a href=3D"mailto:ross.lagerwall@citrix.com" =
target=3D"_blank">ross.lagerwall@citrix.com</a>&gt;<br>
&gt; <br>
&gt; Also cache it to avoid needing to repeatedly ask the firmware.<br>
&gt; <br>
&gt; Signed-off-by: Ross Lagerwall &lt;<a href=3D"mailto:ross.lagerwall@cit=
rix.com" target=3D"_blank">ross.lagerwall@citrix.com</a>&gt;<br>
&gt; Signed-off-by: Gerald Elder-Vass &lt;<a href=3D"mailto:gerald.elder-va=
ss@cloud.com" target=3D"_blank">gerald.elder-vass@cloud.com</a>&gt;<br>
&gt; ---<br>
&gt; CC: Marek Marczykowski-G=C3=B3recki &lt;<a href=3D"mailto:marmarek@inv=
isiblethingslab.com" target=3D"_blank">marmarek@invisiblethingslab.com</a>&=
gt;<br>
&gt; CC: &quot;Daniel P. Smith&quot; &lt;<a href=3D"mailto:dpsmith@apertuss=
olutions.com" target=3D"_blank">dpsmith@apertussolutions.com</a>&gt;<br>
&gt; CC: Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" target=3D"_bl=
ank">jbeulich@suse.com</a>&gt;<br>
&gt; CC: Andrew Cooper &lt;<a href=3D"mailto:andrew.cooper3@citrix.com" tar=
get=3D"_blank">andrew.cooper3@citrix.com</a>&gt;<br>
&gt; CC: Anthony PERARD &lt;anthony.perard@vates.tech&gt;<br>
&gt; CC: Michal Orzel &lt;<a href=3D"mailto:michal.orzel@amd.com" target=3D=
"_blank">michal.orzel@amd.com</a>&gt;<br>
&gt; CC: Julien Grall &lt;<a href=3D"mailto:julien@xen.org" target=3D"_blan=
k">julien@xen.org</a>&gt;<br>
&gt; CC: &quot;Roger Pau Monn=C3=A9&quot; &lt;<a href=3D"mailto:roger.pau@c=
itrix.com" target=3D"_blank">roger.pau@citrix.com</a>&gt;<br>
&gt; CC: Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org" t=
arget=3D"_blank">sstabellini@kernel.org</a>&gt;<br>
&gt; <br>
&gt; v4:<br>
&gt; - Fix MISRA warning regarding SecureBoot string<br>
&gt; v3:<br>
&gt; - Fix build on ARM<br>
&gt; ---<br>
&gt;=C2=A0 xen/common/efi/boot.c=C2=A0 =C2=A0 | 24 ++++++++++++++++++++++++=
<br>
&gt;=C2=A0 xen/common/efi/runtime.c |=C2=A0 1 +<br>
&gt;=C2=A0 xen/include/xen/efi.h=C2=A0 =C2=A0 |=C2=A0 2 ++<br>
&gt;=C2=A0 3 files changed, 27 insertions(+)<br>
&gt; <br>
&gt; diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c<br>
&gt; index e12fa1a7ec04..ccbfc401f7ba 100644<br>
&gt; --- a/xen/common/efi/boot.c<br>
&gt; +++ b/xen/common/efi/boot.c<br>
&gt; @@ -901,6 +901,28 @@ static void __init pre_parse(const struct file *f=
ile)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&quot; last line will be ignored.\r\n&quot;);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +static void __init init_secure_boot_mode(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 static EFI_GUID __initdata gv_uuid =3D EFI_GLOBAL_VARIA=
BLE;<br>
&gt; +=C2=A0 =C2=A0 static CHAR16 __initdata str_SecureBoot[] =3D L&quot;Se=
cureBoot&quot;;<br>
&gt; +=C2=A0 =C2=A0 EFI_STATUS status;<br>
&gt; +=C2=A0 =C2=A0 uint8_t data =3D 0;<br>
&gt; +=C2=A0 =C2=A0 UINTN size =3D sizeof(data);<br>
<br>
Unlike here, ...<br>
<br>
&gt; +=C2=A0 =C2=A0 UINT32 attr =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 status =3D efi_rs-&gt;GetVariable(str_SecureBoot, &amp;=
gv_uuid, &amp;attr, &amp;size, &amp;data);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if ( status =3D=3D EFI_NOT_FOUND ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(status =3D=3D EFI_SUCCESS &amp;&am=
p;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 attr =3D=3D (EFI_VARIABLE_BOOTSERV=
ICE_ACCESS | EFI_VARIABLE_RUNTIME_ACCESS) &amp;&amp;<br>
<br>
(Nit: Overlong line.)<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D=3D 1 &amp;&amp; data =3D=
=3D 0) )<br>
<br>
... any reason it&#39;s literal 1 here?<br>
<br>
Jan<br>
</blockquote></div>

--0000000000000cfec2063e46ea56--

