Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E22D6A7B562
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 03:15:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937725.1338630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0VeW-0001vJ-Pc; Fri, 04 Apr 2025 01:15:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937725.1338630; Fri, 04 Apr 2025 01:15:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0VeW-0001tk-MW; Fri, 04 Apr 2025 01:15:24 +0000
Received: by outflank-mailman (input) for mailman id 937725;
 Fri, 04 Apr 2025 01:15:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8oGR=WW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u0VeU-0001te-Pw
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 01:15:22 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47567873-10f2-11f0-9eaa-5ba50f476ded;
 Fri, 04 Apr 2025 03:15:21 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 46233A46B00;
 Fri,  4 Apr 2025 01:09:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39FB9C4CEE3;
 Fri,  4 Apr 2025 01:15:19 +0000 (UTC)
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
X-Inumbo-ID: 47567873-10f2-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743729320;
	bh=FbBa4aH3GdEj0Z9j43PW5UAv5HSqCDZ39OYJX5bd9co=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=inzbANL0MFG6zeL8roIMzitIEXCBIpfNgcxnIVZxKz9sX1F4PNL8T/ETq7PA7kcZR
	 7yqk3OnU/WtWgNcTQR7qj8lczYTgmVnQQzA56f6qsdeaQS77GNwu+w5f3/N+PccTao
	 J7ge6f+HQthPCuDdmAFSEX3hfz+r3gLubCrg2TeWZcZ22CMYLboucyErU0jNZKjK4p
	 2aMjKHLARbpVaMt/sev6zmSs4Y3d5H8hPKKSu4XDWRhKGauV3rvtEb0h5m+XhjVoH2
	 yC5si7NauWvp0fY9Joc02/SD9pGFxYJNJw/t6Qg1RYkyetx3jDlaqTyA9/Fm+KpCqZ
	 2g8/n2Su+BNEg==
Date: Thu, 3 Apr 2025 18:15:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Andryuk <jason.andryuk@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 7/7] xen/arm: Add capabilities to dom0less
In-Reply-To: <20250403214608.152954-8-jason.andryuk@amd.com>
Message-ID: <alpine.DEB.2.22.394.2504031815100.3529306@ubuntu-linux-20-04-desktop>
References: <20250403214608.152954-1-jason.andryuk@amd.com> <20250403214608.152954-8-jason.andryuk@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 3 Apr 2025, Jason Andryuk wrote:
> Add a capabilities property to dom0less to allow building a
> disaggregated system.  Only a single hardware domain and single xenstore
> domain can be specified.  Multiple control domains are possible.
> 
> Introduce bootfdt.h to contain these constants.
> 
> When using the hardware or xenstore capabilities, adjust the grant and
> event channel limits similar to dom0.
> 
> For a hardware domain, disallow specifying "vpl011", "nr_spis",
> "multiboot,device-tree" and "passthrough" nodes.  Also, require an IOMMU
> when not direct-mapped,
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


