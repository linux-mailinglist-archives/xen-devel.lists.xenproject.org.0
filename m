Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F5662633A
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 21:53:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442711.697153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otb12-0008T3-Iq; Fri, 11 Nov 2022 20:52:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442711.697153; Fri, 11 Nov 2022 20:52:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otb12-0008Q9-F0; Fri, 11 Nov 2022 20:52:44 +0000
Received: by outflank-mailman (input) for mailman id 442711;
 Fri, 11 Nov 2022 20:52:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JraP=3L=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1otb11-0008Q3-As
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 20:52:43 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8ee8378-6202-11ed-91b6-6bf2151ebd3b;
 Fri, 11 Nov 2022 21:52:42 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 33795B82775;
 Fri, 11 Nov 2022 20:52:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83682C433D7;
 Fri, 11 Nov 2022 20:52:38 +0000 (UTC)
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
X-Inumbo-ID: c8ee8378-6202-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668199959;
	bh=LtA/jFLCl2WZr8Qec7rfAHu/R79aDlTJqh0pstc7w58=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iZBk8c/Aw/MIgp/XQk16WJX5Ay4fErwHqr07Lz7b6hZLGugzTJGehLALVhgr2o3ep
	 E2jtoARIdHn3onLXm7KFZpsvee1x27XdCNofLUjWNbMvDPgbJ3Eetnm1EE9M/UiRh1
	 3+xT4srg89T6Lk//TgCV2BiP3yTImWNCYBWzHJJWGazvjNi7S5WPIrpFAi/mxOZM1m
	 8Sp5LYezY9Z6KB3w/2RMIosi7G0015LmJKoLSsw0WJvLdhS9s4Bbr86svODaGAitxG
	 HmQ1k83hGGlBS086RYUmdreUwX17cpCIWyjHs+tLMhg9qslcpfAOwe+6QE3rJc2SIQ
	 2IquPNF/OHlGw==
Date: Fri, 11 Nov 2022 12:52:37 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Luca Fancellu <Luca.Fancellu@arm.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [RFC PATCH 1/4] xen/Makefile: add analysis-coverity and
 analysis-eclair
In-Reply-To: <826eb0df-fb52-fa25-c908-977285a6ec8b@suse.com>
Message-ID: <alpine.DEB.2.22.394.2211111245540.50442@ubuntu-linux-20-04-desktop>
References: <20221107104739.10404-1-luca.fancellu@arm.com> <20221107104739.10404-2-luca.fancellu@arm.com> <aa989d27-45c2-6cb8-160a-b0368b1bb2a2@suse.com> <8632FA78-B316-4866-8E78-D4CD127C8602@arm.com> <d1d5ce85-0883-9217-ada9-71204e02239a@suse.com>
 <B26247E9-BD4A-4868-B977-CC451F7A095D@arm.com> <7d56c33d-4b03-9aa1-6abc-45a8ad41caca@suse.com> <2E0BFEFC-5BEE-4F8B-BD9E-94CB9A5B2BC9@arm.com> <aa05f64b-fdc1-ab4e-e751-e19309f88eb8@suse.com> <9CE2A214-2D64-4BEC-A78B-393BF7AEDD9D@arm.com>
 <e8cae5b4-82db-cdb0-eccd-36337bc8ae5a@suse.com> <E9975528-1600-4F93-8C6E-263FF2A4A7F0@arm.com> <826eb0df-fb52-fa25-c908-977285a6ec8b@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1125273999-1668199697=:50442"
Content-ID: <alpine.DEB.2.22.394.2211111248590.50442@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1125273999-1668199697=:50442
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2211111248591.50442@ubuntu-linux-20-04-desktop>

