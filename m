Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C882B488DF
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 11:44:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1115002.1461774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvYQ8-0002QG-0X; Mon, 08 Sep 2025 09:44:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1115002.1461774; Mon, 08 Sep 2025 09:44:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvYQ7-0002Ni-Th; Mon, 08 Sep 2025 09:44:19 +0000
Received: by outflank-mailman (input) for mailman id 1115002;
 Mon, 08 Sep 2025 09:44:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zbUz=3T=cloud.com=gerald.elder-vass@srs-se1.protection.inumbo.net>)
 id 1uvYQ6-0002Nc-Ml
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 09:44:18 +0000
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [2607:f8b0:4864:20::b34])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62ca0b44-8c98-11f0-9d13-b5c5bf9af7f9;
 Mon, 08 Sep 2025 11:44:17 +0200 (CEST)
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-e9d6cb1df67so3098687276.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Sep 2025 02:44:17 -0700 (PDT)
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
X-Inumbo-ID: 62ca0b44-8c98-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1757324656; x=1757929456; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LRv9xXnqBppOLm6ep710A8MEaXq8DwLigxo6yffIagA=;
        b=FYIN4oj6nBa2rtTPxszmKXBUJpXd+rM//9nj+bujjWygPf+wTSpIWUDrCjvlHOrt0d
         blmAKKCkAYORcG5xxh/5lzCZ+gBql4ST3mHATV/jFBIDsdJ7+N0yr+QEd3/eiskMskVd
         ZY4fl5uoHPw2QZuSY4FH0KSos4yQUybiPERyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757324656; x=1757929456;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LRv9xXnqBppOLm6ep710A8MEaXq8DwLigxo6yffIagA=;
        b=uiq+wvVc9FsRhb6ZI3fu/PxacD/GaUYiJi96eMqXYN/iA/umOj6+ykjxDlodguQS57
         OyiyzH5yA/Vk3QgKSgRXCKv2uqwoqgel8CsmaRnH4wj59FQV2r4xSgPqQR18h+BAkHI3
         Eh7LUlVZqlq4o2a23pq96k2PwZdsOfOHXXYSsYz/e811A13wFqIcQr26On+bvOi7Rm40
         Op3xDXWSwHjPzIOA5Fb+ARUHxiNH4A4xcQWb2ygq7s+P26Eut1WPle3k5Cr7Ycow73RM
         8pRfz697fbJNMxS7nogqZFrIrFVkDsVlmVFBSSwnqbQKgyOSLitzVEZYBE4MooD+dw7H
         yaHA==
X-Forwarded-Encrypted: i=1; AJvYcCUonfLgO7i3+Xz/aB1YnA20sHGAj2XVQ3ALEBVmnSAydxK3dgf3QbEchqXRfrY3iVOO9fpL4lHtAbk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyE/PVWcoVTD58nBDXNdhsoxNRVvhs41vSWlo2/NIUvDpsXuMPN
	fTDKZQLGUXKxlzqc1NQq+dKo+y3XKIpIfJQbiTSobYGk845OY19WgWO9qoSx1GabRf6KYRdV+yL
	mKQgiYVeDJKhUlnlVUYI47IOjOGnHqwspJKttBopHjg==
X-Gm-Gg: ASbGncsky9XCLeti0q9HsZbJZ9ER6dUj3ra1b2XJakalo9htGddnPYXN0pxcg33hvzp
	w5gp6jmGlP4d3/izAqUbQglLZt9UyUABwJZ8he3CaSEWiutGrEXzmAfVot5MvztRvGq8niev6ko
	ujq3QKFeVJ+e3V/mod6rg2FFF+XeoA/MwHZSGXbPF/y4PS4jM7Ir8AQOOjFAgW/6lgbjxXJH56J
	fYgA32m7KlXXfaU
X-Google-Smtp-Source: AGHT+IHt5NAdOp8KILqDzaClGtMsAd/9fJPpEpYr7mqS0v+/tXhrR6jL1Aw9KyX6kOPWl5huP0DrJQhgIrlV3vl7Lhg=
X-Received: by 2002:a05:6902:102a:b0:e93:4ce0:c1e4 with SMTP id
 3f1490d57ef6-e9f6798ffa6mr6157579276.30.1757324656436; Mon, 08 Sep 2025
 02:44:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1757071716.git.gerald.elder-vass@cloud.com>
 <93ffff66c08d05bc2d912be1831954911e17a27c.1757071716.git.gerald.elder-vass@cloud.com>
 <6647009f-a1f8-4cf0-923a-c04f0a59106a@suse.com>
