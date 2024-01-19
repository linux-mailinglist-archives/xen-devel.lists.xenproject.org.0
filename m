Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CB7832D58
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jan 2024 17:39:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669105.1041731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQrsJ-0006sN-6W; Fri, 19 Jan 2024 16:37:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669105.1041731; Fri, 19 Jan 2024 16:37:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQrsJ-0006ps-3c; Fri, 19 Jan 2024 16:37:47 +0000
Received: by outflank-mailman (input) for mailman id 669105;
 Fri, 19 Jan 2024 16:37:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jo6V=I5=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1rQrsH-0006pj-4A
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2024 16:37:45 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10268793-b6e9-11ee-9b0f-b553b5be7939;
 Fri, 19 Jan 2024 17:37:41 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-55817a12ad8so1193891a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jan 2024 08:37:41 -0800 (PST)
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
X-Inumbo-ID: 10268793-b6e9-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1705682260; x=1706287060; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Dtt1XAW+DZfm925wcYuRAbgJ+P2Ik8LAxBkmFV2iZFI=;
        b=RmE45aU1xbkxqrF6IQRRCLBKmXiL0YUKLO7Y++kc84j28gH0XqkwbjeRpYGoVgLkNh
         B8JORCuITOm5o3U0iwhttvPFXKXm9jOLVxyBikwLWnfqSagiCmukVXcTpVL0DLBiw5mB
         2RjtX5yBtxFc0AInrRJ4HWqiOcg9bhtGJ5M3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705682260; x=1706287060;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dtt1XAW+DZfm925wcYuRAbgJ+P2Ik8LAxBkmFV2iZFI=;
        b=BaSJDsMs/Zxf6+AiL7T61le/8/sT1dILwBG64ZdnwnxwKJUnND43bBs6bELOmediM0
         JVtSD2CHisV497gFy9X5TuwomVyhveL/sF6O2PVv3LgIeZGqHv5qrQVZ6kmKIFMH7wfq
         +WDGScjAwIQF3vqnkftcKxyqSJRRnnBWSVZ5CKyN7dKFRFaYagNupHeeQKZEMrXCCSsp
         bmjC82KdX4PtPOPPoQ47EfwWhy10Xw41VGZfl6wPexoTyir6G+p3hi4clNh/1IZl1neF
         5X4UBA18ra4usI9/tS5OpVLf2dbe7NYL5HE5aax8UKmuvfTClt6GSqMUj7vNzx6damho
         KTiA==
X-Gm-Message-State: AOJu0YxdoipR88bQWaaAQBUAMz3YqsTMZpB1cDoPKRVxPzOjbPUFbFVG
	ME8aBv05WsuoRFbwNhLYyTP88hjw7v3ss3qw0vwstbbRMZlrvSu0myBeaM1zotLS5ztL8g9JnJs
	9KDMd0CAItaCBQZIKP45OrLyW5YB1vFdMz4AOKw1riWB07Z+BvV98M/1B
X-Google-Smtp-Source: AGHT+IF49d6hzdACgpDXFFhGV48xsUKLL1Wuel2uzgDSb90grb0F1ng4m7vTrlOqn8k97A5mOxxgzGeYJUoIF2rHbo0=
X-Received: by 2002:a17:906:34d1:b0:a28:e3b6:a199 with SMTP id
 h17-20020a17090634d100b00a28e3b6a199mr22590ejb.38.1705682260427; Fri, 19 Jan
 2024 08:37:40 -0800 (PST)
MIME-Version: 1.0
References: <CAO-mL=yvVWjnOHSFSqcrknoXOqk-N3JY76qObQnzftrkmsq6xw@mail.gmail.com>
 <509c9419-650a-4a7c-83e4-7a5204c53645@vates.tech>
In-Reply-To: <509c9419-650a-4a7c-83e4-7a5204c53645@vates.tech>
From: Kelly Choi <kelly.choi@cloud.com>
Date: Fri, 19 Jan 2024 16:37:04 +0000
Message-ID: <CAO-mL=zL2gknk5OE0NBcQjoq8sE=2c=Zs+9KhzKMxKcwtx4wpA@mail.gmail.com>
Subject: Re: Community Process Group - Proposal
To: Yann Dirson <yann.dirson@vates.tech>
Cc: xen-devel@lists.xenproject.org, committers@xenproject.org
Content-Type: multipart/alternative; boundary="0000000000003b9bbf060f4f1951"

--0000000000003b9bbf060f4f1951
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yann,

See my reply below

