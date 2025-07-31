Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A654B1797C
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 01:21:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066567.1431739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhca2-0000wf-Kj; Thu, 31 Jul 2025 23:20:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066567.1431739; Thu, 31 Jul 2025 23:20:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhca2-0000tv-I4; Thu, 31 Jul 2025 23:20:58 +0000
Received: by outflank-mailman (input) for mailman id 1066567;
 Thu, 31 Jul 2025 23:20:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0qgQ=2M=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uhca1-0000tp-0x
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 23:20:57 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01268571-6e65-11f0-b895-0df219b8e170;
 Fri, 01 Aug 2025 01:20:54 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3D3A3438CD;
 Thu, 31 Jul 2025 23:20:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4F49C4CEFD;
 Thu, 31 Jul 2025 23:20:51 +0000 (UTC)
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
X-Inumbo-ID: 01268571-6e65-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754004053;
	bh=3AZZZb3OLeYfsV4CNlciX8qXIiXXXbKIvMumUQXKyz8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=soVjjrZibcvKegZGor9znWqSixyoP0tpSS3RFY43d7PDRVbPNu9tV6HWOIf/Ogb5g
	 gvE/r6Udl/6bqRkumGe0dLaIijyadgTZruPtlm1nJGAGpAY9G8+r9cZVKEz8ICRrh9
	 oFXsTdgiJb0WWHo/7TCbnUCeLj9esV2BSHB9CJGk4MfjPyRWyKiiZvRybXYRvC/GbJ
	 y+3gcVWzG8PG9PRwHRg2sZw/zOzJ1d5TQGaH7o9tu0vQ0yAfM2C0e+0R8ox8M64UB0
	 eYE0ecmdD7wdl8PUpjtHm4zPT24sTIktWMYjoZwHmHx/37bpxgfojpu96etW7VqOfw
	 fOjWOV8vd+ipw==
Date: Thu, 31 Jul 2025 16:20:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmkhn@proton.me
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v4 3/8] x86/domain: allocate d->{iomem,irq}_caps before
 arch-specific initialization
In-Reply-To: <20250731192130.3948419-4-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2507311620420.468590@ubuntu-linux-20-04-desktop>
References: <20250731192130.3948419-1-dmukhin@ford.com> <20250731192130.3948419-4-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 31 Jul 2025, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Move IRQ/IOMEM rangesets allocation before arch_domain_create().
> 
> That guarantees that arch-specific code could access those rangesets to
> register traps for emulation.
> 
> It is necessary for those emulators registering trap handlers and ensuring
> that emulated IRQs are not shared with the physical IRQs.
> 
> Move dom0_setup_permissions() call right after I/O rangesets are allocated.
> 
> Move pvh_setup_mmcfg() inside dom0_setup_permissions() close to the place
> where MMCFG ranges are initialized.
> 
> Not a functional change.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

