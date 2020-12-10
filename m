Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F081D2D6975
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 22:08:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49920.88277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knTAg-0002tF-Qq; Thu, 10 Dec 2020 21:08:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49920.88277; Thu, 10 Dec 2020 21:08:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knTAg-0002sq-NM; Thu, 10 Dec 2020 21:08:18 +0000
Received: by outflank-mailman (input) for mailman id 49920;
 Thu, 10 Dec 2020 21:08:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JUBE=FO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1knTAe-0002sl-Ph
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 21:08:16 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23a2b38f-d31d-469a-8a06-b7fb7a38cfc7;
 Thu, 10 Dec 2020 21:08:16 +0000 (UTC)
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
X-Inumbo-ID: 23a2b38f-d31d-469a-8a06-b7fb7a38cfc7
Date: Thu, 10 Dec 2020 13:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607634495;
	bh=f0+B46ne+W0cDoni+oCaiX6Lb/zEDd88jj5OahkV8GY=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=GEDiMAzM5txj/HavJrVIwc6L+aQZ+96gHeGfnWgXt8dGQVVxJLx1xHOz5dQYfztHo
	 gJd7QfWPM2+wTOPYDd4epfRWR1B7IUuFdfWIRPLULOrhVtTdJeBpJfUkdFCYVBPUBa
	 8TsgrFtSc08xpaYspRE0BpLZSE7vZiqoO+NkebleikrxbKM97ziuuFWcnCU4/v2MjN
	 Q33QqVyoMp52RGGUqgnPTguLoubQfx4j1GFfmlR1MfJBQxm8xx0i91DdWz7tO1rWX6
	 1Ey5MXZhNQiaJURStJDxpdXOKgeD5EbIlx3DzcPbmKFx3YcRFGmagTYdzQHaZe5ioI
	 f0nfV7MElEPmQ==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Liu <wl@xen.org>, cardoe@cardoe.com
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, famzheng@amazon.com, 
    Bertrand.Marquis@arm.com, julien@xen.org, andrew.cooper3@citrix.com
Subject: gitlab-docker-machine-oyster failure,  Was: [PATCH v6 00/25] xl /
 libxl: named PCI pass-through devices
In-Reply-To: <20201210155638.mxjx4zmjqmcpk7z3@liuwe-devbox-debian-v2>
Message-ID: <alpine.DEB.2.21.2012101305510.20986@sstabellini-ThinkPad-T480s>
References: <160746448732.12203.10647684023172140005@600e7e483b3a> <alpine.DEB.2.21.2012081702420.20986@sstabellini-ThinkPad-T480s> <20201209161433.d7xpx5zwtikd3fmk@liuwe-devbox-debian-v2> <alpine.DEB.2.21.2012091046400.20986@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.2012091839430.20986@sstabellini-ThinkPad-T480s> <20201210155638.mxjx4zmjqmcpk7z3@liuwe-devbox-debian-v2>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Doug,

After chatting with Wei on IRC, it became obvious that the issue is that
gitlab-docker-machine-oyster failed, see its grey status here under
"Runners":

https://gitlab.com/xen-project/patchew/xen/-/settings/ci_cd

Maybe it is just a matter of rebooting the VM? Doug, could you give it a
try?

Thank you!

Cheers,

Stefano



On Thu, 10 Dec 2020, Wei Liu wrote:
> On Wed, Dec 09, 2020 at 06:41:03PM -0800, Stefano Stabellini wrote:
> > On Wed, 9 Dec 2020, Stefano Stabellini wrote:
> > > On Wed, 9 Dec 2020, Wei Liu wrote:
> > > > On Tue, Dec 08, 2020 at 05:02:50PM -0800, Stefano Stabellini wrote:
> > > > > The pipeline failed because the "fedora-gcc-debug" build failed with a
> > > > > timeout: 
> > > > > 
> > > > > ERROR: Job failed: execution took longer than 1h0m0s seconds
> > > > > 
> > > > > given that all the other jobs passed (including the other Fedora job), I
> > > > > take this failed because the gitlab-ci x86 runners were overloaded?
> > > > > 
> > > > 
> > > > The CI system is configured to auto-scale as the number of jobs grows.
> > > > The limit is set to 10 (VMs) at the moment.
> > > > 
> > > > https://gitlab.com/xen-project/xen-gitlab-ci/-/commit/832bfd72ea3a227283bf3df88b418a9aae95a5a4
> > > > 
> > > > I haven't looked at the log, but the number of build jobs looks rather
> > > > larger than when we get started. Maybe the limit of 10 is not good
> > > > enough?
> > > 
> > > Interesting! That's only for the x86 runners, not the ARM runners (we
> > > only have 1 ARM64 runner), is that right?
> > > 
> > > If we could increase the number of VMs for x86 I think that would be
> > > helpful because we have very many x86 jobs.
> > 
> > I don't know what is going on but at the moment there seems to be only
> > one x86 build active
> > (https://gitlab.com/xen-project/patchew/xen/-/pipelines/227280736).
> > Should there be at least 3 of them?
> 
> Not sure what you meant here. That pipeline is green.
> 
> It may take some time for the CI to scale up if it is "cold". By default
> there is only 1 standby runner to reduce cost.


