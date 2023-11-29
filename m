Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4778E7FDBFE
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 16:54:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644104.1004671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8MsO-0005zO-Tg; Wed, 29 Nov 2023 15:53:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644104.1004671; Wed, 29 Nov 2023 15:53:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8MsO-0005xM-Ql; Wed, 29 Nov 2023 15:53:24 +0000
Received: by outflank-mailman (input) for mailman id 644104;
 Wed, 29 Nov 2023 15:53:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xuz2=HK=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1r8MsM-0005xF-Uv
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 15:53:23 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6be7d3d5-8ecf-11ee-98e3-6d05b1d4d9a1;
 Wed, 29 Nov 2023 16:53:21 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a011e9bf336so954287566b.3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Nov 2023 07:53:21 -0800 (PST)
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
X-Inumbo-ID: 6be7d3d5-8ecf-11ee-98e3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1701273201; x=1701878001; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hBp+fk+bSKBdjq+spVKbfJflMlcqlsQ73yRsfRGaOs4=;
        b=lUA1W/uY19xK6aeP9yknMGnKhgGjcxTkvW4ZdlNKUqJNMAqNlukJ3G8rPIGSenjdjA
         j/t/Lu92z3TkGF+c02q+wmqtZx15NCuYD1foOMM85FKBCRhu5qWIAkDw1q4cHZ5K+n3i
         XPhkATrOoj4V1oSvKgdLtQF/sOEa2MkG6nrAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701273201; x=1701878001;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hBp+fk+bSKBdjq+spVKbfJflMlcqlsQ73yRsfRGaOs4=;
        b=M38AIgNBfj0DylGn99hPXd6mlTFOmRMoWpQLjIyaLTzJQVdhey28wcSLzmNWaD/h89
         EzzfgEK4dunRahCatZnNigr5kAQ6P1FGP652FcwmmTDquEhw6IzNqRiI3iQisB+Wh2Wm
         9a9zTvR4ycyth/Ez0+mQQ56gYKhXyiAEDSVPXyEB30wz2oPDqFm8atw+CvcXNzYaT3lB
         T9O5Jw6YAqWSoWUvLvXedE5B2bX2B/ZEjXcZT8aL3FhOuUZxF9Zh/g9vpdQi0Sl5kAcS
         z7PouxGzWFBbyNHHuVItM5y8c4+jyyhCARYjlcrHjZZRXzJf2uDEjLs6pU9AfEOZOUuw
         cgTQ==
X-Gm-Message-State: AOJu0YwFi/6DSFbK5PsPFEejWE3qNOZgDiyj0yhQUHR8EQA/nlhs3flv
	cHV53iGyL5LmYw5Ik2GZ0hNBsCFvsBhDeddj15fWIT1qJ2LRXnV+CM8=
X-Google-Smtp-Source: AGHT+IEpBh7epoOMeK4HHm4+g600fifywKuLimJLzj6t9qArQPmjjL1+U+0JlecIgVvZQaiB9DlurNxG0OpNgkaAYBk=
X-Received: by 2002:a17:906:194f:b0:a04:3f97:f3f1 with SMTP id
 b15-20020a170906194f00b00a043f97f3f1mr14403528eje.58.1701273200706; Wed, 29
 Nov 2023 07:53:20 -0800 (PST)
MIME-Version: 1.0
References: <CAO-mL=wq2_gtE224RfavM3o6mhEASwygN6-fnKEP1YNUiuWEig@mail.gmail.com>
 <6554b6b7.df0a0220.412e6.4a71@mx.google.com> <CAO-mL=zCOA2-q6DpRSJ4O2mvdx9ypJPg7VXC14_+ZWy8Eqt7Yw@mail.gmail.com>
In-Reply-To: <CAO-mL=zCOA2-q6DpRSJ4O2mvdx9ypJPg7VXC14_+ZWy8Eqt7Yw@mail.gmail.com>
From: Kelly Choi <kelly.choi@cloud.com>
Date: Wed, 29 Nov 2023 15:52:44 +0000
Message-ID: <CAO-mL=y1X_nbggFBbCpWDSCR_ttshcpkU4Xo9wd2zEWbpgy-vg@mail.gmail.com>
Subject: Re: Important - Documentation Discussion
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Content-Type: multipart/alternative; boundary="000000000000cb6383060b4c8823"

