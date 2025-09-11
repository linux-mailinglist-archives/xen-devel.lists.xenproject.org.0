Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FF7B5268D
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 04:36:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119167.1464676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwXAq-0006pi-NK; Thu, 11 Sep 2025 02:36:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119167.1464676; Thu, 11 Sep 2025 02:36:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwXAq-0006oB-Kb; Thu, 11 Sep 2025 02:36:36 +0000
Received: by outflank-mailman (input) for mailman id 1119167;
 Thu, 11 Sep 2025 02:36:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5SW2=3W=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uwXAo-0006np-LJ
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 02:36:34 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 204f5337-8eb8-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 04:36:32 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0584D44667;
 Thu, 11 Sep 2025 02:36:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54BF1C4CEEB;
 Thu, 11 Sep 2025 02:36:29 +0000 (UTC)
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
X-Inumbo-ID: 204f5337-8eb8-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757558190;
	bh=3KH0HxVPhc7NG59TgII8DWZH0dSP9zBMOLrOVbY085o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WkmwLD6EaOTPjK2fYoiKLs0nrI8kkjQGU2p/nrZtcKNyu1sjvYYfB986xmF9u7jwx
	 qP2syrAOUa6OJ75+ZG9mF8inBW5nUPLy8HO6v69Qz7rT8q1aEY1e8I/eM3sbnFQmIi
	 T6Fg6ZiuCoRHPGTEgC6OrMojmP/rn49YkOecSDlrsERDxtRPZuko/b6tCIANpW/Ywc
	 S97hpInqJ1l7nagQc6tFmMpngwTkQSmMXdTLRJGqeL6pZ9iT2nSrVRSBT/oJ6Lgzcs
	 KYUSRImUa0/JHkhU2vmwmStB6CFe5EH3xnSSAPKtCQJ/o/B1uIDyQvQPOknfKWXLKQ
	 UiPh+penE/wSA==
Date: Wed, 10 Sep 2025 19:36:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@amd.com>
cc: xen-devel@lists.xenproject.org, ray.huang@amd.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 16/26] xen/domctl: wrap arch-specific domain_set_time_offset()
 with CONFIG_MGMT_HYPERCALLS
In-Reply-To: <20250910073827.3622177-17-Penny.Zheng@amd.com>
Message-ID: <alpine.DEB.2.22.394.2509101934440.52703@ubuntu-linux-20-04-desktop>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com> <20250910073827.3622177-17-Penny.Zheng@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 10 Sep 2025, Penny Zheng wrote:
> Arch-specific domain_set_time_offset() is responisble for
> XEN_DOMCTL_settimeoffset domctl-op, and shall be wrapped with
> CONFIG_MGMT_HYPERCALLS
> Wrap XEN_DOMCTL_settimeoffset-case transiently with CONFIG_MGMT_HYPERCALLS,
> and it will be removed when introducing CONFIG_MGMT_HYPERCALLS on the
> common/domctl.c in the last.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

riscv has only a stub so:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

