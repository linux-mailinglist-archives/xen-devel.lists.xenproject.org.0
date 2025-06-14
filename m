Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23798AD994F
	for <lists+xen-devel@lfdr.de>; Sat, 14 Jun 2025 02:58:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1015140.1393078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQFDy-0006zg-OP; Sat, 14 Jun 2025 00:58:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1015140.1393078; Sat, 14 Jun 2025 00:58:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQFDy-0006xE-LH; Sat, 14 Jun 2025 00:58:22 +0000
Received: by outflank-mailman (input) for mailman id 1015140;
 Sat, 14 Jun 2025 00:58:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SRxw=Y5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uQFDx-0006x8-7L
 for xen-devel@lists.xenproject.org; Sat, 14 Jun 2025 00:58:21 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8d37feb-48ba-11f0-b894-0df219b8e170;
 Sat, 14 Jun 2025 02:58:19 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C18BA5C5A60;
 Sat, 14 Jun 2025 00:56:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A91FDC4CEE3;
 Sat, 14 Jun 2025 00:58:15 +0000 (UTC)
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
X-Inumbo-ID: a8d37feb-48ba-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749862697;
	bh=2hWien/bpYiWG4yB1oY6NNFa7SpxGfkia0IGCGkB2Sk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IBwz5qYhLPXMGPTDaZ1eouvYlli+JqzfR7Keg8pre1OyhbAw5hGPwRa7I0jD0M9R9
	 yybwI75P0Pr7FH5yR2kCxNdq1p5z8tu2gi79wb7xwPnp0+DVIUwbZlCSKdgS49fUUU
	 ME6OCPutr1EVZHKsebPKhisUoTJHGCQkboc/fENX+2CKFBpEK6tHTdzV0r6UAU6lSr
	 EVVhSGJShrKgFpMV0XRcD71d1Q5yyDbicFYDtzwKHmyoL9neRqtV5msWIh+sImQr1y
	 yfaBKVnPF78KTJK6jY5lynlTs6jBl++Q/c1PpYeCHTV3SJRqO6JTkqO4+UkLS3ACZn
	 8U4ANe86QZwFg==
Date: Fri, 13 Jun 2025 17:58:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <agarciav@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v3 06/14] xen: Refactor kernel_info to have a header like
 boot_domain
In-Reply-To: <20250613151612.754222-7-agarciav@amd.com>
Message-ID: <alpine.DEB.2.22.394.2506131758080.8480@ubuntu-linux-20-04-desktop>
References: <20250613151612.754222-1-agarciav@amd.com> <20250613151612.754222-7-agarciav@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 13 Jun 2025, Alejandro Vallejo wrote:
> Create a struct header within kernel_info with the contents common to
> kernel_info and boot_domain, and define that header in common code. This enables
> x86 to use that header as-is and drop x86's boot_domain.
> 
> Not a functional change.
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


