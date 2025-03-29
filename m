Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA30A75394
	for <lists+xen-devel@lfdr.de>; Sat, 29 Mar 2025 01:07:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.931319.1333692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyJjE-0003Uk-Mw; Sat, 29 Mar 2025 00:07:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931319.1333692; Sat, 29 Mar 2025 00:07:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyJjE-0003Sx-Ix; Sat, 29 Mar 2025 00:07:12 +0000
Received: by outflank-mailman (input) for mailman id 931319;
 Sat, 29 Mar 2025 00:07:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oenM=WQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tyJjD-0003AW-S8
 for xen-devel@lists.xenproject.org; Sat, 29 Mar 2025 00:07:11 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1e6ed6a-0c31-11f0-9ffa-bf95429c2676;
 Sat, 29 Mar 2025 01:07:10 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 29F155C100B;
 Sat, 29 Mar 2025 00:04:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D155C4CEE4;
 Sat, 29 Mar 2025 00:07:07 +0000 (UTC)
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
X-Inumbo-ID: c1e6ed6a-0c31-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743206828;
	bh=QOL1SjKrqmPDLWAU51TkSxpk97iUGfgl/1pOBgkgIDY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ur+PnpSmq072MDzP4VsE4VGJLOyo+UHiaMsEOwJGCpVve1z7moG5rA2iIUXLoCsC0
	 TF1eFvRz4lKxv7eqi3kMEKxb0u4xfR2fv0fM+BvG8ee/sIG34x93n/VgSPLU66JpW0
	 LRPLu0jUUsij4Ow9A5njA8Y7XhRpHbPpR0OHJ9YSE+xjwMwUjzWiTNkiWosGzRjnwY
	 kGlkJ4Vv+ccIA35opydofiAnbl0go/t2Ji6JuKQnLWipZrtdBnKHCy+r8PvJIEyu34
	 Hpcd40Zl/clZB1UETnHsho0l5XwtXGft3W/BpIy09XOq00XN3aEPfjTUSeoGruqeZ9
	 JOJISU5k6E3Ag==
Date: Fri, 28 Mar 2025 17:07:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@amd.com>
cc: xen-devel@lists.xenproject.org, ray.huang@amd.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 04/19] xen/sysctl: wrap around
 XEN_SYSCTL_readconsole
In-Reply-To: <20250326055053.3313146-5-Penny.Zheng@amd.com>
Message-ID: <alpine.DEB.2.22.394.2503281706590.563920@ubuntu-linux-20-04-desktop>
References: <20250326055053.3313146-1-Penny.Zheng@amd.com> <20250326055053.3313146-5-Penny.Zheng@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 26 Mar 2025, Penny Zheng wrote:
> The following functions is to deal with XEN_SYSCTL_readconsole sub-op, and
> shall be wrapped:
> - xsm_readconsole
> - read_console_ring
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


