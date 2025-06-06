Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9BBAD0A83
	for <lists+xen-devel@lfdr.de>; Sat,  7 Jun 2025 01:57:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1009008.1388154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNgwD-0000jQ-La; Fri, 06 Jun 2025 23:57:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1009008.1388154; Fri, 06 Jun 2025 23:57:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNgwD-0000h3-Ik; Fri, 06 Jun 2025 23:57:29 +0000
Received: by outflank-mailman (input) for mailman id 1009008;
 Fri, 06 Jun 2025 23:57:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YRk0=YV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uNgwB-0000gw-HW
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 23:57:27 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe99b582-4331-11f0-a303-13f23c93f187;
 Sat, 07 Jun 2025 01:57:26 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 648D660EDF;
 Fri,  6 Jun 2025 23:57:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE081C4CEEB;
 Fri,  6 Jun 2025 23:57:23 +0000 (UTC)
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
X-Inumbo-ID: fe99b582-4331-11f0-a303-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749254245;
	bh=7k95ME6hm6nyrfXdhqK/1HpmPSqG90IAsONq42yRleM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rFgJpU/3lX0qgCWVhr83D4ZKfzGtXPVYVj8R4L1FQdW6z91AIWiA83yd6mWNchiqr
	 TUB/lQHZbLGAI/2Z1lF/5kdwHkaf+TVyW4igaosQHvIqpqCn+x1rdcCGELY2hBQKpo
	 yAvdsQAcQpP9E2RSjvBhE0cIro/QEd6h6/7SZqHAbfmHOsuhvxtCJJ7QAfKl6yIaRZ
	 ink3IME0biUqFwshr+wKb5hPxXIYo2yK39h1g28iIqGRpxWHepQP7BoSrA/p7AX9Kr
	 5BzHI4MHMCPhMp0vgYU+4YI6m/6I9XLjuBSns++iEQ2mTKs0jl8Rb/+WNfyeD5W3UO
	 okJXjiEqk0Zgg==
Date: Fri, 6 Jun 2025 16:57:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <agarciav@amd.com>
cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 15/15] kconfig: Allow x86 to pick
 CONFIG_DOM0LESS_BOOT
In-Reply-To: <20250605194810.2782031-16-agarciav@amd.com>
Message-ID: <alpine.DEB.2.22.394.2506061655460.2495561@ubuntu-linux-20-04-desktop>
References: <20250605194810.2782031-1-agarciav@amd.com> <20250605194810.2782031-16-agarciav@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 5 Jun 2025, Alejandro Vallejo wrote:
> Without picking CONFIG_HAS_DEVICE_TREE.
> 
> In order to do that. Allow CONFIG_DOM0LESS_BOOT to enable a subset
> of the common/device-tree/ directory. x86 doesn't want dom0less-build.c,
> as that's tightly integrated still to the ARM way of building domains.
> 
> Requires "unsupported" for the time being until all required patches
> make it through.
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


