Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F467AEBF10
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jun 2025 20:31:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1027888.1402300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uVDqY-0005ve-LE; Fri, 27 Jun 2025 18:30:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1027888.1402300; Fri, 27 Jun 2025 18:30:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uVDqY-0005ta-I9; Fri, 27 Jun 2025 18:30:46 +0000
Received: by outflank-mailman (input) for mailman id 1027888;
 Fri, 27 Jun 2025 18:30:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b9Or=ZK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uVDqW-0005tT-Ov
 for xen-devel@lists.xenproject.org; Fri, 27 Jun 2025 18:30:44 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2e539ab-5384-11f0-b894-0df219b8e170;
 Fri, 27 Jun 2025 20:30:39 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D3F525C5A24;
 Fri, 27 Jun 2025 18:30:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C8A8C4CEE3;
 Fri, 27 Jun 2025 18:30:36 +0000 (UTC)
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
X-Inumbo-ID: d2e539ab-5384-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751049037;
	bh=Oaw2iCUaqoeLV7nVH29bJPzhAc/IGXNw4stc7aFDrvI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aLxzbNRNzEjh2wp5ELi3FgqwtTvwkPsCTUIRxy1Mzkmst46qnSooCQoc25r/4nXaE
	 JO4b50k/XpqPWui4Ny532NltP68VF2OTZ8f+4v5mzJwZdkmV0BATeSYy1cnnGTx0Al
	 aurqY5FdJkBZEnBOrNGaObHAIELXI8htUP+FTM+dPcLZ0+7aInEIkOYAK12fqcVVcx
	 PYTmcFhk2EYYdhYbFvRom5AKROEs/wlEfltW1yeyND3rvJU4CqMGXIiZVkxJjAqzN1
	 LnIwwsnXw1L1+z0Vf8xnJgoVoMXiRPKnnCUx0MTLVtDsEMlHizYu2G/ky9nrVb22Z/
	 bjV1HvWhABHQQ==
Date: Fri, 27 Jun 2025 11:30:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Drop frametable_virt_end
In-Reply-To: <20250627084334.45172-1-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2506271130150.862517@ubuntu-linux-20-04-desktop>
References: <20250627084334.45172-1-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 26 Jun 2025, Michal Orzel wrote:
> It has never been used since the introduction and is technically a dead
> code violating MISRA C.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


