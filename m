Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01485B52CB2
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 11:09:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119808.1465029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwdI9-00009Z-VV; Thu, 11 Sep 2025 09:08:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119808.1465029; Thu, 11 Sep 2025 09:08:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwdI9-00006p-SS; Thu, 11 Sep 2025 09:08:33 +0000
Received: by outflank-mailman (input) for mailman id 1119808;
 Thu, 11 Sep 2025 09:08:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jUFa=3W=cloud.com=gerald.elder-vass@srs-se1.protection.inumbo.net>)
 id 1uwdI9-00006j-7L
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 09:08:33 +0000
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [2607:f8b0:4864:20::b31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e279a2ec-8eee-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 11:08:30 +0200 (CEST)
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-e970599004aso236755276.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Sep 2025 02:08:30 -0700 (PDT)
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
X-Inumbo-ID: e279a2ec-8eee-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1757581709; x=1758186509; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MDFSPpfMQx0xouLbfqxGVzwgr6YW2sVDKyq9doRjQQ8=;
        b=LqfdYiZv/EOJQ1ZlLvv7iJesrTi7PO59QTrha7ytNc9fJZJjTh6gqNePrlb1Iu5IEl
         Xv54wtoOJXzMt0xqyH6PjQ9mGVZrulzQTOuJn03eZWKps0SoC1gPpCk8RrMak5Es11E8
         UaQaCr+yqevxrjky7nsroV+SpK70WCV0kYeig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757581709; x=1758186509;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MDFSPpfMQx0xouLbfqxGVzwgr6YW2sVDKyq9doRjQQ8=;
        b=eIWeaIio4ccMy+t+DBSkfmjzqydLXYdjtlYqSJWd93ciqzyEDciG/+qITUxaHHZkLL
         YJNjC0+fGVCZXOOfX2HGV9/4XeLh6+lqSJeO1bvEO/YkTp0bv/FLtKpwRyIIo6T/g8m4
         EQrGAhBHjst93Dmvi1BZeLL32OvTLBg7cmnVVbD4tQPk7uEPBE86wl8pQ4G/iQxT5Y3I
         9r7tQaSJ+zFF+HVqJM9ED+rIpRHhuSCIuFTOCIeL/D5ozjGBv9z24XjaQkeJhtIp8ZGU
         P9bS2Rs4T1Ypp3wDE9wGJiEdiQfPdi2yCGSOLSxwqqFfAe7wYbhlnEF0CwW6gmcdmo/H
         8mSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXphvn47ZjFmtJN0i2EJzRXGlkOTjEmy14SXw3Q9dWBBFj2fWReDzqFml/ypHTYl7Jgvi7EUfDkSlY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwTM0AHVeA9xfWk9WDjgDV6aO66lhKjNY76EWWTjuG5fxDZjrzy
	qtJB8Huoo+ue7kP1VlVYzD7dJF2OBUial/kG/xOATIEuJ+zmGaYSxzcd8aslUA6u+o9ATAUoK2B
	KC4sIc3N9yTjbpVcUxyozdaiCv9DQggoRfraFAdOHPw==
X-Gm-Gg: ASbGncvJbtu1VPJaSrdGiIBl2hFRzdl1+K0v/10hk0/ESb3Wpq6jOpwL9SP9VHm6PNh
	iZk8qdCMW3BZImlfpXeiwqIThJmaYvCV9rmJ/+PYMyf4JMJzOFgfMCQQKtYZ8uP5D8ESpEsqcRf
	qIqggotJVH411u4fadJ0Ax7wGDCNtmm17SlHp6WuoqyIKd6e3l5BlyOgP9WWQj4dtI02ypxYvd7
	Z2C0Llskx2wYjNu/gzqe7eODamDNDlZwf9/EYbGss5FqRfSqC8=
X-Google-Smtp-Source: AGHT+IGPd+dsNL21jtbwQOdC3WmVh3Qdk+YgrjLNtLVTAAYLhD6qRu5Yn0HiiHDHRgrCQYBZin3ZtpdjMSpeWVNw8hY=
X-Received: by 2002:a05:690c:30a:b0:723:8ccd:6898 with SMTP id
 00721157ae682-727f28e47c9mr200833927b3.10.1757581709260; Thu, 11 Sep 2025
 02:08:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1757519202.git.gerald.elder-vass@cloud.com>
 <1f7b5737d4b36623af2734d525c895b77fef08fc.1757519202.git.gerald.elder-vass@cloud.com>
 <48e537f5-2379-4b8d-a9b5-4761225a855a@suse.com>
In-Reply-To: <48e537f5-2379-4b8d-a9b5-4761225a855a@suse.com>
From: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
Date: Thu, 11 Sep 2025 10:08:18 +0100
X-Gm-Features: AS18NWAsH1FBtBbkGK8qbiA5ITlL7LNC_VbNP0JbfHV6I1hu23rQFoA4qyqzDIE
Message-ID: <CAOJ+D-UY0LC-Bqpa4mFH+o2GKF5h8AFsGdxWYBcLVXGmO_MBFA@mail.gmail.com>
Subject: Re: [PATCH 2/3] efi: Protect against unnecessary image unloading
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="00000000000071e38c063e82e1d4"

--00000000000071e38c063e82e1d4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>> @@ -1078,11 +1078,12 @@ static void __init efi_verify_kernel(EFI_HANDLE
ImageHandle)
>>              verified =3D true;
>>
>>          /*
>> -         * Always unload the image.  We only needed LoadImage() to
perform
>> -         * verification anyway, and in the case of a failure there may
still
>> -         * be cleanup needing to be performed.
>> +         * If the kernel was loaded, unload it. We only needed
LoadImage() to
>> +         * perform verification anyway, and in the case of a failure
there may
>> +         * still be cleanup needing to be performed.
>>           */
>> -        shim_loader->UnloadImage(loaded_kernel);
>> +        if ( loaded_kernel )
>> +            shim_loader->UnloadImage(loaded_kernel);
>>      }
>
>To me this looks as odd as the earlier unconditional unloading. How would =
a
>halfway sane implementation of LoadImage() return an error, but require
>subsequent cleanup (and set what the last function argument points at to
>non-NULL)? Unless explicitly specified otherwise, my expectation would be
>that upon failure loaded_kernel could have any arbitrary value, possibly
>entirely unsuitable to pass to UnloadImage().

