Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E0479D7E2
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 19:47:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600695.936440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg7Sy-0002cM-32; Tue, 12 Sep 2023 17:46:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600695.936440; Tue, 12 Sep 2023 17:46:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg7Sy-0002ag-0M; Tue, 12 Sep 2023 17:46:24 +0000
Received: by outflank-mailman (input) for mailman id 600695;
 Tue, 12 Sep 2023 17:46:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2+51=E4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qg7Sx-0002ZH-3J
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 17:46:23 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47182a2a-5194-11ee-9b0d-b553b5be7939;
 Tue, 12 Sep 2023 19:46:19 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BD05761656;
 Tue, 12 Sep 2023 17:46:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37E46C433C7;
 Tue, 12 Sep 2023 17:46:16 +0000 (UTC)
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
X-Inumbo-ID: 47182a2a-5194-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694540777;
	bh=FAnN0umrHiaTSlldOzix2uRE+u+92RhQY5zq2hjJ3tY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gnxs/csWJDEoLu22OxMOOxOiHHzlqp3b6fEXdd/4iIvMGUKpdBPP69soV+2nrXZZy
	 9C1dM87dxwvPt4KkcylK4FvknD/9OC9DVMiDqY5RBfUkdmv8GJ211k79sNIOvvGka4
	 jXnjRhS96Pc/bz0ehzjbUt1woqCLDbjivY+FsbtMxyFWFeI1mkWu9Zt7PC9QnWkGb2
	 8G4AuoyROAL+kT0Qe5REjPfclAld4UKs7b2cAlSLP1Ddhgoy68u/mfkSbPmHB874hD
	 qY9E8sJHz1gTripI5Uiaz22uJ8f/spAdy3UphXG/l8bvUu7n+uuwIrGKS/gUz/cJYd
	 evGCzMUhUXLjw==
Date: Tue, 12 Sep 2023 10:46:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Henry.Wang@arm.com
Subject: Re: [PATCH v2] xen/arm: Skip Xen specific nodes/properties from
 hwdom /chosen node
In-Reply-To: <20230912105341.16687-1-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2309121045570.2080229@ubuntu-linux-20-04-desktop>
References: <20230912105341.16687-1-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 12 Sep 2023, Michal Orzel wrote:
> Skip the following Xen specific host device tree nodes/properties
> from being included into hardware domain /chosen node:
>  - xen,static-heap: this property informs Xen about memory regions
>    reserved exclusively as static heap,
>  - xen,domain-shared-memory-v1: node with this compatible informs Xen
>    about static shared memory region for a domain. Xen exposes a different
>    node (under /reserved-memory with compatible "xen,shared-memory-v1") to
>    let domain know about the shared region,
>  - xen,evtchn-v1: node with this compatible informs Xen about static
>    event channel configuration for a domain. Xen does not expose
>    information about static event channels to domUs and dom0 case was
>    overlooked (by default nodes from host dt are copied to dom0 fdt unless
>    explicitly marked to be skipped), since the author's idea was not to
>    expose it (refer docs/misc/arm/device-tree/booting.txt, "Static Event
>    Channel"). Even if we wanted to expose the static event channel
>    information, the current node is in the wrong format (i.e. contains
>    phandle to domU node not visible by dom0). Lastly, this feature is
>    marked as tech-preview and there is no Linux dt binding in place.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Do we need Henry's explicit approval on bug fixes at this point?


> ---
> Changes in v2:
>  - update commit msg with better reasoning
> ---
>  xen/arch/arm/domain_build.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 29dcbb8a2ee6..413568c0e2fd 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1149,7 +1149,7 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
>           * * remember xen,dom0-bootargs if we don't already have
>           *   bootargs (from module #1, above).
>           * * remove bootargs,  xen,dom0-bootargs, xen,xen-bootargs,
> -         *   linux,initrd-start and linux,initrd-end.
> +         *   xen,static-heap, linux,initrd-start and linux,initrd-end.
>           * * remove stdout-path.
>           * * remove bootargs, linux,uefi-system-table,
>           *   linux,uefi-mmap-start, linux,uefi-mmap-size,
> @@ -1158,7 +1158,8 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
>           */
>          if ( dt_node_path_is_equal(node, "/chosen") )
>          {
> -            if ( dt_property_name_is_equal(prop, "xen,xen-bootargs") ||
> +            if ( dt_property_name_is_equal(prop, "xen,static-heap") ||
> +                 dt_property_name_is_equal(prop, "xen,xen-bootargs") ||
>                   dt_property_name_is_equal(prop, "linux,initrd-start") ||
>                   dt_property_name_is_equal(prop, "linux,initrd-end") ||
>                   dt_property_name_is_equal(prop, "stdout-path") ||
> @@ -2300,6 +2301,8 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
>      static const struct dt_device_match skip_matches[] __initconst =
>      {
>          DT_MATCH_COMPATIBLE("xen,domain"),
> +        DT_MATCH_COMPATIBLE("xen,domain-shared-memory-v1"),
> +        DT_MATCH_COMPATIBLE("xen,evtchn-v1"),
>          DT_MATCH_COMPATIBLE("xen,xen"),
>          DT_MATCH_COMPATIBLE("xen,multiboot-module"),
>          DT_MATCH_COMPATIBLE("multiboot,module"),
> -- 
> 2.25.1
> 

