Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19010B45749
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 14:10:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1111853.1460408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuVFf-00008Z-9L; Fri, 05 Sep 2025 12:09:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1111853.1460408; Fri, 05 Sep 2025 12:09:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuVFf-00006D-6A; Fri, 05 Sep 2025 12:09:11 +0000
Received: by outflank-mailman (input) for mailman id 1111853;
 Fri, 05 Sep 2025 12:09:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sj+0=3Q=cloud.com=gerald.elder-vass@srs-se1.protection.inumbo.net>)
 id 1uuVFe-000067-01
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 12:09:10 +0000
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [2607:f8b0:4864:20::b34])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1fddc9ab-8a51-11f0-9d12-b5c5bf9af7f9;
 Fri, 05 Sep 2025 14:09:08 +0200 (CEST)
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-e9d923fd113so1097311276.2
 for <xen-devel@lists.xenproject.org>; Fri, 05 Sep 2025 05:09:08 -0700 (PDT)
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
X-Inumbo-ID: 1fddc9ab-8a51-11f0-9d12-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1757074147; x=1757678947; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L6dcVvKAjwoIBqTuMR0NE2EE5ndirTQgrU2ANAIeNgA=;
        b=fw4HcMhVXC6f6htpP2IPYHbPQuNRefKrC3KoN3SGqOrBUBZHbPZyngVStm7HX6dm5Q
         KDRjkeNlOASlDEQkODXhEJf+4isabZuM5Gpbr8EcpLizw+M+3pu63flimnwgqgsYf9Xj
         fWiDBhGtG/C1ElqwWMPDQupg5ulNL+3vXng8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757074147; x=1757678947;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L6dcVvKAjwoIBqTuMR0NE2EE5ndirTQgrU2ANAIeNgA=;
        b=wxaEHMvg5M5LNACGqIVWvBEbW5ZUWpJPEgs3a3+XGcQNx0TLoHK9QBOirt9BLWqQQc
         Xj/qPU4+5rge2M/DlXxNkfUH7DQqCcMbQuq5jW83Gb40qPdW/OGub1i/bgNQ0JSf4/2q
         dmuNF9zLZ3isHYkS2+gMRwXqxloEYU3zK36JLpP91PLbiI6iQkinTHaowHEIFKj7/nQ9
         Hpzi9f4Iz3NzWRhE+9fLDehu5QTkwETk7NFBPYM4P8lhayOxDiH5EaucmpjZZD2MKysa
         5lhxzmPV7GiyM8+Fbne4f72VZX4EHOQx+4m/+0Bz/7V+HlmQJyB6JmSlg+lDYr2WPR7O
         wECw==
X-Gm-Message-State: AOJu0YyFOpKWUCQMC/rNgDHnMDjDDLkQWw04+jplt+PbSntg+wZ99FBP
	/L/ecGtfnCKSU5OS5/pvrBLJIc3Wkrd9chakL+gamrwLJpxC1q1MdliCE387asGKacycRu2htcc
	sCru9xiLFmu1AhNPlH3bghBgWfTKe30vSgZR5AWvswg==
X-Gm-Gg: ASbGnctG9Bmcu9hI79k09SmdXesMibWs5MzfTyCFjxofaeiLYSvjyokJvgxnLNhO+eq
	SfrEGExzN3Tfyn2C/390mbnCUwuT0yAUXbpnK4d2ECJX/ui0i1tlLzTIH67bNM7VjpDQisacaAr
	/MDxyUJy85I/anrOcQOeyvC+IpOtM9svrI2GYQY8y+U3g+o7w9EyrBT5hniX+h6xjSehPN9OZkl
	wi07w==
X-Google-Smtp-Source: AGHT+IGPkPU0/y/W/HItoasQxFHnB19hgGcm+FlRZOntsVBR4e7rU/aQTLwEO4BKBAbipW+SQvFUE3hvSI+kFliePQ8=
X-Received: by 2002:a05:690e:23cf:b0:5fb:de81:ae9d with SMTP id
 956f58d0204a3-60175b908b6mr4486433d50.10.1757074147092; Fri, 05 Sep 2025
 05:09:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1757066332.git.gerald.elder-vass@cloud.com>
 <7f4a47d5dacf5b2db2ddd2ac72c5e0f236f9be46.1757066332.git.gerald.elder-vass@cloud.com>
 <aLrF9AMOXiZDWEQO@mail-itl>