This is because LoadImage performs the verification step after the loading.
They are independent operations but the output conflates the two, so we can
receive a successfully loaded image and an EFI_SECURITY_VIOLATION
status code, in this particular case the image will need to be unloaded. Th=
e
generalised check for the EFI_IMAGE_HANDLE before unloading (as
opposed to checking this specific status code) protects against any future
changes in the protocol.

I've linked the specification which states that the ImageHandle is created
in this particular case.
https://uefi.org/specs/UEFI/2.10/07_Services_Boot_Services.html#efi-boot-se=
rvices-loadimage

*Gerald Elder-Vass*
Senior Software Engineer

XenServer
Cambridge, UK

On Thu, Sep 11, 2025 at 9:34=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:

> On 11.09.2025 10:24, Gerald Elder-Vass wrote:
> > @@ -1078,11 +1078,12 @@ static void __init efi_verify_kernel(EFI_HANDLE
> ImageHandle)
> >              verified =3D true;
> >
> >          /*
> > -         * Always unload the image.  We only needed LoadImage() to
> perform
> > -         * verification anyway, and in the case of a failure there may
> still
> > -         * be cleanup needing to be performed.
> > +         * If the kernel was loaded, unload it. We only needed
> LoadImage() to
> > +         * perform verification anyway, and in the case of a failure
> there may
> > +         * still be cleanup needing to be performed.
> >           */
> > -        shim_loader->UnloadImage(loaded_kernel);
> > +        if ( loaded_kernel )
> > +            shim_loader->UnloadImage(loaded_kernel);
> >      }
>
> To me this looks as odd as the earlier unconditional unloading. How would=
 a
> halfway sane implementation of LoadImage() return an error, but require
> subsequent cleanup (and set what the last function argument points at to
> non-NULL)? Unless explicitly specified otherwise, my expectation would be
> that upon failure loaded_kernel could have any arbitrary value, possibly
> entirely unsuitable to pass to UnloadImage().
>
> Jan
>

