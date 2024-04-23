Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A818AEA8C
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 17:16:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710820.1110361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHse-0004en-U6; Tue, 23 Apr 2024 15:16:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710820.1110361; Tue, 23 Apr 2024 15:16:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHse-0004cF-R7; Tue, 23 Apr 2024 15:16:24 +0000
Received: by outflank-mailman (input) for mailman id 710820;
 Tue, 23 Apr 2024 15:16:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nbx+=L4=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1rzHsd-0004Lz-Kr
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 15:16:23 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 713fea67-0184-11ef-b4bb-af5377834399;
 Tue, 23 Apr 2024 17:16:22 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2db17e8767cso75146091fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 08:16:22 -0700 (PDT)
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
X-Inumbo-ID: 713fea67-0184-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1713885381; x=1714490181; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4r3qALaMskxAH0Fh0f7vpq9xg93FkgvTANUeojL8HE=;
        b=HN4uGpvJb3k6HvMRVbajrcub4e0b4Q0UJIyhdEgcH4BhR3k/4DAqx3KSYDrnBSGm/M
         TUiHO983LiQZzogGXOzVt0fe7sC28Tr9zo40TXz5Bs1Url+B8GUKKCasE2aWDDI7Dl+1
         KXEvQRq2aQaIWZyfKAKvTfitv7Xw+WywBe/f4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713885381; x=1714490181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M4r3qALaMskxAH0Fh0f7vpq9xg93FkgvTANUeojL8HE=;
        b=ECe0ulRdLBLcM3F2Zx73e7E/bi5Ufa7BatYJTc7/7/aBMgGN4UlG6MTrE9N+2HYDD4
         WY3TSwa8vc+Vktbs+hAc5mlgzQ59ruK6rxLVme17T+7hWEVowyrkSJQQnHX+sYwXnosB
         gSe6+OmGrhjUZ/Hj/XGBBuW3rMrJxN9EWvZV/hGjxdJ6jgIs8jE/8Pc10jti1jKHCh82
         rzUaCFX3it3eukr8Hl+ffBiAvp+Rph/ZPPpzW/ZmyrMmh4PZyaBUSuqlpOtbKo6boXFM
         9gf3VakLSl2vD5Y5KF9IS7k5QSGfFR7fP08J0CfYu6EdLqFsRSuFm3mgyQsj2SQUDx21
         HgxQ==
X-Gm-Message-State: AOJu0YxkDLhMIdhIMXr41xx2w3HMLp9KSd0Au2KQsnXE4zZVFBLtZBDl
	qhnXZdTB5AshUisaufpZvvfiw15J9vECi+WYIo6n4HPbZgbnw9CVws2wLwwE1CcNF/BvQHCvMwQ
	t0TcktCoV7RpgcmrKqIEkD8MojDiJ7qLyMk6dYw==
X-Google-Smtp-Source: AGHT+IFP3gNxugGAAFUZqI9idGxSuyDhIiXWubQ0R2hQT5IbI0H+5J/dOptgcQFdaRnSnyxq32KWwvdXxNENyUpYdcM=
X-Received: by 2002:a2e:8602:0:b0:2db:a393:27c9 with SMTP id
 a2-20020a2e8602000000b002dba39327c9mr8060463lji.5.1713885381205; Tue, 23 Apr
 2024 08:16:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240416091546.11622-1-fouad.hilly@cloud.com> <20240416091546.11622-5-fouad.hilly@cloud.com>
 <5ece784e-cc8c-4cbb-9ea3-a55f29fab1ac@perard>
