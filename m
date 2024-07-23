Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE04939E1B
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 11:41:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762924.1173163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWC1R-0001Ji-OP; Tue, 23 Jul 2024 09:41:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762924.1173163; Tue, 23 Jul 2024 09:41:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWC1R-0001HW-Kw; Tue, 23 Jul 2024 09:41:29 +0000
Received: by outflank-mailman (input) for mailman id 762924;
 Tue, 23 Jul 2024 09:41:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KExd=OX=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1sWC1Q-0001HL-54
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 09:41:28 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id babacb0f-48d7-11ef-8776-851b0ebba9a2;
 Tue, 23 Jul 2024 11:41:26 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-52f04c1e58eso2481646e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 02:41:26 -0700 (PDT)
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
X-Inumbo-ID: babacb0f-48d7-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1721727685; x=1722332485; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+RbUz1cp79D2w+mv3L+vLpiMe4iXJ189CcLC3FayTo=;
        b=XqQKW4/QOpQ+rp8YD4wJyssAJyrBQqz9NaXIzYh3zRn/KHFN+M1U37/P28Fv8FK3Uh
         GV7doHGipZexE7vW5R4bM61SFzxjWgwEE29ulfPhusXk9Bcv1x7ijyJW1AmcPc/q92Oz
         RGVXluJbhQhclYhV2D5d+tmbFPDz4Ldg7jTNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721727685; x=1722332485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+RbUz1cp79D2w+mv3L+vLpiMe4iXJ189CcLC3FayTo=;
        b=pOVpbI6xQrUfB+8aZUcgPeP1gtASiESuNELmNb/PD4LsQ5hy293IFFUOKJ0pNhG1yY
         erdDecPgrj0eVBTqJI5ohJ8BPN7dXDkEPiM7Kutogc9AKYsjq1A28Mi1TOjwg0FiLftd
         J/nboK4MJp+Bxi64jxIVENT4+BnFaIE/MsN7ckYhBkIEOR49SC2CroZAbKtsHptwOB0I
         arE5AAZpXsSnetWmrLW0sJJ/iPSlf1XW6lnu1LERmOoQl1zxqA2gZo0UG1jQ5H9UmhqM
         Dco4I2vNRCQ5KC4/rjoarqz8HMso2mX+Dl2Jj+tCzHjPIX9K9lFboB1XvYcTtivJVyar
         d9PA==
X-Forwarded-Encrypted: i=1; AJvYcCVkYFV8MoMk9DSLP4tZo9p25x6GgZeVfkaK0lum5TgJ0GL9TzfLYvDmt2177cBztry2oHmKXdqjXnu4WIhAEBqt4nyhi/JldsDsEsqkhQ4=
X-Gm-Message-State: AOJu0Yz7K8LZmulQDxTTm951fXR92e6W4AqJlgwNnbYZjgGZA5aQLjby
	wQsJc7WwPGYy0g8HKnHpZYutU5IRv3QCb3pI73d4ZRGUtEtakxo4rHHnd/bPKIoaR1wA9ONAFjP
	nNK+3ATZLPmCeCsm2pTM/JUgQjCx44YLYlQqZ6ebmw9CxiMmv
X-Google-Smtp-Source: AGHT+IHCJhHyzPNXedsV1aqX52+AwA8rmGefTweOo0tLacrHyGRgUK1c2PqX5b0CflfXjRgQGmIV14QVoFitcuGCwiQ=
X-Received: by 2002:a05:6512:3ba6:b0:52e:9f1b:517 with SMTP id
 2adb3069b0e04-52efb63ea6fmr8471514e87.25.1721727685160; Tue, 23 Jul 2024
 02:41:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240712130749.1272741-1-fouad.hilly@cloud.com>
 <20240712130749.1272741-3-fouad.hilly@cloud.com> <35f9319b-801c-45e9-91c1-46ca61d49e5a@suse.com>
In-Reply-To: <35f9319b-801c-45e9-91c1-46ca61d49e5a@suse.com>
From: Fouad Hilly <fouad.hilly@cloud.com>
Date: Tue, 23 Jul 2024 10:41:14 +0100
Message-ID: <CAJKAvHYPmYmg1XWdLQBd4ZnU=L+Kip7ypnFyLppuwH-prA3PqA@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] x86/ucode: refactor xen-ucode to utilize getopt
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 16, 2024 at 3:51=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 12.07.2024 15:07, Fouad Hilly wrote:
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
> > @@ -71,12 +72,29 @@ static void show_curr_cpu(FILE *f)
> >      }
> >  }
> >
> > +static void usage(FILE *stream, const char *name)
> > +{
> > +    fprintf(stream,
> > +            "%s: Xen microcode updating tool\n"
> > +            "options:\n"
> > +            "  -h, --help            display this help\n"
> > +            "  -s, --show-cpu-info   show CPU information\n"
> > +            "Usage: %s [microcode file] [options]\n", name, name);
>
> Isn't it more like [microcode file | options] at this point? Even when
> --force support is added, neither of the two options here go together
> with a microcode file.

Yes, I will fix it in v6
>
> > @@ -86,22 +104,34 @@ int main(int argc, char *argv[])
> >          exit(1);
> >      }
> >
> > -    if ( argc < 2 )
> > +    while ( (opt =3D getopt_long(argc, argv, "hs", options, NULL)) !=
=3D -1 )
> >      {
> > -        fprintf(stderr,
> > -                "xen-ucode: Xen microcode updating tool\n"
> > -                "Usage: %s [<microcode file> | show-cpu-info]\n", argv=
[0]);
> > -        show_curr_cpu(stderr);
> > -        exit(2);
> > +        switch (opt)
>
> Nit (style): Missing blanks inside the parentheses.
Will be fixed in v6
>
> Jan

Thanks,

Fouad

