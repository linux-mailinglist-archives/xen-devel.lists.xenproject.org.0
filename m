Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC8A97D063
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2024 05:55:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800985.1211001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srUj2-0007on-LG; Fri, 20 Sep 2024 03:54:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800985.1211001; Fri, 20 Sep 2024 03:54:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srUj2-0007m4-IC; Fri, 20 Sep 2024 03:54:32 +0000
Received: by outflank-mailman (input) for mailman id 800985;
 Fri, 20 Sep 2024 03:54:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yEHU=QS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1srUj1-0007lS-Gf
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2024 03:54:31 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 086451d0-7704-11ef-99a2-01e77a169b0f;
 Fri, 20 Sep 2024 05:54:29 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 146255C5C68;
 Fri, 20 Sep 2024 03:54:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4FCDC4CEC3;
 Fri, 20 Sep 2024 03:54:25 +0000 (UTC)
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
X-Inumbo-ID: 086451d0-7704-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726804466;
	bh=GXqH4yFqsZ3h/NZzVW1IlCj8fxEMnmdgzK1jHq3qcbE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NFwgxKEHhZQ3C/mFSfMuQZnH5OH7IMVFQGK/Pe+gJVWCj7yltLEbFw0D/N1DJ7MuW
	 4l+jP+0Fi80kKv8ZQVwKJ6dckh6Rpep1gRORmM2ISvc7G7k9kdF4evW1xyKkOXGJ2m
	 iVPhighqfZgYABRW/TjfzYAb9dXTPD93ApNFD5uyLa0Oaq7BjYUn+knAv3nQeqkFvZ
	 bcdNTAWCDu3xSc/bbUC4WLE7EpnspNx2XaB2h8TFHWmOD6NHNba+Tm11dEmYRAGFWH
	 wRlKqSanLfsz/W3a3cudaASGFAAk8sJNZpq7/Q3fTW3HLFya7Sr9bpEJMqODV36YJa
	 b3PJiYDwfag6g==
Date: Thu, 19 Sep 2024 20:54:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH 2/4] device-tree: Remove __init from
 unflatten_dt_alloc()
In-Reply-To: <20240919104238.232704-3-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2409191459150.1417852@ubuntu-linux-20-04-desktop>
References: <20240919104238.232704-1-michal.orzel@amd.com> <20240919104238.232704-3-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 19 Sep 2024, Michal Orzel wrote:
> With CONFIG_OVERLAY_DTB=y, unflatten_dt_alloc() is used as part of
> unflatten_dt_node() used during runtime. In case of a binary compiled
> such as unflatten_dt_alloc() does not get inlined (e.g. using -Og),
> attempt to add an overlay to Xen (xl dt-overlay add) results in a crash.
> 
> (XEN) Instruction Abort Trap. Syndrome=0x7
> (XEN) Walking Hypervisor VA 0xa00002c8cc0 on CPU2 via TTBR 0x0000000040340000
> (XEN) 0TH[0x014] = 0x4033ff7f
> (XEN) 1ST[0x000] = 0x4033ef7f
> (XEN) 2ND[0x001] = 0x4000004033af7f
> (XEN) 3RD[0x0c8] = 0x0
> (XEN) CPU2: Unexpected Trap: Instruction Abort
> (XEN) ----[ Xen-4.20-unstable  arm64  debug=y  Not tainted ]----
> ...
> (XEN) Xen call trace:
> (XEN)    [<00000a00002c8cc0>] 00000a00002c8cc0 (PC)
> (XEN)    [<00000a0000202410>] device-tree.c#unflatten_dt_node+0xd0/0x504 (LR)
> (XEN)    [<00000a0000204484>] unflatten_device_tree+0x54/0x1a0
> (XEN)    [<00000a000020800c>] dt-overlay.c#handle_add_overlay_nodes+0x290/0x3d4
> (XEN)    [<00000a0000208360>] dt_overlay_sysctl+0x8c/0x110
> (XEN)    [<00000a000027714c>] arch_do_sysctl+0x1c/0x2c
> 
> Fixes: 9e9d2c079dc4 ("xen/arm/device: Remove __init from function type")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/common/device-tree/device-tree.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/common/device-tree/device-tree.c b/xen/common/device-tree/device-tree.c
> index 8d1017a49d80..d0528c582565 100644
> --- a/xen/common/device-tree/device-tree.c
> +++ b/xen/common/device-tree/device-tree.c
> @@ -120,8 +120,8 @@ void dt_child_set_range(__be32 **cellp, int addrcells, int sizecells,
>      dt_set_cell(cellp, sizecells, size);
>  }
>  
> -static void __init *unflatten_dt_alloc(unsigned long *mem, unsigned long size,
> -                                       unsigned long align)
> +static void *unflatten_dt_alloc(unsigned long *mem, unsigned long size,
> +                                unsigned long align)
>  {
>      void *res;
>  
> -- 
> 2.37.6
> 

