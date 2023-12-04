Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D120802B2F
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 06:03:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646499.1008805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA16Z-0005gb-3K; Mon, 04 Dec 2023 05:02:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646499.1008805; Mon, 04 Dec 2023 05:02:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA16Z-0005eJ-0h; Mon, 04 Dec 2023 05:02:51 +0000
Received: by outflank-mailman (input) for mailman id 646499;
 Mon, 04 Dec 2023 05:02:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dRte=HP=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1rA16X-0005eC-Eu
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 05:02:49 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cd5ad94-9262-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 06:02:45 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a1b68ae40ffso84277766b.0
 for <xen-devel@lists.xenproject.org>; Sun, 03 Dec 2023 21:02:45 -0800 (PST)
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
X-Inumbo-ID: 5cd5ad94-9262-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1701666165; x=1702270965; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kArH217FK6O2EcTfOMwWn1+JeyULlLjEiCM5F+n9/Tk=;
        b=HCfLPQTajk1HWVoi+3ne07h86IEYNYdt79yB6LVjheVzvyQjvo6FMWOTQsIf/PQya6
         zvnhj/EDTeWcTW5nzy7i3jRnZVEl+mfMcg1IVqzH5qSDQQBa5z4Inxqu/ADno6zoaB2N
         zBN2Y9Y7B1zNRqQ2bTybHyqnu2shnxJYhUWm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701666165; x=1702270965;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kArH217FK6O2EcTfOMwWn1+JeyULlLjEiCM5F+n9/Tk=;
        b=lmiLuMqsEH9PdZy62ztU6ORO5e5pJpxHogupeBgTiOflcsXVh+2yqUMcrxNdX9/Hjl
         1+wNa038bDxxDmRacMgXNKINeuATRhIR1snkSMd8cTpi5ioGWHqUANvrb+oPwa23obE8
         SqJHupdqndg8T5lb8oMA0ud3mOGX/lKWaqzuqNvu6IlEypRT0AT42RQLKgOE+dszXD6a
         p0rslZT6LCT/NXcAPA3oU+COUbnRbkmQl8tOGmfrZOk9dyibTTIbPogWpdoRkmyArf1A
         wXrRRnMkgMtNhu+VILcN/hIbofJPuR/kG0CwO7CXzSCOH2dJbfHj2baNeiscnNF1sYXO
         H83g==
X-Gm-Message-State: AOJu0Yz3w3pSv41WH4tV7QquzUe8lae3BHWS1Gh4JfA6N5QCFc3mnTTk
	t9ib1iynnqv2fZKcZ4cMOWN6jeHp2ni2v7+hzsLKsQUur7/K2G5LCfdm6A==
X-Google-Smtp-Source: AGHT+IEpgqFsQeUzg+TlgfX406K26kL0h/Vzj/x3Bi81YnkixB6RhaCNzaZi7j8w+Td0XKY6r8pqqxY1IRRvAiZG/Ts=
X-Received: by 2002:a17:906:dfe9:b0:a19:9b79:8b4f with SMTP id
 lc9-20020a170906dfe900b00a199b798b4fmr2052198ejc.96.1701666165101; Sun, 03
 Dec 2023 21:02:45 -0800 (PST)
MIME-Version: 1.0
References: <CAO-mL=x3DntLhoKuaiWYjVqkQRqj=rdyZWmuH1aDjkmUbQchyA@mail.gmail.com>
 <alpine.DEB.2.22.394.2311301426210.110490@ubuntu-linux-20-04-desktop>
 <CA+zSX=ZJETPgXut62Y5RQyB8Q6Ruwqd656+iW+ark6WOXYEf+w@mail.gmail.com>
 <alpine.DEB.2.22.394.2312011253390.110490@ubuntu-linux-20-04-desktop> <CA+zSX=aZf1UQt2eE0byMgwL+3EfW3B6CJkUHuFBVGA7Na=9gqA@mail.gmail.com>
