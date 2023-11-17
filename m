Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEDC7EF3EF
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 14:59:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635217.991081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3zNU-00040l-Ul; Fri, 17 Nov 2023 13:59:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635217.991081; Fri, 17 Nov 2023 13:59:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3zNU-0003xi-S6; Fri, 17 Nov 2023 13:59:24 +0000
Received: by outflank-mailman (input) for mailman id 635217;
 Fri, 17 Nov 2023 13:59:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xoj+=G6=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1r3zNT-0003xc-Dz
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 13:59:23 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81ae07a2-8551-11ee-9b0e-b553b5be7939;
 Fri, 17 Nov 2023 14:59:21 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-53d8320f0easo2953106a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Nov 2023 05:59:21 -0800 (PST)
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
X-Inumbo-ID: 81ae07a2-8551-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1700229560; x=1700834360; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fagp+rmAYirSVBR8vRCNo4U5dLPMAju7VLV6px8s1FY=;
        b=adfoqc5LAZuP5heNlucy9gcVCK0O4xuSMk6O4MDyQsWZHFNQr6HfBKgi2kL+jGtSkb
         hkQ9toDOLcf0n9r2lNlBCmdAvZhnfgT7h/jGhePE/jL0A7dW4bpFsRrlcWIFw09ceUza
         Dk3Sx/UQIG50BA48bSaW/OQegOXmflzNMwbfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700229560; x=1700834360;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fagp+rmAYirSVBR8vRCNo4U5dLPMAju7VLV6px8s1FY=;
        b=gwLcm0s2DZfS/32bCq1P3A/lz1gsz53wLKSbcrsukcdLMnqmmcyKiUFc/rw2yA6LTK
         4akW2dXqign5mZCKwtA80qDwT3rMEmk13x2OSmPumKD44WJYoUN3CU9aWs6AFQXmbdxa
         8+CSdQiK3Yd0Qz73zduTmspC2175Uamn3OopT6L85Dx+tNdzAhTtFMfmZcZW5seJOYO3
         WoZjSmd4meOseIECz5Vg3aZSeyH4V/j+JIfn1Nvj7cbVWCv73zOV83NdrXUWKFeTI7QK
         z8ls1ybebI8iGBtZFI0JKEMYeuNd+ZOl6XBU/vLebOk6uuMgzpDvpJQtw7VW+M6TdbUY
         0M6A==
X-Gm-Message-State: AOJu0YwOpIarCn/1HnHqOejJK8SuYET9CAiwf/emTScMXFyEXUnYc1iu
	TyVzZ9V7U44IGm6lToFa+Sx+Lp6JYkE8GJC9DFXBqfPCFctdXOyrTvc=
X-Google-Smtp-Source: AGHT+IEOKG2hv1+/MHok+P7CDPgeJp5t1nE/uUjRwTJNi+fCYh3QZADHIK2zhOTs92lebuxkG/nqakSNcztuZ5wX7CE=
X-Received: by 2002:a17:906:3b16:b0:9c2:a072:78c4 with SMTP id
 g22-20020a1709063b1600b009c2a07278c4mr13123926ejf.25.1700229560498; Fri, 17
 Nov 2023 05:59:20 -0800 (PST)
MIME-Version: 1.0
References: <CAO-mL=wq2_gtE224RfavM3o6mhEASwygN6-fnKEP1YNUiuWEig@mail.gmail.com>
 <6554b6b7.df0a0220.412e6.4a71@mx.google.com>
In-Reply-To: <6554b6b7.df0a0220.412e6.4a71@mx.google.com>
From: Kelly Choi <kelly.choi@cloud.com>
Date: Fri, 17 Nov 2023 13:58:44 +0000
Message-ID: <CAO-mL=zCOA2-q6DpRSJ4O2mvdx9ypJPg7VXC14_+ZWy8Eqt7Yw@mail.gmail.com>
Subject: Re: Important - Documentation Discussion
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000fd9af1060a598a76"

--000000000000fd9af1060a598a76
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Alejandro,

Thanks for your feedback.
I'll consider all your points, and any other comments from the community
before proceeding on the next steps.

If anyone else has any further ideas, please let me know *Friday 24th
November 2023.*

Many thanks,
Kelly Choi

Open Source Community Manager
XenServer, Cloud Software Group


On Wed, Nov 15, 2023 at 12:16=E2=80=AFPM Alejandro Vallejo <
alejandro.vallejo@cloud.com> wrote:

