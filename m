Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E760737676
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 23:13:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552353.862390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBifG-00044u-8D; Tue, 20 Jun 2023 21:13:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552353.862390; Tue, 20 Jun 2023 21:13:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBifG-00042B-5K; Tue, 20 Jun 2023 21:13:26 +0000
Received: by outflank-mailman (input) for mailman id 552353;
 Tue, 20 Jun 2023 21:13:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yJOa=CI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qBifE-000422-CS
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 21:13:24 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 485bc785-0faf-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 23:13:21 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 024D3611C1;
 Tue, 20 Jun 2023 21:13:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76521C433C8;
 Tue, 20 Jun 2023 21:13:17 +0000 (UTC)
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
X-Inumbo-ID: 485bc785-0faf-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687295599;
	bh=ww6/GOgeTVK34sxaFIKmuaW+SVhDjESunh+kJMr21wU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FBat+Mnux00K4VvHB0wfJkbXIzOH6XLZko3C6eZQa4bWan1XtvdhdM1BE2FedsA8S
	 fln0UrwVXF4S//oG4RjnzhtYVd6F5TDFIB6cWRhpqITL0DT9mctY5cfgpjMzabldgH
	 eiLmZXpbPDUEkbGmnNPMqLVfYF66K/BP2OWTC3T6+VCQiednSZ3rOy3qRlHwhSwlun
	 T2kF8FbgrpuVN78FEJbOqcBeZ2TBi21wYKUv/qYqYhKxHJZH2T2q2OEQ4pTbH2vd4a
	 GBmRNSj9uUius00cc9AmUv+OFQvFP4mvZkkhx446BT1tYorPCxyeHqnqbFS7qs4EcE
	 Ui4VTm4Yf5GEw==
Date: Tue, 20 Jun 2023 14:13:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Gianluca Luparini <gianluca.luparini@bugseng.com>, 
    Tamas K Lengyel <tamas@tklengyel.com>, 
    Alexandru Isaila <aisaila@bitdefender.com>, 
    Petre Pircalabu <ppircalabu@bitdefender.com>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>, 
    Ayan Kumar <ayan.kumar.halder@amd.com>
Subject: Re: [XEN PATCH 10/13] xen/x86: fixed violations of MISRA C:2012 Rule
 7.2
In-Reply-To: <c22614e2febfe9078fcefeff4aae897fbaf92e39.1687250177.git.gianluca.luparini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2306201412260.897208@ubuntu-linux-20-04-desktop>
References: <cover.1687250177.git.gianluca.luparini@bugseng.com> <c22614e2febfe9078fcefeff4aae897fbaf92e39.1687250177.git.gianluca.luparini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 20 Jun 2023, Simone Ballarin wrote:
> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> 
> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose headline states:
> "A "u" or "U" suffix shall be applied to all integer constants that are represented in an unsigned type".
> 
> I propose to use "U" as a suffix to explicitly state when an integer constant is represented in an unsigned type.
> For homogeneity, I also added the "U" suffix in some cases that the tool didn't report as violations.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

Commit message aside:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

You might want also to change the commit title to:

  xen/x86/monitor: fixed violations of MISRA C:2012 Rule 7.2

to make it unique


> ---
>  xen/arch/x86/monitor.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/x86/monitor.c b/xen/arch/x86/monitor.c
> index d4857faf8a..dc336c239a 100644
> --- a/xen/arch/x86/monitor.c
> +++ b/xen/arch/x86/monitor.c
> @@ -48,17 +48,17 @@ static unsigned long *monitor_bitmap_for_msr(const struct domain *d, u32 *msr)
>  
>      switch ( *msr )
>      {
> -    case 0 ... 0x1fff:
> +    case 0 ... 0x1fffU:
>          BUILD_BUG_ON(sizeof(d->arch.monitor.msr_bitmap->low) * 8 <= 0x1fff);
>          return d->arch.monitor.msr_bitmap->low;
>  
> -    case 0x40000000 ... 0x40001fff:
> +    case 0x40000000U ... 0x40001fffU:
>          BUILD_BUG_ON(
>              sizeof(d->arch.monitor.msr_bitmap->hypervisor) * 8 <= 0x1fff);
>          *msr &= 0x1fff;
>          return d->arch.monitor.msr_bitmap->hypervisor;
>  
> -    case 0xc0000000 ... 0xc0001fff:
> +    case 0xc0000000U ... 0xc0001fffU:
>          BUILD_BUG_ON(sizeof(d->arch.monitor.msr_bitmap->high) * 8 <= 0x1fff);
>          *msr &= 0x1fff;
>          return d->arch.monitor.msr_bitmap->high;
> -- 
> 2.41.0
> 

