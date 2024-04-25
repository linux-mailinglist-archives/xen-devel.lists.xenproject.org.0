Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF158B2980
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 22:13:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712273.1112853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s05Sw-0007hV-Ej; Thu, 25 Apr 2024 20:13:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712273.1112853; Thu, 25 Apr 2024 20:13:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s05Sw-0007en-Bo; Thu, 25 Apr 2024 20:13:10 +0000
Received: by outflank-mailman (input) for mailman id 712273;
 Thu, 25 Apr 2024 20:13:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N29f=L6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s05Su-0007eh-SQ
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 20:13:08 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3899e0b6-0340-11ef-b4bb-af5377834399;
 Thu, 25 Apr 2024 22:13:05 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 39C65CE19BD;
 Thu, 25 Apr 2024 20:13:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7659DC113CC;
 Thu, 25 Apr 2024 20:13:00 +0000 (UTC)
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
X-Inumbo-ID: 3899e0b6-0340-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714075981;
	bh=n/iDXz8hQ0wRWtnGrQvhufUj/54M5usMBYYuPXbMYCo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QOFuiE0BgNsu7tdhgXvQrv0r3qkFBw8nugeM8YT6Hk5myE9ANg9w7oFErgybGICdp
	 U4aG7xl+QgSXaDPCwRKNyV/Hw7j/AZdcEwpm8NYZVQq5rf+47XPilrJ27UpO5DIimT
	 6nDLqPOEGNU5P8IO4pCmaDkmyZBZv1P3doNWAqy7qhKxNb/+5+W9LRCOSOsOk2xCJa
	 uk3TdNC04PDNLKiwZgI9XzCsKORrKC8keYRpcEs8svXczk18vKr2S+yibuoxbJYgA2
	 G4ua9pYE318tx8LNwEW2LSaStqGkngSrIuXj9M8OBrbUIH8FdYHObCtoYbPCh7M/5a
	 8kR8qPSNdwXjg==
Date: Thu, 25 Apr 2024 13:12:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Subject: Re: [XEN PATCH] automation/eclair: reorganize pipelines
In-Reply-To: <74f86426-b3bb-4af7-85ca-15851acee6fd@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2404251255440.3940@ubuntu-linux-20-04-desktop>
References: <fe1fe9c964d1f2ba3cb46cbaf798cf698f341386.1713885065.git.federico.serafini@bugseng.com> <alpine.DEB.2.22.394.2404241704430.3940@ubuntu-linux-20-04-desktop> <74f86426-b3bb-4af7-85ca-15851acee6fd@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 25 Apr 2024, Federico Serafini wrote:
> On 25/04/24 02:06, Stefano Stabellini wrote:
> > On Tue, 23 Apr 2024, Federico Serafini wrote:
> > > From: Simone Ballarin <simone.ballarin@bugseng.com>
> > > 
> > > Introduce accepted_guidelines.sh: a script to autogenerate the
> > > configuration file accepted.ecl from docs/misra/rules.rst which enables
> > > all accepted guidelines.
> > > 
> > > Introduce monitored.ecl: a manual selection of accepted guidelines
> > > which are clean or almost clean, it is intended to be used for the
> > > analyses triggered by commits.
> > > 
> > > Reorganize tagging.ecl:
> > >    -Remove "accepted" tags: keeping track of accepted guidelines tagging
> > >     them as "accepted" in the configuration file tagging.ecl is no
> > >     longer needed since docs/rules.rst is keeping track of them.
> > >    -Tag more guidelines as clean.
> > > 
> > > Reorganize eclair pipelines:
> > >    - Set1, Set2, Set3 are now obsolete: remove the corresponding
> > >      pipelines and ecl files.
> > >    - Amend scheduled eclair pipeline to use accepted.ecl.
> > >    - Amend triggered eclair pipeline to use monitored.ecl.
> > > 
> > > Rename and improve action_check_clean_regressions.sh to print a
> > > diagnostic in case a commit introduces a violation of a clean guideline.
> > > 
> > > An example of diagnostic is the following:
> > > 
> > > Failure: 13 regressions found for clean guidelines
> > >    service MC3R1.R8.2: (required) Function types shall be in prototype
> > > form with named parameters:
> > >     violation: 13
> > > 
> > > Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> > > Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> > > Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
> > 
> > Fantastic work, thank you!
> > 
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> > 
> > Is this patch safe to commit now? Or would it cause gitlab-ci breakage?
> 
> Yes, it is safe because the ECLAIR analysis is still allowed to fail.
> Committing this patch wouldn't break the CI but it will highlight some
> regressions with the orange badge and the following messages:

OK thanks, I'll commit it


> arm:
> 
> Failure: 5 regressions found for clean guidelines
>   service MC3R1.R1.1: (required) The program shall contain no violations of
> the standard C syntax and constraints, and shall not exceed the
> implementation's translation limits:
>    violation: 5
> 
> x86:
> 
> Failure: 2 regressions found for clean guidelines
>   service MC3R1.R8.2: (required) Function types shall be in prototype form
> with named parameters:
>    violation: 2
> 
> (George just sent a patch to address the regressions of Rule 8.2.)

