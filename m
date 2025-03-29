Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FC1A7539B
	for <lists+xen-devel@lfdr.de>; Sat, 29 Mar 2025 01:12:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.931356.1333722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyJnx-0007Te-KF; Sat, 29 Mar 2025 00:12:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931356.1333722; Sat, 29 Mar 2025 00:12:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyJnx-0007SC-HT; Sat, 29 Mar 2025 00:12:05 +0000
Received: by outflank-mailman (input) for mailman id 931356;
 Sat, 29 Mar 2025 00:12:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oenM=WQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tyJnv-0007Ma-E9
 for xen-devel@lists.xenproject.org; Sat, 29 Mar 2025 00:12:03 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fb7bd00-0c32-11f0-9ffa-bf95429c2676;
 Sat, 29 Mar 2025 01:12:01 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EFD0A61135;
 Sat, 29 Mar 2025 00:11:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3377C4CEE4;
 Sat, 29 Mar 2025 00:11:58 +0000 (UTC)
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
X-Inumbo-ID: 6fb7bd00-0c32-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743207120;
	bh=v9sU4qapC5iF/842s+8NjQ9bwZ4I6AKBVvxmPbnPMdM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NYk7CVS2Ilqo7bvIlQgWSWnane0UA0iemdH0Jlr6ZshaJ2jjAq6C+cHYhStDy6G55
	 36wt3YODerlMiulQIPflVcHmEOm+1wWE5xJDXZOJiGl3hgU+wHDNL2zCF/wCMekoJC
	 S1T3dB/DhAvFHhUE2kG5qy2zmakfrHmfa66NmrUAWcW2ASLcxVDJte39RiM4tAGVDy
	 237dnEPkUkOsp/8cvEfIsSrhcwsQ/AUGbf6u/szFnc8TAjKJoBPPXEwGCLNTjy+vl1
	 eNuGbOMAVyjYK7WQydTyTSDHoskwdKVRiLRPNH7f09nLcccv+6rM2vaHjJKFRn25lM
	 ivyp0tPj9jNuw==
Date: Fri, 28 Mar 2025 17:11:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@amd.com>
cc: xen-devel@lists.xenproject.org, ray.huang@amd.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 14/19] xen: make avail_domheap_pages() static
In-Reply-To: <20250326055053.3313146-15-Penny.Zheng@amd.com>
Message-ID: <alpine.DEB.2.22.394.2503281711510.563920@ubuntu-linux-20-04-desktop>
References: <20250326055053.3313146-1-Penny.Zheng@amd.com> <20250326055053.3313146-15-Penny.Zheng@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 26 Mar 2025, Penny Zheng wrote:
> Function avail_domheap_pages() is only invoked by get_outstanding_claims(),
> so it could be inlined into its sole caller.
> Move up avail_heap_pages() to avoid declaration before
> get_outstanding_claims().
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

