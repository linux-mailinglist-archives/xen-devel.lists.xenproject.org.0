Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1626E416A6F
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 05:32:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194813.347130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTbw5-0001fY-FO; Fri, 24 Sep 2021 03:31:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194813.347130; Fri, 24 Sep 2021 03:31:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTbw5-0001d6-Bi; Fri, 24 Sep 2021 03:31:41 +0000
Received: by outflank-mailman (input) for mailman id 194813;
 Fri, 24 Sep 2021 03:31:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UhVx=OO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTbw3-0001d0-QS
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 03:31:39 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b45617d-3942-436f-b594-d91a3dd76e3f;
 Fri, 24 Sep 2021 03:31:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 09A6860F6F;
 Fri, 24 Sep 2021 03:31:37 +0000 (UTC)
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
X-Inumbo-ID: 3b45617d-3942-436f-b594-d91a3dd76e3f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632454298;
	bh=dAdDLoaWbNDuoSkjnKGL+RhFO5NZr9gkXUVwjNilcLQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jRuaJu6boPmN8vOfdd/KG3oFejou9jOCQAAowC3ovFGSMEtnk6FGSvBjohmGmW1HY
	 Vs8nbrLsarK4YHZZS8AJS3yhhUNlrgwhIdCpvRPLmBUKznk4m8THgjDkWtHvoa0Afp
	 E73GeFm36ei1so5W4LJa82ct/UG+R7gC3SfqKPuIbYlviu7/vAURmuezWKwFYxjVTY
	 dV16s7lsWH5LdV2y5urxJuLyomIQvyEHdpq/cbqCg4FHwoiLvak7XavcrBlNLjswJ8
	 u6UMvZciBnn223a/RApyvFVwQOtT5N9ubiuI313aJqfHP/8/KS6t3g5SkuKI/J3q5W
	 43yFNaeRAeIyA==
Date: Thu, 23 Sep 2021 20:31:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <wei.chen@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    Bertrand.Marquis@arm.com
Subject: Re: [PATCH 36/37] xen/arm: Provide Kconfig options for Arm to enable
 NUMA
In-Reply-To: <20210923120236.3692135-37-wei.chen@arm.com>
Message-ID: <alpine.DEB.2.21.2109232029450.17979@sstabellini-ThinkPad-T480s>
References: <20210923120236.3692135-1-wei.chen@arm.com> <20210923120236.3692135-37-wei.chen@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Sep 2021, Wei Chen wrote:
> Arm platforms support both ACPI and device tree. We don't
> want users to select device tree NUMA or ACPI NUMA manually.
> We hope usrs can just enable NUMA for Arm, and device tree
          ^ users

> NUMA and ACPI NUMA can be selected depends on device tree
> feature and ACPI feature status automatically. In this case,
> these two kinds of NUMA support code can be co-exist in one
> Xen binary. Xen can check feature flags to decide using
> device tree or ACPI as NUMA based firmware.
> 
> So in this patch, we introduce a generic option:
> CONFIG_ARM_NUMA for user to enable NUMA for Arm.
                      ^ users

> And one CONFIG_DEVICE_TREE_NUMA option for ARM_NUMA
> to select when HAS_DEVICE_TREE option is enabled.
> Once when ACPI NUMA for Arm is supported, ACPI_NUMA
> can be selected here too.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>  xen/arch/arm/Kconfig | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 865ad83a89..ded94ebd37 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -34,6 +34,17 @@ config ACPI
>  	  Advanced Configuration and Power Interface (ACPI) support for Xen is
>  	  an alternative to device tree on ARM64.
>  
> + config DEVICE_TREE_NUMA
> +	def_bool n
> +	select NUMA
> +
> +config ARM_NUMA
> +	bool "Arm NUMA (Non-Uniform Memory Access) Support (UNSUPPORTED)" if UNSUPPORTED
> +	select DEVICE_TREE_NUMA if HAS_DEVICE_TREE

Should it be: depends on HAS_DEVICE_TREE ?
(And eventually depends on HAS_DEVICE_TREE || ACPI)


> +	---help---
> +
> +	  Enable Non-Uniform Memory Access (NUMA) for Arm architecutres
                                                      ^ architectures


> +
>  config GICV3
>  	bool "GICv3 driver"
>  	depends on ARM_64 && !NEW_VGIC
> -- 
> 2.25.1
> 

