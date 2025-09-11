Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 389ADB5268B
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 04:36:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119160.1464666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwXAK-00066f-Fg; Thu, 11 Sep 2025 02:36:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119160.1464666; Thu, 11 Sep 2025 02:36:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwXAK-000649-Cj; Thu, 11 Sep 2025 02:36:04 +0000
Received: by outflank-mailman (input) for mailman id 1119160;
 Thu, 11 Sep 2025 02:36:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5SW2=3W=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uwX5Z-0003C3-TP
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 02:31:09 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5fbe020e-8eb7-11f0-9d13-b5c5bf9af7f9;
 Thu, 11 Sep 2025 04:31:09 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 342C66013D;
 Thu, 11 Sep 2025 02:31:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CE72C4CEEB;
 Thu, 11 Sep 2025 02:31:06 +0000 (UTC)
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
X-Inumbo-ID: 5fbe020e-8eb7-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757557867;
	bh=Nj/LW/DfXNbuVc7MsPOMUvZXGaRsDG4TO9H4+pNT9gU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qv2OXv7Vt07Mwbp2UcXyzGaw8SxQ3kPK40kZAsrzt8N6kWvYHsv1dFAZHbWd/7tft
	 MiQYEFQWMegRKOarO3vFGB96YCbbLykyfjSgb/CobHQE7NBXh4kIbLs5c5A2dxK7tQ
	 UYi3fL0JKxRLyM30RX011GpJO047rUqyCNT4XD88IY7xYoDSW47ieN/NEBUMX4jp2z
	 gAEGGE5o168O7XDaHL+R9Z0f5+JazudwIqP4Jc+6IuAV5o+rqtKfH0RwJGV39Nu4jV
	 GeVimFYLiJg9WHNHFghYfgtcYiSTUJpowlKVp2GgAJevBzVsC6javIpuG0wfC/T2s+
	 D9Z/ta38zqgHQ==
Date: Wed, 10 Sep 2025 19:31:04 -0700 (PDT)
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
Subject: Re: [PATCH v2 14/26] xen/domctl: wrap arch-specific arch_get_info_guest()
 with CONFIG_MGMT_HYPERCALLS
In-Reply-To: <20250910073827.3622177-15-Penny.Zheng@amd.com>
Message-ID: <alpine.DEB.2.22.394.2509101930300.52703@ubuntu-linux-20-04-desktop>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com> <20250910073827.3622177-15-Penny.Zheng@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 10 Sep 2025, Penny Zheng wrote:
> Arch-specific function arch_get_info_guest() is responsible for
> XEN_DOMCTL_getvcpucontext domctl-op, and shall be wrapped with
> CONFIG_MGMT_HYPERCALLS
> Wrap XEN_DOMCTL_getvcpucontext-case transiently with CONFIG_MGMT_HYPERCALLS,
> and it will be removed when introducing CONFIG_MGMT_HYPERCALLS on the
> common/domctl.c in the last.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

There is arch_get_info_guest under riscv but it is only a stub so:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

