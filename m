Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E07BBB06B16
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 03:25:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044782.1414831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubqsz-0002Ct-9i; Wed, 16 Jul 2025 01:24:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044782.1414831; Wed, 16 Jul 2025 01:24:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubqsz-00029r-4a; Wed, 16 Jul 2025 01:24:41 +0000
Received: by outflank-mailman (input) for mailman id 1044782;
 Wed, 16 Jul 2025 01:24:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/HAa=Z5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ubqsy-00029l-62
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 01:24:40 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e216386-61e3-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 03:24:29 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1E5E4A57317;
 Wed, 16 Jul 2025 01:24:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 174EBC4CEE3;
 Wed, 16 Jul 2025 01:24:24 +0000 (UTC)
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
X-Inumbo-ID: 9e216386-61e3-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752629067;
	bh=9vP1JkMWCVQBkBPHrRFQ9VtRD3xb5XynRNko+SZVWq0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qXeEiFdxjplW8Pr29NJV4URbHQ04t6oiyS8pDZHuDT9SOBU2+HbWQc/w+Bibu1oKl
	 q8vmesnJSNDXeZYBciaCoDRoc99P3waL3mFsfv1k22vPkIyBPZhzi77YxcC+SFXpf3
	 oa48vMaohDUZ1zSxml6wXPOsjRS9JXClfoWLE1MXSYy+DW5o8ioI9qc/741vPs5Wgr
	 bwlIDlDaTPMUnEBSHMDarruMt5acWTxLVSkC45n94Bgq98x0ub2mSYXuanGZ4mE37d
	 05V7gKMqDKpgrJ161v7AihUhtqRZbpsgxATFNbGq4KemiDRioVUfp+rDIpH1DT9ZC1
	 I1lPhWSFLu2Ng==
Date: Tue, 15 Jul 2025 18:24:23 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@amd.com>
cc: xen-devel@lists.xenproject.org, xen-devel@dornerworks.com, 
    ray.huang@amd.com, "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Nathan Studer <nathan.studer@dornerworks.com>, 
    Stewart Hildebrand <stewart@stew.dk>, Dario Faggioli <dfaggioli@suse.com>, 
    Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Alistair Francis <alistair.francis@wdc.com>, 
    Bob Eshleman <bobbyeshleman@gmail.com>, 
    Connor Davis <connojdavis@gmail.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v8 0/7] xen: introduce CONFIG_SYSCTL
In-Reply-To: <20250711043158.2566880-1-Penny.Zheng@amd.com>
Message-ID: <alpine.DEB.2.22.394.2507151823170.15546@ubuntu-linux-20-04-desktop>
References: <20250711043158.2566880-1-Penny.Zheng@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Heads up, I intend to commit this series shortly as it has been
thoroughly reviewed by multiple people and has been on the list for a
long time now.


On Fri, 11 Jul 2025, Penny Zheng wrote:
> It can be beneficial for some dom0less systems to further reduce Xen footprint
> via disabling some hypercalls handling code, which may not to be used &
> required in such systems. Each hypercall has a separate option to keep
> configuration flexible.
> 
> Options to disable hypercalls:
> - sysctl
> - domctl
> - hvm
> - physdev
> - platform
> 
> This patch serie is only focusing on introducing CONFIG_SYSCTL. Different
> options will be covered in different patch serie.
> 
> Features, like LIVEPATCH, Overlay DTB, which fully rely on sysctl op, will
> be wrapped with CONFIG_SYSCTL, to reduce Xen footprint as much as possible.
> 
> It is derived from Stefano Stabellini's commit "xen: introduce kconfig options to
> disable hypercalls"(
> https://lore.kernel.org/xen-devel/20241219092917.3006174-1-Sergiy_Kibrik@epam.com)
> 
> ---
> Commit "xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"" and commit "
> xen/sysctl: wrap around sysctl hypercall" shall be commited together.
> ---
> Penny Zheng (6):
>   xen/xsm: wrap around xsm_sysctl with CONFIG_SYSCTL
>   xen/sysctl: wrap around XEN_SYSCTL_readconsole
>   xen/sysctl: wrap around XEN_SYSCTL_page_offline_op
>   xen/sysctl: wrap around XEN_SYSCTL_scheduler_op
>   xen/sysctl: wrap around arch-specific arch_do_sysctl
>   xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"
> 
> Stefano Stabellini (1):
>   xen/sysctl: wrap around sysctl hypercall
> 
>  xen/arch/arm/Kconfig                  |  1 +
>  xen/arch/arm/Makefile                 |  2 +-
>  xen/arch/arm/sysctl.c                 |  2 --
>  xen/arch/riscv/stubs.c                |  2 +-
>  xen/arch/x86/Kconfig                  |  4 ----
>  xen/arch/x86/Makefile                 |  2 +-
>  xen/arch/x86/configs/pvshim_defconfig |  5 +----
>  xen/arch/x86/hvm/Kconfig              |  1 -
>  xen/arch/x86/psr.c                    | 18 ++++++++++++++++++
>  xen/arch/x86/sysctl.c                 |  2 --
>  xen/common/Kconfig                    |  6 +++++-
>  xen/common/Makefile                   |  2 +-
>  xen/common/page_alloc.c               |  2 ++
>  xen/common/sched/arinc653.c           |  6 ++++++
>  xen/common/sched/core.c               |  2 ++
>  xen/common/sched/credit.c             |  4 ++++
>  xen/common/sched/credit2.c            |  4 ++++
>  xen/common/sched/private.h            |  4 ++++
>  xen/drivers/char/console.c            |  2 ++
>  xen/drivers/video/Kconfig             |  2 +-
>  xen/include/hypercall-defs.c          |  8 ++++++--
>  xen/include/xsm/xsm.h                 | 18 ++++++++++++++++++
>  xen/xsm/dummy.c                       |  6 ++++++
>  xen/xsm/flask/hooks.c                 | 14 ++++++++++++++
>  24 files changed, 98 insertions(+), 21 deletions(-)
> 
> -- 
> 2.34.1
> 

