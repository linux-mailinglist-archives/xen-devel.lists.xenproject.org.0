Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D978995AF28
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2024 09:23:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781581.1191071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh29n-0000vl-3h; Thu, 22 Aug 2024 07:22:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781581.1191071; Thu, 22 Aug 2024 07:22:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh29n-0000uF-0A; Thu, 22 Aug 2024 07:22:55 +0000
Received: by outflank-mailman (input) for mailman id 781581;
 Thu, 22 Aug 2024 07:22:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m19V=PV=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1sh29l-0000u9-20
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2024 07:22:53 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 551c3aec-6057-11ef-8776-851b0ebba9a2;
 Thu, 22 Aug 2024 09:22:47 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5334c018913so455897e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Aug 2024 00:22:50 -0700 (PDT)
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
X-Inumbo-ID: 551c3aec-6057-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724311370; x=1724916170; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jmgS55xg6ZJl8yxNgooCYP0Vl69Wb60UaDm28s6UMOA=;
        b=J4TCzyZ2kHKWtAnR+QR8KSWPpfUCcKB5pqHzq+dY7EMS6G78V2Fus2fOp5atJTYlUy
         WSK9uziNG1rqvMG035WzA6xaXLPNnQAnTAoWP8ijsn73kC44RL247eNaBvfBRdhgv7hT
         1oi1DF82b03vcJA7SBLDoJwDn8JBqspKtx09I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724311370; x=1724916170;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jmgS55xg6ZJl8yxNgooCYP0Vl69Wb60UaDm28s6UMOA=;
        b=beukc+P8sAQGWpgLmqOq33bICsFJ/IykGrJOjLjlpMfyLeRCoStp04tt2C7zpcCYQu
         2puCQi6w7ksHo4LTLwbL6u+bucul2J01BzeWrPXCvOGQgq+Z33jiGq7X4/R0tUtbQBdP
         1CeyUvVuiqEr66qpn7eMerYk2ThkmFJMiyLtgVa2n04WwQZxKTIBBo9ZovmjQVihf5o1
         T3afTks3kAivyByIJ0mY9bw1vIMFafWZH4/S7TfQa9mws0cULB4Z4K0ZJ1byuHrZDiK6
         WvWA2hGQ+rF1eFD59kTa5Ugs5FIKNJcGMRg5lXmP6tiN6oAECoPvI8caN67KptVosegl
         IedA==
X-Forwarded-Encrypted: i=1; AJvYcCXXbClsz3x0BFDeMtgGkseX5xrP0I3Qangzd9LamEK4T8zOqak4YT5tUhtwwlz9FsvFkagc1kfTIYc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx4EcXhZhYre+ld0qkwjIN1ex6VVPB26pYNvUSxwAMJqhRspvQg
	ZnUklfopIyyZ/DMIgAMF0xCuGmr2K3zZSqenMYalsF0ws/jqVtldHoT+U2+W44hE2NfI3r90nTq
	zhjr9ttv/I1cN6JIpZgMesi97PpddsEfbMRNFKUHaEwom7oGGtJE=
X-Google-Smtp-Source: AGHT+IHH1HcB2kGPQDllTK5k6VaYXgo/DZa30IK1bR39u//I9CarT+GfyfkR86WF+Eu2TzUHOgKqpyzYqUBxSzxB5DE=
X-Received: by 2002:a05:6512:1391:b0:533:4722:ebbe with SMTP id
 2adb3069b0e04-5334fc008e1mr430706e87.26.1724311369154; Thu, 22 Aug 2024
 00:22:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240725082725.2685481-1-fouad.hilly@cloud.com>
 <20240725082725.2685481-4-fouad.hilly@cloud.com> <d26bc29f-3ceb-4fe4-af58-c188f9bbf097@suse.com>
 <CAJKAvHbM=Dhi=VRuaKKGMgoyOP9PHyF=Q50wfezpxs=mkRTZug@mail.gmail.com> <ZsMUnNrxg728eE1J@l14>
In-Reply-To: <ZsMUnNrxg728eE1J@l14>
From: Fouad Hilly <fouad.hilly@cloud.com>
Date: Thu, 22 Aug 2024 08:22:37 +0100
Message-ID: <CAJKAvHbvJO86TZWwiQ9Wyndit3x2h6kgOdQG096ujxsEad+72A@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] x86/ucode: Introduce --force option to xen-ucode
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000a41e6b0620408694"

--000000000000a41e6b0620408694
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 10:47=E2=80=AFAM Anthony PERARD <anthony.perard@vat=
es.tech>
wrote:

