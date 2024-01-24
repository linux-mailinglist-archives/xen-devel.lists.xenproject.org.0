Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0296883AAB4
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 14:13:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670990.1044112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSd3g-0004Fp-Uc; Wed, 24 Jan 2024 13:12:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670990.1044112; Wed, 24 Jan 2024 13:12:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSd3g-0004D7-QP; Wed, 24 Jan 2024 13:12:48 +0000
Received: by outflank-mailman (input) for mailman id 670990;
 Wed, 24 Jan 2024 13:12:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gMsF=JC=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1rSd3f-0004Cy-4K
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 13:12:47 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 431a66c5-baba-11ee-98f5-6d05b1d4d9a1;
 Wed, 24 Jan 2024 14:12:44 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-51016492b14so246974e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 05:12:44 -0800 (PST)
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
X-Inumbo-ID: 431a66c5-baba-11ee-98f5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1706101964; x=1706706764; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g/G1ugZzrZbHA6LOwRxw6QHuobDH/OUiclucLl9IIu4=;
        b=XFPY2poDsxRGINr9cf46Ns8tvZ3Fx67NjyWinKsp7cEtbbZlH6zztGq7lWJcoGsqOU
         58qDWulXazpW+cUQHUedtalihHrUroxSwk9wSSK40jnjQpkd1uoy/R8zI2dv+at/OcGB
         RIrWY6VfWUwwhGI7ZxiXxn/pnh1pxx3KHe6nA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706101964; x=1706706764;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g/G1ugZzrZbHA6LOwRxw6QHuobDH/OUiclucLl9IIu4=;
        b=wsFjvVkfPeofroqdEM6u+FpuyCgAkl5cpBtNxG7okKCUo8Fo0wr5kYneF5gBgZx18R
         uETMlhS1lW3iBUq81crodAxZ4ToZFPjTZS9mWxzUldZ8Zx9aDkE16uuR8KWmgEDKS99T
         Bj6GR+kv8K5ZOt/m0ID6OJ6M7ihqprEBfN8w2t9IxuIpLMHYy6IgJmJRm36k3dsC735v
         CIgxH4TF5Hafnwsf/eB/Z0bCO/IRaXLxHNqtAs68nhAWeOE0paVfkdeaYwENSYm+36Va
         RhtidaCVeU0qdD+k9r063wtEeBVO09rg3NHGE04K9/db/NkEIAhcfxwBQiZezz8Oku4i
         HT2w==
X-Gm-Message-State: AOJu0Yx4xGz3b9L4fzpwT0ygH1Mf61hiN2HRw+BprtU4Ql4hIY6+Uhl2
	odoaLGP82m81I3+k6hQ2e+se8OpP2lWBs9Svp8v2+ttn9Lylbm4CvuhWarjErsTAT/jkKguNHNG
	Y9yQZm++V09gZyxFkqWH/42JVeFYcEhQ85i1/jg==
X-Google-Smtp-Source: AGHT+IHzUI1Im1snzCFzM5RQwYCtKBn7cwxteIW1aZvkao3MVxiIiVc9u9i0M9A0d+Cp6y5qo0xOANrs7lr5X7V5Oko=
X-Received: by 2002:a05:6512:3da3:b0:510:db4:9688 with SMTP id
 k35-20020a0565123da300b005100db49688mr634642lfv.168.1706101964189; Wed, 24
 Jan 2024 05:12:44 -0800 (PST)
MIME-Version: 1.0
References: <CAO-mL=yvVWjnOHSFSqcrknoXOqk-N3JY76qObQnzftrkmsq6xw@mail.gmail.com>
 <5309e7d3-7b3c-4522-99dc-bbd7734aeb34@suse.com>
In-Reply-To: <5309e7d3-7b3c-4522-99dc-bbd7734aeb34@suse.com>
From: Kelly Choi <kelly.choi@cloud.com>
Date: Wed, 24 Jan 2024 13:12:08 +0000
Message-ID: <CAO-mL=y1Sn2i0mafzGfRM6nWwmq+O6JcGs86kGqxT-315vQwKg@mail.gmail.com>
Subject: Re: Community Process Group - Proposal
To: Jan Beulich <jbeulich@suse.com>
Cc: committers@xenproject.org, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000086d956060fb0d10e"

--00000000000086d956060fb0d10e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

- AB

Hi Jan,
Please see my reply to the points below

Many thanks,
Kelly Choi

