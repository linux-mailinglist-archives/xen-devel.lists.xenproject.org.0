Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B7DAE67C7
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 16:06:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023763.1399820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU4HX-0003MG-Bm; Tue, 24 Jun 2025 14:05:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023763.1399820; Tue, 24 Jun 2025 14:05:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU4HX-0003KO-8x; Tue, 24 Jun 2025 14:05:51 +0000
Received: by outflank-mailman (input) for mailman id 1023763;
 Tue, 24 Jun 2025 14:05:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aTSQ=ZH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uU4HV-0003KI-LH
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 14:05:49 +0000
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [2607:f8b0:4864:20::c33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50bdfa26-5104-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 16:05:43 +0200 (CEST)
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-604ad0347f5so1293293eaf.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 07:05:43 -0700 (PDT)
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
X-Inumbo-ID: 50bdfa26-5104-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1750773942; x=1751378742; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bn8mrYwmbv0mNoEDLwFl4hXErZo20REMJyiJd3QKTmk=;
        b=Iv6fQ4AFegESZzj5EZFDlIe5l9aSFeUB1yby9/XW2eyy+g4miUO7xDGnX+SQVqiLVa
         VRkAU+YYhp0v6aEAzPECP+AEM1WeqpLF53xvc0lbCjjplCjVAuriwn4nt58X0NIbZEdO
         2db7vAs398l2xgLnS7EkvpPWNZEMyJcD9N5/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750773942; x=1751378742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bn8mrYwmbv0mNoEDLwFl4hXErZo20REMJyiJd3QKTmk=;
        b=MFBRzon1Lxfff7rkfWZ9j0+7EKMHUJzoxpjofKHwuxHJBRT908UCiO5ReR4gntd6ji
         u11rAXzqe9jgWbeMISzz0+iWTaOuPvc6cJ++gd0PdKBmsZxB1ffi41TUUNwfua5eznIQ
         87kJNZGW+bPsqH7/Ku8ggVcgSG+3/tTsckJ7k5Tz+17be2FYc4ONjtIold7ArtyyPli7
         0yELvXzPEpPJ7n2KY6299/WwLNa58SDfbocPsjcJa59Pyt5j6y1TUsTxsozbwV0NJpVd
         guiL65F2f4FQEJ0y2ccJtBXoGWIDNu08BhxNgaZOqnsEk6fKzd+/D48Qd9tz5wRZRN53
         OcSQ==
X-Gm-Message-State: AOJu0Yxa0X8DXitRmP0XftSViCxLI6a0rpyIEQeFnldTz8iP20Rsdbk+
	6ZH3UrABiFheJ0zVcSFZaQDvNQ6AgFlTSPWoX2KTP1RUeD3QW1bAwiz1M2l4gbO/mj18Knx62vj
	ogynSSPYFw/ZG/hD/2HPUdwiNrawGcTrdWapWLoHF5VocxN3dRaFuJ5gtOw==
X-Gm-Gg: ASbGncuI3QHrLSAQbenOeJHpyfvfARKmAOq86XJOTwg0l0Z400FGgrdLdePSvSrYSEJ
	BBzTnOiiUBgvzD8zi63zm5CZxdgptrvd4CZQ6EJUFqv1BdMsOFOJKPhbG8WZ8T+XBURtKboTDbK
	JWs7zWfqjcqq2zyx9jBBSplJQWzRpvwZb3f+Pa81xW
X-Google-Smtp-Source: AGHT+IFv95mUUUr/3h/xYXf41bUt+lbdyzEWbiAlx4S+0wclXtwk6erbCM5fwmF7K+6ZsID/bDgQZHPd8kSIu5xOL8A=
X-Received: by 2002:a05:6870:ff8f:b0:2b8:2f9c:d513 with SMTP id
 586e51a60fabf-2eeee4e519fmr10830188fac.19.1750773941687; Tue, 24 Jun 2025
 07:05:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250624083157.9334-1-frediano.ziglio@cloud.com>
 <20250624083157.9334-2-frediano.ziglio@cloud.com> <aFqcQe5quyjhu24P@mail-itl>
In-Reply-To: <aFqcQe5quyjhu24P@mail-itl>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Tue, 24 Jun 2025 15:05:25 +0100
X-Gm-Features: AX0GCFsw559r3c4YqwVi6MfZtI6Z6EN0X3ELxEvnuZCTFQwSOEywCwNvfhn-niY
Message-ID: <CACHz=ZjcZRtjHnUPFRRYd4d-ESv4j2_ssjSTne=6NGCf0s2vBw@mail.gmail.com>
Subject: Re: [PATCH 1/2] xen/efi: Handle cases where file didn't come from ESP
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 1:38=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> On Tue, Jun 24, 2025 at 09:31:54AM +0100, Frediano Ziglio wrote:
> > A boot loader can load files from outside ESP.
> > In these cases device could be not provided or path could
> > be something not supported.
> > In these cases allows to boot anyway, all information
> > could be provided using UKI or using other boot loader
> > features.
> >
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > ---
> >  xen/common/efi/boot.c | 27 +++++++++++++++++++++++++--
> >  1 file changed, 25 insertions(+), 2 deletions(-)
> >
> > diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> > index 1a9b4e7dae..2a49c6d05d 100644
> > --- a/xen/common/efi/boot.c
> > +++ b/xen/common/efi/boot.c
> > @@ -443,6 +443,18 @@ static EFI_FILE_HANDLE __init get_parent_handle(co=
nst EFI_LOADED_IMAGE *loaded_i
> >      CHAR16 *pathend, *ptr;
> >      EFI_STATUS ret;
> >
> > +    /*
> > +     * In some cases the image could not come from a specific device.
> > +     * For instance this can happen if Xen was loaded using GRUB2 "lin=
ux"
> > +     * command.
> > +     */
> > +    *leaf =3D buffer;
>
> This feels wrong, if DeviceHandle is NULL, it will point at the
> empty buffer that shouldn't really be used for anything anyway.
>

Yes, this was done just to make the compiler happy, I changed to
assign NULL instead.

> IMO a better option would be to add "&& dir_handle" to the condition
> guarding use of file_name in efi_start() instead.
>

Yes, it makes sense. Done.

> BTW, by my reading of get_parent_handle() theoretically it should be
> possible to get _some_ name out of loaded_image->FilePath even without
> dir_handle. But since it isn't going to be used, it's not worth it.
>
> > +    if ( !loaded_image->DeviceHandle )
> > +    {
> > +        PrintStr(L"Xen image loaded without providing a device\r\n");
> > +        return NULL;
> > +    }
> > +
> >      do {
> >          EFI_FILE_IO_INTERFACE *fio;
> >
> > @@ -466,7 +478,15 @@ static EFI_FILE_HANDLE __init get_parent_handle(co=
nst EFI_LOADED_IMAGE *loaded_i
> >
> >          if ( DevicePathType(dp) !=3D MEDIA_DEVICE_PATH ||
> >               DevicePathSubType(dp) !=3D MEDIA_FILEPATH_DP )
> > -            blexit(L"Unsupported device path component");
> > +        {
> > +            /*
> > +             * The image could come from an unsupported device.
> > +             * For instance this can happen if Xen was loaded using GR=
UB2
> > +             * "chainloader" command and the file was not from ESP.
> > +             */
> > +            PrintStr(L"Unsupported device path component\r\n");
> > +            return NULL;
> > +        }
> >
> >          if ( *buffer )
> >          {
> > @@ -772,6 +792,8 @@ static bool __init read_file(EFI_FILE_HANDLE dir_ha=
ndle, CHAR16 *name,
> >
> >      if ( !name )
> >          PrintErrMesg(L"No filename", EFI_OUT_OF_RESOURCES);
> > +    if ( !dir_handle )
> > +        return false;
>
> There are a lot of places where read_file() is used without checking its
> return value. Which made sense since before this change the only cases
> where read_file() would return false was for the config file, in all
> other cases it handled errors via blexit().
> Most of those read_file() calls seems to be fine (as in, will not
> explode), but may still be confusing. For example when you embed a
> config with "xsm=3Dpolicy" (but the actual policy is not embedded) now th=
e
> failure to load it will result just a warning ("Xen image loaded without
> providing a device") not even related to the file name and it will
> continue booting with unintended configuration.
>

Yes, it makes sense. Changing the code to handle dir_handle =3D=3D NULL as
Open returning EFI_NOT_FOUND so all failures (beside configuration)
will become fatal as before.

OT: the flow of read_file (specifically "what" handling) looks
weird... can I change it?

> For me it looks like this change is wrong: if the config specified a
> file to load (and that blob was not embedded in the UKI), and yet it
> couldn't be loaded, it should fail early.
> Is there any (new) case where where read_file() failure (when it
> actually gets to calling it) should really be non-fatal now?
>
> In relation to the next patch - such UKI should simply not specify
> ramdisk in the embedded config, to allow loading it via "initrd"
> command. This would avoid calling read_file().
>
> >      ret =3D dir_handle->Open(dir_handle, &FileHandle, name,
> >                             EFI_FILE_MODE_READ, 0);
> >      if ( file =3D=3D &cfg && ret =3D=3D EFI_NOT_FOUND )
> > @@ -1515,7 +1537,8 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE =
ImageHandle,
> >          efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
> >          cfg.addr =3D 0;
> >
> > -        dir_handle->Close(dir_handle);
> > +        if ( dir_handle )
> > +            dir_handle->Close(dir_handle);
> >
> >          if ( gop && !base_video )
> >          {

Frediano