> Hi,
>
> On Wed, Nov 15, 2023 at 11:43:46AM +0000, Kelly Choi wrote:
> > Hi all,
> >
> > As you may be aware, we are in the process of reviewing our existing
> > documentation platform and content. In order to meet the requirements o=
f
> > the community and project, I need your input and feedback.
> >
> > The aim of the new documentation is to encourage community members to
> > collaborate in updating content (where possible) and educate users on h=
ow
> > the project works. The updated documentation will be hosted on our new
> > upcoming website.
> >
> > *Suggestion for user-orientated documentation:*
> >
> >    - git - for hosting (gitlab recommended)
> >    - RST - for the format of the documentation
> >    - Sphynx - to generate web pages and PDF and other formats from RST
> In my experience Sphinx's strength is in its ability to cross-reference t=
he
> code. That isn't something terribly helpful for user documentation, and i=
t
> makes the whole thing harder to set up for no clear benefit.
>
> For user-facing docs I'd propose `mkdocs` instead, which is a lot more
> focused and simpler to set up (can be done literally in a couple of
> minutes). The main difference would be that it takes Markdown rather than
> RST[1]. It trivially supports plugins for interesting things, like mermai=
d
> (for sequence/block diagrams or FSMs)
>
> Main website: https://www.mkdocs.org/
> Plugin catalog: https://github.com/mkdocs/catalog
>     * mermaid plugin: https://github.com/fralau/mkdocs-mermaid2-plugin
>     * kroki plugin: https://kroki.io/
>
> [1] I happen to prefer Markdown, as I find it easier to read and write, b=
ut
>     that's just personal preference
>
> >
> > *Suggestion for developer reference documentation:*
> >
> >    - Doxygen
> >    - Kerneldoc
> >    - Open to other suggestions here
> There's 2 areas here. The format for the annotations, and the visualizati=
on
> frontend. They need not be the same. Using Doxygen seems the less
> "not-invented-here" approach, while kerneldoc would
>
> As for the frontend I would suggest to _not_ use Doxygen itself as the
> generated websites are hideous to look at. Sphinx (through Breathe) or an=
y
> other Doxygen-database parse wouldr do the job as well providing a much
> (much) better output.
>
> >
> > Example of how documentation will be split:
> >
> >    1. Getting started/beginner user guides
> >    2. Learning orientated tutorials
> >    3. Goal-orientated how-to guides
> >    4. Developer related documentation
> (1-3) seem like pretty much the same thing. Guides of increasing complexi=
ty
> meant to train a new user/admin. Dividing such a section in those 3 block=
s
> seems sensible.
>
> (4) could be split in a "Developer Manual", which would contain plain
> explanation for dev-heavy concepts, and a "Reference Manual" with links t=
o
> the Doxygen-esque websites and a higher focus on implementation details.
>
> >
> > Side note: Whilst I appreciate everyone has a different vision of what
> > ideal documentation looks like, please be mindful that not everyone's
> > thought processes or depth of knowledge are the same. All ideas are
> > welcome, and decisions made will always reflect community needs.
> >
> > Many thanks,
> > Kelly Choi
> >
> > Open Source Community Manager
> > XenServer, Cloud Software Group
>
> Cheers,
> Alejandro
>

--000000000000fd9af1060a598a76
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey Alejandro,<div><br></div><div>Thanks for your feedback=
.</div><div>I&#39;ll consider all your points, and any other comments from =
the community before proceeding on the next steps.</div><div><br></div><div=
>If anyone else has any further ideas, please let me know <b><u>Friday 24th=
 November 2023.</u></b></div><div><b><u><br clear=3D"all"></u></b><div><div=
 dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><=
div dir=3D"ltr"><div>Many thanks,</div><div>Kelly Choi</div><div><br></div>=
<div><div style=3D"color:rgb(136,136,136)">Open Source Community Manager</d=
iv><div style=3D"color:rgb(136,136,136)">XenServer, Cloud Software Group</d=
iv></div></div></div></div><br></div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 15, 2023 at 12:16=E2=80=AF=
PM Alejandro Vallejo &lt;<a href=3D"mailto:alejandro.vallejo@cloud.com">ale=
jandro.vallejo@cloud.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Hi,<br>
<br>
On Wed, Nov 15, 2023 at 11:43:46AM +0000, Kelly Choi wrote:<br>
&gt; Hi all,<br>
&gt; <br>
&gt; As you may be aware, we are in the process of reviewing our existing<b=
r>
&gt; documentation platform and content. In order to meet the requirements =
of<br>
&gt; the community and project, I need your input and feedback.<br>
&gt; <br>
&gt; The aim of the new documentation is to encourage community members to<=
br>
&gt; collaborate in updating content (where possible) and educate users on =
how<br>
&gt; the project works. The updated documentation will be hosted on our new=
<br>
&gt; upcoming website.<br>
&gt; <br>
&gt; *Suggestion for user-orientated documentation:*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 - git - for hosting (gitlab recommended)<br>
&gt;=C2=A0 =C2=A0 - RST - for the format of the documentation<br>
&gt;=C2=A0 =C2=A0 - Sphynx - to generate web pages and PDF and other format=
s from RST<br>
In my experience Sphinx&#39;s strength is in its ability to cross-reference=
 the<br>
