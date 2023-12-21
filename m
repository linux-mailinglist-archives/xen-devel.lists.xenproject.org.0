Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6697181C221
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 00:50:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659179.1028669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGSnP-0000eC-Bp; Thu, 21 Dec 2023 23:49:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659179.1028669; Thu, 21 Dec 2023 23:49:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGSnP-0000bq-8w; Thu, 21 Dec 2023 23:49:43 +0000
Received: by outflank-mailman (input) for mailman id 659179;
 Thu, 21 Dec 2023 23:49:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aYn2=IA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rGSnO-0000bk-1T
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 23:49:42 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 990cef16-a05b-11ee-9b0f-b553b5be7939;
 Fri, 22 Dec 2023 00:49:38 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2A69361B05;
 Thu, 21 Dec 2023 23:49:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F2B0C433C7;
 Thu, 21 Dec 2023 23:49:34 +0000 (UTC)
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
X-Inumbo-ID: 990cef16-a05b-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703202575;
	bh=SwNMOj202GOByAQeR5BF/lucWnGfK6qculVY5Cw+BYs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=B8Aon0hBPnG3ku6+0PX3Y/fO9WmMpYkscR/pwyeC2tD6+uUxfEsoeW55cR7+XERXe
	 F6El7FMMZxdAk5rXUVgVCbCm8/Qv0a+cwNomz59lj1NfyieZWDnRDNRXPsY56tcTRH
	 OIuW521om6gJU+gl/yO0hd/RtDns9540m6Ry4LvPU3LnZOSfSqmwUdPpUwm14XJA/V
	 ZVHcfHb0zSEOsPgZNeXXiEah6tORqG0YQPuhUbqESNKpNvnlHlMw3m6vtGaDdD4cWb
	 /0c9CXNyibzKHlmUwmfBCVHnTey/0bo3yIFZRxbBD8s8ImlKG++puRCeuuway8JiQh
	 ezTfFRIsCtGZQ==
Date: Thu, 21 Dec 2023 15:49:33 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Federico Serafini <federico.serafini@bugseng.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
    consulting@bugseng.com, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 5/7] xen/arm: v{cp,sys}reg: address violations of
 MISRA C:2012 Rule 16.3
In-Reply-To: <919b2fc9-08a6-4bec-842d-f1bba98b44c1@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2312211548250.685950@ubuntu-linux-20-04-desktop>
References: <cover.1703066935.git.federico.serafini@bugseng.com> <541bc4fd47d26b12ea131590bf0c49f7c92d9368.1703066935.git.federico.serafini@bugseng.com> <0200354e-08b9-4136-b6e9-3220a51256af@xen.org> <9e9e3086-6311-4a76-8624-a06d52e7ec0b@suse.com>
 <c3a128d9-dea8-4e05-b292-1a6a04fb0daf@bugseng.com> <alpine.DEB.2.22.394.2312201008070.685950@ubuntu-linux-20-04-desktop> <e5a812ab-faaf-47fd-bada-9b19e0c94bcc@citrix.com> <6f3e64d1-5719-4960-9f60-0497a8ccea00@bugseng.com>
 <919b2fc9-08a6-4bec-842d-f1bba98b44c1@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1776906130-1703202526=:685950"
Content-ID: <alpine.DEB.2.22.394.2312211549100.685950@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1776906130-1703202526=:685950
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2312211549101.685950@ubuntu-linux-20-04-desktop>

On Thu, 21 Dec 2023, Andrew Cooper wrote:
> On 21/12/2023 10:29 am, Federico Serafini wrote:
> > On 20/12/23 22:23, Andrew Cooper wrote:
> >> On 20/12/2023 6:24 pm, Stefano Stabellini wrote:
> >>> On Wed, 20 Dec 2023, Federico Serafini wrote:
> >>>> On 20/12/23 12:55, Jan Beulich wrote:
> >>>>> On 20.12.2023 12:48, Julien Grall wrote:
> >>>>>> On 20/12/2023 11:03, Federico Serafini wrote:
> >>>>>>> --- a/xen/arch/arm/arm64/vsysreg.c
> >>>>>>> +++ b/xen/arch/arm/arm64/vsysreg.c
> >>>>>>> @@ -210,8 +210,8 @@ void do_sysreg(struct cpu_user_regs *regs,
> >>>>>>>             /* RO at EL0. RAZ/WI at EL1 */
> >>>>>>>             if ( regs_mode_is_user(regs) )
> >>>>>>>                 return handle_ro_raz(regs, regidx,
> >>>>>>> hsr.sysreg.read, hsr,
> >>>>>>> 0);
> >>>>>>> -        else
> >>>>>>> -            return handle_raz_wi(regs, regidx, hsr.sysreg.read,
> >>>>>>> hsr,
> >>>>>>> 1);
> >>>>>>> +
> >>>>>>> +        return handle_raz_wi(regs, regidx, hsr.sysreg.read,
> >>>>>>> hsr, 1);
> >>>>>> I don't 100% like this change (mostly because I find if/else clearer
> >>>>>> here).
> >>>>> While (it doesn't matter here) my view on this is different, I'm
> >>>>> still
> >>>>> puzzled why the tool would complain / why a change here is necessary.
> >>>>> It is not _one_ return statement, but there's still (and
> >>>>> obviously) no
> >>>>> way of falling through.
> >>>> The tool is configurable:
> >>>> if you prefer deviate these cases instead of refactoring the code
> >>>> I can update the configuration.
> >>>   If you say "deviation", it implies that there is a violation. I think
> >>> Jan's point was that both code versions shouldn't be any different.
> >>>
> >>> # option-1
> >>> if (a)
> >>>    return f1();
> >>> else
> >>>    return f2();
> >>>
> >>> # option-2
> >>> if (a)
> >>>    return f1();
> >>> return f2();
> >>>
> >>> Both options are equally guaranteed to always return. It looks like a
> >>> peculiar limitation to only recognize option-2 as something that
> >>> returns
> >>> 100% of the times. Also option-1 returns 100% of the times. What am I
> >>> missing?
> >
> > I don't think this is necessarily a limitation because it highlights
> > cases where an if-else could be replaced with a simple if:
> > some may find an if-else clearer, other may find the single if clearer.
> >
> > From a safety point of view both options are safe because there
> > is no risk of unintentional fall through.
> >
> > If you all agree on the fact that small code refactoring like the ones I
> > proposed are counterproductive, then I can update the tool configuration
> > to consider also option-1 as safe.
> 
> I would certainly prefer if we could continue to use option 1.

Yes, that is my preference too
--8323329-1776906130-1703202526=:685950--

