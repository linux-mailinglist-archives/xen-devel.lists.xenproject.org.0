Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A9FB3ACC2
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 23:33:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1100012.1453612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urkFL-0008NZ-S2; Thu, 28 Aug 2025 21:33:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1100012.1453612; Thu, 28 Aug 2025 21:33:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urkFL-0008Lb-OT; Thu, 28 Aug 2025 21:33:27 +0000
Received: by outflank-mailman (input) for mailman id 1100012;
 Thu, 28 Aug 2025 21:33:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YsNu=3I=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1urkFK-0008LD-LU
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 21:33:26 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a00f812c-8456-11f0-8dd7-1b34d833f44b;
 Thu, 28 Aug 2025 23:33:24 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C9D7F42CBF;
 Thu, 28 Aug 2025 21:33:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 057E2C4CEEB;
 Thu, 28 Aug 2025 21:33:20 +0000 (UTC)
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
X-Inumbo-ID: a00f812c-8456-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756416802;
	bh=wlrz4W9BDDtt5hU+pNgKNx4LHcRRYMmZY79WVrCjd3o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cR/3KZ4dtfQpUOVdJqW8OJKU35Hvt/EC547WbG9VNwonTavJLPeR8HnHZQSz02f/a
	 T/BVIkEg+SHQFFVqjbyyl+RTCqRmqTx7FQZhIc6fyTotVnAYrKk+3fivHZVsa1SdMm
	 gjvjkkt0xM6MHw+crJ/8jOQOXVewJEwI6XK/m/bk5jHYC0ks3cfCFalHUCovehNuKH
	 5Bjj61y2ACPqzRZshT9eJtzFKSQlIaMJ8MOk0Wx+P6w28dpG/3SdkLpGTxVT/tOlFc
	 96u3Iwj0Ghn4fVabkAO+hmXL9ynk2vVLOZmDc5KCjg22kYgg/RY9iFtB5tCcxHR/2c
	 EHPh5bvEzvWNA==
Date: Thu, 28 Aug 2025 14:33:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, 
    Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: [PATCH v6 2/4] xen/arm: scmi-smc: update to be used under sci
 subsystem
In-Reply-To: <8e7e9dcdd643b6681a6127d56b68536b987141af.1756399156.git.oleksii_moisieiev@epam.com>
Message-ID: <alpine.DEB.2.22.394.2508281433020.8757@ubuntu-linux-20-04-desktop>
References: <cover.1756399156.git.oleksii_moisieiev@epam.com> <8e7e9dcdd643b6681a6127d56b68536b987141af.1756399156.git.oleksii_moisieiev@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 28 Aug 2025, Oleksii Moisieiev wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> The introduced SCI (System Control Interface) subsystem provides unified
> interface to integrate in Xen SCI drivers which adds support for ARM
> firmware (EL3, SCP) based software interfaces (like SCMI) that are used in
> system management. The SCI subsystem allows to add drivers for different FW
> interfaces or have different drivers for the same FW interface (for example,
> SCMI with different transports).
> 
> This patch updates SCMI over SMC calls handling layer, introduced by
> commit 3e322bef8bc0 ("xen/arm: firmware: Add SCMI over SMC calls handling
> layer"), to be SCI driver:
> - convert to DT device;
> - convert to SCI Xen interface.
> 
> There are no functional changes in general, the driver is just adopted
> to the SCI interface.
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Also I wanted to write down that the R-b is OK from me

