Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9616E8CEC75
	for <lists+xen-devel@lfdr.de>; Sat, 25 May 2024 00:37:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729935.1135263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAdWm-0006Zx-6E; Fri, 24 May 2024 22:36:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729935.1135263; Fri, 24 May 2024 22:36:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAdWm-0006YQ-2W; Fri, 24 May 2024 22:36:44 +0000
Received: by outflank-mailman (input) for mailman id 729935;
 Fri, 24 May 2024 22:36:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K6bJ=M3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sAdWj-0006YK-T4
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 22:36:41 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15854dde-1a1e-11ef-b4bb-af5377834399;
 Sat, 25 May 2024 00:36:39 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 015AF63213;
 Fri, 24 May 2024 22:36:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 824EDC2BBFC;
 Fri, 24 May 2024 22:36:36 +0000 (UTC)
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
X-Inumbo-ID: 15854dde-1a1e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716590197;
	bh=FD3LbHotEvN7GcWuRojZMB3q2dpVE2HQASc0TM7igCc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BV6oKu/O4bShNOV1esRebtOo7jfGqlVP4lwLxSTdZfSYy3X/gfsezGeJjYqBVkMuB
	 FOJHEJ6q8jyIHrvEOJ/5ho6rxOWrNKC5BVNbOgN7ziUE2LbvDa2KIxd9EF2GxdJFBa
	 5ulYVwG4wpqYwhMfZUJ1sgGEXjP7nMYUlhU4qTN2UcJeAkI0yRg0DpsjtiNvsu0uMC
	 PJxPdUeJ9ibkm2vlg0S3JKS6mnC5ihV8OSVClVis0VT67heCqfkwNSXWMHsu8tps3M
	 lQXAnalrgcZWh6/mwO9Jc9U7XUQQ4pgwIO3+e2mD8dDzKsz5z7i/sQ47OX69t6HOF3
	 a9PsoLQFA+AKA==
Date: Fri, 24 May 2024 15:36:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry Wang <xin.wang2@amd.com>
cc: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org, 
    Luca Fancellu <Luca.Fancellu@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 1/4] xen/arm/static-shmem: Static-shmem should be
 direct-mapped for direct-mapped domains
In-Reply-To: <e53fbcba-f7dd-48a5-9481-a69bfb501cee@amd.com>
Message-ID: <alpine.DEB.2.22.394.2405241535570.2557291@ubuntu-linux-20-04-desktop>
References: <20240517032156.1490515-1-xin.wang2@amd.com> <20240517032156.1490515-2-xin.wang2@amd.com> <ee20798f-a459-492a-a7a1-308472878fe1@amd.com> <86c91b57-68b4-4271-87ec-b80525ed3373@amd.com> <f0342d7a-1275-4a28-9688-326f07334a71@amd.com>
 <c0b59ccd-b3b0-4495-bbb4-2855fa2d7d16@amd.com> <93336435-309d-4aa5-9977-9ce0d4725811@amd.com> <e53fbcba-f7dd-48a5-9481-a69bfb501cee@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 21 May 2024, Henry Wang wrote:
> Hi Michal,
> 
> On 5/21/2024 12:09 AM, Michal Orzel wrote:
> > > > > Thanks. I will take the tag if you are ok with above diff (for the
> > > > > case
> > > > > if this series goes in later than Luca's).
> > > > I would move this check to process_shm() right after "gbase =
> > > > dt_read_paddr" setting.
> > > > This would be the most natural placement for such a check.
> > > That sounds good. Thanks! IIUC we only need to add the check for the
> > > pbase != INVALID_PADDR case correct?
> > Yes, but at the same time I wonder whether we should also return error if a
> > user omits pbase
> > for direct mapped domain.
> 
> I think this makes sense. So I will add also a check for the case if users
> omit pbase in the device tree for the direct mapped domain.

I fixed the NIT and added the ack, but as Luca's series hasn't been
committed yet, I have not made this change. I'll leave it to Julien when
he commits both series.