As soon as we solve these two issues, I think we should remove the
allow_failure: true from the two ECLAIR jobs scanning clean
guidelines. More on this below.


> > 
> > One question below.
> > 
> > 
> > > -
> > >   ####################
> > >   # Clean guidelines #
> > >   ####################
> > >     -doc_begin="Clean guidelines: new violations for these guidelines are
> > > not accepted."
> > > 
> > > --service_selector={clean_guidelines_common,"MC3R1.D1.1||MC3R1.D2.1||MC3R1.D4.11||MC3R1.D4.14||MC3R1.R1.1||MC3R1.R1.3||MC3R1.R1.4||MC3R1.R2.2||MC3R1.R3.1||MC3R1.R3.2||MC3R1.R4.1||MC3R1.R4.2||MC3R1.R5.1||MC3R1.R5.2||MC3R1.R5.4||MC3R1.R5.6||MC3R1.R6.1||MC3R1.R6.2||MC3R1.R7.1||MC3R1.R8.1||MC3R1.R8.2||MC3R1.R8.5||MC3R1.R8.6||MC3R1.R8.8||MC3R1.R8.10||MC3R1.R8.12||MC3R1.R8.14||MC3R1.R9.2||MC3R1.R9.4||MC3R1.R9.5||MC3R1.R12.5||MC3R1.R17.3||MC3R1.R17.4||MC3R1.R17.6||MC3R1.R20.13||MC3R1.R20.14||MC3R1.R21.13||MC3R1.R21.19||MC3R1.R21.21||MC3R1.R22.2||MC3R1.R22.4||MC3R1.R22.5||MC3R1.R22.6"
> > > +-service_selector={clean_guidelines_common,"MC3R1.D1.1||MC3R1.D2.1||MC3R1.D4.1||MC3R1.D4.11||MC3R1.D4.14||MC3R1.R1.1||MC3R1.R11.7||MC3R1.R11.9||MC3R1.R12.5||MC3R1.R1.3||MC3R1.R1.4||MC3R1.R14.1||MC3R1.R16.7||MC3R1.R17.1||MC3R1.R17.3||MC3R1.R17.4||MC3R1.R17.5||MC3R1.R17.6||MC3R1.R20.13||MC3R1.R20.14||MC3R1.R20.4||MC3R1.R20.9||MC3R1.R21.13||MC3R1.R21.19||MC3R1.R21.21||MC3R1.R2.2||MC3R1.R22.2||MC3R1.R22.4||MC3R1.R22.5||MC3R1.R22.6||MC3R1.R2.6||MC3R1.R3.1||MC3R1.R3.2||MC3R1.R4.1||MC3R1.R4.2||MC3R1.R5.1||MC3R1.R5.2||MC3R1.R5.4||MC3R1.R5.6||MC3R1.R6.1||MC3R1.R6.2||MC3R1.R7.1||MC3R1.R7.4||MC3R1.R8.1||MC3R1.R8.10||MC3R1.R8.12||MC3R1.R8.14||MC3R1.R8.2||MC3R1.R8.5||MC3R1.R8.6||MC3R1.R8.8||MC3R1.R9.2||MC3R1.R9.3||MC3R1.R9.4||MC3R1.R9.5"
> > >   }
> > 
> > Is this list different from monitored.ecl? If so, why? If not, maybe we
> > don't need to repeat the list here as well?
> 
> Quick answer: this list is different from monitored.ecl and the two
> lists must coexist.
> 
> Here, we are "tagging" some guidelines as "clean":
> this list is crucial and will be (manually) updated every time a new
> guideline reaches 0 violations, it shall not be removed because this tag
> allows ECLAIR to print a diagnostic and fail in case unjustified
> violations are found for the tagged guidelines.
> 
> The monitored.ecl is the list of guidelines which are analyzed at each
> commit: the list shall include all the guidelines tagged as "clean"
> (to do the proper regressions checks) but the monitored list can also
> include some accepted guidelines for which it may be interesting to see
> the number of violations at each commit, for example, we put there some
> almost-clean guidelines (guidelines with few violations left but not yet
> tagged as clean yet).
> Introducing new violations of monitored but not-clean guidelines will
> not cause a failure.

I think it is time we remove allow_failure: true from
.eclair-analysis:triggered, affecting both eclair-x86_64 and
eclair-ARM64. With the goal of stopping new MISRA C violations from
entering the tree.

The question is: in which cases we want eclair-x86_64 and eclair-ARM64
to fail the Gitlab job?

It is clear that we want the two jobs to fail if new violations are
found for the clean (zero violations) guidelines.

Should we also fail the Gitlab jobs if new regreassions are found for the
almost-clean rules? I think so, yes. Do you agree?


Less important but related: if you agree, does the list above need to
still be different from the monitored.ecl list?

