Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C048CCE016
	for <lists+xen-devel@lfdr.de>; Fri, 19 Dec 2025 00:54:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1190295.1510809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWNoX-0005jG-05; Thu, 18 Dec 2025 23:53:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1190295.1510809; Thu, 18 Dec 2025 23:53:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWNoW-0005h5-T0; Thu, 18 Dec 2025 23:53:44 +0000
Received: by outflank-mailman (input) for mailman id 1190295;
 Thu, 18 Dec 2025 23:53:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=awYi=6Y=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vWNoV-0005gz-M6
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 23:53:43 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c68c11c9-dc6c-11f0-9cce-f158ae23cfc8;
 Fri, 19 Dec 2025 00:53:41 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A030A42E07;
 Thu, 18 Dec 2025 23:53:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EF94C4CEFB;
 Thu, 18 Dec 2025 23:53:37 +0000 (UTC)
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
X-Inumbo-ID: c68c11c9-dc6c-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766102018;
	bh=lDUbbXao4Tk720vLz51q1jmc9Zu7mkhyD3s+jm4DpcI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oozg6XBMyp0Jxk6XfC/xsYh5yme8wBUGuUXILKj1hlahoGNpFPyMeQJHjo8vqFcjS
	 9GhofqKOfCItRex7vySRFPysvwQfn3xm3sb72DKs03E+CF1JkLw1bXYWkykiuCQkPz
	 xWpruev8OPxpixmR2+s6eKP4p3JkQVrPktPx6TpGuGLNGYLHwHDuZas5/UAIU39OD8
	 uS1UWS+UKbpyRJqjDJlwEIk9Y1TDL4dO48xNqLpczECmF8Qq9UtODk7klA7tKPIzf9
	 qYF+E69f2Ovv16/sp1Peohqeq8nZVGTx/Y//8zGMQ5Lo8o1rYNw6NBxRs+9zcSd+fW
	 jkO+93DVGM3ng==
Date: Thu, 18 Dec 2025 15:53:36 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Grygorii Strashko <grygorii_strashko@epam.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Harry Ramsey <harry.ramsey@arm.com>
Subject: Re: [PATCH V3] xen/dom0less: Calculate guest DTB size based on
 MAX_VIRT_CPUS
In-Reply-To: <a23716aa-cae1-4636-b027-2344e2b08f10@epam.com>
Message-ID: <alpine.DEB.2.22.394.2512181553300.21522@ubuntu-linux-20-04-desktop>
References: <20251217081248.2807849-1-oleksandr_tyshchenko@epam.com> <alpine.DEB.2.22.394.2512171605420.21522@ubuntu-linux-20-04-desktop> <a23716aa-cae1-4636-b027-2344e2b08f10@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 17 Dec 2025, Oleksandr Tyshchenko wrote:
> On 18.12.25 02:05, Stefano Stabellini wrote:
> Hello Stefano
> 
> > On Wed, 17 Dec 2025, Oleksandr Tyshchenko wrote:
> >> Creating a dom0less guest with a high vCPU count (e.g., >32) fails
> >> because the fixed 4KiB device tree buffer (DOMU_DTB_SIZE) overflows
> >> during creation.
> >>
> >> The FDT nodes for each vCPU are the primary consumer of space,
> >> and the previous fixed-size buffer was insufficient.
> >>
> >> This patch replaces the fixed size with a formula that calculates
> >> the required buffer size based on a fixed baseline plus a scalable
> >> portion for each potential vCPU up to the MAX_VIRT_CPUS limit.
> >>
> >> Please note, the change to DOMU_DTB_SIZE formula would result in
> >> a smaller buffer size of 3072 bytes compared to the original 4096 bytes
> >> on Arm32 platforms where MAX_VIRT_CPUS is 8.
> > 
> > I am OK with this patch I would only ask to retain the minimum size of
> > 4KB due to the possible presence of passthrough device nodes.
> 
> I think there might be cases when even 4KB would not be enough to cover 
> the whole dtb with passthrough device nodes. But the existing code 
> should already handle that, so if a partial device tree is provided, 
> then it will be accounted separately:
> 
>       /* Account for domU passthrough DT size */
>       if ( kinfo->dtb )
>           fdt_size += kinfo->dtb->size;

I forgot about this. In that case:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

