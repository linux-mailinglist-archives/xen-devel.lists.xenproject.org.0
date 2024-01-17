Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1EF830BBF
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 18:11:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668544.1040807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ9Ro-0002es-CQ; Wed, 17 Jan 2024 17:11:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668544.1040807; Wed, 17 Jan 2024 17:11:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ9Ro-0002cW-8V; Wed, 17 Jan 2024 17:11:28 +0000
Received: by outflank-mailman (input) for mailman id 668544;
 Wed, 17 Jan 2024 17:11:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dRDO=I3=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1rQ9Rm-0002cL-RW
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2024 17:11:26 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71fd0e08-b55b-11ee-98f2-6d05b1d4d9a1;
 Wed, 17 Jan 2024 18:11:25 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a2d7e2e7fe0so678332066b.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jan 2024 09:11:25 -0800 (PST)
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
X-Inumbo-ID: 71fd0e08-b55b-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1705511485; x=1706116285; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nq+2887gg+xtjC3MkkUi5eTxPb1C4M1HFnUIAVlcTyM=;
        b=Wbw7hnEIVSob0LAtM889qHWn9bUi7Akrzt0tMsRY75dyvtdG+OxYL3pVcGBcjxXdZ6
         vDWXB/KoG/kN79XzqOaLdhMxWB9t3xXythiEddzzZHx88cSIZk1pOlzOtzgjv+m8PRxT
         fXs4jdsz2Vj3pc4Z70eBOGRlXN2mwewikSkuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705511485; x=1706116285;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nq+2887gg+xtjC3MkkUi5eTxPb1C4M1HFnUIAVlcTyM=;
        b=hnPUw4siWH7ZdCyOMzsMJY6V5fwGUq0JuVzEgiHZNv5PmzACJuB4a6Xw59vy0S9AES
         kfuPZTCdJH3YUY4VcBBOiZ8MPTYf8mpww3Qzqcv5ImWrc6r1HfLYFlvtM8sNJ7sbryqk
         zAC7ernezYDa0ypzBDRL9ycezZM5OVIuiEISN32UgyJKAyYQ4ctGq2m8S1Jmaz6YsoEf
         83vj5SE4rZf6B9ydL+mD4VkO/N5bNfWES0EIVVzQE6GPw42bx4GNaPZOfJeaDwTzu6Zy
         6LKoTNi9j8Q5Gbat6pcXtelHdgN7NsSapWktl2gUr/M9ke/7Qcu+BRn+R2PViBSqi2J0
         06Fw==
X-Gm-Message-State: AOJu0Yw2v5j9ekLv/PwZVjNyzzmYINb0/vGdYTpeRja6fsDL99r/eHKn
	8MUlf4DzcALoldY4wAS10jHBspfv97KzSMNfGwKdiO8C0kVMEh4lnZyQf0xxcDI=
X-Google-Smtp-Source: AGHT+IErvU+F/0uGwKGzc7WHIdPXsMHg69ALK7qH6o8L7zcSzgy5kkL7NRz8jPASdxibxenmZ9jp1LLlu+bejQtlVP0=
X-Received: by 2002:a17:906:b389:b0:a2e:c311:c6fe with SMTP id
 uh9-20020a170906b38900b00a2ec311c6femr998127ejc.10.1705511484640; Wed, 17 Jan
 2024 09:11:24 -0800 (PST)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Wed, 17 Jan 2024 17:10:48 +0000
Message-ID: <CAO-mL=yvVWjnOHSFSqcrknoXOqk-N3JY76qObQnzftrkmsq6xw@mail.gmail.com>
Subject: Community Process Group - Proposal
To: xen-devel@lists.xenproject.org, xen-announce@lists.xenproject.org
Cc: committers@xenproject.org, advisory-board@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000033e5d0060f2756a8"

--00000000000033e5d0060f2756a8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

I've spent a bit of time talking to various individuals and the advisory
board about setting up a new Community Process Group.

A survey was recently conducted to identify how the community as a whole
feels about a certain situation. It was not intended to ban specific
wording or create a policy to do so, but more to give context that the
community has a wide range of ideas, and individuals may agree and disagree
a lot more frequently than we as individuals might think. It helps us
understand that as a community there are many situations where it is not
clear. As such, the results indicated a very even split among the
community, which indicates a larger problem as we may not always come to
agreement.

There is obvious frustration with how certain matters are handled, as some
members may want the project to move faster, whereas others like to take a
cautious approach. Given we are an open source project, differences in
opinion are likely to happen and what we don=E2=80=99t want to do is cause =
further
frustration.

