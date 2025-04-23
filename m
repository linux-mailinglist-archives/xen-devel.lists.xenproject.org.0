Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C819A999CE
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 22:57:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965375.1355952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7h9W-0005IV-5j; Wed, 23 Apr 2025 20:57:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965375.1355952; Wed, 23 Apr 2025 20:57:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7h9W-0005Gi-3E; Wed, 23 Apr 2025 20:57:06 +0000
Received: by outflank-mailman (input) for mailman id 965375;
 Wed, 23 Apr 2025 20:57:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UY1Q=XJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u7h9U-0005Gc-OT
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 20:57:04 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 816c75ce-2085-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 22:57:02 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 863666844A;
 Wed, 23 Apr 2025 20:56:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D83FC4CEE2;
 Wed, 23 Apr 2025 20:57:00 +0000 (UTC)
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
X-Inumbo-ID: 816c75ce-2085-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745441821;
	bh=DkYPDKTeR9ppjKsVYzGafGfHupzO+lU1f/JdBGBdGP0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WC+WU0GFOcOaSb6h003LQ0Dhfu8J7eL4ZVqaqbUcBfEk5OaFfkF2mX+dy7N717RUy
	 nJDIQ/Ot/zWMFTMcumoqs37jK3RSXJ6L7H5o0jP5h0qSITXzR/8eC/y0e1zeG8jtDo
	 dYQKcSkmV+8APPCzp3kVoVbm6kAULsFN7I4mc4AxjpGt0pcK+DIJdHOUARIP/gUwM7
	 pL1NRPpM6m3+c87Ma9EGgmchpexHaCXqMVpibZPBnE+ObmH3cnaUmjIMySU7n7IBv0
	 ToDpbx8u+bvr+CwsB7wqxI7CVEwBx9nk7EfDf9IkKYneRO8TpO+oxA2B7dZBTT9pyk
	 QFtDqzjWelmYw==
Date: Wed, 23 Apr 2025 13:56:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 2/4] xen/arm: make pci_host_common_probe return the
 bridge
In-Reply-To: <8bacbb27806c04eb68ac4d5582b42961d61435e5.1745402473.git.mykyta_poturai@epam.com>
Message-ID: <alpine.DEB.2.22.394.2504231356541.785180@ubuntu-linux-20-04-desktop>
References: <cover.1745402473.git.mykyta_poturai@epam.com> <8bacbb27806c04eb68ac4d5582b42961d61435e5.1745402473.git.mykyta_poturai@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 23 Apr 2025, Mykyta Poturai wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Some of the PCI host bridges require additional processing during the
> probe phase. For that they need to access struct bridge of the probed
> host, so return pointer to the new bridge from pci_host_common_probe.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