In-Reply-To: <aLrF9AMOXiZDWEQO@mail-itl>
From: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
Date: Fri, 5 Sep 2025 13:08:54 +0100
X-Gm-Features: Ac12FXwD_uvT_uxrnZk5YZSh7zaujGQOvfRmBsphzZDrdmDZ9bFjz2-Ox-5ZuDQ
Message-ID: <CAOJ+D-X1B-FwBjac7vkco2DMUQeiJKzVVMpX8zh3kd6+oqpTEQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] efi: Support using Shim's LoadImage protocol
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Kevin Lampis <kevin.lampis@cloud.com>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: multipart/alternative; boundary="00000000000061cc84063e0cb461"

--00000000000061cc84063e0cb461
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

 <forgot to use reply all!>

>  Is UnloadImage really appropriate even if LoadImage failed?
Yes, LoadImage can "fail" in a number of ways, some of which do load
the image into the EFI_HANDLE (e.g. image verification failure -
image is loaded then the verification fails and returns an error)
So UnloadImage is needed in many cases, I've intentionally ignored
its return value as it will only unload an image if there is an image to
unload.

> Better be more explicit why it's fatal, like "Refusing to boot
>unverified kernel with UEFI SecureBoot enabled".
I agree! Will update!

Thanks!

*Gerald Elder-Vass*
Senior Software Engineer

XenServer
Cambridge, UK


www.cloud.com


On Fri, Sep 5, 2025 at 12:14=E2=80=AFPM Marek Marczykowski-G=C3=B3recki <
marmarek@invisiblethingslab.com> wrote:

> On Fri, Sep 05, 2025 at 10:05:32AM +0000, Gerald Elder-Vass wrote:
> > The existing Verify functionality of the Shim lock protocol is
> > deprecated and will be removed, the alternative it to use the LoadImage
> > interface to perform the verification.
> >
> > When the loading is successful we won't be using the newly loaded image
> > (as of yet) so we must then immediately unload the image to clean up.
> >
> > If the LoadImage protocol isn't available then fall back to the Shim
> > Lock (Verify) interface.
> >
> > Log when the kernel is not verified and fail if this occurs
> > when secure boot mode is enabled.
> >
> > Signed-off-by: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
> > Signed-off-by: Kevin Lampis <kevin.lampis@cloud.com>
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
> > v3:
> > - Use Shim Image by default, fall back to Shim Lock
> > ---
> >  xen/common/efi/boot.c | 59 +++++++++++++++++++++++++++++++++++++------
> >  1 file changed, 51 insertions(+), 8 deletions(-)
> >
> > diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> > index e7e3dffa7ddc..1f63473d264d 100644
> > --- a/xen/common/efi/boot.c
> > +++ b/xen/common/efi/boot.c
> > @@ -38,6 +38,8 @@
> >    { 0xf2fd1544U, 0x9794, 0x4a2c, {0x99, 0x2e, 0xe5, 0xbb, 0xcf, 0x20,
> 0xe3, 0x94} }
> >  #define SHIM_LOCK_PROTOCOL_GUID \
> >    { 0x605dab50U, 0xe046, 0x4300, {0xab, 0xb6, 0x3d, 0xd8, 0x10, 0xdd,
> 0x8b, 0x23} }
> > +#define SHIM_IMAGE_LOADER_GUID \
> > +  { 0x1f492041U, 0xfadb, 0x4e59, {0x9e, 0x57, 0x7c, 0xaf, 0xe7, 0x3a,
> 0x55, 0xab} }
> >  #define APPLE_PROPERTIES_PROTOCOL_GUID \
> >    { 0x91bd12feU, 0xf6c3, 0x44fb, {0xa5, 0xb7, 0x51, 0x22, 0xab, 0x30,
> 0x3a, 0xe0} }
> >  #define EFI_SYSTEM_RESOURCE_TABLE_GUID    \
> > @@ -70,6 +72,13 @@ typedef struct {
> >      EFI_SHIM_LOCK_VERIFY Verify;
> >  } EFI_SHIM_LOCK_PROTOCOL;
> >
> > +typedef struct _SHIM_IMAGE_LOADER {
> > +    EFI_IMAGE_LOAD LoadImage;
> > +    EFI_IMAGE_START StartImage;
> > +    EFI_EXIT Exit;
> > +    EFI_IMAGE_UNLOAD UnloadImage;
> > +} SHIM_IMAGE_LOADER;
> > +
> >  struct _EFI_APPLE_PROPERTIES;
> >
> >  typedef EFI_STATUS
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
>
> Is UnloadImage really appropriate even if LoadImage failed?
>
> > +    }
> > +
> > +    /* else fall back to Shim Lock */
> > +    if ( !verified &&
> > +         !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,
> > +                                           (void **)&shim_lock)) &&
> > +         !EFI_ERROR(shim_lock->Verify(kernel.ptr, kernel.size)) )
> > +        verified =3D true;
> > +
> > +    if ( !verified )
> > +    {
> > +        PrintStr(L"Kernel was not verified\n");
> > +
> > +        if ( efi_secure_boot )
> > +            blexit(L"Failed to verify kernel");
>
> Better be more explicit why it's fatal, like "Refusing to boot
> unverified kernel with UEFI SecureBoot enabled".
>
> > +    }
> > +}
> > +
> >  static void __init efi_tables(void)
> >  {
> >      unsigned int i;
> > @@ -1334,13 +1383,11 @@ void EFIAPI __init noreturn efi_start(EFI_HANDL=
E
> ImageHandle,
> >                                        EFI_SYSTEM_TABLE *SystemTable)
> >  {
> >      static EFI_GUID __initdata loaded_image_guid =3D
> LOADED_IMAGE_PROTOCOL;
> > -    static EFI_GUID __initdata shim_lock_guid =3D SHIM_LOCK_PROTOCOL_G=
UID;
> >      EFI_LOADED_IMAGE *loaded_image;
> >      EFI_STATUS status;
> >      unsigned int i;
> >      CHAR16 *file_name, *cfg_file_name =3D NULL, *options =3D NULL;
> >      UINTN gop_mode =3D ~0;
> > -    EFI_SHIM_LOCK_PROTOCOL *shim_lock;
> >      EFI_GRAPHICS_OUTPUT_PROTOCOL *gop =3D NULL;
> >      union string section =3D { NULL }, name;
> >      bool base_video =3D false;
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
> > -        PrintErrMesg(L"Dom0 kernel image could not be verified",
> status);
> > +    if ( kernel.ptr && !kernel_verified )
> > +        efi_verify_kernel(ImageHandle);
> >
> >      efi_arch_edd();
> >
> > --
> > 2.47.3
> >
>
> --
> Best Regards,
> Marek Marczykowski-G=C3=B3recki
> Invisible Things Lab
>

--00000000000061cc84063e0cb461
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>
<span class=3D"gmail-im"><div>&lt;forgot to use reply all!&gt;</div><div><b=
r></div><div>&gt;=C2=A0

Is UnloadImage really appropriate even if LoadImage failed?<span><br></span=
></div></span><div><span>Yes, LoadImage can &quot;fail&quot; in a number of=
 ways, some of which do load</span></div><div><span>the image into the EFI_=
HANDLE (e.g. image verification failure -=C2=A0</span></div><div><span>imag=
e is loaded then the verification fails and returns an error)</span></div><=
div><span>So UnloadImage is needed in many cases, I&#39;ve intentionally ig=
nored=C2=A0</span></div><div><span>its return value as it will only unload =
an image if there is an image to unload.</span></div><span class=3D"gmail-i=
m"><div><span><br></span></div><div><span>&gt;</span>
Better be more explicit why it&#39;s fatal, like &quot;Refusing to boot<br>=
&gt;unverified kernel with UEFI SecureBoot enabled&quot;.</div></span><div>=
I agree! Will update!</div><div><br></div><div>Thanks!<br></div></div><div>=
<div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signatur=
e"><div dir=3D"ltr"><div><b><br></b></div><div><b>Gerald Elder-Vass</b></di=
v><div>Senior Software Engineer</div><div><br></div><div>XenServer</div><di=
v>Cambridge, UK</div><div><br></div><div><img src=3D"https://media.tibco.co=
m/images/email-sign/esig-cloud-software-group.png" style=3D"border-style: n=
one; display: block; max-width: 100%; margin: 0px auto 0px 0px; color: rgba=
(0, 0, 0, 0.87); font-family: -apple-system, BlinkMacSystemFont, &quot;Sego=
e UI&quot;, Roboto, Oxygen, Ubuntu, &quot;Fira Sans&quot;, &quot;Droid Sans=
&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px; width: 300=
px; --darkreader-inline-color: var(--darkreader-text-000000de, rgba(232, 23=
0, 227, 0.87));"></div><img src=3D"https://media.tibco.com/images/email-sig=
n/esig_09-xenserver.png" width=3D"200" height=3D"67"><br><div><a href=3D"ht=
tps://www.cloud.com/" target=3D"_blank">www.cloud.com</a><br></div></div></=
div></div><br></div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 5, 2025 at 12:14=E2=80=AFPM=
 Marek Marczykowski-G=C3=B3recki &lt;<a href=3D"mailto:marmarek@invisibleth=
ingslab.com">marmarek@invisiblethingslab.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On Fri, Sep 05, 2025 at 10:05:3=
2AM +0000, Gerald Elder-Vass wrote:<br>
&gt; The existing Verify functionality of the Shim lock protocol is<br>
&gt; deprecated and will be removed, the alternative it to use the LoadImag=
e<br>
&gt; interface to perform the verification.<br>
&gt; <br>
&gt; When the loading is successful we won&#39;t be using the newly loaded =
image<br>
&gt; (as of yet) so we must then immediately unload the image to clean up.<=
br>
&gt; <br>
&gt; If the LoadImage protocol isn&#39;t available then fall back to the Sh=
im<br>
&gt; Lock (Verify) interface.<br>
&gt; <br>
&gt; Log when the kernel is not verified and fail if this occurs<br>
&gt; when secure boot mode is enabled.<br>
&gt; <br>
&gt; Signed-off-by: Gerald Elder-Vass &lt;<a href=3D"mailto:gerald.elder-va=
ss@cloud.com" target=3D"_blank">gerald.elder-vass@cloud.com</a>&gt;<br>
&gt; Signed-off-by: Kevin Lampis &lt;<a href=3D"mailto:kevin.lampis@cloud.c=
om" target=3D"_blank">kevin.lampis@cloud.com</a>&gt;<br>
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
&gt; v3:<br>
&gt; - Use Shim Image by default, fall back to Shim Lock<br>
&gt; ---<br>
&gt;=C2=A0 xen/common/efi/boot.c | 59 +++++++++++++++++++++++++++++++++++++=
------<br>
&gt;=C2=A0 1 file changed, 51 insertions(+), 8 deletions(-)<br>
&gt; <br>
&gt; diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c<br>
&gt; index e7e3dffa7ddc..1f63473d264d 100644<br>
&gt; --- a/xen/common/efi/boot.c<br>
&gt; +++ b/xen/common/efi/boot.c<br>
&gt; @@ -38,6 +38,8 @@<br>
&gt;=C2=A0 =C2=A0 { 0xf2fd1544U, 0x9794, 0x4a2c, {0x99, 0x2e, 0xe5, 0xbb, 0=
xcf, 0x20, 0xe3, 0x94} }<br>
&gt;=C2=A0 #define SHIM_LOCK_PROTOCOL_GUID \<br>
&gt;=C2=A0 =C2=A0 { 0x605dab50U, 0xe046, 0x4300, {0xab, 0xb6, 0x3d, 0xd8, 0=
x10, 0xdd, 0x8b, 0x23} }<br>
&gt; +#define SHIM_IMAGE_LOADER_GUID \<br>
&gt; +=C2=A0 { 0x1f492041U, 0xfadb, 0x4e59, {0x9e, 0x57, 0x7c, 0xaf, 0xe7, =
0x3a, 0x55, 0xab} }<br>
&gt;=C2=A0 #define APPLE_PROPERTIES_PROTOCOL_GUID \<br>
&gt;=C2=A0 =C2=A0 { 0x91bd12feU, 0xf6c3, 0x44fb, {0xa5, 0xb7, 0x51, 0x22, 0=
xab, 0x30, 0x3a, 0xe0} }<br>
&gt;=C2=A0 #define EFI_SYSTEM_RESOURCE_TABLE_GUID=C2=A0 =C2=A0 \<br>
&gt; @@ -70,6 +72,13 @@ typedef struct {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 EFI_SHIM_LOCK_VERIFY Verify;<br>
&gt;=C2=A0 } EFI_SHIM_LOCK_PROTOCOL;<br>
&gt;=C2=A0 <br>
&gt; +typedef struct _SHIM_IMAGE_LOADER {<br>
&gt; +=C2=A0 =C2=A0 EFI_IMAGE_LOAD LoadImage;<br>
&gt; +=C2=A0 =C2=A0 EFI_IMAGE_START StartImage;<br>
&gt; +=C2=A0 =C2=A0 EFI_EXIT Exit;<br>
&gt; +=C2=A0 =C2=A0 EFI_IMAGE_UNLOAD UnloadImage;<br>
&gt; +} SHIM_IMAGE_LOADER;<br>
&gt; +<br>
&gt;=C2=A0 struct _EFI_APPLE_PROPERTIES;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 typedef EFI_STATUS<br>
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
<br>
Is UnloadImage really appropriate even if LoadImage failed?<br>
<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 verified =3D true;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if ( !verified )<br>
&gt; +=C2=A0 =C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 PrintStr(L&quot;Kernel was not verified\n=
&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( efi_secure_boot )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 blexit(L&quot;Failed to ver=
ify kernel&quot;);<br>
<br>
Better be more explicit why it&#39;s fatal, like &quot;Refusing to boot<br>
unverified kernel with UEFI SecureBoot enabled&quot;.<br>
<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 static void __init efi_tables(void)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 unsigned int i;<br>
&gt; @@ -1334,13 +1383,11 @@ void EFIAPI __init noreturn efi_start(EFI_HAND=
LE ImageHandle,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 EFI_S=
YSTEM_TABLE *SystemTable)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 static EFI_GUID __initdata loaded_image_guid =3D L=
OADED_IMAGE_PROTOCOL;<br>
&gt; -=C2=A0 =C2=A0 static EFI_GUID __initdata shim_lock_guid =3D SHIM_LOCK=
_PROTOCOL_GUID;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 EFI_LOADED_IMAGE *loaded_image;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 EFI_STATUS status;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 unsigned int i;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 CHAR16 *file_name, *cfg_file_name =3D NULL, *optio=
ns =3D NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 UINTN gop_mode =3D ~0;<br>
&gt; -=C2=A0 =C2=A0 EFI_SHIM_LOCK_PROTOCOL *shim_lock;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 EFI_GRAPHICS_OUTPUT_PROTOCOL *gop =3D NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 union string section =3D { NULL }, name;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool base_video =3D false;<br>
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
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 PrintErrMesg(L&quot;Dom0 kernel image cou=
ld not be verified&quot;, status);<br>
&gt; +=C2=A0 =C2=A0 if ( kernel.ptr &amp;&amp; !kernel_verified )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 efi_verify_kernel(ImageHandle);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 efi_arch_edd();<br>
&gt;=C2=A0 <br>
&gt; -- <br>
&gt; 2.47.3<br>
&gt; <br>
<br>
-- <br>
Best Regards,<br>
Marek Marczykowski-G=C3=B3recki<br>
Invisible Things Lab<br>
</blockquote></div>

--00000000000061cc84063e0cb461--

