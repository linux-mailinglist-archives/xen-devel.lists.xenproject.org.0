Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C20A82B802
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 00:26:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666581.1037315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rO4Qs-0002RA-6f; Thu, 11 Jan 2024 23:25:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666581.1037315; Thu, 11 Jan 2024 23:25:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rO4Qs-0002P4-45; Thu, 11 Jan 2024 23:25:54 +0000
Received: by outflank-mailman (input) for mailman id 666581;
 Thu, 11 Jan 2024 23:25:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wd/Q=IV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rO4Qr-0002Ow-5T
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 23:25:53 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c27cbd42-b0d8-11ee-98f0-6d05b1d4d9a1;
 Fri, 12 Jan 2024 00:25:51 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 3EAB0B8217F;
 Thu, 11 Jan 2024 23:25:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FF37C433C7;
 Thu, 11 Jan 2024 23:25:49 +0000 (UTC)
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
X-Inumbo-ID: c27cbd42-b0d8-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705015550;
	bh=O6zWO/7B8m/R3qlw5KF+MLUk4ZsCs+Zrzh03eQXSYnk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BnzfF0i5aNpLqjC5OMMzJpWb+pE6r6OntsIfh0MACy9mkD518kwdAjUnaWj35YkVk
	 KCFJfscI2cXwvdSSGbfeWaDrMn5iITdK8GJLOwdWMHu2/zjWGDQ0m+5yGUCqxxwDGP
	 CNbGAIW7R29Sw4rbwheaaJ6glxor2pfaQP/OFFdf4LZqUkYNBPeCN4W91SyysfvAq/
	 OfHfp1LuifMszkm49HnBjntPpu83hFWgo0s1iOLIZGc3K8ElgTGBYCi9IOWy7pFdwI
	 iDSQ65RhhP+0e/xqNG5Q3d4gh3GA6kF9xilO4VYDRXLhOW/k055lA7Zwv/jCPVq0QI
	 /Tia0tWtFrMFw==
Date: Thu, 11 Jan 2024 15:25:47 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Carlo Nonato <carlo.nonato@minervasys.tech>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    Marco Solieri <marco.solieri@minervasys.tech>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 09/13] xen: add cache coloring allocator for domains
In-Reply-To: <0f7c4c1a-5c20-4e89-bef9-2ebd02c0b141@suse.com>
Message-ID: <alpine.DEB.2.22.394.2401111525320.3675@ubuntu-linux-20-04-desktop>
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech> <20240102095138.17933-10-carlo.nonato@minervasys.tech> <7fbe9526-60cf-4844-8b48-58ab69ec1b29@suse.com> <alpine.DEB.2.22.394.2401091637160.3675@ubuntu-linux-20-04-desktop>
 <0f7c4c1a-5c20-4e89-bef9-2ebd02c0b141@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 10 Jan 2024, Jan Beulich wrote:
> On 10.01.2024 01:46, Stefano Stabellini wrote:
> > On Tue, 9 Jan 2024, Jan Beulich wrote:
> >> On 02.01.2024 10:51, Carlo Nonato wrote:
> >>> This commit adds a new memory page allocator that implements the cache
> >>> coloring mechanism. The allocation algorithm enforces equal frequency
> >>> distribution of cache partitions, following the coloring configuration of a
> >>> domain. This allows an even utilization of cache sets for every domain.
> >>>
> >>> Pages are stored in a color-indexed array of lists. Those lists are filled
> >>> by a simple init function which computes the color of each page.
> >>> When a domain requests a page, the allocator extract the page from the list
> >>> with the maximum number of free pages between those that the domain can
> >>> access, given its coloring configuration.
> >>>
> >>> The allocator can only handle requests of order-0 pages. This allows for
> >>> easier implementation and since cache coloring targets only embedded systems,
> >>> it's assumed not to be a major problem.
> >>
> >> I'm curious about the specific properties of embedded systems that makes
> >> the performance implications of deeper page walks less of an issue for
> >> them.
> > 
> > I think Carlo meant to say that embedded systems tend to have a smaller
> > amount of RAM (our boards today have 4-8GB of total memory). So higher
> > level allocations (2MB/1GB) might not be possible.
> > 
> > Also, domains that care about interrupt latency tend to be RTOSes (e.g.
> > Zephyr, FreeRTOS) and RTOSes are happy to run with less than 1MB of
> > total memory available. This is so true that I vaguely remember hitting
> > a bug in xl/libxl when I tried to create a domain with 128KB of memory. 
> > 
> > 
> >> Nothing is said about address-constrained allocations. Are such entirely
> >> of no interest to domains on Arm, not even to Dom0 (e.g. for filling
> >> Linux'es swiotlb)?
> > 
> > Cache coloring is useful if you can use an IOMMU with all the
> > dma-capable devices. If that is not the case, then not even Dom0 would
> > be able to boot with cache coloring enabled (because it wouldn't be 1:1
> > mapped).
> > 
> > On ARM we only support booting Dom0 1:1 mapped, or not-1:1-mapped but
> > relying on the IOMMU.
> 
> So another constraint to be enforced both at the Kconfig level and at
> runtime?

Yeah potentially


> That said, Linux'es swiotlb allocation can't know whether an
> IOMMU is in use by Xen.

Well, not exactly but we have XENFEAT_direct_mapped and
XENFEAT_not_direct_mapped, that is how normally the kernel knows how to
behave


> If something like that was done in a Dom0, the
> respective allocations still wouldn't really work correctly (and the
> kernel may or may not choke on this).
 

