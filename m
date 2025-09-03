Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 822B9B42BED
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 23:28:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1109080.1458934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utv1j-0001iP-BS; Wed, 03 Sep 2025 21:28:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1109080.1458934; Wed, 03 Sep 2025 21:28:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utv1j-0001fd-7g; Wed, 03 Sep 2025 21:28:23 +0000
Received: by outflank-mailman (input) for mailman id 1109080;
 Wed, 03 Sep 2025 21:28:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h/6B=3O=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1utv1h-0001fX-HU
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 21:28:21 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8653c44-890c-11f0-9809-7dc792cee155;
 Wed, 03 Sep 2025 23:28:19 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 546E66013F;
 Wed,  3 Sep 2025 21:28:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B25ABC4CEE7;
 Wed,  3 Sep 2025 21:28:15 +0000 (UTC)
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
X-Inumbo-ID: e8653c44-890c-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756934897;
	bh=+CbtXfeAsx6ZEFMcO6rryfpd/rZSvxhEcK4vJsCAqDw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=d3jEH9/D21qe6Seq89N77/8lWZQSdzd/0eDiwwg6WvrkvKk0bF0LjC7MjVyP3LneI
	 epUwm1sj//UuqIhHkvSH8RYZ2zZ5KUKjS6GIh5IbPsma9DzAGJzyVV6guiJt4LvJHd
	 6/LmD3q7gCdC2vcvjL9QB0TCOX52itqXbgMefCNnUuyKpTYr8ENvm3NwCJldKFheE1
	 t/KoqsXd+Eox+iZXex9YW4tjsFcSLmGeUTrWFTIJDnxPAvG3gYn5VTUrPJbqVNon4x
	 BWaLCRQKJ7ijckKTTTQTG+0v7FETUJ0wxlt4ucnCqqdlGW8S5HPiK+PcAjy4BOU+Ro
	 ZMFEEBLswS4TA==
Date: Wed, 3 Sep 2025 14:28:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmukhin@xen.org
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v17 0/4] xen/domain: domain ID allocation
In-Reply-To: <20250829232132.3460081-1-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2509031426160.1405870@ubuntu-linux-20-04-desktop>
References: <20250829232132.3460081-1-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

This series is fully acked except for:

- a minimal change to xen/arch/x86/setup.c
- the self test tools/tests/domid/

Based on this, I plan to commit it in the next couple of days. Please
let me know if you have any thoughts on that.



On Fri, 29 Aug 2025, dmukhin@xen.org wrote:
> Patch 1 introduces new domid_{alloc,free} calls.
> Patch 2 is a prep change for domain ID allocator test.
> Patch 3 introduces some basic testing for domain ID allocator.
> Patch 4 adjusts create_dom0() messages (use %pd).
> 
> Link to v16: https://lore.kernel.org/xen-devel/20250812223024.2364749-1-dmukhin@ford.com/
> Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2012378054
> 
> Denis Mukhin (4):
>   xen/domain: unify domain ID allocation
>   tools/include: move xc_bitops.h to xen-tools/bitops.h
>   tools/tests: introduce unit tests for domain ID allocator
>   xen/domain: update create_dom0() messages
> 
>  .../xen-tools/bitops.h}                       | 16 +++-
>  tools/libs/ctrl/xc_misc.c                     | 13 +--
>  tools/libs/guest/xg_dom_elfloader.c           |  1 -
>  tools/libs/guest/xg_dom_hvmloader.c           |  1 -
>  tools/libs/guest/xg_private.h                 |  2 +-
>  tools/libs/guest/xg_sr_common.h               |  2 -
>  tools/tests/Makefile                          |  1 +
>  tools/tests/domid/.gitignore                  |  2 +
>  tools/tests/domid/Makefile                    | 88 +++++++++++++++++
>  tools/tests/domid/harness.h                   | 54 +++++++++++
>  tools/tests/domid/test-domid.c                | 95 +++++++++++++++++++
>  xen/arch/arm/domain_build.c                   | 13 ++-
>  xen/arch/x86/setup.c                          | 11 ++-
>  xen/common/Makefile                           |  1 +
>  xen/common/device-tree/dom0less-build.c       | 15 +--
>  xen/common/domain.c                           |  2 +
>  xen/common/domctl.c                           | 43 ++-------
>  xen/common/domid.c                            | 95 +++++++++++++++++++
>  xen/include/xen/domain.h                      |  3 +
>  xen/lib/find-next-bit.c                       |  5 +
>  20 files changed, 397 insertions(+), 66 deletions(-)
>  rename tools/{libs/ctrl/xc_bitops.h => include/xen-tools/bitops.h} (84%)
>  create mode 100644 tools/tests/domid/.gitignore
>  create mode 100644 tools/tests/domid/Makefile
>  create mode 100644 tools/tests/domid/harness.h
>  create mode 100644 tools/tests/domid/test-domid.c
>  create mode 100644 xen/common/domid.c
> 
> -- 
> 2.51.0
> 

