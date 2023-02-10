Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB4B6925F2
	for <lists+xen-devel@lfdr.de>; Fri, 10 Feb 2023 20:01:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493611.763618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQYeA-0000qo-Tx; Fri, 10 Feb 2023 19:01:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493611.763618; Fri, 10 Feb 2023 19:01:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQYeA-0000nl-R6; Fri, 10 Feb 2023 19:01:22 +0000
Received: by outflank-mailman (input) for mailman id 493611;
 Fri, 10 Feb 2023 19:01:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pQYe9-0000nb-Et
 for xen-devel@lists.xenproject.org; Fri, 10 Feb 2023 19:01:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQYe9-00077z-5h; Fri, 10 Feb 2023 19:01:21 +0000
Received: from [54.239.6.186] (helo=[192.168.26.31])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQYe8-0000bH-Ub; Fri, 10 Feb 2023 19:01:21 +0000
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
	bh=IvZqNFzBG13Al56zK+lxg3Yn6QmzOEO8qs5LmuOecs8=; b=v+zYR8mUBOC7I3Saz0qFjlru6d
	JcnJh4O9xAh5KjYhQoh41zMwjjpJ5IQUID3W5BnPr0cvIxXL5wSzIXvBMu3nHflLojlkim1y7frxY
	V/YiSO+7uVgglEQYYm8so7RVAr4VXbk/103snP7O/yWWcvTQbK0SfVdCmeAfhzPccZcE=;
Message-ID: <a0f52d48-a89a-1299-d57a-cd47c7692806@xen.org>
Date: Fri, 10 Feb 2023 19:01:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.1
Subject: Re: [XEN][RFC PATCH v4 02/16] xen/arm: Add CONFIG_OVERLAY_DTB
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221207061537.7266-1-vikram.garhwal@amd.com>
 <20221207061537.7266-3-vikram.garhwal@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221207061537.7266-3-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 07/12/2022 06:15, Vikram Garhwal wrote:
> Introduce a config option where the user can enable support for adding/removing
> device tree nodes using a device tree binary overlay.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> ---
>   xen/arch/arm/Kconfig | 5 +++++

You also want to update SUPPORT.md.

>   1 file changed, 5 insertions(+)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 1fe5faf847..ae2ebf1697 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -52,6 +52,11 @@ config HAS_ITS
>           bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORTED
>           depends on GICV3 && !NEW_VGIC
>   
> +config OVERLAY_DTB
> +    bool "DTB overlay support (UNSUPPORTED)" if UNSUPPORTED
> +    help
> +    Dynamic addition/removal of Xen device tree nodes using a dtbo.
> +
>   config HVM
>           def_bool y
>   

Cheers,

-- 
Julien Grall

