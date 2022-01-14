Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC25F48F1CE
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jan 2022 22:01:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257689.442948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8ThW-0004gR-UJ; Fri, 14 Jan 2022 21:01:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257689.442948; Fri, 14 Jan 2022 21:01:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8ThW-0004cx-Qd; Fri, 14 Jan 2022 21:01:34 +0000
Received: by outflank-mailman (input) for mailman id 257689;
 Fri, 14 Jan 2022 21:01:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=chGx=R6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n8ThU-0004cr-Mm
 for xen-devel@lists.xenproject.org; Fri, 14 Jan 2022 21:01:32 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25ccf5c2-757d-11ec-a115-11989b9578b4;
 Fri, 14 Jan 2022 22:01:31 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 35BA4B82A3A;
 Fri, 14 Jan 2022 21:01:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70ACFC36AE9;
 Fri, 14 Jan 2022 21:01:28 +0000 (UTC)
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
X-Inumbo-ID: 25ccf5c2-757d-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642194088;
	bh=dkNrjDH7R++oG57sMVeoB7++v+QAOcLlicKki4WJewQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=urQPFt3sUGimRmHVhGAxp0UkT4RZvnyJsAk3NVa4miwaBFrsa58a2Zmsvd5wLwpPx
	 4i+GK9yQo5twwudlQmckbP7xQn0x2HVLoDtC28hKYXwcpcI4S1sRcd85nfDmtxGiJU
	 5HQwMqRRbpDhQ9P7XFAsEYsBdJdEdYRBG6Aj2Pqg5wJH5vNcPYOw9vBjzDrxpzCfIz
	 2MHEOF5tkWhnOpbkuyZ2Pwn9viOBSVJ2R6wXWIo/XOlbDinntaT3s6j9inVmRDu9eI
	 RrqGCi2WCUoMX2Vb0Lk620mJ9acGouA30Xd1/QmPpeavpi4pCBOfuMJQ7b9zDYH7K2
	 z/KuXzEA3RxgQ==
Date: Fri, 14 Jan 2022 13:01:27 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Dario Faggioli <dfaggioli@suse.com>
cc: "sstabellini@kernel.org" <sstabellini@kernel.org>, 
    "julien@xen.org" <julien@xen.org>, Jan Beulich <JBeulich@suse.com>, 
    Juergen Gross <JGross@suse.com>, 
    "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>, 
    "roger.pau@citrix.com" <roger.pau@citrix.com>, 
    "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>, 
    "george.dunlap@citrix.com" <george.dunlap@citrix.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Subject: Re: sched=null vwfi=native and call_rcu()
In-Reply-To: <0cb5a1ceff3afc6c6d4319c9f6dd06a06a93a294.camel@suse.com>
Message-ID: <alpine.DEB.2.22.394.2201141253080.19362@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2201051615060.2060010@ubuntu-linux-20-04-desktop>  <20fbb361-b416-6965-614d-a6283a7e7550@xen.org>  <alpine.DEB.2.22.394.2201061747140.2060010@ubuntu-linux-20-04-desktop>
 <0cb5a1ceff3afc6c6d4319c9f6dd06a06a93a294.camel@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 14 Jan 2022, Dario Faggioli wrote:
> On Thu, 2022-01-06 at 17:52 -0800, Stefano Stabellini wrote:
> > On Thu, 6 Jan 2022, Julien Grall wrote:
> > > 
> > > This issue and solution were discussed numerous time on the ML. In
> > > short, we
> > > want to tell the RCU that CPU running in guest context are always
> > > quiesced.
> > > For more details, you can read the previous thread (which also
> > > contains a link
> > > to the one before):
> > > 
> > > https://lore.kernel.org/xen-devel/fe3dd9f0-b035-01fe-3e01-ddf065f182ab@codiax.se/
> > 
> > Thanks Julien for the pointer!
> > 
> > Dario, I forward-ported your three patches to staging:
> > https://gitlab.com/xen-project/people/sstabellini/xen/-/tree/rcu-quiet
> > 
> Hi Stefano!
> 
> I definitely would like to see the end of this issue, so thanks a lot
> for your interest and your help with the patches.
> 
> > I can confirm that they fix the bug. Note that I had to add a small
> > change on top to remove the ASSERT at the beginning of
> > rcu_quiet_enter:
> > https://gitlab.com/xen-project/people/sstabellini/xen/-/commit/6fc02b90814d3fe630715e353d16f397a5b280f9
> > 
> Yeah, that should be fine.
> 
> > Would you be up for submitting them for upstreaming? I would prefer
> > if
> > you send out the patches because I cannot claim to understand them
> > completely (except for the one doing renaming :-P )
> > 
> Haha! So, I am up for properly submitting, but there's one problem. As
> you've probably got, the idea here is to use transitions toward the
> guest and inside the hypervisor as RCU quiescence and "activation"
> points.
> 
> Now, on ARM, that just meant calling rcu_quiet_exit() in
> enter_hypervisor_from_guest() and calling rcu_quiet_enter() in
> leave_hypervisor_to_guest(). Nice and easy, and even myself --and I'm
> definitely not an ARM person-- cloud understand it (although with some
> help from Julien) and put the patches together.
> 
> However, the problem is really arch independent and, despite not
> surfacing equally frequently, it affects x86 as well. And for x86 the
> situation is by far not equally nice, when it comes to identifying all
> the places from where to call rcu_quiet_{enter,exit}().
> 
> And finding out where to put them, among the various functions that we
> have in the various entry.S variants is where I stopped. The plan was
> to get back to it, but as shamefully as it sounds, I could not do that
> yet.
> 
> So, if anyone wants to help with this, handing over suggestions for
> potential good spots, that would help a lot.

Unfortunately I cannot volunteer due to time and also because I wouldn't
know where to look and I don't have a reproducer or a test environment
on x86. I would be flying blind.


> Alternatively, we can submit the series as ARM-only... But I fear that
> the x86 side of things would then be easily forgotten. :-(

I agree with you on this, but at the same time we are having problems
with customers in the field -- it is not like we can wait to solve the
problem on ARM any longer. And the issue is certainly far less likely to
happen on x86 (there is no vwfi=native, right?) In other words, I think
it is better to have half of the solution now to solve the worst part of
the problem than to wait more months for a full solution.

