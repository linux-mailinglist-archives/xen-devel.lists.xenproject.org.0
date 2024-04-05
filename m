Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C43AE89A4E0
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 21:27:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701372.1095792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rspCd-0001O8-AD; Fri, 05 Apr 2024 19:26:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701372.1095792; Fri, 05 Apr 2024 19:26:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rspCd-0001Ky-6o; Fri, 05 Apr 2024 19:26:19 +0000
Received: by outflank-mailman (input) for mailman id 701372;
 Fri, 05 Apr 2024 19:26:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GKl/=LK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rspCb-0001Ks-5s
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 19:26:17 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d08afb8-f382-11ee-a1ef-f123f15fe8a2;
 Fri, 05 Apr 2024 21:26:13 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DACFE61788;
 Fri,  5 Apr 2024 19:26:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E0D4C433F1;
 Fri,  5 Apr 2024 19:26:10 +0000 (UTC)
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
X-Inumbo-ID: 5d08afb8-f382-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712345171;
	bh=PzSRdy3UdCT3QlQ4LZUftDBBDS4BFir75lS1Hj0h+NE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EZLRMwIOCkQdelpOZNcuOJS3VyJeDUv49R6cKA2Wb4JP8tjzJ3c6AA9ZdUXbFNIdG
	 ZdEGL2AhUyczxK5cfWpV7s4zxNLnjAl0XmuAAiiCahGP7upuUKdfTSXv2GtqdaoGJu
	 M19824zInPYYqAjr8gLG992PBU2FwY+FTKvGBKVzZbXJtIu30nlGyUmGaSRLdFlNrI
	 +AWmqbDH7cgy4mazGk3AhFdvmycxO0Zp1lNdomLuvG+gMgizGm4VcZMvrj1HFhp83h
	 WKFCWPRftqyX8w0W/joD7s+1sn9TIMfyPplNMmF46P105Nwy6im63W5Ac2I/+r0WI0
	 YeqASvMiEZM+A==
Date: Fri, 5 Apr 2024 12:26:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Federico Serafini <federico.serafini@bugseng.com>, 
    Stefano Stabellini <stefano.stabellini@amd.com>, consulting@bugseng.com, 
    George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org, 
    Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [XEN PATCH 3/7] xen/sched: address a violation of MISRA C:2012
 Rule 16.3
In-Reply-To: <627b2436-f7a0-4434-944f-5d4f173ba8ea@suse.com>
Message-ID: <alpine.DEB.2.22.394.2404051226030.2245130@ubuntu-linux-20-04-desktop>
References: <cover.1712042178.git.federico.serafini@bugseng.com> <8f91430e37594831dd8d92ab630477be88417b49.1712042178.git.federico.serafini@bugseng.com> <28786c5b-c625-4754-980d-c9a0fdc49c37@suse.com> <0d0c8cd162a8bfed07dd374ef2dd62d4@bugseng.com>
 <alpine.DEB.2.22.394.2404041715400.2245130@ubuntu-linux-20-04-desktop> <627b2436-f7a0-4434-944f-5d4f173ba8ea@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 5 Apr 2024, Jan Beulich wrote:
> On 05.04.2024 02:18, Stefano Stabellini wrote:
> > On Wed, 3 Apr 2024, Nicola Vetrini wrote:
> >> On 2024-04-03 08:33, Jan Beulich wrote:
> >>> On 02.04.2024 09:22, Federico Serafini wrote:
> >>>> Use pseudo-keyword fallthrough to meet the requirements to deviate
> >>>> MISRA C:2012 Rule 16.3 ("An unconditional `break' statement shall
> >>>> terminate every switch-clause").
> >>>>
> >>>> No functional change.
> >>>>
> >>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> >>>> ---
> >>>>  xen/common/sched/credit2.c | 2 +-
> >>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
> >>>> index c76330d79d..0962b52415 100644
> >>>> --- a/xen/common/sched/credit2.c
> >>>> +++ b/xen/common/sched/credit2.c
> >>>> @@ -3152,8 +3152,8 @@ static int cf_check csched2_sys_cntl(
> >>>>              printk(XENLOG_INFO "Disabling context switch rate
> >>>> limiting\n");
> >>>>          prv->ratelimit_us = params->ratelimit_us;
> >>>>          write_unlock_irqrestore(&prv->lock, flags);
> >>>> +        fallthrough;
> >>>>
> >>>> -    /* FALLTHRU */
> >>>>      case XEN_SYSCTL_SCHEDOP_getinfo:
> >>>>          params->ratelimit_us = prv->ratelimit_us;
> >>>>          break;
> >>>
> >>> Hmm, the description doesn't say what's wrong with the comment. Furthermore
> >>> docs/misra/rules.rst doesn't mention "fallthrough" at all, nor the
> >>> alternative of using comments. I notice docs/misra/deviations.rst does, and
> >>> there the specific comment used here isn't covered. That would want saying
> >>> in the description.
> >>>
> >>> Stefano (and others) - in this context it becomes noticeable that having
> >>> stuff scattered across multiple doc files isn't necessarily helpful. Other
> >>> permissible keywords are mentioned in rules.rst. The pseudo-keyword
> >>> "fallthrough" as well as comments are mentioned on deviations.rst. Could
> >>> you remind me of the reason(s) why things aren't recorded in a single,
> >>> central place?
> >>>
> >>> Jan
> >>
> >> If I recall correctly, the idea was to avoid rules.rst from getting too long
> >> and too specific about which patterns were deviated, while also having a
> >> precise record of the MISRA deviations that didn't live in ECLAIR-specific
> >> files. Maybe the use of the pseudo-keyword emerged after the rule was added to
> >> rules.rst, since deviations.rst is updated more frequently.
> > 
> > Yes exactly.
> > 
> > I agree with Jan that a single central place is easiest but we cannot
> > move everything that is in deviations.rst in the note section of the
> > rules.rst table. Of the two, it would be best to reduce the amount of
> > notes in rules.rst and move all the deviations listed in rules.rst to
> > deviations.rst. That way at least the info is present only once,
> > although they are 2 files.
> 
> Could every rules.rst section having a deviations.rst counterpart then perhaps
> have a standardized referral to there?

+1

