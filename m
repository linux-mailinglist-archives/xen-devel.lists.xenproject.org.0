Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A86F45638C6
	for <lists+xen-devel@lfdr.de>; Fri,  1 Jul 2022 19:57:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.359141.588537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7KsY-0005Wh-I0; Fri, 01 Jul 2022 17:56:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 359141.588537; Fri, 01 Jul 2022 17:56:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7KsY-0005UK-EX; Fri, 01 Jul 2022 17:56:30 +0000
Received: by outflank-mailman (input) for mailman id 359141;
 Fri, 01 Jul 2022 17:56:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kD4F=XG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o7KsX-0005UE-9L
 for xen-devel@lists.xenproject.org; Fri, 01 Jul 2022 17:56:29 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 214b9ac6-f967-11ec-bd2d-47488cf2e6aa;
 Fri, 01 Jul 2022 19:56:28 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 01E07B83106;
 Fri,  1 Jul 2022 17:56:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1306DC3411E;
 Fri,  1 Jul 2022 17:56:24 +0000 (UTC)
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
X-Inumbo-ID: 214b9ac6-f967-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656698184;
	bh=k3LbadIxoy6dSLMPD16RNV5MKRaAaeGfE3h3yg4vuwc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AfjrXuSnLImyebYo6hiATn32awUJ8DECqzFKGqI/iG7lKKlrqxvB7cK5SJRqBMyfx
	 7sHc0wMPOypzHoVxWnsYortcyvMNzEAPy/OL7JRJ/G3mFquRdjKK9xLIvF5WfqyL6o
	 unO7mjIzlkCzjkp6++nCPP7OchG3EIzdKpMD1nSJ9Y8WgrixhIKoZdTrZxUS5b6/Ij
	 ZapklDZTs3Y9YTsv0jkv9KTba6gw1Efc3yT9ym06EgJCoXoQvmvQWAQC69P6pn7Rvy
	 YCVtLgbasQZq+lbS2FmctZ8j5jgywj2pUZv6OnyPi8vxPSNbx7j5fnY1BDijaA4TVH
	 1cQZxAiNUBdAg==
Date: Fri, 1 Jul 2022 10:56:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, scott.davis@starlab.io, jandryuk@gmail.com, 
    christopher.clark@starlab.io, dgdegra@tycho.nsa.gov, julien@xen.org, 
    george.dunlap@citrix.com, andrew.cooper3@citrix.com, dfaggioli@suse.com, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v9 0/3] Adds starting the idle domain privileged
In-Reply-To: <563b5d12-6eca-cfff-129f-7bffb01cd25c@suse.com>
Message-ID: <alpine.DEB.2.22.394.2207011054500.4389@ubuntu-linux-20-04-desktop>
References: <20220630022110.31555-1-dpsmith@apertussolutions.com> <alpine.DEB.2.22.394.2206301529570.4389@ubuntu-linux-20-04-desktop> <563b5d12-6eca-cfff-129f-7bffb01cd25c@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 1 Jul 2022, Jan Beulich wrote:
> On 01.07.2022 00:35, Stefano Stabellini wrote:
> > On Wed, 29 Jun 2022, Daniel P. Smith wrote:
> >> This series makes it so that the idle domain is started privileged under the
> >> default policy, which the SILO policy inherits, and under the flask policy. It
> >> then introduces a new one-way XSM hook, xsm_transition_running, that is hooked
> >> by an XSM policy to transition the idle domain to its running privilege level.
> >>
> >> Patch 3 is an important one, as first it addresses the issue raised under an
> >> RFC late last year by Jason Andryuk regarding the awkward entanglement of
> >> flask_domain_alloc_security() and flask_domain_create(). Second, it helps
> >> articulate why it is that the hypervisor should go through the access control
> >> checks, even when it is doing the action itself. The issue at hand is not that
> >> the hypervisor could be influenced to go around these check. The issue is these
> >> checks provides a configurable way to express the execution flow that the
> >> hypervisor should enforce. Specifically with this change, it is now possible
> >> for an owner of a dom0less or hyperlaunch system to express a policy where the
> >> hypervisor will enforce that no dom0 will be constructed, regardless of what
> >> boot construction details were provided to it. Likewise, an owner that does not
> >> want to see dom0less or hyperlaunch to be used can enforce that the hypervisor
> >> will only construct a dom0 domain. This can all be accomplished without the
> >> need to rebuild the hypervisor with these features enabled or disabled.
> > 
> > 
> > It looks like this patch series is fully acked except:
> > - in theory we need an ack from Daniel for flask
> > - there is a very small change to sched that would need an ack from
> >   George/Dario
> 
> I don't think I've seen any R-b for the last patch.

Good point. I hope you'll be happy to give your Reviewed-by or Acked-by
to the next version with the minor comments fixed.

