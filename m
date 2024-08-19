Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DBF95661E
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2024 10:57:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.779401.1189140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sfyC7-0006BS-2n; Mon, 19 Aug 2024 08:56:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 779401.1189140; Mon, 19 Aug 2024 08:56:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sfyC6-00068f-Uv; Mon, 19 Aug 2024 08:56:54 +0000
Received: by outflank-mailman (input) for mailman id 779401;
 Mon, 19 Aug 2024 08:56:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mhAH=PS=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1sfyC5-0005fE-Av
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2024 08:56:53 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id faa498f2-5e08-11ef-a506-bb4a2ccca743;
 Mon, 19 Aug 2024 10:56:53 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-53301d46c54so5342401e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2024 01:56:52 -0700 (PDT)
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
X-Inumbo-ID: faa498f2-5e08-11ef-a506-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724057812; x=1724662612; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YEmuqgTAZOeKu0aCS9k5lKEaCh4b2NLQOiXLT8kpyEw=;
        b=NUIZ+yhgJ105XcgQm8l4t8Lek4VySfpzf9EWdNRaCL+Kvvmn/ogvSfql2xqXTmTtT6
         Dt07B1uFIBeIA0fjA1qj0iSrPuEZx5ZK+csHrJQ6cwp7uAwtX33hRmwIXmSxfzmWs1zy
         Au93DZO2JhhIkfucMxvhPKITIF8A33xBW9tD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724057812; x=1724662612;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YEmuqgTAZOeKu0aCS9k5lKEaCh4b2NLQOiXLT8kpyEw=;
        b=k+CEsHvTPPmWAUQxt/fUtOSPNqrO9JdLnQVjhg2NAKjxui4siAfMKF1M2n951fLpLf
         2Gf2vb/Xe4hpINaRpA8tTzErzjuiORuKIF407b5mWauwI+LvqeHp4A9fUdywNDet4VKi
         oWAYiK9Zo8Fgu5hBiSeP67Lk6IWPODCmo1lJonFviNEt6QA4uy+E3THXSZmIn+SoA8KK
         aQqTv/L+pJCF9IXhVXyHLRzw19kjQ3BFed1tvasHD9eGXSBgJHIoPcPOU+CHnYFnGZbd
         JIp2r9jYzZrnr02cNO1xGhHqqpgod2re2h+Z3nfDPZpV1i2eLFz4n4OIy3RHxeC5zMfv
         gvpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXgA+ltmESjuC7P1oJHYiUy2/IGrkZyUY+3e8IK+6SoypuPTSy9fd0V/sbXoMRFZuYzthiDfQRBs7jA5vILfusnmkiw0mq4JshvjynceM=
X-Gm-Message-State: AOJu0YzsYf1stsS0hMZuwrb+JJQ/u8NCXEFts9IGYhXXRN+3RWUEnvwU
	DLOU3gAuyglTrmlC/ZuFiSDFYEcNQcNBunBXpScfTw1jgJ+wVMGrunu6lP6LsE+PABU3NhHgWUX
	jCdz1miKNkpzjjUFxBLCRWcFhsT3Ci97HeLQGqQ==
X-Google-Smtp-Source: AGHT+IF+2/AgU4qLDtZHbQgRW/DBOL1dYXJHxW+FlHuDCg5Tee+c2sSOES3lv3MW/m2g+B1/rvXLYBqwnwI2TnsxLag=
X-Received: by 2002:a05:6512:3d0a:b0:52e:ff2a:217 with SMTP id
 2adb3069b0e04-5331c6effe2mr6388590e87.50.1724057811859; Mon, 19 Aug 2024
 01:56:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240725082725.2685481-1-fouad.hilly@cloud.com>
 <20240725082725.2685481-3-fouad.hilly@cloud.com> <e2d2244d-66ac-46bd-b047-044c9860c955@suse.com>
In-Reply-To: <e2d2244d-66ac-46bd-b047-044c9860c955@suse.com>
From: Fouad Hilly <fouad.hilly@cloud.com>
Date: Mon, 19 Aug 2024 09:56:41 +0100
Message-ID: <CAJKAvHZx-fQ6McT8q5NSFzgN3FtHKbF_m1DdhFtTKXgHrNx0BA@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] x86/ucode: refactor xen-ucode to utilize getopt
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000072e0990620057d31"

