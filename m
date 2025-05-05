Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A24AA9CC8
	for <lists+xen-devel@lfdr.de>; Mon,  5 May 2025 21:51:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976355.1363523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uC1qN-0000uo-3o; Mon, 05 May 2025 19:51:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976355.1363523; Mon, 05 May 2025 19:51:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uC1qN-0000sf-1F; Mon, 05 May 2025 19:51:15 +0000
Received: by outflank-mailman (input) for mailman id 976355;
 Mon, 05 May 2025 19:51:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9/1y=XV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uC1qL-0000sZ-FR
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 19:51:13 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4aac6a59-29ea-11f0-9ffb-bf95429c2676;
 Mon, 05 May 2025 21:51:11 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F18705C58F9;
 Mon,  5 May 2025 19:48:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73801C4CEE4;
 Mon,  5 May 2025 19:51:07 +0000 (UTC)
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
X-Inumbo-ID: 4aac6a59-29ea-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746474668;
	bh=L5JU1f17MQAAFxdWsVzAj7rxAFtDBmBQnvQJHA42sgE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tuZP3XN0CqozriUzBDrR2sIwJ4KnSLE/Fn5FOJx33QOdp84qlhb1tgWg+Fy0Fod81
	 5Jd6vmox1SSXi4RwNzEIQDrQ+nzNu1TjNUrQaJATcDD/TnNNTU3TgyjKAvN+SGvJK4
	 Zku/E22+Vu/5HcER8WXXXhWSzrs37yamK080uTy6TAG3+AbXniS0h17CwYseEG1yCH
	 k7S12gBIGOk3CAEoii0/xyCZWlrTvRZOef1lTbOPiUC9OMsMAVNvR9ZpRuhkXGNpQx
	 Zwpfpf9c4hnMq3G6jndglNw82rI+pIFw5clzyBLLfDlmN3q+tsRJDCme4ooB5qq2Ws
	 gKJz+l/459SGQ==
Date: Mon, 5 May 2025 12:51:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 3/8] asm-generic: move parts of Arm's asm/kernel.h to
 common code
In-Reply-To: <578b923f4103e312f3840619bb286d3dba39300b.1746468003.git.oleksii.kurochko@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2505051249560.3879245@ubuntu-linux-20-04-desktop>
References: <cover.1746468003.git.oleksii.kurochko@gmail.com> <578b923f4103e312f3840619bb286d3dba39300b.1746468003.git.oleksii.kurochko@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 5 May 2025, Oleksii Kurochko wrote:
> Move the following parts to common with the following changes:
> - struct kernel_info:
>   - Create arch_kernel_info for arch specific kernel information.
>     At the moment, it contains domain_type for Arm.
>   - s/phandle_gic/phandle_intc to have more generic name suitable for other
>     archs.
>   - Make text_offset of zimage structure available for RISCV_64.
> - Wrap by `#ifdef KERNEL_INFO_SHM_MEM_INIT` definition of KERNEL_SHM_MEM_INIT
>   and wrap by `#ifndef KERNEL_INFO_INIT` definition of KERNEL_INFO_INIT to have
>   ability to override KERNEL_INFO_SHM_MEM_INIT for arch in case it doesn't
>   want to use generic one.
> - Move DOM0LESS_* macros to dom0less-build.h.
> - Move all others parts of Arm's kernel.h to xen/fdt-kernel.h.
> 
> Because of the changes in struct kernel_info the correspondent parts of Arm's
> code are updated.
> 
> As part of this patch the following clean up happens:
> - Drop asm/setup.h from asm/kernel.h as nothing depends from it.
>   Add inclusion of asm/setup.h for a code which uses device_tree_get_reg() to
>   avoid compilation issues for CONFIG_STATIC_MEMORY and CONFIG_STATIC_SHM.
> - Drop inclusion of asm/kernel.h everywhere except xen/fdt-kernel.h.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>


Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