In-Reply-To: <CA+zSX=aZf1UQt2eE0byMgwL+3EfW3B6CJkUHuFBVGA7Na=9gqA@mail.gmail.com>
From: Kelly Choi <kelly.choi@cloud.com>
Date: Mon, 4 Dec 2023 05:02:08 +0000
Message-ID: <CAO-mL=ybm=AGyeerpngwQBTn6995z937bR5Gf8Qd5vP8MmR2TQ@mail.gmail.com>
Subject: Re: INFORMAL VOTE REQUIRED - DOCUMENTATION WORDING
To: George Dunlap <george.dunlap@cloud.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, 
	committers@xenproject.org
Content-Type: multipart/alternative; boundary="0000000000004c33f8060ba80777"

--0000000000004c33f8060ba80777
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

Thank you for your feedback.

Firstly, let me apologise if I have caused confusion with the form. It was
not intended to be a one answer fits all within the community. Rather, it
was created to give community members an option to share how they feel
about the term, with the example mentioned. In the future, I want to ensure
you that I have taken your feedback on board and wider context will be
provided. I'll also make sure that maintainers/committers are CC'd into the
threads.

The form was created as a method to understand the wider view of the
community, whilst making it easier to track responses. The key takeaways
here are what Stefano has addressed earlier: that we should reach a
consensus quicker rather than continue what some would consider nitpicking
small things.

Following the discussions above and my previous emails, we will be adding
informal voting to the governance guidelines and reviewing other ways to
better collaborate. Some suggestions for improvement include discussing
ways in which the wider community can address their concerns, having the
ability to vote, and potentially electing an arbiter or technical steering
committee for similar situations. I will be sending out further
communications and discussing this with the community at a later date.

In the specific example above, it's difficult in the sense that informal
voting wasn't officially in the governance yet when the feedback was
raised. What I would recommend in this instance is that if George and
others feel very strongly about removing that term and have given a proper
explanation, then I'd advise calling an informal vote within the thread and
following the decision. Alternatively if after this conversation, members
understand Andy's point of view and the term doesn't have serious
consequences - let's agree with what Andy inputted in the first place and
move this project ahead.  In an ideal world, we wouldn't require voting,
but rather a discussion. However, if there are strong opinions for/against
a specific decision that is causing us to be at a standstill, this is where
informal voting helps.

*I have updated the form
<https://cryptpad.fr/form/#/2/form/view/7ByH95Vd7KiDOvN4wjV5iUGlMuZbkVdwk7c=
YpZdluWo/>
with wider context and other options to reflect a 5-point survey, should
anyone wish to express/change their vote. It would be good to view how the
community feels about this in general, which should guide us in future
similar situations. *

I just want to reiterate that we all working towards a common goal within
the project, and although disagreements can arise, we should always seek
ways to compromise.

Many thanks,
Kelly Choi

Xen Project Community Manager
XenServer, Cloud Software Group


On Fri, Dec 1, 2023 at 11:03=E2=80=AFPM George Dunlap <george.dunlap@cloud.=
com>
wrote:

> On Fri, Dec 1, 2023 at 9:44=E2=80=AFPM Stefano Stabellini
> <sstabellini@kernel.org> wrote:
> > By the informal
> > voting, we have 3 against "broken" and 2 in favor (not 1 as George wrot=
e
> > as Andrew's vote counts too).
>
> Just to clarify: The opinions on that thread (if you include all
> versions of the series) were:
>
> Andy, Daniel for keeping "broken
> Julien, Jan, Stefano, George: for changing "broken"
>
> That's the "2 (+) / 4 split" I referred to (The "(+)" being the people
> who agreed with Andy in private).  Regarding voting, I was only
> counting the maintainers of the code in question; it coming under THE
> REST, that would include everyone except Daniel; hence 1 - 4.  Not at
> all that Daniel's opinion doesn't matter, but that from a governance
> perspective, it's the maintainers (and then the committers) who get
> votes in the case of a formal escalation.
>
>  -George
>

--0000000000004c33f8060ba80777
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi everyone,<div><br></div><div>Thank you for your feedbac=
k.=C2=A0</div><div><br></div><div>Firstly, let me apologise if I have cause=
d confusion=C2=A0with the form. It was not intended to be a one answer fits=
 all within the community. Rather, it was created to give community members=
 an option to share how they feel about the term,=C2=A0with the example men=
tioned. In the future, I want to ensure you that I have taken your feedback=
 on board and wider context will be provided. I&#39;ll also make sure that =
