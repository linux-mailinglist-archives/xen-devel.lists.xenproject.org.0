Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 397D695661D
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2024 10:57:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.779399.1189129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sfyBr-0005pP-Nc; Mon, 19 Aug 2024 08:56:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 779399.1189129; Mon, 19 Aug 2024 08:56:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sfyBr-0005mq-KR; Mon, 19 Aug 2024 08:56:39 +0000
Received: by outflank-mailman (input) for mailman id 779399;
 Mon, 19 Aug 2024 08:56:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mhAH=PS=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1sfyBq-0005fE-BV
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2024 08:56:38 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f19d6a77-5e08-11ef-a506-bb4a2ccca743;
 Mon, 19 Aug 2024 10:56:37 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-52f01b8738dso3271222e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2024 01:56:37 -0700 (PDT)
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
X-Inumbo-ID: f19d6a77-5e08-11ef-a506-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724057797; x=1724662597; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w30or32qPiF9VehZnxi9A0McTv8fX6oUg17NoQL8QW8=;
        b=ILJx5JCxZxjy39YXkwqW2f6la7Tj8j8lb7tWR/k2XRLyYkd4xK3dTAxdHWGmDDBvCA
         bAsMxtCfxtMmYsdFAVBomk1QMUldSHPRb7XgzHA5Kxop2wXrMlNUL+9sS1epFsIA5/P/
         kcMx0Vuy8DE+JAmJ6YFMMzh/MHfHKqnEo2nBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724057797; x=1724662597;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w30or32qPiF9VehZnxi9A0McTv8fX6oUg17NoQL8QW8=;
        b=Ag2Z6693p2dubc8pDIsPObzcsXv1+o1vJ2jDjfFJ7rneQZKmaw/K7WFEIU7fnbVqwr
         vZQMD4skoqTYFF2RomixWhu8gaECTzGg7aU/OaMqevJYf4ZMAh3RsSDMyEK1HK/IvwTv
         uGs09bzI3usPEZgp9aGGVUX8HZUKutSb629rHhKRdnHk8qSOnNRAuQblvpoUwJpqq+Z/
         fY5o3dmqzypdnSIsOzi28+neZyFWccxS+Midbx+FOpOHC6dVUMK7f+QYbyaGyjvEkno2
         w8dnaS5FMofJyj4XLd66tsiVkMfTdQRnM2Ckm2KUSdi05pZNVvXF3gI1HVecBHXTCoCk
         Qn/w==
X-Gm-Message-State: AOJu0YwV9tfTs6N7KFlyGChxi4xUZl87p068tho1Y4JcfSB+/+sIcY3Y
	78Nu54IkatXM++uKOR89sYM+MGtHb0atEr6tVRyr94wYRrAeDC5iQL6GDWVGTWnEKsMw27t/V5e
	bdCFUjrYOu0hfe/lo598CC+Yzx+2UI1/4fRuumQ==
X-Google-Smtp-Source: AGHT+IHfVgPO9cVZfYmekq2Lr1wxkHaU/VKK8RuubjlPmPrajFBFD/c6ro8vLRq5jPX2AKy7Eyh9NgkQ1L56F5irw7E=
X-Received: by 2002:a05:6512:1244:b0:52c:9725:b32b with SMTP id
 2adb3069b0e04-5331c6a219emr5762581e87.17.1724057796352; Mon, 19 Aug 2024
 01:56:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240712130749.1272741-1-fouad.hilly@cloud.com>
 <20240712130749.1272741-3-fouad.hilly@cloud.com> <ZqEyGD4wgL/z9nn5@l14>
In-Reply-To: <ZqEyGD4wgL/z9nn5@l14>
From: Fouad Hilly <fouad.hilly@cloud.com>
Date: Mon, 19 Aug 2024 09:56:25 +0100
Message-ID: <CAJKAvHY_mJnx0SsOpALtCNXMXppt=UrKMwiDSHzVjLzawq5rSQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] x86/ucode: refactor xen-ucode to utilize getopt
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000863d330620057c12"

--000000000000863d330620057c12
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 24, 2024 at 5:55=E2=80=AFPM Anthony PERARD <anthony.perard@vate=
s.tech>
wrote:

> On Fri, Jul 12, 2024 at 02:07:47PM +0100, Fouad Hilly wrote:
> > diff --git a/tools/misc/xen-ucode.c b/tools/misc/xen-ucode.c
> > index 390969db3d1c..8de82e5b8a10 100644
> > --- a/tools/misc/xen-ucode.c
> > +++ b/tools/misc/xen-ucode.c
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
> FYI, I disagree with Andy about the order of this message. First is
> "Usage:" which explain where the option (dash-prefixed) can go, and
> which are the mandatory arguments, sometime having all the single-letter
> option in this line as well. Then there's an explanation of what the
> options are. I've check `bash`, `cat`, `xl`, `gcc`.
>
> I wonder which CLI program would print the minimum amount of information
> on how to run the program as the last line of the help message.
>