In-Reply-To: <5ece784e-cc8c-4cbb-9ea3-a55f29fab1ac@perard>
From: Fouad Hilly <fouad.hilly@cloud.com>
Date: Tue, 23 Apr 2024 16:16:10 +0100
Message-ID: <CAJKAvHZ-6DsY5wTdFzB6tm5RNKY4EnmY-Stjsi2aRmMT9TZCnw@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] x86: Use getopt to handle command line args
To: Anthony PERARD <anthony.perard@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 22, 2024 at 6:48=E2=80=AFPM Anthony PERARD <anthony.perard@clou=
d.com> wrote:
>
> On Tue, Apr 16, 2024 at 10:15:45AM +0100, Fouad Hilly wrote:
> > diff --git a/tools/misc/xen-ucode.c b/tools/misc/xen-ucode.c
> > index 0c0b2337b4ea..e3c1943e3633 100644
> > --- a/tools/misc/xen-ucode.c
> > +++ b/tools/misc/xen-ucode.c
> > @@ -11,6 +11,7 @@
> >  #include <sys/stat.h>
> >  #include <fcntl.h>
> >  #include <xenctrl.h>
> > +#include <getopt.h>
> >
> >  static xc_interface *xch;
> >
> > @@ -22,7 +23,8 @@ static void usage(const char *name)
> >      printf("%s: Xen microcode updating tool\n"
> >             "Usage: %s [microcode file] [options]\n"
> >             "Options:\n"
> > -           "show-cou-info   show CPU information and exit\n",
> > +           "  -h, --help            display this help and exit\n"
> > +           "  -s, --show-cpu-info   show CPU information and exit\n",
> >             name, name);
> >  }
> >
> > @@ -86,6 +88,13 @@ int main(int argc, char *argv[])
> >      char *filename, *buf;
> >      size_t len;
> >      struct stat st;
> > +    int opt;
> > +
> > +    static const struct option options[] =3D {
> > +        {"help", no_argument, NULL, 'h'},
> > +        {"show-cpu-info", no_argument, NULL, 's'},
> > +        {NULL, no_argument, NULL, 0}
> > +    };
> >
> >      xch =3D xc_interface_open(NULL, NULL, 0);
> >      if ( xch =3D=3D NULL )
> > @@ -95,19 +104,22 @@ int main(int argc, char *argv[])
> >          exit(1);
> >      }
> >
> > -    if ( argc < 2 )
> > -    {
> > -        fprintf(stderr,
> > -                "xen-ucode: Xen microcode updating tool\n"
> > -                "Usage: %s [<microcode file> | show-cpu-info]\n", argv=
[0]);
> > -        show_curr_cpu(stderr);
> > -        exit(2);
> > -    }
> > +    if ( argc !=3D 2 )
> > +        goto ext_err;
>
> Why only two arguments allowed? And why check `argc` before calling
> getopt_long() ?
At this stage of the patch series, xen-ucode expects either firmware
file or a single argument, that is why argc should be 2.
If there is no argument or many arguments that are not supposed to be,
we exit with error other than try to parse the arguments.
>
>
> >
> > -    if ( !strcmp(argv[1], "show-cpu-info") )
> > +    while ( (opt =3D getopt_long(argc, argv, "hs", options, NULL)) !=
=3D -1 )
> >      {
> > -        show_curr_cpu(stdout);
> > -        return 0;
> > +        switch (opt)
> > +        {
> > +        case 'h':
> > +            usage(argv[0]);
> > +            exit(EXIT_SUCCESS);
> > +        case 's':
> > +            show_curr_cpu(stdout);
> > +            exit(EXIT_SUCCESS);
> > +        default:
> > +            goto ext_err;
> > +        }
> >      }
> >
> >      filename =3D argv[1];
>
> So, after calling getopt_long(), the variable `optind` point to the next
> argument that getopt_long() didn't recognize as an argument. It would be
> a good time to start using it, and check that the are actually argument
> left on the command line, even if in the current patch the only possible
> outcome is that argv[1] has something that isn't an option.
>
> > @@ -152,4 +164,11 @@ int main(int argc, char *argv[])
> >      close(fd);
> >
> >      return 0;
> > +
> > + ext_err:
> > +    fprintf(stderr,
> > +            "xen-ucode: Xen microcode updating tool\n"
> > +            "Usage: %s [microcode file] [options]\n", argv[0]);
>
> Isn't there a usage() function that we could use?
As there is an error, stderr should be used, which was a comment on V1.
>
> > +    show_curr_cpu(stderr);
>
> Why call show_curr_cpu() on the error path?
Informative, but could be removed.
>
> > +    exit(STDERR_FILENO);
>
> Still not an exit value.
>
> Thanks,
>
> --
> Anthony PERARD

Thanks,

Fouad

