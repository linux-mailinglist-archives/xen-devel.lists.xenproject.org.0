Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C21295CD16
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 15:00:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782331.1191815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shTu0-0005W5-11; Fri, 23 Aug 2024 13:00:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782331.1191815; Fri, 23 Aug 2024 13:00:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shTtz-0005UO-UT; Fri, 23 Aug 2024 13:00:27 +0000
Received: by outflank-mailman (input) for mailman id 782331;
 Fri, 23 Aug 2024 13:00:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lTQ5=PW=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1shTty-0005UI-GL
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 13:00:26 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9f6dfcc-614f-11ef-a50a-bb4a2ccca743;
 Fri, 23 Aug 2024 15:00:25 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52f04b4abdcso2362364e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 23 Aug 2024 06:00:25 -0700 (PDT)
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
X-Inumbo-ID: a9f6dfcc-614f-11ef-a50a-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724418025; x=1725022825; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EUIqIvjOO+ZB3ICfg/YTIwjsqOnIpA4Wj0L8U6x/SiU=;
        b=EzwbWxPPCJJzET9eHGDpB2tcNA98f2iOnW4PaTPWsNKI1NCMsD7U8oJizNYEUHP1XQ
         OXt7vn0QTaTyxJzwxShApCVy1vAkTia2AqQcKhW14rHt2A9uQFZu1tUSgtSrzbhTsYi4
         VgnaqJPfqCydatiEpuYkxbudkHNxdMbm/QZBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724418025; x=1725022825;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EUIqIvjOO+ZB3ICfg/YTIwjsqOnIpA4Wj0L8U6x/SiU=;
        b=at9BFR6R4gSE82r0yQEDcnEp2A+FBoPFq5fzlIEvjrK16A8J5c1JCuxwovlkhQ5scZ
         EiTapKXAxZhVpgPZtohmRhwQlg+5am/WQU5UHS/CibAzayP0rRe4wVbP42hkBg5nJ2up
         JHVn/MQFDPGcY5cJaGWp7EpK5tfd8M8jM/u6AnEldNehRbf5J4PoIvVtgrdWBActZ/ss
         1E4V+FkBklbPcEdu/qmu9j6/UWkiWW4u0Ye4IK27CBQ2oq7rG8xBxPlf+GBYmHcTcz5Y
         T8qUAUamaWj/DlvepcFyR3EMrNeHkjDJ3v4kZZ94lZPxmxFFG6Q2RfgZzBamgDUIp3DS
         DpfA==
X-Forwarded-Encrypted: i=1; AJvYcCW3hL/VmpslEvkjBEUW8jw4bSUEUYsH/TS4EATQIa4ebPWiyp2+6mxZDMJo9SLIoyOr7dzotLod7VA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz0DQXRzrOuchjXub9mI2kk7wDBBaHZpJ2Sr0lC7qRl3NQGFBXk
	dNZI0ahKvl2N15HzZgL/TbeZRhi8Bh9sG3EeiU5j6kb07JhJIQ2pTFZrZ8RitDM9ypFiEgQsNkG
	e9Ll/eNmQ60YAl9dpKzxeJKF+xkOh+YmBJbzgmg==
X-Google-Smtp-Source: AGHT+IHr2prIo7wJONFQOqnXFsuZPdQIHXsdn3mW65tUYdIfytggI/1v6ukS0i35NqkdYnHdjQqjLT0FM9LXH77LkKk=
X-Received: by 2002:a05:6512:3b2b:b0:52e:98f6:c21f with SMTP id
 2adb3069b0e04-53438832e5cmr1536588e87.16.1724418024099; Fri, 23 Aug 2024
 06:00:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240822130426.492931-1-fouad.hilly@cloud.com>
 <20240822130426.492931-3-fouad.hilly@cloud.com> <25eca7b9-daef-42c7-8aa4-0d63d0cd0aa4@suse.com>
In-Reply-To: <25eca7b9-daef-42c7-8aa4-0d63d0cd0aa4@suse.com>
From: Fouad Hilly <fouad.hilly@cloud.com>
Date: Fri, 23 Aug 2024 14:00:12 +0100
Message-ID: <CAJKAvHb6OKk9Y0ed=aKtesxH3S7KeZRQzgSCOuA5BNn9R3g69w@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] x86/ucode: Introduce --force option to xen-ucode
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000c571c60620595b1e"

--000000000000c571c60620595b1e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 7:48=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:

> On 22.08.2024 15:04, Fouad Hilly wrote:
> > @@ -79,7 +81,10 @@ static void usage(FILE *stream, const char *name)
> >              "Usage: %s [options | microcode-file]\n"
> >              "options:\n"
> >              "  -h, --help               display this help\n"
> > -            "  -s, --show-cpu-info      show CPU information\n",
> > +            "  -s, --show-cpu-info      show CPU information\n"
> > +            "  -f, --force              skip certain checks when
> applying\n"
> > +            "                           microcode; do not use unless
> you know\n"
> > +            "                           exactly what you are doing\n",
> >              name, name);
>
> As indicated before: --force does no longer fit "[options |
> microcode-file]".
> The form coming closest is imo going to be "[options] [microcode-file]",
> with
> the file name simply taking no effect when specified together with one of
> the
> pre-existing two options.
>

My bad, I missed this change in v7.
I agree,  "[options] [microcode-file]" seems to better fit with the
introduction of --force.
If there are no further comments on the rest of the patch series, I can
prep v8 with this change.

>
> Jan
>

Thanks,

Fouad

--000000000000c571c60620595b1e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 23, 2024 at 7:48=E2=80=AF=
AM Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" target=3D"_blank">j=
beulich@suse.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">On 22.08.2024 15:04, Fouad Hilly wrote:<br>
&gt; @@ -79,7 +81,10 @@ static void usage(FILE *stream, const char *name)<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Usage: %s [optio=
ns | microcode-file]\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;options:\n&quot;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 -h, --hel=
p=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0display this help\n=
&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 -s, --show-cpu=
-info=C2=A0 =C2=A0 =C2=A0 show CPU information\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 -s, --show-cpu=
-info=C2=A0 =C2=A0 =C2=A0 show CPU information\n&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 -f, --force=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 skip certain checks when appl=
ying\n&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0microcode; do not use unless you know\n&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0exactly what you are doing\n&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name, name);<br>
<br>
As indicated before: --force does no longer fit &quot;[options | microcode-=
file]&quot;.<br>
The form coming closest is imo going to be &quot;[options] [microcode-file]=
&quot;, with<br>
the file name simply taking no effect when specified together with one of t=
he<br>
pre-existing two options.<br></blockquote><div><br></div><div>My bad, I mis=
sed this change in v7.</div><div>I agree,=C2=A0 &quot;[options] [microcode-=
file]&quot; seems to better fit with the introduction of --force.</div><div=
>If there are no further comments on the rest of the patch series, I can pr=
ep v8 with this change.</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
<br>
Jan<br></blockquote><div><br></div><div>Thanks,</div><div><br></div><div>Fo=
uad=C2=A0</div></div></div>

--000000000000c571c60620595b1e--

