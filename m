Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 686B3A781F6
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 20:12:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934746.1336362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzg5s-0002Nh-Ie; Tue, 01 Apr 2025 18:12:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934746.1336362; Tue, 01 Apr 2025 18:12:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzg5s-0002KZ-Fj; Tue, 01 Apr 2025 18:12:12 +0000
Received: by outflank-mailman (input) for mailman id 934746;
 Tue, 01 Apr 2025 18:12:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p4cc=WT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tzg5q-0002KT-TJ
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 18:12:10 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2d87f46-0f24-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 20:12:08 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 851F8A4056E;
 Tue,  1 Apr 2025 18:06:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C8E0C4CEE4;
 Tue,  1 Apr 2025 18:12:04 +0000 (UTC)
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
X-Inumbo-ID: d2d87f46-0f24-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743531127;
	bh=AMxKMdc6JaXGoDULpx2LsHyyK+9guJAeFHlb18Ysfys=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RZj2dFPq9CTYBxL2ojDtgvUsvNyjuQ/khq0dVSld02s3uJRixI6q+XQq1UIuEY4l0
	 GWgtEzhuIvYaGpDgDrggEoO14uv2OFxfPDRBoCjl/jkHU4qEzM4k6n9A4LWZ5r9Vrv
	 UM6EgVkgubAlZTaVD1ccHnaF4IeRHWDejy9pk7e72ZMj93He1g8Nb/ecxbH6ajQyYQ
	 qIWzipxQ1HqPHTeWQo+7Kp2tTp/VKU+nKPAddKsbk/Vdva8kXA641iUyfCY0bFEdB9
	 uMAvDgqrlSV485Sjwq8YzjzAqhfpKJ4O+5izxRcngML+meYkeqq2DmJuWvfEOKaQSN
	 Ega5cn/gKzE9A==
Date: Tue, 1 Apr 2025 11:12:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <luca.fancellu@arm.com>
cc: xen-devel@lists.xenproject.org, Penny Zheng <Penny.Zheng@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Alistair Francis <alistair.francis@wdc.com>, 
    Bob Eshleman <bobbyeshleman@gmail.com>, 
    Connor Davis <connojdavis@gmail.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Penny Zheng <penny.zheng@arm.com>, Wei Chen <wei.chen@arm.com>
Subject: Re: [PATCH v4 6/7] xen: introduce Kconfig ARCH_PAGING_MEMPOOL
In-Reply-To: <20250401085858.2228991-7-luca.fancellu@arm.com>
Message-ID: <alpine.DEB.2.22.394.2504011111440.3003625@ubuntu-linux-20-04-desktop>
References: <20250401085858.2228991-1-luca.fancellu@arm.com> <20250401085858.2228991-7-luca.fancellu@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 1 Apr 2025, Luca Fancellu wrote:
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> ARM MPU system doesn't need to use paging memory pool, as MPU memory
> mapping table at most takes only one 4KB page, which is enough to
> manage the maximum 255 MPU memory regions, for all EL2 stage 1
> translation and EL1 stage 2 translation.
> 
> Introduce ARCH_PAGING_MEMPOOL Kconfig common symbol, selected for Arm
> MMU systems and x86. Removed stubs from RISC-V now that the common code
> provide them and the functions are not gonna be used.
> 
> Wrap the code inside 'construct_domU' that deal with p2m paging
> allocation in a new function 'domain_p2m_set_allocation', protected
> by ARCH_PAGING_MEMPOOL, this is done in this way to prevent polluting
> the former function with #ifdefs and improve readability
> 
> Introduce arch_{get,set}_paging_mempool_size stubs for architecture
> with !ARCH_PAGING_MEMPOOL.
> 
> Remove 'struct paging_domain' from Arm 'struct arch_domain' when the
> field is not required.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com> # arm
> Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com> # riscv

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