> On Mon, Aug 19, 2024 at 09:56:57AM +0100, Fouad Hilly wrote:
> > On Thu, Jul 25, 2024 at 9:44=E2=80=AFAM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >
> > > On 25.07.2024 10:27, Fouad Hilly wrote:
> > > > @@ -79,7 +81,9 @@ static void usage(FILE *stream, const char *name)
> > > >              "options:\n"
> > > >              "  -h, --help            display this help\n"
> > > >              "  -s, --show-cpu-info   show CPU information\n"
> > > > -            "Usage: %s [microcode file | options]\n", name, name);
> > > > +            "  -f, --force           skip certain checks; do not
> use unless\n"
> > > > +            "you know exactly what you are doing\n"
> > >
> > > Did you look at the produced output? Imo you want to have
> > >
> > >             "  -f, --force           skip certain checks; do not use
> unless\n"
> > >             "                        you know exactly what you are
> doing\n"
> > >
> > > > +            "Usage: %s [microcode file [-f,--force] | options]\n",
> name, name);
> > >
> > > At least
> > >
> > >             "Usage: %s [microcode file [-f|--force] | options]\n",
> name, name);
> > >
> > > But: "options" now includes -f / --force, yet that on its own makes n=
o
> sense.
> > > I think this needs further textual clarification to properly indicate
> what is
> > > valid to use and what is not.
> > >
> >
> > Will be fixed in v7:
> > static void usage(FILE *stream, const char *name)
> > {
> >     fprintf(stream,
> >             "%s: Xen microcode updating tool\n"
> >             "Usage: %s [options | microcode-file]\n"
> >             "options:\n"
> >             "  -h, --help                       display this help\n"
> >             "  -s, --show-cpu-info              show CPU information\n"
> >             "  -f, --force <microcode-file>     skip certain checks; do
> not
> > \n"
>
> If I recall correctly, "--force" doesn't take any argument, so this
> usage is misleading. One could be tempted to execute `./xen-ucode
> -fmicrocode` or event `./xen-ucode --force -microcode` and expect it to
> work with files "microcode" or "-microcode" but instead I think getopt()
> is just going to return an error.
>
> Instead of writing "--force <microcode-file>", could you change the help
> text, with something like "skip certain checks when applying microcode"?
>

Sure, can be done in v7:

static void usage(FILE *stream, const char *name)
{
    fprintf(stream,
            "%s: Xen microcode updating tool\n"
            "Usage: %s [options | microcode-file]\n"
            "options:\n"
            "  -h, --help               display this help\n"
            "  -s, --show-cpu-info      show CPU information\n",
            "  -f, --force              skip certain checks when applying\n=
"
            "                           microcode; do not use unless you
know\n"
            "                           exactly what you are doing\n",
            name, name);
    show_curr_cpu(stream);
}

>
> >             "                                   use unless you know
> exactly
> > \n"
> >             "                                   what you are doing\n",
> >             name, name);
> >     show_curr_cpu(stream);
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

--000000000000a41e6b0620408694
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 19, 2024 at 10:47=E2=80=
=AFAM Anthony PERARD &lt;anthony.perard@vates.tech&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">On Mon, Aug 19, 2024 at 09:56=
:57AM +0100, Fouad Hilly wrote:<br>
&gt; On Thu, Jul 25, 2024 at 9:44=E2=80=AFAM Jan Beulich &lt;<a href=3D"mai=
lto:jbeulich@suse.com" target=3D"_blank">jbeulich@suse.com</a>&gt; wrote:<b=
r>
&gt; <br>
&gt; &gt; On 25.07.2024 10:27, Fouad Hilly wrote:<br>
&gt; &gt; &gt; @@ -79,7 +81,9 @@ static void usage(FILE *stream, const char=
 *name)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;option=
s:\n&quot;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0=
 -h, --help=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 display this help\n&qu=
ot;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0=
 -s, --show-cpu-info=C2=A0 =C2=A0show CPU information\n&quot;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Usage: %s [=
microcode file | options]\n&quot;, name, name);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 -f, =
--force=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0skip certain checks; do not=
 use unless\n&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;you know ex=
