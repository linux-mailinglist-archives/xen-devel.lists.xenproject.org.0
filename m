Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA10A8745BA
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 02:40:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689609.1074761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ri2kC-0002Zj-5v; Thu, 07 Mar 2024 01:40:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689609.1074761; Thu, 07 Mar 2024 01:40:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ri2kC-0002YC-27; Thu, 07 Mar 2024 01:40:24 +0000
Received: by outflank-mailman (input) for mailman id 689609;
 Thu, 07 Mar 2024 01:40:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nvJe=KN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ri2kA-0002Y6-OZ
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 01:40:22 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 916ef542-dc23-11ee-a1ee-f123f15fe8a2;
 Thu, 07 Mar 2024 02:39:42 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 12DCD61BCE;
 Thu,  7 Mar 2024 01:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB0BC433F1;
 Thu,  7 Mar 2024 01:39:38 +0000 (UTC)
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
X-Inumbo-ID: 916ef542-dc23-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709775580;
	bh=8TyXHrMAokNqX9PY/rXFl06PuUpnN21MPfNTOWlVI34=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Rhn68/38bfSd0jT8y9UF89CvUvS5hvMnLKqAXNUq9GH/wDwgZ8hMJ1m4X1NYTqMon
	 vi36A42F4t9v+wfzQekq6SKdYokPQWNZhRI7z25RyfkkhZ4mja5wlL7YGGkPtxlbdL
	 QnZuZD6IH1E8pMG89lTQf1HCKOBRID2aMBVrKfkX0fNBG0tfmdON9+aq53Xc8IAqV7
	 M3krK3KS+r01AXS8IvmQOA/KQTttm5IJGfLBu2l6ZpIzXAjDQN9m/0twCJDKncoCzt
	 OhDJmMqWJVjFLMoXHMu/Lejf+pB5JR50KAkphn2PL8YRaAq8IfkEqAi35MGrqYAHoa
	 cuHHrCVh8ASig==
Date: Wed, 6 Mar 2024 17:39:37 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, michal.orzel@amd.com, 
    xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, 
    bertrand.marquis@arm.com, julien@xen.org, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [XEN PATCH 10/10] xen/keyhandler: address violations of MISRA
 C Rule 20.7
In-Reply-To: <fe15bab2-3a48-4243-b50c-6d9854c218c2@suse.com>
Message-ID: <alpine.DEB.2.22.394.2403061734250.853156@ubuntu-linux-20-04-desktop>
References: <cover.1709219010.git.nicola.vetrini@bugseng.com> <2bc4a964f0f2f47488e72237678e944dbdbd7bb7.1709219010.git.nicola.vetrini@bugseng.com> <alpine.DEB.2.22.394.2402291457000.853156@ubuntu-linux-20-04-desktop> <1afd8805-7365-40ec-8e8e-468a83e20c40@suse.com>
 <alpine.DEB.2.22.394.2403011716180.853156@ubuntu-linux-20-04-desktop> <d7411c57-32f3-41c6-8233-685ed5dfe976@suse.com> <alpine.DEB.2.22.394.2403041756140.853156@ubuntu-linux-20-04-desktop> <fe15bab2-3a48-4243-b50c-6d9854c218c2@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 5 Mar 2024, Jan Beulich wrote:
> On 05.03.2024 03:03, Stefano Stabellini wrote:
> > On Mon, 4 Mar 2024, Jan Beulich wrote:
> >> On 02.03.2024 02:37, Stefano Stabellini wrote:
> >>> On Fri, 1 Mar 2024, Jan Beulich wrote:
> >>>> On 29.02.2024 23:57, Stefano Stabellini wrote:
> >>>>> On Thu, 29 Feb 2024, Nicola Vetrini wrote:
> >>>>>> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> >>>>>> of macro parameters shall be enclosed in parentheses". Therefore, some
> >>>>>> macro definitions should gain additional parentheses to ensure that all
> >>>>>> current and future users will be safe with respect to expansions that
> >>>>>> can possibly alter the semantics of the passed-in macro parameter.
> >>>>>>
> >>>>>> No functional change.
> >>>>>>
> >>>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> >>>>>
> >>>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> >>>>
> >>>> You did see the discussion on earlier patches, though? I don't think
> >>>> any of the parentheses here are needed or wanted.
> >>>
> >>> We need to align on this. Currently if we go by what's written in
> >>> docs/misra/deviations.rst, then rhs should have parentheses.
> >>
> >> Quoting the actual patch again:
> > 
> > [...]
> > 
> >> What rhs are you talking about in light of this change? The only rhs I
> >> can spot here is already parenthesized.
> > 
> > Yes you are right. I replied here as an overall comment about our
> > approach to 20.7, although this patch is not a good example. My reply
> > was meant in the context of https://marc.info/?l=xen-devel&m=170928051025701
> 
> I'm still confused: The rhs is being parenthsized there. It's the _lhs_
> which isn't and ...
> 
> >>> Can we safely claim that rhs parentheses are never needed? If so, then
> >>> great, let's add it to deviations.rst and skip them here and other
> >>> places in this patch series (e.g. patch #8). When I say "never" I am
> >>> taking for granted that the caller is not doing something completely
> >>> unacceptably broken such as: 
> >>>
> >>>      WRITE_SYSREG64(var +, TTBR0_EL1)
> >>
> >> I'm afraid I can't associate this with the patch here either. Instead in
> >> the context here a (respective) construct as you mention above would simply
> >> fail to build.
> > 
> > Fair enough it will break the build. I was trying to clarify that when I
> > wrote "the rhs parentheses are never needed" I meant "never" within
> > reason. One can always find ways to break the system and I tried to make
> > an example of something that for sure would break rhs or lhs without
> > parentheses.
> > 
> > I meant to say, if we don't account for exceptionally broken cases, can
> > we safety say we don't need parentheses for rhs?
> 
> ... doesn't need to, unless - as you say - one contrives examples. Yet to
> clarify here as well: I assume you mean "we don't need parentheses for lhs".

Yes. Far clarity, we are all aligned that lhs does not need parentheses
and in fact it is even already deviated in docs/misra/deviations.rst.

Now back to this specific patch.

The problem is that the comma ',' doesn't need parenthesis for the
parameters. However, the way we wrote the deviation in
docs/misra/deviations.rst doesn't cover the case this patch is dealing
with. docs/misra/deviations.rst only speaks of functions and macros
arguments.

Should we rephrase docs/misra/deviations.rst in terms of ',' instead ?
Can ECLAR deal with it?



> And note that even if your example used the first parameter as lhs of an
> assignment, the build would still break. The + there would not magically
> combine with the = to a += operator. Tokenization occurs ahead of
> preprocessing, so the expanded macro would still have a + token followed by
> a = one. The only way to alter tokens is by using the ## operator. Which in
> turn precludes using parentheses.

OK

