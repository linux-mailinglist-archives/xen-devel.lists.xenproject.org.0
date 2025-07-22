Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5623CB0E73B
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 01:33:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053092.1421854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueMTb-0004Du-6I; Tue, 22 Jul 2025 23:32:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053092.1421854; Tue, 22 Jul 2025 23:32:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueMTb-0004Ap-3H; Tue, 22 Jul 2025 23:32:51 +0000
Received: by outflank-mailman (input) for mailman id 1053092;
 Tue, 22 Jul 2025 23:32:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X0Ar=2D=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ueMTZ-0004Aj-LN
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 23:32:49 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d1238f2-6754-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 01:32:48 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6C71FA564E3;
 Tue, 22 Jul 2025 23:32:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE7CDC4CEEB;
 Tue, 22 Jul 2025 23:32:45 +0000 (UTC)
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
X-Inumbo-ID: 2d1238f2-6754-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753227167;
	bh=Wu+llJYGzKqeeDeiXrtHZde69DmAmUgcHOmvm6R2OsQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JdGW6grAAmSQJykpXZxZo7tzcj2SrFgVH2JEE0N8JA2/8jgnk1D/cJlRxYwoCoyOJ
	 1CBMgnF2/35jWZuPBkzC3SYfzWozJY4uVLccDL8mtdKDjB5Rc8IZ5tEipvXPSrMA04
	 UtNg6U4B5gTbbKLglyHn0qLZd00gLw0XZO3iSPvdGiyvxMqYdox9BpAi/6CzrD52C8
	 UlznC0DM0BBY0y2QKX8M/k8gq7yW/5L+WgNsqwfbpDQNxx4IwJSLGKsnJq5kGvdi0N
	 agKoWM+ckZEdOrUjqDJMq6MxMd+yszqbPRwzr0WHnCwsl09mlWBc1S526v1otyceGP
	 /jcULHR+K8eJA==
Date: Tue, 22 Jul 2025 16:32:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
cc: xen-devel@lists.xenproject.org, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 08/10] dom0less: Allow arch_parse_dom0less_node() to be
 fallible
In-Reply-To: <20250722115955.57167-9-alejandro.garciavallejo@amd.com>
Message-ID: <alpine.DEB.2.22.394.2507221632370.7043@ubuntu-linux-20-04-desktop>
References: <20250722115955.57167-1-alejandro.garciavallejo@amd.com> <20250722115955.57167-9-alejandro.garciavallejo@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 22 Jul 2025, Alejandro Vallejo wrote:
> Let the function return an errno, so fallible bindings are not precluded.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