In-Reply-To: <6647009f-a1f8-4cf0-923a-c04f0a59106a@suse.com>
From: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
Date: Mon, 8 Sep 2025 10:44:05 +0100
X-Gm-Features: AS18NWDODnBlrUOf1ACCnkkPhhPutlitMCUN0sKBZWoz8pfFeKfZtgNbxw1zWvM
Message-ID: <CAOJ+D-Ww=0vaLftfkC5MfgjkSJ_Fg-g1OXSGXX38EoH4LgkfXw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] efi: Support using Shim's LoadImage protocol
To: Jan Beulich <jbeulich@suse.com>
Cc: Kevin Lampis <kevin.lampis@cloud.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000e763d9063e4707b3"

--000000000000e763d9063e4707b3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>As already said on an earlier version, the use of !EFI_ERROR() here is a
>behavioral change from ...
>
>> @@ -1591,12 +1638,8 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE
ImageHandle,
>>       * device tree through the efi_check_dt_boot function, in this stag=
e
>>       * verify it.
>>       */
>> -    if ( kernel.ptr &&
>> -         !kernel_verified &&
>> -         !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,
>> -                                           (void **)&shim_lock)) &&
>> -         (status =3D shim_lock->Verify(kernel.ptr, kernel.size)) !=3D
EFI_SUCCESS )
>
>... checking for EFI_SUCCESS alone here. There's also nothing in the
>description justifying the change. (See the various EFI_WARN_* that exist.=
)

You're correct! The EFI_WARN_* responses should all be treated as failures,
I'll revert that particular change in the patch series

*Gerald Elder-Vass*
Senior Software Engineer

XenServer
Cambridge, UK


On Mon, Sep 8, 2025 at 9:56=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:

> On 05.09.2025 14:10, Gerald Elder-Vass wrote:
> > @@ -1047,6 +1056,46 @@ static UINTN __init
> efi_find_gop_mode(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop,
> >      return gop_mode;
> >  }
> >
> > +static void __init efi_verify_kernel(EFI_HANDLE ImageHandle)
> > +{
> > +    static EFI_GUID __initdata shim_image_guid =3D SHIM_IMAGE_LOADER_G=
UID;
> > +    static EFI_GUID __initdata shim_lock_guid =3D SHIM_LOCK_PROTOCOL_G=
UID;
> > +    SHIM_IMAGE_LOADER *shim_loader;
> > +    EFI_HANDLE loaded_kernel;
> > +    EFI_SHIM_LOCK_PROTOCOL *shim_lock;
> > +    EFI_STATUS status;
> > +    bool verified =3D false;
> > +
> > +    /* Look for LoadImage first */
> > +    if ( !EFI_ERROR(efi_bs->LocateProtocol(&shim_image_guid, NULL,
> > +                                           (void **)&shim_loader)) )
> > +    {
> > +        status =3D shim_loader->LoadImage(false, ImageHandle, NULL,
> > +                                        (void *)kernel.ptr, kernel.siz=
e,
> > +                                        &loaded_kernel);
> > +        if ( !EFI_ERROR(status) )
> > +            verified =3D true;
> > +
> > +        /* LoadImage performed verification, now clean up with
> UnloadImage */
> > +        shim_loader->UnloadImage(loaded_kernel);
> > +    }
> > +
> > +    /* else fall back to Shim Lock */
> > +    if ( !verified &&
> > +         !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,
> > +                                           (void **)&shim_lock)) &&
> > +         !EFI_ERROR(shim_lock->Verify(kernel.ptr, kernel.size)) )
>
> As already said on an earlier version, the use of !EFI_ERROR() here is a
> behavioral change from ...
>
> > @@ -1591,12 +1638,8 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE
> ImageHandle,
> >       * device tree through the efi_check_dt_boot function, in this sta=
ge
> >       * verify it.
> >       */
> > -    if ( kernel.ptr &&
> > -         !kernel_verified &&
> > -         !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,
> > -                                           (void **)&shim_lock)) &&
> > -         (status =3D shim_lock->Verify(kernel.ptr, kernel.size)) !=3D
> EFI_SUCCESS )
>
> ... checking for EFI_SUCCESS alone here. There's also nothing in the
> description justifying the change. (See the various EFI_WARN_* that exist=
.)
>
> Jan
>

--000000000000e763d9063e4707b3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>&gt;As already said on an earlier version, the use of=
 !EFI_ERROR() here is a<br>&gt;behavioral change from ...<span><br>&gt;<br>=
