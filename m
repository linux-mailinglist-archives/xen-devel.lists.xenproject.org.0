Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A03060C0BA
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 03:15:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429449.680426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1on8Vr-0006ep-Qy; Tue, 25 Oct 2022 01:13:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429449.680426; Tue, 25 Oct 2022 01:13:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1on8Vr-0006bw-Mn; Tue, 25 Oct 2022 01:13:51 +0000
Received: by outflank-mailman (input) for mailman id 429449;
 Tue, 25 Oct 2022 01:13:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qfDD=22=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1on8Vq-0006ba-5B
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 01:13:50 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 473bf088-5402-11ed-8fd0-01056ac49cbb;
 Tue, 25 Oct 2022 03:13:48 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8112F616FA;
 Tue, 25 Oct 2022 01:13:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89548C433B5;
 Tue, 25 Oct 2022 01:13:46 +0000 (UTC)
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
X-Inumbo-ID: 473bf088-5402-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666660427;
	bh=/7ZDKTBmVbDxYRoypverc9XDjamz3U72xPqoy1OKOiM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WsxovWJxXiodDhe0fHQlNbLR2VNA9l0EjnEIy9NgnNATZq48d4I6RlMQq8A+4PwBd
	 ijRsx/bX/qI60H5TLwfsr3lCHsJvvbrE5wZQQHiGrgQrv9Nb3RfJDOYQ135r+OejRO
	 XWt5pyKaiayLAtxa7GzpvN2kgOaYi36yYr9WRwXeCj7o+x7ydNL1Jhf7k7OSdohLAw
	 WEVBm3Ov4U95lzpt/4dOBXotDbzDybYa+uZTgIysNrrJ6kvxt/w+sNQbAKsXCRqih5
	 Foonq4VUQdKOfekTIr6inw+0Yh32J7PLhM/2qtjbFkfO+DaFxvUpN+4yAtUhrfzmzZ
	 JqbzoVEQG8d+A==
Date: Mon, 24 Oct 2022 18:13:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Andrew.Cooper3@citrix.com, 
    Henry.Wang@arm.com
Subject: Re: [for-4.17, PATCH v2] automation: Explicitly enable NULL scheduler
 for boot-cpupools test
In-Reply-To: <20221024120443.16202-1-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2210241810200.1151068@ubuntu-linux-20-04-desktop>
References: <20221024120443.16202-1-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Oct 2022, Michal Orzel wrote:
> NULL scheduler is not enabled by default on non-debug Xen builds. This
> causes the boot time cpupools test to fail on such build jobs. Fix the issue
> by explicitly specifying the config options required to enable the NULL
> scheduler.
> 
> Fixes: 36e3f4158778 ("automation: Add a new job for testing boot time cpupools on arm64")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

I would like a release-ack by Henry on this

> ---
> Changes in v2:
> - was: automation: Do not use null scheduler for boot cpupools test
> - modify the commit msg/title
> - explicitly enable NULL scheduler by specifying all the required options
> 
> This patch acts as a prerequisite before merging the following patch:
> https://lore.kernel.org/xen-devel/20221021132238.16056-1-michal.orzel@amd.com/
> (to which Henry already gave RAB), that helped to find the issue described
> in the comment.
> 
> Tests shall explicitly specify the required Kconfig options for non-default
> pieces of logic, thus this patch is unrelated to the discussions whether
> enabling/disabling the NULL scheduler should be controlled by DEBUG or not.
> ---
>  automation/gitlab-ci/build.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index ddc2234faf39..716ee0b1e460 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -582,6 +582,9 @@ alpine-3.12-gcc-arm64-boot-cpupools:
>    variables:
>      CONTAINER: alpine:3.12-arm64v8
>      EXTRA_XEN_CONFIG: |
> +      CONFIG_EXPERT=y
> +      CONFIG_UNSUPPORTED=y
> +      CONFIG_SCHED_NULL=y
>        CONFIG_BOOT_TIME_CPUPOOLS=y
>  
>  ## Test artifacts common
> -- 
> 2.25.1
> 

