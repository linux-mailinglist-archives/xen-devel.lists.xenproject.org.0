Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EED4C51CAB1
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 22:34:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322391.543676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmiAz-0003Vi-MT; Thu, 05 May 2022 20:34:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322391.543676; Thu, 05 May 2022 20:34:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmiAz-0003Su-JP; Thu, 05 May 2022 20:34:17 +0000
Received: by outflank-mailman (input) for mailman id 322391;
 Thu, 05 May 2022 20:34:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YLaE=VN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nmiAy-0003So-5V
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 20:34:16 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba923968-ccb2-11ec-8fc4-03012f2f19d4;
 Thu, 05 May 2022 22:34:15 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3369AB8304D;
 Thu,  5 May 2022 20:34:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02C12C385A8;
 Thu,  5 May 2022 20:34:11 +0000 (UTC)
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
X-Inumbo-ID: ba923968-ccb2-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651782852;
	bh=8XtDg73D5fKesmCZ+iFkxHSPPyrm4eeztlih3xK5bdg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sQ2O6lWqzLSDE2G/jU+qTI0a4yNztplD55IgN+kV/3+CCVbeYsvQC5+HrfSAQS2TJ
	 Y7hcbU06F3TI+MbmJaRBpHaYqmc0gXs6nafthQovVjzT2fDHCgKAkWy4Px/5FYCPDq
	 s0vRbLN6XESpCuKOrgJnHEZrO8wB1SJdqa4ZK/2hz6pBOWu6gk+JzBXLXSHlpToph6
	 O27lrcVVl6Qy1JUk5fosLdFqpB2K14MV+iAGCYx3942gVs7Js1jU7RgPQo2MvR7nlG
	 zIZe6M6VYx4wthsDObfAoZtaY6238JZYT7z+0o+MDXQ1sL6JrE34C+fb4NxnklYJXO
	 5+mNfNwN93ewg==
Date: Thu, 5 May 2022 13:34:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Michal Orzel <michal.orzel@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] xen/arm: gnttab: modify macros to evaluate all
 arguments and only once
In-Reply-To: <d15e279f-fb99-6d86-8eac-8385ee24723d@suse.com>
Message-ID: <alpine.DEB.2.22.394.2205051333560.43560@ubuntu-linux-20-04-desktop>
References: <20220505103601.322110-1-michal.orzel@arm.com> <20220505103601.322110-3-michal.orzel@arm.com> <0bf31f91-9a05-ac91-a258-d28d6ad9084d@suse.com> <77ba649d-89b6-8a15-191f-6e4261b7e381@arm.com> <d15e279f-fb99-6d86-8eac-8385ee24723d@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 5 May 2022, Jan Beulich wrote:
> On 05.05.2022 13:25, Michal Orzel wrote:
> > On 05.05.2022 13:20, Jan Beulich wrote:
> >> On 05.05.2022 12:36, Michal Orzel wrote:
> >>> Modify macros to evaluate all the arguments and make sure the arguments
> >>> are evaluated only once. While doing so, use typeof for basic types
> >>> and use const qualifier when applicable.
> >>
> >> Why only for basic types? To take an example, passing void * into
> >> gnttab_need_iommu_mapping() would imo also better not work.
> >>
> > Just by looking at the majority of macros in Xen, typeof is used mostly for basic data types.
> > Also I think it is better to explictly use a struct type for better readability.
> > Otherwise one need to search in other files, to what type does typeof evaluates.
> > 
> >>> @@ -98,13 +104,36 @@ int replace_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
> >>>  })
> >>>  
> >>>  #define gnttab_shared_gfn(d, t, i)                                       \
> >>> -    (((i) >= nr_grant_frames(t)) ? INVALID_GFN : (t)->arch.shared_gfn[i])
> >>> +    ({                                                                   \
> >>> +        const struct domain *d_ = (d);                                   \
> >>> +        const struct grant_table *t_ = (t);                              \
> >>> +        const typeof(i) i_ = (i);                                        \
> >>> +                                                                         \
> >>> +        if ( d_ != NULL )                                                \
> >>> +            ASSERT(d_->grant_table == t_);                               \
> >>
> >> I'm puzzled by this NULL check (and the similar instance further down):
> >> Are you suggesting NULL can legitimately come into here? If not, maybe
> >> better ASSERT(d_ && d_->grant_table == t_)?
> >>
> > Example:
> > NULL is coming explictly from macro gnttab_get_frame_gfn right above gnttab_shared_gfn.
> 
> Hmm, that's pretty odd (and Arm specific). Just like with the other remark
> above, it'll be the Arm maintainers to judge, but here I think the NULLs
> would better be done away with, by introducing intermediate macros, e.g.

I am fine with Jan's comments on both patches

