Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DACBB0991D
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 03:22:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047736.1418093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucZnt-0005nV-TK; Fri, 18 Jul 2025 01:22:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047736.1418093; Fri, 18 Jul 2025 01:22:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucZnt-0005ku-Qg; Fri, 18 Jul 2025 01:22:25 +0000
Received: by outflank-mailman (input) for mailman id 1047736;
 Fri, 18 Jul 2025 01:22:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uH3I=Z7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ucZnr-0005ko-NV
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 01:22:23 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6bb002c-6375-11f0-b894-0df219b8e170;
 Fri, 18 Jul 2025 03:22:21 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0F35A613F3;
 Fri, 18 Jul 2025 01:22:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF38DC4CEE3;
 Fri, 18 Jul 2025 01:22:17 +0000 (UTC)
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
X-Inumbo-ID: a6bb002c-6375-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752801739;
	bh=Q3lEkszipnxkMJfkll0aQhBVeb0PzbAKh15a0EOljAI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MlKLIZFBHU6WKZhs19yE8o0yHw45vKDenFAHCIeeEbrCbd+UL7VpY3TiHxI8LrAlV
	 kM9NuGfCfT/xjMPD/uaJWso/7at913/ZRGNtKw/j7DC3JgzSWbTgQIOsKDG/bCY2Yv
	 Su73MVWxvBCGXJQb0oI5REohkTBKYs4faDu9Ye5RuAJkCBTd1i5VscsexC8YFebNrN
	 LgWbP7lgahxDoFFf7l/63P01pSxULSLswC9WKyM2Ond3FCpS5RsMk2tmp9uOlOxijK
	 91ZQGUZEjqxMwVpyhimf7zSo+C8l53fJUZXhgnV7z6IKFLRDlaQ+5iYk37BD2m/YHh
	 NvOD5A8WTUXCw==
Date: Thu, 17 Jul 2025 18:22:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Andryuk <jason.andryuk@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Christian Lindig <christian.lindig@citrix.com>, 
    David Scott <dave@recoil.org>, Anthony PERARD <anthony.perard@vates.tech>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    Christian Lindig <christian.lindig@cloud.com>
Subject: Re: [PATCH v2 03/17] xen: Add DOMAIN_CAPS_DEVICE_MODEL &
 XEN_DOMCTL_CDF_device_model
In-Reply-To: <20250716211504.291104-4-jason.andryuk@amd.com>
Message-ID: <alpine.DEB.2.22.394.2507171822070.15546@ubuntu-linux-20-04-desktop>
References: <20250716211504.291104-1-jason.andryuk@amd.com> <20250716211504.291104-4-jason.andryuk@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 16 Jul 2025, Jason Andryuk wrote:
> To add more flexibility in system configuration add the new
> DOMAIN_CAPS_DEVICE_MODEL flag and XEN_DOMCTL_CDF_device_model.
> 
> Thie new flag corresponds to allowing XSM_DM_PRIV for the domain.  This
> will enable running device model emulators (QEMU) from the assigned
> domain for multiple target domains.
> 
> Stubdoms assign target allowing the stubdom to serve as the device
> model for a single domain.  This new flag allows the single domain to
> provide emulators for multiple guests.
> 
> The specific scenario is a disaggregated system with the hardware domain
> providing device models for multiple guest domains.
> 
> This permission is also enough to run xenconsoled in the hardware
> domain.  This is a byproduct of getdomaininfo being available.  The
> grant permissions are also configured for the console page.
> 
> The OCaml code needs the flag added in as well.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> Acked-by: Christian Lindig <christian.lindig@cloud.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


