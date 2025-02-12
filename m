Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F143A331FD
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 23:06:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886809.1296410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiKrs-0002lU-Ih; Wed, 12 Feb 2025 22:06:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886809.1296410; Wed, 12 Feb 2025 22:06:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiKrs-0002kg-FO; Wed, 12 Feb 2025 22:06:04 +0000
Received: by outflank-mailman (input) for mailman id 886809;
 Wed, 12 Feb 2025 22:06:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xJ3x=VD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tiKrq-0002kP-PC
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 22:06:02 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8aaa2d5d-e98d-11ef-b3ef-695165c68f79;
 Wed, 12 Feb 2025 23:06:00 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9A01A5C5682;
 Wed, 12 Feb 2025 22:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6284C4CEDF;
 Wed, 12 Feb 2025 22:05:57 +0000 (UTC)
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
X-Inumbo-ID: 8aaa2d5d-e98d-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739397958;
	bh=jI38/5Y2BbkgGLCq/ddpE06x99akIRM5gWNwYfSXgrM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UwZsijwuK1XvMTi3PzeOw9/V0f1gjaKybCoahy9gRjE8nm64ahQ3gBFtss4MYleWR
	 c1duzE0R22V2RMh/R2qZ8Lu2rkWbAi7YLj4vVZ5/Y3eVYEXXfTKidiiWHuSgEUFndZ
	 bTM45zDx1HZ4leTQ2cUl/C1OQO4lmPbT8MN7mN2Bcyn+yFTxdhHalQpmY43edYOwUq
	 eYhsv3LrjGJUOUc6t+ln1lykGHoAPvXSjHGEGriPUXHSCLX6QeGlhTzaDZEqstc+PY
	 ljtlrWOKYeKUp45Yu+6cjX0DlRAeFjoEXOrdMZ5jicAkjnBluFNxWfdhPxrfvcodu7
	 pVE/BTmW4o+jQ==
Date: Wed, 12 Feb 2025 14:05:56 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Grygorii Strashko <gragst.linux@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: [PATCH] device-tree: optimize size of struct dt_device_node
In-Reply-To: <20250212154358.2540389-1-grygorii_strashko@epam.com>
Message-ID: <alpine.DEB.2.22.394.2502121405490.619090@ubuntu-linux-20-04-desktop>
References: <20250212154358.2540389-1-grygorii_strashko@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 12 Feb 2025, Grygorii Strashko wrote:
> From: Michal Orzel <michal.orzel@amd.com>
> 
> The current placement of fields in struct dt_device_node is not optimal and
> introduces holes due to fields alignment.
> 
> Checked with "'pahole xen-syms -C dt_device_node"
> 
> ARM64 size 144B, 16B holes:
> 	/* size: 144, cachelines: 3, members: 15 */
> 	/* sum members: 128, holes: 3, sum holes: 16 */
> 	/* last cacheline: 16 bytes */
> ARM32 size 72B, 4B holes
> 	/* size: 72, cachelines: 2, members: 15 */
> 	/* sum members: 68, holes: 2, sum holes: 4 */
> 	/* last cacheline: 8 bytes */
> 
> This patch optimizes size of struct dt_device_node by rearranging its
> field, which eliminates holes and reduces structure size by 16B(ARM64) and
> 4B(ARM32).
> 
> After ARM64 size 128B, no holes (-16B):
> 	/* size: 128, cachelines: 2, members: 15 */
> After ARM32 size 68B, no holes (-4B)
> 	/* size: 68, cachelines: 2, members: 15 */
> 	/* last cacheline: 4 bytes */
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> This patch follows discussion in [1]
> [1] https://patchwork.kernel.org/comment/26239672/
> 
>  xen/include/xen/device_tree.h | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index 5ff763bb80bb..0ff80fda04da 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -81,17 +81,10 @@ struct dt_property {
>  struct dt_device_node {
>      const char *name;
>      const char *type;
> -    dt_phandle phandle;
>      char *full_name;
> +    dt_phandle phandle;
>      domid_t used_by; /* By default it's used by dom0 */
>  
> -    struct dt_property *properties;
> -    struct dt_device_node *parent;
> -    struct dt_device_node *child;
> -    struct dt_device_node *sibling;
> -    struct dt_device_node *next; /* TODO: Remove it. Only use to know the last children */
> -    struct dt_device_node *allnext;
> -
>      /* IOMMU specific fields */
>      bool is_protected;
>  
> @@ -100,6 +93,13 @@ struct dt_device_node {
>      bool static_evtchn_created;
>  #endif
>  
> +    struct dt_property *properties;
> +    struct dt_device_node *parent;
> +    struct dt_device_node *child;
> +    struct dt_device_node *sibling;
> +    struct dt_device_node *next; /* TODO: Remove it. Only use to know the last children */
> +    struct dt_device_node *allnext;
> +
>      /*
>       * The main purpose of this list is to link the structure in the list
>       * of devices assigned to domain.
> -- 
> 2.34.1
> 