*This is where I would like to propose the idea of a =E2=80=98Community Pro=
cess
Group=E2=80=99.*

A CPG can help as they will be able to advise members on similar issues
regarding community processes or appeals and decide on the best way
forward. To help with this process, I have consulted with various
individuals including some committers and conduct team members.

*What is a CPG=E2=80=99s purpose?*
In the first instance, we would expect an informal vote resolves most
disagreements. However, there will be certain circumstances where the
outcome is not always agreed on.

A CPG will be your second point of call, where you can escalate matters
quickly for a democratic solution.

Their purpose is to resolve process issues and informal vote appeals to
avoid matters going to a formal vote, but also act as a representative on
behalf of others in the community on future matters.

For example:

   - Naming conventions
   - Whether feedback requesting changes on a patch series is acceptable
   - How to move forward in case of non-actionable feedback to a patch
   series
   - How to move forward when a contributor or reviewer has not been
   responsive
   - Policy questions not related to the code of conduct

*What is their role and responsibility?*

The CPG has the authority to propose a resolution to situations where there
are disagreements, that don=E2=80=99t involve large technical decisions. Th=
eir
decision proposed should be accepted as final since members will have
discussed the best steps and come to a consensus vote.

The CPG does not aim to replace the committers' authority or the advisory
board but instead holds the authority to make decisions that are in the
best interest of the community in relation to processes. Committers still
hold the power should there be a formal escalation regarding technical
decisions, but this would be extremely rare. Advisory Board members hold
the final power regarding project and business-wide decisions.

*How are members selected?*
The CPG will be composed of 5 randomly selected members in total.
An odd number has been purposely selected to avoid an impasse during
decisions.

The criteria:
Individual members must be active contributors and are willing to help the
community succeed. As such they must be a part of the following groups:

   - Committers
   - Active Maintainers: maintainers with >=3D 20 reviews in the last 2
   releases
   - Active Contributors: contributors with >=3D 10 commits in the last 2
   releases

Future rotations of CPG members:
New members will be selected randomly for each new release to ensure
fairness.

*Expectations*
CPG members are expected to use their best judgement of what is best for
the community in terms of conflict resolution and process improvements.
They can propose an outcome that progresses the project forward.
The CPG is also expected to address wider concerns, feedback, and ideas
during a monthly meeting with all community members.

For example:

   - If someone is displaying repeated concerning behaviour that disrupts
   the community, members can ask the CPG for help on a solution. (This is
   different from a code of conduct violation which would be for serious
   offences only.)
   - Help drive discussions on how much we deviate from technical
   specifications

*Next steps*
Given this suggestion is a big change in what I hope is a positive
direction, we will require your feedback and a final formal vote on the
process, before it is implemented into the governance policies. The
specific wording can be decided after this proposal.

This will hopefully help us overcome some of the frustrations and issues we
have seen in the community from a difference in opinion as a collective
discussion will now be made. Should we need to, the process can be reviewed
to improve at later stages.

I welcome your feedback as a community on this proposal.

Many thanks,
Kelly Choi

Community Manager
Xen Project

--00000000000033e5d0060f2756a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi everyone,</div><div><br></div><div>I&#39;ve spent =
a bit of time talking to various individuals and the advisory board about s=
etting up a new Community Process Group.=C2=A0</div><div><br></div><div>A s=
urvey was recently conducted to identify how the community as a whole feels=
 about a certain situation. It was not intended to ban specific wording or =
create a policy to do so, but more to give context that the community has a=
 wide range of ideas, and individuals may agree and disagree a lot more fre=
quently than we as individuals might think. It helps us understand that as =
a community there are many situations where it is not clear. As such, the r=
esults indicated a very even split among the community, which indicates a l=
arger problem as we may not always come to agreement.<br><br>There is obvio=
us frustration with how certain matters are handled, as some members may wa=
nt the project to move faster, whereas others like to take a cautious appro=
ach. Given we are an open source project, differences in opinion are likely=
 to happen and what we don=E2=80=99t want to do is cause further frustratio=
