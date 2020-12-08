Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5320D2D2809
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 10:47:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47274.83706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmZac-00008u-2D; Tue, 08 Dec 2020 09:47:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47274.83706; Tue, 08 Dec 2020 09:47:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmZab-00008V-Ts; Tue, 08 Dec 2020 09:47:21 +0000
Received: by outflank-mailman (input) for mailman id 47274;
 Tue, 08 Dec 2020 09:47:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kmZaa-00008Q-La
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 09:47:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kmZaZ-0002yo-Dg; Tue, 08 Dec 2020 09:47:19 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kmZaZ-0005Ap-4d; Tue, 08 Dec 2020 09:47:19 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=YvHQTI4XmTUDYGQGBG8XOps6X0Uw3L3zOWwSWzPritI=; b=Rj1Ar53ay1mmf0rNlQ0RAd7ElH
	POU2gpLZ2nYWdmsZPxCdxrZEgNDzxAv1w4+Zp4qsIIKQEEdghNTrIrSYhCzM3ErqNY3RjQ6WMQEwV
	08/tG+gv09PUM2OLkY6bhXkzY5dekR48J0UcnRSnzSajsEoJArRkRC1jvM3t5E4E6zpU=;
Subject: Re: [PATCH] xen/arm: Add workaround for Cortex-A53 erratum #845719
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com,
 wei.chen@arm.com
References: <20201208072327.11890-1-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d286241c-fd3b-8506-37e5-0ddcdaae97be@xen.org>
Date: Tue, 8 Dec 2020 09:47:16 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201208072327.11890-1-michal.orzel@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 08/12/2020 07:23, Michal Orzel wrote:
> When executing in aarch32 state at EL0, a load at EL0 from a
> virtual address that matches the bottom 32 bits of the virtual address
> used by a recent load at (aarch64) EL1 might return incorrect data.
> 
> The workaround is to insert a write of the contextidr_el1 register
> on exception return to an aarch32 guest.

I am a bit confused with this comment. In the previous paragraph, you 
are suggesting that the problem is an interaction between EL1 AArch64 
and EL0 AArch32. But here you seem to imply the issue only happen when 
running a AArch32 guest.

Can you clarify it?

> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> ---
>   docs/misc/arm/silicon-errata.txt |  1 +
>   xen/arch/arm/Kconfig             | 19 +++++++++++++++++++
>   xen/arch/arm/arm64/entry.S       |  9 +++++++++
>   xen/arch/arm/cpuerrata.c         |  8 ++++++++
>   xen/include/asm-arm/cpufeature.h |  3 ++-
>   5 files changed, 39 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/misc/arm/silicon-errata.txt b/docs/misc/arm/silicon-errata.txt
> index 27bf957ebf..fa3d9af63d 100644
> --- a/docs/misc/arm/silicon-errata.txt
> +++ b/docs/misc/arm/silicon-errata.txt
> @@ -45,6 +45,7 @@ stable hypervisors.
>   | ARM            | Cortex-A53      | #827319         | ARM64_ERRATUM_827319    |
>   | ARM            | Cortex-A53      | #824069         | ARM64_ERRATUM_824069    |
>   | ARM            | Cortex-A53      | #819472         | ARM64_ERRATUM_819472    |
> +| ARM            | Cortex-A53      | #845719         | ARM64_ERRATUM_845719    |
>   | ARM            | Cortex-A55      | #1530923        | N/A                     |
>   | ARM            | Cortex-A57      | #852523         | N/A                     |
>   | ARM            | Cortex-A57      | #832075         | ARM64_ERRATUM_832075    |
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index f5b1bcda03..6bea393555 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -244,6 +244,25 @@ config ARM_ERRATUM_858921
>   
>   	  If unsure, say Y.
>   
> +config ARM64_ERRATUM_845719
> +	bool "Cortex-A53: 845719: A load might read incorrect data"
> +	default y
> +	help
> +	  This option adds an alternative code sequence to work around ARM
> +	  erratum 845719 on Cortex-A53 parts up to r0p4.
> +
> +	  When executing in aarch32 state at EL0, a load at EL0 from a
> +	  virtual address that matches the bottom 32 bits of the virtual address
> +	  used by a recent load at (aarch64) EL1 might return incorrect data.
> +
> +	  The workaround is to insert a write of the contextidr_el1 register
> +	  on exception return to an aarch32 guest.
> +	  Please note that this does not necessarily enable the workaround,
> +	  as it depends on the alternative framework, which will only patch
> +	  the kernel if an affected CPU is detected.
> +
> +	  If unsure, say Y.
> +
>   config ARM64_WORKAROUND_REPEAT_TLBI
>   	bool
>   
> diff --git a/xen/arch/arm/arm64/entry.S b/xen/arch/arm/arm64/entry.S
> index 175ea2981e..ef3336f34a 100644
> --- a/xen/arch/arm/arm64/entry.S
> +++ b/xen/arch/arm/arm64/entry.S
> @@ -96,6 +96,15 @@
>           msr     SPSR_fiq, x22
>           msr     SPSR_irq, x23
>   
> +#ifdef CONFIG_ARM64_ERRATUM_845719
> +alternative_if ARM64_WORKAROUND_845719
> +        /* contextidr_el1 is not accessible from aarch32 guest so we can
> +         * write xzr to it
> +         */

This path is also used when the trapping occurs when running in EL0 
aarch32. So wouldn't you clobber it if the EL1 AArch64 use it (Linux may 
store the PID in it)?

Also the coding style for multi-line comment in Xen is:

/*
  * Foo
  * Bar
  */

> +        msr     contextidr_el1, xzr
> +alternative_else_nop_endif
> +#endif

Cheers,

-- 
Julien Grall

