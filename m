Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B62EB86D2E1
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 20:10:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687397.1070805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rflmF-0002Zw-PO; Thu, 29 Feb 2024 19:09:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687397.1070805; Thu, 29 Feb 2024 19:09:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rflmF-0002Xc-LS; Thu, 29 Feb 2024 19:09:07 +0000
Received: by outflank-mailman (input) for mailman id 687397;
 Thu, 29 Feb 2024 19:09:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nI6L=KG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rflmD-0002XP-UO
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 19:09:06 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ffab313f-d735-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 20:09:02 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3B9AC61325;
 Thu, 29 Feb 2024 19:09:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 293EBC433B2;
 Thu, 29 Feb 2024 19:09:00 +0000 (UTC)
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
X-Inumbo-ID: ffab313f-d735-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709233741;
	bh=/8j+WRa1L45Y9Ru5UpgPpTU8E8b9p2u+DaXfN8JZnnc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CYABx7hpOmAtU6q1UqKnOOpd3j1lsWjbrR/7SmoMic+PtgVQiobk8mmbft3bqZKiZ
	 c5pZzSaliyPj8OiqHdAPlSCVef60ivWYVJ595ubmIGi/UW8LPBQ8BqbEKDXz8SbQo2
	 +pyQf/uaK2N67v5xDtdvy+Xe51ljGplBra/AP/aD1XqulvCozwKTSOyTXNtV5Prl1u
	 wSN4lb7DmKSd7gVKPWE97cYbB801RoT8ewuj5ZPRMJifZxHLeoqxIng5flZIhGS/Wb
	 nNgaXhiluvNJrYm9GaFRDLOW+0/4zyOcc5P0g3XPs6snzDjfR2v1J0xWMqQoWX7L/t
	 /yekTvXDyHYkQ==
Date: Thu, 29 Feb 2024 11:08:58 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Fix arm32 build failure when early printk is
 enabled
In-Reply-To: <5671ee78-eeba-4bfc-bd95-dadb07c55cbd@amd.com>
Message-ID: <alpine.DEB.2.22.394.2402291108290.853156@ubuntu-linux-20-04-desktop>
References: <20240228103555.172101-1-michal.orzel@amd.com> <9201bdc5-2e4c-48b7-8c92-f5063fde90b6@xen.org> <af11620a-ec16-4677-b968-d8e36c4555d2@amd.com> <alpine.DEB.2.22.394.2402281425260.575685@ubuntu-linux-20-04-desktop> <8228a48f-566c-4931-9f24-27bdaa1f0f28@amd.com>
 <99b74dda-225b-4402-abb9-fcccfda0adbc@xen.org> <5671ee78-eeba-4bfc-bd95-dadb07c55cbd@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 29 Feb 2024, Michal Orzel wrote:
> On 29/02/2024 11:10, Julien Grall wrote:
> > 
> > 
> > Hi,
> > 
> > On 29/02/2024 10:07, Michal Orzel wrote:
> >>
> >>
> >> On 28/02/2024 23:27, Stefano Stabellini wrote:
> >>>
> >>>
> >>> On Wed, 28 Feb 2024, Michal Orzel wrote:
> >>>> Hi Julien,
> >>>>
> >>>> On 28/02/2024 12:42, Julien Grall wrote:
> >>>>>
> >>>>>
> >>>>> Hi Michal,
> >>>>>
> >>>>> On 28/02/2024 10:35, Michal Orzel wrote:
> >>>>>> Commit 0441c3acc7e9 forgot to rename FIXMAP_CONSOLE to FIX_CONSOLE in
> >>>>>> TEMPORARY_EARLY_UART_VIRTUAL_ADDRESS macro. This results in a build
> >>>>>> failure on arm32, when early printk is enabled:
> >>>>>> arch/arm/arm32/mmu/head.S:311: Error: invalid operands (*UND* and *ABS* sections) for `*'
> >>>>>
> >>>>> Good catch! Somewhat related I wonder whether we should add earlyprintk
> >>>>> testing in gitlab?
> >>>> I thought about adding this and I think we should at least have build jobs (hypervisor only, no toolstack)
> >>>> selecting early printk. When it comes to testing if early printk works, I'm not sure. It'd be nice
> >>>> but FWIR we have limited bandwidth.
> >>>>
> >>>> @Stefano, what's your opinion?
> >>>
> >>> I think it would be a good and quick test to have. To save testing
> >>> bandwidth I think we should reduce the amount of debug/non-debug
> >>> variations of the same tests that we have.
> >> Yes, I suggested that some time ago. We could keep both versions for generic tests,
> >> but remove the non-debug version (unless you prefer to do the opposite) for:
> > 
> > I think it makes sense during development window to use the debug
> > version. However, I think we want some non-debug testing during the
> > hardening phase.
> > 
> > Can gitlab read CONFIG_DEBUG from Config.mk?
> At the moment, we have 2 types of jobs - non debug and debug (with -debug suffix).
> They set "debug" variable accordingly, which is used later on to modify .config:
> echo "CONFIG_DEBUG=${debug}" >> xen/.config
> 
> Without this line, Xen would be built according to default value of CONFIG_DEBUG.
> That said, I don't think we want to get back to this behavior.
> 
> If we want to save some bandwidth, we should make a decision whether to keep debug or non-debug versions.
> x86 has both versions for build jobs and mostly debug test jobs.

It is good to have some debug and non-debug jobs, but we probably don't
need both versions of every job.