My Bad, I misinterpreted Andy's comment, will fix in v7:
static void usage(FILE *stream, const char *name)
{
    fprintf(stream,
            "%s: Xen microcode updating tool\n"
            "Usage: %s [options | microcode-file]\n"
            "options:\n"
            "  -h, --help            display this help\n"
            "  -s, --show-cpu-info   show CPU information\n",
            name, name);
    show_curr_cpu(stream);
}

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
> > -                "Usage: %s [<microcode file> | show-cpu-info]\n",
> argv[0]);
> > -        show_curr_cpu(stderr);
> > -        exit(2);
> > +        switch (opt)
> > +        {
> > +        case 'h':
> > +            usage(stdout, argv[0]);
> > +            exit(EXIT_SUCCESS);
> > +
> > +        case 's':
> > +            show_curr_cpu(stdout);
> > +            exit(EXIT_SUCCESS);
> > +
> > +        default:
> > +            goto ext_err;
> > +        }
> >      }
> >
> > -    if ( !strcmp(argv[1], "show-cpu-info") )
> > +    if ( optind =3D=3D argc )
> > +        goto ext_err;
> > +
> > +    /* For backwards compatibility to the pre-getopt() cmdline handlin=
g
> */
> > +    if ( !strcmp(argv[optind], "show-cpu-info") )
> >      {
> >          show_curr_cpu(stdout);
> >          return 0;
> >      }
> >
> > -    filename =3D argv[1];
> > +    filename =3D argv[optind];
> >      fd =3D open(filename, O_RDONLY);
> >      if ( fd < 0 )
> >      {
> > @@ -146,4 +176,10 @@ int main(int argc, char *argv[])
> >      close(fd);
> >
> >      return 0;
> > +
> > + ext_err:
> > +    fprintf(stderr,
> > +            "%s: unable to process command line arguments\n", argv[0])=
;
>
> A nice to have would be to have a better error message to point out
> what's wrong with the arguments. For that you could print the error
> message before "goto ext_err". One would be "unknown option" for the
> first goto, and "missing microcode file" for the second goto, that is
> instead of printing this more generic error message.
>

Sure, I will have specific error messages instead of generic one in v7

>
> Cheers,
>
> --
>
> Anthony Perard | Vates XCP-ng Developer
>
> XCP-ng & Xen Orchestra - Vates solutions
>
> web: https://vates.tech


Thanks,

Fouad

--000000000000863d330620057c12
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 24, 2024 at 5:55=E2=80=AF=
PM Anthony PERARD &lt;anthony.perard@vates.tech&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">On Fri, Jul 12, 2024 at 02:07:47=
PM +0100, Fouad Hilly wrote:<br>
&gt; diff --git a/tools/misc/xen-ucode.c b/tools/misc/xen-ucode.c<br>
&gt; index 390969db3d1c..8de82e5b8a10 100644<br>
&gt; --- a/tools/misc/xen-ucode.c<br>
&gt; +++ b/tools/misc/xen-ucode.c<br>
&gt; @@ -71,12 +72,29 @@ static void show_curr_cpu(FILE *f)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +static void usage(FILE *stream, const char *name)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 fprintf(stream,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%s: Xen microcode upd=
ating tool\n&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;options:\n&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 -h, --help=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 display this help\n&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 -s, --show-cpu=
-info=C2=A0 =C2=A0show CPU information\n&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Usage: %s [microcode =
file] [options]\n&quot;, name, name);<br>
<br>
FYI, I disagree with Andy about the order of this message. First is<br>
&quot;Usage:&quot; which explain where the option (dash-prefixed) can go, a=
nd<br>
which are the mandatory arguments, sometime having all the single-letter<br=
>
option in this line as well. Then there&#39;s an explanation of what the<br=
>
options are. I&#39;ve check `bash`, `cat`, `xl`, `gcc`.<br>
<br>
I wonder which CLI program would print the minimum amount of information<br=
>
on how to run the program as the last line of the help message.<br></blockq=
uote><div><br></div><div>My Bad, I misinterpreted Andy&#39;s comment, will =
fix in v7:</div><div><div style=3D"color:rgb(204,204,204);background-color:=
rgb(31,31,31);font-family:Consolas,&quot;Courier New&quot;,monospace;font-s=
ize:14px;line-height:19px;white-space:pre-wrap"><div><span style=3D"color:r=
gb(86,156,214)">static</span> <span style=3D"color:rgb(86,156,214)">void</s=
pan> <span style=3D"color:rgb(220,220,170)">usage</span>(FILE <span style=
=3D"color:rgb(212,212,212)">*</span><span style=3D"color:rgb(156,220,254)">=
stream</span>, <span style=3D"color:rgb(86,156,214)">const</span> <span sty=
le=3D"color:rgb(86,156,214)">char</span> <span style=3D"color:rgb(212,212,2=
12)">*</span><span style=3D"color:rgb(156,220,254)">name</span>)</div><div>=
{</div><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(220,220,170)">fprintf</s=
pan>(stream,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <span styl=
e=3D"color:rgb(206,145,120)">&quot;</span><span style=3D"color:rgb(156,220,=
254)">%s</span><span style=3D"color:rgb(206,145,120)">: Xen microcode updat=
ing tool</span><span style=3D"color:rgb(215,186,125)">\n</span><span style=
=3D"color:rgb(206,145,120)">&quot;</span></div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 <span style=3D"color:rgb(206,145,120)">&quot;Usage: </=
span><span style=3D"color:rgb(156,220,254)">%s</span><span style=3D"color:r=
gb(206,145,120)"> [options | microcode-file]</span><span style=3D"color:rgb=
(215,186,125)">\n</span><span style=3D"color:rgb(206,145,120)">&quot;</span=
></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"color:=
rgb(206,145,120)">&quot;options:</span><span style=3D"color:rgb(215,186,125=
)">\n</span><span style=3D"color:rgb(206,145,120)">&quot;</span></div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"color:rgb(206,145,=
120)">&quot; =C2=A0-h, --help =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0disp=
lay this help</span><span style=3D"color:rgb(215,186,125)">\n</span><span s=
tyle=3D"color:rgb(206,145,120)">&quot;</span></div><div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"color:rgb(206,145,120)">&quot; =C2=
=A0-s, --show-cpu-info =C2=A0 show CPU information</span><span style=3D"col=
or:rgb(215,186,125)">\n</span><span style=3D"color:rgb(206,145,120)">&quot;=
</span>,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name, name);</=
div><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(220,220,170)">show_curr_cpu=
</span>(stream);</div><div>}</div></div></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
<br>
&gt; @@ -86,22 +104,34 @@ int main(int argc, char *argv[])<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 if ( argc &lt; 2 )<br>
&gt; +=C2=A0 =C2=A0 while ( (opt =3D getopt_long(argc, argv, &quot;hs&quot;=
, options, NULL)) !=3D -1 )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;xen-uco=
de: Xen microcode updating tool\n&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Usage: =
%s [&lt;microcode file&gt; | show-cpu-info]\n&quot;, argv[0]);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 show_curr_cpu(stderr);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(2);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (opt)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case &#39;h&#39;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 usage(stdout, argv[0]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(EXIT_SUCCESS);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case &#39;s&#39;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 show_curr_cpu(stdout);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(EXIT_SUCCESS);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto ext_err;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 if ( !strcmp(argv[1], &quot;show-cpu-info&quot;) )<br>
&gt; +=C2=A0 =C2=A0 if ( optind =3D=3D argc )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto ext_err;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* For backwards compatibility to the pre-getopt() cmdl=
ine handling */<br>
&gt; +=C2=A0 =C2=A0 if ( !strcmp(argv[optind], &quot;show-cpu-info&quot;) )=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 show_curr_cpu(stdout);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 filename =3D argv[1];<br>
&gt; +=C2=A0 =C2=A0 filename =3D argv[optind];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fd =3D open(filename, O_RDONLY);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if ( fd &lt; 0 )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; @@ -146,4 +176,10 @@ int main(int argc, char *argv[])<br>
&gt;=C2=A0 =C2=A0 =C2=A0 close(fd);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +<br>
&gt; + ext_err:<br>
&gt; +=C2=A0 =C2=A0 fprintf(stderr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%s: unable to process=
 command line arguments\n&quot;, argv[0]);<br>
<br>
A nice to have would be to have a better error message to point out<br>
what&#39;s wrong with the arguments. For that you could print the error<br>
message before &quot;goto ext_err&quot;. One would be &quot;unknown option&=
quot; for the<br>
first goto, and &quot;missing microcode file&quot; for the second goto, tha=
t is<br>
instead of printing this more generic error message.<br></blockquote><div><=
br></div><div>Sure, I will have specific error messages instead of generic =
one in v7=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
-- <br>
<br>
Anthony Perard | Vates XCP-ng Developer<br>
<br>
XCP-ng &amp; Xen Orchestra - Vates solutions<br>
<br>
web: <a href=3D"https://vates.tech" rel=3D"noreferrer" target=3D"_blank">ht=
tps://vates.tech</a></blockquote><div><br></div><div>Thanks,</div><div><br>=
</div><div>Fouad=C2=A0=C2=A0</div></div></div>

--000000000000863d330620057c12--