code. That isn&#39;t something terribly helpful for user documentation, and=
 it<br>
makes the whole thing harder to set up for no clear benefit.<br>
<br>
For user-facing docs I&#39;d propose `mkdocs` instead, which is a lot more<=
br>
focused and simpler to set up (can be done literally in a couple of<br>
minutes). The main difference would be that it takes Markdown rather than<b=
r>
RST[1]. It trivially supports plugins for interesting things, like mermaid<=
br>
(for sequence/block diagrams or FSMs) <br>
<br>
Main website: <a href=3D"https://www.mkdocs.org/" rel=3D"noreferrer" target=
=3D"_blank">https://www.mkdocs.org/</a><br>
Plugin catalog: <a href=3D"https://github.com/mkdocs/catalog" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/mkdocs/catalog</a><br>
=C2=A0 =C2=A0 * mermaid plugin: <a href=3D"https://github.com/fralau/mkdocs=
-mermaid2-plugin" rel=3D"noreferrer" target=3D"_blank">https://github.com/f=
ralau/mkdocs-mermaid2-plugin</a><br>
=C2=A0 =C2=A0 * kroki plugin: <a href=3D"https://kroki.io/" rel=3D"noreferr=
er" target=3D"_blank">https://kroki.io/</a><br>
<br>
[1] I happen to prefer Markdown, as I find it easier to read and write, but=
<br>
=C2=A0 =C2=A0 that&#39;s just personal preference<br>
<br>
&gt; <br>
&gt; *Suggestion for developer reference documentation:*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 - Doxygen<br>
&gt;=C2=A0 =C2=A0 - Kerneldoc<br>
&gt;=C2=A0 =C2=A0 - Open to other suggestions here<br>
There&#39;s 2 areas here. The format for the annotations, and the visualiza=
tion<br>
frontend. They need not be the same. Using Doxygen seems the less<br>
&quot;not-invented-here&quot; approach, while kerneldoc would <br>
<br>
As for the frontend I would suggest to _not_ use Doxygen itself as the<br>
generated websites are hideous to look at. Sphinx (through Breathe) or any<=
br>
other Doxygen-database parse wouldr do the job as well providing a much<br>
(much) better output.<br>
<br>
&gt; <br>
&gt; Example of how documentation will be split:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 1. Getting started/beginner user guides<br>
&gt;=C2=A0 =C2=A0 2. Learning orientated tutorials<br>
&gt;=C2=A0 =C2=A0 3. Goal-orientated how-to guides<br>
&gt;=C2=A0 =C2=A0 4. Developer related documentation<br>
(1-3) seem like pretty much the same thing. Guides of increasing complexity=
<br>
meant to train a new user/admin. Dividing such a section in those 3 blocks<=
br>
seems sensible.<br>
<br>
(4) could be split in a &quot;Developer Manual&quot;, which would contain p=
lain<br>
explanation for dev-heavy concepts, and a &quot;Reference Manual&quot; with=
 links to<br>
the Doxygen-esque websites and a higher focus on implementation details.<br=
>
<br>
&gt; <br>
&gt; Side note: Whilst I appreciate everyone has a different vision of what=
<br>
&gt; ideal documentation looks like, please be mindful that not everyone&#3=
9;s<br>
&gt; thought processes or depth of knowledge are the same. All ideas are<br=
>
&gt; welcome, and decisions made will always reflect community needs.<br>
&gt; <br>
&gt; Many thanks,<br>
&gt; Kelly Choi<br>
&gt; <br>
&gt; Open Source Community Manager<br>
&gt; XenServer, Cloud Software Group<br>
<br>
Cheers,<br>
Alejandro<br>
</blockquote></div>

--000000000000fd9af1060a598a76--

