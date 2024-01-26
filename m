Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B12D283E626
	for <lists+xen-devel@lfdr.de>; Sat, 27 Jan 2024 00:03:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672569.1046724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTVDT-00060z-Ay; Fri, 26 Jan 2024 23:02:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672569.1046724; Fri, 26 Jan 2024 23:02:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTVDT-0005zQ-81; Fri, 26 Jan 2024 23:02:31 +0000
Received: by outflank-mailman (input) for mailman id 672569;
 Fri, 26 Jan 2024 23:02:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gfIe=JE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rTVDR-0005y0-9g
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 23:02:29 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f91209c2-bc9e-11ee-8a43-1f161083a0e0;
 Sat, 27 Jan 2024 00:02:27 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 36D12CE356A;
 Fri, 26 Jan 2024 23:02:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF635C433C7;
 Fri, 26 Jan 2024 23:02:19 +0000 (UTC)
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
X-Inumbo-ID: f91209c2-bc9e-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706310140;
	bh=6Mio2bziPDdidLdEUvhKi4o66hEgDnPmfi0vu1c5Fek=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SRtl070rO2bayNtBI8/XI+la7zvDfZbXO6cGEFq4mqy96NLlrcNVIKvcs6YMb2j9d
	 pJMLywr8BbRiV6FNMXOTar9t2nyDKbBirEm+CXO5ZOgy67p5G44mWuozYTFeyjcrSV
	 Hh9sVMFpRV6HdD53rEO8BwEREOI7W8BS/h7hVsDw/Ocq5Ra1aA+Hr20cUEAaqdBC2I
	 z8p7oFizIdtpvVX07GuS47lirSMVbw2rjadCGNRy1QOYOrlFDESIbDgfim69KCLYMe
	 q43vefVCZd3TDG0hOWTYq/w8I+q4Z/d3/6rJXte566CgqfAnMtdy1eZ3Sl7PDRq6Ic
	 S5uW6IidXiaDw==
Date: Fri, 26 Jan 2024 15:02:18 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org
Subject: Re: [ImageBuilder][PATCH] Fix Xen boot-time cpupools handling
In-Reply-To: <20240126125128.18275-1-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2401261502100.292110@ubuntu-linux-20-04-desktop>
References: <20240126125128.18275-1-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 25 Jan 2024, Michal Orzel wrote:
> When retrieving a phandle for a CPU node using "fdtget -t x", the
> resulting hex number (in case the phandle exists) lacks the '0x' prefix.
> This value is subsequently used to construct the cpupool-cpus property.
> This results in an incorrect property generation that leads to Xen
> failure (example: cpupool-cpus < a> instead of < 0xa>). Address the
> issue by adding 0x prefix to the result from fdtget.
> 
> Additionally, avoid unnecessary regeneration of the phandle if it already
> exists.
> 
> Fixes: b687773b5046 ("Add support for Xen boot-time cpupools")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> This only worked if phandle did not exist or if its value did not contain a-f
> and was regenerated anyway.
> ---
>  scripts/uboot-script-gen | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index 078a667c61ab..3cc6b47c7c62 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -262,12 +262,12 @@ function add_device_tree_cpupools()
>              fi
>  
>              # set phandle for a cpu if there is none
> -            if ! phandle=$(fdtget -t x "${DEVICE_TREE}" "$cpu" "phandle" 2> /dev/null)
> +            if ! phandle="0x$(fdtget -t x "${DEVICE_TREE}" "$cpu" "phandle" 2> /dev/null)"
>              then
>                  get_next_phandle phandle
> +                dt_set "$cpu" "phandle" "hex" "$phandle"
>              fi
>  
> -            dt_set "$cpu" "phandle" "hex" "$phandle"
>              cpu_phandles="$cpu_phandles $phandle"
>              cpu_list="$cpu_list $cpu"
>          done
> -- 
> 2.25.1
> 

