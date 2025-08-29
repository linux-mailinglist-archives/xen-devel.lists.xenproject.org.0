Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F65AB3C4A0
	for <lists+xen-devel@lfdr.de>; Sat, 30 Aug 2025 00:07:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1102290.1454956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us7Ey-0005Et-LR; Fri, 29 Aug 2025 22:06:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1102290.1454956; Fri, 29 Aug 2025 22:06:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us7Ey-0005DH-He; Fri, 29 Aug 2025 22:06:36 +0000
Received: by outflank-mailman (input) for mailman id 1102290;
 Fri, 29 Aug 2025 22:06:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7zkx=3J=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1us7Ex-0005DB-0s
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 22:06:35 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bb7cb50-8524-11f0-8dd7-1b34d833f44b;
 Sat, 30 Aug 2025 00:06:32 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 509F660142;
 Fri, 29 Aug 2025 22:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9640C4CEF0;
 Fri, 29 Aug 2025 22:06:29 +0000 (UTC)
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
X-Inumbo-ID: 6bb7cb50-8524-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756505191;
	bh=+ZITBaz80zBP/I3nrPSiWVN2dMrhtU8Ggq/EOgtRjfA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rHzVoTVchJkSSk956wPpBu2p9iYjZtDZUwQB7WvVcldvhRa7ISVzVIRz0om/yLFmG
	 BqHLXK4llrIT5zsMxXvRrnicVgrp6H3wh6gIgSKvMFQv3D2ydRRsK37Sb9SD2do5M6
	 kJGg3S+/lrhe24XvWCgGh8dhV0Qx6wefHRqB7E0iRb5jNzig7z3PrXPyirx+d7kRRy
	 /SdPX4Nkzkj5bHvRKXaO4C/gyzP7u3tXHT3NCzzATCAEdYmYFZWaeAsgeeM1ILCDzW
	 QH5OxO47DncoWa7oaQluD+9WfkA/aZV9F+ygXel9i/0Jp1woxO20hPNd/wlcQbcsJu
	 uQfO84xXdzzcw==
Date: Fri, 29 Aug 2025 15:06:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmkhn@proton.me
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v11] xen/console: introduce domain_console struct
In-Reply-To: <20250807005649.551704-1-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2508291506170.341243@ubuntu-linux-20-04-desktop>
References: <20250807005649.551704-1-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 7 Aug 2025, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Introduce domain_console for grouping data structures used for integrating
> domain's diagnostic console with Xen's console driver.
> 
> Group all pbuf-related data structures under domain_console. Rename the moved
> fields to plain .buf, .idx and .lock names, since all uses of the fields are
> touched.
> 
> Ensure accesses to domain_console pointer are valid in console_switch_input().
> 
> Bump the domain console buffer allocation size to 256. No extra symbol for the
> value since it is used only once during data structure declaration. All size
> checks use ARRAY_SIZE().
> 
> Allocate domain_console from the heap so that the parent domain struct size
> stays below PAGE_SIZE boundary to account for more console-related fields
> added in the future.
> 
> Finally, update the domain_console allocation and initialization code. Make
> sure domain_console is not allocated for system domains.
> 
> No functional change.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