--00000000000071e38c063e82e1d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div></div><div>&gt;<span class=3D"gmail-im">&gt; @@ -1078=
,11 +1078,12 @@ static void __init efi_verify_kernel(EFI_HANDLE ImageHandle=
)<br></span>
&gt;<span class=3D"gmail-im">&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 verified =3D true;<br></span>
&gt;<span class=3D"gmail-im">&gt;=C2=A0 <br>&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /*<br>&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Always un=
load the image.=C2=A0 We only needed LoadImage() to perform<br>&gt;&gt; -=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* verification anyway, and in the case of=
 a failure there may still<br>&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=
 be cleanup needing to be performed.<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* If the kernel was loaded, unload it. We only needed LoadImage()=
 to<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* perform verification a=
nyway, and in the case of a failure there may<br>&gt;&gt; +=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0* still be cleanup needing to be performed.<br>&gt;&gt;=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>&gt;&gt; -=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 shim_loader-&gt;UnloadImage(loaded_kernel);<br>&gt;&gt; +=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 if ( loaded_kernel )<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 shim_loader-&gt;UnloadImage(loaded_kernel);<br>&gt;&g=
t;=C2=A0 =C2=A0 =C2=A0 }<br>&gt;<br></span>&gt;To me this looks as odd as t=
he earlier unconditional unloading. How would a<br>&gt;halfway sane impleme=
ntation of LoadImage() return an error, but require<br>&gt;subsequent clean=
up (and set what the last function argument points at to<br>&gt;non-NULL)? =
Unless explicitly specified otherwise, my expectation would be<br>&gt;that =
upon failure loaded_kernel could have any arbitrary value, possibly<br>&gt;=
entirely unsuitable to pass to UnloadImage().<font color=3D"#888888" style=
=3D"--darkreader-inline-color: var(--darkreader-text-888888, #9d9488);"><br=
></font></div><div><font color=3D"#888888" style=3D"--darkreader-inline-col=
or: var(--darkreader-text-888888, #9d9488);"><br></font></div><div>This is =
because LoadImage performs the verification step after the loading.</div><d=
iv>They are independent operations but the output conflates the two, so we =
can</div><div>receive a successfully loaded image and an EFI_SECURITY_VIOLA=
TION</div><div>status code, in this particular case the image will need to =
be unloaded. The</div><div>generalised check for the EFI_IMAGE_HANDLE befor=
e unloading (as</div><div>opposed to checking this specific status code) pr=
otects against any future</div><div>changes in the protocol.</div><div><br>=
</div><div>I&#39;ve linked the specification which states that the ImageHan=
dle is created</div><div>in this particular case.</div><div><a href=3D"http=
s://uefi.org/specs/UEFI/2.10/07_Services_Boot_Services.html#efi-boot-servic=
es-loadimage">https://uefi.org/specs/UEFI/2.10/07_Services_Boot_Services.ht=
ml#efi-boot-services-loadimage</a></div><div></div><div><div dir=3D"ltr" cl=
ass=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"=
><div><b><br></b></div><div><b>Gerald Elder-Vass</b></div><div>Senior Softw=
are Engineer</div><div><br></div><div>XenServer</div><div>Cambridge, UK</di=
v></div></div></div></div><br><div class=3D"gmail_quote gmail_quote_contain=
er"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 11, 2025 at 9:34=E2=
=80=AFAM Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On 11.09.2025 10:24, Gerald Elder-Vass wrote:<br>
&gt; @@ -1078,11 +1078,12 @@ static void __init efi_verify_kernel(EFI_HANDL=
E ImageHandle)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 verified =3D true;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Always unload the image.=C2=A0 We=
 only needed LoadImage() to perform<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* verification anyway, and in the c=
ase of a failure there may still<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* be cleanup needing to be performe=
d.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* If the kernel was loaded, unload =
it. We only needed LoadImage() to<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* perform verification anyway, and =
in the case of a failure there may<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* still be cleanup needing to be pe=
rformed.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 shim_loader-&gt;UnloadImage(loaded_kernel=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( loaded_kernel )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shim_loader-&gt;UnloadImage=
(loaded_kernel);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
<br>
To me this looks as odd as the earlier unconditional unloading. How would a=
<br>
halfway sane implementation of LoadImage() return an error, but require<br>
subsequent cleanup (and set what the last function argument points at to<br=
>
non-NULL)? Unless explicitly specified otherwise, my expectation would be<b=
r>
that upon failure loaded_kernel could have any arbitrary value, possibly<br=
>
entirely unsuitable to pass to UnloadImage().<br>
<br>
Jan<br>
</blockquote></div>

--00000000000071e38c063e82e1d4--

