Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39ED88C10BC
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2024 16:00:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719259.1121889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s54J8-0006Pb-HO; Thu, 09 May 2024 13:59:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719259.1121889; Thu, 09 May 2024 13:59:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s54J8-0006Nc-Em; Thu, 09 May 2024 13:59:38 +0000
Received: by outflank-mailman (input) for mailman id 719259;
 Thu, 09 May 2024 13:59:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XcCC=MM=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1s54J6-0006NW-OO
 for xen-devel@lists.xenproject.org; Thu, 09 May 2024 13:59:36 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e1ac562-0e0c-11ef-909c-e314d9c70b13;
 Thu, 09 May 2024 15:59:35 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-51f45104ef0so930027e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 09 May 2024 06:59:35 -0700 (PDT)
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
X-Inumbo-ID: 5e1ac562-0e0c-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1715263175; x=1715867975; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wRI7kDDz7pt7rS72ptF2zkQYN6Tx7uA4BFgiTe1GCsI=;
        b=PQnKJi2dgbDS1bzPzSJVzKySl6ghqaRaGFbuirzSYAtmbxx51d2BL3GdZ9QHKn8by3
         WxF/o0Gwycp3LVjUAT5GL+rL8fDSOMfUa2o0Kx4YU9TG/LZqSShYwXpwAVU5R/mtADWm
         SLwro4SeJC0WiCyiqkmZxMzjh3bH6xAYC9gKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715263175; x=1715867975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wRI7kDDz7pt7rS72ptF2zkQYN6Tx7uA4BFgiTe1GCsI=;
        b=ktvYoQZ+XZazTlco66hI8D8X6JLqtGErwFMmd7vR57yW9wuSmzflftK9qvpB3V+Nc3
         WzYeJ91lP+G61eW1LD64Hq3NAJrvikbhlJvQ1p4XJmHpUMrVMb4XZ29tfqgspEElG3Ne
         HHaiBiSvILSQ71p+McDJlficTS6VUIn7FFnFUf02HnRry22zaqs5gCz5ThPHK1eUW49y
         F6Rd6wX+48evYt+u2fWhyK4YobEuRy2z8PHKLmFe+yWzFrk/6lglFwirG4pKMNBIJJyI
         FbcCjWho5lWMkpMKvnBZfYJDhQd8SEF1GK/qPOK2z7UcY3+4adwpeA//nIkP51zFHSbX
         z0vQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1RmasclNKIpCo5kIM5miAX7LPLIdP+tjJVyHnyg1Au1gZHEqiFrLy5SVhTEkfaojq3KlaHid4s8vmRtYZ1BwGWYs0PYky5hpQDpMU3tY=
X-Gm-Message-State: AOJu0Yxr+v/x+RI0e7RgDkf1QICVfSKI2WMEDEYykIcjRuv43uqPy+8O
	LJN++9lAcf54z0Iayo1xeF0bsre4qMJMXjy3dlQDjBISAdADk+iRJvr3G42PWdOq9UFsCJyAui4
	l7k2mhELQn9AiJNNfyOH1tm4rkprQSpTavgKCkIztoqRePnOV
X-Google-Smtp-Source: AGHT+IHv9Cc+M8D6PNEzgk/W+q+FXbIztSrIoNciqYfzONSRoNGpgChKXhQDUDq4nrHZ/DwVoy2/88seia7tl5z1hS4=
X-Received: by 2002:a19:9102:0:b0:51e:41a1:4d5 with SMTP id
 2adb3069b0e04-5217c277400mr3182992e87.9.1715263174717; Thu, 09 May 2024
 06:59:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240430124709.865183-1-fouad.hilly@cloud.com>
 <20240430124709.865183-4-fouad.hilly@cloud.com> <cc1f42bf-7629-41fa-99b5-f77f15a371be@suse.com>
In-Reply-To: <cc1f42bf-7629-41fa-99b5-f77f15a371be@suse.com>
From: Fouad Hilly <fouad.hilly@cloud.com>
Date: Thu, 9 May 2024 14:59:20 +0100
Message-ID: <CAJKAvHbdcq2yf9Om22HY+CkKvBTrLiApHtEqxzhs5yUZKLAmDw@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] x86: Add usage() to print out usage message
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony@xenproject.org>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 9:20=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 30.04.2024 14:47, Fouad Hilly wrote:
> > Refactor xen-ucode tool by adding usage() to handle usage\help messages=
.
> > As we add more command options this will keep help\usage messages in a =
common block.
> > Only generic error message is printed to stderr. usage and show_curr_cp=
u are printed to stdout.
> >
> > Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>
> > ---
> > [v3]
> > 1- Reverted usage message.
> > 2- Utilized usage().
> >
> > [v2]
> > 1- Improved message description.
> > 2- Fixed formatting and indentation.
> > 3- Error message to print to stderr.
>
> Already on v2 I pointed out that this change wasn't really done. And now,
> in v3, ...
>
In V4 all printing within ext_err path will be printed to stder

> >  tools/misc/xen-ucode.c | 12 +++++++++---
> >  1 file changed, 9 insertions(+), 3 deletions(-)
> >
> > diff --git a/tools/misc/xen-ucode.c b/tools/misc/xen-ucode.c
> > index c6ae6498d659..005bf85b6551 100644
> > --- a/tools/misc/xen-ucode.c
> > +++ b/tools/misc/xen-ucode.c
> > @@ -17,6 +17,13 @@ static xc_interface *xch;
> >  static const char intel_id[] =3D "GenuineIntel";
> >  static const char   amd_id[] =3D "AuthenticAMD";
> >
> > +static void usage(const char *name)
> > +{
> > +    printf("%s: Xen microcode updating tool\n"
> > +           "Usage: %s [<microcode file> | show-cpu-info]\n",
> > +           name, name);
> > +}
>
> ... you're still unconditionally printing to stdout, when ...
>
> >  static void show_curr_cpu(FILE *f)
> >  {
> >      int ret;
> > @@ -89,9 +96,8 @@ int main(int argc, char *argv[])
> >      if ( argc < 2 )
> >      {
> >          fprintf(stderr,
> > -                "xen-ucode: Xen microcode updating tool\n"
> > -                "Usage: %s [<microcode file> | show-cpu-info]\n", argv=
[0]);
> > -        show_curr_cpu(stderr);
> > +                "%s: unable to process command line arguments\n", argv=
[0]);
> > +        usage(argv[0]);
> >          exit(2);
> >      }
>
> ... originally the usage message (correctly) went to stderr in this case.
> It ought to go to stdout only in response to something like a --help
> command line option.
>
> Jan

