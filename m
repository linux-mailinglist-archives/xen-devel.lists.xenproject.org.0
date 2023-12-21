Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAF181C222
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 00:50:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659180.1028680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGSnb-0000vO-L3; Thu, 21 Dec 2023 23:49:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659180.1028680; Thu, 21 Dec 2023 23:49:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGSnb-0000se-Fz; Thu, 21 Dec 2023 23:49:55 +0000
Received: by outflank-mailman (input) for mailman id 659180;
 Thu, 21 Dec 2023 23:49:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aYn2=IA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rGSnZ-0000bk-N8
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 23:49:53 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a23fe1a8-a05b-11ee-9b0f-b553b5be7939;
 Fri, 22 Dec 2023 00:49:52 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 8C93CB821ED;
 Thu, 21 Dec 2023 23:49:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEF77C433C9;
 Thu, 21 Dec 2023 23:49:49 +0000 (UTC)
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
X-Inumbo-ID: a23fe1a8-a05b-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703202590;
	bh=c7UFgY5BA3NZh9MtCJs8f3vUqJ+/fEdxU/2esIVx6Ac=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Czq0SsmO0AX+A1Lv7ZgB2LuD/xCDJZB+4a2PdzQAufkl3124BsOCIb9PBn6Jl6bvr
	 1q52f8mkpRmPLxQgTjyt/VZXnNsFhnapyvPq5XQ/nUksvLT6j4mvj5z4M8kS/Ce2cD
	 jkXrWzby6AZQet+I6uoFLJoE+nzSOwxRElGZRZGOO7+dNUiG7aU/PfHLTa8WzUUemt
	 cTtYk92PRRf7LjLTpCj0TLkCUXUdhhM7eMKDFZmQ+z9Vo7q9LrdBHFNejTjCKLRiE4
	 eKW09X2wn6FG+0wkCLimMPSsRMIUxgG3dspFgiNLNiAxckcjaINziXqmFmh6RRieAC
	 CiNs3MSbgzOiA==
Date: Thu, 21 Dec 2023 15:49:48 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Federico Serafini <federico.serafini@bugseng.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, consulting@bugseng.com, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH 5/7] xen/arm: v{cp,sys}reg: address violations of
 MISRA C:2012 Rule 16.3
In-Reply-To: <7483df1c-34f8-4e0e-aad4-c78f219c3d67@suse.com>
Message-ID: <alpine.DEB.2.22.394.2312211549390.685950@ubuntu-linux-20-04-desktop>
References: <cover.1703066935.git.federico.serafini@bugseng.com> <541bc4fd47d26b12ea131590bf0c49f7c92d9368.1703066935.git.federico.serafini@bugseng.com> <0200354e-08b9-4136-b6e9-3220a51256af@xen.org> <9e9e3086-6311-4a76-8624-a06d52e7ec0b@suse.com>
 <c3a128d9-dea8-4e05-b292-1a6a04fb0daf@bugseng.com> <7483df1c-34f8-4e0e-aad4-c78f219c3d67@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 21 Dec 2023, Jan Beulich wrote:
> On 20.12.2023 13:15, Federico Serafini wrote:
> > On 20/12/23 12:55, Jan Beulich wrote:
> >> On 20.12.2023 12:48, Julien Grall wrote:
> >>> On 20/12/2023 11:03, Federico Serafini wrote:
> >>>> --- a/xen/arch/arm/arm64/vsysreg.c
> >>>> +++ b/xen/arch/arm/arm64/vsysreg.c
> >>>> @@ -210,8 +210,8 @@ void do_sysreg(struct cpu_user_regs *regs,
> >>>>            /* RO at EL0. RAZ/WI at EL1 */
> >>>>            if ( regs_mode_is_user(regs) )
> >>>>                return handle_ro_raz(regs, regidx, hsr.sysreg.read, hsr, 0);
> >>>> -        else
> >>>> -            return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 1);
> >>>> +
> >>>> +        return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 1);
> >>>
> >>> I don't 100% like this change (mostly because I find if/else clearer
> >>> here).
> >>
> >> While (it doesn't matter here) my view on this is different, I'm still
> >> puzzled why the tool would complain / why a change here is necessary.
> >> It is not _one_ return statement, but there's still (and obviously) no
> >> way of falling through.
> > 
> > The tool is configurable:
> > if you prefer deviate these cases instead of refactoring the code
> > I can update the configuration.
> 
> I guess this then needs to be discussed on the first call in the new year.
> Stefano - can you take note of that, please?

Yes, will do

