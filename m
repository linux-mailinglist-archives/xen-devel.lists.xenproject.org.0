Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1477AD41F6
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 20:34:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011180.1389535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP3nM-0008Uo-BU; Tue, 10 Jun 2025 18:34:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011180.1389535; Tue, 10 Jun 2025 18:34:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP3nM-0008SV-8p; Tue, 10 Jun 2025 18:34:00 +0000
Received: by outflank-mailman (input) for mailman id 1011180;
 Tue, 10 Jun 2025 18:33:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+v+Z=YZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uP3nL-0008SP-1y
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 18:33:59 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fd347e9-4629-11f0-b894-0df219b8e170;
 Tue, 10 Jun 2025 20:33:44 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7B65843D97;
 Tue, 10 Jun 2025 18:33:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD7D5C4CEED;
 Tue, 10 Jun 2025 18:33:40 +0000 (UTC)
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
X-Inumbo-ID: 6fd347e9-4629-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749580422;
	bh=30bUi8BTLYMK6oisVqutcdFvyKwuRF3/QjLiEWd2rOw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rbik4ygArXqhsIoUnWJhYl8rsFE5H1Q4eLGBjcUgFMRs3BNrhAq9V693jNOzRNCSm
	 cVK5TQh/ZdArYyxAtFvk6ES9J9Wv0KHc0xnFXg3h0LzsivmUg3DtGbnG3gT+0qFcdP
	 qBycGro4K1cere2bhkxPyV53NC552tuEqaMrfsM4JuWaZh7GJz3OoAQixdIv20yWPQ
	 0mbSC3MOyJtjefgNmdCGf7zUJFVK/NsFMiCA4saaie3lnNQcpbNisau5Zlf4e6iFG5
	 WGpHrh+6A2wgsFHQD3G2My7wCLVsbIs49wrJtzD9iOtuewLk23xjb+ql4Su4zaktr9
	 xddfNWw3B5ajw==
Date: Tue, 10 Jun 2025 11:33:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: dmkhn@proton.me, Jan Beulich <jbeulich@suse.com>, 
    andrew.cooper3@citrix.com, anthony.perard@vates.tech, roger.pau@citrix.com, 
    sstabellini@kernel.org, teddy.astie@vates.tech, dmukhin@ford.com, 
    xen-devel@lists.xenproject.org, jason.andryuk@amd.com
Subject: Re: [PATCH v9 2/3] xen/domain: adjust domain ID allocation for Arm
In-Reply-To: <61e2ae99-041b-4c8c-81bb-c86b5cee936e@xen.org>
Message-ID: <alpine.DEB.2.22.394.2506101130490.2495561@ubuntu-linux-20-04-desktop>
References: <20250528225030.2652166-1-dmukhin@ford.com> <20250528225030.2652166-3-dmukhin@ford.com> <63087c42-d709-4e53-a2c3-8b812f13190a@xen.org> <a4c860d7-1fa0-43f4-8ae1-af59b7c6506f@xen.org> <30c01c78-5a5e-435f-9b1c-faca3af04a76@suse.com> <aEfmkMBW7r1KHuV0@kraken>
 <11ea9475-d963-473d-a85b-d1c461e7b213@suse.com> <aEf1Hw+x35Yci/FS@kraken> <61e2ae99-041b-4c8c-81bb-c86b5cee936e@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

+Jason

On Tue, 10 Jun 2025, Julien Grall wrote:
> But even if we are ok to break compatibility, I don't see the value of
> "control_domid". The implication of setting "hardware_domid" is you will
> have a separate control domain. At which point, why would it matter to specify
> the domain ID?
 
I just wanted to say that while we (AMD) are looking for a hardware
domain / control domain separation for safety reasons, I don't think we
have a need to specify the domid for either one.

Jason, is that correct?

