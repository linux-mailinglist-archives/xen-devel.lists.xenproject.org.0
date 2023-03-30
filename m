Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2A66D10D2
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 23:25:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516889.801737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phzlY-0002dS-NS; Thu, 30 Mar 2023 21:25:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516889.801737; Thu, 30 Mar 2023 21:25:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phzlY-0002ag-J9; Thu, 30 Mar 2023 21:25:04 +0000
Received: by outflank-mailman (input) for mailman id 516889;
 Thu, 30 Mar 2023 21:25:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1phzlW-0002aa-Hd
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 21:25:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1phzlW-00031X-27; Thu, 30 Mar 2023 21:25:02 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1phzlV-0003kn-RF; Thu, 30 Mar 2023 21:25:01 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=YMWUwnPCc58PE1cVOBe/vi2qQd9a6lRSf0uMMWMUfP8=; b=n4srpHZw0S3gFB1VoG02+ndqgI
	AGginpsEIuaL56KHRIvfr+30AcwGktp+mQGFQXHInr9hVMP40Gy8ZAWy0we/tJDpo21+0TXDjz0bC
	wr5W9/Ql70ZH8EIQ2Zu/ak9JRnCAU3kcH/fhbWOiNohX+hSPDPfRLPmKkWk9C0F4A+oE=;
Message-ID: <91baebab-ef49-6aee-43bb-c7bf1f41cfb5@xen.org>
Date: Thu, 30 Mar 2023 22:24:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230321140357.24094-1-ayan.kumar.halder@amd.com>
 <20230321140357.24094-6-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [XEN v4 05/11] xen/arm: Introduce a wrapper for
 dt_device_get_address() to handle paddr_t
In-Reply-To: <20230321140357.24094-6-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 21/03/2023 14:03, Ayan Kumar Halder wrote:
> dt_device_get_address() can accept uint64_t only for address and size.
> However, the address/size denotes physical addresses. Thus, they should
> be represented by 'paddr_t'.
> Consequently, we introduce a wrapper for dt_device_get_address() ie
> dt_device_get_paddr() which accepts address/size as paddr_t and inturn
> invokes dt_device_get_address() after converting address/size to
> uint64_t.
> 
> The reason for introducing doing this is that in future 'paddr_t' may
> be defined as uint32_t.

Technically, you will define it as 'unsigned long' after. To avoid 
relying on how paddr_t is defined, I would suggest ot write "'paddr_t' 
may not always be 64-bit" or similar.

> diff --git a/xen/arch/arm/platforms/brcm-raspberry-pi.c b/xen/arch/arm/platforms/brcm-raspberry-pi.c
> index 811b40b1a6..407ec07f63 100644
> --- a/xen/arch/arm/platforms/brcm-raspberry-pi.c
> +++ b/xen/arch/arm/platforms/brcm-raspberry-pi.c
> @@ -64,7 +64,7 @@ static void __iomem *rpi4_map_watchdog(void)
>       if ( !node )
>           return NULL;
>   
> -    ret = dt_device_get_address(node, 0, &start, &len);
> +    ret = dt_device_get_paddr(node, 0, &start, &len);
>       if ( ret )
>       {
>           printk("Cannot read watchdog register address\n");
> diff --git a/xen/arch/arm/platforms/brcm.c b/xen/arch/arm/platforms/brcm.c
> index d481b2c60f..4310feee73 100644
> --- a/xen/arch/arm/platforms/brcm.c
> +++ b/xen/arch/arm/platforms/brcm.c
> @@ -40,7 +40,7 @@ static __init int brcm_get_dt_node(char *compat_str,
>                                      u32 *reg_base)
>   {
>       const struct dt_device_node *node;
> -    u64 reg_base_64;
> +    paddr_t reg_base_64;

'64' reads a bit odd now. I think you want to rename to reg_base_paddr.

Cheers,

-- 
Julien Grall