On Thu, Jan 18, 2024 at 10:09=E2=80=AFAM Yann Dirson <yann.dirson@vates.tec=
h> wrote:

> Hi all,
>
> On 1/17/24 18:10, Kelly Choi wrote:
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
> > disagree a lot more frequently than we as individuals might think. It
> > helps us understand that as a community there are many situations where
> > it is not clear. As such, the results indicated a very even split among
> > the community, which indicates a larger problem as we may not always
> > come to agreement.
> >
> > There is obvious frustration with how certain matters are handled, as
> > some members may want the project to move faster, whereas others like t=
o
> > take a cautious approach. Given we are an open source project,
> > differences in opinion are likely to happen and what we don=E2=80=99t w=
ant to do
> > is cause further frustration.
> >
> > *This is where I would like to propose the idea of a =E2=80=98Community=
 Process
> > Group=E2=80=99.*
>
> That made me look for a list of official roles in the project, which I
> found at [0].  How up-to-date is this list?  The Release Manager role is
> mentioned there but not described, the Community Manager role is not
> mentioned at all, and the only link to get project leadership info [1]
> redirects to unrelated information.
>
> [0] https://xenproject.org/developers/governance/#roles-local
> [1] https://xenproject.org/developers/teams/hypervisor
>
> I feel it would be necessary to have a clear view on the current
> situation, before adding more structures.
>

Aspects of the information on the website are outdated and do require
reviewing as part of a wider governance update.
However, the majority of the information such as the roles of committers is
still accurate. In this specific instance, the CPG would act fairly similar
to a project lead in terms of progressing the project forward. Rather than
it being one person, it will be a collective group of elected members. From
my understanding, we haven't had a project lead for a very long time within
the project and this was before the governance was formalized. If the
community is happy, we can replace the project lead role with the CPG.

For clarification, this is the current governance policy in relation to the
project lead/leadership team:
*"Sub-projects and teams hosted on Xenproject.org are not democracies but
meritocracies. In situations where there is disagreement on issues related
to the day-to-day running of the project, the project leadership team is
expected to act as referee and make a decision on behalf of the community.
Projects leadership teams can choose to delegate entire classes of conflict
resolution issues to community members and/or the project lead (e.g. the
project can choose to delegate refereeing on committer disagreements to the
project lead; or it could choose a specific committer to always act as
referee amongst a group of committers). Any such delegation needs to be
approved as normal and has to be documented.*



*Should a project leadership team become dysfunctional or paralysed, the
project leadership team or project lead should work with the community
manager or advisory board to find a way forward.In situations where the
entire Xen Project community becomes paralysed the impacted project
leadership teams or project leads should work with the community manager or
advisory board to find a way forward.*

I will take your feedback on board to add descriptions to the release
manager role and propose this to the mailing list.
You will find the description of the community manager role on the page
under 'Xen Project wide roles'.


>
> >
> > A CPG can help as they will be able to advise members on similar issues
> > regarding community processes or appeals and decide on the best way
> > forward. To help with this process, I have consulted with various
> > individuals including some committers and conduct team members.
> > *
> > What is a CPG=E2=80=99s purpose?*
> > In the first instance, we would expect an informal vote resolves most
> > disagreements. However, there will be certain circumstances where the
> > outcome is not always agreed on.
> >
> > A CPG will be your second point of call, where you can escalate matters
> > quickly for a democratic solution.
> >
> > Their purpose is to resolve process issues and informal vote appeals to
> > avoid matters going to a formal vote, but also act as a representative
> > on behalf of others in the community on future matters.
> >
> > For example:
> >
> >   * Naming conventions
> >   * Whether feedback requesting changes on a patch series is acceptable
> >   * How to move forward in case of non-actionable feedback to a patch
> series
> >   * How to move forward when a contributor or reviewer has not been
> >     responsive
> >   * Policy questions not related to the code of conduct
> >
> > *What is their role and responsibility?*
> >
> > The CPG has the authority to propose a resolution to situations where
> > there are disagreements, that don=E2=80=99t involve large technical dec=
isions.
> > Their decision proposed should be accepted as final since members will
> > have discussed the best steps and come to a consensus vote.
> >
> > The CPG does not aim to replace the committers' authority or the
> > advisory board but instead holds the authority to make decisions that
> > are in the best interest of the community in relation to processes.
> > Committers still hold the power should there be a formal escalation
> > regarding technical decisions, but this would be extremely rare.
> > Advisory Board members hold the final power regarding project and
> > business-wide decisions.
> >
> > *How are members selected?*
> > The CPG will be composed of 5 randomly selected members in total.
> > An odd number has been purposely selected to avoid an impasse during
> > decisions.
>
> Do you have any specific idea of how "randomly selected" would work?
> I mean, having a die rolled behind closed doors is not going to help
> building trust.  Now there are rather-simple algorithms for Distributed
> Dice Rolling, like [2], but there would be a few practical details to
> make explicit.
>
> [2]
>
> https://stackoverflow.com/questions/224058/distributed-random-number-gene=
ration
>
>
I'd propose using a live random name selector on the community call, to
ensure transparency.
We would, of course, have the full names of people who fit the criteria
below before we can do this.

