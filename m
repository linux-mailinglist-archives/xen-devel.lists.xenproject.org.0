Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C08189928A
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 02:18:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701047.1095090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsXHT-0002SK-Md; Fri, 05 Apr 2024 00:18:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701047.1095090; Fri, 05 Apr 2024 00:18:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsXHT-0002PS-JT; Fri, 05 Apr 2024 00:18:07 +0000
Received: by outflank-mailman (input) for mailman id 701047;
 Fri, 05 Apr 2024 00:18:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GKl/=LK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rsXHS-0002PM-94
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 00:18:06 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7b7b91d-f2e1-11ee-a1ef-f123f15fe8a2;
 Fri, 05 Apr 2024 02:18:04 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 88A366178B;
 Fri,  5 Apr 2024 00:18:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47DC7C433F1;
 Fri,  5 Apr 2024 00:18:01 +0000 (UTC)
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
X-Inumbo-ID: f7b7b91d-f2e1-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712276282;
	bh=cGm1/1WVZOIXnaFQjd8ehPkD7r1zBPTen/qA2ytABE4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BOSCKseYj9dP7BpikoN3QhL9XcW9q/3v4ravZqxhmKirpl9pGcyXSCt/UrJJ3+PXm
	 Jw4uDnmzA+VIRw1bO/TGkg797ZZpHTDqFC7+zy7ZNhFoPnQRZARMFEeOZxuzEOvb/b
	 A79r8ORZwjQTOfp2FVPjzCxntFysnwB8xhhX6r3zvPRuZTBBzH1LSJGQIuAVK/vuu9
	 DsAfRaVqRpAj8XwWlQp1ynoH3NoGOkjsvxemOKKdmQjX6UXdProTVKmPGQYacKOFqL
	 zek80eLNhR4Ad9FW6rgslmBMjAsma49FF5ntrLBzUZ/9z0XXxkITyZGx+03VNruGbn
	 2zz3nxhLgn/ng==
Date: Thu, 4 Apr 2024 17:18:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    Federico Serafini <federico.serafini@bugseng.com>, 
    Stefano Stabellini <stefano.stabellini@amd.com>, consulting@bugseng.com, 
    George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org, 
    Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [XEN PATCH 3/7] xen/sched: address a violation of MISRA C:2012
 Rule 16.3
In-Reply-To: <0d0c8cd162a8bfed07dd374ef2dd62d4@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2404041715400.2245130@ubuntu-linux-20-04-desktop>
References: <cover.1712042178.git.federico.serafini@bugseng.com> <8f91430e37594831dd8d92ab630477be88417b49.1712042178.git.federico.serafini@bugseng.com> <28786c5b-c625-4754-980d-c9a0fdc49c37@suse.com> <0d0c8cd162a8bfed07dd374ef2dd62d4@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 3 Apr 2024, Nicola Vetrini wrote:
> On 2024-04-03 08:33, Jan Beulich wrote:
> > On 02.04.2024 09:22, Federico Serafini wrote:
> > > Use pseudo-keyword fallthrough to meet the requirements to deviate
> > > MISRA C:2012 Rule 16.3 ("An unconditional `break' statement shall
> > > terminate every switch-clause").
> > > 
> > > No functional change.
> > > 
> > > Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> > > ---
> > >  xen/common/sched/credit2.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
> > > index c76330d79d..0962b52415 100644
> > > --- a/xen/common/sched/credit2.c
> > > +++ b/xen/common/sched/credit2.c
> > > @@ -3152,8 +3152,8 @@ static int cf_check csched2_sys_cntl(
> > >              printk(XENLOG_INFO "Disabling context switch rate
> > > limiting\n");
> > >          prv->ratelimit_us = params->ratelimit_us;
> > >          write_unlock_irqrestore(&prv->lock, flags);
> > > +        fallthrough;
> > > 
> > > -    /* FALLTHRU */
> > >      case XEN_SYSCTL_SCHEDOP_getinfo:
> > >          params->ratelimit_us = prv->ratelimit_us;
> > >          break;
> > 
> > Hmm, the description doesn't say what's wrong with the comment. Furthermore
> > docs/misra/rules.rst doesn't mention "fallthrough" at all, nor the
> > alternative of using comments. I notice docs/misra/deviations.rst does, and
> > there the specific comment used here isn't covered. That would want saying
> > in the description.
> > 
> > Stefano (and others) - in this context it becomes noticeable that having
> > stuff scattered across multiple doc files isn't necessarily helpful. Other
> > permissible keywords are mentioned in rules.rst. The pseudo-keyword
> > "fallthrough" as well as comments are mentioned on deviations.rst. Could
> > you remind me of the reason(s) why things aren't recorded in a single,
> > central place?
> > 
> > Jan
> 
> If I recall correctly, the idea was to avoid rules.rst from getting too long
> and too specific about which patterns were deviated, while also having a
> precise record of the MISRA deviations that didn't live in ECLAIR-specific
> files. Maybe the use of the pseudo-keyword emerged after the rule was added to
> rules.rst, since deviations.rst is updated more frequently.

Yes exactly.

I agree with Jan that a single central place is easiest but we cannot
move everything that is in deviations.rst in the note section of the
rules.rst table. Of the two, it would be best to reduce the amount of
notes in rules.rst and move all the deviations listed in rules.rst to
deviations.rst. That way at least the info is present only once,
although they are 2 files.

