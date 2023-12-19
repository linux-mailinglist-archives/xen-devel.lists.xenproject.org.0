Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDC2817F4D
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 02:35:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656443.1024595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFP13-0004fJ-Ug; Tue, 19 Dec 2023 01:35:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656443.1024595; Tue, 19 Dec 2023 01:35:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFP13-0004ck-S7; Tue, 19 Dec 2023 01:35:25 +0000
Received: by outflank-mailman (input) for mailman id 656443;
 Tue, 19 Dec 2023 01:35:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ry3N=H6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rFP12-0004ce-U2
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 01:35:24 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df849f7d-9e0e-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 02:35:22 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 903F7CE14EB;
 Tue, 19 Dec 2023 01:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCA6EC433C7;
 Tue, 19 Dec 2023 01:35:18 +0000 (UTC)
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
X-Inumbo-ID: df849f7d-9e0e-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702949719;
	bh=VFBZ6bkMAzfRpwKxx4rCVgmj/POtlqViYGmRS8wGqrU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QIOaaWTS22wya+KuQFl3C/yKIk8XGlrgAFzGrUdCf5rdA6aUPuvzk+/+Z78mHnGE/
	 WmAbg0foVzSLgqrV7MJNb3s3BLz+WWoWrdP0ztTrbHCjdhEKWEtA04tFz6LK8zI8pL
	 XkydeM+xaJc170z1BbasT5a8RMjBIFVfTSUQ8usK0ejR1IYa5yTntDMWJdhnifvoqj
	 PWNGpl3eEd9HtJ4QmJG4gdYqlMyXQIUCaSc408rWaX0Giv0ftGI7BP5zroy/w7cUEW
	 SFPuBig2Pq2xlqNNZis/XNUJTSDVn8qBZFLEqh2m1nJLxMFc9gKoXUym1cNBVRqXSI
	 xkNe+E0SLqtdg==
Date: Mon, 18 Dec 2023 17:35:17 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v2 3/7] xen/arm: address MISRA C:2012 Rule 2.1
In-Reply-To: <06857c133d1db8ab3a2eec5e0363be4358a0ec81.1702891792.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312181734390.3175268@ubuntu-linux-20-04-desktop>
References: <cover.1702891792.git.nicola.vetrini@bugseng.com> <06857c133d1db8ab3a2eec5e0363be4358a0ec81.1702891792.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 18 Dec 2023, Nicola Vetrini wrote:

> There are no paths that can reach the last return statement
> of function 'vgic_v3_its_mmio_write' in 'vcig-v3-its.c' and
> 'arch_memory_op' in 'arch/arm/mm.c', thus violating
> MISRA C:2012 Rule 2.1:
> "A project shall not contain unreachable code".
> 
> Therefore, an ASSERT_UNREACHABLE() is inserted to remove the unreachable
> return statement and protect against possible mistakes.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
> - Changed resolution strategy to have an ASSERT_UNREACHABLE() before
>   the return.
> ---
>  xen/arch/arm/mm.c          | 1 +
>  xen/arch/arm/vgic-v3-its.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index eeb65ca6bb79..b15a18a49412 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -283,6 +283,7 @@ long arch_memory_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg)
>          return -ENOSYS;
>      }
>  
> +    ASSERT_UNREACHABLE();
>      return 0;
>  }
>  
> diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
> index 05429030b539..70b5aeb82219 100644
> --- a/xen/arch/arm/vgic-v3-its.c
> +++ b/xen/arch/arm/vgic-v3-its.c
> @@ -1409,6 +1409,7 @@ static int vgic_v3_its_mmio_write(struct vcpu *v, mmio_info_t *info,
>          return 0;
>      }
>  
> +    ASSERT_UNREACHABLE();
>      return 1;
>  
>  write_ignore_64:
> -- 
> 2.34.1
> 