maintainers/committers are CC&#39;d into the threads.=C2=A0=C2=A0</div><div=
><br></div><div>The form was created as a method to understand the wider vi=
ew of the community, whilst making it easier to track responses. The key ta=
keaways here are what Stefano has addressed earlier: that we should reach a=
 consensus quicker rather than continue what some would consider nitpicking=
 small things.=C2=A0</div><div><br></div><div>Following the discussions abo=
ve and my previous emails, we will be adding informal voting to the governa=
nce guidelines and reviewing other ways to better collaborate. Some suggest=
ions for improvement include discussing ways in which the wider community=
=C2=A0can address their concerns, having the ability to vote, and potential=
ly electing an arbiter or technical steering committee for similar situatio=
ns. I will be sending out further communications and discussing this with t=
he community at a later date.</div><div><br></div><div>In the specific exam=
ple above, it&#39;s difficult in the sense that informal voting wasn&#39;t =
officially in the governance yet when the feedback was raised. What I would=
=C2=A0recommend in this instance is that if George and others feel very str=
ongly about removing that term and have given a proper explanation, then I&=
#39;d advise calling an informal=C2=A0vote within the thread and following =
the decision. Alternatively if after this conversation, members understand =
Andy&#39;s point of view and the term doesn&#39;t have serious consequences=
 - let&#39;s agree with what Andy inputted in the first place and move this=
 project ahead.=C2=A0 In an ideal world, we wouldn&#39;t require voting, bu=
t rather a discussion. However, if there are strong opinions for/against a =
specific decision that is causing us to be at a standstill, this is where i=
nformal voting helps.</div><div><b><br></b></div><div><b>I have updated the=
 <a href=3D"https://cryptpad.fr/form/#/2/form/view/7ByH95Vd7KiDOvN4wjV5iUGl=
MuZbkVdwk7cYpZdluWo/">form</a> with wider context and other options to refl=
ect a 5-point survey, should anyone wish to express/change their vote. It w=
ould be good to view how the community feels about=C2=A0this in general, wh=
ich should guide us in future similar situations.=C2=A0</b></div><div><br><=
/div><div>I just want to reiterate that we all working towards a common goa=
l within the project, and although disagreements can arise, we should alway=
s seek ways to compromise.=C2=A0=C2=A0</div><div><br clear=3D"all"><div><di=
v dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature">=
<div dir=3D"ltr"><div>Many thanks,</div><div>Kelly Choi</div><div><br></div=
><div><div style=3D"color:rgb(136,136,136)">Xen Project Community Manager</=
div><div style=3D"color:rgb(136,136,136)">XenServer, Cloud Software Group</=
div></div></div></div></div><br></div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 1, 2023 at 11:03=E2=80=AF=
PM George Dunlap &lt;<a href=3D"mailto:george.dunlap@cloud.com">george.dunl=
ap@cloud.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Fri, Dec 1, 2023 at 9:44=E2=80=AFPM Stefano Stabellini<br>
&lt;<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini=
@kernel.org</a>&gt; wrote:<br>
&gt; By the informal<br>
&gt; voting, we have 3 against &quot;broken&quot; and 2 in favor (not 1 as =
George wrote<br>
&gt; as Andrew&#39;s vote counts too).<br>
<br>
Just to clarify: The opinions on that thread (if you include all<br>
versions of the series) were:<br>
<br>
Andy, Daniel for keeping &quot;broken<br>
Julien, Jan, Stefano, George: for changing &quot;broken&quot;<br>
<br>
That&#39;s the &quot;2 (+) / 4 split&quot; I referred to (The &quot;(+)&quo=
t; being the people<br>
who agreed with Andy in private).=C2=A0 Regarding voting, I was only<br>
counting the maintainers of the code in question; it coming under THE<br>
REST, that would include everyone except Daniel; hence 1 - 4.=C2=A0 Not at<=
br>
all that Daniel&#39;s opinion doesn&#39;t matter, but that from a governanc=
e<br>
perspective, it&#39;s the maintainers (and then the committers) who get<br>
votes in the case of a formal escalation.<br>
<br>
=C2=A0-George<br>
</blockquote></div>

--0000000000004c33f8060ba80777--

