Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DCAA350B8
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 22:52:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888100.1297505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tih8Q-000330-NJ; Thu, 13 Feb 2025 21:52:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888100.1297505; Thu, 13 Feb 2025 21:52:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tih8Q-00030I-Jb; Thu, 13 Feb 2025 21:52:38 +0000
Received: by outflank-mailman (input) for mailman id 888100;
 Thu, 13 Feb 2025 21:52:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IJm2=VE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tih8O-00030C-RT
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 21:52:36 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d554b8fa-ea54-11ef-9aa4-95dc52dad729;
 Thu, 13 Feb 2025 22:52:35 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3894FA40807;
 Thu, 13 Feb 2025 21:50:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9F57C4CED1;
 Thu, 13 Feb 2025 21:52:32 +0000 (UTC)
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
X-Inumbo-ID: d554b8fa-ea54-11ef-9aa4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739483554;
	bh=MtxRd52Tn0lGPT6lVPtZ0HwJU/ANe6GJtWQ/pjRzdZw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kVFF+pOy9CimCCMXNKDilAtPoBRCw+Btt/O3gzTVGLGoHbHma8Y3627gBnAhzB5tE
	 qcscNzbpCKKraha9PX/0rIzwr7b7Se0T/I6Ab2RvrXYlYAP/EvGFwCAwRUkEtgIEXQ
	 WhTFhPoRGUqf0yplbk9pCBeEhf1hYosV31WbH49xofl3GOcxiR7KR0+qBgQ7Ooy7Mt
	 9THRwRabgf9+3iToi4nvsbz2YjiynWaaayn38zQTwxz8OGXNF7XDYlpKEZHQCTkr5Y
	 0niuoGHfgXKO7mdIAQ9jRZlSPq+5ycHAOlWBHHFctQK1zeVRvo7wmX85fWEpmQwwwL
	 Vu0MJHNDhiopg==
Date: Thu, 13 Feb 2025 13:52:31 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Grygorii Strashko <grygorii_strashko@epam.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Grygorii Strashko <gragst.linux@gmail.com>, xen-devel@lists.xenproject.org, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Jason.Andryuk@amd.com
Subject: Re: [RFC PATCH] arm: dom0: allow static memory configuration
In-Reply-To: <6120fd47-7fd1-4e42-8aa3-3ee858fdc70d@epam.com>
Message-ID: <alpine.DEB.2.22.394.2502131350180.619090@ubuntu-linux-20-04-desktop>
References: <20250212164724.2575624-1-grygorii_strashko@epam.com> <alpine.DEB.2.22.394.2502121407330.619090@ubuntu-linux-20-04-desktop> <6120fd47-7fd1-4e42-8aa3-3ee858fdc70d@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 13 Feb 2025, Grygorii Strashko wrote:
> Hi Stefano,
> 
> On 13.02.25 00:11, Stefano Stabellini wrote:
> > On Wed, 12 Feb 2025, Grygorii Strashko wrote:
> > > The Arm Xen allocates memory to place Dom0 following the logic described
> > > in
> > > allocate_memory_11() function which is a bit complicated with major
> > > requirement to place Dom0 within the first 128MB of RAM and below 4G. But
> > > this doesn't guarantee it will be placed at the same physical base address
> > > even between two boots with different configuration (changing the Kernel
> > > image size or Initrd size may cause Dom0 base address to change).
> > > 
> > > In case of "thin Dom0" use case, when Dom0 implemented with RTOS like
> > > Zephyr, which doesn't use dynamic device-tree parsing, such behavior
> > > causes a lot of inconvenience as it is required to perform modification
> > > and
> > > recompiling of Zephyr image to adjust memory layout.
> > > 
> > > It also prevents from using Initrd with Zephyr, for example, as it's
> > > expected to be placed at known, fixed address in memory.
> > > 
> > > This RFC patch introduces the possibility to place Dom0 at fixed physical
> > > base address, by checking if "chosen" node contains property
> > > "xen,static-mem" and places Dom0 exactly at the specified memory chunk.
> > > 
> > > The implementation follows the same approach as for the static,
> > > direct-mapped
> > > guest domain in case of dom0less boot.
> > > 
> > > Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> > 
> > I fully support this idea and the addition of static memory support to
> > Dom0. However, I would suggest a different approach regarding the device
> > tree binding. Specifically, I would prefer to avoid introducing
> > additional top-level properties for Dom0 under /chosen.
> 
> That's was major point declaring it RFC.
> 
> > 
> > Instead, we should create a domain node for Dom0 under /chosen, like we
> > do for other DomUs. Jason is currently working on adding a capability
> > properties to the Dom0less domain nodes, allowing us to specify whether
> > a domain is the hardware domain, the control domain, or both
> > (effectively making it Dom0). Once this is in place, we can use
> > static-mem for Dom0 in the same way as always.
> 
> Good to here that, I assume it can wait (a bit) then.
> 
> But please note that our requirement here to allow static memory for both
> dom0less and
> non-dom0less boot, so here is the question - will bindings and
> dom0/hwdom/control
> domain setup be generic?

Yes, they should be generic.


> Honestly, for ARM, the discrepancies between boot modes and Xen DT definitions
> (and actually toolstack) are very confusing :( And now there is also
> hyperlaunch on the horizon :(

The good news is that we managed to align the hyperlaunch DT with the
dom0less DT and they are now compatible in the last incarnation of the
patch series. The ability to use the dom0less domain nodes (not the
legacy dom0 nodes) and still be able to specify a dom0 is something that
hyperlaunch had from the start and will be of great benefit to ARM as
well.