--00000000000072e0990620057d31
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2024 at 9:41=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:

> On 25.07.2024 10:27, Fouad Hilly wrote:
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
> > +            "Usage: %s [microcode file | options]\n", name, name);
>
> Oh, and: While I gave this precise layout as an outline, it wasn't really
> meant to be used literally. Note how "microcode" and "file" now suggest
> there need to be two separate command line elements. Perhaps using
> "microcode-file" instead may already make this less ambiguous.
>

Yes indeed, I will fix in v7:
  static void usage(FILE *stream, const char *name)
{
    fprintf(stream,
            "%s: Xen microcode updating tool\n"
            "Usage: %s [options | microcode-file]\n"
            "options:\n"
            "  -h, --help                       display this help\n"
            "  -s, --show-cpu-info              show CPU information\n"
            "  -f, --force <microcode-file>     skip certain checks; do not
\n"
            "                                   use unless you know exactly
\n"
            "                                   what you are doing\n",
            name, name);
    show_curr_cpu(stream);
}

>
> Jan
>

Thanks,

Fouad

--00000000000072e0990620057d31
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 25, 2024 at 9:41=E2=80=AF=
AM Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" target=3D"_blank">j=
beulich@suse.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">On 25.07.2024 10:27, Fouad Hilly wrote:<br>
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
file | options]\n&quot;, name, name);<br>
<br>
Oh, and: While I gave this precise layout as an outline, it wasn&#39;t real=
ly<br>
meant to be used literally. Note how &quot;microcode&quot; and &quot;file&q=
uot; now suggest<br>
there need to be two separate command line elements. Perhaps using<br>
&quot;microcode-file&quot; instead may already make this less ambiguous.<br=
></blockquote><div><br></div><div>Yes indeed, I will fix in v7:</div><div>=
=C2=A0=C2=A0<span style=3D"background-color:rgb(31,31,31);font-family:Conso=
las,&quot;Courier New&quot;,monospace;font-size:14px;white-space:pre-wrap;c=
olor:rgb(86,156,214)">static</span><span style=3D"background-color:rgb(31,3=
1,31);color:rgb(204,204,204);font-family:Consolas,&quot;Courier New&quot;,m=
onospace;font-size:14px;white-space:pre-wrap"> </span><span style=3D"backgr=
ound-color:rgb(31,31,31);font-family:Consolas,&quot;Courier New&quot;,monos=
pace;font-size:14px;white-space:pre-wrap;color:rgb(86,156,214)">void</span>=
<span style=3D"background-color:rgb(31,31,31);color:rgb(204,204,204);font-f=
amily:Consolas,&quot;Courier New&quot;,monospace;font-size:14px;white-space=
:pre-wrap"> </span><span style=3D"background-color:rgb(31,31,31);font-famil=
y:Consolas,&quot;Courier New&quot;,monospace;font-size:14px;white-space:pre=
-wrap;color:rgb(220,220,170)">usage</span><span style=3D"background-color:r=
gb(31,31,31);color:rgb(204,204,204);font-family:Consolas,&quot;Courier New&=
quot;,monospace;font-size:14px;white-space:pre-wrap">(FILE </span><span sty=
le=3D"background-color:rgb(31,31,31);font-family:Consolas,&quot;Courier New=
&quot;,monospace;font-size:14px;white-space:pre-wrap;color:rgb(212,212,212)=
">*</span><span style=3D"background-color:rgb(31,31,31);font-family:Consola=
s,&quot;Courier New&quot;,monospace;font-size:14px;white-space:pre-wrap;col=
or:rgb(156,220,254)">stream</span><span style=3D"background-color:rgb(31,31=
,31);color:rgb(204,204,204);font-family:Consolas,&quot;Courier New&quot;,mo=
nospace;font-size:14px;white-space:pre-wrap">, </span><span style=3D"backgr=
ound-color:rgb(31,31,31);font-family:Consolas,&quot;Courier New&quot;,monos=
pace;font-size:14px;white-space:pre-wrap;color:rgb(86,156,214)">const</span=
><span style=3D"background-color:rgb(31,31,31);color:rgb(204,204,204);font-=
family:Consolas,&quot;Courier New&quot;,monospace;font-size:14px;white-spac=
e:pre-wrap"> </span><span style=3D"background-color:rgb(31,31,31);font-fami=
ly:Consolas,&quot;Courier New&quot;,monospace;font-size:14px;white-space:pr=
e-wrap;color:rgb(86,156,214)">char</span><span style=3D"background-color:rg=
b(31,31,31);color:rgb(204,204,204);font-family:Consolas,&quot;Courier New&q=
uot;,monospace;font-size:14px;white-space:pre-wrap"> </span><span style=3D"=
background-color:rgb(31,31,31);font-family:Consolas,&quot;Courier New&quot;=
,monospace;font-size:14px;white-space:pre-wrap;color:rgb(212,212,212)">*</s=
pan><span style=3D"background-color:rgb(31,31,31);font-family:Consolas,&quo=
t;Courier New&quot;,monospace;font-size:14px;white-space:pre-wrap;color:rgb=
(156,220,254)">name</span><span style=3D"background-color:rgb(31,31,31);col=
or:rgb(204,204,204);font-family:Consolas,&quot;Courier New&quot;,monospace;=
font-size:14px;white-space:pre-wrap">)</span><br></div><div style=3D"color:=
rgb(204,204,204);background-color:rgb(31,31,31);font-family:Consolas,&quot;=
Courier New&quot;,monospace;font-size:14px;line-height:19px;white-space:pre=
-wrap"><div>{</div><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(220,220,170)=
">fprintf</span>(stream,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 <span style=3D"color:rgb(206,145,120)">&quot;</span><span style=3D"colo=
r:rgb(156,220,254)">%s</span><span style=3D"color:rgb(206,145,120)">: Xen m=
icrocode updating tool</span><span style=3D"color:rgb(215,186,125)">\n</spa=
n><span style=3D"color:rgb(206,145,120)">&quot;</span></div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"color:rgb(206,145,120)">&quo=
t;Usage: </span><span style=3D"color:rgb(156,220,254)">%s</span><span style=
=3D"color:rgb(206,145,120)"> [options | microcode-file]</span><span style=
=3D"color:rgb(215,186,125)">\n</span><span style=3D"color:rgb(206,145,120)"=
>&quot;</span></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <span st=
yle=3D"color:rgb(206,145,120)">&quot;options:</span><span style=3D"color:rg=
b(215,186,125)">\n</span><span style=3D"color:rgb(206,145,120)">&quot;</spa=
n></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"color=
:rgb(206,145,120)">&quot; =C2=A0-h, --help =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 display this help</span><span=
 style=3D"color:rgb(215,186,125)">\n</span><span style=3D"color:rgb(206,145=
