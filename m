Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2897C6F0DDD
	for <lists+xen-devel@lfdr.de>; Thu, 27 Apr 2023 23:59:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527097.819334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ps9e0-0004C0-1a; Thu, 27 Apr 2023 21:59:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527097.819334; Thu, 27 Apr 2023 21:59:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ps9dz-00048d-UU; Thu, 27 Apr 2023 21:59:15 +0000
Received: by outflank-mailman (input) for mailman id 527097;
 Thu, 27 Apr 2023 21:59:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JUcw=AS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ps9dx-00048X-Ps
 for xen-devel@lists.xenproject.org; Thu, 27 Apr 2023 21:59:13 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be0ef246-e546-11ed-b224-6b7b168915f2;
 Thu, 27 Apr 2023 23:59:12 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1A85660B46;
 Thu, 27 Apr 2023 21:59:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6281C433EF;
 Thu, 27 Apr 2023 21:59:09 +0000 (UTC)
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
X-Inumbo-ID: be0ef246-e546-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682632750;
	bh=9V2totps9QaIaAeRc12FcCixTxaKaBm1Nb6gJmSFR6Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GBCO7MobW1PQdVUANy1FsxBKVAgbATQM3DgO62qUKyaASIZ2Iy6I++MuTC1aegIYb
	 kZpUQnjCHrIEx45ZAhyaxECE3nbmMRG1rJEBJcjpRT2vVjl5h80+/cThUDH+nxJUJD
	 JfTNVASi7mxtBOGH0uXLyM8YNdYaHOjPZmS2xg+b14FwoVZ75uahzt1pbpaJEG4Png
	 bDwudD6Nuf0Q95AeyyvhBPkyM3L/FAZIuclsPnWcvKIJHNyLKK3/rfcZMvVxmRstCo
	 yDQI8RKC/B6sDvr6zu3deVz+B/e7hrDcWE3u4JinROMO4M9+DCd/6ncnbAZNWwZVTt
	 FCpoA4aMUP41g==
Date: Thu, 27 Apr 2023 14:59:08 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/2] automation: xilinx: Set up bridging only for a
 default test case
In-Reply-To: <20230427120553.18088-2-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2304271459020.3419@ubuntu-linux-20-04-desktop>
References: <20230427120553.18088-1-michal.orzel@amd.com> <20230427120553.18088-2-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 27 Apr 2023, Michal Orzel wrote:
> At the moment, setting up a network bridge is unconditionally placed
> in the dom0 xen.start script. Since we might want to use the network
> interface (there is only one working GEM on the board) for other tests
> (e.g. passthrough), move the bridge setup to a dom0_check variable being
> part of a default ping test (i.e. if no test variant specified).
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/scripts/xilinx-smoke-dom0less-arm64.sh | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/automation/scripts/xilinx-smoke-dom0less-arm64.sh b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
> index 82158ab7ea1b..73ba251f4cc1 100755
> --- a/automation/scripts/xilinx-smoke-dom0less-arm64.sh
> +++ b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
> @@ -6,6 +6,14 @@ test_variant=$1
>  
>  if [ -z "${test_variant}" ]; then
>      passed="ping test passed"
> +    dom0_check="
> +brctl addbr xenbr0
> +brctl addif xenbr0 eth0
> +ifconfig eth0 up
> +ifconfig xenbr0 up
> +ifconfig xenbr0 192.168.0.1
> +xl network-attach 1 type=vif
> +"
>      domU_check="
>  until ifconfig eth0 192.168.0.2 &> /dev/null && ping -c 10 192.168.0.1; do
>      sleep 30
> @@ -51,13 +59,6 @@ bash /etc/init.d/xencommons start
>  
>  /usr/local/lib/xen/bin/init-dom0less
>  
> -brctl addbr xenbr0
> -brctl addif xenbr0 eth0
> -ifconfig eth0 up
> -ifconfig xenbr0 up
> -ifconfig xenbr0 192.168.0.1
> -
> -xl network-attach 1 type=vif
>  ${dom0_check}
>  " > etc/local.d/xen.start
>  chmod +x etc/local.d/xen.start
> -- 
> 2.25.1
> 