&gt;&gt; @@ -1591,12 +1638,8 @@ void EFIAPI __init noreturn efi_start(EFI_H=
ANDLE ImageHandle,<br>&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* device tree thro=
ugh the efi_check_dt_boot function, in this stage<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* verify it.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>&gt;&gt; -=C2=A0 =C2=A0 if ( kerne=
l.ptr &amp;&amp;<br>&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!kernel_ver=
ified &amp;&amp;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!EFI_ERROR(efi_bs-&gt;LocatePro=
tocol(&amp;shim_lock_guid, NULL,<br>&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void **)&amp;shim_lock=
)) &amp;&amp;<br>&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(status =3D sh=
im_lock-&gt;Verify(kernel.ptr, kernel.size)) !=3D EFI_SUCCESS )<br>&gt;<br>=
</span>&gt;... checking for EFI_SUCCESS alone here. There&#39;s also nothin=
g in the<br>&gt;description justifying the change. (See the various EFI_WAR=
N_* that exist.)<font color=3D"#888888" style=3D"--darkreader-inline-color:=
 var(--darkreader-text-888888, #9d9488);"><br></font></div><div><br></div><=
div>You&#39;re correct! The EFI_WARN_* responses should all be treated as f=
ailures, I&#39;ll revert that particular change in the patch series</div><d=
iv><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signa=
ture"><div dir=3D"ltr"><div><b><br></b></div><div><b>Gerald Elder-Vass</b><=
/div><div>Senior Software Engineer</div><div><br></div><div>XenServer</div>=
<div>Cambridge, UK</div></div></div></div><br></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 8, 2025 at 9:56=
=E2=80=AFAM Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" target=3D"=
_blank">jbeulich@suse.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On 05.09.2025 14:10, Gerald Elder-Vass wrote:<br>
&gt; @@ -1047,6 +1056,46 @@ static UINTN __init efi_find_gop_mode(EFI_GRAPH=
ICS_OUTPUT_PROTOCOL *gop,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return gop_mode;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +static void __init efi_verify_kernel(EFI_HANDLE ImageHandle)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 static EFI_GUID __initdata shim_image_guid =3D SHIM_IMA=
GE_LOADER_GUID;<br>
&gt; +=C2=A0 =C2=A0 static EFI_GUID __initdata shim_lock_guid =3D SHIM_LOCK=
_PROTOCOL_GUID;<br>
&gt; +=C2=A0 =C2=A0 SHIM_IMAGE_LOADER *shim_loader;<br>
&gt; +=C2=A0 =C2=A0 EFI_HANDLE loaded_kernel;<br>
&gt; +=C2=A0 =C2=A0 EFI_SHIM_LOCK_PROTOCOL *shim_lock;<br>
&gt; +=C2=A0 =C2=A0 EFI_STATUS status;<br>
&gt; +=C2=A0 =C2=A0 bool verified =3D false;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Look for LoadImage first */<br>
&gt; +=C2=A0 =C2=A0 if ( !EFI_ERROR(efi_bs-&gt;LocateProtocol(&amp;shim_ima=
ge_guid, NULL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(void **)&amp;shim_loader)) )<br>
&gt; +=C2=A0 =C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D shim_loader-&gt;LoadImage(fals=
e, ImageHandle, NULL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (voi=
d *)kernel.ptr, kernel.size,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp=
;loaded_kernel);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( !EFI_ERROR(status) )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 verified =3D true;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* LoadImage performed verification, now =
clean up with UnloadImage */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 shim_loader-&gt;UnloadImage(loaded_kernel=
);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* else fall back to Shim Lock */<br>
&gt; +=C2=A0 =C2=A0 if ( !verified &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!EFI_ERROR(efi_bs-&gt;LocateProtoco=
l(&amp;shim_lock_guid, NULL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(void **)&amp;shim_lock)) &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!EFI_ERROR(shim_lock-&gt;Verify(ker=
nel.ptr, kernel.size)) )<br>
<br>
As already said on an earlier version, the use of !EFI_ERROR() here is a<br=
>
behavioral change from ...<br>
<br>
&gt; @@ -1591,12 +1638,8 @@ void EFIAPI __init noreturn efi_start(EFI_HANDL=
E ImageHandle,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* device tree through the efi_check_dt_boot =
function, in this stage<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* verify it.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -=C2=A0 =C2=A0 if ( kernel.ptr &amp;&amp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!kernel_verified &amp;&amp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!EFI_ERROR(efi_bs-&gt;LocateProtoco=
l(&amp;shim_lock_guid, NULL,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(void **)&amp;shim_lock)) &amp;&amp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(status =3D shim_lock-&gt;Verify(ke=
rnel.ptr, kernel.size)) !=3D EFI_SUCCESS )<br>
<br>
... checking for EFI_SUCCESS alone here. There&#39;s also nothing in the<br=
>
description justifying the change. (See the various EFI_WARN_* that exist.)=
<br>
<br>
Jan<br>
</blockquote></div>

--000000000000e763d9063e4707b3--