--000000000000cb6383060b4c8823
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

After gathering different feedback from members of the community, please
see below.

*We will be moving ahead with Git + RST + Sphinx + Kroki as the new
platforms for user documentation.*

*Many of you have specified you don't necessarily have a preference for the
platform, but instead a need for updated content. *

Anticipated next steps:

   1. Begin scoping how documentation will be split out (e.g. getting
   started/tutorials/how-tos)
   2. Building out the new documentation platform
   3. Migrate the existing/relevant content over to the new platform
   4. Commit changes in Git
   5. Use Sphinx to generate HTML or other formats needed from RST files
   6. Align this to be launched on our new Xen Project webpage. (We may
   have the existing content visible whilst we work on revamping the
   documentation.)
   7. Create smaller working groups to update and plan documentation, and
   update these periodically, before pushing to the new webpage.

This will be a joint effort within the community, and I am hoping to
count on our members to facilitate these changes. I'll be asking everyone
for their help, but if you'd like to volunteer on any of the specific
steps, please let me know. The smaller working groups are likely to split
into teams concerning the subprojects, but this is open for discussion.

Many thanks,
Kelly Choi

Xen Project Community Manager
XenServer, Cloud Software Group


On Fri, Nov 17, 2023 at 1:58=E2=80=AFPM Kelly Choi <kelly.choi@cloud.com> w=
rote:

> Hey Alejandro,
>
> Thanks for your feedback.
> I'll consider all your points, and any other comments from the community
> before proceeding on the next steps.
>
> If anyone else has any further ideas, please let me know *Friday 24th
> November 2023.*
>
> Many thanks,
> Kelly Choi
>
> Open Source Community Manager
> XenServer, Cloud Software Group
>
>
> On Wed, Nov 15, 2023 at 12:16=E2=80=AFPM Alejandro Vallejo <
> alejandro.vallejo@cloud.com> wrote:
>
>> Hi,
>>
>> On Wed, Nov 15, 2023 at 11:43:46AM +0000, Kelly Choi wrote:
>> > Hi all,
>> >
>> > As you may be aware, we are in the process of reviewing our existing
>> > documentation platform and content. In order to meet the requirements =
of
>> > the community and project, I need your input and feedback.
>> >
>> > The aim of the new documentation is to encourage community members to
>> > collaborate in updating content (where possible) and educate users on
>> how
>> > the project works. The updated documentation will be hosted on our new
>> > upcoming website.
>> >
>> > *Suggestion for user-orientated documentation:*
>> >
>> >    - git - for hosting (gitlab recommended)
>> >    - RST - for the format of the documentation
>> >    - Sphynx - to generate web pages and PDF and other formats from RST
>> In my experience Sphinx's strength is in its ability to cross-reference
>> the
>> code. That isn't something terribly helpful for user documentation, and =
it
>> makes the whole thing harder to set up for no clear benefit.
>>
>> For user-facing docs I'd propose `mkdocs` instead, which is a lot more
>> focused and simpler to set up (can be done literally in a couple of
>> minutes). The main difference would be that it takes Markdown rather tha=
n
>> RST[1]. It trivially supports plugins for interesting things, like merma=
id
>> (for sequence/block diagrams or FSMs)
>>
>> Main website: https://www.mkdocs.org/
>> Plugin catalog: https://github.com/mkdocs/catalog
>>     * mermaid plugin: https://github.com/fralau/mkdocs-mermaid2-plugin
>>     * kroki plugin: https://kroki.io/
>>
>> [1] I happen to prefer Markdown, as I find it easier to read and write,
>> but
>>     that's just personal preference
>>
>> >
>> > *Suggestion for developer reference documentation:*
>> >
>> >    - Doxygen
>> >    - Kerneldoc
>> >    - Open to other suggestions here
>> There's 2 areas here. The format for the annotations, and the
>> visualization
>> frontend. They need not be the same. Using Doxygen seems the less
>> "not-invented-here" approach, while kerneldoc would
>>
>> As for the frontend I would suggest to _not_ use Doxygen itself as the
>> generated websites are hideous to look at. Sphinx (through Breathe) or a=
ny
>> other Doxygen-database parse wouldr do the job as well providing a much
>> (much) better output.
>>
>> >
>> > Example of how documentation will be split:
>> >
>> >    1. Getting started/beginner user guides
>> >    2. Learning orientated tutorials
>> >    3. Goal-orientated how-to guides
>> >    4. Developer related documentation
>> (1-3) seem like pretty much the same thing. Guides of increasing
>> complexity
>> meant to train a new user/admin. Dividing such a section in those 3 bloc=
ks
>> seems sensible.
>>
>> (4) could be split in a "Developer Manual", which would contain plain
>> explanation for dev-heavy concepts, and a "Reference Manual" with links =
to
>> the Doxygen-esque websites and a higher focus on implementation details.
>>
>> >
>> > Side note: Whilst I appreciate everyone has a different vision of what
>> > ideal documentation looks like, please be mindful that not everyone's
>> > thought processes or depth of knowledge are the same. All ideas are
>> > welcome, and decisions made will always reflect community needs.
>> >
>> > Many thanks,
>> > Kelly Choi
>> >
>> > Open Source Community Manager
>> > XenServer, Cloud Software Group
>>
>> Cheers,
>> Alejandro
>>
>

