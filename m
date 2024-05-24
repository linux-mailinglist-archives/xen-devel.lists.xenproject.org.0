Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C868CEC7C
	for <lists+xen-devel@lfdr.de>; Sat, 25 May 2024 00:51:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729949.1135283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAdkR-0002bX-Ib; Fri, 24 May 2024 22:50:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729949.1135283; Fri, 24 May 2024 22:50:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAdkR-0002Z9-Fr; Fri, 24 May 2024 22:50:51 +0000
Received: by outflank-mailman (input) for mailman id 729949;
 Fri, 24 May 2024 22:50:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K6bJ=M3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sAdkP-0002Z1-QC
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 22:50:49 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0eccace8-1a20-11ef-b4bb-af5377834399;
 Sat, 25 May 2024 00:50:47 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D25516150B;
 Fri, 24 May 2024 22:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C2C9C2BBFC;
 Fri, 24 May 2024 22:50:44 +0000 (UTC)
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
X-Inumbo-ID: 0eccace8-1a20-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716591045;
	bh=9wwxkrL7EisBY3XiHMlCsZUncfQqWk8OHDsvBxUz7GI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dS1dEX4qOyrK6c9vNO+Gs4Y0myjI1duyCJ//Rygx4ptGei1hfBopiWya0CIm1Bc+z
	 gZhmGITBgsNcsa4OJ5vNIrKYX+Hvfmd4Lbr+1ybAl0jxVEffifTFpDnyXPI0RaaHAi
	 kRCWj8cS/dKE3pdYWES5zUlKCIBEllw9uPQpaC+ZphwKdbsSNJ2AWztEATTGU8qkYR
	 dor7XuCmsecNAMIhJcBmdFuskf4R3d7iPQHQnowmL1RmtmsX268nl7h5cWpG6EPEqw
	 m+Ig5op7+mC5XdmYRlyEOtkSvMGeNPcSVMv67ta0QbZAR5/pQMcc70YDuPywyZC15J
	 GzGAw8bF/J9pg==
Date: Fri, 24 May 2024 15:50:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry Wang <xin.wang2@amd.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 4/4] docs/features/dom0less: Update the late XenStore
 init protocol
In-Reply-To: <20240517032156.1490515-5-xin.wang2@amd.com>
Message-ID: <alpine.DEB.2.22.394.2405241550370.2557291@ubuntu-linux-20-04-desktop>
References: <20240517032156.1490515-1-xin.wang2@amd.com> <20240517032156.1490515-5-xin.wang2@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 17 May 2024, Henry Wang wrote:
> With the new allocation strategy of Dom0less DomUs XenStore page,
> update the doc of the late XenStore init protocol accordingly.
> 
> Signed-off-by: Henry Wang <xin.wang2@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> v3:
> - Wording change.
> v2:
> - New patch.
> ---
>  docs/features/dom0less.pandoc | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/docs/features/dom0less.pandoc b/docs/features/dom0less.pandoc
> index 725afa0558..8b178edee0 100644
> --- a/docs/features/dom0less.pandoc
> +++ b/docs/features/dom0less.pandoc
> @@ -110,9 +110,10 @@ hotplug PV drivers to dom0less guests. E.g. xl network-attach domU.
>  The implementation works as follows:
>  - Xen allocates the xenstore event channel for each dom0less domU that
>    has the "xen,enhanced" property, and sets HVM_PARAM_STORE_EVTCHN
> -- Xen does *not* allocate the xenstore page and sets HVM_PARAM_STORE_PFN
> -  to ~0ULL (invalid)
> -- Dom0less domU kernels check that HVM_PARAM_STORE_PFN is set to invalid
> +- Xen allocates the xenstore page and sets HVM_PARAM_STORE_PFN as well
> +  as the connection status to XENSTORE_RECONNECT.
> +- Dom0less domU kernels check that HVM_PARAM_STORE_PFN is set to
> +  ~0ULL (invalid) or the connection status is *not* XENSTORE_CONNECTED.
>      - Old kernels will continue without xenstore support (Note: some old
>        buggy kernels might crash because they don't check the validity of
>        HVM_PARAM_STORE_PFN before using it! Disable "xen,enhanced" in
> @@ -121,13 +122,14 @@ The implementation works as follows:
>        channel (HVM_PARAM_STORE_EVTCHN) before continuing with the
>        initialization
>  - Once dom0 is booted, init-dom0less is executed:
> -    - it allocates the xenstore shared page and sets HVM_PARAM_STORE_PFN
> +    - it gets the xenstore shared page from HVM_PARAM_STORE_PFN
>      - it calls xs_introduce_domain
>  - Xenstored notices the new domain, initializes interfaces as usual, and
>    sends an event channel notification to the domain using the xenstore
>    event channel (HVM_PARAM_STORE_EVTCHN)
>  - The Linux domU kernel receives the event channel notification, checks
> -  HVM_PARAM_STORE_PFN again and continue with the initialization
> +  HVM_PARAM_STORE_PFN and the connection status again and continue with
> +  the initialization
>  
>  
>  Limitations
> -- 
> 2.34.1
> 
> 

