Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B80915B2D
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 02:51:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747061.1154354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLuPO-00037Z-AJ; Tue, 25 Jun 2024 00:51:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747061.1154354; Tue, 25 Jun 2024 00:51:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLuPO-000365-79; Tue, 25 Jun 2024 00:51:42 +0000
Received: by outflank-mailman (input) for mailman id 747061;
 Tue, 25 Jun 2024 00:51:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cmkP=N3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sLuPN-00035t-6F
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 00:51:41 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14426f62-328d-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 02:51:39 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C6A2460F80;
 Tue, 25 Jun 2024 00:51:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B22A9C32789;
 Tue, 25 Jun 2024 00:51:36 +0000 (UTC)
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
X-Inumbo-ID: 14426f62-328d-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719276697;
	bh=ArrrdTb++un2m2ZRivmuzKKNl1Est0Hjhb/CIa5vSKM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kpKRD+jKmeIyYb4TyWP0JF9d2/QnpB5cv1iZEJ0hh3SUac1vP/QmOVlveozKoazap
	 /3cl3BZGjR3xMaP7P6PexSWyGkfefHu2d53Lr1IUk1I1Vm3nCeLCfZBsB5cNwnPDpz
	 q6UEpL76g8we1PaKPOnD6Fg6HVCJwR7z9S9TKDC1J4VTQLNkqr5ZfS3QR/gwhAU+dK
	 y+GofDDnlOdQwYDWCfSm9qyV9kP/aX+01xRsEFCEkipj3lmz8NOkqz9OFGFruUrx2z
	 cgk5SkH0uaCBmnKmaab32Lt0kgloomuMVRiDIptrtYvk+LQsRJ1qmygPu52be7zUOs
	 nyM3pMcttB8dA==
Date: Mon, 24 Jun 2024 17:51:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH v2 03/13] x86/domctl: address a violation of MISRA
 C Rule 16.3
In-Reply-To: <d46b484c99f858d7bfd10c6956a88ba46ac60815.1719218291.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2406241751290.3870429@ubuntu-linux-20-04-desktop>
References: <cover.1719218291.git.federico.serafini@bugseng.com> <d46b484c99f858d7bfd10c6956a88ba46ac60815.1719218291.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Jun 2024, Federico Serafini wrote:
> Add missing break statement to address a violation of
> MISRA C Rule 16.3: "An unconditional `break' statement shall terminate
> every switch-clause".
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/x86/domctl.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
> index 9190e11faa..68b5b46d1a 100644
> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -517,6 +517,7 @@ long arch_do_domctl(
>  
>          default:
>              ret = -ENOSYS;
> +            break;
>          }
>          break;
>      }
> -- 
> 2.34.1
> 
> 