actly what you are doing\n&quot;<br>
&gt; &gt;<br>
&gt; &gt; Did you look at the produced output? Imo you want to have<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 -f, -=
-force=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0skip certain checks; do not =
use unless\n&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 y=
ou know exactly what you are doing\n&quot;<br>
&gt; &gt;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Usage: %s [=
microcode file [-f,--force] | options]\n&quot;, name, name);<br>
&gt; &gt;<br>
&gt; &gt; At least<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Usage: %s [m=
icrocode file [-f|--force] | options]\n&quot;, name, name);<br>
&gt; &gt;<br>
&gt; &gt; But: &quot;options&quot; now includes -f / --force, yet that on i=
ts own makes no sense.<br>
&gt; &gt; I think this needs further textual clarification to properly indi=
cate what is<br>
&gt; &gt; valid to use and what is not.<br>
&gt; &gt;<br>
&gt; <br>
&gt; Will be fixed in v7:<br>
&gt; static void usage(FILE *stream, const char *name)<br>
&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0fprintf(stream,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%s: Xen microcode=
 updating tool\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Usage: %s [option=
s | microcode-file]\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;options:\n&quot;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 -h, --help=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0display this help\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 -s, --show=
-cpu-info=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 show CPU informat=
ion\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 -f, --forc=
e &lt;microcode-file&gt;=C2=A0 =C2=A0 =C2=A0skip certain checks; do not<br>
&gt; \n&quot;<br>
<br>
If I recall correctly, &quot;--force&quot; doesn&#39;t take any argument, s=
o this<br>
usage is misleading. One could be tempted to execute `./xen-ucode<br>
-fmicrocode` or event `./xen-ucode --force -microcode` and expect it to<br>
work with files &quot;microcode&quot; or &quot;-microcode&quot; but instead=
 I think getopt()<br>
is just going to return an error.<br>
<br>
Instead of writing &quot;--force &lt;microcode-file&gt;&quot;, could you ch=
ange the help<br>
text, with something like &quot;skip certain checks when applying microcode=
&quot;?<br></blockquote><div><br></div><div>Sure, can be done in v7:</div><=
div><br></div><div style=3D"color:rgb(204,204,204);background-color:rgb(31,=
31,31);font-family:Consolas,&quot;Courier New&quot;,monospace;font-size:14p=
x;line-height:19px;white-space:pre"><div><span style=3D"color:rgb(86,156,21=
4)">static</span> <span style=3D"color:rgb(86,156,214)">void</span> <span s=
tyle=3D"color:rgb(220,220,170)">usage</span>(FILE <span style=3D"color:rgb(=
212,212,212)">*</span><span style=3D"color:rgb(156,220,254)">stream</span>,=
 <span style=3D"color:rgb(86,156,214)">const</span> <span style=3D"color:rg=
b(86,156,214)">char</span> <span style=3D"color:rgb(212,212,212)">*</span><=
span style=3D"color:rgb(156,220,254)">name</span>)</div><div>{</div><div>=
=C2=A0 =C2=A0 <span style=3D"color:rgb(220,220,170)">fprintf</span>(stream,=
</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"color:r=
gb(206,145,120)">&quot;</span><span style=3D"color:rgb(156,220,254)">%s</sp=
an><span style=3D"color:rgb(206,145,120)">: Xen microcode updating tool</sp=
an><span style=3D"color:rgb(215,186,125)">\n</span><span style=3D"color:rgb=
(206,145,120)">&quot;</span></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 <span style=3D"color:rgb(206,145,120)">&quot;Usage: </span><span sty=
le=3D"color:rgb(156,220,254)">%s</span><span style=3D"color:rgb(206,145,120=
)"> [options | microcode-file]</span><span style=3D"color:rgb(215,186,125)"=
>\n</span><span style=3D"color:rgb(206,145,120)">&quot;</span></div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"color:rgb(206,145,=
120)">&quot;options:</span><span style=3D"color:rgb(215,186,125)">\n</span>=
<span style=3D"color:rgb(206,145,120)">&quot;</span></div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"color:rgb(206,145,120)">&quo=
t; =C2=A0-h, --help =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 displa=
y this help</span><span style=3D"color:rgb(215,186,125)">\n</span><span sty=
le=3D"color:rgb(206,145,120)">&quot;</span></div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 <span style=3D"color:rgb(206,145,120)">&quot; =C2=A0-s=
, --show-cpu-info =C2=A0 =C2=A0 =C2=A0show CPU information</span><span styl=
e=3D"color:rgb(215,186,125)">\n</span><span style=3D"color:rgb(206,145,120)=
">&quot;</span>,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <span =
style=3D"color:rgb(206,145,120)">&quot; =C2=A0-f, --force =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0skip certain checks when applying</span><spa=
n style=3D"color:rgb(215,186,125)">\n</span><span style=3D"color:rgb(206,14=
5,120)">&quot;</span></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <=
span style=3D"color:rgb(206,145,120)">&quot; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 microcode; d=
o not use unless you know</span><span style=3D"color:rgb(215,186,125)">\n</=
span><span style=3D"color:rgb(206,145,120)">&quot;</span></div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"color:rgb(206,145,120)">&=
quot; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 exactly what you are doing</span><span style=3D"color=
:rgb(215,186,125)">\n</span><span style=3D"color:rgb(206,145,120)">&quot;</=
span>,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name, name);</di=
v><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(220,220,170)">show_curr_cpu</=
span>(stream);</div></div><div><span style=3D"background-color:rgb(31,31,31=
);color:rgb(204,204,204);font-family:Consolas,&quot;Courier New&quot;,monos=
pace;font-size:14px;white-space:pre">}</span>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0use unless you know exactly<br>
&gt; \n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0what you are doing\n&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name, name);<br>
&gt;=C2=A0 =C2=A0 =C2=A0show_curr_cpu(stream);<br>
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
</div><div>Fouad=C2=A0</div></div></div>

--000000000000a41e6b0620408694--