Community Manager
Xen Project


On Mon, Jan 22, 2024 at 10:32=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:

> On 17.01.2024 18:10, Kelly Choi wrote:
> > Hi everyone,
> >
> > I've spent a bit of time talking to various individuals and the advisor=
y
> > board about setting up a new Community Process Group.
> >
> > A survey was recently conducted to identify how the community as a whol=
e
> > feels about a certain situation. It was not intended to ban specific
> > wording or create a policy to do so, but more to give context that the
> > community has a wide range of ideas, and individuals may agree and
> disagree
> > a lot more frequently than we as individuals might think. It helps us
> > understand that as a community there are many situations where it is no=
t
> > clear. As such, the results indicated a very even split among the
> > community, which indicates a larger problem as we may not always come t=
o
> > agreement.
> >
> > There is obvious frustration with how certain matters are handled, as
> some
> > members may want the project to move faster, whereas others like to tak=
e
> a
> > cautious approach. Given we are an open source project, differences in
> > opinion are likely to happen and what we don=E2=80=99t want to do is ca=
use
> further
> > frustration.
> >
> > *This is where I would like to propose the idea of a =E2=80=98Community=
 Process
> > Group=E2=80=99.*
> >
> > A CPG can help as they will be able to advise members on similar issues
> > regarding community processes or appeals and decide on the best way
> > forward. To help with this process, I have consulted with various
> > individuals including some committers and conduct team members.
> >
> > *What is a CPG=E2=80=99s purpose?*
> > In the first instance, we would expect an informal vote resolves most
> > disagreements. However, there will be certain circumstances where the
> > outcome is not always agreed on.
> >
> > A CPG will be your second point of call, where you can escalate matters
> > quickly for a democratic solution.
>
> Between informal voting and this "second point of call", where does
> formal voting go?
>

Formal voting among committers will still exist in matters related to
technical decisions. The CPG handles disputes around processes and areas
where there are disagreements that can cause frustration around the
community, but don't necessarily break the code of conduct. For example,
naming conventions or how to move forward in cases of non-actionable
feedback.

>
> > Their purpose is to resolve process issues and informal vote appeals to
> > avoid matters going to a formal vote, but also act as a representative =
on
> > behalf of others in the community on future matters.
> >
> > For example:
> >
> >    - Naming conventions
> >    - Whether feedback requesting changes on a patch series is acceptabl=
e
> >    - How to move forward in case of non-actionable feedback to a patch
> >    series
> >    - How to move forward when a contributor or reviewer has not been
> >    responsive
> >    - Policy questions not related to the code of conduct
> >
> > *What is their role and responsibility?*
> >
> > The CPG has the authority to propose a resolution to situations where
> there
> > are disagreements, that don=E2=80=99t involve large technical decisions=
. Their
> > decision proposed should be accepted as final since members will have
> > discussed the best steps and come to a consensus vote.
> >
> > The CPG does not aim to replace the committers' authority or the adviso=
ry
> > board but instead holds the authority to make decisions that are in the
> > best interest of the community in relation to processes. Committers sti=
ll
> > hold the power should there be a formal escalation regarding technical
> > decisions, but this would be extremely rare. Advisory Board members hol=
d
> > the final power regarding project and business-wide decisions.
>
> Nevertheless it doesn't become clear to me how adding yet another authori=
ty
> besides the committers will actually help.
>

We've seen cases where committers can disagree, and rather than calling a
formal vote each time among those that disagree, the wider community can
help provide clarity on the best steps forward.
The individuals in this CPG aim to help represent wider collective feedback
and prevent disagreements from coming to a standstill, which we have seen
in the past.

>
> > *How are members selected?*
> > The CPG will be composed of 5 randomly selected members in total.
> > An odd number has been purposely selected to avoid an impasse during
> > decisions.
> >
> > The criteria:
> > Individual members must be active contributors and are willing to help
> the
> > community succeed. As such they must be a part of the following groups:
> >
> >    - Committers
> >    - Active Maintainers: maintainers with >=3D 20 reviews in the last 2
> >    releases
> >    - Active Contributors: contributors with >=3D 10 commits in the last=
 2
