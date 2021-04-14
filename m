Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD2335FCBE
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 22:36:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110823.211720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWmEu-0003si-2a; Wed, 14 Apr 2021 20:35:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110823.211720; Wed, 14 Apr 2021 20:35:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWmEt-0003sJ-Vs; Wed, 14 Apr 2021 20:35:55 +0000
Received: by outflank-mailman (input) for mailman id 110823;
 Wed, 14 Apr 2021 20:35:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L4Ps=JL=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lWmEr-0003sE-Ky
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 20:35:53 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cf53aba5-7062-4694-bd22-72a3b9e26b29;
 Wed, 14 Apr 2021 20:35:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C5FE961164;
 Wed, 14 Apr 2021 20:35:51 +0000 (UTC)
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
X-Inumbo-ID: cf53aba5-7062-4694-bd22-72a3b9e26b29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1618432552;
	bh=QynS3xHiU6z/JoieIsEfA5J/DunL4t9vJbt89ndibAQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=o/8JFtZgjDyW3p6HIuzuRE+QcpEaA7QjCD/XlwS8p9n+yLI9ATLnUXHzeHP8qKWO1
	 fkpQmAr9HczESfMJfm6mjeLxlsDcjpFK+Rt7Kz+3DYupSRPG9gBSAm7A7KGf8bvk+Y
	 8ryN25nsIdNi4kfnBIriOdJWuCzcnEa3r7q2tErYxT30D4eASQKJzsY9FvJDnPkQz8
	 9uIdXSOgo4V1+bATnZjjhd7YrWipTplJ+0shkzlVt9Rju7c4Is2hC+H3voOpduQurq
	 CNXhXt0c3rAars8eBhkpJEX7z94b7Uehwe6sYYCsrtaiz/gLKr3KMGTNL3lfH/IByl
	 xOXugG11goGCQ==
Date: Wed, 14 Apr 2021 13:35:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Luca Fancellu <luca.fancellu@arm.com>
cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org, 
    Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH v4 2/4] xen/arm: Handle cases when hardware_domain is
 NULL
In-Reply-To: <F5760FAD-466F-46EC-A3A4-BAC2B5E73BC8@arm.com>
Message-ID: <alpine.DEB.2.21.2104141334270.4885@sstabellini-ThinkPad-T480s>
References: <20210414091404.14215-1-luca.fancellu@arm.com> <20210414091404.14215-3-luca.fancellu@arm.com> <3424d24f-b189-c125-7b84-96848bbdcfd7@xen.org> <04326BA4-6E73-44BA-AB19-8F2B99000D8B@arm.com> <269e20a7-9f2c-f989-0ea0-7ab6c6bb9c11@xen.org>
 <F5760FAD-466F-46EC-A3A4-BAC2B5E73BC8@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 14 Apr 2021, Luca Fancellu wrote:
> > On 14 Apr 2021, at 14:45, Julien Grall <julien@xen.org> wrote:
> > 
> > Hi Luca,
> > 
> > On 14/04/2021 12:29, Luca Fancellu wrote:
> >>> On 14 Apr 2021, at 12:16, Julien Grall <julien@xen.org> wrote:
> >>> 
> >>> Hi Luca,
> >>> 
> >>> On 14/04/2021 10:14, Luca Fancellu wrote:
> >>>> Among the common and arm codebase there are few cases where
> >>>> the hardware_domain variable is checked to see if the current
> >>>> domain is equal to the hardware_domain, change this cases to
> >>>> use is_hardware_domain() function instead. >
> >>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> >>>> ---
> >>>> v4 changes:
> >>>> - removed unneeded check for domain NULL from is_hardware_domain
> >>>>   introduced in v3
> >>> 
> >>> After this change, this patch is only avoid to open-code is_hardware_domain(). Although, it adds an extra speculation barrier.
> >>> 
> >>> I am not against the change, however I think the commit message needs to updated to match what the patch is doing.
> >>> 
> >>> Can you propose a new commit message?
> >> Hi Julien,
> >> Yes I agree, what about:
> >> xen/arm: Reinforce use of is_hardware_domain
> >> Among the common and arm codebase there are few cases where
> > 
> > I would drop 'common' because you are only modifying the arm codebase.
> > 
> >> the hardware_domain variable is checked to see if the current
> >> domain is equal to the hardware_domain, change this cases to
> >> use is_hardware_domain() function instead.
> > 
> > 
> >> In the eventuality that hardware_domain is NULL, is_hardware_domain
> >> will return false because an analysis of the common and arm codebase
> >> shows that is_hardware_domain is called always with a non NULL
> >> domain pointer.
> > 
> > This paragraph seems to come out of the blue. I would drop it.
> > 
> > How about:
> > 
> > "
> > There are a few places on Arm where we use pretty much an open-coded version of is_hardware_domain(). The main difference, is the helper will also block speculation (not yet implemented on Arm).
> > 
> > The existing users are not in hot path, so blocking speculation would not hurt when it is implemented. So remove the open-coded version within the arm codebase.
> > "
> > 
> > If you are happy with the commit message, I will commit it the series tomorrow (to give an opportunity to Stefano to review).
> > 
> 
> Hi Julien,
> 
> Yes your version is much better, thank you very much!

It looks great, thanks for your work on this!