,120)">&quot;</span></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <s=
pan style=3D"color:rgb(206,145,120)">&quot; =C2=A0-s, --show-cpu-info =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0show CPU information</span><sp=
an style=3D"color:rgb(215,186,125)">\n</span><span style=3D"color:rgb(206,1=
45,120)">&quot;</span></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
<span style=3D"color:rgb(206,145,120)">&quot; =C2=A0-f, --force &lt;microco=
de-file&gt; =C2=A0 =C2=A0 skip certain checks; do not</span><span style=3D"=
color:rgb(215,186,125)">\n</span><span style=3D"color:rgb(206,145,120)">&qu=
ot;</span></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <span style=
=3D"color:rgb(206,145,120)">&quot; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 use unless you know exactly</span><span style=3D"color:rgb(215,186,1=
25)">\n</span><span style=3D"color:rgb(206,145,120)">&quot;</span></div><di=
v>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"color:rgb(206,14=
5,120)">&quot; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 what you are do=
ing</span><span style=3D"color:rgb(215,186,125)">\n</span><span style=3D"co=
lor:rgb(206,145,120)">&quot;</span>,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 name, name);</div><div>=C2=A0 =C2=A0 <span style=3D"color:rgb=
(220,220,170)">show_curr_cpu</span>(stream);</div><div>}</div></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
<br>
Jan<br></blockquote><div><br></div><div>Thanks,</div><div><br></div><div>Fo=
uad=C2=A0</div></div></div>

--00000000000072e0990620057d31--

