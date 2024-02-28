Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 789A286BABF
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 23:28:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686804.1069291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfSOk-0003kW-A5; Wed, 28 Feb 2024 22:27:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686804.1069291; Wed, 28 Feb 2024 22:27:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfSOk-0003hj-7S; Wed, 28 Feb 2024 22:27:34 +0000
Received: by outflank-mailman (input) for mailman id 686804;
 Wed, 28 Feb 2024 22:27:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=msSf=KF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rfSOj-0003hd-BS
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 22:27:33 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d748a69-d688-11ee-a1ee-f123f15fe8a2;
 Wed, 28 Feb 2024 23:27:29 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 06884CE2267;
 Wed, 28 Feb 2024 22:27:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A210C433F1;
 Wed, 28 Feb 2024 22:27:24 +0000 (UTC)
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
X-Inumbo-ID: 8d748a69-d688-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709159245;
	bh=WQPApiHH6A9D93VDTMCaZkmgN6V7GL8Od7WxVYedFXY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kO/lmmJZijVTPHovlIo/QvNkCTUHJorrWPLhyHY0GMBd8dOPme1lNeh9AVjxMSPG5
	 7E0MNj3BeqXxhuRJRkip9SueiqOk3Yw8lgqVq+jnbPTLuFtwqf/kKORBHntvBddtIH
	 AjzzOdmcAjjZzZBH+qDfAzGUA2Ryi0p+waniHuiIVgjVr4CcQxaAMJ/s7pE+LnXVao
	 9Wz4geqZ+kcjWPH8frwKuAlsUXkznEd0qMFaCNpWRNT6KbgVPxtOCU9IPNTxSeQEm2
	 MC0HEUvzJefxiBIn9kdyWx44O53zHMsoZCPZXUtylMPmFPAnPZTYrOamSpz1CzOh5U
	 gy6kZNg4QgZjg==
Date: Wed, 28 Feb 2024 14:27:22 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Fix arm32 build failure when early printk is
 enabled
In-Reply-To: <af11620a-ec16-4677-b968-d8e36c4555d2@amd.com>
Message-ID: <alpine.DEB.2.22.394.2402281425260.575685@ubuntu-linux-20-04-desktop>
References: <20240228103555.172101-1-michal.orzel@amd.com> <9201bdc5-2e4c-48b7-8c92-f5063fde90b6@xen.org> <af11620a-ec16-4677-b968-d8e36c4555d2@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 28 Feb 2024, Michal Orzel wrote:
> Hi Julien,
> 
> On 28/02/2024 12:42, Julien Grall wrote:
> > 
> > 
> > Hi Michal,
> > 
> > On 28/02/2024 10:35, Michal Orzel wrote:
> >> Commit 0441c3acc7e9 forgot to rename FIXMAP_CONSOLE to FIX_CONSOLE in
> >> TEMPORARY_EARLY_UART_VIRTUAL_ADDRESS macro. This results in a build
> >> failure on arm32, when early printk is enabled:
> >> arch/arm/arm32/mmu/head.S:311: Error: invalid operands (*UND* and *ABS* sections) for `*'
> > 
> > Good catch! Somewhat related I wonder whether we should add earlyprintk
> > testing in gitlab?
> I thought about adding this and I think we should at least have build jobs (hypervisor only, no toolstack)
> selecting early printk. When it comes to testing if early printk works, I'm not sure. It'd be nice
> but FWIR we have limited bandwidth.
> 
> @Stefano, what's your opinion?

I think it would be a good and quick test to have. To save testing
bandwidth I think we should reduce the amount of debug/non-debug
variations of the same tests that we have.

