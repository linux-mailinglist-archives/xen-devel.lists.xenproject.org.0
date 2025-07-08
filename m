Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D569AFCD45
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 16:19:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036671.1408906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ9AH-0002RZ-89; Tue, 08 Jul 2025 14:19:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036671.1408906; Tue, 08 Jul 2025 14:19:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ9AH-0002PX-50; Tue, 08 Jul 2025 14:19:21 +0000
Received: by outflank-mailman (input) for mailman id 1036671;
 Tue, 08 Jul 2025 14:19:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tCx0=ZV=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uZ9AF-0002PR-6F
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 14:19:19 +0000
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [2607:f8b0:4864:20::c30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 879ca8a1-5c06-11f0-b894-0df219b8e170;
 Tue, 08 Jul 2025 16:19:17 +0200 (CEST)
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-613b02e8017so1193839eaf.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jul 2025 07:19:17 -0700 (PDT)
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
X-Inumbo-ID: 879ca8a1-5c06-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1751984356; x=1752589156; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=og4MTndAH/EzgQ7yRlJucwGMCEFU9AquNYm6SfsjlZk=;
        b=QKOG0F+SvPHj2pmfxWSUcDsMWeCYe3bS7qeZSYKSV2pM80WukL9/FX7nKcGMJswOaE
         cONVKFiz2MyUm4B0Qs4dRvEM4BzNSyfX0mqZI/XfWxkY7JmP18wcpivuJA9D1Pe8CD6w
         /THaWD2+q6tk7ldwd2joP1HsimxIpKQrj95sw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751984356; x=1752589156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=og4MTndAH/EzgQ7yRlJucwGMCEFU9AquNYm6SfsjlZk=;
        b=lN/9WKIv/8+Kn9GneYfYk+K2mFcJBM8uknLT+Q/pJbRCQGjEhIEQKbbIu5zXFgmyUl
         3ieoAeyl8wo2A+rESkQW+aML9D3XwMX5T2g4VC2x6zhLAims5KoeGRxngv+fZsJGZv/u
         My4TxBFfwKY3dM+sspjmfA2mxJG+R8kbp0BHyylgGBWA6dZmzLJx5a5QwGCysmvcFBf2
         mKg4eEXGbG+NdJCeziFbaDrE21/h+Rd1lH22PxMgLB2BrcyfufmHFgzzRwCWovNJFHr4
         yuUWjbr8skceosS62B1CLvq23Wq8LrztmwIS+36aNFKAYC19vN6uW1cgTkf5ofSoUFt2
         pNSA==
X-Forwarded-Encrypted: i=1; AJvYcCXemM1pKBXkrM2V6UQxyjgJ9xYUv91OGiGfJdoeuauiBTRhGgS9HMIoB8EIHgQOvZWtOmrtq6O/LOM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwEW2VljUtlT1f0WqULCn1eb+z1pjau7WIsiTsLRjVrXjwdmTWT
	ZuZ4wuPiosS3GFpOufgJtBKKkEXEItykcdObZ6DuImbhXrDeEQ4z1cUKPmlNOZNl4jfx5ag90bR
	bx065c5eMCPmzj7yTEueqJNWjYzOq4dZZF1bLt2SYng==
X-Gm-Gg: ASbGncsXD8YWNhrTGGBpNtzqw2gi6wOloexOPWYJouIGN2zEO8BTnUyGHwK3LSRVYsC
	ENTXkRRtUN+3tTD/cfOROcyavxhIB6v6chfJempabOYk18odsHPp5af5IV+BSSFbWMMj6yauvTF
	c=
X-Google-Smtp-Source: AGHT+IHqcSI0CUMytInPxEa6ABfAljdn8YgpsLLIh+B/Wt2/lq7klmwU3ooyxHFpSteq+LenClZrW3oaa5Na2q0nViw=
X-Received: by 2002:a05:6808:1304:b0:40b:9527:916d with SMTP id
 5614622812f47-4113cfe06b0mr2400684b6e.1.1751984353669; Tue, 08 Jul 2025
 07:19:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250707151122.292272-1-frediano.ziglio@cloud.com>
 <ab5d830a-8b59-46d6-9e97-12b351bcf221@suse.com> <CACHz=ZiiO4KwSPitaE261oBucAuZkHr3ugp+mCYhCnSbN8FyAw@mail.gmail.com>
 <c31947e7-f786-4213-9d91-28e1fa8908c1@suse.com> <CACHz=Zi9CAmdq6CmEF_CCEL9=w1ZLpCp7meA4rwhmQzYz_Et4Q@mail.gmail.com>
 <f959300e-e625-4ad5-bc48-f33ae0cd31e1@suse.com>
In-Reply-To: <f959300e-e625-4ad5-bc48-f33ae0cd31e1@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Tue, 8 Jul 2025 15:19:01 +0100
X-Gm-Features: Ac12FXwfjkJoJ3hxSkoQ3M8kYFts4KiD21ouZdsYchgX_vLU-751F_c7PDVnW30
Message-ID: <CACHz=ZgdEtwBmsVri7VzOTcR2YBNoq6aE=ebk1cFmvcFHq=Oig@mail.gmail.com>
Subject: Re: [PATCH] xen/efi: Fix crash with initial empty EFI options
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 8, 2025 at 9:26=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 08.07.2025 08:03, Frediano Ziglio wrote:
> > On Mon, Jul 7, 2025 at 5:04=E2=80=AFPM Jan Beulich <jbeulich@suse.com> =
wrote:
> >>
> >> On 07.07.2025 17:51, Frediano Ziglio wrote:
> >>> On Mon, Jul 7, 2025 at 4:42=E2=80=AFPM Jan Beulich <jbeulich@suse.com=
> wrote:
> >>>>
> >>>> On 07.07.2025 17:11, Frediano Ziglio wrote:
> >>>>> EFI code path split options from EFI LoadOptions fields in 2
> >>>>> pieces, first EFI options, second Xen options.
> >>>>> "get_argv" function is called first to get the number of arguments
> >>>>> in the LoadOptions, second, after allocating enough space, to
> >>>>> fill some "argc"/"argv" variable. However the first parsing could
> >>>>> be different from second as second is able to detect "--" argument
> >>>>> separator. So it was possible that "argc" was bigger that the "argv=
"
> >>>>> array leading to potential buffer overflows, in particular
> >>>>> a string like "-- a b c" would lead to buffer overflow in "argv"
> >>>>> resulting in crashes.
> >>>>> Using EFI shell is possible to pass any kind of string in
> >>>>> LoadOptions.
> >>>>>
> >>>>> Fixes: 201f261e859e ("EFI: move x86 boot/runtime code to common/efi=
")
> >>>>
> >>>> This only moves the function, but doesn't really introduce any issue=
 afaics.
> >>>>
> >>>
> >>> Okay, I'll follow the rename
> >>>
> >>>>> --- a/xen/common/efi/boot.c
> >>>>> +++ b/xen/common/efi/boot.c
> >>>>> @@ -345,6 +345,7 @@ static unsigned int __init get_argv(unsigned in=
t argc, CHAR16 **argv,
> >>>>>                                      VOID *data, UINTN size, UINTN =
*offset,
> >>>>>                                      CHAR16 **options)
> >>>>>  {
> >>>>> +    CHAR16 **const orig_argv =3D argv;
> >>>>>      CHAR16 *ptr =3D (CHAR16 *)(argv + argc + 1), *prev =3D NULL, *=
cmdline =3D NULL;
> >>>>>      bool prev_sep =3D true;
> >>>>>
> >>>>> @@ -384,7 +385,7 @@ static unsigned int __init get_argv(unsigned in=
t argc, CHAR16 **argv,
> >>>>>                  {
> >>>>>                      cmdline =3D data + *offset;
> >>>>>                      /* Cater for the image name as first component=
. */
> >>>>> -                    ++argc;
> >>>>> +                    ++argv;
> >>>>
> >>>> We're on the argc =3D=3D 0 and argv =3D=3D NULL path here. Increment=
ing NULL is UB,
> >>>> if I'm not mistaken.
> >>>
> >>> Not as far as I know. Why?
> >>
> >> Increment and decrement operators are like additions. For additions th=
e standard
> >> says: "For addition, either both operands shall have arithmetic type, =
or one
> >> operand shall be a pointer to an object type and the other shall have =
integer
> >> type." Neither of the alternatives is true for NULL.
> >>
> >
> > Yes and no. The expression here is not NULL + 1, but (CHAR16**)NULL +
> > 1, hence the pointer has a type and so the expression is valid.
> >
> >>> Some systems even can use NULL pointers as valid, like mmap.
> >>
> >> Right, but that doesn't make the use of NULL C-compliant.
> >>
> >>>>> @@ -402,7 +403,7 @@ static unsigned int __init get_argv(unsigned in=
t argc, CHAR16 **argv,
> >>>>>          {
> >>>>>              if ( cur_sep )
> >>>>>                  ++ptr;
> >>>>> -            else if ( argv )
> >>>>> +            else if ( orig_argv )
> >>>>>              {
> >>>>>                  *ptr =3D *cmdline;
> >>>>>                  *++ptr =3D 0;
> >>>>> @@ -410,8 +411,8 @@ static unsigned int __init get_argv(unsigned in=
t argc, CHAR16 **argv,
> >>>>>          }
> >>>>>          else if ( !cur_sep )
> >>>>>          {
> >>>>> -            if ( !argv )
> >>>>> -                ++argc;
> >>>>> +            if ( !orig_argv )
> >>>>> +                ++argv;
> >>>>>              else if ( prev && wstrcmp(prev, L"--") =3D=3D 0 )
> >>>>>              {
> >>>>>                  --argv;
> >>>>
> >>>> As per this, it looks like that on the 1st pass we may indeed overco=
unt
> >>>> arguments. But ...
> >>>>
> >>>
> >>> I can use again argc if you prefer, not strong about it.
> >>>
> >>>>> @@ -428,9 +429,9 @@ static unsigned int __init get_argv(unsigned in=
t argc, CHAR16 **argv,
> >>>>>          }
> >>>>>          prev_sep =3D cur_sep;
> >>>>>      }
> >>>>> -    if ( argv )
> >>>>> +    if ( orig_argv )
> >>>>>          *argv =3D NULL;
> >>>>> -    return argc;
> >>>>> +    return argv - orig_argv;
> >>>>>  }
> >>>>>
> >>>>>  static EFI_FILE_HANDLE __init get_parent_handle(const EFI_LOADED_I=
MAGE *loaded_image,
> >>>>> @@ -1348,8 +1349,8 @@ void EFIAPI __init noreturn efi_start(EFI_HAN=
DLE ImageHandle,
> >>>>>                                    (argc + 1) * sizeof(*argv) +
> >>>>>                                        loaded_image->LoadOptionsSiz=
e,
> >>>>>                                    (void **)&argv) =3D=3D EFI_SUCCE=
SS )
> >>>>> -            get_argv(argc, argv, loaded_image->LoadOptions,
> >>>>> -                     loaded_image->LoadOptionsSize, &offset, &opti=
ons);
> >>>>> +            argc =3D get_argv(argc, argv, loaded_image->LoadOption=
s,
> >>>>> +                            loaded_image->LoadOptionsSize, &offset=
, &options);
> >>>>
> >>>> ... wouldn't this change alone cure that problem? And even that I do=
n't
> >>>> follow. Below here we have
> >>>>
> >>>>         for ( i =3D 1; i < argc; ++i )
> >>>>         {
> >>>>             CHAR16 *ptr =3D argv[i];
> >>>>
> >>>>             if ( !ptr )
> >>>>                 break;
> >>>>
> >>>> and the 2nd pass of get_argv() properly terminates the (possibly too=
 large)
> >>>> array with a NULL sentinel. So I wonder what it is that I'm overlook=
ing and
> >>>> that is broken.
> >>>
> >>> I realized that because I got a crash, not just by looking at the cod=
e.
> >>>
> >>> The string was something like "-- a b c d":
> >>
> >> That's in the "plain command line" case or the LOAD_OPTIONS one? In th=
e
> >> former case the image name should come first, aiui. And in the latter =
case
> >> the 2nd pass sets argv[0] to NULL very early, increments the pointer, =
and
> >> hence at the bottom of the function argv[1] would also be set to NULL.
> >> Aiui at least, i.e. ...
> >>
> >>> - the first get_argv call produces a 5 argc;
> >>> - you allocate space for 6 pointers and length of the entire string t=
o copy;
> >>> - the parser writes a single pointer in argv and returns still 5 as a=
rgc;
> >>> - returned argc is ignored;
> >>> - code "for (i =3D 1; i < argc; ++i)" starts accessing argv[1] which =
is
> >>> not initialized, in case of garbage you dereference garbage.
> >>
> >> ... I don't see how argv[1] can hold garbage.
> >
> > As I said, this happened as a crash during testing, not looking at the
> > code. It's a plain string in LoadOptions, *offset is set to 0 so
> > there's no initial set of argv[0]. argv[0] is set with the beginning
> > of "--" but then when "--" is detected" argv is moved back to initial
> > value and the terminator is written still in argv[0], so argv[1] is
> > never written.
>
> On the 1st pass, which path does get_argv() take? The one commented "Plai=
n
> command line, as usually passed by the EFI shell", or the EFI_LOAD_OPTION
> one? From your reply above I suspect the former, but then the image name
> is missing from that line. Which would look like a firmware bug then, and
> hence (if so) would also want describing as such (which in particular
> would mean no Fixes: tag).
>

I managed to reproduce this issue using GRUB commands, specifically
chainloader and xen_hypervisor.

> I'm routinely running xen.efi from the EFI shell on at least two systems,
> and I have never had any trouble passing "--" as the first option. Which
> I don't do all the time, but every now and then a need for doing so did
> arise.
>
> Jan

Frediano

