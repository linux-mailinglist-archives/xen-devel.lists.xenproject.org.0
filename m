Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F64797456D
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 00:12:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796090.1205603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so968-0006ya-Cg; Tue, 10 Sep 2024 22:12:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796090.1205603; Tue, 10 Sep 2024 22:12:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so968-0006wS-9c; Tue, 10 Sep 2024 22:12:32 +0000
Received: by outflank-mailman (input) for mailman id 796090;
 Tue, 10 Sep 2024 22:12:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1so966-0006wM-Qa
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 22:12:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1so966-0002EC-1c; Tue, 10 Sep 2024 22:12:30 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1so965-0007aQ-Rr; Tue, 10 Sep 2024 22:12:29 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=d/t7LjuDW2xqJnIPs+6zQ8xrwmBzC2Z2PhbpByA0wrE=; b=mFALG/AQA8LmvWHMrq9NnKEzuI
	M45U3U05xZaNIAs0JIkoJA2h8DgRYLr8F1LQaT/Ze50vn+i6QzUsPZ3iSvgRm5baqv3R5h4FxsPzZ
	AXx8ngS6PF7Vnn0/cCMUx0p7ht/vhn1Jq+UMrkoqBj+vlqazOgYvSg79i+VCxYYUA4KY=;
Message-ID: <6c8ba682-b46d-4118-8f0a-480b83ffd97c@xen.org>
Date: Tue, 10 Sep 2024 23:12:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/5] xen/arm: Enable early printk for S32CC via
 LINFlexD UART
Content-Language: en-GB
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>,
 xen-devel@lists.xenproject.org
Cc: S32@nxp.com, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240910143411.178704-1-andrei.cherechesu@oss.nxp.com>
 <20240910143411.178704-5-andrei.cherechesu@oss.nxp.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240910143411.178704-5-andrei.cherechesu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/09/2024 15:34, Andrei Cherechesu (OSS) wrote:
> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> 
> Enabled the support for debug through early printk on S32CC

NIT: We tend to avoid using past tense when describing the change. So 
s/Enabled/Enable/. However...

> platforms via the NXP LINFlexD UART driver.
> 
> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> ---
>   xen/arch/arm/Kconfig.debug | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/xen/arch/arm/Kconfig.debug b/xen/arch/arm/Kconfig.debug
> index a309f67f90..9725f4193c 100644
> --- a/xen/arch/arm/Kconfig.debug
> +++ b/xen/arch/arm/Kconfig.debug
> @@ -168,6 +168,9 @@ choice
>   	config EARLY_PRINTK_RCAR3
>   		bool "Early printk with SCIF2 on Renesas R-Car Gen3 processors"
>   		select EARLY_UART_SCIF
> +	config EARLY_PRINTK_S32CC
> +		bool "Early printk with NXP LINFlexD UART on NXP S32CC processors"
> +		select EARLY_UART_LINFLEX

... we stopped adding platform specific early printk a while ago because 
this is not scalable.

Instead, we prefer to write a page in [1] which will provide all the 
information how to setup and debug Xen on a SoC (could be one per family).

Cheers,

[1] https://wiki.xenproject.org/wiki/Xen_ARM_with_Virtualization_Extensions

-- 
Julien Grall