n.<br><br><b>This is where I would like to propose the idea of a =E2=80=98C=
ommunity Process Group=E2=80=99.</b><br><br>A=C2=A0<span>CPG</span>=C2=A0ca=
n help as they will be able to advise members on similar issues regarding c=
ommunity processes or appeals and decide on the best way forward. To help w=
ith this process, I have consulted with various individuals including some =
committers and conduct team members.<br><b><br>What is a=C2=A0<span>CPG</sp=
an>=E2=80=99s purpose?</b><br>In the first instance, we would expect an inf=
ormal vote resolves most disagreements. However, there will be certain circ=
umstances where the outcome is not always agreed on.<br><br>A=C2=A0<span>CP=
G</span>=C2=A0will be your second point of call, where you can escalate mat=
ters quickly for a democratic solution.<br><br>Their purpose is to resolve =
process issues and informal vote appeals to avoid matters going to a formal=
 vote, but also act as a representative on behalf of others in the communit=
y on future matters. =C2=A0<br><br>For example:<br><ul><li style=3D"margin-=
left:15px">Naming conventions</li><li style=3D"margin-left:15px">Whether fe=
edback requesting changes on a patch series is acceptable</li><li style=3D"=
margin-left:15px">How to move forward in case of non-actionable feedback to=
 a patch series</li><li style=3D"margin-left:15px">How to move forward when=
 a contributor or reviewer has not been responsive</li><li style=3D"margin-=
left:15px">Policy questions not related to the code of conduct</li></ul><b>=
What is their role and responsibility?</b><br><br>The=C2=A0<span>CPG</span>=
=C2=A0has the authority to propose a resolution to situations where there a=
re disagreements, that don=E2=80=99t involve large technical decisions. The=
ir decision proposed should be accepted as final since members will have di=
scussed the best steps and come to a consensus vote.<br><br>The=C2=A0<span>=
CPG</span>=C2=A0does not aim to replace the committers&#39; authority or th=
e advisory board but instead holds the authority to make decisions that are=
 in the best interest of the community in relation to processes. Committers=
 still hold the power should there be a formal escalation regarding technic=
al decisions, but this would be extremely rare. Advisory Board members hold=
 the final power regarding project and business-wide decisions.<br><br><b>H=
ow are members selected?</b><br>The=C2=A0<span>CPG</span>=C2=A0will be comp=
osed of 5 randomly selected members in total.<br>An odd number has been pur=
posely selected to avoid an impasse during decisions.<br><br>The criteria:<=
br>Individual members must be active contributors and are willing to help t=
he community succeed. As such they must be a part of the following groups:<=
br><ul><li style=3D"margin-left:15px">Committers</li><li style=3D"margin-le=
ft:15px">Active Maintainers: maintainers with &gt;=3D 20 reviews in the las=
t 2 releases</li><li style=3D"margin-left:15px">Active Contributors: contri=
butors with &gt;=3D 10 commits in the last 2 releases</li></ul>Future rotat=
ions of=C2=A0<span>CPG</span>=C2=A0members:<br>New members will be selected=
 randomly for each new release to ensure fairness.<br><br><b>Expectations</=
b><br><span>CPG</span>=C2=A0members are expected to use their best judgemen=
t of what is best for the community in terms of conflict resolution and pro=
cess improvements. They can propose an outcome that progresses the project =
forward.<br>The=C2=A0<span>CPG</span>=C2=A0is also expected to address wide=
r concerns, feedback, and ideas during a monthly meeting with all community=
 members.<br><br>For example:<br><ul><li style=3D"margin-left:15px">If some=
one is displaying repeated concerning behaviour that disrupts the community=
, members can ask the=C2=A0<span>CPG</span>=C2=A0for help on a solution. (T=
his is different from a code of conduct violation which would be for seriou=
s offences only.)</li><li style=3D"margin-left:15px">Help drive discussions=
 on how much we deviate from technical specifications</li></ul><b>Next step=
s</b><br>Given this suggestion is a big change in what I hope is a positive=
 direction, we will require your feedback and a final formal vote on the pr=
ocess, before it is implemented into the governance policies. The specific =
wording can be decided after this proposal.</div><div><br></div><div>This w=
ill hopefully help us overcome some of the frustrations and issues we have =
seen in the community from a difference in opinion as a collective discussi=
on will now be made. Should we need to, the process can be reviewed to impr=
ove at later stages.<br></div><div><br></div><div>I welcome your feedback a=
s a community on this proposal.=C2=A0<br><br></div><div><div dir=3D"ltr" cl=
ass=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"=
><div>Many thanks,</div><div>Kelly Choi</div><div><br></div><div><div style=
=3D"color:rgb(136,136,136)">Community Manager</div><div style=3D"color:rgb(=
136,136,136)">Xen Project=C2=A0<br></div></div></div></div></div></div>

--00000000000033e5d0060f2756a8--

