Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C62F290FA57
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 02:36:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744061.1151067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sK5lb-0007uV-FB; Thu, 20 Jun 2024 00:35:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744061.1151067; Thu, 20 Jun 2024 00:35:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sK5lb-0007sB-C1; Thu, 20 Jun 2024 00:35:07 +0000
Received: by outflank-mailman (input) for mailman id 744061;
 Thu, 20 Jun 2024 00:35:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QH02=NW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sK5la-0007s5-Hc
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 00:35:06 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id efa6b6ff-2e9c-11ef-90a3-e314d9c70b13;
 Thu, 20 Jun 2024 02:35:05 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 880D562032;
 Thu, 20 Jun 2024 00:35:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C444EC2BBFC;
 Thu, 20 Jun 2024 00:35:01 +0000 (UTC)
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
X-Inumbo-ID: efa6b6ff-2e9c-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718843703;
	bh=/i83Z4IVxiWl8LKZpTXrkGw55w5Mz0KJLsQVWjxe3Zk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EGOD7Y81Uc+jRbQXXxiZ0j12rSx5kWJCLWK74FdVjcl/mLhWxzW88c772nprFev7D
	 BbeOZdmH4eMGVM1gTcPSd2JOT/AZuATNlLpzbvt/wmI+rYYqjAHJqh+UcceZ8+AKPA
	 n4D/pZlGaqq/uOq0fwHTjjJzWYjLvgzA61fUGDZz2/lRQo9wkuZYsqQWg8sWsLSTwk
	 yTOFKM73ypBscnkat5ug+KMp1/o9nxq5OD2H7Pm/xO4Z1QXfP1kfiNm5ofIHNB2I9L
	 3A7xZ80wQM8nj7ntu62n0ufsfR0lygGCtCTa9bIDRtrltrgwpWdhYAiZxk5gouWJMN
	 7JDQvEIFAcG0Q==
Date: Wed, 19 Jun 2024 17:35:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "Oleksii K." <oleksii.kurochko@gmail.com>, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, 
    Henry Wang <xin.wang2@amd.com>, Alec Kwapis <alec.kwapis@medtronic.com>, 
    "Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v4 2/4] xen/arm: Alloc XenStore page for Dom0less DomUs
 from hypervisor
In-Reply-To: <fb6809b3-ee14-4baa-b6fa-bd2171d61c4b@xen.org>
Message-ID: <alpine.DEB.2.22.394.2406191734530.2572888@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2405241552240.2557291@ubuntu-linux-20-04-desktop> <20240524225522.2878481-2-stefano.stabellini@amd.com> <697aadfd-a8c1-4f1b-8806-6a5acbf343ba@xen.org> <b9c8e762af9ca04d9194fdaa0379f2fe9096af29.camel@gmail.com>
 <alpine.DEB.2.22.394.2406181734140.2572888@ubuntu-linux-20-04-desktop> <fb6809b3-ee14-4baa-b6fa-bd2171d61c4b@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 18 Jun 2024, Julien Grall wrote:
> Hi Stefano,
> 
> On 19/06/2024 01:37, Stefano Stabellini wrote:
> > On Mon, 27 May 2024, Oleksii K. wrote:
> > > > I don't think it is a big problem if this is not merged for the code
> > > > freeze as this is technically a bug fix.
> > > 
> > > Agree, this is not a problem as it is still looks to me as a bug fix.
> > > 
> > > ~ Oleksii
> > 
> > Hi Oleksii, this version of the series was already all acked with minor
> > NITs and you gave the go-ahead for this release as it is a bug fix. Due
> > to 2 weeks of travels I only managed to commit the series now, sorry for
> > the delay.
> 
> Unfortunately this series is breaking gitlab CI [1]. I understand the go ahead
> was given two weeks ago, but as we are now past the code freeze, I feel we
> should have had a pros/cons e-mail to assess whether it was worth the risk to
> merge it.
> 
> Now to the issues, I vaguely recall this series didn't require any change in
> Linux. Did I miss anything? If so, why are we breaking Linux?
> 
> For now, I will revert this series. Once we root cause the issue, we can
> re-assess whether the fix should be apply for 4.19.

Hi Julien,

Thanks for acting quickly on this. Reverting the series was the right
thing to do, and I apologize for not waiting for the gitlab-ci results
before committing it.

Like you, my understanding was also that there were no Linux changes
required. I think this will need a deeper investigation that we can do
after the 4.19 release.

Thanks again for unblocking the tree quickly.

- Stefano

