Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2922CAD996D
	for <lists+xen-devel@lfdr.de>; Sat, 14 Jun 2025 03:26:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1015190.1393137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQFf2-0004ZJ-TN; Sat, 14 Jun 2025 01:26:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1015190.1393137; Sat, 14 Jun 2025 01:26:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQFf2-0004Wa-Qa; Sat, 14 Jun 2025 01:26:20 +0000
Received: by outflank-mailman (input) for mailman id 1015190;
 Sat, 14 Jun 2025 01:26:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SRxw=Y5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uQFf2-0004WU-C9
 for xen-devel@lists.xenproject.org; Sat, 14 Jun 2025 01:26:20 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91b43dd0-48be-11f0-b894-0df219b8e170;
 Sat, 14 Jun 2025 03:26:18 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 267105C620E;
 Sat, 14 Jun 2025 01:24:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30109C4CEE3;
 Sat, 14 Jun 2025 01:26:15 +0000 (UTC)
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
X-Inumbo-ID: 91b43dd0-48be-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749864376;
	bh=MKIhEtMQdkKqHIH25eJWd6I2t6EYo+tKXtUNq6Kc7Ds=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tPniVEx0o/afz5gx+b701rIAkLnkck4301HRZC5M3bvzBwS/qrdc2q6+i7HQzn2zz
	 tmYxOrgOe4STknq2i+FcsUtlcq9huO5xN3KaErrUqWXAJGWl05g1JXrRddgAj7OHW5
	 2hmHCJ/kj8uyHXni75gViVeIwNO3bFD2iHJe3Vh2VEAHb/W8warLFfR/nKjZL6uOdI
	 ABMFisGsTpto1Z2Ph9yuqVXwEbgW74bpQYYKDiixOVkkQ1WjDrU6CA4xlz4HYAK8/e
	 fSfF+Kh/fDwJwlsdmXDlSenlGZtoVcpkJCN8R4M0JstSYUDwibMpyY3+o+mz8m7wRX
	 WGeOX5h5duj8g==
Date: Fri, 13 Jun 2025 18:26:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <agarciav@amd.com>
cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v3 14/14] kconfig: Allow x86 to pick
 CONFIG_DOM0LESS_BOOT
In-Reply-To: <20250613151612.754222-15-agarciav@amd.com>
Message-ID: <alpine.DEB.2.22.394.2506131825550.8480@ubuntu-linux-20-04-desktop>
References: <20250613151612.754222-1-agarciav@amd.com> <20250613151612.754222-15-agarciav@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 13 Jun 2025, Alejandro Vallejo wrote:
> Without picking CONFIG_HAS_DEVICE_TREE.
> 
> In order to do that. Allow CONFIG_DOM0LESS_BOOT to enable a subset
> of the common/device-tree/ directory. x86 doesn't want dom0less-build.c,
> as that's tightly integrated still to the ARM way of building domains.
> 
> Requires "unsupported" for the time being until all required patches
> make it through.
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

