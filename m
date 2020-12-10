Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 433432D50F4
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 03:41:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48952.86625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knBtE-0005RR-LJ; Thu, 10 Dec 2020 02:41:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48952.86625; Thu, 10 Dec 2020 02:41:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knBtE-0005R2-Hr; Thu, 10 Dec 2020 02:41:08 +0000
Received: by outflank-mailman (input) for mailman id 48952;
 Thu, 10 Dec 2020 02:41:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JUBE=FO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1knBtC-0005Qx-PP
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 02:41:06 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a80a1375-7662-4df5-82e4-24a5d3d2d72a;
 Thu, 10 Dec 2020 02:41:06 +0000 (UTC)
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
X-Inumbo-ID: a80a1375-7662-4df5-82e4-24a5d3d2d72a
Date: Wed, 9 Dec 2020 18:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607568065;
	bh=UKaPPHmdU53tv8J1sCQYzI3p26iWcq1dUNTz0WcaJQQ=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=s2JIY3CITk4vPYvXGvtLvVgI2MJHimmpb42MLcu+mvz/eu18m/qJ4Nz5VRmvgQYfL
	 Si4d4msNg2IncP5iGm0ivqd9C6yZTorTjneUMSwJXxtWQatKj0ZqQpjNFeb+xGxisq
	 hkNwsZcOeiBdeqaX1RjkAhMROMy5ygZl5nOmkFiWB56JkJb5LvT9gd9t8s0ieE+F5z
	 DDgUBAFVwfpfM9TcVzdaQA8Kph+zEZDe/oqsUbY0S+pon7lPRssYupO8yar2NzACdb
	 +g6SH7HS32GidyPgPJdgbGbBzmUwp63upMATjmGrU3b/2xxplaSto6b/qhusguIFgj
	 jFvSJfKC5DXpA==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org, famzheng@amazon.com, 
    cardoe@cardoe.com, Bertrand.Marquis@arm.com, julien@xen.org, 
    andrew.cooper3@citrix.com
Subject: Re: [PATCH v6 00/25] xl / libxl: named PCI pass-through devices
In-Reply-To: <alpine.DEB.2.21.2012091046400.20986@sstabellini-ThinkPad-T480s>
Message-ID: <alpine.DEB.2.21.2012091839430.20986@sstabellini-ThinkPad-T480s>
References: <160746448732.12203.10647684023172140005@600e7e483b3a> <alpine.DEB.2.21.2012081702420.20986@sstabellini-ThinkPad-T480s> <20201209161433.d7xpx5zwtikd3fmk@liuwe-devbox-debian-v2> <alpine.DEB.2.21.2012091046400.20986@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 9 Dec 2020, Stefano Stabellini wrote:
> On Wed, 9 Dec 2020, Wei Liu wrote:
> > On Tue, Dec 08, 2020 at 05:02:50PM -0800, Stefano Stabellini wrote:
> > > The pipeline failed because the "fedora-gcc-debug" build failed with a
> > > timeout: 
> > > 
> > > ERROR: Job failed: execution took longer than 1h0m0s seconds
> > > 
> > > given that all the other jobs passed (including the other Fedora job), I
> > > take this failed because the gitlab-ci x86 runners were overloaded?
> > > 
> > 
> > The CI system is configured to auto-scale as the number of jobs grows.
> > The limit is set to 10 (VMs) at the moment.
> > 
> > https://gitlab.com/xen-project/xen-gitlab-ci/-/commit/832bfd72ea3a227283bf3df88b418a9aae95a5a4
> > 
> > I haven't looked at the log, but the number of build jobs looks rather
> > larger than when we get started. Maybe the limit of 10 is not good
> > enough?
> 
> Interesting! That's only for the x86 runners, not the ARM runners (we
> only have 1 ARM64 runner), is that right?
> 
> If we could increase the number of VMs for x86 I think that would be
> helpful because we have very many x86 jobs.

I don't know what is going on but at the moment there seems to be only
one x86 build active
(https://gitlab.com/xen-project/patchew/xen/-/pipelines/227280736).
Should there be at least 3 of them?