> >    releases
>
> I'm afraid I can't leave this uncommented, as matching a common pattern
> I'm generally unhappy with. Whatever the numbers you select in such
> criteria, they'll open up an easy road for faking. At the same time it
> of course is difficult to come up with any non-numeric or not-only-
> numeric criteria. For example, I'd be heavily inclined to ask that
> "non-trivial" be added to both of the numbers. Yet then there arises a
> judgement issue: What's non-trivial can be entirely different
> depending on who you ask.
>
> What definitely needs clarifying is what "review" is: Are R-b tags
> counted, or is it the number of replies sent commenting on patches?
>

Please see Stefano's reply

>
> > Future rotations of CPG members:
> > New members will be selected randomly for each new release to ensure
> > fairness.
> >
> > *Expectations*
> > CPG members are expected to use their best judgement of what is best fo=
r
> > the community in terms of conflict resolution and process improvements.
> > They can propose an outcome that progresses the project forward.
> > The CPG is also expected to address wider concerns, feedback, and ideas
> > during a monthly meeting with all community members.
> >
> > For example:
> >
> >    - If someone is displaying repeated concerning behaviour that disrup=
ts
> >    the community, members can ask the CPG for help on a solution. (This
> is
> >    different from a code of conduct violation which would be for seriou=
s
> >    offences only.)
> >    - Help drive discussions on how much we deviate from technical
> >    specifications
> >
> > *Next steps*
> > Given this suggestion is a big change in what I hope is a positive
> > direction, we will require your feedback and a final formal vote on the
> > process, before it is implemented into the governance policies. The
> > specific wording can be decided after this proposal.
> >
> > This will hopefully help us overcome some of the frustrations and issue=
s
> we
> > have seen in the community from a difference in opinion as a collective
> > discussion will now be made. Should we need to, the process can be
> reviewed
> > to improve at later stages.
>
> Related to what I said earlier: Should it turn out that disagreement with=
in
> the CPG is difficult to deal with, will we then gain yet another authorit=
y?
> Imo before adding such a new instance, it wants properly sorting
> - why with what we already have we can't deal with the (supposedly few)
>   situations, and
> - in how far introducing a new instance will (likely) once and for all
>   avoid similar situations arising again, just one layer up (i.e. to make
>   sure there's no scalability issue, due to proliferation of instances).
>

If we are looking at the current landscape, open-source projects tend to
have disagreements as individuals will have varying opinions.
When committers are at a standstill, it tends to be because we cannot agree
on an outcome. As we have seen in the past, there are situations where
members have disagreed even during an informal vote. Those matters wouldn't
be appropriate for a formal vote either, and we previously didn't have
anything in between to move those disputes forward. I appreciate it adds
another layer of complexity but given that the CPG is representative of the
community, their decision should be the one that stands to help the project
progress. This also helps give a voice to the many members in our
community, who are passionate about improving Xen. Until we try something
new, there is no guarantee that staying stagnant will improve existing
conflict.


> Jan
>

--00000000000086d956060fb0d10e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">- AB<div><br></div><div>Hi Jan,=C2=A0</di=
v><div>Please see my reply to the points below=C2=A0</div><div><br clear=3D=
"all"><div><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div=
>Many thanks,</div><div>Kelly Choi</div><div><br></div><div><div style=3D"c=
olor:rgb(136,136,136)">Community Manager</div><div style=3D"color:rgb(136,1=
36,136)">Xen Project=C2=A0<br></div></div></div></div></div><br></div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mo=
n, Jan 22, 2024 at 10:32=E2=80=AFAM Jan Beulich &lt;<a href=3D"mailto:jbeul=
ich@suse.com">jbeulich@suse.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On 17.01.2024 18:10, Kelly Choi wrote:<br>
&gt; Hi everyone,<br>
&gt; <br>
&gt; I&#39;ve spent a bit of time talking to various individuals and the ad=
visory<br>
&gt; board about setting up a new Community Process Group.<br>
&gt; <br>
&gt; A survey was recently conducted to identify how the community as a who=
le<br>
&gt; feels about a certain situation. It was not intended to ban specific<b=
r>
&gt; wording or create a policy to do so, but more to give context that the=
<br>
&gt; community has a wide range of ideas, and individuals may agree and dis=
agree<br>
&gt; a lot more frequently than we as individuals might think. It helps us<=
br>
&gt; understand that as a community there are many situations where it is n=
ot<br>
&gt; clear. As such, the results indicated a very even split among the<br>
&gt; community, which indicates a larger problem as we may not always come =
to<br>
&gt; agreement.<br>
&gt; <br>
&gt; There is obvious frustration with how certain matters are handled, as =
some<br>
&gt; members may want the project to move faster, whereas others like to ta=
ke a<br>
&gt; cautious approach. Given we are an open source project, differences in=
<br>
&gt; opinion are likely to happen and what we don=E2=80=99t want to do is c=
ause further<br>
&gt; frustration.<br>
&gt; <br>
&gt; *This is where I would like to propose the idea of a =E2=80=98Communit=
y Process<br>
&gt; Group=E2=80=99.*<br>
&gt; <br>
&gt; A CPG can help as they will be able to advise members on similar issue=
s<br>
&gt; regarding community processes or appeals and decide on the best way<br=
>
&gt; forward. To help with this process, I have consulted with various<br>
&gt; individuals including some committers and conduct team members.<br>
&gt; <br>
&gt; *What is a CPG=E2=80=99s purpose?*<br>
&gt; In the first instance, we would expect an informal vote resolves most<=
br>
&gt; disagreements. However, there will be certain circumstances where the<=
br>
&gt; outcome is not always agreed on.<br>
&gt; <br>
&gt; A CPG will be your second point of call, where you can escalate matter=
s<br>
&gt; quickly for a democratic solution.<br>
<br>
Between informal voting and this &quot;second point of call&quot;, where do=
es<br>
formal voting go?<br></blockquote><div><br></div><div>Formal voting among c=
ommitters will still exist in matters related to technical decisions. The C=
PG handles disputes around processes and areas where there are disagreement=
s that can cause frustration around the community, but don&#39;t necessaril=
y break the code of conduct. For example, naming conventions or how to move=
 forward in cases of non-actionable feedback.=C2=A0=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
&gt; Their purpose is to resolve process issues and informal vote appeals t=
o<br>
&gt; avoid matters going to a formal vote, but also act as a representative=
 on<br>
&gt; behalf of others in the community on future matters.<br>
&gt; <br>
&gt; For example:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 - Naming conventions<br>
&gt;=C2=A0 =C2=A0 - Whether feedback requesting changes on a patch series i=
s acceptable<br>
&gt;=C2=A0 =C2=A0 - How to move forward in case of non-actionable feedback =
to a patch<br>
&gt;=C2=A0 =C2=A0 series<br>
&gt;=C2=A0 =C2=A0 - How to move forward when a contributor or reviewer has =
not been<br>
&gt;=C2=A0 =C2=A0 responsive<br>
&gt;=C2=A0 =C2=A0 - Policy questions not related to the code of conduct<br>
&gt; <br>
&gt; *What is their role and responsibility?*<br>
&gt; <br>
&gt; The CPG has the authority to propose a resolution to situations where =
there<br>
&gt; are disagreements, that don=E2=80=99t involve large technical decision=
s. Their<br>
&gt; decision proposed should be accepted as final since members will have<=
br>
&gt; discussed the best steps and come to a consensus vote.<br>
&gt; <br>
&gt; The CPG does not aim to replace the committers&#39; authority or the a=
dvisory<br>
&gt; board but instead holds the authority to make decisions that are in th=
e<br>
&gt; best interest of the community in relation to processes. Committers st=
ill<br>
&gt; hold the power should there be a formal escalation regarding technical=
<br>
&gt; decisions, but this would be extremely rare. Advisory Board members ho=
ld<br>
&gt; the final power regarding project and business-wide decisions.<br>
<br>
Nevertheless it doesn&#39;t become clear to me how adding yet another autho=
rity<br>
besides the committers will actually help.<br></blockquote><div><br></div><=
div>We&#39;ve seen cases where committers can disagree, and rather than cal=
ling a formal vote each time among those that disagree, the wider community=
 can help provide clarity on the best steps forward.=C2=A0</div><div>The in=
dividuals in this CPG aim to help represent wider collective feedback and p=
revent disagreements from coming to a standstill, which we have seen in the=
 past.=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; *How are members selected?*<br>
&gt; The CPG will be composed of 5 randomly selected members in total.<br>
&gt; An odd number has been purposely selected to avoid an impasse during<b=
r>
&gt; decisions.<br>
&gt; <br>
&gt; The criteria:<br>
&gt; Individual members must be active contributors and are willing to help=
 the<br>
&gt; community succeed. As such they must be a part of the following groups=
:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 - Committers<br>
&gt;=C2=A0 =C2=A0 - Active Maintainers: maintainers with &gt;=3D 20 reviews=
 in the last 2<br>
&gt;=C2=A0 =C2=A0 releases<br>
&gt;=C2=A0 =C2=A0 - Active Contributors: contributors with &gt;=3D 10 commi=
ts in the last 2<br>
&gt;=C2=A0 =C2=A0 releases<br>
<br>
I&#39;m afraid I can&#39;t leave this uncommented, as matching a common pat=
tern<br>
I&#39;m generally unhappy with. Whatever the numbers you select in such<br>
criteria, they&#39;ll open up an easy road for faking. At the same time it<=
br>
of course is difficult to come up with any non-numeric or not-only-<br>
numeric criteria. For example, I&#39;d be heavily inclined to ask that<br>
&quot;non-trivial&quot; be added to both of the numbers. Yet then there ari=
ses a<br>
judgement issue: What&#39;s non-trivial can be entirely different<br>
depending on who you ask.<br>
<br>
What definitely needs clarifying is what &quot;review&quot; is: Are R-b tag=
s<br>
counted, or is it the number of replies sent commenting on patches?<br></bl=
ockquote><div><br></div><div>Please see Stefano&#39;s reply=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; Future rotations of CPG members:<br>
&gt; New members will be selected randomly for each new release to ensure<b=
r>
&gt; fairness.<br>
&gt; <br>
&gt; *Expectations*<br>
&gt; CPG members are expected to use their best judgement of what is best f=
or<br>
&gt; the community in terms of conflict resolution and process improvements=
.<br>
&gt; They can propose an outcome that progresses the project forward.<br>
&gt; The CPG is also expected to address wider concerns, feedback, and idea=
s<br>
&gt; during a monthly meeting with all community members.<br>
&gt; <br>
&gt; For example:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 - If someone is displaying repeated concerning behaviour =
that disrupts<br>
&gt;=C2=A0 =C2=A0 the community, members can ask the CPG for help on a solu=
tion. (This is<br>
&gt;=C2=A0 =C2=A0 different from a code of conduct violation which would be=
 for serious<br>
&gt;=C2=A0 =C2=A0 offences only.)<br>
&gt;=C2=A0 =C2=A0 - Help drive discussions on how much we deviate from tech=
nical<br>
&gt;=C2=A0 =C2=A0 specifications<br>
&gt; <br>
&gt; *Next steps*<br>
&gt; Given this suggestion is a big change in what I hope is a positive<br>
&gt; direction, we will require your feedback and a final formal vote on th=
e<br>
&gt; process, before it is implemented into the governance policies. The<br=
>
&gt; specific wording can be decided after this proposal.<br>
&gt; <br>
&gt; This will hopefully help us overcome some of the frustrations and issu=
es we<br>
&gt; have seen in the community from a difference in opinion as a collectiv=
e<br>
&gt; discussion will now be made. Should we need to, the process can be rev=
iewed<br>
&gt; to improve at later stages.<br>
<br>
Related to what I said earlier: Should it turn out that disagreement within=
<br>
the CPG is difficult to deal with, will we then gain yet another authority?=
<br>
Imo before adding such a new instance, it wants properly sorting<br>
- why with what we already have we can&#39;t deal with the (supposedly few)=
<br>
=C2=A0 situations, and<br>
- in how far introducing a new instance will (likely) once and for all<br>
=C2=A0 avoid similar situations arising again, just one layer up (i.e. to m=
ake<br>
=C2=A0 sure there&#39;s no scalability issue, due to proliferation of insta=
nces).<br></blockquote><div><br></div><div>If we are looking at the current=
 landscape, open-source projects tend to have disagreements as individuals =
will have varying opinions.=C2=A0</div><div>When committers are at a stands=
till, it tends to be because we cannot agree on an outcome. As we have seen=
 in the past, there are situations where members have disagreed even during=
 an informal vote. Those matters wouldn&#39;t be appropriate for a formal v=
ote either, and we previously didn&#39;t have anything in between to move t=
hose disputes forward. I appreciate it adds another layer of complexity but=
 given that the CPG is representative of the community, their decision shou=
ld be the one that stands to help the project progress. This also helps giv=
e a voice to the many members in our community, who are passionate about im=
proving Xen. Until we try something new, there is no guarantee that staying=
 stagnant will improve existing conflict.=C2=A0</div><div><br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
<br>
Jan<br>
</blockquote></div></div>

--00000000000086d956060fb0d10e--

