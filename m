Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E40AA5E804
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 00:08:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910909.1317496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsVBE-0000nE-RI; Wed, 12 Mar 2025 23:08:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910909.1317496; Wed, 12 Mar 2025 23:08:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsVBE-0000lm-OS; Wed, 12 Mar 2025 23:08:04 +0000
Received: by outflank-mailman (input) for mailman id 910909;
 Wed, 12 Mar 2025 23:08:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K94u=V7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tsVBD-0000lg-4P
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 23:08:03 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8587ddb-ff96-11ef-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 00:08:01 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AF8F2A444BA;
 Wed, 12 Mar 2025 23:02:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB808C4CEDD;
 Wed, 12 Mar 2025 23:07:58 +0000 (UTC)
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
X-Inumbo-ID: d8587ddb-ff96-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741820880;
	bh=C9xFQnThTri1CCCoHT8jtv7NIWyf7pS+k1Bbw39vy7A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ohsm9LJ18dU2BfBP3qNVqa9k+0/hiihG/aQxfhr4tN/iReTc7V63tDTYVCVL99ImE
	 iMThezanbHARPWTgE6Mvf8hj4IRlAoDdWyCYnh1stem52ONQGw8C0bC6u1kurXmTfG
	 +pq3jkLO0E2aog/QylzDPNnKbguFT1X4P1TN0r3tNyCvr7qAb0iGAuCGQpf325I5FH
	 7262bYVKGJuC+a9k1O14sqMfS24rxiD0l06hoMxQPMMM2fuJz3Izjlcp88vbI8wv6i
	 bakWxPRQvWtixwhpr7qNQLiaACK5yeGV3f4UZNkwMUlrFhFHHbFkxm3lRFgSiqlG3f
	 h2DwsUW4pw3dQ==
Date: Wed, 12 Mar 2025 16:07:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@amd.com>
cc: xen-devel@lists.xenproject.org, ray.huang@amd.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 04/19] xen/sysctl: make CONFIG_TRACEBUFFER depend on
 CONFIG_SYSCTL
In-Reply-To: <20250312040632.2853485-5-Penny.Zheng@amd.com>
Message-ID: <alpine.DEB.2.22.394.2503121607520.3477110@ubuntu-linux-20-04-desktop>
References: <20250312040632.2853485-1-Penny.Zheng@amd.com> <20250312040632.2853485-5-Penny.Zheng@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 12 Mar 2025, Penny Zheng wrote:
> Users could only access trace buffers via hypercal XEN_SYSCTL_tbuf_op,
> so this commit makes CONFIG_TRACEBUFFER depend on CONFIG_SYSCTL
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/common/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 72e1d7ea97..c5f4192b60 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -513,6 +513,7 @@ config DTB_FILE
>  config TRACEBUFFER
>  	bool "Enable tracing infrastructure" if EXPERT
>  	default y
> +	depends on SYSCTL
>  	help
>  	  Enable tracing infrastructure and pre-defined tracepoints within Xen.
>  	  This will allow live information about Xen's execution and performance
> -- 
> 2.34.1
> 

