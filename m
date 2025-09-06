Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EC6B46840
	for <lists+xen-devel@lfdr.de>; Sat,  6 Sep 2025 04:02:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1112981.1461096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuiG2-0003mG-48; Sat, 06 Sep 2025 02:02:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1112981.1461096; Sat, 06 Sep 2025 02:02:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuiG2-0003kD-0R; Sat, 06 Sep 2025 02:02:26 +0000
Received: by outflank-mailman (input) for mailman id 1112981;
 Sat, 06 Sep 2025 02:02:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wK8U=3R=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uuiG0-0003NI-Dc
 for xen-devel@lists.xenproject.org; Sat, 06 Sep 2025 02:02:24 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86b13ce8-8ac5-11f0-9809-7dc792cee155;
 Sat, 06 Sep 2025 04:02:22 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3F25E602AB;
 Sat,  6 Sep 2025 02:02:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A35A1C4CEF4;
 Sat,  6 Sep 2025 02:02:19 +0000 (UTC)
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
X-Inumbo-ID: 86b13ce8-8ac5-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757124140;
	bh=d6Te6hH8K/CXA2JkttFsqJgILOB9+FPtcTIS+69iQJo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Eej6CrhXDBPKMqCTWAPM7pswhOoX5GlnsVYk+NTn8OIf5Q5swavkpUusDlgfSS4jR
	 wlKoKhRVgnaD9bXbPYVs4wA2pI+mJFqyXIxO4+jIUnwMEdqPyj3DGtpaCPnRCHC6aG
	 T460zn8VXQCYwhECKzsRifW4KCnn06Sy+/kGa4uRw4Jji44Oq07bmdPhVU3/B6dAoZ
	 Cwd5YlHBq+sG6zQMzaUryF8UXpFxUStH5lEkCOXnhU7nxt4r+k264mCEMgnmyiJJO0
	 UwYiN34HaEIhHED6nAMTnKoaj2M65uU56Kd1WkN2UdCOD1JjXE/EBQeV0eMrLxGvss
	 nyfQ/qsERHZpg==
Date: Fri, 5 Sep 2025 19:02:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmukhin@xen.org
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v6 01/15] emul/vuart: introduce framework for UART
 emulators
In-Reply-To: <20250905232715.440758-2-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2509051902090.1405870@ubuntu-linux-20-04-desktop>
References: <20250905232715.440758-1-dmukhin@ford.com> <20250905232715.440758-2-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 5 Sep 2025, dmukhin@xen.org wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Introduce a driver framework to abstract UART emulators in the hypervisor.
> 
> That allows for architecture-independent handling of virtual UARTs in the
> console driver and simplifies enabling new UART emulators.
> 
> The framework is built under CONFIG_VUART_FRAMEWORK, which will be
> automatically enabled once the user enables any UART emulator.
> 
> Current implementation supports maximum of one vUART of each kind per domain.
> 
> Use new domain_has_vuart() in the console driver code to check whether to
> forward console input to the domain using vUART.
> 
> Enable console forwarding over vUART for hardware domains with a vUART. That
> enables console forwarding to dom0 on x86, since console can be forwarded only
> to Xen, dom0 and pvshim on x86 as of now.
> 
> Note: existing vUARTs are deliberately *not* hooked to the new framework to
> minimize the scope of the patch: vpl011 (i.e. SBSA) emulator and "vuart" (i.e.
> minimalistic MMIO-mapped dtuart for hwdoms on Arm) are kept unmodified.
> 
> No functional changes for non-x86 architectures.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

