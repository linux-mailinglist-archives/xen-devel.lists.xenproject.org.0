Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6F2AD0A75
	for <lists+xen-devel@lfdr.de>; Sat,  7 Jun 2025 01:55:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008996.1388135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNgti-00088I-4A; Fri, 06 Jun 2025 23:54:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008996.1388135; Fri, 06 Jun 2025 23:54:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNgti-00086r-0t; Fri, 06 Jun 2025 23:54:54 +0000
Received: by outflank-mailman (input) for mailman id 1008996;
 Fri, 06 Jun 2025 23:54:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YRk0=YV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uNgtg-00086l-Qt
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 23:54:52 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a213015d-4331-11f0-b894-0df219b8e170;
 Sat, 07 Jun 2025 01:54:50 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 73591A50B77;
 Fri,  6 Jun 2025 23:54:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3671C4CEED;
 Fri,  6 Jun 2025 23:54:47 +0000 (UTC)
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
X-Inumbo-ID: a213015d-4331-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749254088;
	bh=44MjKNPOARN8t9LHoRfQTQDq0eeo+ZnR1nLbNcNSuAw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gANAS0V7NUwsKoSwkWt37zn+7cfCK1T3Vi8NmHpdGud088KCfbcWY+fV0BIbWlnb1
	 80kfDHZwS3ilGtD5SJuy+VXs7QrLfnvvM6g/QViEKfflAZ9hdr597k6RbE01yVHTUR
	 2bupF9Pt6TknsscwSv5AWzlFDWSjWr8BTukYyGj/6qEXWSMNiIgHNeFBr2LHNQBTZ/
	 kvBhU72fJNE4muDop6lJBPqo997Re5k0J+ISCFpuR6Dty7FLhtSdcQOYG4bLd7vlQd
	 eIRJJxlbk9ue8AOwaVTSH0elcixbxq81BaLuLRrnzFM/IY9qX7WsE/LmJW8DDMaKES
	 umV4U5n7y7EYg==
Date: Fri, 6 Jun 2025 16:54:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <agarciav@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 13/15] xen/dt: ifdef out DEV_DT-related bits from
 device_tree.{c,h}
In-Reply-To: <20250605194810.2782031-14-agarciav@amd.com>
Message-ID: <alpine.DEB.2.22.394.2506061654380.2495561@ubuntu-linux-20-04-desktop>
References: <20250605194810.2782031-1-agarciav@amd.com> <20250605194810.2782031-14-agarciav@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 5 Jun 2025, Alejandro Vallejo wrote:
> ... which means, device-tree.c stops requiring strictly CONFIG_HAS_DEVICE_TREE
> and may function without it.
> 
> Not a functional change on architectures that currently use these files,
> as they already select CONFIG_HAS_DEVICE_TREE.
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


