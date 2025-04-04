Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD47A7B546
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 03:06:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937689.1338601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0VVk-00064K-KU; Fri, 04 Apr 2025 01:06:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937689.1338601; Fri, 04 Apr 2025 01:06:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0VVk-00062b-Gy; Fri, 04 Apr 2025 01:06:20 +0000
Received: by outflank-mailman (input) for mailman id 937689;
 Fri, 04 Apr 2025 01:06:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8oGR=WW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u0VVj-00062S-1y
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 01:06:19 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0207d9d0-10f1-11f0-9ffb-bf95429c2676;
 Fri, 04 Apr 2025 03:06:16 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AB8DE43865;
 Fri,  4 Apr 2025 01:06:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E153AC4CEE3;
 Fri,  4 Apr 2025 01:06:13 +0000 (UTC)
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
X-Inumbo-ID: 0207d9d0-10f1-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743728775;
	bh=CQO5AbCBKC7SyzKVQAtya/dBPRgDBcmM2XCkbuhfkZM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ArRZ8ZrwmKbgy/DLdp1N0akSsE1hA13j2nRVNPEZcqSm7CCHtekyEjWC0Pct5TJ+W
	 2JsXkiDBEiSoh2kZBKHigPJIIrCREG5fM9QbLNrdYb9l1O1N7DHZhh1BiZCiIRXGqm
	 Hov3i6f5UtXILqNo9yXqSkRZS66ZiHNCIZhEudveA781Qk1bnGZ9KB3YuwUsxoTI51
	 AS3zAo4bnRgit8vdmpWLNIYygJBsCsqDYPGpHEFyfOQRWRpFbDf+xnUFfILBjAPxc7
	 J35Q5hIORwsLG6kthTiPVzwb56H8jPwnE9IQUcMD7Za+OUvZIt9tLN9PNeRGJN5ffO
	 5CeW3rqnIgq0Q==
Date: Thu, 3 Apr 2025 18:06:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Andryuk <jason.andryuk@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 3/7] xen/arm: dom0less delay xenstore initialization
In-Reply-To: <20250403214608.152954-4-jason.andryuk@amd.com>
Message-ID: <alpine.DEB.2.22.394.2504031805591.3529306@ubuntu-linux-20-04-desktop>
References: <20250403214608.152954-1-jason.andryuk@amd.com> <20250403214608.152954-4-jason.andryuk@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 3 Apr 2025, Jason Andryuk wrote:
> To allocate the xenstore event channel and initialize the grant table
> entry, the xenstore domid is neeed.  A dom0 is created before the domUs,
> so it is normally available through hardware_domain.  With capabilities
> and dom0less, the xenstore domain may not be created first.
> 
> Keep the population of the page and HVM_PARAM_STORE_PFN in the normal
> domain construction, but delay event channel creation and grant seeding
> to after all domUs are created.  HVM_PARAM_STORE_PFN now serves as
> indication to setup xenstore since the device tree is no longer
> immediately available.  0 means no xenstore.  ~0ULL means legacy so only
> the event channel needs setup, and any other value means to seed the
> page.
> 
> dom0 needs to set xs_domid when it is serving as the xenstore domain.
> 
> The domain running xenstored needs to be the handler for VIRQ_DOM_EXC,
> so set that as well - it otherwise defaults to hardware domain.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