--000000000000cb6383060b4c8823
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi all,<div><br></div><div>After gatherin=
g different feedback from members of the community, please see below.</div>=
<div><b><br></b></div><div><b>We will be moving ahead with=C2=A0<u>Git=C2=
=A0+ RST=C2=A0+ Sphinx=C2=A0+ Kroki</u>=C2=A0as the new platforms for user =
documentation.</b></div><div><b><br></b></div><div><i>Many of you have spec=
ified you don&#39;t necessarily have a preference=C2=A0for the platform, bu=
t instead a need for updated content.=C2=A0</i></div><div><br></div><div>An=
ticipated next steps:</div><div><ol><li>Begin scoping how documentation wil=
l be split out (e.g. getting started/tutorials/how-tos)</li><li>Building ou=
t the new documentation platform=C2=A0</li><li>Migrate the existing/relevan=
t content over to the new platform=C2=A0</li><li>Commit changes in Git=C2=
=A0</li><li>Use Sphinx to generate HTML or other formats needed from RST fi=
les</li><li>Align this to be launched on our new Xen Project webpage. (We m=
ay have the existing content visible=C2=A0whilst we work on revamping the d=
ocumentation.)</li><li>Create smaller working groups to update and plan doc=
umentation, and update these periodically, before pushing to the new webpag=
e.=C2=A0</li></ol><div>This will be a joint effort within the community, an=
d I am hoping to count=C2=A0on our members to facilitate=C2=A0these changes=
. I&#39;ll be asking everyone for their help, but if you&#39;d like to volu=
nteer on any of the specific steps, please let me know. The smaller working=
 groups are likely to split into teams concerning the subprojects, but this=
 is open for=C2=A0discussion.=C2=A0</div></div><div><br></div><div><div><di=
v dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Many thanks,<=
/div><div>Kelly Choi</div><div><br></div><div><div style=3D"color:rgb(136,1=
36,136)">Xen Project Community Manager</div><div style=3D"color:rgb(136,136=
,136)">XenServer, Cloud Software Group</div></div></div></div></div><br></d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Fri, Nov 17, 2023 at 1:58=E2=80=AFPM Kelly Choi &lt;<a href=3D"mailto=
:kelly.choi@cloud.com" target=3D"_blank">kelly.choi@cloud.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"lt=
r">Hey Alejandro,<div><br></div><div>Thanks for your feedback.</div><div>I&=
#39;ll consider all your points, and any other comments from the community =
before proceeding on the next steps.</div><div><br></div><div>If anyone els=
e has any further ideas, please let me know <b><u>Friday 24th November 2023=
.</u></b></div><div><b><u><br clear=3D"all"></u></b><div><div dir=3D"ltr" c=
lass=3D"gmail_signature"><div dir=3D"ltr"><div>Many thanks,</div><div>Kelly=
 Choi</div><div><br></div><div><div style=3D"color:rgb(136,136,136)">Open S=
ource Community Manager</div><div style=3D"color:rgb(136,136,136)">XenServe=
r, Cloud Software Group</div></div></div></div></div><br></div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov =
15, 2023 at 12:16=E2=80=AFPM Alejandro Vallejo &lt;<a href=3D"mailto:alejan=
dro.vallejo@cloud.com" target=3D"_blank">alejandro.vallejo@cloud.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
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
</blockquote></div></div>

--000000000000cb6383060b4c8823--