>
> > The criteria:
> > Individual members must be active contributors and are willing to help
> > the community succeed. As such they must be a part of the following
> groups:
> >
> >   * Committers
> >   * Active Maintainers: maintainers with >=3D 20 reviews in the last 2
> >     releases
> >   * Active Contributors: contributors with >=3D 10 commits in the last =
2
> >     releases
> >
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
> >   * If someone is displaying repeated concerning behaviour that disrupt=
s
> >     the community, members can ask the CPG for help on a solution. (Thi=
s
> >     is different from a code of conduct violation which would be for
> >     serious offences only.)
> >   * Help drive discussions on how much we deviate from technical
> >     specifications
> >
> > *Next steps*
> > Given this suggestion is a big change in what I hope is a positive
> > direction, we will require your feedback and a final formal vote on the
> > process, before it is implemented into the governance policies. The
> > specific wording can be decided after this proposal.
> >
> > This will hopefully help us overcome some of the frustrations and issue=
s
> > we have seen in the community from a difference in opinion as a
> > collective discussion will now be made. Should we need to, the process
> > can be reviewed to improve at later stages.
> >
> > I welcome your feedback as a community on this proposal.
> >
> > Many thanks,
> > Kelly Choi
> >
> > Community Manager
> > Xen Project
>
>
> Yann Dirson | Vates Platform Developer
>
> XCP-ng & Xen Orchestra - Vates solutions
>
> web: https://vates.tech
>
>

--0000000000003b9bbf060f4f1951
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Yann,</div><div dir=3D"ltr"><br></div>=
<div dir=3D"ltr">See my reply below<br clear=3D"all"><div><div dir=3D"ltr" =
class=3D"gmail_signature"><div dir=3D"ltr"><div><br></div></div></div></div=
></div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Thu, Jan 18, 2024 at 10:09=E2=80=AFAM Yann Dirson &lt;yann.dirson@vates.tec=
h&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi =
all,<br>
<br>
On 1/17/24 18:10, Kelly Choi wrote:<br>
&gt; Hi everyone,<br>
&gt; <br>
&gt; I&#39;ve spent a bit of time talking to various individuals and the ad=
visory <br>
&gt; board about setting up a new Community Process Group.<br>
&gt; <br>
&gt; A survey was recently conducted to identify how the community as a who=
le <br>
&gt; feels about a certain situation. It was not intended to ban specific <=
br>
&gt; wording or create a policy to do so, but more to give context that the=
 <br>
