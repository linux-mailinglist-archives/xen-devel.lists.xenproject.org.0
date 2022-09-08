Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A695D5B27D7
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 22:41:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403605.645753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWOJu-0005Pt-1w; Thu, 08 Sep 2022 20:40:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403605.645753; Thu, 08 Sep 2022 20:40:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWOJt-0005Nx-VK; Thu, 08 Sep 2022 20:40:17 +0000
Received: by outflank-mailman (input) for mailman id 403605;
 Thu, 08 Sep 2022 20:40:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5KOk=ZL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oWOJt-0005Nr-17
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 20:40:17 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70eecd5d-2fb6-11ed-a31c-8f8a9ae3403f;
 Thu, 08 Sep 2022 22:40:15 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EF65061E14;
 Thu,  8 Sep 2022 20:40:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EC18C433D6;
 Thu,  8 Sep 2022 20:40:12 +0000 (UTC)
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
X-Inumbo-ID: 70eecd5d-2fb6-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662669613;
	bh=08NehVnCTlBWwkrfZz9F40ObsujsF1ultqYkmk3lmoI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=th+x/B1v0j4Erko+4qzhOh1aqSGrcpIDGk3cjZthg55ifqSTdMeD83/u2KoJ1Udxy
	 4fvDQ2ocUuvbcot3UhYOSCgK9BZvPFnbW0kj1uYrtwmfQR2g2PHo8o2HtxAQ33vTWL
	 siJ+T1JFPn0euNy4MNJ8GnQYDOB2gM1/aqYxNF+KzdSE7rSYZnWsM62U2rtkZurCs9
	 xDnEO2Ef5KrrzhxxRbx6hRr8xFRDouxf7mpnbkrRo4LzuzyG9d4elid0AQ/TXtDePY
	 6TqRpfNCbhtRqmO9zBDxKjvKdlStdmVFYeCS7NuvmCuBcO/RUCm+pu4dqDliRJRU/z
	 V6twpA7/cAR6w==
Date: Thu, 8 Sep 2022 13:40:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 7/7] xen/arm: introduce xen-evtchn dom0less property
In-Reply-To: <4e561e37-d911-4be9-f50d-3799c71ee3cf@xen.org>
Message-ID: <alpine.DEB.2.22.394.2209081339150.157835@ubuntu-linux-20-04-desktop>
References: <cover.1662563170.git.rahul.singh@arm.com> <f56939423b0b2d9330ff5e88f5f52e5a538f52d0.1662563170.git.rahul.singh@arm.com> <alpine.DEB.2.22.394.2209071704180.157835@ubuntu-linux-20-04-desktop> <4e561e37-d911-4be9-f50d-3799c71ee3cf@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 8 Sep 2022, Julien Grall wrote:
> On 08/09/2022 01:04, Stefano Stabellini wrote:
> > On Wed, 7 Sep 2022, Rahul Singh wrote:
> > > Introduce a new sub-node under /chosen node to establish static event
> > > channel communication between domains on dom0less systems.
> > > 
> > > An event channel will be created beforehand to allow the domains to
> > > send notifications to each other.
> > > 
> > > Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> > 
> > For the DT binding:
> > 
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> This is now committed but I didn't notice the "For the DT binding" above. So I
> mistakenly interpreted this as you reviewed everything. Let me know if that's
> a problem with you.

No problems, I looked at the commit now and everything looks good
anyway.


> For the future may I ask to use suffix with "# DT binding" as this is easier
> to spot when using automatic tools (e.g. b4)?

I think that's a good idea.

