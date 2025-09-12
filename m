Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D99B5590C
	for <lists+xen-devel@lfdr.de>; Sat, 13 Sep 2025 00:19:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1122706.1466241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxC6Y-0005fC-Um; Fri, 12 Sep 2025 22:18:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1122706.1466241; Fri, 12 Sep 2025 22:18:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxC6Y-0005cu-Ry; Fri, 12 Sep 2025 22:18:54 +0000
Received: by outflank-mailman (input) for mailman id 1122706;
 Fri, 12 Sep 2025 22:18:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Abw/=3X=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uxC6W-0005co-MJ
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 22:18:52 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7534cd62-9026-11f0-9809-7dc792cee155;
 Sat, 13 Sep 2025 00:18:50 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1D5F46000A;
 Fri, 12 Sep 2025 22:18:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D551C4CEF1;
 Fri, 12 Sep 2025 22:18:47 +0000 (UTC)
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
X-Inumbo-ID: 7534cd62-9026-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757715528;
	bh=mWEATl0bC6mjbFq66ZmUqPd6XcUCIomMSjFvLZTJo4k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LJ1pepOsE1EYULrE7b2PU2SCcMvpV4YtOOAMWS+eljGPTF4lBwMMOmtY/ts6v+CKe
	 wQqb3bU5+uKIZw5X9DEANgBwgdM8XSFF/R20F+EHOiZSZXgdbZ2KmDYYG4x0ZqnlQZ
	 SYjL7y4lh2AWrkT5nLwS6LRhCUgPm5kXTvwYwbFx3SysOwHDst/l23ZjsYMXy8wwsA
	 2KtbVfC3AEDdqgJE+pXvyWEdYh6/If2bvzZ66nWanW38R7D7jPns718zWcgr+IKOyr
	 58fE81HzwBEH27e/8OnEKmjdW5TX2XLS8FJfrUlU4qbXulcSzGPgjanIIaoqUPGBTr
	 s/mIo0rVsh3mg==
Date: Fri, 12 Sep 2025 15:18:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v4 0/8] CI: Add Debian Trixie
In-Reply-To: <20250912144427.1905141-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2509121518382.628111@ubuntu-linux-20-04-desktop>
References: <20250912144427.1905141-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 12 Sep 2025, Andrew Cooper wrote:
> Refresh the Trixie series.  A few more bugfixes found by randconfig and log
> inspection.
> 
> These containers are already built and deployed for people to test with.
> 
> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2036687955

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