On Fri, 11 Nov 2022, Jan Beulich wrote:
> On 11.11.2022 11:42, Luca Fancellu wrote:
> >> On 9 Nov 2022, at 10:36, Jan Beulich <jbeulich@suse.com> wrote:
> >> On 09.11.2022 11:08, Luca Fancellu wrote:
> >>>>> On 07.11.2022 11:47, Luca Fancellu wrote:
> >>>>> Now analysis-build-coverity will be called, the best match is analysis-build-%, so again the dependency
> >>>>> which is analysis-parse-tags-%, will be translated to analysis-parse-tags-coverity.
> >>>>>
> >>>>> Now analysis-parse-tags-coverity will be called, the best match is analysis-parse-tags-%, so the % will
> >>>>> Have the ‘coverity’ value and in the dependency we will have $(objtree)/%.sed -> $(objtree)/coverity.sed.
> >>>>>
> >>>>> Looking for $(objtree)/coverity.sed the best match is $(objtree)/%.sed, which will have $(JUSTIFICATION_FILES)
> >>>>> and the python script in the dependency, here we will use the second expansion to solve
> >>>>> $(XEN_ROOT)/docs/misra/false-positive-$$*.json in $(XEN_ROOT)/docs/misra/false-positive-coverity.json
> >>>>>
> >>>>> So now after analysis-parse-tags-coverity has ended its dependency it will start with its recipe, after it finishes,
> >>>>> the recipe of analysis-build-coverity will start and it will call make to actually build Xen.
> >>>>
> >>>> Okay, I see now - this building of Xen really _is_ independent of the
> >>>> checker chosen. I'm not sure though whether it is a good idea to
> >>>> integrate all this, including ...
> >>>>
> >>>>> After the build finishes, if the status is good, the analysis-build-coverity has finished and the _analysis-coverity
> >>>>> recipe can now run, it will call make with the analysis-clean target, restoring any <file>.{c,h}.safparse to <file>.{c,h}.
> >>>>
> >>>> ... the subsequent cleaning. The state of the _source_ tree after a
> >>>> build failure would be different from that after a successful build.
> >>>> Personally I consider this at best surprising.
> >>>>
> >>>> I wonder whether instead there could be a shell(?) script driving a
> >>>> sequence of make invocations, leaving the new make goals all be self-
> >>>> contained. Such a script could revert the source tree to its original
> >>>> state even upon build failure by default, with an option allowing to
> >>>> suppress this behavior.
> >>>
> >>> Instead of adding another tool, so another layer to the overall system, I would be more willing to add documentation
> >>> about this process, explaining how to use the analysis-* build targets, what to expect after a successful run and what
> >>> to expect after a failure.
> >>>
> >>> What do you think?
> >>
> >> Personally I'd prefer make goals to behave as such, with no surprises.
> > 
> > The analysis-* goal requires a build step, otherwise no analysis can be performed by the analysis tools, so I hope we agree
> > we need to integrate that step as a dependency of the analysis-*.
> 
> No, I'm afraid we don't agree. But like said for another piece we didn't
> initially agree on - if others think what you propose is fine, so be it.
> I'm specifically adding Anthony to Cc, as he's been working on make rules
> the most of all of us in the recent past.
> 
> > I understand that the analysis-clean might be a “surprise” if not well documented, this comes from the need to substitute the
> > tags in the tree (to keep the real path in the report log) and to revert them back at the end of the analysis.
> > 
> > So, such script should just mask to the user the analysis-clean invocation in case of errors (with an option to don’t do that)?
> 
> Hmm, here you're saying "such script", which looks to not fit with the
> earlier part of your reply above. (Just in case that's what I was to read
> out of this: I wouldn't see value in a script which existed _solely_ to
> make the cleaning conditional.)
> 
> Did you consider the alternative approach of copying the tree, altering
> it (while or after copying), running the build there, pulling out the
> result files, and delete the entire copy? Such a model would likely get
> away without introducing surprising make rules.

Another, maybe simpler idea: what if the build step is not a dependency
of the analysis-* goals?

Basically, the user is supposed to:

1) call analysis-parse-tags-*
2) build Xen (in any way they like)
3) call analysis-clean

Making steps 1-3 into a single step is slightly more convenient for the
user but the downside is that dealing with build errors becomes
problematic.

On the other hand, if we let the user call steps 1-3 by hand
individually, it is slightly less convenient for the user but they can
more easily deal with any build error and sophisticated build
configurations.

This is one of those cases where I think "less is more".
--8323329-1125273999-1668199697=:50442--

