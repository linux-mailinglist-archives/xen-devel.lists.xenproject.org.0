Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFD07FE6FA
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 03:37:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644358.1005217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8Wvx-0006MJ-0V; Thu, 30 Nov 2023 02:37:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644358.1005217; Thu, 30 Nov 2023 02:37:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8Wvw-0006Kf-U6; Thu, 30 Nov 2023 02:37:44 +0000
Received: by outflank-mailman (input) for mailman id 644358;
 Thu, 30 Nov 2023 02:37:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SKhV=HL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r8Wvv-0006KZ-O9
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 02:37:43 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f05ba05-8f29-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 03:37:41 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id CFBB2B84103;
 Thu, 30 Nov 2023 02:37:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93326C433C7;
 Thu, 30 Nov 2023 02:37:39 +0000 (UTC)
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
X-Inumbo-ID: 6f05ba05-8f29-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701311860;
	bh=xHRXLwRdzeSJRVhDtRRL8zRr1Jk9w4QkXcNkXwh8oa0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=c65Lfc+jaTG4vS/mru0700kRQL+Hvam65m0Yp3ane9tcxl0I5P040Jwri9nCzj7cv
	 GISXr1qyDcFR/JXp1KcIbWsQZ0Kx2KEtAk3nkMFJKGXpYNJstl7r+nL46PX30hLTmN
	 g8dJMnJMgv2rNmpTMlJOrZ/OcKTpxJ3ywOW095fpfMImTTvBimDxhws6jgDpAm29yk
	 lGP8P8vtqCi+n4CmTsgwX+Nxm4gDQz3vPsU/TqQpyLScyXm2/PuA9Z0uQ3FKh18GYS
	 xyzRYuNx0tSEueJG8YL8Pr+Wrsh60mXpWHIxMDnhqAFq9RHNA1EVzNhBESq2QwRdrT
	 K23hmxvxFaTig==
Date: Wed, 29 Nov 2023 18:37:37 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] automation: Switch u-boot boot command to bootz for
 arm32 tests
In-Reply-To: <20231124120907.2044651-1-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2311291837270.3533093@ubuntu-linux-20-04-desktop>
References: <20231124120907.2044651-1-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 24 Nov 2023, Michal Orzel wrote:
> Thanks to recent changes added to ImageBuilder to support the bootz
> command, which allows obtaining the effective image size (including NOLOAD
> sections) from the zImage header, switch the BOOT_CMD for arm32 tests to
> bootz. Among other scenarios, this change will enable us, in the future,
> to add tests with UBSAN enabled Xen, which would otherwise fail due to
> incorrect image placement resulting in overlapping.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Before adding UBSAN CI tests, we still need to decide if we want to add support
> to panic on UBSAN epilogue guarded by some config option or to just grep for
> UBSAN message.
> 
> CI pipeline:
> https://gitlab.com/xen-project/people/morzel/xen-orzelmichal/-/pipelines/1083821754
> ---
>  automation/scripts/qemu-smoke-dom0-arm32.sh     | 2 +-
>  automation/scripts/qemu-smoke-dom0less-arm32.sh | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/automation/scripts/qemu-smoke-dom0-arm32.sh b/automation/scripts/qemu-smoke-dom0-arm32.sh
> index a4b487b08055..d91648905669 100755
> --- a/automation/scripts/qemu-smoke-dom0-arm32.sh
> +++ b/automation/scripts/qemu-smoke-dom0-arm32.sh
> @@ -68,7 +68,7 @@ XEN_CMD="console=dtuart dom0_mem=1024M bootscrub=0 console_timestamps=boot"
>  NUM_DOMUS=0
>  
>  LOAD_CMD="tftpb"
> -BOOT_CMD="bootm"
> +BOOT_CMD="bootz"
>  UBOOT_SOURCE="boot.source"
>  UBOOT_SCRIPT="boot.scr"' > config
>  
> diff --git a/automation/scripts/qemu-smoke-dom0less-arm32.sh b/automation/scripts/qemu-smoke-dom0less-arm32.sh
> index 7e3cfbe9c4d0..e31b6b9014e1 100755
> --- a/automation/scripts/qemu-smoke-dom0less-arm32.sh
> +++ b/automation/scripts/qemu-smoke-dom0less-arm32.sh
> @@ -101,7 +101,7 @@ DOMU_MEM[0]="512"
>  NUM_DOMUS=1
>  
>  LOAD_CMD="tftpb"
> -BOOT_CMD="bootm"
> +BOOT_CMD="bootz"
>  UBOOT_SOURCE="boot.source"
>  UBOOT_SCRIPT="boot.scr"' > config
>  
> -- 
> 2.25.1
> 