&gt; community has a wide range of ideas, and individuals may agree and <br=
>
&gt; disagree a lot more frequently than we as individuals might think. It =
<br>
&gt; helps us understand that as a community there are many situations wher=
e <br>
&gt; it is not clear. As such, the results indicated a very even split amon=
g <br>
&gt; the community, which indicates a larger problem as we may not always <=
br>
&gt; come to agreement.<br>
&gt; <br>
&gt; There is obvious frustration with how certain matters are handled, as =
<br>
&gt; some members may want the project to move faster, whereas others like =
to <br>
&gt; take a cautious approach. Given we are an open source project, <br>
&gt; differences in opinion are likely to happen and what we don=E2=80=99t =
want to do <br>
&gt; is cause further frustration.<br>
&gt; <br>
&gt; *This is where I would like to propose the idea of a =E2=80=98Communit=
y Process <br>
&gt; Group=E2=80=99.*<br>
<br>
That made me look for a list of official roles in the project, which I<br>
found at [0].=C2=A0 How up-to-date is this list?=C2=A0 The Release Manager =
role is<br>
mentioned there but not described, the Community Manager role is not<br>
mentioned at all, and the only link to get project leadership info [1]<br>
redirects to unrelated information.<br>
<br>
[0] <a href=3D"https://xenproject.org/developers/governance/#roles-local" r=
el=3D"noreferrer" target=3D"_blank">https://xenproject.org/developers/gover=
nance/#roles-local</a><br>
[1] <a href=3D"https://xenproject.org/developers/teams/hypervisor" rel=3D"n=
oreferrer" target=3D"_blank">https://xenproject.org/developers/teams/hyperv=
isor</a><br>
<br>
I feel it would be necessary to have a clear view on the current<br>
situation, before adding more structures.<br></blockquote><div><br></div><d=
iv>Aspects of the information on the website are outdated and do require re=
viewing as part of a wider governance update.=C2=A0</div><div>However, the =
majority of the information such as the roles of committers is still accura=
te. In this specific instance, the CPG would act fairly similar to a projec=
t lead in terms of progressing the project forward. Rather than it being on=
e person, it will be a collective group of elected members. From my underst=
anding, we haven&#39;t had a project lead for a very long time within the p=
roject and this was before the=C2=A0governance was formalized. If the commu=
nity is happy, we can replace the project lead role with the CPG.=C2=A0</di=
v><div><br></div><div>For clarification, this is the=C2=A0current governanc=
e policy in relation to the project lead/leadership team:</div><div><i>&quo=
t;Sub-projects and teams hosted on Xenproject.org are not democracies but m=
eritocracies. In situations where there is disagreement on issues related t=
o the day-to-day running of the project, the project leadership team is exp=
ected to act as referee and make a decision on behalf of the community. Pro=
jects leadership teams can choose to delegate entire classes of conflict re=
solution issues to community members and/or the project lead (e.g. the proj=
ect can choose to delegate refereeing on committer disagreements to the pro=
ject lead; or it could choose a specific committer to always act as referee=
 amongst a group of committers). Any such delegation needs to be approved a=
s normal and has to be documented.</i></div><i><br>Should a project leaders=
hip team become dysfunctional or paralysed, the project leadership team or =
project lead should work with the community manager or advisory board to fi=
nd a way forward.<br><br>In situations where the entire Xen Project communi=
ty becomes paralysed the impacted project leadership teams or project leads=
 should work with the community manager or advisory board to find a way for=
ward.</i></div><div class=3D"gmail_quote"><i><br></i><div>I will take your =
feedback on board to add descriptions to the release manager role and propo=
se this to the mailing list.=C2=A0</div><div>You will find the description =
of the community manager role on the page under &#39;Xen Project wide roles=
&#39;.=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
&gt; <br>
&gt; A CPG=C2=A0can help as they will be able to advise members on similar =
issues <br>
&gt; regarding community processes or appeals and decide on the best way <b=
r>
&gt; forward. To help with this process, I have consulted with various <br>
&gt; individuals including some committers and conduct team members.<br>
&gt; *<br>
&gt; What is a CPG=E2=80=99s purpose?*<br>
&gt; In the first instance, we would expect an informal vote resolves most =
<br>
&gt; disagreements. However, there will be certain circumstances where the =
<br>
&gt; outcome is not always agreed on.<br>
&gt; <br>
&gt; A CPG=C2=A0will be your second point of call, where you can escalate m=
atters <br>
&gt; quickly for a democratic solution.<br>
&gt; <br>
&gt; Their purpose is to resolve process issues and informal vote appeals t=
o <br>
&gt; avoid matters going to a formal vote, but also act as a representative=
 <br>
&gt; on behalf of others in the community on future matters.<br>
&gt; <br>
&gt; For example:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0* Naming conventions<br>
&gt;=C2=A0 =C2=A0* Whether feedback requesting changes on a patch series is=
 acceptable<br>
&gt;=C2=A0 =C2=A0* How to move forward in case of non-actionable feedback t=
o a patch series<br>
&gt;=C2=A0 =C2=A0* How to move forward when a contributor or reviewer has n=
ot been<br>
&gt;=C2=A0 =C2=A0 =C2=A0responsive<br>
&gt;=C2=A0 =C2=A0* Policy questions not related to the code of conduct<br>
&gt; <br>
&gt; *What is their role and responsibility?*<br>
&gt; <br>
&gt; The CPG=C2=A0has the authority to propose a resolution to situations w=
here <br>
&gt; there are disagreements, that don=E2=80=99t involve large technical de=
cisions. <br>
&gt; Their decision proposed should be accepted as final since members will=
 <br>
