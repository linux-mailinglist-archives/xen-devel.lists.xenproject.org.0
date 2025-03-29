Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19909A7539A
	for <lists+xen-devel@lfdr.de>; Sat, 29 Mar 2025 01:11:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.931344.1333713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyJnJ-0006jG-Cx; Sat, 29 Mar 2025 00:11:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931344.1333713; Sat, 29 Mar 2025 00:11:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyJnJ-0006gR-A2; Sat, 29 Mar 2025 00:11:25 +0000
Received: by outflank-mailman (input) for mailman id 931344;
 Sat, 29 Mar 2025 00:11:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oenM=WQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tyJjw-0003AW-43
 for xen-devel@lists.xenproject.org; Sat, 29 Mar 2025 00:07:56 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db73ee41-0c31-11f0-9ffa-bf95429c2676;
 Sat, 29 Mar 2025 01:07:53 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 40D9D4386A;
 Sat, 29 Mar 2025 00:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47630C4CEE4;
 Sat, 29 Mar 2025 00:07:50 +0000 (UTC)
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
X-Inumbo-ID: db73ee41-0c31-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743206871;
	bh=SeWWz17Gbgu0qHm2waKrLs2v8eOwFdoaYtWK9PM41sk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LxiADKHJzNSw8ZigtUmVI5rjh/OP+BBPgznVJk3IWPTaPt9eGpCYkKSB9ulJx1dQ1
	 RhtgcR3dRSg87pc0LHKzxszpfo/4WytxtbzKM4V/IUot5jnNrILwLbKWS5cPy9znMW
	 /DeVMcaIp7qCG+8YfQI5vUwQBFsREW6n5qGrI17OYaoJ8MkZ6FTNF2WjXTfNDiCoSC
	 YwwKU+IVaU13elS24f1nJ901dNQZLvLaPPv83YOcQG3BJGGEKokR6HeSAu6M6UznxC
	 0flBxB33hgb4/8nJnzeT6MKlYpLjQ4nloMFVI7f3NlNPCgWzGd5pAgVDu3LRoeOmec
	 ugm0yweP7KfaQ==
Date: Fri, 28 Mar 2025 17:07:48 -0700 (PDT)
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
Subject: Re: [PATCH v2 08/19] xen/sysctl: wrap around
 XEN_SYSCTL_lockprof_op
In-Reply-To: <20250326055053.3313146-9-Penny.Zheng@amd.com>
Message-ID: <alpine.DEB.2.22.394.2503281707390.563920@ubuntu-linux-20-04-desktop>
References: <20250326055053.3313146-1-Penny.Zheng@amd.com> <20250326055053.3313146-9-Penny.Zheng@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 26 Mar 2025, Penny Zheng wrote:
> The following function is only to serve spinlock profiling via
> XEN_SYSCTL_lockprof_op, so it shall be wrapped:
> - spinlock_profile_control
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


