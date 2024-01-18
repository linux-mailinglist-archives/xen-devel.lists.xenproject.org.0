Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1B6831680
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jan 2024 11:10:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668704.1041075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQPKl-00049Y-Gh; Thu, 18 Jan 2024 10:09:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668704.1041075; Thu, 18 Jan 2024 10:09:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQPKl-00045D-E0; Thu, 18 Jan 2024 10:09:15 +0000
Received: by outflank-mailman (input) for mailman id 668704;
 Thu, 18 Jan 2024 10:09:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zNYg=I4=bounce.vates.tech=bounce-md_30504962.65a8f8c5.v1-fdd8f09f3bf04854a93c7196612d499d@srs-se1.protection.inumbo.net>)
 id 1rQPKj-00043Y-S0
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2024 10:09:13 +0000
Received: from mail134-4.atl141.mandrillapp.com
 (mail134-4.atl141.mandrillapp.com [198.2.134.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f50964d-b5e9-11ee-9b0f-b553b5be7939;
 Thu, 18 Jan 2024 11:09:10 +0100 (CET)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-4.atl141.mandrillapp.com (Mailchimp) with ESMTP id 4TFz453Tv7zlfh2m
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jan 2024 10:09:09 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 fdd8f09f3bf04854a93c7196612d499d; Thu, 18 Jan 2024 10:09:09 +0000
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
X-Inumbo-ID: 9f50964d-b5e9-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1705572549; x=1705833049;
	bh=9DqOhX66T0rS9aDzA0D5OwFpLLziyvIN8XjJAxNL3lM=;
	h=From:Subject:Message-Id:To:References:Cc:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=srzx9lUq3LcXAUl2K3STq3EvnerNA7iYtV5qYUSF2IX5sdbkqcxCPDwQ+feVbBm9V
	 +Tx8++j7HyAcPr5uqYKihpy1OJjs0UeiDSwkJEuWqGruQvndYubaOgPQWUDMKPELPv
	 SWIe4Pa8UHZiGGws3j5u/7JHrmB3v6Nl2WESKVwfC2CdllD09OIlJTOgokhuICZKyb
	 wnHz8Zh+uoW6MbMM1YMk02YTjGEMxXO1zEPlyJIlElkWhwt49FsKUGyQtnpEa6bpMy
	 cAbDmzd8F/6p5FLmHmiqeFXU7dQtkreatLsW/0sN1G8pnpzJ6/Izmif33zkXcjRVKI
	 0vdqFzAhNjzMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1705572549; x=1705833049; i=yann.dirson@vates.tech;
	bh=9DqOhX66T0rS9aDzA0D5OwFpLLziyvIN8XjJAxNL3lM=;
	h=From:Subject:Message-Id:To:References:Cc:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=yGfKtBx3fylFGiG7rufz9uQK4vzUglgzgfolxEokL6VvSIndaW58XbB208/R4i0+7
	 h2C/CfUawTHMPgjPy98p2MFd7WM0ST45ElcaF4a4cRXcX0Z1lp6kXHDHcHUZ5mknk0
	 csQ3oLK5lW6SDEERGm47Yc/QfblChSQx6Hy5ngpEITcgzhRizNdqVZYSQUHuzC1AuL
	 LmJZz9y9waiA2b5rKedbUCMBnpYVI8A1Gz2hZcT/ntM2E79oGIix18ORyAIsqcLOih
	 xtspto0UJZzWLjxNcCbADAYyhDBbpBSu4cX7kN5rsn4mEN2lya7uF1ppdFe3fztDFw
	 AjurZe8ZaSXEA==
From: Yann Dirson <yann.dirson@vates.tech>
Subject: =?utf-8?Q?Re:=20Community=20Process=20Group=20-=20Proposal?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1705572548246
Message-Id: <509c9419-650a-4a7c-83e4-7a5204c53645@vates.tech>
To: xen-devel@lists.xenproject.org
References: <CAO-mL=yvVWjnOHSFSqcrknoXOqk-N3JY76qObQnzftrkmsq6xw@mail.gmail.com>
Cc: Kelly Choi <kelly.choi@cloud.com>, committers@xenproject.org, advisory-board@lists.xenproject.org
In-Reply-To: <CAO-mL=yvVWjnOHSFSqcrknoXOqk-N3JY76qObQnzftrkmsq6xw@mail.gmail.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.fdd8f09f3bf04854a93c7196612d499d?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240118:md
Date: Thu, 18 Jan 2024 10:09:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On 1/17/24 18:10, Kelly Choi wrote:
> Hi everyone,
> 
> I've spent a bit of time talking to various individuals and the advisory 
> board about setting up a new Community Process Group.
> 
> A survey was recently conducted to identify how the community as a whole 
> feels about a certain situation. It was not intended to ban specific 
> wording or create a policy to do so, but more to give context that the 
> community has a wide range of ideas, and individuals may agree and 
> disagree a lot more frequently than we as individuals might think. It 
> helps us understand that as a community there are many situations where 
> it is not clear. As such, the results indicated a very even split among 
> the community, which indicates a larger problem as we may not always 
> come to agreement.
> 
> There is obvious frustration with how certain matters are handled, as 
> some members may want the project to move faster, whereas others like to 
> take a cautious approach. Given we are an open source project, 
> differences in opinion are likely to happen and what we don=E2=80=99t wan=
t to do 
> is cause further frustration.
> 
> *This is where I would like to propose the idea of a =E2=80=98Community P=
rocess 
> Group=E2=80=99.*

That made me look for a list of official roles in the project, which I
found at [0].  How up-to-date is this list?  The Release Manager role is
mentioned there but not described, the Community Manager role is not
mentioned at all, and the only link to get project leadership info [1]
redirects to unrelated information.

[0] https://xenproject.org/developers/governance/#roles-local
[1] https://xenproject.org/developers/teams/hypervisor

I feel it would be necessary to have a clear view on the current
situation, before adding more structures.

> 
> A CPG=C2=A0can help as they will be able to advise members on similar iss=
ues 
> regarding community processes or appeals and decide on the best way 
> forward. To help with this process, I have consulted with various 
> individuals including some committers and conduct team members.
> *
> What is a CPG=E2=80=99s purpose?*
> In the first instance, we would expect an informal vote resolves most 
> disagreements. However, there will be certain circumstances where the 
> outcome is not always agreed on.
> 
> A CPG=C2=A0will be your second point of call, where you can escalate matt=
ers 
> quickly for a democratic solution.
> 
> Their purpose is to resolve process issues and informal vote appeals to 
> avoid matters going to a formal vote, but also act as a representative 
> on behalf of others in the community on future matters.
> 
> For example:
> 
>   * Naming conventions
>   * Whether feedback requesting changes on a patch series is acceptable
>   * How to move forward in case of non-actionable feedback to a patch ser=
ies
>   * How to move forward when a contributor or reviewer has not been
>     responsive
>   * Policy questions not related to the code of conduct
> 
> *What is their role and responsibility?*
> 
> The CPG=C2=A0has the authority to propose a resolution to situations wher=
e 
> there are disagreements, that don=E2=80=99t involve large technical decis=
ions. 
> Their decision proposed should be accepted as final since members will 
> have discussed the best steps and come to a consensus vote.
> 
> The CPG=C2=A0does not aim to replace the committers' authority or the 
> advisory board but instead holds the authority to make decisions that 
> are in the best interest of the community in relation to processes. 
> Committers still hold the power should there be a formal escalation 
> regarding technical decisions, but this would be extremely rare. 
> Advisory Board members hold the final power regarding project and 
> business-wide decisions.
> 
> *How are members selected?*
> The CPG=C2=A0will be composed of 5 randomly selected members in total.
> An odd number has been purposely selected to avoid an impasse during 
> decisions.

Do you have any specific idea of how "randomly selected" would work?
I mean, having a die rolled behind closed doors is not going to help
building trust.  Now there are rather-simple algorithms for Distributed
Dice Rolling, like [2], but there would be a few practical details to
make explicit.

[2] 
https://stackoverflow.com/questions/224058/distributed-random-number-genera=
tion

> 
> The criteria:
> Individual members must be active contributors and are willing to help 
> the community succeed. As such they must be a part of the following group=
s:
> 
>   * Committers
>   * Active Maintainers: maintainers with >=3D 20 reviews in the last 2
>     releases
>   * Active Contributors: contributors with >=3D 10 commits in the last 2
>     releases
> 
> Future rotations of CPG=C2=A0members:
> New members will be selected randomly for each new release to ensure 
> fairness.
> 
> *Expectations*
> CPG=C2=A0members are expected to use their best judgement of what is best=
 for 
> the community in terms of conflict resolution and process improvements. 
> They can propose an outcome that progresses the project forward.
> The CPG=C2=A0is also expected to address wider concerns, feedback, and id=
eas 
> during a monthly meeting with all community members.
> 
> For example:
> 
>   * If someone is displaying repeated concerning behaviour that disrupts
>     the community, members can ask the CPG=C2=A0for help on a solution. (=
This
>     is different from a code of conduct violation which would be for
>     serious offences only.)
>   * Help drive discussions on how much we deviate from technical
>     specifications
> 
> *Next steps*
> Given this suggestion is a big change in what I hope is a positive 
> direction, we will require your feedback and a final formal vote on the 
> process, before it is implemented into the governance policies. The 
> specific wording can be decided after this proposal.
> 
> This will hopefully help us overcome some of the frustrations and issues 
> we have seen in the community from a difference in opinion as a 
> collective discussion will now be made. Should we need to, the process 
> can be reviewed to improve at later stages.
> 
> I welcome your feedback as a community on this proposal.
> 
> Many thanks,
> Kelly Choi
> 
> Community Manager
> Xen Project


Yann Dirson | Vates Platform Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


