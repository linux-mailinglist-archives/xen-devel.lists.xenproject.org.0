Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90051A75395
	for <lists+xen-devel@lfdr.de>; Sat, 29 Mar 2025 01:07:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.931333.1333701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyJjb-00047e-UH; Sat, 29 Mar 2025 00:07:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931333.1333701; Sat, 29 Mar 2025 00:07:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyJjb-000477-QU; Sat, 29 Mar 2025 00:07:35 +0000
Received: by outflank-mailman (input) for mailman id 931333;
 Sat, 29 Mar 2025 00:07:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oenM=WQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tyJja-0003ea-MU
 for xen-devel@lists.xenproject.org; Sat, 29 Mar 2025 00:07:34 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf16546f-0c31-11f0-9ea4-5ba50f476ded;
 Sat, 29 Mar 2025 01:07:32 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 64D86A43055;
 Sat, 29 Mar 2025 00:02:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77216C4CEE4;
 Sat, 29 Mar 2025 00:07:29 +0000 (UTC)
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
X-Inumbo-ID: cf16546f-0c31-11f0-9ea4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743206850;
	bh=4JXaR8rZikU0L4TzAJoNI85O5OIXAeNA8t/FyZen+3c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LSv6WgW0WWKGos4skoJdi9v4NQrSZUc0SSuwWNLlQCkQYl++oV2Zya7M/P+/2U7QL
	 XOqPrTv+2sTOId6h4g6c3kAQwEthrP6QHuo7QzcYEiIWzu3pIHC9wfBOD0bdXu+vOn
	 TQ5NoGyrk0Mn0p8GZiGxrkH/5t6tc6feVpx2/i0LQ3fazXWCi+GJiOM+5z3VoWNAKn
	 RNdkhsyCKPzD2tiCva90yJYjB1sMrVvnX/q80acqAJqqL7R4/n/fem00bfMmz5oC0K
	 uGF0QQfbc33agpFSPEA6pU4eeh1pI5lmGhIyGqNeG5twTNk+rRAYFlsW9Fp1c7fptQ
	 ChU7xY91bpEQg==
Date: Fri, 28 Mar 2025 17:07:27 -0700 (PDT)
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
Subject: Re: [PATCH v2 07/19] xen/sysctl: wrap around XEN_SYSCTL_perfc_op
In-Reply-To: <20250326055053.3313146-8-Penny.Zheng@amd.com>
Message-ID: <alpine.DEB.2.22.394.2503281707200.563920@ubuntu-linux-20-04-desktop>
References: <20250326055053.3313146-1-Penny.Zheng@amd.com> <20250326055053.3313146-8-Penny.Zheng@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 26 Mar 2025, Penny Zheng wrote:
> perfc_control() and perfc_copy_info() are responsible for providing control
> of perf counters via XEN_SYSCTL_perfc_op in DOM0, so they both shall
> be wrapped.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


