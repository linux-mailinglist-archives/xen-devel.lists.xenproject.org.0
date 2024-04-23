Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C49428AEAFF
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 17:27:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710850.1110382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzI32-00082Q-6n; Tue, 23 Apr 2024 15:27:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710850.1110382; Tue, 23 Apr 2024 15:27:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzI32-000802-32; Tue, 23 Apr 2024 15:27:08 +0000
Received: by outflank-mailman (input) for mailman id 710850;
 Tue, 23 Apr 2024 15:27:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nbx+=L4=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1rzI30-0007z7-Fx
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 15:27:06 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0d6dbe8-0185-11ef-909a-e314d9c70b13;
 Tue, 23 Apr 2024 17:27:05 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-51abf1a9332so5876499e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 08:27:05 -0700 (PDT)
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
X-Inumbo-ID: f0d6dbe8-0185-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1713886025; x=1714490825; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jpuooxiBlG/DKMsJk0OC9BrJ6yuIBHemfO+qLnUxWRc=;
        b=JpixuuIqIUvsdlwJ8DkC0RNILb8l47QnADpdVpmBoai8YN2Vu5GcROt70Bouw5xT6V
         VfjhwSqnvapm/vJNg7ZQTXsiLlYGrv2TSURM7kkOCy9eEH7HcIr8C/Qw6dnEK4c5X7NY
         /6hQdj6VVfUGt+LQXyrKHX+HtsYRT+vakiriU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713886025; x=1714490825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jpuooxiBlG/DKMsJk0OC9BrJ6yuIBHemfO+qLnUxWRc=;
        b=qef7NiXM+tf94z8pFbELeGXE9NwFkfjfeXss55Z2ierGsypwgdez/Sw/ZM5cJ6EzR0
         dPax4tWyYiXUaXBFxQoN3O90li+UAhQ3FDIdDTlNS5prSXMcPcm8wAvMOXsaWo2AyXNA
         yfJ4YnFOY4zscqeyZHQvruu8SYfFA3FuDaY/ifQlP+Fc5YWwhwqK6lFkkheqZc9Ws3v0
         VvB9js2nIlwZG8aJ945wEODYQAHxvwb0NYBSuArfjoc9GC2KJit8C/16jr7ZLfYvqrEa
         TDrSI95gJZIZv7a7C583InRKzEOtcE24wrGi2NbmiTdmtOSE9fdOYcffp752Y+NCx1c7
         qSFQ==
X-Gm-Message-State: AOJu0Ywfp5BXdihIOIcdGOWfUmNbd5BjwvT5AI3beuTQray7mmByY57S
	IuQAdmiZwg4JYXbPfJ4Q7Jsm/y5mqHJrNZfxbvnw1NLZbIzzcugtd7/33TLApy1vErreHtU9fMj
	+g8rWU4XdZjOuvMXbXMYULEN0ohqhZhLLmTXBxQ==
X-Google-Smtp-Source: AGHT+IHWnSVX6rP6NpQTeFHX2yF/1yEZw1RBmVT14ppdFrwLrFpiwtgWXTZdgDKLXkcxaY7svL5ufkvvYseAdeGbKrw=
X-Received: by 2002:ac2:5b1a:0:b0:51b:50ed:d563 with SMTP id
 v26-20020ac25b1a000000b0051b50edd563mr3673861lfn.28.1713886024916; Tue, 23
 Apr 2024 08:27:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240416091546.11622-1-fouad.hilly@cloud.com> <20240416091546.11622-6-fouad.hilly@cloud.com>
 <35e382d7-0f65-4dbe-bc80-ddbf9d649e24@perard>
In-Reply-To: <35e382d7-0f65-4dbe-bc80-ddbf9d649e24@perard>
From: Fouad Hilly <fouad.hilly@cloud.com>
Date: Tue, 23 Apr 2024 16:26:53 +0100
Message-ID: <CAJKAvHZ0abytPgKxVMhVRhTyoV0LMTE46+W+ox0MaFagRXbMGw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] x86: Add --force option to xen-ucode to override
 microcode version check
To: Anthony PERARD <anthony.perard@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 22, 2024 at 6:57=E2=80=AFPM Anthony PERARD <anthony.perard@clou=
d.com> wrote:
>
> On Tue, Apr 16, 2024 at 10:15:46AM +0100, Fouad Hilly wrote:
> > Introduce --force option to xen-ucode to force skipping microcode versi=
on
> > check, which allows the user to update x86 microcode even if both versi=
ons
> > are the same.
> >
> > [v2]
> > 1- Changed data type from uint32_t to unsigned int.
> > 2- Corrected line length.
> > 3- Removed XENPF_UCODE_FLAG_FORCE_NOT_SET.
> > 4- Corrected indentations.
> > 5- Changed command line options to have the file name as first argument=
 when applicable.
> > 6- --force option doesn't require an argument anymore.
> > 7- Used optint to access filename in argv.
> >
> > Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>
> > ---
> >
> > Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
> You might want to move that tag before the '---' separation otherwise it
> wont be part of the commit message. `git am` discard every thing after
> the '---' line. Also add the tag before your SOB.
Noted.
>
> > ---
> >  tools/include/xenctrl.h   |  3 ++-
> >  tools/libs/ctrl/xc_misc.c | 13 +++++++++++--
> >  tools/misc/xen-ucode.c    | 18 +++++++++++++-----
> >  3 files changed, 26 insertions(+), 8 deletions(-)
> >
> > diff --git a/tools/misc/xen-ucode.c b/tools/misc/xen-ucode.c
> > index e3c1943e3633..4178fd2221ea 100644
> > --- a/tools/misc/xen-ucode.c
> > +++ b/tools/misc/xen-ucode.c
> > @@ -24,7 +26,8 @@ static void usage(const char *name)
> >             "Usage: %s [microcode file] [options]\n"
>
> Now, that usage line is wrong. The options needs to go before the file.
I am not sure what you mean "wrong"? from parsing perspective, both
scenarios can be successfully executed:
xen-ucode firmware-file --force
xen-ucode --force firmware-file
it becomes wrong if there is an argument expects the file as an input.
> That could be fix on the previous patch. With that usage line, we would
> want to run `./xen-ucode ucode.bin --force`, but I don't think that
> would work.
>
> >             "Options:\n"
> >             "  -h, --help            display this help and exit\n"
> > -           "  -s, --show-cpu-info   show CPU information and exit\n",
> > +           "  -s, --show-cpu-info   show CPU information and exit\n"
> > +           "  -f, --force           force to skip micorocde version ch=
eck\n",
> >             name, name);
> >  }
> >
>
> Thanks,
>
> --
> Anthony PERARD

Thanks,

Fouad