&gt; have discussed the best steps and come to a consensus vote.<br>
&gt; <br>
&gt; The CPG=C2=A0does not aim to replace the committers&#39; authority or =
the <br>
&gt; advisory board but instead holds the authority to make decisions that =
<br>
&gt; are in the best interest of the community in relation to processes. <b=
r>
&gt; Committers still hold the power should there be a formal escalation <b=
r>
&gt; regarding technical decisions, but this would be extremely rare. <br>
&gt; Advisory Board members hold the final power regarding project and <br>
&gt; business-wide decisions.<br>
&gt; <br>
&gt; *How are members selected?*<br>
&gt; The CPG=C2=A0will be composed of 5 randomly selected members in total.=
<br>
&gt; An odd number has been purposely selected to avoid an impasse during <=
br>
&gt; decisions.<br>
<br>
Do you have any specific idea of how &quot;randomly selected&quot; would wo=
rk?<br>
I mean, having a die rolled behind closed doors is not going to help<br>
building trust.=C2=A0 Now there are rather-simple algorithms for Distribute=
d<br>
Dice Rolling, like [2], but there would be a few practical details to<br>
make explicit.<br>
<br>
[2] <br>
<a href=3D"https://stackoverflow.com/questions/224058/distributed-random-nu=
mber-generation" rel=3D"noreferrer" target=3D"_blank">https://stackoverflow=
.com/questions/224058/distributed-random-number-generation</a><br>
<br></blockquote><div>=C2=A0</div><div>I&#39;d propose using a live random =
name selector on the community call, to ensure transparency.=C2=A0=C2=A0</d=
iv><div>We would, of course, have the full names of people who fit the crit=
eria below before we can do this.=C2=A0</div><div><br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt; The criteria:<br>
&gt; Individual members must be active contributors and are willing to help=
 <br>
&gt; the community succeed. As such they must be a part of the following gr=
oups:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0* Committers<br>
&gt;=C2=A0 =C2=A0* Active Maintainers: maintainers with &gt;=3D 20 reviews =
in the last 2<br>
&gt;=C2=A0 =C2=A0 =C2=A0releases<br>
&gt;=C2=A0 =C2=A0* Active Contributors: contributors with &gt;=3D 10 commit=
s in the last 2<br>
&gt;=C2=A0 =C2=A0 =C2=A0releases<br>
&gt; <br>
&gt; Future rotations of CPG=C2=A0members:<br>
&gt; New members will be selected randomly for each new release to ensure <=
br>
&gt; fairness.<br>
&gt; <br>
&gt; *Expectations*<br>
&gt; CPG=C2=A0members are expected to use their best judgement of what is b=
est for <br>
&gt; the community in terms of conflict resolution and process improvements=
. <br>
&gt; They can propose an outcome that progresses the project forward.<br>
&gt; The CPG=C2=A0is also expected to address wider concerns, feedback, and=
 ideas <br>
&gt; during a monthly meeting with all community members.<br>
&gt; <br>
&gt; For example:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0* If someone is displaying repeated concerning behaviour t=
hat disrupts<br>
&gt;=C2=A0 =C2=A0 =C2=A0the community, members can ask the CPG=C2=A0for hel=
p on a solution. (This<br>
&gt;=C2=A0 =C2=A0 =C2=A0is different from a code of conduct violation which=
 would be for<br>
&gt;=C2=A0 =C2=A0 =C2=A0serious offences only.)<br>
&gt;=C2=A0 =C2=A0* Help drive discussions on how much we deviate from techn=
ical<br>
&gt;=C2=A0 =C2=A0 =C2=A0specifications<br>
&gt; <br>
&gt; *Next steps*<br>
&gt; Given this suggestion is a big change in what I hope is a positive <br=
>
&gt; direction, we will require your feedback and a final formal vote on th=
e <br>
&gt; process, before it is implemented into the governance policies. The <b=
r>
&gt; specific wording can be decided after this proposal.<br>
&gt; <br>
&gt; This will hopefully help us overcome some of the frustrations and issu=
es <br>
&gt; we have seen in the community from a difference in opinion as a <br>
&gt; collective discussion will now be made. Should we need to, the process=
 <br>
&gt; can be reviewed to improve at later stages.<br>
&gt; <br>
&gt; I welcome your feedback as a community on this proposal.<br>
&gt; <br>
&gt; Many thanks,<br>
&gt; Kelly Choi<br>
&gt; <br>
&gt; Community Manager<br>
&gt; Xen Project<br>
<br>
<br>
Yann Dirson | Vates Platform Developer<br>
<br>
XCP-ng &amp; Xen Orchestra - Vates solutions<br>
<br>
web: <a href=3D"https://vates.tech" rel=3D"noreferrer" target=3D"_blank">ht=
tps://vates.tech</a><br>
<br>
</blockquote></div></div>

--0000000000003b9bbf060f4f1951--

