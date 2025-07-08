Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 655CDAFC262
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 08:04:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035962.1408405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ1Qh-0006wZ-Oq; Tue, 08 Jul 2025 06:03:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035962.1408405; Tue, 08 Jul 2025 06:03:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ1Qh-0006tk-L0; Tue, 08 Jul 2025 06:03:47 +0000
Received: by outflank-mailman (input) for mailman id 1035962;
 Tue, 08 Jul 2025 06:03:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tCx0=ZV=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uZ1Qg-0006te-6c
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 06:03:46 +0000
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [2607:f8b0:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4dff6c84-5bc1-11f0-a316-13f23c93f187;
 Tue, 08 Jul 2025 08:03:45 +0200 (CEST)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-407a6c6a6d4so1074303b6e.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Jul 2025 23:03:45 -0700 (PDT)
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
X-Inumbo-ID: 4dff6c84-5bc1-11f0-a316-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1751954624; x=1752559424; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BB6NJolUiJaKcosB5GHcqpC5S+C+LTZXe5QOn8d2d3k=;
        b=XkPZNW2DEaja0SwdtpJ/Mh8CIsY07H8lofyO3SLLQAkTtxN/qroizlRbCgNPrNqmg5
         jsfYQThvFg5SXFk80twd566aRnuvdXim9JPfXwMraydC3YwHxRvBk7qYZYwnj7rxevll
         eJdewF5USFGDiS4DOJTXMqmuX5XPYOoo+/gOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751954624; x=1752559424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BB6NJolUiJaKcosB5GHcqpC5S+C+LTZXe5QOn8d2d3k=;
        b=guk8QfgOMvaaqZE8PaIDlh/gK1bMKYEsXNQvXsLKp4XbGBWNqq+x30Ly352efDKzcc
         72t4d7frMCzhfVr2nxc4h6skojZ0tdfY3acdCcQx96RhcONLnxqsDogjlI2vZRzhPjjf
         RkOTu/jXCEPUViWE8lZ++bQTnYMVvWS6KwIbHjzMQGxldyX0X76odRx5oe+fVatSlGre
         suV4LBMi4hhSHYaO/OgPYds0Znrbtc5dTveYCkvJHekqwkMvcDtWRLBVV3i6X/bQIbXI
         xN/Pvw6pWtmXjuDhPRIOh7KgwOPFJgpva5UnxYqTHVP4zAiUZitAyhwJ9Wy8YXbC3UFb
         xZOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWsJO7vTtwq7hXPYKpBARY0tyzV4bg0ygycxtBHwTsUT8iezZ0QXAkGQQI9frAwES60SDI96IgWGM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyzbUI0KvxFcacLKFr+MlFO9w4WhbLv3ESfSKQ00TkqfOmmgw13
	2Eh2QjVxExGr5aYrCZ+OFXTJxkfAvdeLCw+CdbSyBw8smwqrLBVMs4p3DDJgPKG/EjjO7XVvFcs
	eAORg3PKXDQWTSTMTfDr+IwJkRlhPRNxJ6nrIcwt+uA==
X-Gm-Gg: ASbGnctSTVGAgBc3NMRRsX8mDTnD+Y0lNf0jGcsW/52e4kOQV36NjhRVPGIUyZt13VY
	cLPxiLqoiyqjTIW43ouFSXC+OqroCYQXPA0ifyyERzjBJwG8GQzB/v0KcCfCYSGSaflk3JcDq0k
	lvP1MZeuXfSAmD6PWQQRFsFJjn0dn8Ehsb7tCcmPSxmA==
X-Google-Smtp-Source: AGHT+IHfys+fWE/HOE/nlkW3O4y3gCBjmC/nsl7o0Yvj2jUJQ0L4msNeAn/AVO0dDG4pvmEOfHqpgMI8wO7YAdTmsHU=
X-Received: by 2002:a05:6808:1a08:b0:406:6e86:683e with SMTP id
 5614622812f47-4113d4e4835mr1150917b6e.14.1751954623718; Mon, 07 Jul 2025
 23:03:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250707151122.292272-1-frediano.ziglio@cloud.com>
 <ab5d830a-8b59-46d6-9e97-12b351bcf221@suse.com> <CACHz=ZiiO4KwSPitaE261oBucAuZkHr3ugp+mCYhCnSbN8FyAw@mail.gmail.com>
 <c31947e7-f786-4213-9d91-28e1fa8908c1@suse.com>
In-Reply-To: <c31947e7-f786-4213-9d91-28e1fa8908c1@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Tue, 8 Jul 2025 07:03:33 +0100
X-Gm-Features: Ac12FXxIPmsFwaPMQx6RTTj23veQHdNKmUayK-_Yi3NYDVEiCOfZ9nEKql8tfos
Message-ID: <CACHz=Zi9CAmdq6CmEF_CCEL9=w1ZLpCp7meA4rwhmQzYz_Et4Q@mail.gmail.com>
Subject: Re: [PATCH] xen/efi: Fix crash with initial empty EFI options
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 7, 2025 at 5:04=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 07.07.2025 17:51, Frediano Ziglio wrote:
> > On Mon, Jul 7, 2025 at 4:42=E2=80=AFPM Jan Beulich <jbeulich@suse.com> =
wrote:
> >>
> >> On 07.07.2025 17:11, Frediano Ziglio wrote:
> >>> EFI code path split options from EFI LoadOptions fields in 2
> >>> pieces, first EFI options, second Xen options.
> >>> "get_argv" function is called first to get the number of arguments
> >>> in the LoadOptions, second, after allocating enough space, to
> >>> fill some "argc"/"argv" variable. However the first parsing could
> >>> be different from second as second is able to detect "--" argument
> >>> separator. So it was possible that "argc" was bigger that the "argv"
> >>> array leading to potential buffer overflows, in particular
> >>> a string like "-- a b c" would lead to buffer overflow in "argv"
> >>> resulting in crashes.
> >>> Using EFI shell is possible to pass any kind of string in
> >>> LoadOptions.
> >>>
> >>> Fixes: 201f261e859e ("EFI: move x86 boot/runtime code to common/efi")
> >>
> >> This only moves the function, but doesn't really introduce any issue a=
faics.
> >>
> >
> > Okay, I'll follow the rename
> >
> >>> --- a/xen/common/efi/boot.c
> >>> +++ b/xen/common/efi/boot.c
> >>> @@ -345,6 +345,7 @@ static unsigned int __init get_argv(unsigned int =
argc, CHAR16 **argv,
> >>>                                      VOID *data, UINTN size, UINTN *o=
ffset,
> >>>                                      CHAR16 **options)
> >>>  {
> >>> +    CHAR16 **const orig_argv =3D argv;
> >>>      CHAR16 *ptr =3D (CHAR16 *)(argv + argc + 1), *prev =3D NULL, *cm=
dline =3D NULL;
> >>>      bool prev_sep =3D true;
> >>>
> >>> @@ -384,7 +385,7 @@ static unsigned int __init get_argv(unsigned int =
argc, CHAR16 **argv,
> >>>                  {
> >>>                      cmdline =3D data + *offset;
> >>>                      /* Cater for the image name as first component. =
*/
> >>> -                    ++argc;
> >>> +                    ++argv;
> >>
> >> We're on the argc =3D=3D 0 and argv =3D=3D NULL path here. Incrementin=
g NULL is UB,
> >> if I'm not mistaken.
> >
> > Not as far as I know. Why?
>
> Increment and decrement operators are like additions. For additions the s=
tandard
> says: "For addition, either both operands shall have arithmetic type, or =
one
> operand shall be a pointer to an object type and the other shall have int=
eger
> type." Neither of the alternatives is true for NULL.
>

Yes and no. The expression here is not NULL + 1, but (CHAR16**)NULL +
1, hence the pointer has a type and so the expression is valid.

> > Some systems even can use NULL pointers as valid, like mmap.
>
> Right, but that doesn't make the use of NULL C-compliant.
>
> >>> @@ -402,7 +403,7 @@ static unsigned int __init get_argv(unsigned int =
argc, CHAR16 **argv,
> >>>          {
> >>>              if ( cur_sep )
> >>>                  ++ptr;
> >>> -            else if ( argv )
> >>> +            else if ( orig_argv )
> >>>              {
> >>>                  *ptr =3D *cmdline;
> >>>                  *++ptr =3D 0;
> >>> @@ -410,8 +411,8 @@ static unsigned int __init get_argv(unsigned int =
argc, CHAR16 **argv,
> >>>          }
> >>>          else if ( !cur_sep )
> >>>          {
> >>> -            if ( !argv )
> >>> -                ++argc;
> >>> +            if ( !orig_argv )
> >>> +                ++argv;
> >>>              else if ( prev && wstrcmp(prev, L"--") =3D=3D 0 )
> >>>              {
> >>>                  --argv;
> >>
> >> As per this, it looks like that on the 1st pass we may indeed overcoun=
t
> >> arguments. But ...
> >>
> >
> > I can use again argc if you prefer, not strong about it.
> >
> >>> @@ -428,9 +429,9 @@ static unsigned int __init get_argv(unsigned int =
argc, CHAR16 **argv,
> >>>          }
> >>>          prev_sep =3D cur_sep;
> >>>      }
> >>> -    if ( argv )
> >>> +    if ( orig_argv )
> >>>          *argv =3D NULL;
> >>> -    return argc;
> >>> +    return argv - orig_argv;
> >>>  }
> >>>
> >>>  static EFI_FILE_HANDLE __init get_parent_handle(const EFI_LOADED_IMA=
GE *loaded_image,
> >>> @@ -1348,8 +1349,8 @@ void EFIAPI __init noreturn efi_start(EFI_HANDL=
E ImageHandle,
> >>>                                    (argc + 1) * sizeof(*argv) +
> >>>                                        loaded_image->LoadOptionsSize,
> >>>                                    (void **)&argv) =3D=3D EFI_SUCCESS=
 )
> >>> -            get_argv(argc, argv, loaded_image->LoadOptions,
> >>> -                     loaded_image->LoadOptionsSize, &offset, &option=
s);
> >>> +            argc =3D get_argv(argc, argv, loaded_image->LoadOptions,
> >>> +                            loaded_image->LoadOptionsSize, &offset, =
&options);
> >>
> >> ... wouldn't this change alone cure that problem? And even that I don'=
t
> >> follow. Below here we have
> >>
> >>         for ( i =3D 1; i < argc; ++i )
> >>         {
> >>             CHAR16 *ptr =3D argv[i];
> >>
> >>             if ( !ptr )
> >>                 break;
> >>
> >> and the 2nd pass of get_argv() properly terminates the (possibly too l=
arge)
> >> array with a NULL sentinel. So I wonder what it is that I'm overlookin=
g and
> >> that is broken.
> >
> > I realized that because I got a crash, not just by looking at the code.
> >
> > The string was something like "-- a b c d":
>
> That's in the "plain command line" case or the LOAD_OPTIONS one? In the
> former case the image name should come first, aiui. And in the latter cas=
e
> the 2nd pass sets argv[0] to NULL very early, increments the pointer, and
> hence at the bottom of the function argv[1] would also be set to NULL.
> Aiui at least, i.e. ...
>
> > - the first get_argv call produces a 5 argc;
> > - you allocate space for 6 pointers and length of the entire string to =
copy;
> > - the parser writes a single pointer in argv and returns still 5 as arg=
c;
> > - returned argc is ignored;
> > - code "for (i =3D 1; i < argc; ++i)" starts accessing argv[1] which is
> > not initialized, in case of garbage you dereference garbage.
>
> ... I don't see how argv[1] can hold garbage.
>

As I said, this happened as a crash during testing, not looking at the
code. It's a plain string in LoadOptions, *offset is set to 0 so
there's no initial set of argv[0]. argv[0] is set with the beginning
of "--" but then when "--" is detected" argv is moved back to initial
value and the terminator is written still in argv[0], so argv[1] is
never written.

> Jan

Frediano

